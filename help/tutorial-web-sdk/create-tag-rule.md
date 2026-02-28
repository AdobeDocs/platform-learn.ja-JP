---
title: Platform Web SDKのタグルールの作成
description: タグルールを使用して、XDM オブジェクトと共にイベントを Platform Edge Networkに送信する方法を説明します。 このレッスンは、「Web SDK を使用した Adobe Experience Cloud 実装のチュートリアル」の一部です。
feature: Tags
jira: KT-15403
exl-id: e06bad06-3ee3-475f-9b10-f0825a48a312
source-git-commit: 1feddab414a8a7e49f04b8886c275d06516d0114
workflow-type: tm+mt
source-wordcount: '1803'
ht-degree: 2%

---

# タグルールの作成

タグルールを使用して、XDM オブジェクトと共にAdobe Experience Platform Edge Networkにイベントを送信する方法を説明します。 タグルールは、イベント、条件、アクションを組み合わせたルールで、タグプロパティに対し、アクションの実行を指示します。 Platform Web SDKでは、ルールを使用して、適切なデータで Platform Edge Networkにイベントを送信します。



## 学習目標

このレッスンを終了すると、次の操作を実行できます。

* タグ内でルールを管理する際は、命名規則を使用します
* 「変数を更新」アクションと「イベントを送信」アクションを使用して XDM フィールドでイベントを送信
* 複数のルールをまたいで複数の XDM フィールドセットをスタックする
* 個々または全体の配列データ要素の XDM オブジェクトへのマッピング
* 開発ライブラリへのタグルールの公開


## 前提条件

