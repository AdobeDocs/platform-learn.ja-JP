---
title: VEC アクティビティのレンダリング | at.js 2.x から Web SDK への Target の移行
description: Adobe Targetの Web SDK 実装を使用して Visual Experience Composer アクティビティを取得し、適用する方法について説明します。
source-git-commit: ca2fade972a2f7f84134ee4ef9c0f24c5ab1c5c6
workflow-type: tm+mt
source-wordcount: '830'
ht-degree: 6%

---

# Adobe Target Visual Experience Composer(VEC) アクティビティのレンダリング

Target アクティビティは、Visual Experience Composer(VEC) またはフォームベースのコンポーザーを使用して設定されます。 Platform Web SDK は、at.js と同様に、VEC ベースのアクティビティを取得し、ページに適用できます。 移行のこの段階では、次の操作をおこないます。

* Visual Editing Helper ブラウザー拡張機能のインストール
* の実行 `sendEvent` Platform Web SDK でを呼び出して、アクティビティをリクエストします。
* を使用する at.js 実装の参照を更新します。 `getOffers()` ターゲットを実行するには `pageLoad` リクエスト。

## Visual Editing Helper ブラウザー拡張機能

Google Chrome 用Adobe Experience Cloud Visual Editing ヘルパーブラウザー拡張機能を使用すると、Adobe Target Visual Experience Composer(VEC) 内で確実に Web サイトを読み込み、Web エクスペリエンスを迅速に作成および QA できます。

Visual Editing Helper ブラウザー拡張機能は、at.js または Platform Web SDK を使用する Web サイトで機能します。

### Visual Editing Helper を取得してインストールする

