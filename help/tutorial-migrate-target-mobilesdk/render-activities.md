---
title: Target を at.js 2.x から Web SDK に移行する
description: at.js 2.x からAdobe Experience Platform Web SDK にAdobe Target実装を移行する方法を説明します。 トピックには、ライブラリの概要、実装の違い、その他の注目すべきコールアウトが含まれます。
source-git-commit: 009548969b88d1bfa6eac23f65b1ca2144f27c34
workflow-type: tm+mt
source-wordcount: '404'
ht-degree: 1%

---

# フォームベースのコンポーザーを使用する Target アクティビティのレンダリング

一部の Target 実装では、地域の mbox （現在は「範囲」）を使用して、フォームベースの Experience Composer を使用するアクティビティからコンテンツを配信する場合があります。 at.js Target 実装で mbox を使用する場合は、次の操作を行う必要があります。

* at.js 実装からの参照で、`getOffer()` または `getOffers()` を同等の Platform Web SDK メソッドに使用するもの更新します。
* インプレッションがカウントされるように、`propositionDisplay` イベントをトリガーにするコードを追加します。

## オンデマンドでのコンテンツのリクエストと適用

Target のフォームベースのコンポーザーを使用して作成され、地域の mbox に配信されたアクティビティは、Platform Web SDK では自動的にレンダリングできません。 at.js と同様に、特定の Target の場所に配信されるオファーは、オンデマンドでレンダリングする必要があります。


+++`getOffer()` と `applyOffer()` を使用した at.js の例：

1. `getOffer()` を実行して、場所のオファーをリクエストします
1. `applyOffer()` を実行して、指定したセレクターにオファーをレンダリングします
1. アクティビティのインプレッションは、リク `getOffer()` ストの時点で自動的に増加します

```JavaScript
// Retrieve an offer for the homepage-hero location
adobe.target.getOffer({
  "mbox": "homepage_hero",

  // Render offer to the #hero-banner selector
  "success": function(offers) {
    adobe.target.applyOffer({
      "mbox": "homepage_hero",
      "selector": "#hero-banner",
      "offer": offers
    });
  },
  "error": {
    console.log(error);
  },
  "timeout": 3000
});
```

+++

+++`applyPropositions` コマンドを使用した Platform Web SDK と同等のもの：

1. コマンド `sendEvent` 実行して、1 つ以上の場所（スコープ）のオファー（提案）をリクエストします
1. 各範囲 `applyPropositions` ページにコンテンツを適用する方法を指定するメタデータオブジェクトを使用してコマンドを実行します
1. `decisioning.propositionDisplay``sendEvent`eventType を指定してコマンドを実行し、インプレッションを追跡します

```JavaScript
// Retrieve propositions for homepage_hero location (scope)
alloy("sendEvent", {
  "decisionScopes": ["homepage_hero"]
}).then(function(result) {
  var retrievedPropositions = result.propositions;
    
  // Render offer (proposition) to the #hero-banner selector by supplying extra metadata
  return alloy("applyPropositions", {
    "propositions": retrievedPropositions,
    "metadata": {
      // Specify each regional mbox or scope name along with a selector and actionType
      "homepage_hero": {
        "selector": "#hero-banner",
        "actionType": "setHtml"
      }
    }
  }).then(function(applyPropositionsResult) {
    var renderedPropositions = applyPropositionsResult.propositions;

    // Send the display notifications via sendEvent command
    alloy("sendEvent", {
      "xdm": {
        "eventType": "decisioning.propositionDisplay",
        "_experience": {
          "decisioning": {
            "propositions": renderedPropositions
          }
        }
      }
    });
  });
});
```

+++

Platform Web SDK は、`applyPropositions` コマンドで `actionType` を指定することで、フォームベースのアクティビティをページに適用する際の制御を強化しています。

| `actionType` | 説明 | at.js `applyOffer()` | Platform Web SDK `applyPropositions` |
| --- | --- | --- | --- |
| `setHtml` | コンテナの内容をクリアして、そのコンテナにオファーを追加します | はい（常に使用） | ○ |
| `replaceHtml` | コンテナを削除してオファーに置き換えます | × | ○ |
| `appendHtml` | 指定されたセレクターの後にオファーを追加します | × | ○ |

