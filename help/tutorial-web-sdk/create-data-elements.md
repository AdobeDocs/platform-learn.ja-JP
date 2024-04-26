---
title: Platform Web SDK のデータ要素の作成
description: XDM オブジェクトを作成し、タグでデータ要素をマッピングする方法を説明します。 このレッスンは、Web SDK を使用したAdobe Experience Cloudの実装チュートリアルの一部です。
feature: Tags
jira: KT-15401
exl-id: d662ec46-de9b-44ba-974a-f81dfc842e68
source-git-commit: 8602110d2b2ddc561e45f201e3bcce5e6a6f8261
workflow-type: tm+mt
source-wordcount: '1205'
ht-degree: 2%

---

# データ要素の作成

で、コンテンツ、コマース、ID データ用のタグでデータ要素を作成する方法を説明します [Luma デモサイト](https://luma.enablementadobe.com/content/luma/us/en.html). 次に、XDM スキーマのフィールドにAdobe Experience Platform Web SDK 拡張機能の変数データ要素タイプを入力します。

## 学習目標

このレッスンを終了すると、次の操作を実行できます。

* データレイヤーを XDM にマッピングする様々なアプローチを理解する
* データをキャプチャするデータ要素の作成
* XDM オブジェクトへのデータ要素のマッピング


## 前提条件

データレイヤーとは何かを理解し、チュートリアルの前のレッスンを完了しました。

* [XDM スキーマの設定](configure-schemas.md)
* [ID 名前空間の設定](configure-identities.md)
* [データストリームの設定](configure-datastream.md)
* [タグプロパティにインストールされている Web SDK 拡張機能](install-web-sdk.md)


>[!IMPORTANT]
>
>このレッスンのデータは、 `[!UICONTROL digitalData]` luma サイト上のデータレイヤー。 データレイヤーを表示するには、開発者コンソールを開いてと入力します。 `[!UICONTROL digitalData]` 使用可能な完全なデータレイヤーを確認するには、![digitalData データレイヤー](assets/data-element-data-layer.png)


## データレイヤーのアプローチ

Adobe Experience Platformのタグ機能を使用して、データレイヤーから XDM にデータをマッピングする方法は複数あります。 次に、3 つの異なるアプローチの長所と短所をいくつか示します。 必要に応じて、次の方法を組み合わせることができます。

1. データレイヤーへの XDM の実装
1. タグの XDM へのマッピング
1. データストリームの XDM へのマッピング

>[!NOTE]
>
>このチュートリアルの例では、タグで XDM にマッピングするアプローチに従っています。


### データレイヤーへの XDM の実装

このアプローチでは、完全に定義された XDM オブジェクトをデータレイヤーの構造として使用します。 次に、データレイヤー全体をタグの XDM オブジェクトデータ要素にマッピングします。 実装でタグマネージャーを使用していない場合、を使用してアプリケーションから直接 XDM にデータを送信できるので、この方法は理想的です。 [XDM sendEvent コマンド](https://experienceleague.adobe.com/en/docs/experience-platform/edge/fundamentals/tracking-events#sending-xdm-data). タグを使用する場合は、データレイヤー全体をパススルー JSON オブジェクトとして XDM に取り込むカスタムコードデータ要素を作成できます。 次に、パススルー JSON をイベント送信アクションの XDM オブジェクトフィールドにマッピングします。

以下に、Adobeのクライアントデータレイヤー形式を使用したデータレイヤーの表示例を示します。

データレイヤー内の+++XDM の例

```JSON
window.adobeDataLayer.push({
"eventType": "web.webPageDetails.pageViews",
"web":{
         "webInteraction":{
            "linkClicks":{
               "id":"",
               "value":""
            },
            "URL":"",
            "name":"",
            "region":"",
            "type":""
         },
         "webPageDetails":{
            "pageViews":{
               "id":"",
               "value":"1"
            },
            "URL":"https://luma.enablementadobe.com/",
            "isErrorPage":"",
            "isHomePage":"",
            "name":"luma:home",
            "server":"enablementadobe.com",
            "siteSection":"home",
            "viewName":""
         },
         "webReferrer":{
            "URL":"",
            "type":""
         }
      }
});
```

+++

長所

* データレイヤー変数から XDM への再マッピングの追加手順を不要にします
* 開発チームがタグ付けデジタル動作を所有している場合は、をデプロイする方が早い場合があります

短所

* XDM に送信するデータを更新するために、開発チームと開発サイクルに完全に依存している
* XDM はデータレイヤーから正確なペイロードを受け取るので、柔軟性は限られています
* スクレーピング、永続性、迅速なデプロイメントのための機能など、ビルトインのタグ機能は使用できません
* サードパーティのピクセルにはデータレイヤーを使用できません
* データレイヤーと XDM の間でデータを変換できない

### タグ内のデータレイヤーのマッピング

このアプローチでは、個々のデータレイヤー変数またはデータレイヤーオブジェクトをタグのデータ要素にマッピングし、最終的には XDM にマッピングします。 これは、タグ管理システムを使用した実装に対する従来のアプローチです。

#### 長所

* XDM に到達する前に個々の変数を制御し、データを変換できるため、最も柔軟なアプローチ
* Adobeタグトリガーとスクレーピング機能を使用して、データを XDM に渡すことができます。
* データ要素をサードパーティのピクセルにクライアントサイドでマッピングできます。

#### 短所

* データレイヤーをデータ要素として再構築するのに時間がかかる


>[!TIP]
>
> Google データレイヤー
> 
> 組織が既にGoogle Analyticsを使用しており、web サイトに従来のGoogle dataLayer オブジェクトがある場合は、 [Google データレイヤーの拡張機能](https://experienceleague.adobe.com/en/docs/experience-platform/tags/extensions/client/google-data-layer/overview) タグ内。 これにより、IT チームのサポートを依頼しなくても、Adobeテクノロジを迅速に導入できます。 Google データレイヤーを XDM にマッピングするには、上記と同じ手順に従います。

### データストリームの XDM へのマッピング

このアプローチでは、と呼ばれるデータストリーム設定に組み込まれた機能を使用します [データ収集のためのデータ準備](https://experienceleague.adobe.com/en/docs/experience-platform/datastreams/data-prep) データレイヤー変数をタグの XDM にマッピングするをスキップします。

#### 長所

* 個々の変数を XDM にマッピングできるので、柔軟性があります
* ～する能力 [新しい値を計算](https://experienceleague.adobe.com/en/docs/experience-platform/data-prep/functions) または [変換データタイプ](https://experienceleague.adobe.com/en/docs/experience-platform/data-prep/data-handling) データレイヤーから XDM に移動する前に
* を活用 [マッピング UI](https://experienceleague.adobe.com/en/docs/experience-platform/datastreams/data-prep#create-mapping) ポイントアンドクリック UI を使用してソースデータのフィールドを XDM にマッピングするには

#### 短所

* データレイヤー変数をクライアントサイドのサードパーティピクセルのデータ要素として使用することはできませんが、イベント転送では使用できます
* Adobe Experience Platformのタグ機能のスクレーピング機能を使用できない
* タグとデータストリームの両方でデータレイヤーをマッピングすると、メンテナンスが複雑になります



>[!IMPORTANT]
>
>前述のように、このチュートリアルの例では、タグアプローチでの XDM へのマッピングに従います。

## データ要素を作成してデータレイヤーをキャプチャする

XDM オブジェクトを作成する前に、次のデータ要素のセットを作成します [Luma デモサイト](https://luma.enablementadobe.com/content/luma/us/en.html){target="_blank"} データレイヤー：

1. に移動 **[!UICONTROL データ要素]** を選択して、 **[!UICONTROL データ要素を追加]** （または **[!UICONTROL 新しいデータ要素の作成]** タグプロパティに既存のデータ要素がない場合）

   ![データ要素の作成](assets/data-element-create.png)

1. データ要素に「`page.pageInfo.pageName`」と名前を付けます。
1. の使用 **[!UICONTROL JavaScript 変数]** **[!UICONTROL データ要素タイプ]** luma のデータレイヤーの値を指すようにするには： `digitalData.page.pageInfo.pageName`

1. チェックボックスをオンにする **[!UICONTROL 小文字の値を強制]** および **[!UICONTROL テキストをクリーン]** 大文字と小文字を統一し、余分なスペースを削除するには

1. 移動 `None` as the **[!UICONTROL ストレージ期間]** この値はページごとに異なるので、を設定します

1. 「**[!UICONTROL 保存]**」を選択します

   ![ページ名データ要素](assets/data-element-pageName.png)

同じ手順に従って、これらの追加のデータ要素を作成します。

* **`page.pageInfo.server`**  マッピング先
  `digitalData.page.pageInfo.server`

* **`page.pageInfo.hierarchie1`**  マッピング先
  `digitalData.page.pageInfo.hierarchie1`

* **`user.profile.attributes.username`**  マッピング先
  `digitalData.user.0.profile.0.attributes.username`

* **`user.profile.attributes.loggedIn`** マッピング先
  `digitalData.user.0.profile.0.attributes.loggedIn`

* **`product.productInfo.sku`**（`digitalData.product.0.productInfo.sku` にマッピング）
<!--digitalData.product.0.productInfo.sku
    ```javascript
    var cart = digitalData.product;
    var cartItem;
    cart.forEach(function(item){
    cartItem = item.productInfo.sku;
    });
    return cartItem;
    ```
    -->
* **`product.productInfo.title`**（`digitalData.product.0.productInfo.title` にマッピング）
* **`cart.orderId`**（`digitalData.cart.orderId` にマッピング）
<!--
    ```javascript
    var cart = digitalData.product;
    var cartItem;
    cart.forEach(function(item){
    cartItem = item.productInfo.title;
    });
    return cartItem;
    ```
    -->
* **`product.category`** の使用 **[!UICONTROL カスタムコード]** **[!UICONTROL データ要素タイプ]** 次のカスタムコードを使用して、トップレベルカテゴリのサイト URL を解析します。

  ```javascript
  var cat = location.pathname.split(/[/.]+/);
  if (cat[5] == 'products') {
     return (cat[6]);
  } else if (cat[5] != 'html') { 
     return (cat[5]);
  }
  ```

* **`cart.productInfo`** 次のカスタムコードを使用します。

  ```javascript
  var cart = digitalData.cart.cartEntries; 
  var cartItem = [];
  cart.forEach(function(item, index, array){
  cartItem.push({
  "SKU": item.sku
  });
  });
  return cartItem; 
  ```

* **`cart.productInfo.purchase`** 次のカスタムコードを使用します。

  ```javascript
  var cart = digitalData.cart.cartEntries; 
  var cartItem = [];
  cart.forEach(function(item, index, array){
  var qty = parseInt(item.qty);
  var price = parseInt(item.price);
  cartItem.push({
  "SKU": item.sku,
  "quantity": qty,
  "priceTotal": price
  });
  });
  return cartItem; 
  ```



>[!CAUTION]
>
>この [!UICONTROL JavaScript 変数] データ要素タイプは、配列参照を角括弧ではなくドットとして扱うので、ユーザー名データ要素はとして参照します `digitalData.user[0].profile[0].attributes.username` **動作しない**.

## 変数データ要素の作成

データ要素を作成したら、を使用して XDM にマッピングします **[!UICONTROL 変数]** xdm オブジェクトに使用されるスキーマを定義するデータ要素。 このオブジェクトは、次の作業の際に作成した XDM スキーマに準拠している必要があります [スキーマの設定](configure-schemas.md) レッスン：

変数データ要素を作成するには：

1. を選択 **[!UICONTROL データ要素を追加]**
1. データ要素に名前を付ける `xdm.variable.content`. タグプロパティを整理しやすくするために、XDM に固有のデータ要素を「xdm」というプレフィックスを付けることをお勧めします
1. 「」を選択します **[!UICONTROL Adobe Experience Platform Web SDK]** as the **[!UICONTROL 拡張機能]**
1. 「」を選択します **[!UICONTROL 変数]** as the **[!UICONTROL データ要素タイプ]**
1. 適切なExperience Platformを選択します **[!UICONTROL Sandbox]**
1. 適切なを選択します **[!UICONTROL スキーマ]**、この場合は `Luma Web Event Data`
1. 「**[!UICONTROL 保存]**」を選択します

   ![可変データ要素](assets/analytics-tags-data-element-xdm-variable.png)


これらの手順の最後で、次のデータ要素が作成されているはずです。

| コア拡張機能のデータ要素 | Platform Web SDK 拡張機能のデータ要素 |
-----------------------------|-------------------------------
| `cart.orderId` | `xdm.variable.content` |
| `cart.productInfo` | |
| `cart.productInfo.purchase` | |
| `page.pageInfo.hierarchie1` | |
| `page.pageInfo.pageName` | |
| `page.pageInfo.server` | |
| `product.category` | |
| `product.productInfo.sku` | |
| `product.productInfo.title` | |
| `user.profile.attributes.loggedIn` | |
| `user.profile.attributes.username` | |

>[!TIP]
>
>今後 [タグルールの作成](create-tag-rule.md) レッスンでは、次のことを学習します **[!UICONTROL 変数]** データ要素を使用すると、 **[!UICONTROL 変数アクションタイプを更新]**.

これらのデータ要素を配置すると、タグルールを使用して Platform Edge Networkへのデータ送信を開始する準備が整います。 ただし、最初に、Web SDK を使用して ID を収集する方法について説明します。

[次へ： ](create-identities.md)

>[!NOTE]
>
>Adobe Experience Platform Web SDK の学習に時間を費やしていただき、ありがとうございます。 ご質問がある場合、一般的なフィードバックを共有したい場合、または将来のコンテンツに関するご提案がある場合は、このページでお知らせください [Experience League コミュニティ ディスカッションの投稿](https://experienceleaguecommunities.adobe.com/t5/adobe-experience-platform-data/tutorial-discussion-implement-adobe-experience-cloud-with-web/td-p/444996)
