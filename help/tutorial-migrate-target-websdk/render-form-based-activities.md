---
title: at.js 2.x から Web SDK への Target の移行
description: Adobe Target実装を at.js 2.x からAdobe Experience Platform Web SDK に移行する方法について説明します。 トピックには、ライブラリの概要、実装の違い、その他の重要な注意事項が含まれます。
source-git-commit: 63edfc214c678a976fbec20e87e76d33180e61f1
workflow-type: tm+mt
source-wordcount: '411'
ht-degree: 2%

---

# フォームベースのコンポーザーを使用する Render Target アクティビティ

一部の Target 実装では、リージョナル mbox（現在は「スコープ」）を使用して、フォームベースの Experience Composer を使用するアクティビティからコンテンツを配信する場合があります。 at.js Target の実装で mbox を使用する場合は、次の手順を実行する必要があります。

* を使用する at.js 実装の参照を更新します。 `getOffer()` または `getOffers()` を同等の Platform Web SDK メソッドに追加します。
* トリガーa にコードを追加 `propositionDisplay` イベントを設定して、インプレッションをカウントします。

## コンテンツをオンデマンドでリクエストし適用

Target のフォームベースのコンポーザーを使用して作成され、リージョナル mbox に配信されたアクティビティは、Platform Web SDK では自動的にレンダリングできません。 at.js と同様、特定の Target の場所に配信されるオファーは、オンデマンドでレンダリングする必要があります。


+++at.js の使用例 `getOffer()` および `applyOffer()`:

1. 実行 `getOffer()` 場所を申し出る
1. 実行 `applyOffer()` 指定したセレクターにオファーをレンダリングするには
1. アクティビティのインプレッションは、 `getOffer()` リクエスト

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

+++ `applyPropositions` コマンド：

1. 実行 `sendEvent` 1 つ以上の場所（スコープ）のオファー（提案）を要求するコマンド
1. 実行 `applyPropositions` コマンドと、各スコープのページにコンテンツを適用する方法を示すメタデータオブジェクト
1. 実行 `sendEvent` コマンドと eventType `decisioning.propositionDisplay` 印象を追う

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

Platform Web SDK は、 `applyPropositions` 命令 `actionType` 指定：

| `actionType` | 説明 | at.js `applyOffer()` | Platform Web SDK `applyPropositions` |
| --- | --- | --- | --- |
| `setHtml` | コンテナのコンテンツをクリアしてから、コンテナにオファーを追加します | はい（常に使用） | ○ |
| `replaceHtml` | コンテナを削除し、オファーに置き換えます | × | ○ |
| `appendHtml` | 指定されたセレクターの後にオファーを追加します | × | ○ |

詳しくは、 [専用ドキュメント](https://experienceleague.adobe.com/docs/experience-platform/edge/personalization/rendering-personalization-content.html) レンダリングのその他のオプションおよび例については、Platform Web SDK を使用したコンテンツのレンダリングについてを参照してください。

## 実装例

以下の例では、前の節で説明した実装に基づいて構築されます。ただし、 `sendEvent` コマンドを使用します。

+++複数のスコープを持つ Platform Web SDK の例

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

次に、 [Platform Web SDK を使用して Target パラメーターを渡す](send-parameters.md).

>[!NOTE]
>
>at.js から Web SDK への Target の移行を成功に導くための支援に努めています。 移行時に障害が発生した場合や、このガイドに重要な情報が欠落していると思われる場合は、 [このコミュニティディスカッション](https://experienceleaguecommunities.adobe.com/t5/adobe-experience-platform-launch/tutorial-discussion-implement-adobe-experience-cloud-with-web/td-p/444996).