追加のレンダリングオプションと例については、Platform Web SDK を使用したコンテンツのレンダリングに関する [ 専用のドキュメント ](https://experienceleague.adobe.com/docs/experience-platform/edge/personalization/rendering-personalization-content.html) を参照してください。

## 実装の例

次のページ例は、前の節で説明した実装に基づいて構築されており、`sendEvent` コマンドにスコープを追加するだけです。

+++複数の範囲を持つ Platform Web SDK の例

```HTML
<!doctype html>
<html>
<head>
  <title>Example page</title>
  <!--Data Layer to enable rich data collection and targeting-->
  <script>
    var digitalData = { 
      // Data layer information goes here
    };
  </script>

  <!--Third party libraries that may be used by Target offers and modifications-->
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>

  <!--Prehiding snippet for Target with asynchronous deployment-->
  <script>
    !function(e,a,n,t){var i=e.head;if(i){
    if (a) return;
    var o=e.createElement("style");
    o.id="alloy-prehiding",o.innerText=n,i.appendChild(o),setTimeout(function(){o.parentNode&&o.parentNode.removeChild(o)},t)}}
    (document, document.location.href.indexOf("mboxEdit") !== -1, ".body { opacity: 0 !important }", 3000);
  </script>

  <!--Platform Web SDK base code-->
  <script>
    !function(n,o){o.forEach(function(o){n[o]||((n.__alloyNS=n.__alloyNS||
    []).push(o),n[o]=function(){var u=arguments;return new Promise(
    function(i,l){n[o].q.push([i,l,u])})},n[o].q=[])})}
    (window,["alloy"]);
  </script>

  <!--Platform Web SDK loaded asynchonously. Change the src to use the latest supported version.-->
  <script src="https://cdn1.adoberesources.net/alloy/2.6.4/alloy.min.js" async></script>
  
  <!--Configure Platform Web SDK then send event-->
  <script>
    alloy("configure", {
      "edgeConfigId": "ebebf826-a01f-4458-8cec-ef61de241c93",
      "orgId":"ADB3LETTERSANDNUMBERS@AdobeOrg"
    });
    alloy("sendEvent", {
      // Request and render VEC-based activities
      "renderDecisions": true,
      // Request content for form-based activities using the "homepage_hero" scope
      "decisionScopes": ["homepage_hero"]
    }).then(function(result) {
      var retrievedPropositions = result.propositions;
        
      // Render offer (proposition) to the #hero-banner selector by supplying extra metadata
      return alloy("applyPropositions", {
        "propositions": retrievedPropositions,
        "metadata": {
          // Specify each regional mbox or scope name along with a selector and actionType
          "homepage_hero": {
            "selector": "#hero-banner",
            "actionType": "setHtml"
          }
        }
      }).then(function(applyPropositionsResult) {
        var renderedPropositions = applyPropositionsResult.propositions;

        // Send the display notifications via sendEvent command
        alloy("sendEvent", {
          "xdm": {
            "eventType": "decisioning.propositionDisplay",
            "_experience": {
              "decisioning": {
                "propositions": renderedPropositions
              }
            }
          }
        });
      });
    });
  </script>
</head>
<body>
  <h1 id="title">Home Page</h1><br><br>
  <p id="bodyText">Navigation</p><br><br>
  <a id="home" class="navigationLink" href="#">Home</a><br>
  <a id="pageA" class="navigationLink" href="#">Page A</a><br>
  <a id="pageB" class="navigationLink" href="#">Page B</a><br>
  <a id="pageC" class="navigationLink" href="#">Page C</a><br>
  <div id="homepage-hero">Homepage Hero Banner Content</div>
</body>
</html>
```

次に、[Platform Web SDK を使用して Target パラメーターを渡す ](send-parameters.md) 方法について説明します。

>[!NOTE]
>
>アドビは、Target 拡張機能から Optimize 拡張機能へのモバイルターゲットの移行を成功させるために取り組んでいます。 移行の際に問題が発生した場合、またはこのガイドに重要な情報が欠落していると感じる場合は、[ このコミュニティのディスカッション ](https://experienceleaguecommunities.adobe.com/t5/adobe-experience-platform-data/tutorial-discussion-migrate-target-from-at-js-to-web-sdk/m-p/575587#M463) に投稿してお知らせください。