1. 次に移動： [Chrome Web Store のAdobe Experience Cloud Visual Editing Helper ブラウザー拡張機能](https://chrome.google.com/webstore/detail/adobe-experience-cloud-vi/kgmjjkfjacffaebgpkpcllakjifppnca).
1. 追加先をクリックします。 **クロム** > **拡張機能を追加**.
1. Target で VEC を開きます。
1. 拡張機能を使用するには、「Visual Editing Helper」ブラウザー拡張機能アイコンをクリックします。 ![ビジュアル編集拡張機能アイコン](assets/VEC-Helper.png)VEC または QA モードで Chrome ブラウザーのツールバーで {zoomable=&quot;yes&quot;} をクリックします。

Target VEC で web サイトを開くと、Visual Editing Helper が自動的に有効になり、オーサリング機能が強化されます。この拡張機能には、条件付き設定はありません。この拡張機能では、SameSite Cookie の設定を含むすべての設定を自動的に処理します。

詳しくは、該当するドキュメントを参照してください [Visual Editing Helper 拡張機能](https://experienceleague.adobe.com/docs/target/using/experiences/vec/troubleshoot-composer/visual-editing-helper-extension.html) および [Visual Experience Composer のトラブルシューティング](https://experienceleague.adobe.com/docs/target/using/experiences/vec/troubleshoot-composer/troubleshoot-composer.html).

>[!IMPORTANT]
>
>新しい [Visual Editing Helper 拡張機能](https://chrome.google.com/webstore/detail/adobe-experience-cloud-vi/kgmjjkfjacffaebgpkpcllakjifppnca) 前の [Target VEC ヘルパーブラウザー拡張機能](https://experienceleague.adobe.com/docs/target/using/experiences/vec/troubleshoot-composer/vec-helper-browser-extension.html). 古い VEC ヘルパー拡張機能がインストールされている場合は、Visual Editing Helper 拡張機能を使用する前に、この拡張機能を削除または無効にする必要があります。

## コンテンツの自動リクエストと適用

ページで Platform Web SDK を設定したら、Target からコンテンツをリクエストできます。 ライブラリの読み込み時にコンテンツを自動的にリクエストするように設定できる at.js とは異なり、Platform Web SDK では、コマンドを明示的に実行する必要があります。

at.js 実装に `pageLoadEnabled` に設定 `true` これにより、VEC ベースのアクティビティの自動レンダリングが可能になり、次の操作が実行されます。 `sendEvent` コマンドを使用して、次の操作を行います。

>[!BEGINTABS]

>[!TAB JavaScript]

```Javascript
alloy("sendEvent", {
  "renderDecisions": true
});
```

>[!TAB タグ]

タグで、 [!UICONTROL イベントを送信] アクションタイプ [!UICONTROL 視覚的なパーソナライゼーションの決定をレンダリング] 選択したオプション：

![タグで選択されている Render visual personalization の決定を使用してイベントを送信します](assets/vec-sendEvent-renderTrue.png){zoomable=&quot;yes&quot;}

>[!ENDTABS]

<!--
When the Platform Web SDK renders an activity to the page with `renderDecisions` set to `true`, an additional notification call fires automatically to increment an impression and attribute the visitor to the activity. This call uses an event type with the value `decisioning.propositionDisplay`.

![Platform Web SDK call incrementing a Target impression](assets/target-impression-call.png){zoomable="yes"}
-->

## コンテンツをオンデマンドでリクエストし適用

一部の Target 実装では、VEC オファーをページに適用する前に、いくつかのカスタム処理が必要です。 または、1 回の呼び出しで複数の場所をリクエストします。 at.js 実装では、これは `pageLoadEnabled` から `false` と `getOffers()` 関数を使用して `pageLoad` リクエスト。

+++ at.js の使用例 `getOffers()` および `applyOffers()` VEC ベースのアクティビティを手動でレンダリングするには：

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

Platform Web SDK には、特定の `pageLoad` イベント。 Target コンテンツに対するすべてのリクエストは、 `decisionScopes` オプションを `sendEvent` コマンドを使用します。 この `__view__` ～の目的を果たす範囲 `pageLoad` リクエスト。

+++ 同等の Platform Web SDK `sendEvent` アプローチ：

1. の実行 `sendEvent` コマンド `__view__` 決定範囲
1. 返されたコンテンツを `applyPropositions` command
1. の実行 `sendEvent` コマンドを `decisioning.propositionDisplay` インプレッションを増分するためのイベントタイプと提案の詳細

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
>次のことが可能です。 [手動で変更をレンダリング](https://experienceleague.adobe.com/docs/experience-platform/edge/personalization/rendering-personalization-content.html#manually-rendering-content) Visual Experience Composer で作成されたもの。 VEC ベースの変更の手動レンダリングは、一般的ではありません。 at.js 実装が `getOffers()` Target を手動で実行する関数 `pageLoad` 使用せずにリクエスト `applyOffers()` をクリックして、コンテンツをページに適用します。

Platform Web SDK は、開発者に対して、コンテンツのリクエストとレンダリングの柔軟性を大幅に提供します。 詳しくは、 [パーソナライズされたコンテンツのレンダリングに関する専用ドキュメント](https://experienceleague.adobe.com/docs/experience-platform/edge/personalization/rendering-personalization-content.html) 」を参照してください。

## 実装例

これで、基本的な Platform Web SDK の実装が完了しました。

>[!BEGINTABS]

>[!TAB JavaScript]

Target コンテンツの自動レンダリングを使用する JavaScript の例：

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

Target コンテンツの自動レンダリングを含むタグの例ページ：


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

タグに、Adobe Experience Platform Web SDK 拡張機能を追加します。

![Adobe Experience Platform Web SDK 拡張機能の追加](assets/library-tags-addExtension.png){zoomable=&quot;yes&quot;}

目的の設定を追加します。
![Web SDK タグ拡張機能の移行オプションの設定](assets/tags-config-migration.png){zoomable=&quot;yes&quot;}

を含むルールの作成 [!UICONTROL イベントを送信] アクションと [!UICONTROL 視覚的なパーソナライゼーションの決定をレンダリング] 選択済み：
![タグで選択されている「パーソナライゼーションをレンダリング」を使用してイベントを送信します](assets/vec-sendEvent-renderTrue.png){zoomable=&quot;yes&quot;}

>[!ENDTABS]

次に、リクエスト方法とリクエスト方法について説明します。 [フォームベースの Target アクティビティをレンダリング](render-form-based-activities.md).

>[!NOTE]
>
>at.js から Web SDK への Target の移行を成功に導くための支援に努めています。 移行時に障害が発生した場合や、このガイドに重要な情報が欠落していると思われる場合は、 [このコミュニティディスカッション](https://experienceleaguecommunities.adobe.com/t5/adobe-experience-platform-data/tutorial-discussion-migrate-target-from-at-js-to-web-sdk/m-p/575587#M463).
