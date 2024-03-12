---
title: Experience PlatformWeb SDK を使用したAdobe Analyticsのセットアップ
description: Experience PlatformWeb SDK を使用したAdobe Analyticsの設定方法について説明します。 このレッスンは、「 Adobe Experience Cloudと Web SDK の実装」チュートリアルの一部です。
solution: Data Collection, Analytics
source-git-commit: 26545b660b70daf4296ec2afbc067065f77def01
workflow-type: tm+mt
source-wordcount: '3024'
ht-degree: 1%

---

# Platform Web SDK でのAdobe Analyticsの設定

次を使用してAdobe Analyticsを設定する方法を説明します。 [Experience PlatformWeb SDK](https://experienceleague.adobe.com/docs/platform-learn/data-collection/web-sdk/overview.html?lang=ja)では、タグルールを作成してAdobe Analyticsにデータを送信し、Analytics が期待どおりにデータをキャプチャしていることを検証します。

[Adobe Analytics](https://experienceleague.adobe.com/docs/analytics.html?lang=ja) は、顧客像を把握し、顧客インテリジェンスを活用してビジネスを導く力をユーザーに提供する、業界最先端のアプリケーションです。

![Web SDK からAdobe Analyticsへの図](assets/dc-websdk-aa.png)

## 学習内容

このレッスンを最後まで学習すると、以下の内容を習得できます。

* Adobe Analyticsを有効にするためのデータストリームの設定
* Analytics での自動マッピングと手動でマッピングされた XDM 変数の違いの理解
* Adobe Analytics固有の変数用の XDM スキーマの設定
* XDM を使用した製品構文マーチャンダイジングeVarの設定
* 別のAdobe Analyticsレポートスイートにデータを送信するためのデータストリームの上書き
* Debugger を使用したAdobe Analytics変数のExperience Platform
* Adobe Analyticsの処理ルールを使用したカスタム変数の設定
* Adobe Experience Platform Assurance を使用して、Adobe Analyticsがデータを取り込んだことを検証する
* リアルタイムレポートを使用して、Adobe Analyticsがデータを取得したことを検証する

## 前提条件

このレッスンを完了するには、まず次の手順を実行する必要があります。

* に精通し、Adobe Analyticsにアクセスできるようにしてください。

* 1 つ以上のテスト/開発レポートスイート ID がある。 このチュートリアルで使用できるテスト/開発用レポートスイートがない場合は、 [1 つを作成してください](https://experienceleague.adobe.com/docs/analytics/admin/manage-report-suites/new-report-suite/t-create-a-report-suite.html?lang=ja).

* このチュートリアルの「初期設定」および「タグの設定」節の前のレッスンを完了していること。

## データストリームの設定

Platform Web SDK は、Web サイトから Platform Edge Network にデータを送信します。 その後、データストリームが、データの転送先となるAdobe Analyticsレポートスイートを Platform Edge Network に通知します。

1. に移動します。 [データ収集](https://experience.adobe.com/#/data-collection){target="blank"} インターフェイス
1. 左側のナビゲーションで、「 **[!UICONTROL データストリーム]**
1. 以前に作成したを選択 `Luma Web SDK: Development Environment` datastream

   ![Luma Web SDK データストリームを選択します。](assets/datastream-luma-web-sdk-development.png)

1. 「**[!UICONTROL サービスを追加]**」を選択します。
   ![データストリームにサービスを追加する](assets/datastream-analytics-addService.png)
1. 選択 **[!UICONTROL Adobe Analytics]** として **[!UICONTROL サービス]**
1. 次を入力します。  **[!UICONTROL レポートスイート ID]** （開発レポートスイートの）
1. 「**[!UICONTROL 保存]**」を選択します

   ![データストリーム保存分析](assets/datastream-add-analytics.png)

   >[!TIP]
   >
   >「 」を選択してレポートスイートを追加する **[!UICONTROL レポートスイートの追加]** は、複数のスイートタグ付けと同等です。

>[!WARNING]
>
>このチュートリアルでは、開発環境用にAdobe Analyticsレポートスイートのみを設定します。 独自の Web サイトのデータストリームを作成する場合、ステージング環境と実稼動環境用に追加のデータストリームおよびレポートスイートを作成します。

## XDM スキーマと Analytics 変数

おめでとうございます。のAdobe Analyticsと互換性のあるスキーマを既に設定しています [スキーマの設定](configure-schemas.md) レッスン！

しかし、「すべての prop、eVar およびイベントを設定するにはどうすればよいですか？」と疑問に思うかもしれません。

複数の方法があり、同時に使用できます。

1. 標準 XDM フィールドを設定します。一部のフィールドは、自動的に Analytics 変数にマッピングされます。
1. 追加の XDM フィールドを Analytics 処理ルール内の Analytics 変数にマッピングします。
1. XDM スキーマ内で Analytics 変数に直接マッピングします。

<!-- Implementing Platform Web SDK should be as product-agnostic as possible. For Adobe Analytics, mapping eVars, props, and events doesn't occur during schema creation, nor during the tag rules configuration as it has been done traditionally. Instead, every XDM key-value pair becomes a Context Data Variable that maps to an Analytics variable in one of two ways: 

1. Automatically mapped variables using reserved XDM fields
1. Manually mapped variables using Analytics Processing Rules

To understand what XDM variables are auto-mapped to Adobe Analytics, please see [Variables automatically mapped in Analytics](https://experienceleague.adobe.com/docs/experience-platform/edge/data-collection/adobe-analytics/automatically-mapped-vars.html?lang=en). Any variable that is not auto-mapped must be manually mapped. 

 1. **Product-agnostic XDM**: maintain a semantic key-value pair XDM schema and use [Adobe Analytics Processing Rules](https://experienceleague.adobe.com/docs/analytics/admin/admin-tools/manage-report-suites/edit-report-suite/report-suite-general/c-processing-rules/processing-rules.html) to map the XDM fields to eVars, props, and so on. By a semantic XDM schema, we mean that the field names themselves have meaning. For example, the field name `web.webPageDetails.pageName` has more meaning than say `prop1` or `evar3`.


 1. **Analytics-specific XDM**: Use a purpose-built Adobe Analytics field group in the XDM schema called `Adobe Analytics ExperienceEvent Template`
 
The approach Adobe has seen customers prefer is the **Analytics-specific XDM**, because it skips the mapping step in the Adobe Analytics Processing Rules interface. The steps in this lesson use the **Analytics-specific XDM** approach.
-->

### 自動的にマッピングされたフィールド

多くの XDM フィールドは、Analytics 変数に自動的にマッピングされます。

で作成されたスキーマ [スキーマの設定](configure-schemas.md) レッスンには、次の表で概要を示すように、Analytics 変数に自動マッピングされるいくつかが含まれます。

| XDM から Analytics への自動マッピングされた変数 | Adobe Analytics変数 |
|-------|---------|
| `identitymap.ecid.[0].id` | mid |
| `web.webPageDetails.name` | s.pageName |
| `web.webPageDetails.server` | s.server |
| `web.webPageDetails.siteSection` | s.channel |
| `commerce.productViews.value` | prodView |
| `commerce.productListViews.value` | scView |
| `commerce.checkouts.value` | scCheckout |
| `commerce.purchases.value` | 購入 |
| `commerce.order.currencyCode` | s.currencyCode |
| `commerce.order.purchaseID` | s.purchaseID |
| `productListItems[].SKU` | s.products=;product name;;;;（primary — 後述の注意を参照） |
| `productListItems[].name` | s.products=;product name;;;;（フォールバック — 後述の注意を参照） |
| `productListItems[].quantity` | s.products=;;product quantity;; |
| `productListItems[].priceTotal` | s.product=;;;product price;; |

Analytics 製品文字列の個々のセクションは、 `productListItems` オブジェクト。
>2022 年 8 月 18 日現在 `productListItems[].SKU` は、s.products 変数内の製品名へのマッピングを優先します。
>に設定された値 `productListItems[].name` は、次の場合にのみ製品名にマッピングされます： `productListItems[].SKU` は存在しません。 それ以外の場合は、マッピングが解除され、コンテキストデータで使用できます。
>空の文字列や null をに設定しないでください。  `productListItems[].SKU`. これにより、s.products 変数内の製品名にマッピングした場合に、望ましくない影響が生じます。

最新のマッピングリストについては、 [Analytics Experience Edge での Analytics 変数のマッピングAdobe](https://experienceleague.adobe.com/docs/experience-platform/edge/data-collection/adobe-analytics/automatically-mapped-vars.html?lang=ja).


### Analytics 処理ルールとのマッピング

XDM スキーマ内のすべてのフィールドは、次のプレフィックスを持つコンテキストデータ変数としてAdobe Analyticsで使用できるようになります `a.x.`. 例：`a.x.web.webinteraction.region`

この演習では、1 つの XDM 変数を prop にマッピングします。 すべてのカスタムマッピングに対して同じ手順を実行します。 `eVar`, `prop`, `event`、または処理ルールからアクセス可能な変数。

1. Analytics インターフェイスに移動します。
1. に移動します。 [!UICONTROL 管理者] > [!UICONTROL 管理ツール] > [!UICONTROL レポートスイート]
1. チュートリアルで使用する開発/テストレポートスイートを選択します。 > [!UICONTROL 設定を編集] > [!UICONTROL 一般] > [!UICONTROL 処理ルール]

   ![Analytics の購入](assets/analytics-process-rules.png)

1. ルールを作成して **[!UICONTROL の値を上書き]** `[!UICONTROL Product SKU (prop1)]` から `a.x.productlistitems.0.sku`. ルールを作成する理由に関する注意を追加し、ルールのタイトルに名前を付けてください。 「**[!UICONTROL 保存]**」を選択します

   ![Analytics の購入](assets/analytics-set-processing-rule.png)

   >[!IMPORTANT]
   >
   >最初に処理ルールにマッピングしたとき、UI には XDM オブジェクトのコンテキストデータ変数が表示されません。 任意の値を選択する場合は、「保存」をクリックし、再び編集を開始します。 これで、すべての XDM 変数が表示されます。

### XDM スキーマ内の Analytics 変数にマッピングします

処理ルールの代わりに、 `Adobe Analytics ExperienceEvent Template` フィールドグループを使用します。 この方法は、多くのユーザーが処理ルールを設定するよりも簡単になると考えているので、普及しています。ただし、XDM ペイロードのサイズを増やすと、Real-Time CDPなど他のアプリケーションでのプロファイルサイズが増加します。

次の手順で `Adobe Analytics ExperienceEvent Template` フィールドグループからスキーマに移動します。

1. を開きます。 [データ収集](https://experience.adobe.com/#/data-collection){target="blank"} インターフェイス
1. 選択 **[!UICONTROL スキーマ]** 左のナビゲーションから
1. チュートリアルから、使用しているサンドボックス内にいることを確認します。
1. を開きます。 `Luma Web Event Data` スキーマ
1. Adobe Analytics の **[!UICONTROL フィールドグループ]** セクション、選択 **[!UICONTROL 追加]**
1. 次を検索： `Adobe Analytics ExperienceEvent Template` フィールドグループを作成し、スキーマに追加します。


製品文字列にマーチャンダイジングeVarを設定しました。 を使用 `Adobe Analytics ExperienceEvent Template` フィールドグループ内で、変数をマーチャンダイジング eVar またはイベントにマッピングすることができます。 これは、設定とも呼ばれます。 **製品構文マーチャンダイジング**.

1. タグプロパティに戻る

1. ルールを開く `ecommerce - library loaded - set product details variables - 20`

1. を開きます。 **[!UICONTROL 変数を設定]** アクション

1. 選択して開く `_experience > analytics > customDimensions > eVars > eVar1`

1. を設定します。 **[!UICONTROL 値]** から `%product.productInfo.title%`

1. 選択 **[!UICONTROL 変更を保持]**

   ![製品 SKU XDM オブジェクト変数](assets/set-up-analytics-product-merchandising.png)

1. 選択 **[!UICONTROL 保存]** ルールを保存するには

ご覧のように、基本的に、すべての Analytics 変数を `Adobe Analytics ExperienceEvent Template` フィールドグループを使用します。

>[!NOTE]
>
> 次の点に注意してください。 `_experience` の下のオブジェクト `productListItems` > `Item 1`. この下に任意の変数を設定 [!UICONTROL object] は製品の構文 eVar またはイベントを設定します。


### 別のレポートスイートへのデータの送信

訪問者が特定のページを閲覧している場合に、どのAdobe Analyticsレポートスイートデータを送信するかを変更することができます。 これには、データストリームとルールの両方の設定が必要です。

#### データストリームレポートスイートの上書きの設定

データストリーム内のAdobe Analyticsレポートスイートの上書き設定を設定するには、次の手順を実行します。

1. データストリームを開く
1. を編集します。 **[!UICONTROL Adobe Analytics]** 設定を行うには、 ![その他](https://spectrum.adobe.com/static/icons/workflow_18/Smock_More_18_N.svg) メニューと選択 **[!UICONTROL 編集]**

   ![データストリームを上書き](assets/datastream-edit-analytics.png)

1. を選択します。 **[!UICONTROL 詳細オプション]** 開く **[!UICONTROL レポートスイートの上書き]**

1. 上書きするレポートスイートを選択します。 この場合、 `Web SDK Course Dev` および `Web SDK Course Stg`

1. 「保存」を選択します。

   ![データストリームを上書き](assets/analytics-datastreams-edit-adobe-analytics-configurations-report-suites.png)


#### データストリームの上書きを使用して、ページビューを別のレポートスイートに送信します

別のレポートスイートに追加のページビュー呼び出しを送信するルールを作成します。 データストリームの上書き機能を使用して、 **[!UICONTROL イベントの送信]** アクション。

1. 新しいルールを作成し、名前を付けます。 `homepage - library loaded - AA report suite override - 51`

1. の下のプラス記号を選択します。 **[!UICONTROL イベント]** 新しいトリガー

1. の下 **[!UICONTROL 拡張]**&#x200B;を選択します。 **[!UICONTROL コア]**

1. の下 **[!UICONTROL イベントタイプ]**&#x200B;を選択します。 **[!UICONTROL ライブラリ読み込み済み]**

1. 選択して開く **[!UICONTROL 詳細オプション]**，入力 `51`. これにより、ルールが `all pages - library loaded - send event - 50` ベースライン XDM を **[!UICONTROL 変数を更新]** アクションタイプ。

   ![Analytics レポートスイートの上書き](assets/set-up-analytics-rs-override.png)

1. の下 **[!UICONTROL 条件]**&#x200B;を選択して、 **[!UICONTROL 追加]**

1. 終了 **[!UICONTROL 論理タイプ]** as **[!UICONTROL 標準]**

1. 終了 **[!UICONTROL 拡張機能]** as **[!UICONTROL コア]**

1. 選択 **[!UICONTROL 条件タイプ]** as **[!UICONTROL Path Without Query String]**

1. 右側で、 **[!UICONTROL Regex]** 無効の切り替え

1. の下 **[!UICONTROL パスが次と等しい]** 設定 `/content/luma/us/en.html`. Luma デモサイトの場合、ルールはホームページ上のトリガーのみを確認します。

1. 選択 **[!UICONTROL 変更を保持]**

   ![Analytics レポートスイートの上書き条件](assets/set-up-analytics-override-condition.png)

1. の下 **[!UICONTROL アクション]** 選択 **[!UICONTROL 追加]**

1. を **[!UICONTROL 拡張]**&#x200B;を選択します。 **[!UICONTROL Adobe Experience Platform Web SDK]**

1. を **[!UICONTROL アクションタイプ]**&#x200B;を選択します。 **[!UICONTROL イベントの送信]**

1. を **[!UICONTROL タイプ]**&#x200B;を選択します。 `web.webpagedetails.pageViews`

1. を **[!UICONTROL XDM データ]**&#x200B;を選択し、 `xdm.variable.content` 次の場所で作成した [データ要素の作成](create-data-elements.md) レッスン

   ![Analytics データストリームの上書き](assets/set-up-analytics-datastream-override-1.png)

1. 下にスクロールして、 **[!UICONTROL データストリーム設定の上書き]** セクション

1. を残します。 **[!UICONTROL 開発]** 」タブが選択されています。

   >[!TIP]
   >
   >    このタブでは、上書きを行うタグ環境を決定します。 この抜粋では、開発環境のみを指定しますが、これを実稼動環境にデプロイする場合は、でも忘れずに実行してください。 **[!UICONTROL 実稼動]** 環境。


1. を選択します。 **[!UICONTROL Datastream]**（この場合） `Luma Web SDK: Development Environment`

1. の下 **[!UICONTROL レポートスイート]**&#x200B;に設定し、上書きに使用するレポートサイトを選択します。 この場合は、`tmd-websdk-course-stg`です。

1. 選択 **[!UICONTROL 変更を保持]**

1. および **[!UICONTROL 保存]** ルール

   ![Analytics データストリームの上書き](assets/analytics-tags-report-suite-override.png)



## 開発環境の構築

新しいデータ要素とルールを `Luma Web SDK Tutorial` タグライブラリを追加し、開発環境を再構築します。

おめでとうございます。次の手順では、Experience PlatformWeb SDK を使用してAdobe Analyticsの実装を検証します。

## Adobe Analytics for Platform Web SDK の検証

Adobe Analytics の [デバッガー](validate-with-debugger.md) レッスンでは、Platform Debugger とブラウザーの開発者コンソールを使用して、クライアント側の XDM リクエストを検査する方法を学びました。これは、 `AppMeasurement.js` Analytics の実装。 また、Adobeアプリケーションに送信される Platform Edge Network サーバー側リクエストの検証と、Assurance を使用した完全に処理されたペイロードの表示方法についても学習しました。

Experience PlatformWeb SDK を使用して Analytics がデータを適切にキャプチャしていることを検証するには、次の 2 つの手順に従う必要があります。

1. Platform Edge Network 上の XDM オブジェクトによってデータが処理される方法を検証するには、Experience Platformデバッガーの Edge Trace 機能を使用します。
1. 処理ルールとリアルタイムレポートを使用して、Analytics でのデータの処理方法を検証します
1. Adobe Experience Platform Assurance を使用して、Analytics でデータが完全に処理される方法を検証する

### エッジトレースを使用

Experience Platformデバッガーの Edge Trace 機能を使用して、Adobe Analyticsが ECID、ページビュー、製品文字列、e コマースイベントを取り込んでいることを検証する方法について説明します。

### Experience CloudID の検証

1. 次に移動： [Luma デモサイト](https://luma.enablementadobe.com/content/luma/us/en.html){target="_blank"}
1. 右上のログインボタンを選択し、資格情報 u: test@adobe.com p: test を使用して認証します。
1. デバッガーを開き、Experience Platformを開きます。 [サイトのタグプロパティを独自の開発プロパティに切り替える](validate-with-debugger.md#use-the-experience-platform-debugger-to-map-to-your-tags-property)


1. エッジトレースを有効にするには、「Experience Platformデバッガー」に移動し、左側のナビゲーションでを選択します。 **[!UICONTROL ログ]**&#x200B;を選択し、 **[!UICONTROL Edge]** 「 」タブで「 」を選択します。 **[!UICONTROL 接続]**

   ![エッジトレースを接続](assets/analytics-debugger-edgeTrace.png)

1. 現時点では空になります

   ![接続エッジトレース](assets/analytics-debugger-edge-connected.png)

1. Luma ページを更新し、「Experience Platformデバッガー」を再度オンにします。データが表示されます。 次で始まる行 **[!UICONTROL Analytics 自動マッピング]** はAdobe Analyticsビーコンです
1. を選択して、両方の `[!UICONTROL mappedQueryParams]` ドロップダウンと、Analytics 変数を表示する 2 番目のドロップダウン

   ![Analytics ビーコンの Edge Trace](assets/analytics-debugger-edge-analytics.png)

   >[!TIP]
   >
   >2 番目のドロップダウンは、データの送信先の Analytics レポートスイート ID に対応しています。 スクリーンショットに示されているレポートスイートではなく、お客様独自のレポートスイートと一致する必要があります。

1. 下にスクロールして検索 `[!UICONTROL c.a.x.identitymap.ecid.[0].id]`. ECID を取り込むコンテキストデータ変数です。
1. Analytics が表示されるまで下にスクロールし続けます `[!UICONTROL mid]` 変数を使用します。 両方の ID がデバイスのExperience CloudID と一致します。
1. Luma サイトで、

   ![Analytics ECID](assets/analytics-debugger-ecid.png)

   >[!NOTE]
   >
   >ログインしているので、認証済み ID を検証するために少し時間をかけます `112ca06ed53d3db37e4cea49cc45b71e` （ユーザー向け） **`test@adobe.com`** は、 `[!UICONTROL c.a.x.identitymap.lumacrmid.[0].id]`

### レポートスイートの上書き

上で、 [Luma のホームページ](https://luma.enablementadobe.com/content/luma/us/en.html).  この設定を検証するには、以下を実行します。

1. 次を含む行を探します。 **[!UICONTROL 上書き後のデータストリーム設定が適用されました]**. ここには、プライマリレポートスイートと、レポートスイートの上書き用に設定された追加のレポートスイートが表示されます。

   ![Analytics レポートスイート上書きリストの検証](assets/aep-debugger-datastream-override.png)

1. 次で始まる行まで下にスクロールします。 **[!UICONTROL Analytics 自動マッピング]**  そして確認し `[!UICONTROL reportSuiteIds]` 上書き設定で指定したレポートスイートを表示します

   ![Analytics レポートスイートによる呼び出しの検証の上書き](assets/aep-debugger-analytics-report-suite-override.png)

### コンテンツページビュー数

次のような製品ページに移動します。 [Didi Sport Watch 製品ページ](https://luma.enablementadobe.com/content/luma/us/en/products/gear/watches/didi-sport-watch.html#24-WG02).  コンテンツページビューが Analytics によって取り込まれたことを検証します。

1. を探す `[!UICONTROL c.a.x.web.webpagedetails.pageviews.value]=1`.
1. 下にスクロールして、 `[!UICONTROL gn]` 変数を使用します。 これは、Analytics の動的構文で、 `[!UICONTROL s.pageName]` 変数を使用します。 データレイヤーからページ名を取り込みます。

   ![Analytics 製品文字列](assets/analytics-debugger-edge-page-view.png)

### 製品文字列および e コマースイベント

既に製品ページを使用しているので、この演習では、引き続き同じ Edge Trace を使用して、Analytics によって製品データがキャプチャされたことを検証します。 製品文字列イベントと e コマースイベントの両方が、XDM 変数を Analytics に自動的にマッピングします。 適切な `productListItem` XDM 変数を [Adobe Analytics用の XDM スキーマの設定](setup-analytics.md#configure-an-xdm-schema-for-adobe-analytics)を使用する場合、Platform Edge Network は、適切な分析変数へのデータのマッピングを処理します。

**最初に、 `Product String` 設定済み**

1. を探す `[!UICONTROL c.a.x.productlistitems.][0].[!UICONTROL sku]`. 変数は、 `productListItems.item1.sku` このレッスンの前の
1. また、 `[!UICONTROL c.a.x.productlistitems.][0].[!UICONTROL _experience.analytics.customdimensions.evars.evar1]`. 変数は、マッピング先のデータ要素の値を取得します `productListItems.item1._experience.analytics.customdimensions.evars.evar1`
1. 下にスクロールして、 `[!UICONTROL pl]` 変数を使用します。 これは、Analytics 製品文字列変数の動的構文です。
1. データレイヤーの製品名は、 `[!UICONTROL c.a.x.productlistitems.][0].[!UICONTROL sku]` そして `[!UICONTROL product]` 製品文字列のパラメーター。  さらに、データレイヤーの製品タイトルが製品文字列のマーチャンダイジング evar1 にマッピングされます。

   ![Analytics 製品文字列](assets/analytics-debugger-prodstring.png)

   Edge Trace はを処理します。 `commerce` ～とは少し異なるイベント `productList` ディメンション。 マッピングされた製品名を確認するのと同じ方法でマッピングされたコンテキストデータ変数が表示されません `[!UICONTROL c.a.x.productlistitem.[0].name]` 上記の 代わりに、Edge Trace は Analytics で最終的なイベントの自動マッピングを表示します `event` 変数を使用します。 適切な XDM にマッピングしている限り、Platform Edge Network はそれに応じてマッピングします `commerce` 変数 [Adobe Analytics用のスキーマの設定](setup-analytics.md#configure-an-xdm-schema-for-adobe-analytics)；この場合、 `commerce.productViews.value=1`.

1. 「Experience Platformデバッガー」ウィンドウに戻り、 `[!UICONTROL events]` 変数の場合は、に設定されます。 `[!UICONTROL prodView]`

1. また、 `[!UICONTROL c.a.x.eventType]` が `commerce.productViews` 製品ページに表示されているので。

   >[!TIP]
   >
   > The `ecommerce - pdp library loaded - AA (order 20)` ルールは `eventType` 設定元 `all pages global content variables - library loaded - AA (order 1)` ルールを設定します ( シーケンスの後半でトリガーに設定されます )。


   ![Analytics 製品表示](assets/analytics-debugger-prodView.png)

**残りの e コマースイベントと製品文字列が Analytics に設定されていることを検証します。**

1. 追加 [Didi Sport Watch](https://luma.enablementadobe.com/content/luma/us/en/products/gear/watches/didi-sport-watch.html#24-WG02) カートに
1. 次に移動： [買い物かごページ](https://luma.enablementadobe.com/content/luma/us/en/user/cart.html), Edge Trace for をチェックします

   * `eventType` を `commerce.productListViews` に設定
   * `[!UICONTROL events: "scView"]`、および
   * 製品文字列が設定される

   ![Analytics 買い物かご表示](assets/analytics-debugger-cartView.png)

1. チェックアウトに進み、 Edge Trace for を確認します。

   * `eventType` を `commerce.checkouts` に設定
   * `[!UICONTROL events: "scCheckout"]`、および
   * 製品文字列が設定される

   ![Analytics チェックアウト](assets/analytics-debugger-checkout.png)

1. 次の項目だけを入力します。 **名** および **姓** 配送先フォームのフィールドと、 **続行**. 次のページで、 **発注**
1. 確認ページで、「Edge Trace for 」をオンにします。

   * `eventType` を `commerce.purchases` に設定
   * 設定中の購入イベント `[!UICONTROL events: "purchase"]`
   * 設定中の通貨コード変数 `[!UICONTROL cc: "USD"]`
   * で設定されている購入 ID `[!UICONTROL pi]`
   * 製品文字列 `[!UICONTROL pl]` 製品名、数量および価格の設定

   ![Analytics の購入](assets/analytics-debugger-purchase.png)



## Adobe Experience Platform Assurance を使用したAdobe Analyticsの検証

Adobe Experience Platform Assurance は、Adobe Experience Cloudがデータを収集し、Web サイトやモバイルアプリケーションでエクスペリエンスを提供する方法を調査、配達確認、シミュレーション、検証する際に役立つ製品です。

上記では、Adobe Analytics Debugger の Edge Trace 機能を使用して、ECID、ページビュー、製品文字列、e コマースイベントを取り込むことを検証しました。  また、処理ルールとリアルタイムレポートを使用して、prop1 のマッピングを検証しました。  次に、Adobe Experience Platform Assurance を使用して、これらの同じイベントを検証します。

>[!NOTE]
>
>Adobe Experience Platform Assurance を使用してAdobe Analyticsデータを検証するには、次の手順を実行する必要があります [Adobe Experience Platform Assurance へのユーザーアクセスを有効にする](https://experienceleague.adobe.com/docs/experience-platform/assurance/user-access.html)

### Adobe Experience Platform Assurance にアクセス

アシュランスにアクセスするには、いくつかの方法があります。

1. Adobe Experience Platformインターフェイスを使用
1. Adobe Experience Platform Data Collection インターフェイスを使用する
1. Adobe Experience Platform Debugger内のログ（推奨）

Adobe Experience Platformからアシュランスにアクセスするには、下にスクロールしてを選択します。 **[!UICONTROL アシュランス]** の下の左側のレールナビゲーションで、 **[!UICONTROL データ収集]**.  を選択します。 **[!UICONTROL &quot;Web SDK チュートリアル 3&quot;]** セッションを使用して、前の節で生成したイベントにアクセスする必要があります。
![Adobe Experience Platformを通じたアシュランス](assets/assurance-open-aep.png)

Adobe Experience Platformのデータ収集を通じてアシュランスにアクセスするには、 **[!UICONTROL アシュランス]** の下の左側のレールナビゲーションで、 **[!UICONTROL データ収集]**.  を選択します。 **[!UICONTROL &quot;Web SDK チュートリアル 3&quot;]** セッションを使用して、前の節で生成したイベントにアクセスする必要があります。\
![Adobe Experience Platform Data Collection を通じたアシュランス](assets/assurance-open-data-collection.png)

Adobe Experience Platform Debuggerからアシュランスにアクセスするには、Experience Platformデバッガーに移動し、左側のナビゲーションでを選択します。 **[!UICONTROL ログ]**&#x200B;を選択し、 **[!UICONTROL Edge]** 「 」タブで「 」を選択します。 **[!UICONTROL 接続]**.  Edge ネットワークへの接続が確立されたら、外部リンクアイコンを選択します。 現在デバッガーから Web セッションを開始する必要があるので、デバッガーからアシュランスにアクセスすることをお勧めします。
![Adobe Experience Platform Data Collection を通じたアシュランス](assets/assurance-open-aep-debugger.png)

内 **[!UICONTROL &quot;Web SDK チュートリアル 3&quot;]** アシュランスセッションの開始 **[!UICONTROL &quot;hitdebugger&quot;]** をイベント検索バーに追加して、結果を Analytics の後処理されたAdobeにフィルタリングします。
![アシュランスAdobe分析後処理済みデータ](assets/assurance-hitdebugger.png)

### Experience Cloudを使用したアシュランス ID の検証

Adobe Analyticsが ECID をキャプチャしていることを検証するには、ビーコンを選択し、「ペイロード」を開きます。  このビーコンのベンダーは、次のようになります。 **[!UICONTROL com.adobe.analytics.hitdebugger]**
![Adobe Analytics Assurance を使用した検証](assets/assurance-hitdebugger-payload.png)

次に、下にスクロールして **[!UICONTROL mcvisId]** ECID が正しく取り込まれたことを検証するには、以下を実行します。
![Experience Cloudを使用したアシュランス ID の検証](assets/assurance-hitdebugger-mcvisId.png)

### アシュランスを使用したコンテンツページビューの検証

同じビーコンを使用して、コンテンツページビューが正しいAdobe Analytics変数にマッピングされていることを検証します。
下にスクロールして **[!UICONTROL pageName]** 検証するには `Page Name` が正しくキャプチャされている
![アシュランスを使用したページ名の検証](assets/assurance-hitdebugger-content-pagename.png)

### アシュランスを使用した製品文字列および e コマースイベントの検証

上記のExperience Platformデバッガーで検証する際に使用したのと同じ検証ユースケースに従い、引き続き同じビーコンを使用して `Ecommerce Events` そして `Product String`.

1. ペイロードを探します。 **[!UICONTROL イベント]** 次を含む `prodView`
   ![アシュランスを使用した製品文字列の検証](assets/assurance-hitdebugger-prodView-event.png)
1. 下にスクロールして **[!UICONTROL product-string]** 検証するには `Product String`.
   * 次の点に注意してください。 `Product SKU` および `Merchandizing eVar1`.
1. 下にスクロールし、 `prop1`（前の節の処理ルールを使用して設定した）には、 `Product SKU`\
   ![アシュランスを使用したマーチャンダイジング変数の検証を含む製品文字列](assets/assurance-hitdebugger-prodView-productString-merchVar.png)

引き続き、買い物かご、チェックアウト、購入イベントを確認して、実装を検証します。

1. ペイロードを探します。 **[!UICONTROL イベント]** 次を含む `scView` 製品文字列を検証します。
   ![アシュランスを使用した製品文字列の検証](assets/assurance-hitdebugger-scView-event.png)
1. ペイロードを探します。 **[!UICONTROL イベント]** 次を含む `scCheckout` 製品文字列を検証します。
   ![アシュランスを使用した製品文字列の検証](assets/assurance-hitdebugger-scView-event.png)
1. ペイロードを探します。 **[!UICONTROL イベント]** 次を含む `purchase`
   ![アシュランスを使用した製品文字列の検証](assets/assurance-hitdebugger-purchase-event.png)
1. 検証時に、 `purchase` イベントの場合は、 `Product String` には、 `Product SKU`, `Product Quantity` 、および `Product Total Price`.
1. また、 `purchase` を検証します。 `purchase-id` および/または `purchaseId` 設定済み


おめでとうございます。やった！ これでレッスンが終了し、独自の Web サイト用にAdobe Analytics Platform Web SDK を実装する準備が整いました。

[次へ： ](setup-audience-manager.md)

>[!NOTE]
>
>Adobe Experience Platform Web SDK の学習に時間を割いていただき、ありがとうございます。 ご質問がある場合、一般的なフィードバックを共有したい場合、または今後のコンテンツに関する提案がある場合は、こちらで共有してください [Experience Leagueコミュニティディスカッション投稿](https://experienceleaguecommunities.adobe.com/t5/adobe-experience-platform-launch/tutorial-discussion-implement-adobe-experience-cloud-with-web/td-p/444996)
