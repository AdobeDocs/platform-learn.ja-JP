---
title: Render VEC アクティビティ - Target を at.js 2.x から Web SDK に移行します
description: Adobe Targetの Web SDK 実装を使用して visual experience composer アクティビティを取得および適用する方法について説明します。
exl-id: bbbbfada-e236-44de-a7bf-5c63ff840db4
source-git-commit: d4308b68d6974fe47eca668dd16555d15a8247c9
workflow-type: tm+mt
source-wordcount: '767'
ht-degree: 0%

---

# Adobe Target Visual Experience Composer （VEC）アクティビティのレンダリング

Target アクティビティは、Visual Experience Composer （VEC）またはフォームベースのコンポーザーを使用して設定します。 Platform Web SDK では、at.js と同様に、VEC ベースのアクティビティを取得してページに適用できます。 移行のこの部分では、次の操作を行います。

* Visual Editing Helper ブラウザー拡張機能のインストール
* Platform Web SDK を使用して `sendEvent` 呼び出しを実行し、アクティビティをリクエストします。
* Target `pageLoad` リクエストの実行に `getOffers()` を使用する、at.js 実装からの参照を更新します。

## Visual Editing Helper ブラウザー拡張機能

Google ChromeのAdobe Experience Cloud Visual Editing Helper ブラウザー拡張機能を使用すると、Adobe Target Visual Experience Composer （VEC）内に web サイトを確実に読み込んで、web エクスペリエンスを迅速に作成および QA できます。

Visual Editing Helper のブラウザー拡張機能は、at.js または Platform Web SDK を使用する web サイトで機能します。

### Visual Editing Helper の取得とインストール

