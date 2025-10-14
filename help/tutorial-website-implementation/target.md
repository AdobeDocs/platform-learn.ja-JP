---
title: タグ付きAdobe Targetの追加
description: at.js のタグ、ページ読み込みリクエスト、パラメーター、注文リクエスト、カスタムのヘッダー/フッターコードを使用してAdobe Targetを実装する方法について説明します。 このレッスンは、「Web サイトでの Experience Cloud の実装」チュートリアルの一部です。
solution: Data Collection, Target
exl-id: aa22e51a-67c2-4b54-b582-6f34f8c68aee
source-git-commit: d73f9b3eafb327783d6bfacaf4d57cf8881479f7
workflow-type: tm+mt
source-wordcount: '4252'
ht-degree: 69%

---

# Adobe Target の追加

このレッスンでは、ページ読み込みリクエストとカスタムパラメーターを使用して [Adobe Target 拡張機能](https://experienceleague.adobe.com/docs/experience-platform/tags/extensions/adobe/target/overview.html?lang=ja)を実装します。

[Adobe Target](https://experienceleague.adobe.com/docs/target/using/target-home.html?lang=ja) は、顧客のエクスペリエンスのカスタマイズやパーソナライズに必要なすべてのツールを提供する Adobe Experience Cloud ソリューションです。Web サイト、モバイルサイト、アプリケーション、ソーシャルメディアおよびその他のデジタルチャネルでの収益性を最大化することができます。

>[!NOTE]
>
>Adobe Experience Platform Launch は、データ収集テクノロジーのスイートとして Adobe Experience Platform に統合されています。 このコンテンツを使用する際に注意する必要があるインターフェイスで、いくつかの用語がロールアウトされました。
>
> * Platform Launch（クライアントサイド）は **[!DNL tags]** になりました
> * Platform Launch サーバーサイドが **[!DNL event forwarding]** になりました
> * Edgeの設定が **[!DNL datastreams]** になりました

## 学習内容

このレッスンを最後まで学習すると、以下の内容を習得できます。

* 非同期のタグ埋め込みコードで Target を使用する場合のフリッカーの管理に使用する、事前非表示スニペットを追加しました
* Target v2 拡張機能を追加する
* ページ読み込み要求（旧称「グローバル mbox」）を実行する
* ページ読み込み要求にパラメーターを追加する
* プロファイルおよびエンティティパラメーターをページ読み込み要求に追加する方法について説明する
* 必須のパラメーターで注文確認要求を実行する
* ライブラリヘッダーやライブラリのフッターコードなどの高度な設定を追加する方法について説明する
* Target 実装の検証

## 前提条件

この節のレッスンを完了するには、まず [&#x200B; タグを設定 &#x200B;](create-a-property.md) および [ID サービスを追加 &#x200B;](id-service.md) のレッスンを完了する必要があります。

## Target 非表示スニペットを追加します。

開始する前に、タグ埋め込みコードを少し更新する必要があります。 タグ埋め込みコードが非同期で読み込まれる場合、Target ライブラリが完全に読み込まれてコンテンツの入れ替えが実行される前に、ページのレンダリングが終了する場合があります。 これにより、Target で指定し、パーソナライズされたコンテンツに置き換えられる前に、デフォルトのコンテンツが短時間表示される、「ちらつき」と呼ばれる現象が発生することがあります。このちらつきを回避するには、タグの非同期埋め込みコードの直前に、特別な事前非表示のスニペットをハードコーディングすることを強くお勧めします。

これは既に Luma サイトでおこなわれていますが、実装を理解するために、サンプルページでおこないます。次のコード行をコピーします。

```html
<script>
   //prehiding snippet for Adobe Target with asynchronous tags deployment
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
```

サンプルページを開き、以下に示すように、タグ埋め込みコードの直前に貼り付けます（行番号が異なっても心配ありません）。 このスクリーンショットでは、事前非表示のスニペットは縮小されています。

![&#x200B; 拡張機能にポインタを合わせる &#x200B;](images/target-prehidingSnippet.png)

サンプルページを再度読み込みます。ページは、表示されるまでの 3 秒間、非表示になっています。この動作は一時的なもので、Target をデプロイすると消滅します。この事前非表示の動作は、スニペットの最後にある 2 つの設定で制御します。この設定は、カスタマイズすることもできますが、通常はデフォルト設定のまま残しておくのが最適です。

* `body {opacity: 0 !important}` で、 Target が読み込まれるまでの間に事前非表示に使用する CSS 定義を指定します。デフォルトでは、本文全体が非表示になっています。ナビゲーション配下のすべてのコンテンツをラップする、識別しやすいコンテナ要素を使用した一貫性のある DOM 構造があり、ナビゲーションのテストやパーソナライズを実行したくない場合は、この設定を使用して、そのコンテナ要素の事前非表示を制限できます。
* `3000` これは、事前非表示のタイムアウト設定を指定します。デフォルトでは、Target が 3 秒間で読み込まれない場合、ページが表示されます。これは極めてまれです。

詳細について、および非圧縮の事前非表示スニペットを入手するには、[非同期デプロイメントを使用した Adobe Target 拡張機能](https://experienceleague.adobe.com/docs/experience-platform/tags/extensions/adobe/target/overview.html?lang=ja#adobe-target-extension-with-an-asynchronous-deployment)を参照してください。

## Target 拡張機能の追加

Adobe Target 拡張機能は、Target の最新の Web 用 JavaScript SDK、at.js を使用してクライアントサイド実装をサポートします。Target の古いライブラリ mbox.js を引き続き使用しているお客様は、タグを使用するために [at.js 2.x にアップグレードする必要があります &#x200B;](https://experienceleague.adobe.com/docs/target/using/implement-target/client-side/mbox-implement/migrate-mbox/target-atjs-implementation.html?lang=ja)。

Target v2 拡張機能は、次の 2 つの主要部分で構成されます。

1. コアライブラリ設定を管理する拡張機能の設定
1. 次の操作を実行するルールアクション：
   1. Target の読み込み（at.js 2.x）
   1. パラメーターのページ読み込み要求への追加
   1. パラメーターのすべての要求への追加
   1. ページ読み込み要求の実行

この最初の演習では、拡張機能を追加し、設定を確認します。後の演習では、このアクションを使用します。

**拡張機能を追加するには、以下を実行します。**

1. **[!UICONTROL 拡張機能/カタログ]** に移動します。
1. Adobe Target の拡張機能をすばやく見つけるには、フィルターに `target` を入力します。Adobe Target と Adobe Target v2 の 2 つの拡張機能があります。このチュートリアルでは、従来の Web サイトとシングルページアプリケーション（SPA）の両方に最適な最新バージョンの at.js（現在は 2.x）を使用する拡張機能の v2 バージョンを使用します。
1. 「**[!UICONTROL インストール]**」をクリックします。

   ![Target v2 拡張機能のインストール](images/target-installExtension.png)

1. 拡張機能を追加すると、多くの at.js 設定が読み込まれますが、以下の図に示すように、すべての at.js 設定が Target インターフェイスから読み込まれる訳ではありません。読み込まれない設定の 1 つとして、タイムアウトがあります。これは常に、拡張機能を追加してから 3000 ミリ秒後となります。このチュートリアルでは、デフォルト設定をそのままにしておきます。左側には、現在のバージョンの拡張機能に付属している at.js バージョンが表示されます。

1. 「**[!UICONTROL ライブラリに保存]**」をクリックします

   ![拡張機能の保存](images/target-saveExtension.png)

この時点で Target はまだ何も実行していないので、検証するものは何もありません。

>[!NOTE]
>
>Target 拡張機能の各バージョンには、拡張機能の説明に記載されている特定のバージョンの at.js が付属しています。 Target 拡張機能を更新すれば、at.js バージョンが更新されます。

## Target の読み込みとページ読み込み要求の実行

コンテンツのテストとターゲティングをおこなう際、マーケターは Target を使用して、ページ上の訪問者エクスペリエンスを制御します。Target はページの最終的な表示において重要な役割を果たすので、ページの表示への影響を最小限に抑えるために、できるだけ早く読み込む必要があります。この節では、Target JavaScript ライブラリ（at.js）を読み込み、ページ読み込み要求（以前のバージョンの at.js では「グローバルmbox」と呼ばれます）を実行します。

[データ要素、ルールおよびライブラリの追加](add-data-elements-rules.md)のレッスンで作成した `All Pages - Library Loaded` ルールは、ページの読み込み時に可能な限り早くトリガーされているので、Target の実装に使用できます。

**ターゲットを読み込むには、以下を実行します。**

1. 左側のナビゲーションで **[!UICONTROL ルール]** に移動し、「`All Pages - Library Loaded`」をクリックしてルールエディターを開きます

   ![すべてのページを開く — ライブラリ読み込み済みルール](images/target-editRule.png)

1. 「アクション」の下の![プラスアイコン](images/icon-plus.png)をクリックして、新しいアクションを追加します。

   ![「+」アイコンをクリックし、新しいアクションを追加する](images/target-addLoadTargetAction.png)

1. **[!UICONTROL 拡張機能/Adobe Target v2]** を選択します。

1. **[!UICONTROL アクションタイプ/ターゲットを読み込み]** を選択します。

1. 「**[!UICONTROL 変更を保持]**」をクリックします

   ![変更を保存](images/target-addLoadTargetAction-keepChanges.png)をクリックします。

`Load Target`アクションが追加されると、at.js がページに読み込まれます。ただし、`Fire Page Load Request` アクションを追加するまで、Target 要求は実行されません。

**ページ読み込み要求の実行**

1. 「アクション」で、プラスアイコン ![プラスアイコンをクリック](images/icon-plus.png)をもう一度クリックし、別のアクションを追加します。

   ![別のアクションを追加するには、プラスアイコンをクリックする。](images/target-addGlobalMboxAction.png)

1. **[!UICONTROL 拡張機能/Adobe Target v2]** を選択します。

1. **[!UICONTROL アクションタイプ/ページ読み込みリクエストを実行]** を選択します。

1. ページを非表示にするかどうかに関するページ読み込み要求で利用できる設定や、事前非表示に使用する CSS セレクターがあります。これらの設定は、ページ上でハードコードされた事前非表示スニペットと組み合わせて使用します。デフォルト設定はそのままにしておきます。

1. 「**[!UICONTROL 変更を保持]**」をクリックします

   ![ページ読み込みリクエストアクションの実行](images/target-fireGlobalMbox.png)

1. `Load Target`アクションの後に新しいアクションが順に追加され、アクションがこの順序で実行されます。アクションをドラッグ&amp;ドロップして順序を並べ替えることができますが、このシナリオでは `Load Target` は `Fire Page Load Request` より前に配置する必要があります。

1. 「**[!UICONTROL ライブラリおよびビルドに保存]**」をクリックします

   ![保存してビルドする](images/target-fireGlobalMbox-saveAndBuild.png)

### ページ読み込み要求の検証

Target v2 拡張機能を追加し、`Load Target` アクションと `Fire Page Load Request` アクションを実行したので、タグプロパティが使用されているすべてのページにページ読み込みリクエストが行われている必要があります。

**「ターゲットを読み込み」および「ページ読み込み要求を実行」アクションを検証するには、以下を実行します。**

1. サンプルページを再度読み込みます。ページが表示されるまでにかかっていた 3 秒の遅延がなくなりました。`file://` プロトコルを使用してサンプルページを読み込む場合、Firefox または Safari ブラウザーでこの手順を実行する必要があります。これは、`file://` プロトコルを使用している場合、Chrome は Target 要求を実行しないためです。

1. [Luma サイト](https://luma.enablementadobe.com/content/luma/us/en.html)を開きます。

1. [&#x200B; 前のレッスン &#x200B;](switch-environments.md) の説明に従って、Debugger がタグプロパティを *自分の* 開発環境にマッピングしていることを確認します。

   ![&#x200B; デバッガーに表示されるタグ開発環境 &#x200B;](images/switchEnvironments-debuggerOnWeRetail.png)

1. デバッガーの「概要」タブに移動します。

1. 「`Launch`」セクションで、`Extensions` 見出しの下に `Target` が表示されることを確認します。

1. 「`Target`」セクションで、at.js ライブラリのバージョンが表示されることを確認します。

   ![デバッガーの「概要」タブに Target が表示されることを確認する](images/target-summaryTab.png)

1. 最後に、`Target`タブに移動し、クライアントコードを展開して、ページ読み込みリクエストが表示されることを確認します。

   ![ページ読み込み要求がおこなわれたことを確認する](images/target-debugger-globalMbox.png)

おめでとうございます。Target を実装しました。

## パラメーターの追加

Target リクエストにパラメーターを渡すと、ターゲティング、テスト、パーソナライゼーションアクティビティに強力な機能が追加されます。タグ拡張機能には、パラメーターを渡す 2 つのアクションが用意されています。

1. `Add Params to Page Load Request` は、ページ読み込みリクエストにパラメーターを追加します（[targetPageParams()](https://experienceleague.adobe.com/docs/target/using/implement-target/client-side/functions-overview/cmp-atjs-functions.html?lang=ja)メソッドと同じ）。

1. `Add Params to All Requests` を呼び出すと、ページ読み込み要求に加えてカスタムコードアクションからおこなわれた追加の要求や、サイトにハードコードされたなど、すべての Target 要求にパラメーターが追加されます（[targetPageParamsAll()](https://experienceleague.adobe.com/docs/target/using/implement-target/client-side/functions-overview/cmp-atjs-functions.html?lang=ja)メソッドと同じ）。

これらのアクションは、`Load Target` アクションの&#x200B;*前に*&#x200B;使用して、ルール設定に基づいて異なるページに異なるパラメーターを設定できます。ID サービスで顧客 ID を設定するときに使用したルール順序付け機能を使用して、ルールがページ読み込み要求を実行する前に `Library Loaded` イベントに追加のパラメーターを設定します。
>[!TIP]
>
>ほとんどの実装ではアクティビティ配信にページ読み込みリクエストを使用するので、通常は `Add Params to Page Load Requests` アクションのみを使用すれば十分です。

### 要求（mbox）パラメーター

パラメーターは、カスタムデータを Target に渡し、パーソナライゼーション機能を強化するために使用されます。ページ名やテンプレートなど、閲覧セッション中に頻繁に変更され、永続化されない属性に最適です。

[データ要素、ルール、ライブラリの追加](add-data-elements-rules.md)で先ほど作成した `Page Name` データ要素を要求パラメーターとして追加します。

**要求パラメーターを追加するには、以下を実行します。**

1. 左側のナビゲーションで **[!UICONTROL ルール]** に移動し、「`All Pages - Library Loaded`」をクリックしてルールエディターを開きます。

   ![すべてのページを開く — ライブラリ読み込み済みルール](images/target-editRule.png)

1. 「アクション」の下の![プラスアイコン](images/icon-plus.png)をクリックして、新しいアクションを追加します。

   ![「+」アイコンをクリックし、新しいアクションを追加する](images/target-addParamsAction.png)

1. **[!UICONTROL 拡張機能/Adobe Target v2]** を選択します。

1. **[!UICONTROL アクションタイプ/ページ読み込みリクエストにパラメーターを追加]** を選択します。

1. **[!UICONTROL 名前]** として `pageName` と入力します

1. ![データ要素アイコン](images/icon-dataElement.png)をクリックして、データ要素モーダルを開きます。

1. `Page Name` データ要素をクリックします。

1. 「**[!UICONTROL 選択]** ボタンをクリックします

   ![「選択」ボタンをクリックする](images/target-mboxParam-pageName.png)

1. 「**[!UICONTROL 変更を保持]**」をクリックします

   ![変更を保存](images/target-addPageName-keepChanges.png)をクリックします。

1. `Add Params to Page Load Request` アクションの左端をクリック&amp;ドラッグして、`Fire Page Load Request` アクションの前に並べ替えます（`Load Target` アクションの前でも後でも可能）。

1. 「**[!UICONTROL ライブラリおよびビルドに保存]**」をクリックします

   ![「ライブラリに保存してビルド」をクリックする](images/target-rearrangeActions.png)

#### 要求パラメーターの検証

at.js 2.x 要求で渡されたカスタムパラメーターをデバッガーで表示するのは容易でないので、ブラウザーの開発者ツールを利用します。

**pageName 要求パラメーターを検証するには、以下を実行します。**

1. Luma サイトをリロードし、独自のタグプロパティにマッピングされていることを確認します
1. ブラウザーの開発者ツールを開きます。
1. 「ネットワーク」タブをクリックします。
1. 要求を `tt.omtrdc` にフィルターします（または Target 要求の場合は CNAME ドメイン）
1. 「`Headers`／`Request Payload`／`execute.pageLoad.parameters`」セクションを展開して、`pageName` パラメーターと値を検証します。

![デバッガーでの pageName パラメーター](images/target-debugger-pageName-browser.png)

<!--Now go to the **[!UICONTROL Target]** tab in the Debugger. Expand your client code and look at the requests. You should see the new `pageName` parameter passed in the request:

![pageName parameter in the debugger](images/target-debugger-pageName.png)-->

### プロファイルパラメーター

要求パラメーターと同様、プロファイルパラメーターは Target 要求経由で渡されます。ただし、プロファイルパラメーターは Target の訪問者プロファイルデータベースに保存され、[訪問者のプロファイルの期間中](https://experienceleague.adobe.com/docs/target/using/audiences/visitor-profiles/visitor-profile-lifetime.html?lang=ja)保持されます。これらの設定はサイトのいずれかのページで指定し、他のページの Target アクティビティで使用できます。以下に、自動車の Web サイトの例を示します。訪問者が車両のページに移動したら、プロファイルパラメーター「profile.lastViewed=sportscar」を渡して、特定の車両への関心を記録することができます。訪問者が他のページ（車両以外のページ）を閲覧すると最後に閲覧した車に基づいてコンテンツをターゲット設定できます。プロファイルパラメーターは、ほとんど変更されない、または特定のページでのみ利用可能な属性に最適です。

このチュートリアルではプロファイルパラメーターは渡されませんが、ワークフローは `pageName` パラメーターを渡す際の操作とほぼ同じです。違いの 1 つは、プロファイルパラメーターに `profile.` 接頭辞を付ける必要があるという点です。この点で、「userType」と呼ばれるパラメーターは `Add Params to Page Load Request` アクションで以下のようになります。

![プロファイルパラメーターの設定](images/target-profileParameter.png)

### エンティティパラメーター

エンティティパラメーターは、主に次の 3 つの理由により、[Recommendations の実装](https://experienceleague.adobe.com/docs/target/using/recommendations/plan-implement.html?lang=ja)で使用される特別なパラメーターです。

1. 製品のレコメンデーションをトリガーするためのキー。例えば、「製品 Xを閲覧し、Y も閲覧した人」などのレコメンデーションアルゴリズムを使用する場合、「X」はレコメンデーションの「キー」になります。訪問者が現在閲覧している製品の sku（`entity.id`）またはカテゴリー（`entity.categoryId`）です。
1. 「最近閲覧した製品」や「最も多く閲覧された製品」など、レコメンデーションアルゴリズムを強化する訪問者行動を収集する場合。
1. Recommendations カタログを生成する場合。Recommendations には、Web サイト上のすべての製品または記事のデータベースが含まれおり、それらを Recommendations オファーで使用することができます。例えば、製品をレコメンデーションする場合は一般的に、製品名（`entity.name`）や画像（`entity.thumbnailUrl`）などの属性を表示する必要があります。バックエンドフィードを使用してカタログに入力する顧客もいますが、Target リクエストのエンティティパラメーターを使用して入力することもできます。

このチュートリアルではエンティティパラメーターを渡す必要はありませんが、ワークフローは、`pageName` リクエストパラメーターを渡す際に以前に行ったものと同じです。パラメーターに「entity」というプレフィックスがついた名前を付けるだけです。 関連するデータ要素にマップします。メモ一部の一般的なエンティティには、使用する必要のある予約名（製品 sku のエンティティ ID など）があります。`Add Params to Page Load Request` アクションでエンティティパラメーターを設定すると、次のようになります。

![エンティティパラメーターの追加](images/target-entityParameters.png)

### 顧客 ID パラメーターの追加

Adobe Experience Platform ID サービスを使用して顧客 ID を収集すると、Adobe Experience Cloud の[顧客属性](https://experienceleague.adobe.com/docs/target/using/audiences/visitor-profiles/working-with-customer-attributes.html?lang=ja)機能を使用して CRM データを Target に簡単にインポートできます。また、[デバイスをまたいだ訪問者のステッチ](https://experienceleague.adobe.com/docs/target/using/integrate/experience-cloud-device-co-op.html?lang=ja)も可能で、顧客がデバイス（ノート PC とモバイルデバイスなど）を切り替えても、一貫したユーザーエクスペリエンスを維持できます。

ページ読み込み要求を実行する前に、ID サービスの `Set Customer IDs` アクションに顧客 ID を設定する必要があります。そのためには、サイトに次の機能があることを確認します。

* 顧客 ID は、タグ埋め込みコードの前のページで使用できる必要があります
* Adobe Experience Platform ID サービス拡張機能がインストールされている必要があります。
* 「Library Loaded (Page Top)」イベントで実行するルールで、`Set Customer IDs` アクションを使用する必要があります。
* 「Set Customer IDs」アクションの&#x200B;*後で*&#x200B;実行する「`Fire Page Load Request`」アクションを使用します。

前のレッスン「[Adobe Experience Platform ID サービスの追加](id-service.md)」では、「Set Customer IDs」アクションを実行する`All Pages - Library Loaded - Authenticated - 10` ルールを作成しました。このルールでは `Order` の設定は `10` となっているので、顧客 ID は、`All Pages - Library Loaded` ルール（`Order` は `50` に設定）でページ読み込み要求が実行される前に設定されます。これで、Target の顧客 ID のコレクションを実装しました。

#### 顧客 ID の検証

at.js 2.x 要求で渡されたカスタムパラメーターをデバッガーで表示するのは容易でないので、ブラウザーの開発者ツールを利用します。

**顧客 ID を検証するには、以下を実行します。**

1. [Luma サイト](https://luma.enablementadobe.com/content/luma/us/en.html)を開きます。

1. [&#x200B; 前のレッスン &#x200B;](switch-environments.md) の説明に従って、Debugger がタグプロパティを *自分の* 開発環境にマッピングしていることを確認します。

   ![&#x200B; デバッガーに表示されるタグ開発環境 &#x200B;](images/switchEnvironments-debuggerOnWeRetail.png)

1. 資格情報（`test@test.com`／`test`）を使用して Luma サイトにログインします。
1. [Luma のホームページ](https://luma.enablementadobe.com/content/luma/us/en.html)に戻ります。

1. ブラウザーの開発者ツールを開きます。
1. 「ネットワーク」タブをクリックします。
1. 要求を `tt.omtrdc` にフィルターします（または Target 要求の場合は CNAME ドメイン）
1. 「`Headers`／`Request Payload`／`id.customerIds.0`」セクションを展開して、顧客 ID の設定と値を検証します。

![デバッガーでの顧客 ID 設定](images/target-debugger-customerId-browser.png)

<!--
1. Open the Debugger
1. Go to the Target tab
1. Expand your client code
1. You should see parameters in the latest Target request for `vst.crm_id.id` and `vst.crm_id.authState`. `vst.crm_id.id` should have a value of the hashed email address and `vst.crm_id.authState` should have a value of `1` to represent `authenticated`. Note that `crm_id` is the `Integration Code` you specified in the Identity Service configuration and must align with the key you use in your [Customer Attributes data file](https://experienceleague.adobe.com/docs/core-services/interface/customer-attributes/t-crs-usecase.html?lang=ja):

![The Customer Id details should be visible as custom parameters in the Target request](images/target-debugger-customerId.png)
-->

>[!WARNING]
>
>Adobe Experience Platform ID サービスを使用すると、複数の ID をサービスに送信できますが、最初の ID のみが Target に送信されます。

### プロパティトークンパラメーターの追加

>[!NOTE]
>
>これは、Target Premiumのお客様向けのオプションの演習です。

プロパティトークンは、Target Premium の[エンタープライズユーザー権限](https://experienceleague.adobe.com/docs/target/using/administer/manage-users/enterprise/property-channel.html?lang=ja)で使用される予約済みパラメーターです。異なるデジタルプロパティを定義するために使用され、Experience Cloud 組織のメンバーは、プロパティごとに異なる権限を割り当てることができます。例えば、1 つのユーザーグループが Web サイト上で Target アクティビティを設定でき、モバイルアプリケーション内では設定できないようにするとします。

Target のプロパティは、タグプロパティや Analytics レポートスイートに似ています。 複数のブランド、web サイト、マーケティングチームを持つ企業では、web サイトやモバイルアプリごとに異なる Target プロパティ、タグプロパティ、Analytics レポートスイートを使用する場合があります。 タグプロパティは埋め込みコードによって区別され、Analytics レポートスイートはレポートスイート ID によって区別され、Target プロパティはプロパティトークンパラメーターによって区別されます。


プロパティトークンは、`targetPageParams()` 関数を使用したタグのカスタムコードアクションを使用して実装する必要があります。 1 つのタグプロパティに異なる at_property 値を使用して、異なるサイトを複数に実装する場合は、データ要素を使用して at_property 値を管理できます。

Target Premium のお客様がチュートリアルプロパティにプロパティトークンを実装する場合の、オプションの演習は次のとおりです。

1. 別のタブで、Target ユーザーインターフェイスを開きます。

1. **[!UICONTROL 管理/ プロパティ]** に移動します。

1. 使用するプロパティを特定して、「**[!UICONTROL &lt;/>]** をクリックします（または新しいプロパティを作成します）

1. `<script></script>` 内のコードスニペットをクリップボードにコピーします

   ![Adobe Target インターフェイスからのプロパティトークンの取得](images/target-addATProperty-targetProperties.png)

1. 「タグ」タブで、左側のナビゲーションの **[!UICONTROL ルール]** に移動し、「`All Pages - Library Loaded`」をクリックしてルールエディターを開きます。

   ![すべてのページを開く — ライブラリ読み込み済みルール](images/target-editRule.png)

1. 「アクション」で、`Core - Custom Code` アクションをクリックして、 `Action Configuration` を開きます。

   ![「ページ読み込みリクエストにパラメーターを追加」アクションを開く](images/target-openCustomCodeAction.png)

1. コードエディターを開き、`targetPageParams()` 関数を含む Target インターフェイスからコードをペーストします
1. 「**[!UICONTROL 保存]** ボタンをクリックします

   ![「ページ読み込みリクエストにパラメーターを追加」アクションを開く](images/target-addATProperty.png)

1. 「**[!UICONTROL グローバルに実行]**」ボックスをオンにして、`targetPageParams()` がグローバルスコープで宣言されるようにします
1. 「**[!UICONTROL 変更を保持]**」をクリックします

   ![変更を保存](images/target-addATProperty-keepChanges.png)をクリックします。

1. 「**[!UICONTROL ライブラリおよびビルドに保存]**」をクリックします
   ![「ライブラリに保存してビルド」をクリックする](images/target-addATProperty-save.png)

>[!WARNING]
>
>**[!UICONTROL ページ読み込みリクエストにパラメーターを追加]** アクションで `at_property` パラメーターを追加しようとすると、パラメーターはネットワークリクエストに入力されますが、Target の Visual Experience Composer （VEC）はページを読み込む際に自動検出できません。 カスタムコードアクションの `targetPageParams()` 関数を使用して、常に `at_property` を入力します。

#### プロパティトークンの検証

at.js 2.x 要求で渡されたカスタムパラメーターをデバッガーで表示するのは容易でないので、ブラウザーの開発者ツールを利用します。

**プロパティトークンパラメーターを検証するには、いかを実行します。**

1. [Luma サイト](https://luma.enablementadobe.com/content/luma/us/en.html)を開きます。
1. [&#x200B; 前のレッスン &#x200B;](switch-environments.md) の説明に従って、Debugger がタグプロパティを *自分の* 開発環境にマッピングしていることを確認します。

   ![&#x200B; デバッガーに表示されるタグ開発環境 &#x200B;](images/switchEnvironments-debuggerOnWeRetail.png)

1. ブラウザーの開発者ツールを開きます。
1. 「ネットワーク」タブをクリックします。
1. 要求を `tt.omtrdc` にフィルターします（または Target 要求の場合は CNAME ドメイン）
1. 「`Headers`／`Request Payload`／`property.token`」セクションを展開して、値を検証します。
   ![プロパティトークンは、すべての要求で at_property パラメーターとして表示される](images/target-debugger-atProperty-browser.png)

<!--
1. Go to the `Target` tab
1. Expand your client code
1. You should see the parameter for "at_property" in every page load request request as you browse the site:

![The Property Token should be visible as the at_property parameter in every request](images/target-debugger-atProperty.png)-->

## カスタム要求の追加

### 注文確認要求の追加

注文確認要求は、注文の詳細を Target に送信するために使用される特別なタイプの要求です。3 つの特定の要求パラメーター（orderId、orderTotal、productPurchasedId）を含めると、通常の Target 要求が 1 つの注文要求に変わります。売上高のレポートに加えて、注文要求でも次の処理をおこないます。

1. 誤って再送信された注文を除外する
1. 極端な注文をフィルタリングする（合計が平均の標準偏差から 3 以上離れている注文）
1. バックグラウンドで異なるアルゴリズムを使用して、統計的信頼性を計算する
1. 個々の注文詳細に対し、ダウンロード可能な特別監査レポートを作成する

ベストプラクティスは、小売以外のサイトであっても、すべての注文ファネルで注文確認リクエストを使用することです。 例えば、リードジェネレーションサイトには通常、生成された一意の「リード ID」を持つリードファネルが最後にあります。これらのサイトでは、orderTotal に静的な値（「1」など）を使用して注文要求を実装する必要があります。

ほとんどのレポートで Analytics for Target （A4T）統合を使用しているお客様は、A4T をサポートしていないAutomated Personalization アクティビティを使用している場合に注文リクエストを実装することもできます。 さらに、注文リクエストは、Recommendations 実装の重要な要素であり、購入行動に基づいてアルゴリズムを強化します。 A4T サポートの最新情報については、[&#x200B; ドキュメント &#x200B;](https://experienceleague.adobe.com/docs/target/using/integrate/a4t/a4t.html?lang=ja#section_F487896214BF4803AF78C552EF1669AA) を参照してください。

注文確認要求は、注文確認ページまたはイベントでのみトリガーされるルールから実行する必要があります。多くの場合、注文確認要求は Adobe Analytics 購入イベントを設定するルールと組み合わせることができます。これは、コア拡張機能の「Custom Code」アクションで、適切なデータ要素を使用して orderId、orderTotal、productPurchasedId パラメーターを設定する適切なデータ要素を使用して設定する必要があります。

Luma サイトで注文確認リクエストを実行する必要があるデータ要素とルールを追加します。複数のデータ要素を作成済みであるため、これらの手順は省略されます。

**注文 ID のデータ要素を作成するには、以下を実行します。**

1. 左側のナビゲーションで **[!UICONTROL データ要素]** をクリックします
1. 「**[!UICONTROL データ要素を追加]**」をクリックします。
1. データ要素に「`Order Id`」と名前を付けます。
1. **[!UICONTROL データ要素タイプ/JavaScript変数]** を選択します。
1. `digitalData.cart.orderId` を `JavaScript variable name` として使用します。
1. `Clean text` オプションをオンにします。
1. 「**[!UICONTROL ライブラリに保存]**」をクリックします
（注文確認リクエストのすべての変更を行うまで、ライブラリはビルドされません）

**買い物かごの金額のデータ要素を作成するには、以下を実行します。**

1. 「**[!UICONTROL データ要素を追加]**」をクリックします。
1. データ要素に「`Cart Amount`」と名前を付けます。
1. **[!UICONTROL データ要素タイプ/JavaScript変数]** を選択します。
1. `digitalData.cart.cartAmount` を `JavaScript variable name` として使用します。
1. `Clean text` オプションをオンにします。
1. 「**[!UICONTROL ライブラリに保存]**」をクリックします

**買い物かご SKU（Target）用データ要素を作成するには、以下を実行します。**

1. 「**[!UICONTROL データ要素を追加]**」をクリックします。
1. データ要素に「`Cart SKUs (Target)`」と名前を付けます。
1. **[!UICONTROL データ要素タイプ/カスタムコード]** を選択します
1. Target の場合、skus はコンマ区切りリストである必要があります。このカスタムコードでは、データレイヤー配列を適切な形式に変更します。カスタムコードエディターで、以下を貼り付けます。

   ```javascript
   var targetProdSkus="";
   for (var i=0; i<digitalData.cart.cartEntries.length; i++) {
     if(i>0) {
       targetProdSkus = targetProdSkus + ",";
     }
     targetProdSkus = targetProdSkus + digitalData.cart.cartEntries[i].sku;
   }
   return targetProdSkus;
   ```

1. `Force lowercase value` オプションをオンにします。
1. `Clean text` オプションをオンにします。
1. 「**[!UICONTROL ライブラリに保存]**」をクリックします

次に、これらのデータ要素を注文確認ページのパラメーターとして使用して注文確認リクエストを実行するルールを作成する必要があります。

**注文確認ページのルールを作成するには、以下を実行します。**

1. 左側のナビゲーションで「**[!UICONTROL ルール]**」をクリックします
1. 「**[!UICONTROL ルールを追加]**」をクリックします
1. ルール名を設定します。`Order Confirmation Page - Library Loaded - 60`
1. **[!UICONTROL イベント/追加]** をクリックします。
   1. **[!UICONTROL イベントタイプ/ライブラリの読み込み（ページのトップ）]**
   1. **[!UICONTROL 詳細オプション]** で、`Load Target` アクションの後に実行されるように、`Order` を `60` に変更します（これは、`Order` が `50` に設定されている `All Pages - Library Loaded` ルール内にあります）
   1. 「**[!UICONTROL 変更を保持]**」をクリックします
1. **[!UICONTROL 条件/追加]** をクリックします
   1. **[!UICONTROL 条件タイプ/クエリ文字列を含まないパス]** を選択します。
   1. `Path equals` には `thank-you.html` を入力します。
   1. 「正規表現」オプションをオンにして、ロジックを `equals` から `contains` に変更します（`Test` 機能を使用して、URL のテストが合格することを確認できます）。`https://luma.enablementadobe.com/content/luma/us/en/user/checkout/order/thank-you.html`

      ![姓と名のダミー値を入力する](images/target-orderConfirm-test.png)

   1. 「**[!UICONTROL 変更を保持]**」をクリックします
1. **[!UICONTROL アクション/追加]** をクリックします。
   1. **[!UICONTROL アクションタイプ/カスタムコード]** を選択します。
   1. **[!UICONTROL 編集画面を開く]** をクリックします
   1. 次のコードを、`Edit Code` モーダルに貼り付けます。

      ```javascript
      adobe.target.getOffer({
        "mbox": "orderConfirmPage",
        "params":{
           "orderId": _satellite.getVar('Order Id'),
           "orderTotal": _satellite.getVar('Cart Amount'),
          "productPurchasedId": _satellite.getVar('Cart SKUs (Target)')
        },
        "success": function(offer) {
          adobe.target.applyOffer({
            "mbox": "orderConfirmPage",
            "offer": offer
          });
        },
        "error": function(status, error) {
          console.log('Error', status, error);
        }
      });
      ```

   1. 「**[!UICONTROL 保存]**」をクリックして、カスタムコードを保存します
   1. 「**[!UICONTROL 変更を保持]**」をクリックして、アクションを保持します
1. 「**[!UICONTROL ライブラリおよびビルドに保存]**」をクリックします

#### 注文確認要求の検証

at.js 2.x 要求で渡されたカスタムパラメーターをデバッガーで表示するのは容易でないので、ブラウザーの開発者ツールを利用します。

1. [Luma サイト](https://luma.enablementadobe.com/content/luma/us/en.html)を開きます。

1. [&#x200B; 前のレッスン &#x200B;](switch-environments.md) の説明に従って、Debugger がタグプロパティを *自分の* 開発環境にマッピングしていることを確認します。

   ![&#x200B; デバッガーに表示されるタグ開発環境 &#x200B;](images/switchEnvironments-debuggerOnWeRetail.png)

1. サイトを参照し、買い物かごに複数の製品を追加します。
1. チェックアウトを続行します。
1. チェックアウトプロセスでは、必須のフィールドは `First Name` と `Last Name` です。

   ![姓と名のダミー値を入力する](images/target-testOrderCart.png)

1. 注文確認ページで、必ず「`Place Order`」ボタンをクリックしてください。
1. ブラウザーの開発者ツールを開きます。
1. 「ネットワーク」タブをクリックします。
1. 要求を `tt.omtrdc` にフィルターします（または Target 要求の場合は CNAME ドメイン）。
1. 2 つ目の要求をクリックします。
1. 「`Headers`／`Request Payload`／`execute.mboxes.0`」セクションを展開して、要求名と注文パラメーターを検証します。

![デバッガーでの注文要求の設定](images/target-debugger-orderConfirmPage-browser.png)

<!--
1. Look in the Debugger
1. Go to the Target tab
1. Expand your client code
1. You should see the `orderConfirmPage` request as the latest Target request with the orderId, orderTotal, and productPurchasedId parameters populated with the details of your order

   link to "orderConfirmPage request with required parameters": images/target-debugger-orderConfirmPage.png 
-->

### カスタムリクエスト

ページの読み込みと注文確認リクエスト以外に、Target リクエストをおこなう必要がある場合はまれです。 例えば、パーソナライゼーションに使用する重要なデータが、タグ埋め込みコードの前のページで定義されていない場合があります。ページの下部でハードコードされている場合や、非同期 API リクエストから返される場合があります。 このデータは、追加のリクエストを使用して Target に送信できますが、ページが既に表示されるので、このリクエストをコンテンツ配信に使用することは最適ではありません。 このデータを使用して、後で使用するために訪問者プロファイルをエンリッチメントしたり（プロファイルパラメーターを使用）、Recommendations カタログに値を入力したりできます。

このような場合、コア拡張機能のカスタムコードアクションを使用して、[getOffer （） &#x200B;](https://experienceleague.adobe.com/docs/target-dev/developer/client-side/at-js-implementation/functions-overview/adobe-target-getoffer.html?lang=ja)/[applyOffer （） &#x200B;](https://experienceleague.adobe.com/docs/target-dev/developer/client-side/at-js-implementation/functions-overview/adobe-target-applyoffer.html?lang=ja) および [trackEvent （） &#x200B;](https://experienceleague.adobe.com/docs/target-dev/developer/client-side/at-js-implementation/functions-overview/adobe-target-trackevent.html?lang=ja) メソッドを使用してリクエストを実行します。 これは、[&#x200B; 注文確認リクエスト &#x200B;](#order-confirmation-request) の演習で行ったものと非常によく似ていますが、別のリクエスト名を使用するだけであり、特別な注文パラメーターは使用しません。 カスタムコードから Target リクエストを実行する前に、必ず **[!UICONTROL ターゲットを読み込み]** アクションを使用してください。

## ライブラリのヘッダーとライブラリのフッター

Target ユーザーインターフェイスの at.js 画面の編集画面には、at.js ファイルの直前または直後に実行するカスタム JavaScript を貼り付けることができます。ライブラリヘッダーは、[targetGlobalSettings()](https://experienceleague.adobe.com/docs/target/using/implement-target/client-side/functions-overview/targetgobalsettings.html?lang=ja) 関数経由で at.js 設定を上書きしたり、[データプロバイダー](https://experienceleague.adobe.com/docs/target-learn/tutorials/integrations/use-data-providers-to-integrate-third-party-data.html?lang=ja)機能を使用してサードパーティからデータを渡したりする場合に使用されます。ライブラリフッターは、[at.js カスタムイベント](https://experienceleague.adobe.com/docs/target-dev/developer/client-side/at-js-implementation/functions-overview/atjs-custom-events.html?lang=ja)リスナーの追加に使用される場合があります。

この機能をタグにレプリケートするには、コア拡張機能のカスタムコードアクションを使用して、「ターゲットを読み込み」アクションの前（ライブラリヘッダー）または後（ライブラリフッター）にアクションを並べ替えます。 これは、以下の図のように、 `Load Target` アクションと同じルールで実行することも、`Load Target` の前後に確実に実行するイベントや順序の設定を使用して別のルールで実行することもできます。

![アクションシーケンスのライブラリヘッダーとフッター](images/target-libraryHeaderFooter.png)

カスタムヘッダーやフッターの使用例について詳しくは、以下のリソースを参照してください。

* [dataProviders を使用してサードパーティデータを Adobe Target に統合する](https://experienceleague.adobe.com/docs/target-learn/tutorials/integrations/use-data-providers-to-integrate-third-party-data.html?lang=ja)
* [dataProviders を実装してサードパーティデータを Adobe Target に統合する](https://experienceleague.adobe.com/docs/target-learn/tutorials/integrations/implement-data-providers-to-integrate-third-party-data.html?lang=ja)
* [Adobe Target での応答トークンと at.js カスタムイベントの使用](https://experienceleague.adobe.com/docs/target-learn/tutorials/integrations/use-response-tokens-and-atjs-custom-events.html?lang=ja)

[次の「Adobe Analyticsの追加」 >](analytics.md)
