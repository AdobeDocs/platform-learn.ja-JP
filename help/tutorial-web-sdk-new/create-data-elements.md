---
title: データ要素の作成
description: XDM オブジェクトを作成し、タグでそのオブジェクトにデータ要素をマッピングする方法を説明します。 このレッスンは、「 Adobe Experience Cloudと Web SDK の実装」チュートリアルの一部です。
feature: Tags
source-git-commit: ef3d374f800905c49cefba539c1ac16ee88c688b
workflow-type: tm+mt
source-wordcount: '1189'
ht-degree: 2%

---

# データ要素の作成

コンテンツ、コマースおよび ID データのタグにデータ要素を作成する方法については、 [Luma デモサイト](https://luma.enablementadobe.com/content/luma/us/en.html). 次に、変数データ要素タイプを使用して、XDM スキーマのフィールドに値を入力します。


>[!IMPORTANT]
>
>このレッスンのデータは、 `[!UICONTROL digitalData]` Luma サイトのデータレイヤー。 データレイヤーを表示するには、デベロッパーコンソールを開き、「 」と入力します。 `[!UICONTROL digitalData]` をクリックして、使用可能なデータレイヤー全体を確認します。![digitalData データレイヤー](assets/data-element-data-layer.png)


## 学習内容

このレッスンを最後まで学習すると、次のことが可能になります。

* データレイヤーを XDM にマッピングするための様々なアプローチについて理解する
* データを取り込むためのデータ要素を作成する
* データ要素の XDM オブジェクトへのマッピング


## 前提条件

データレイヤーの概要と、このチュートリアルの前のレッスンを完了していることを理解している。

* [XDM スキーマの設定](configure-schemas.md)
* [ID 名前空間の設定](configure-identities.md)
* [データストリームの設定](configure-datastream.md)
* [タグプロパティにインストールされる Web SDK 拡張機能](install-web-sdk.md)

## データレイヤーのアプローチ

Adobe Experience Platformのタグ機能を使用してデータレイヤーから XDM にデータをマッピングする方法は複数あります。 次に、3 つの異なるアプローチの長所と短所をいくつか示します。

1. データレイヤーでの XDM の実装
1. タグで XDM にマッピング
1. データストリーム内の XDM にマッピング

>[!NOTE]
>
>このチュートリアルの例では、タグアプローチの「 XDM にマッピング」に従います。


### データレイヤーでの XDM の実装

この方法では、完全に定義された XDM オブジェクトをデータレイヤーの構造として使用する必要があります。 次に、データレイヤー全体をタグで XDM オブジェクトデータ要素にマッピングします。 タグマネージャーを使用しない実装の場合、この方法は理想的です。これは、を使用して、アプリケーションから直接 XDM にデータを送信できるからです。 [XDM sendEvent コマンド](https://experienceleague.adobe.com/docs/experience-platform/edge/fundamentals/tracking-events.html?lang=en#sending-xdm-data). タグを使用する場合、データレイヤー全体をパススルー JSON オブジェクトとして XDM にキャプチャするカスタムコードデータ要素を作成できます。 次に、「イベントを送信」アクションの「XDM オブジェクト」フィールドにパススルー JSON をマッピングします。

データレイヤーがAdobeクライアントデータレイヤー形式を使用した場合の例を以下に示します。

+++データレイヤーでの XDM の例

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

* XDM に対するデータレイヤー変数に再マッピングする追加手順を排除
* 開発チームがタグ付けのデジタル動作を所有している場合は、デプロイが迅速におこなえます。

短所

* XDM に送信するデータを更新するための開発チームと開発サイクルに完全に依存
* XDM がデータレイヤーから正確なペイロードを受け取るので、柔軟性は限られています
* 迅速なデプロイメントのために、スクレーピング、永続性、機能などの組み込み機能は使用できません
* サードパーティのピクセルに対してデータレイヤーを使用できません
* データレイヤーと XDM の間でデータを変換できない

### タグ内のデータレイヤーをマッピングする

この方法では、個々のデータレイヤー変数（またはデータレイヤーオブジェクト）をタグ内のデータ要素にマッピングし、最終的には XDM にマッピングします。 これは、タグ管理システムを使用した従来の実装アプローチです。

#### 長所

* 個々の変数を制御し、XDM に到達する前にデータを変換できる、最も柔軟なアプローチです
* Adobeタグのトリガーとスクレーピング機能を使用して、データを XDM に渡すことができます。
* データ要素をクライアントサイドでサードパーティピクセルにマッピングできる

#### 短所

* データ要素としてデータレイヤーを再構築するのに時間がかかる


>[!TIP]
>
> Google Data Layer
> 
> 組織が既にGoogle Analyticsを使用しており、Web サイトに従来のGoogle dataLayer オブジェクトがある場合、 [Google Data Layer 拡張機能](https://experienceleague.adobe.com/docs/experience-platform/tags/extensions/client/google-data-layer/overview.html?lang=en) （タグ内） これにより、IT チームにサポートを依頼することなく、Adobeテクノロジーを迅速に導入できます。 Googleデータレイヤーを XDM にマッピングする場合は、上記と同じ手順に従います。

### データストリーム内の XDM にマッピング

このアプローチは、データストリーム設定に組み込まれている機能を使用します。 [データ収集用のデータ準備](https://experienceleague.adobe.com/docs/experience-platform/datastreams/data-prep.html) とは、データレイヤー変数の XDM へのマッピングをタグ内でスキップします。

#### 長所

* 個々の変数を XDM にマッピングできる柔軟性
* 次の機能を持つ [新しい値を計算](https://experienceleague.adobe.com/docs/experience-platform/data-prep/functions.html?lang=ja) または [データタイプを変換](https://experienceleague.adobe.com/docs/experience-platform/data-prep/data-handling.html) XDM に送られる前にデータレイヤーから
* 以下を実現するには、 [マッピング UI](https://experienceleague.adobe.com/docs/experience-platform/datastreams/data-prep.html#create-mapping) ポイント&amp;クリック UI を使用してソースデータ内のフィールドを XDM にマッピングするには

#### 短所

* データレイヤー変数は、クライアントサイドのサードパーティピクセルのデータ要素としては使用できませんが、イベント転送で使用することはできます
* Adobe Experience Platformのタグ機能の削除機能を使用できません
* タグとデータストリームの両方でデータレイヤーをマッピングすると、メンテナンスの複雑さが増します



>[!IMPORTANT]
>
>前述したように、このチュートリアルの例では、タグのアプローチで XDM にマッピングする方法に従います。

## データレイヤーを取り込むためのデータ要素の作成

XDM オブジェクトを作成する前に、に対して次の一連のデータ要素を作成します。 [Luma デモサイト](https://luma.enablementadobe.com/content/luma/us/en.html){target="_blank"} データレイヤー：

1. に移動します。 **[!UICONTROL データ要素]** を選択し、 **[!UICONTROL データ要素を追加]** ( または **[!UICONTROL 新しいデータ要素を作成]** （タグプロパティに既存のデータ要素がない場合）

   ![データ要素を作成](assets/data-element-create.png)

1. データ要素に「`page.pageInfo.pageName`」と名前を付けます。
1. 以下を使用します。 **[!UICONTROL JavaScript 変数]** **[!UICONTROL データ要素のタイプ]** を指定して、Luma のデータレイヤーの値を指定します。 `digitalData.page.pageInfo.pageName`

1. 次のチェックボックスをオンにします。 **[!UICONTROL 強制的に小文字に変換値]** および **[!UICONTROL クリーンテキスト]** 大文字と小文字を標準化し、余分なスペースを削除するには

1. 終了 `None` として **[!UICONTROL ストレージ期間]** の設定は、ページごとにこの値が異なるので、

1. 「**[!UICONTROL 保存]**」を選択します

   ![ページ名データ要素](assets/data-element-pageName.png)

同じ手順に従って、これらの追加のデータ要素を作成します。

* **`page.pageInfo.server`**  マッピング先：
  `digitalData.page.pageInfo.server`

* **`page.pageInfo.hierarchie1`**  マッピング先：
  `digitalData.page.pageInfo.hierarchie1`

* **`user.profile.attributes.username`**  マッピング先：
  `digitalData.user.0.profile.0.attributes.username`

* **`user.profile.attributes.loggedIn`** マッピング先：
  `digitalData.user.0.profile.0.attributes.loggedIn`

* **`product.productInfo.sku`** マッピング先： `digitalData.product.0.productInfo.sku`
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
* **`product.productInfo.title`** マッピング先： `digitalData.product.0.productInfo.title`
* **`cart.orderId`** マッピング先： `digitalData.cart.orderId`
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
* **`product.category`** の使用 **[!UICONTROL カスタムコード]** **[!UICONTROL データ要素のタイプ]** および次のカスタムコードを使用して、トップレベルカテゴリのサイト URL を解析します。

  ```javascript
  var cat = location.pathname.split(/[/.]+/);
  if (cat[5] == 'products') {
     return (cat[6]);
  } else if (cat[5] != 'html') { 
     return (cat[5]);
  }
  ```

* **`cart.productInfo`** 次のカスタムコードを使用する。

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

* **`cart.productInfo.purchase`** 次のカスタムコードを使用する。

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
>The [!UICONTROL JavaScript 変数] データ要素タイプは、配列参照を括弧ではなくドットとして扱うので、ユーザー名データ要素を `digitalData.user[0].profile[0].attributes.username` **動作しない**.

## 変数データ要素を作成する

データ要素を作成した後、 **[!UICONTROL 変数]** XDM オブジェクトに使用するスキーマを定義するデータ要素です。 このオブジェクトは、 [スキーマの設定](configure-schemas.md) レッスン。

変数データ要素を作成するには、次の手順に従います。

1. 選択 **[!UICONTROL データ要素を追加]**
1. データ要素に名前を付ける `xdm.variable.content`. タグプロパティをより整理するために、XDM 固有のデータ要素の前に「xdm」を付けることをお勧めします
1. を選択します。 **[!UICONTROL Adobe Experience Platform Web SDK]** として **[!UICONTROL 拡張]**
1. を選択します。 **[!UICONTROL 変数]** として **[!UICONTROL データ要素タイプ]**
1. 適切なExperience Platform **[!UICONTROL サンドボックス]**
1. 適切な **[!UICONTROL スキーマ]**（この場合） `Luma Web Event Data`
1. 「**[!UICONTROL 保存]**」を選択します

   ![変数データ要素](assets/analytics-tags-data-element-xdm-variable.png)


これらの手順の最後に、次のデータ要素を作成する必要があります。

| Core 拡張機能のデータ要素 | Platform Web SDK 拡張機能のデータ要素 |
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
>将来 [タグルールの作成](create-tag-rule.md) レッスンを学ぶには、 **[!UICONTROL 変数]** データ要素を使用すると、タグ内で複数のルールを積み重ねることができます。 **[!UICONTROL 変数アクションタイプを更新]**.

これらのデータ要素が配置されたら、タグルールを使用して Platform Edge Network へのデータ送信を開始する準備が整いました。 まず、Web SDK を使用して ID を収集する方法について説明します。

[次へ： ](create-identities.md)

>[!NOTE]
>
>Adobe Experience Platform Web SDK の学習に時間を割いていただき、ありがとうございます。 ご質問がある場合、一般的なフィードバックを共有したい場合、または今後のコンテンツに関する提案がある場合は、こちらで共有してください [Experience Leagueコミュニティディスカッション投稿](https://experienceleaguecommunities.adobe.com/t5/adobe-experience-platform-launch/tutorial-discussion-implement-adobe-experience-cloud-with-web/td-p/444996)