1. [Chrome Web ストアのAdobe Experience Cloud Visual Editing Helper ブラウザー拡張機能 ](https://chrome.google.com/webstore/detail/adobe-experience-cloud-vi/kgmjjkfjacffaebgpkpcllakjifppnca) に移動します。
1. **Chromeに追加** / **拡張機能を追加** をクリックします。
1. Target で VEC を開きます。
1. この拡張機能を使用するには、VEC または QA モードで、Chrome ブラウザーのツールバーにある「Visual Editing Helper」ブラウザー拡張機能アイコン ![Visual Editing 拡張機能アイコン ](assets/VEC-Helper.png){zoomable="yes"}Visual Editing 拡張機能アイコン）をクリックします。

Target VEC で web サイトを開くと、Visual Editing Helper が自動的に有効になり、オーサリング機能が強化されます。 この拡張機能には、条件付き設定はありません。 この拡張機能では、SameSite Cookie の設定を含むすべての設定を自動的に処理します。

[Visual Editing Helper 拡張機能の詳細 ](https://experienceleague.adobe.com/docs/target/using/experiences/vec/troubleshoot-composer/visual-editing-helper-extension.html) および [Visual Experience Composer のトラブルシューティング ](https://experienceleague.adobe.com/docs/target/using/experiences/vec/troubleshoot-composer/troubleshoot-composer.html) については、専用のドキュメントを参照してください。

>[!IMPORTANT]
>
>新しい [Visual Editing Helper 拡張機能 ](https://chrome.google.com/webstore/detail/adobe-experience-cloud-vi/kgmjjkfjacffaebgpkpcllakjifppnca) は、以前の [Target VEC Helper ブラウザー拡張機能 ](https://experienceleague.adobe.com/docs/target/using/experiences/vec/troubleshoot-composer/vec-helper-browser-extension.html) に代わるものです。 古い VEC Helper 拡張機能がインストールされている場合は、Visual Editing Helper 拡張機能を使用する前に、その拡張機能を削除または無効にする必要があります。

## コンテンツのリクエストと自動適用

Platform Web SDK がページに設定されたら、Target からコンテンツをリクエストできます。 ライブラリの読み込み時にコンテンツを自動的にリクエストするように設定できる at.js とは異なり、Platform Web SDK ではコマンドを明示的に実行する必要があります。

at.js の実装で `pageLoadEnabled` 設定が `true` に設定され、VEC ベースのアクティビティの自動レンダリングが有効になっている場合は、Platform Web SDK で次の `sendEvent` コマンドを実行します。

>[!BEGINTABS]

>[!TAB JavaScript]

```Javascript
alloy("sendEvent", {
  "renderDecisions": true
});
```

>[!TAB タグ]

タグでは、「[!UICONTROL  ビジュアルパーソナライゼーションの決定をレンダリング ] オプションが選択された状態で [!UICONTROL  イベントを送信 ] アクションタイプを使用します。

![ タグで選択されたレンダリングとビジュアルパーソナライゼーションの決定を使用してイベントを送信 ](assets/vec-sendEvent-renderTrue.png){zoomable="yes"}

>[!ENDTABS]

<!--
When the Platform Web SDK renders an activity to the page with `renderDecisions` set to `true`, an additional notification call fires automatically to increment an impression and attribute the visitor to the activity. This call uses an event type with the value `decisioning.propositionDisplay`.

![Platform Web SDK call incrementing a Target impression](assets/target-impression-call.png){zoomable="yes"}
-->

## オンデマンドでのコンテンツのリクエストと適用

一部の Target 実装では、VEC オファーをページに適用する前に、いくつかのカスタム処理を行う必要があります。 または、1 回の呼び出しで複数の場所をリクエストします。 at.js の実装では、`pageLoadEnabled` を `false` に設定し、`getOffers()` 関数を使用して `pageLoad` リクエストを実行することで、これを行うことができます。

+++ `getOffers()` と `applyOffers()` を使用した at.js の例により、VEC ベースのアクティビティを手動でレンダリングする

```JavaScript
adobe.target.getOffers({
  request: {
    execute: {
      pageLoad: {}
    }
  }
}).
then(response => adobe.target.applyOffers({ response: response }));
```

+++

Platform Web SDK には、特定の `pageLoad` イベントがありません。 Target コンテンツのすべてのリクエストは、`sendEvent` コマンドの `decisionScopes` オプションを使用して制御されます。 `__view__` の範囲は、`pageLoad` リクエストの目的を果たします。

+++ 同等の Platform Web SDK `sendEvent` アプローチ：

1. `__view__` の決定範囲を含む `sendEvent` コマンドを実行します
1. 返されたコンテンツを `applyPropositions` コマンドでページに適用します
1. `decisioning.propositionDisplay` のイベントタイプと提案の詳細を指定して `sendEvent` コマンドを実行し、インプレッションを増分します

```Javascript
alloy("sendEvent", {
  // Request the special "__view__" scope for target-global-mbox / pageLoad
  decisionScopes: ["__view__"]
}).then(function(result) {
  // Check if content (propositions) were returned
  if (result.propositions) {
    var retrievedPropositions = result.propositions;
    // Apply propositions to the page
    return alloy("applyPropositions", {
      propositions: retrievedPropositions
    }).then(function(applyPropositionsResult) {
      var renderedPropositions = applyPropositionsResult.propositions;
      // Send a display notification with the sendEvent command
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
  }
});
```

+++

>[!NOTE]
>
>Visual Experience Composer で行われた [ 手動での変更のレンダリング ](https://experienceleague.adobe.com/docs/experience-platform/edge/personalization/rendering-personalization-content.html#manually-rendering-content) を可能にします。 VEC ベースの変更を手動でレンダリングすることは一般的ではありません。 at.js の実装で `getOffers()` 関数を使用して Target `pageLoad` リクエストを手動で実行し、`applyOffers()` を使用してコンテンツをページに適用していないかどうかを確認します。

Platform Web SDK は、開発者に対して、コンテンツのリクエストとレンダリングに非常に柔軟に対応します。 その他のオプションと詳細については、[ パーソナライズされたコンテンツのレンダリングに関する専用ドキュメント ](https://experienceleague.adobe.com/docs/experience-platform/edge/personalization/rendering-personalization-content.html) を参照してください。

## 実装の例

これで、基本的な Platform Web SDK の実装が完了しました。

>[!BEGINTABS]

>[!TAB JavaScript]

自動ターゲットコンテンツレンダリングを使用したJavaScriptの例：

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

  <!--Prehiding snippet for Target with asynchronous Web SDK deployment-->
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
    
    // Send an event to the Adobe edge network and render Target content automatically 
    alloy("sendEvent", {
      "renderDecisions": true
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


>[!TAB タグ]

自動ターゲットコンテンツレンダリングを使用したタグのサンプルページ：


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

  <!--Prehiding snippet for Target with asynchronous Web SDK deployment-->
  <script>
    !function(e,a,n,t){var i=e.head;if(i){
    if (a) return;
    var o=e.createElement("style");
    o.id="alloy-prehiding",o.innerText=n,i.appendChild(o),setTimeout(function(){o.parentNode&&o.parentNode.removeChild(o)},t)}}
    (document, document.location.href.indexOf("mboxEdit") !== -1, ".body { opacity: 0 !important }", 3000);
  </script>

    <!--Tags Header Embed Code: REPLACE WITH THE INSTALL CODE FROM YOUR OWN ENVIRONMENT-->
    <script src="//assets.adobedtm.com/launch-EN93497c30fdf0424eb678d5f4ffac66dc.min.js" async></script>
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

タグにAdobe Experience Platform Web SDK 拡張機能を追加します。

![Adobe Experience Platform Web SDK 拡張機能の追加 ](assets/library-tags-addExtension.png){zoomable="yes"}

必要な設定を追加します。
![Web SDK タグ拡張機能の移行オプションの設定 ](assets/tags-config-migration.png){zoomable="yes"}

[!UICONTROL  イベントを送信 ] アクションと [!UICONTROL  ビジュアルパーソナライゼーションの決定をレンダリング ] を選択したルールを作成：
![ タグでレンダーパーソナライゼーションを選択してイベントを送信 ](assets/vec-sendEvent-renderTrue.png){zoomable="yes"}

>[!ENDTABS]

次に、をリクエストし、[ フォームベースの Target アクティビティをレンダリング ](render-form-based-activities.md) する方法を説明します。

>[!NOTE]
>
>アドビは、at.js から Web SDK への Target の移行を成功させるために取り組んでいます。 移行の際に問題が発生した場合、またはこのガイドに重要な情報が欠落していると感じる場合は、[ このコミュニティのディスカッション ](https://experienceleaguecommunities.adobe.com/t5/adobe-experience-platform-data/tutorial-discussion-migrate-target-from-at-js-to-web-sdk/m-p/575587#M463) に投稿してお知らせください。