データ収集タグと [Luma デモサイト ](https://newluma.enablementadobe.com) に精通し、チュートリアルの前のレッスンを完了しました。

* [XDM スキーマの設定](configure-schemas.md)
* [ID 名前空間の設定](configure-identities.md)
* [データストリームの設定](configure-datastream.md)
* [Web SDK 拡張機能のインストール](install-web-sdk.md)
* [データ要素の作成](create-data-elements.md)
* [ID の作成](create-identities.md)

## 命名規則

タグでルールを管理するには、標準の命名規則に従うことをお勧めします。 このチュートリアルでは、5 つのパートで構成される命名規則を使用します。

* [**location**] - [**event**] - [**purpose**] - [**order**]

ここで、

1. **location** は、ルールが実行されるサイトの 1 つ以上のページです
1. **event**：ルールのトリガー
1. **目的** は、ルールによって実行される主なアクションです
1. **order** は、他のルールに対して実行するルールの順序です
<!-- minor update -->

## Adobe クライアントデータレイヤー拡張機能を追加する

Luma の web サイトでは、Adobe Client Data Layer （ACDL）と呼ばれるイベント駆動型のデータレイヤーを使用しています。 イベントが発生すると、そのイベントが `adobeDataLayer` 配列にプッシュされます。 これらのイベントを使用してルールを作成しますが、多くの標準提供オプションがあります。

1. **[!UICONTROL 拡張機能]** に移動します。
1. **[!UICONTROL Adobe Client Data Layer]** にフィルタリング
1. 「**[!UICONTROL インストール]**」を選択します。

   ![Adobe クライアントデータレイヤー拡張機能を追加する ](assets/rules-acdl-extension.png)

1. デフォルト設定のままにします
1. 「**[!UICONTROL 保存]**」を選択します

## タグルールの作成

タグでは、ルールを使用して、様々な条件下でアクション（呼び出し実行）を実行します。 Platform Web SDK タグ拡張機能には、ルールで使用される 2 つのアクションが含まれています。

* **[!UICONTROL 変数を更新]** データ要素を XDM またはデータ変数にマッピングします
* **[!UICONTROL イベントを送信]** データをExperience Platform Edge Networkに送信します

このレッスンの残りの部分では、以下を行います。

1. **[!UICONTROL 変数を更新]** アクションを使用して、XDM フィールドの「グローバル設定」を定義します。

1. 「グローバル設定」をオーバーライドする **[!UICONTROL 変数を更新]** アクションを使用し、特定の条件下（例えば、製品ページに製品の詳細を追加する場合）で追加の XDM フィールドを追加します。

1. **[!UICONTROL イベントを送信]** アクションを使用して、Adobe Experience Platform Edge Networkに送信するすべてのデータを送信します。

これらのルールはすべて、「[!UICONTROL order]」オプションを使用して適切に順序付けされます。

このビデオでは、プロセスの概要を説明します。

>[!VIDEO](https://video.tv.adobe.com/v/3427710/?learn=on&enablevpops)

### グローバル設定フィールド

グローバル XDM フィールドのタグルールを作成するには：

1. このチュートリアルで使用するタグプロパティを開きます

1. 左側のナビゲーションで **[!UICONTROL ルール]** に移動します

1. 「**[!UICONTROL 新規ルールを作成]**」ボタンを選択します

   ![ ルールの作成 ](assets/rules-create.png)

1. ルール名を設定します。`all pages - adobeDataLayer push - set global variables - 1`

1. 「**[!UICONTROL イベント]**」セクションで、「**[!UICONTROL 追加]**」を選択します

   ![ ルールに名前を付けてイベントを追加する ](assets/rule-name-new.png)

1. **[!UICONTROL Adobe Client Data Layer]** 拡張機能を使用し、**[!UICONTROL Event Type]** として **[!UICONTROL Data Pushed]** を選択します

1. **[!UICONTROL 詳細]** ドロップダウンを選択し、「`1` 注文 **[!UICONTROL 」として]** と入力します

   >[!NOTE]
   >
   > 注文番号が小さいほど、早く実行されます。 したがって、「グローバル設定」には低い注文番号を付けます。

1. リッスン **[!UICONTROL すべてのイベント]**
1. 「**[!UICONTROL 変更を保持]**」を選択して、メインのルール画面に戻ります
   ![ ライブラリの読み込みトリガーを選択 ](assets/create-tag-rule-trigger-loaded.png)

1. 「**[!UICONTROL アクション]**」セクションで、「**[!UICONTROL 追加]**」を選択します

1. **[!UICONTROL Extension]** として、「**[!UICONTROL Adobe Experience Platform Web SDK]**」を選択します

1. **[!UICONTROL アクションタイプ]** として、「**[!UICONTROL 変数を更新]**」を選択します

1. **[!UICONTROL データ要素]** として、`xdm.variable.content` データ要素の作成 [ のレッスンで作成した ](create-data-elements.md) を選択します

   ![ 変数スキーマの更新 ](assets/create-rule-update-variable.png)

1. 次に、XDM フィールドを適切な値にマッピングして指定します。

   | XDM フィールド | マッピング先 |
   |---|---|
   | `eventType` | `Web Webpagedetails Page Views` （入力を開始して推奨値を確認する） |
   | `identityMap` | `Identity Map` データ要素 |
   | `web.webPageDetails.name` | `Page Name` データ要素 |
   | `web.webPageDetails.pageViews.value` | `1` |


   >[!TIP]
   >
   > データ要素が null の場合、XDM フィールドはネットワークリクエストに含まれません。 したがって、ユーザーが認証されず、`Identity Map` データ要素が null の場合、`identityMap` オブジェクトは送信されません。 これが、「グローバル設定」で定義できる理由です。

   >[!TIP]
   >
   > Adobe Analyticsでビーコンをページビューとして処理する場合、`eventType` を `web.webpagedetails.pageViews` にも `web.webPageDetails.pageViews.value` にも設定する必要はありませんが、他のダウンストリームアプリケーションのページビューを示す標準的な方法があると便利です。

1. 完了すると、`XDM Variable` は次のようになります。 次のように、入力されたフィールドと部分的に入力されたフィールドが青い円で示されます。
   ![XDM 変数 ](assets/rule-xdm-variable.png)
1. 次の画面で、ルールの **[!UICONTROL 変更を保持]** を選択してから **[!UICONTROL 保存]** を選択して、ルールを完了します



### 製品ページフィールド

次に、追加の順序付きルールで **[!UICONTROL 変数を更新]** を使用して、XDM オブジェクトをエンリッチメントしてから、[!UICONTROL Platform Edge Network] に送信します。

>[!TIP]
>
>ルールの順序は、イベントがトリガーされたときに最初に実行されるルールを決定します。 2 つのルールのイベントタイプが同じ場合は、最も数字が小さいルールが最初に実行されます。
> 

まず、Luma の製品詳細ページで製品表示を追跡します。

1. 「**[!UICONTROL ルールを追加]**」を選択します
1. [!UICONTROL `product detail pages - adobeDataLayer push - set product details variables - 20`] という名前を付けます
1. イベントの下の ![+記号を選択し ](https://spectrum.adobe.com/static/icons/workflow_18/Smock_AddCircle_18_N.svg) 新しいトリガーを追加します
1. **[!UICONTROL Extension]** で、「**[!UICONTROL Adobe Client Data Layer]**」を選択します
1. **[!UICONTROL イベントタイプ]** で、「**[!UICONTROL プッシュされたデータ]**」を選択します
1. 選択して **[!UICONTROL 詳細オプション]** を開き、`20` を入力します。 この順序値によって、ルールがグローバル変数ルールの _後_ に実行されるようになります。
1. **[!UICONTROL 特定のイベント]** をリッスンします
1. `productView` 登録するイベント / キー **[!UICONTROL として]** を入力
1. 「**[!UICONTROL 変更を保持]**」を選択します

   ![Analytics XDM ルール ](assets/rule-pdp-event.png)


1. **[!UICONTROL アクション]** で **[!UICONTROL 追加]** を選択します
1. **[!UICONTROL Adobe Experience Platform Web SDK]** 拡張機能を選択します
1. **[!UICONTROL アクションタイプ]** を **[!UICONTROL 変数を更新]** として選択します
1. `XDM Variable` データ要素 **[!UICONTROL として]** を選択します
1. これらの XDM フィールドを適切な値にマッピングします。

   | XDM フィールド | マッピング先 |
   |---|---|
   | `eventType` | `Commerce Product Views` （入力を開始して推奨値を確認する） |
   | `commerce.productViews.value` | `1` |
   | `productListItems.name` | `Ecommerce Product Name` （選択 **[!UICONTROL 個別の項目を指定]** および **[!UICONTROL 項目を追加]** 最初） |
   | `productListItems.sku` | `Ecommerce Product Id` |

1. 「**[!UICONTROL 変更を保持]**」を選択します

1. 「**[!UICONTROL 保存]**」を選択して、ルールを保存します

   >[!NOTE]
   >
   >このルールは優先順位が高いので、「グローバル設定」ルールの `eventType` 定が上書きされます。 `eventType` には 1 つの値のみを含めることができ、最も価値のあるイベントで設定することをお勧めします。

   >[!TIP]
   >
   >XDM で commerce.productViews.value=1 を設定すると、Analytics の `prodView` イベントに自動的にマッピングされます


### 買い物かごフィールド

配列が XDM スキーマの形式と一致する場合は、配列全体を XDM オブジェクトにマッピングできます。 前に作成したカスタムコードデータ要素 `Ecommerce Cart Products`、Luma web サイト上の `adobeDataLayer.ecommerce.cart.items` データレイヤーオブジェクトをループし、XDM スキーマの `productListItems` オブジェクトの必要な形式に変換します。

説明するには、以下の Luma サイトデータレイヤー（左）と翻訳済みデータ要素（右）の比較を参照してください。

![XDM オブジェクト配列形式 ](assets/data-element-xdm-array.png)

データ要素と `productListItems` 構造を比較します（ヒント。一致する必要があります）。

>[!IMPORTANT]
>
>数値変数がデータレイヤー内の文字列値（`price` や `qty` など）でデータ要素内の数値に再書式設定される方法に注意してください。 これらの形式要件は、Platform のデータ整合性にとって重要であり、[ スキーマの設定 ](configure-schemas.md) 手順で決定されます。 この例では、**[!UICONTROL quantity]** は **[!UICONTROL Integer]** データ型を使用しています。
> ![XDM スキーマデータタイプ ](assets/set-up-analytics-quantity-integer.png)

次に、配列を XDM オブジェクトにマッピングします。


1. `cart page - adobeDataLayer push - set cart variables - 20` という名前の新しいルールの作成
1. イベントの下の ![+記号を選択し ](https://spectrum.adobe.com/static/icons/workflow_18/Smock_AddCircle_18_N.svg) 新しいトリガーを追加します
1. **[!UICONTROL Extension]** で、「**[!UICONTROL Adobe Client Data Layer]**」を選択します
1. **[!UICONTROL イベントタイプ]** で、「**[!UICONTROL プッシュされたデータ]**」を選択します
1. 選択して **[!UICONTROL 詳細オプション]** を開き、`20` を入力します。 この順序値によって、ルールがグローバル変数ルールの _後_ に実行されるようになります。
1. **[!UICONTROL 特定のイベント]** をリッスンします
1. `cartView` 登録するイベント / キー **[!UICONTROL として]** を入力
1. 「**[!UICONTROL 変更を保持]**」を選択します


   ![ 買い物かごルールのイベント ](assets/rule-cart-event.png)

1. **[!UICONTROL アクション]** で **[!UICONTROL 追加]** を選択します
1. **[!UICONTROL Adobe Experience Platform Web SDK]** 拡張機能を選択します
1. **[!UICONTROL アクションタイプ]** を **[!UICONTROL 変数を更新]** として選択します
1. `XDM Variable` データ要素 **[!UICONTROL として]** を選択します
1. これらの XDM フィールドを適切な値にマッピングします。

   | XDM フィールド | マッピング先 |
   |---|---|
   | `eventType` | `Commerce Product List (Cart) Views` （入力を開始して推奨値を確認する） |
   | `commerce.productListViews.value` | `1` |
   | `productListItems.name` | `Ecommerce Product Name` （選択 **[!UICONTROL 個別の項目を指定]** および **[!UICONTROL 項目を追加]** 最初） |
   | `productListItems.sku` | `Ecommerce Product Id` |



   >[!TIP]
   >
   >XDM で commerce.productListViews.value=1 を設定すると、Analytics の `scView` イベントに自動的にマッピングされます

1. `eventType` を選択し、`commerce.productListViews` に設定します

1. までスクロールし、「**[!UICONTROL productListItems]** 配列」を選択します

1. 「**[!UICONTROL アレイ全体を提供]**」を選択します。

1. データ要素へ **`cart.productInfo`** マッピング

1. 「**[!UICONTROL 変更を保持]**」を選択します

1. 「**[!UICONTROL 保存]**」を選択して、ルールを保存します

以下の違いを持つ同じパターンに従って、チェックアウトと購入のために他の 2 つのルールを作成します。

**ルール名**: `ecommerce  - library loaded - set checkout variables - 20`

1. **[!UICONTROL 条件]**:/content/luma/us/en/user/checkout.html
1. `eventType` を `commerce.checkouts` に設定します。
1. `commerce.checkout.value` を `1` に設定します。

   >[!TIP]
   >
   >これは、Analytics でイベント `scCheckout` 設定することと同等です


**ルール名**: `ecommerce - library loaded - set purchase variables -  20`

1. **[!UICONTROL 条件]**:/content/luma/us/en/user/checkout/order/thank-you.html
1. `eventType` を `commerce.purchases` に設定します。
1. `commerce.purchases.value` を `1` に設定します。

   >[!TIP]
   >
   >これは、Analytics でイベント `purchase` 設定することと同等です

1. `commerce.order.purchaseID` データ要素に `cart.orderId` を設定します。
1. ハードコードされた値 `commerce.order.currencyCode` に `USD` を設定します

   ![Analytics の purchaseID の設定 ](assets/set-up-analytics-purchase.png)

   >[!TIP]
   >
   >これは、Analytics で変数 `s.purchaseID` および `s.currencyCode` を設定することと同等です

1. までスクロールし、「**[!UICONTROL productListItems]** 配列」を選択します
1. 「**[!UICONTROL アレイ全体を提供]**」を選択します。
1. データ要素へ **`cart.productInfo.purchase`** マッピング
1. 「**[!UICONTROL 変更を保持]**」を選択します
1. 「**[!UICONTROL 保存]**」を選択します

完了すると、次のルールが作成されます。

![Analytics XDM ルール ](assets/set-up-analytics-rules.png)


### イベントルールを送信

これで変数を設定したので、**[!UICONTROL イベントの送信]** アクションを使用して XDM オブジェクト全体を Platform Edge Networkに送信するルールを作成できます。

1. 右側の「**[!UICONTROL ルールを追加]**」を選択して、別のルールを作成します

1. ルール名を設定します。`all pages - library loaded - send event - 50`

1. 「**[!UICONTROL イベント]**」セクションで、「**[!UICONTROL 追加]**」を選択します

1. **[!UICONTROL Core 拡張機能]** を使用し、`Library Loaded (Page Top)` イベントタイプ **[!UICONTROL として]** を選択します

1. **[!UICONTROL 詳細]** ドロップダウンを選択し、「`50` 順序 **[!UICONTROL 」に]** を入力します。 これにより、設定した他のすべてのルール（`1` または `20` を [!UICONTROL Order] として持つ）の後でこのルールが起動します。

1. 「**[!UICONTROL 変更を保持]**」を選択して、メインのルール画面に戻ります
   ![ ライブラリの読み込みトリガーを選択 ](assets/create-tag-rule-trigger-loaded-send.png)

1. 「**[!UICONTROL アクション]**」セクションで、「**[!UICONTROL 追加]**」を選択します

1. **[!UICONTROL Extension]** として、「**[!UICONTROL Adobe Experience Platform Web SDK]**」を選択します

1. **[!UICONTROL アクションタイプ]** として、「**[!UICONTROL イベントを送信]**」を選択します

1. **[!UICONTROL XDM]** として、前のレッスンで作成した `xdm.variable.content` データ要素を選択します

1. 「**[!UICONTROL 変更を保持]**」を選択して、メインのルール画面に戻ります

   ![ イベントを送信アクションの追加 ](assets/create-rule-send-event-action.png)
1. 「**[!UICONTROL 保存]**」を選択して、ルールを保存します

   ![ルールの保存](assets/create-rule-save-rule.png)

## ライブラリでのルールの公開

次に、ルールを開発環境に公開して、ルールが機能することを検証します。

ライブラリを作成するには：

1. 左側のナビゲーションの **[!UICONTROL 公開フロー]** に移動します

1. 「**[!UICONTROL ライブラリを追加]**」を選択します。

   ![ 「ライブラリを追加」を選択 ](assets/rule-publish-library.png)
1. **[!UICONTROL 名前]** に `Luma Web SDK Tutorial` と入力します
1. **[!UICONTROL 環境]** で、「`Development`」を選択します。
1. 「**[!UICONTROL 変更されたすべてのリソースを追加]**」を選択します。

   >[!NOTE]
   >
   >    前のレッスンで作成したすべてのタグコンポーネントが表示されます。 Core 拡張機能には、すべての web タグプロパティに必要な基本JavaScriptが含まれています。

1. **[!UICONTROL 開発用に保存してビルド]** を選択します

   ![ ライブラリの作成とビルド ](assets/create-tag-rule-library-changes.png)

ライブラリのビルドには数分かかる場合があり、完了すると、ライブラリ名の左側に緑のドットが表示されます。

![ ビルド完了 ](assets/create-rule-development-success.png)

[!UICONTROL  公開フロー ] 画面で確認できるように、公開プロセスには多くの詳細があり、これはこのチュートリアルの範囲外です。 このチュートリアルでは、開発環境で 1 つのライブラリのみを使用します。

これで、Adobe Experience Platform Debuggerを使用してリクエスト内のデータを検証する準備が整いました。

>[!NOTE]
>
>Adobe Experience Platform Web SDKの学習にご協力いただき、ありがとうございます。 ご不明な点がある場合や、一般的なフィードバックを共有したい場合、または今後のコンテンツに関するご提案がある場合は、この [Experience League Community Discussion の投稿でお知らせください ](https://experienceleaguecommunities.adobe.com/adobe-experience-platform-18/tutorial-discussion-implement-adobe-experience-cloud-with-web-sdk-tutorial-248848)
