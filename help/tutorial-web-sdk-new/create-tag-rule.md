---
title: タグルールの作成
description: タグルールを使用して、XDM オブジェクトを使用して Platform Edge Network にイベントを送信する方法を説明します。 このレッスンは、「 Adobe Experience Cloudと Web SDK の実装」チュートリアルの一部です。
feature: Tags
source-git-commit: 26545b660b70daf4296ec2afbc067065f77def01
workflow-type: tm+mt
source-wordcount: '2025'
ht-degree: 2%

---

# タグルールの作成

タグルールを使用して、XDM オブジェクトを使用して Platform Edge Network にイベントを送信する方法を説明します。 タグルールは、タグプロパティに何らかの処理を指示するイベント、条件およびアクションを組み合わせたものです。 Platform Web SDK では、ルールを使用して、適切な XDM フィールドを持つ Platform Edge Network にイベントを送信します。

>[!NOTE]
>
> デモ用に、このレッスンの演習は、前のレッスンに基づいて構築され、 [Luma デモサイト](https://luma.enablementadobe.com/content/luma/us/en.html){target="_blank"}.


## 学習内容

このレッスンを最後まで学習すると、次のことが可能になります。

* タグ内のルールを管理するための命名規則を使用する
* 「変数を更新」アクションと「イベントを送信」アクションを使用して、XDM フィールドでイベントを送信します
* 複数のルールをまたいで複数の XDM フィールドセットを積み重ねる
* 個々のデータ要素または配列全体のデータ要素を XDM オブジェクトにマッピングする
* 開発ライブラリへのタグルールの公開


## 前提条件

データ収集タグと [Luma デモサイト](https://luma.enablementadobe.com/content/luma/us/en.html) チュートリアルの前のレッスンを完了していること。

* [XDM スキーマの設定](configure-schemas.md)
* [ID 名前空間の設定](configure-identities.md)
* [データストリームの設定](configure-datastream.md)
* [Web SDK 拡張機能のインストール](install-web-sdk.md)
* [データ要素の作成](create-data-elements.md)
* [ID の作成](create-identities.md)

## 命名規則

タグ内のルールの管理を強化するには、標準の命名規則に従うことをお勧めします。 このチュートリアルでは、次の 5 つの部分で構成される命名規則を使用します。

* [**場所**] - [**イベント**] - [**目的**] - [**ツール**] - [**注文**]

そこで

1. **場所** は、ルールが実行されるサイトのページです
1. **イベント** は、ルールのトリガーです
1. **目的** は、ルールで実行される主なアクションです
1. **ツール** は、そのルールのアクションステップで使用される特定のアプリケーションまたはアプリケーションです。Web SDK ではまれに使用されます
1. **シーケンス** は、他のルールとの関連でルールを実行する順序です
<!-- minor update -->

## タグルールの作成

タグでは、ルールは、様々な条件でアクション（呼び出しの実行）を実行するために使用されます。 Platform Web SDK Tags 拡張機能には、このレッスンで使用する 2 つのアクションが含まれています。

* **[!UICONTROL 変数を更新]** データ要素を XDM フィールドにマッピングします。
* **[!UICONTROL イベントの送信]** は XDM オブジェクトを Network EdgeExperience Platformに送信します。

このレッスンの残りの部分では、以下をおこないます。

1. XDM フィールドの「グローバル設定」を定義するルールの作成 ( [!UICONTROL 変数を更新] を使用して、Web サイトのすべてのページ（ページ名など）に送信する **[!UICONTROL 変数を更新]** アクション。

1. 「グローバル設定」を上書きする追加のルールを作成するか、追加の XDM フィールドを投稿します ( [!UICONTROL 変数を更新] （再び）) と同じで、特定の条件（製品のページに製品の詳細を追加するなど）でのみ関連します。

1. を使用して別のルールを作成します。 **[!UICONTROL イベントの送信]** 完全な XDM オブジェクトをAdobe Experience Platform Edge Network に送信するアクション。

これらのルールはすべて、[!UICONTROL 注文]&quot;オプション。

このビデオでは、プロセスの概要を説明します。

>[!VIDEO](https://video.tv.adobe.com/v/3427710/?learn=on)

### 変数ルールの更新

#### グローバル設定

グローバル XDM フィールドのタグルールを作成するには：

1. このチュートリアルで使用するタグプロパティを開きます。

1. に移動します。 **[!UICONTROL ルール]** 左のナビゲーションで

1. を選択します。 **[!UICONTROL 新規ルールの作成]** ボタン

   ![ルールの作成](assets/rules-create.png)

1. ルール名を設定します。`all pages - library loaded - set global variables - 1`

1. Adobe Analytics の **[!UICONTROL イベント]** セクション、選択 **[!UICONTROL 追加]**

   ![ルールに名前を付けてイベントを追加する](assets/rule-name-new.png)

1. 以下を使用します。 **[!UICONTROL Core 拡張機能]** を選択し、 **[!UICONTROL 読み込まれたライブラリ（ページ上部）]** として **[!UICONTROL イベントタイプ]**

1. 選択 **[!UICONTROL 詳細]** ドロップダウンと入力 `1` として **[!UICONTROL 注文]**

   >[!NOTE]
   >
   > 順序の数が低いほど、早く実行されます。 したがって、「グローバル設定」には低い順番を付けます。

1. 選択 **[!UICONTROL 変更を保持]** メインのルール画面に戻るには
   ![「Select Library Loaded」トリガー](assets/create-tag-rule-trigger-bottom.png)

1. Adobe Analytics の **[!UICONTROL アクション]** セクション、選択 **[!UICONTROL 追加]**

1. を **[!UICONTROL 拡張]**&#x200B;を選択します。 **[!UICONTROL Adobe Experience Platform Web SDK]**

1. を **[!UICONTROL アクションタイプ]**&#x200B;を選択します。 **[!UICONTROL 変数を更新]**

1. を **[!UICONTROL データ要素]**&#x200B;を選択し、 `xdm.variable.content` 次の場所で作成した [データ要素の作成](create-data-elements.md) レッスン

   ![変数スキーマを更新](assets/create-rule-update-variable.png)

次に、 [!UICONTROL データ要素] から [!UICONTROL スキーマ] XDM オブジェクトで使用されます。

>[!NOTE]
> 
> 個々のプロパティまたはオブジェクト全体にマップできます。 この例では、個々のプロパティにマッピングします。

1. 「 eventType 」フィールドを見つけて選択します。

1. 値を入力 `web.webpagedetails.pageViews`

   >[!TIP]
   >
   > に入力する値を理解するには、以下を実行します。 `eventType` 」フィールドに値を入力するには、スキーマページに移動して、 `eventType` 「 」フィールドを使用して、右側のパネルに推奨値を表示します。 必要に応じて、新しい値を入力することもできます。
   > ![eventType スキーマページで推奨される値](assets/create-tag-rule-eventType.png)

1. 次に、 `identityMap` オブジェクトを選択して選択します。

1. にマッピング `identityMap.loginID` データ要素

   ![変数 ID マップを更新](assets/create-rule-variable-identityMap.png)


   >[!TIP]
   >
   > データ要素が null の場合、XDM フィールドはネットワークリクエストに含まれません。 したがって、ユーザーが認証されていない場合、また `identityMap.loginID` データ要素が null の場合、 `identityMap` オブジェクトは送信されません。 これが、「グローバル設定」で定義できる理由です。

1. 下にスクロールして、 **`web`** object

1. 選択して開きます。

1. 次のデータ要素を、対応する `web` XDM 変数

   * **`web.webPageDetials.name`**&#x200B;コピー先：`%page.pageInfo.pageName%`
   * **`web.webPageDetials.server`**&#x200B;コピー先：`%page.pageInfo.server%`
   * **`web.webPageDetials.siteSection`**&#x200B;コピー先：`%page.pageInfo.hierarchie1%`

1. `web.webPageDetials.pageViews.value` を `1` に設定します。

   ![変数コンテンツを更新](assets/create-rule-xdm-variable-content.png)

   >[!TIP]
   >
   > 一方でも `eventType` に設定 `web.webpagedetails.pageViews` nor `web.webPageDetials.pageViews.value` は、Adobe Analyticsでビーコンをページビューとして処理するために必要です。他のダウンストリームアプリケーションのページビューを示す標準的な方法が役立ちます。


1. 選択 **[!UICONTROL 変更を保持]** その後 **[!UICONTROL 保存]** ルールの作成を終了するための次の画面のルール


#### 製品ページのフィールド

次に、使用を開始します。 **[!UICONTROL 変数を更新]** をに送信する前に XDM オブジェクトをエンリッチメントするための順番付きルールを追加しました。 [!UICONTROL Platform Edge Network].

>[!TIP]
>
>ルールの順序は、イベントがトリガーされたときに最初に実行されるルールを決定します。 2 つのルールのイベントタイプが同じ場合、一番小さい数のルールが最初に実行されます。
> 
>![rule-order](assets/set-up-analytics-sequencing.png)

まず、Luma の製品の詳細ページで製品表示を追跡します。

1. 選択 **[!UICONTROL ルールを追加]**
1. 名前を付ける  [!UICONTROL `ecommerce - library loaded - set product details variables - 20`]
1. を選択します。 ![+記号](https://spectrum.adobe.com/static/icons/workflow_18/Smock_AddCircle_18_N.svg) イベントの下で新しいトリガーを追加
1. の下 **[!UICONTROL 拡張]**&#x200B;を選択します。 **[!UICONTROL コア]**
1. の下 **[!UICONTROL イベントタイプ]**&#x200B;を選択します。 **[!UICONTROL 読み込まれたライブラリ（ページ上部）]**
1. 選択して開く **[!UICONTROL 詳細オプション]**，入力 `20`. これにより、ルールが `all pages - library loaded - set global variables - 1` グローバル設定を設定する

   ![Analytics XDM ルール](assets/set-up-analytics-pdp.png)

1. の下 **[!UICONTROL 条件]**&#x200B;を選択して、 **[!UICONTROL 追加]**
1. 終了 **[!UICONTROL 論理タイプ]** as **[!UICONTROL 標準]**
1. 終了 **[!UICONTROL 拡張]** as **[!UICONTROL コア]**
1. 選択 **[!UICONTROL 条件タイプ]** as **[!UICONTROL Path Without Query String]**
1. 右側で、 **[!UICONTROL Regex]** トグル
1. の下 **[!UICONTROL パスが次と等しい]** 設定 `/products/`. Luma デモサイトの場合、ルールは製品ページ上のトリガーのみを確認します。
1. 選択 **[!UICONTROL 変更を保持]**

   ![Analytics XDM ルール](assets/set-up-analytics-product-condition.png)

1. の下 **[!UICONTROL アクション]** 選択 **[!UICONTROL 追加]**
1. 選択 **[!UICONTROL Adobe Experience Platform Web SDK]** 拡張
1. 選択 **[!UICONTROL アクションタイプ]** as **[!UICONTROL 変数を更新]**
1. 下にスクロールして、 `commerce` object
1. を開きます。 **[!UICONTROL productViews]** オブジェクトとセット **[!UICONTROL 値]** から `1`

   ![製品表示のセットアップ](assets/set-up-analytics-prodView.png)

   >[!TIP]
   >
   >XDM で commerce.productViews.value=1 を設定すると、 `prodView` Analytics のイベント

1. 下にスクロールして `eventType` を設定し、 `commerce.productViews`

   >[!NOTE]
   >
   >このルールの順序は高いので、 `eventType` 「グローバル設定」ルールで設定します。 `eventType` には 1 つの値のみを含めることができます。最も大きい値のイベントを使用して設定することをお勧めします。

1. 下にスクロールして、「 」を選択します。 `productListItems` 配列
1. 選択 **[!UICONTROL 個々の項目を指定]**
1. 選択 **[!UICONTROL 項目を追加]**

   ![製品表示イベントを設定しています](assets/set-up-analytics-xdm-individual.png)

   >[!CAUTION]
   >
   >The **`productListItems`** は `array` データ型を使用することをお勧めします。 Luma デモサイトのデータレイヤー構造と、Luma サイトでは一度に 1 つの製品のみ表示できるので、項目を個別に追加します。 独自の Web サイトにを実装する場合、データレイヤーの構造に応じて、配列全体を提供できる場合があります。

1. 選択して開く **[!UICONTROL 項目 1]**
1. **`productListItems.item1.SKU`** を `%product.productInfo.sku%` にマッピングします

   ![製品 SKU XDM オブジェクト変数](assets/set-up-analytics-sku.png)

1. 選択 **[!UICONTROL 変更を保持]**

1. 選択 **[!UICONTROL 保存]** ルールを保存するには


#### 買い物かごのフィールド

配列が XDM スキーマの形式と一致する場合は、配列全体を XDM オブジェクトにマッピングできます。 カスタムコードデータ要素 `cart.productInfo` 以前のループを作成した場合は、 `digitalData.cart.cartEntries` Luma 上のデータレイヤーオブジェクトを作成し、 `productListItems` XDM スキーマのオブジェクト。

例として、Luma サイトのデータレイヤー（左）と翻訳済みのデータ要素（右）の比較を参照してください。

![XDM オブジェクト配列の形式](assets/data-element-xdm-array.png)

データ要素との比較 `productListItems` 構造（ヒント、一致する必要があります）。

>[!IMPORTANT]
>
>数値変数の変換方法に注意してください。データレイヤーには次のような文字列値があります。 `price` および `qty` データ要素の数値の形式に戻しました。 これらの形式の要件は、Platform のデータの整合性に重要で、 [スキーマの設定](configure-schemas.md) 手順 この例では、 **[!UICONTROL 量]** は **[!UICONTROL 整数]** データタイプ。
> ![XDM スキーマのデータタイプ](assets/set-up-analytics-quantity-integer.png)

次に、配列を XDM オブジェクトにマッピングします。


1. という名前の新しいルールを作成します。 `ecommerce - library loaded - set shopping cart variables - 20`
1. を選択します。 ![+記号](https://spectrum.adobe.com/static/icons/workflow_18/Smock_AddCircle_18_N.svg) イベントの下で新しいトリガーを追加
1. の下 **[!UICONTROL 拡張]**&#x200B;を選択します。 **[!UICONTROL コア]**
1. の下 **[!UICONTROL イベントタイプ]**&#x200B;を選択します。 **[!UICONTROL 読み込まれたライブラリ（ページ上部）]**
1. 選択して開く **[!UICONTROL 詳細オプション]**，入力 `20`
1. 選択 **[!UICONTROL 変更を保持]**

   ![Analytics XDM ルール](assets/set-up-analytics-cart-sequence.png)

1. の下 **[!UICONTROL 条件]**&#x200B;を選択して、 **[!UICONTROL 追加]**
1. 終了 **[!UICONTROL 論理タイプ]** as **[!UICONTROL 標準]**
1. 終了 **[!UICONTROL 拡張機能]** as **[!UICONTROL コア]**
1. 選択 **[!UICONTROL 条件タイプ]** as **[!UICONTROL Path Without Query String]**
1. 右側に **しない** 有効にする **[!UICONTROL Regex]** トグル
1. の下 **[!UICONTROL パスが次と等しい]** 設定 `/content/luma/us/en/user/cart.html`. Luma デモサイトの場合、ルールは買い物かごページ上のトリガーのみを確認します。
1. 選択 **[!UICONTROL 変更を保持]**

   ![Analytics XDM ルール](assets/set-up-analytics-cart-condition.png)

1. の下 **[!UICONTROL アクション]** 選択 **[!UICONTROL 追加]**
1. 選択 **[!UICONTROL Adobe Experience Platform Web SDK]** 拡張
1. 選択 **[!UICONTROL アクションタイプ]** as **[!UICONTROL 変数を更新]**
1. 下にスクロールして、 `commerce` オブジェクトを選択して開きます。
1. を開きます。 **[!UICONTROL productListViews]** オブジェクトとセット **[!UICONTROL 値]** から `1`

   ![製品表示のセットアップ](assets/set-up-analytics-cart-view.png)

   >[!TIP]
   >
   >XDM で commerce.productListViews.value=1 を設定すると、 `scView` Analytics のイベント

1. 選択 `eventType` に設定し、 `commerce.productListViews`

1. 下にスクロールして、「 」を選択します。 **[!UICONTROL productListItems]** 配列

1. 選択 **[!UICONTROL アレイ全体を提供]**

1. マッピング先 **`cart.productInfo`** データ要素

1. 選択 **[!UICONTROL 変更を保持]**

1. 選択 **[!UICONTROL 保存]** ルールを保存するには

以下の違いを持つ同じパターンに従って、他の 2 つのチェックアウトと購入のルールを作成します。

**ルール名**: `ecommerce  - library loaded - set checkout variables - 20`

1. **[!UICONTROL 条件]**: /content/luma/us/en/user/checkout.html
1. `eventType` を `commerce.checkouts` に設定します。
1. `commerce.checkout.value` を `1` に設定します。

   >[!TIP]
   >
   >これは、 `scCheckout` Analytics のイベント


**ルール名**: `ecommerce - library loaded - set purchase variables -  20`

1. **[!UICONTROL 条件]**: /content/luma/us/en/user/checkout/order/thank-you.html
1. `eventType` を `commerce.purchases` に設定します。
1. `commerce.purchases.value` を `1` に設定します。

   >[!TIP]
   >
   >これは、 `purchase` Analytics のイベント

1. 設定 `commerce.order.purchaseID` から `cart.orderId` データ要素
1. 設定 `commerce.order.currencyCode` をハードコードされた値に `USD`

   ![Analytics 用の purchaseID の設定](assets/set-up-analytics-purchase.png)

   >[!TIP]
   >
   >これは、 `s.purchaseID` および `s.currencyCode` Analytics の変数

1. 下にスクロールして、「 」を選択します。 **[!UICONTROL productListItems]** 配列
1. 選択 **[!UICONTROL アレイ全体を提供]**
1. マッピング先 **`cart.productInfo.purchase`** データ要素
1. 「**[!UICONTROL 保存]**」を選択します

完了したら、次のルールが作成されます。

![Analytics XDM ルール](assets/set-up-analytics-rules.png)


### イベントルールを送信

これで変数を設定したので、ルールを作成して、完全な XDM オブジェクトを、 **[!UICONTROL イベントを送信]** アクション。

1. 右側で、「 」を選択します。 **[!UICONTROL ルールを追加]** 別の規則を作成するには

1. ルール名を設定します。`all pages - library loaded - set send event - 50`

1. Adobe Analytics の **[!UICONTROL イベント]** セクション、選択 **[!UICONTROL 追加]**

1. 以下を使用します。 **[!UICONTROL Core 拡張機能]** を選択し、 `Library Loaded (Page Top)` として **[!UICONTROL イベントタイプ]**

1. 選択 **[!UICONTROL 詳細]** ドロップダウンと入力 `50` in **[!UICONTROL 注文]**. これにより、最初に「トリガー」に設定したルールの後に、2 番目のルールトリガーが確実に適用されます。 `1`.

1. 選択 **[!UICONTROL 変更を保持]** メインのルール画面に戻るには
   ![「Select Library Loaded」トリガー](assets/create-tag-rule-trigger-bottom-send.png)

1. Adobe Analytics の **[!UICONTROL アクション]** セクション、選択 **[!UICONTROL 追加]**

1. を **[!UICONTROL 拡張]**&#x200B;を選択します。  **[!UICONTROL Adobe Experience Platform Web SDK]**

1. を  **[!UICONTROL アクションタイプ]**&#x200B;を選択します。  **[!UICONTROL イベントを送信]**

1. を **[!UICONTROL XDM]**&#x200B;を選択し、 `xdm.variable.content` 前のレッスンで作成したデータ要素

1. 選択 **[!UICONTROL 変更を保持]** メインのルール画面に戻るには

   ![「イベントを送信」アクションの追加](assets/create-rule-send-event-action.png)
1. 選択 **[!UICONTROL 保存]** ルールを保存するには

   ![ルールの保存](assets/create-rule-save-rule.png)

## ライブラリでのルールの公開

次に、ルールを開発環境に公開して、機能することを確認できます。

ライブラリを作成するには：

1. に移動します。 **[!UICONTROL 公開フロー]** 左のナビゲーションで

1. 選択 **[!UICONTROL ライブラリを追加]**

   ![「ライブラリを追加」を選択します。](assets/rule-publish-library.png)
1. の **[!UICONTROL 名前]**，と入力します。 `Luma Web SDK Tutorial`
1. の **[!UICONTROL 環境]**&#x200B;を選択します。 `Development`
1. 選択  **[!UICONTROL 変更されたリソースをすべて追加]**

   >[!NOTE]
   >
   >    前のレッスンで作成したすべてのタグコンポーネントが表示されます。 Core 拡張機能には、すべての Web タグプロパティで必要となる基本 JavaScript が含まれています。

1. 選択 **[!UICONTROL 開発用に保存およびビルド]**

   ![ライブラリの作成とビルド](assets/create-tag-rule-library-changes.png)

ライブラリのビルドには数分かかる場合があり、完了すると、ライブラリ名の左側に緑の点が表示されます。

![ビルドが完了しました](assets/create-rule-development-success.png)

ご覧のように [!UICONTROL 公開フロー] 画面、公開プロセスには、このチュートリアルの範囲外の多くの点があります。 このチュートリアルでは、開発環境で 1 つのライブラリを使用するだけです。

これで、Adobe Experience Platform Debuggerを使用して、リクエスト内のデータを検証する準備が整いました。

[次へ ](validate-with-debugger.md)

>[!NOTE]
>
>Adobe Experience Platform Web SDK の学習に時間を割いていただき、ありがとうございます。 ご質問がある場合、一般的なフィードバックを共有したい場合、または今後のコンテンツに関する提案がある場合は、こちらで共有してください [Experience Leagueコミュニティディスカッション投稿](https://experienceleaguecommunities.adobe.com/t5/adobe-experience-platform-launch/tutorial-discussion-implement-adobe-experience-cloud-with-web/td-p/444996)
