---
title: SDK の置き換え – Adobe TargetからAdobe Journey Optimizer - Decisioning モバイル拡張機能への移行
description: Adobe TargetからAdobe Journey Optimizer - Decisioning モバイル拡張機能に移行する際に SDK を置き換える方法を説明します。
source-git-commit: afbc8248ad81a5d9080a4fdba1167e09bbf3b33d
workflow-type: tm+mt
source-wordcount: '1558'
ht-degree: 3%

---

# Target SDK を Optimize SDK に置き換える

ページ上のAdobe Target実装を置き換えて、at.js から Platform Web SDK に移行する方法を説明します。 基本的な置き換えは、次の手順で構成されます。

* Target 管理設定を確認し、IMS 組織 ID をメモします
* at.js ライブラリを Platform Web SDK に置換します
* 同期ライブラリ実装の事前非表示スニペットの更新
* Platform Web SDK の設定

>[!NOTE]
>
>ここに示す例は例として示したものであり、実際の Target の実装は状況によって異なります。 既存の Target 実装でAdobeの Data Collection Tag Manager を使用している場合、詳しくは [Platform Web SDK Target 実装のチュートリアル ](https://experienceleague.adobe.com/docs/platform-learn/implement-web-sdk/applications-setup/setup-target.html) も参照してください。


## Target 管理設定の確認

Target を Platform Web SDK に移行する最初の手順は、Target インターフェイスの **[!UICONTROL 管理]** セクションで設定を確認することです。

### [!UICONTROL 実装]

#### [!UICONTROL アカウントの詳細]

* **[!UICONTROL IMS 組織 ID]** – この値は、Platform Web SDK の設定に必要なため、メモしておきます。
* **[!UICONTROL オンデバイス判定]** – この機能は Platform Web SDK ではサポートされていません。 この設定は移行後に無効にすることができます。また、web サイトで at.js を使用しなくなった場合や、オンデバイス判定のサーバーサイドのユースケースがある場合にも無効になります。

#### [!UICONTROL 実装方法]

**[!UICONTROL 実装方法]** セクションの編集可能な設定はすべて、at.js にのみ適用されます。 これらの設定は、実装用にカスタマイズされた at.js ライブラリの生成に使用されます。 これらの設定を確認して、カスタムコードがあるかどうか、またはクロスドメインのユースケースでファーストパーティとサードパーティの Cookie を設定しているかどうかを確認します。

**[!UICONTROL プロファイルの有効期間]** の設定は、Adobeカスタマーケアのみが変更できます。 Target 訪問者プロファイルの有効期間は、実装アプローチの影響を受けません。 at.js と Platform Web SDK はどちらも、同じ訪問者プロファイルの有効期間を使用します。

#### [!UICONTROL プライバシー]

* **[!UICONTROL 訪問者 IP アドレスを不明化]** – この設定は、ジオターゲティング機能に影響を与えます。 at.js と Platform Web SDK はどちらも、ジオターゲティングの目的で同じバックエンド IP 不明化設定を使用します。

### [!UICONTROL 環境]

Platform Web SDK は、開発、ステージング、実稼動の各データストリーム用に [!UICONTROL  環境 ID] を明示的に定義できるデータストリーム設定を使用します。 この設定の主なユースケースは、環境を簡単に区別するために URL が存在しないモバイルアプリ実装の場合です。 この設定はオプションですが、すべてのリクエストが指定した環境に適切に関連付けられていることを確認するために使用できます。 これは、ドメインとホストグループルールに基づいて Target 環境を割り当てる必要がある at.js の実装とは異なります。

>[!NOTE]
>
>データストリーム設定で環境 ID が指定されていない場合、Target は、「**Hosts**」セクションで指定されているドメインと環境のマッピングを使用します。

詳しくは、[ データストリーム設定 ](https://experienceleague.adobe.com/docs/experience-platform/edge/datastreams/configure.html#target) ガイドおよび Target [ ホスト ](https://experienceleague.adobe.com/docs/target/using/administer/hosts.html?lang=ja) ドキュメントを参照してください。

## Platform Web SDK のデプロイ

Target の機能は、at.js と Platform Web SDK の両方で提供されます。 両方のライブラリを同時に使用すると、レンダリングとトラッキングの問題が発生する可能性があります。 Platform Web SDK に正常に移行するには、最初の手順として at.js を削除し、Platform Web SDK （alloy.js）に置き換えます。

at.js を使用した単純な Target 実装を想定すると、

* ページ上部付近のデータレイヤーは、Target やその他のアプリケーションの情報を提供します
* Target アクティビティ（例：jQuery）で機能を使用できる 1 つ以上のサードパーティヘルパーライブラリ
* ちらつきを軽減するための事前非表示スニペット
* Target at.js ライブラリは、デフォルト設定と非同期で読み込まれ、アクティビティを自動的にリクエストおよびレンダリングします。

HTMLページでの+++at.js の実装例

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
  <!--prehiding snippet for Target with asynchronous deployment-->
  <script>
    ;(function(win, doc, style, timeout) {
      var STYLE_ID = 'at-body-style';

      function getParent() {
        return doc.getElementsByTagName('head')[0];
      }

      function addStyle(parent, id, def) {
        if (!parent) {
          return;
        }
        var style = doc.createElement('style');
        style.id = id;
        style.innerHTML = def;
        parent.appendChild(style);
      }

      function removeStyle(parent, id) {
        if (!parent) {
          return;
        }
        var style = doc.getElementById(id);
        if (!style) {
          return;
        }
        parent.removeChild(style);
      }
      addStyle(getParent(), STYLE_ID, style);
      setTimeout(function() {
        removeStyle(getParent(), STYLE_ID);
      }, timeout);
    }(window, document, "body {opacity: 0 !important}", 3000));
  </script>
  <!--Target at.js library loaded asynchonously-->
  <script src="/libraries/at.js" async></script>
</head>
<body>
  <h1 id="title">Home Page</h1><br><br>
  <p id="bodyText">Navigation</p><br><br>
  <a id="home" class="navigationLink" href="#">Home</a><br>
  <a id="pageA" class="navigationLink" href="#">Page A</a><br>
  <a id="pageB" class="navigationLink" href="#">Page B</a><br>
  <a id="pageC" class="navigationLink" href="#">Page C</a><br>
  <div>Homepage Hero Banner Content</div>
</body>
</html>
```

+++

Platform Web SDK を使用するように Target をアップグレードするには、まず at.js を削除します。

```HTML
<!--Target at.js library loaded asynchonously-->
<script src="/libraries/at.js" async></script>
```

を Alloy JavsScript ライブラリまたはタグ埋め込みコードとAdobe Experience Platform Web SDK 拡張機能のいずれかに置き換えます。

>[!BEGINTABS]

>[!TAB JavaScript]

```HTML
<!--Platform Web SDK base code-->
<script>
  !function(n,o){o.forEach(function(o){n[o]||((n.__alloyNS=n.__alloyNS||
  []).push(o),n[o]=function(){var u=arguments;return new Promise(
  function(i,l){n[o].q.push([i,l,u])})},n[o].q=[])})}
  (window,["alloy"]);
</script>
<!--Platform Web SDK loaded asynchonously. Change the src to use the latest supported version.-->
<script src="https://cdn1.adoberesources.net/alloy/2.13.1/alloy.min.js" async></script>
```

>[!TAB タグ]

```HTML
<!--Tags Header Embed Code: REPLACE WITH THE INSTALL CODE FROM YOUR OWN ENVIRONMENT-->
<script src="//assets.adobedtm.com/launch-EN93497c30fdf0424eb678d5f4ffac66dc.min.js" async></script>
```

タグプロパティに、Adobe Experience Platform Web SDK 拡張機能を追加します。

<!--![Add the Adobe Experience Platform Web SDK extension](assets/library-tags-addExtension.png){zoomable="yes"}-->


>[!ENDTABS]

事前ビルドスタンドアロンバージョンでは、alloy というグローバル関数を作成するページに直接追加された「ベースコード」が必要です。 この関数を使用して SDK を操作します。グローバル関数に別の名前を付ける場合は、`alloy` の名前を変更します。

詳細とデプロイメントオプションについては、[Platform Web SDK のインストール ](https://experienceleague.adobe.com/docs/experience-platform/edge/fundamentals/installing-the-sdk.html?lang=ja) ドキュメントを参照してください。


## コンテンツを事前非表示にするアプローチを更新

Platform Web SDK の実装では、ライブラリが非同期で読み込まれるか同期で読み込まれるかに応じて、事前非表示のスニペットが必要になる場合があります。

### 非同期実装

at.js と同様に、Platform Web SDK ライブラリが非同期で読み込まれる場合、Target がコンテンツの入れ替えを実行する前にページのレンダリングが終了する可能性があります。 この動作により、Target で指定し、パーソナライズされたコンテンツに置き換えられる前に、デフォルトのコンテンツが短時間表示される、「ちらつき」と呼ばれる現象が発生する可能性があります。 Adobeこのちらつきを回避するには、非同期の Platform Web SDK スクリプト参照またはタグ埋め込みコードの直前に、特別な事前非表示スニペットを追加することをお勧めします。

実装が上記の例のように非同期の場合は、at.js の事前非表示スニペットを次のバージョンに置き換えて、Platform Web SDK と互換性を持たせます。

```HTML
<!--Prehiding snippet for Target with asynchronous Web SDK deployment-->
<script>
  !function(e,a,n,t){var i=e.head;if(i){
  if (a) return;
  var o=e.createElement("style");
  o.id="alloy-prehiding",o.innerText=n,i.appendChild(o),setTimeout(function(){o.parentNode&&o.parentNode.removeChild(o)},t)}}
  (document, document.location.href.indexOf("mboxEdit") !== -1, "body { opacity: 0 !important }", 3000);
</script>
```

事前非表示のスニペットにより、選択した CSS 定義を使用してページの先頭にスタイルタグが作成されます。 Target からの応答を受け取ったり、タイムアウトに達したりすると、このスタイルタグは削除されます。

事前非表示の動作は、スニペットの最後にある 2 つの設定によって制御されます。

* Target`body { opacity: 0 !important }` 読み込まれるまで事前非表示にするのに使用する CSS 定義を指定します。 デフォルトでは、ページ全体が非表示になります。 この定義を、事前に非表示にするセレクターと、非表示にする方法に更新できます。 この値は事前非表示のスタイルタグに挿入されるだけなので、複数の定義を含めることができます。 ナビゲーションの下のコンテンツをラップする、識別しやすいコンテナ要素がある場合、この設定を使用して、事前非表示をそのコンテナ要素に制限できます。

* `3000` は、事前非表示のタイムアウトをミリ秒単位で指定します。 タイムアウトの前に Target からの応答を受け取っていない場合、事前非表示のスタイルタグは削除されます。 このタイムアウトに達することはまれです。

>[!IMPORTANT]
>
>`alloy-prehiding` の異なるスタイル ID を使用するので、Platform Web SDK には正しいスニペットを使用してください。 at.js の事前非表示スニペットを使用すると、正しく動作しない可能性があります。

### 同期実装

Adobeでは、ページ全体のパフォーマンスを最大限に高めるには、Platform Web SDK を非同期で実装することをお勧めします。 ただし、alloy.js ライブラリまたはタグ埋め込みコードが同期的に読み込まれる場合、事前非表示のスニペットは必要ありません。 代わりに、Platform Web SDK 設定で事前非表示スタイルが指定されます。

同期実装の事前非表示スタイルは、[`prehidingStyle`](https://experienceleague.adobe.com/docs/experience-platform/edge/fundamentals/configuring-the-sdk.html#prehidingStyle) オプションを使用して設定できます。 Platform Web SDK の設定については、次の節で説明します。

Platform Web SDK によるちらつきの管理方法について詳しくは、ガイドの節 [ パーソナライズされたエクスペリエンスのためのちらつきの管理 ](https://experienceleague.adobe.com/docs/experience-platform/edge/personalization/manage-flicker.html) を参照してください。

## Platform Web SDK の設定

Platform Web SDK は、ページが読み込まれるたびに設定する必要があります。 次の例では、サイト全体が 1 つのデプロイメントで Platform Web SDK にアップグレードされていることを前提としています。

>[!BEGINTABS]

>[!TAB JavaScript]

`configure` コマンドは、常に呼び出される最初の SDK コマンドである必要があります。 `edgeConfigId` は [!UICONTROL  データストリーム ID] です。

```JavaScript
alloy("configure", {
  "edgeConfigId": "ebebf826-a01f-4458-8cec-ef61de241c93",
  "orgId":"ADB3LETTERSANDNUMBERS@AdobeOrg"
});
```

>[!TAB タグ]

タグ実装では、多くのフィールドが自動入力されるか、ドロップダウンメニューから選択できます。 環境ごとに異なる Platform[!UICONTROL  サンドボックス ] および [!UICONTROL  データストリーム ] を選択できます。 データストリームは、公開プロセスのタグライブラリの状態に基づいて変更されます。

<!--![configuring the Web SDK tag extension](assets/tags-config.png){zoomable="yes"}-->
>[!ENDTABS]

at.js から Platform Web SDK にページごとに移行する場合は、次の設定オプションが必要です。


>[!BEGINTABS]

>[!TAB JavaScript]

```JavaScript
alloy("configure", {
  "edgeConfigId": "ebebf826-a01f-4458-8cec-ef61de241c93",
  "orgId":"ADB3LETTERSANDNUMBERS@AdobeOrg",
  "targetMigrationEnabled":true,
  "idMigrationEnabled":true
});
```

>[!TAB タグ]

<!--![configuring the Web SDK tag extension migration options](assets/tags-config-migration.png){zoomable="yes"}-->

>[!ENDTABS]

Target に関連する注目すべき設定オプションの概要を次に示します。

| オプション | 説明 | 値の例 |
| --- | --- | --- |
| `edgeConfigId` | データストリーム ID | `ebebf826-a01f-4458-8cec-ef61de241c93` |
| `orgId` | Adobe Experience Cloud組織 ID | `ADB3LETTERSANDNUMBERS@AdobeOrg` |
| `targetMigrationEnabled` | このオプションを使用すると、Web SDK が at.js で使用されるレガシー mbox および mboxEdgeCluster Cookie の読み取りと書き込みをおこなえるようになります。 これにより、訪問者プロファイルを維持しながら、Web SDK を使用するページから at.js ライブラリを使用するページに移行できます。 | `true` |
| `idMigrationEnabled` | true の場合、SDK は古い AMCV Cookie を読み取って設定します。 このオプションは、サイトの一部が Visitor.js を引き続き使用する可能性がある場合に、Platform Web SDK を使用したへの移行に役立ちます。 | `true` |
| `thirdPartyCookiesEnabled` | アドビのサードパーティ Cookie の設定を有効にします。SDK は、訪問者 ID をサードパーティコンテキストに保持して、同じ訪問者 ID をサイト間で使用できるようにします。 複数のサイトがある場合は、このオプションを使用します。ただし、プライバシー上の理由から、このオプションが望ましくない場合があります。 | `true` |
| `prehidingStyle` | パーソナライズされたコンテンツをサーバーから読み込む際に、Web ページのコンテンツ領域を非表示にする CSS スタイル定義を作成するために使用します。これは、SDK の同期デプロイメントでのみ使用されます。 | `body { opacity: 0 !important }` |

オプションの完全なリストについては、[Platform Web SDK の設定 ](https://experienceleague.adobe.com/docs/experience-platform/edge/fundamentals/configuring-the-sdk.html) ガイドを参照してください。

## 実装の例

Platform Web SDK が適切に配置されると、サンプルページは次のようになります。

>[!BEGINTABS]

>[!TAB JavaScript]

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
  <script src="https://cdn1.adoberesources.net/alloy/2.13.1/alloy.min.js" async></script>
  
  <!--Configure Platform Web SDK-->
  <script>
    alloy("configure", {
      "edgeConfigId": "ebebf826-a01f-4458-8cec-ef61de241c93",
      "orgId":"ADB3LETTERSANDNUMBERS@AdobeOrg"
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

ページコード：

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

<!--![Add the Adobe Experience Platform Web SDK extension](assets/library-tags-addExtension.png){zoomable="yes"}-->

必要な設定を追加します。
<!--![configuring the Web SDK tag extension migration options](assets/tags-config-migration.png){zoomable="yes"}-->


>[!ENDTABS]



上記のように Platform Web SDK ライブラリを単に含めて設定するだけでは、Adobe Edge Network へのネットワーク呼び出しは実行されないことに注意する必要があります。

次に、ページに [ フォームベースのアクティビティをリクエストして適用する ](render-activities.md) 方法を説明します。

>[!NOTE]
>
>アドビは、Target 拡張機能から Decisioning 拡張機能への Mobile Target の移行を成功させるために取り組んでいます。 移行の際に問題が発生した場合、またはこのガイドに重要な情報が欠落していると感じる場合は、[ このコミュニティのディスカッション ](https://experienceleaguecommunities.adobe.com/t5/adobe-experience-platform-data/tutorial-discussion-migrate-target-from-at-js-to-web-sdk/m-p/575587#M463) に投稿してお知らせください。
