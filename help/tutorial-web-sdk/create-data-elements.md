---
title: Platform Web SDKのデータ要素の作成
description: XDM オブジェクトを作成し、タグでデータ要素をマッピングする方法を説明します。 このレッスンは、「Web SDK を使用した Adobe Experience Cloud 実装のチュートリアル」の一部です。
feature: Tags
jira: KT-15401
exl-id: d662ec46-de9b-44ba-974a-f81dfc842e68
source-git-commit: da65f13f95a6d1258655e8eebc76cf024221a610
workflow-type: tm+mt
source-wordcount: '1236'
ht-degree: 2%

---

# データ要素の作成

[Luma デモ web サイト &#x200B;](https://luma.enablementadobe.com) で、コンテンツ、コマース、ID データのタグにデータ要素を作成する方法を説明します。 次に、XDM スキーマのフィールドに値を入力します。



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
* [タグプロパティにインストールされている web SDK拡張機能](install-web-sdk.md)


>[!IMPORTANT]
>
>このレッスンのデータは、`[!UICONTROL adobeDataLayer]`Luma サイト [&#x200B; の &#x200B;](https://luma.enablementadobe.com) データレイヤーから得られます。 データレイヤーを表示するには、開発者コンソールを開き、`[!UICONTROL adobeDataLayer]` と入力して、使用可能な完全なデータレイヤーを表示します。![adobeDataLayer データレイヤー &#x200B;](assets/data-element-data-layer-new.png)


## データレイヤーのアプローチ

Adobe Experience Platformのタグ機能を使用して、データレイヤーから XDM にデータをマッピングする方法は複数あります。 次に、3 つの異なるアプローチの長所と短所をいくつか示します。 必要に応じて、次の方法を組み合わせることができます。

1. データレイヤーへの XDM の実装
1. タグの XDM へのマッピング
1. データストリームの XDM へのマッピング

>[!NOTE]
>
>このチュートリアルの例では、タグで XDM にマッピングするアプローチに従っています。


### データレイヤーへの XDM の実装

このアプローチでは、web 開発者は、データレイヤーの構造として完全に定義された XDM オブジェクトを実装します。 次に、データレイヤー全体をタグの XDM オブジェクトにマッピングするだけです。 実装でタグマネージャーを使用しない場合、[XDM sendEvent コマンド &#x200B;](https://experienceleague.adobe.com/ja/docs/experience-platform/edge/fundamentals/tracking-events#sending-xdm-data) を使用してアプリケーションから直接 XDM にデータを送信できるので、この方法が理想的な可能性があります。 タグを使用する場合は、データレイヤー全体をパススルー JSON オブジェクトとして XDM に取り込むカスタムコードデータ要素を作成できます。 次に、パススルー JSON をイベント送信アクションの XDM オブジェクトフィールドにマッピングします。

以下に、Adobe Client Data Layer フォーマットを使用したデータレイヤーの外観の例を示します。

+++データレイヤーの XDM の例

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
* Web 開発チームがデジタル動作のタグ付けも担当している場合は、のデプロイが早くなる可能性があります

短所

* XDM に送信するデータを更新するために、開発チームと開発サイクルに完全に依存している
* XDM はデータレイヤーから正確なペイロードを受け取るので、柔軟性は限られています
* スクレーピング、永続性、迅速なデプロイメントのための機能など、ビルトインのタグ機能は使用できません
* サードパーティのピクセルに対してデータレイヤーを使用するのは難しいです（ただし、これらのピクセルを [&#x200B; イベント転送 &#x200B;](setup-event-forwarding.md)）に移動する必要がある場合があります）。
* データレイヤーと XDM の間でデータを変換できない

### タグの XDM へのマッピング

このアプローチでは、個々のデータレイヤー変数をタグのデータ要素、最終的には XDM にマッピングします。 これは、タグ管理システムを使用した実装に対する従来のアプローチです。

#### 長所

* XDM に到達する前に個々の変数を制御し、データを変換できるため、最も柔軟なアプローチ
* Adobe タグのトリガーとスクレーピング機能を使用して、データを XDM に渡すことができます
* データ要素をサードパーティのピクセルにクライアントサイドでマッピングできます。

#### 短所

* データレイヤーをタグデータ要素として再構築するのに時間がかかる


>[!IMPORTANT]
>
>前述のように、このチュートリアルの例では、タグアプローチでの XDM へのマッピングに従います。

### データストリームの XDM へのマッピング

このアプローチでは、[&#x200B; データ収集のためのデータ準備 &#x200B;](https://experienceleague.adobe.com/ja/docs/experience-platform/datastreams/data-prep) と呼ばれるデータストリーム設定に組み込まれた機能を使用し、タグの XDM へのデータレイヤー変数のマッピングをスキップします。

#### 長所

* ポイントアンドクリック UI での個々の変数の XDM への柔軟なマッピング
* XDM に送信する前にデータレイヤーから [&#x200B; 新しい値を計算 &#x200B;](https://experienceleague.adobe.com/ja/docs/experience-platform/data-prep/functions) または [&#x200B; データタイプを変換 &#x200B;](https://experienceleague.adobe.com/ja/docs/experience-platform/data-prep/data-handling) する機能

#### 短所

* データレイヤー変数をクライアントサイドのサードパーティピクセルのデータ要素として使用することはできませんが、イベント転送では使用できます
* タグでスクレーピング機能を使用できない
* タグとデータストリームの両方でデータレイヤーをマッピングすると、メンテナンスが複雑になります


>[!TIP]
>
> Google データレイヤー
> 
> 組織が既にGoogle Analyticsを使用しており、web サイトに従来のGoogle dataLayer オブジェクトがある場合は、タグの [0&rbrace;Google Data Layer extension&rbrace; を使用できます。 &#x200B;](https://experienceleague.adobe.com/ja/docs/experience-platform/tags/extensions/client/google-data-layer/overview)これにより、IT チームにサポートを依頼することなく、Adobe テクノロジーをより迅速にデプロイできます。 Google データレイヤーを XDM にマッピングするには、上記と同じ手順に従います。


## データ要素を作成してデータレイヤーをキャプチャする

XDM フィールドに値を入力する前に、まず必要なデータポイントをタグデータ要素として取得します。

1. **[!UICONTROL データ要素]** に移動し、「**[!UICONTROL データ要素を追加]** （タグプロパティに既存のデータ要素がない場合は「**[!UICONTROL 新しいデータ要素を作成]**」を選択します

   ![&#x200B; データ要素の作成 &#x200B;](assets/data-element-create.png)

1. データ要素に「`Page Name`」と名前を付けます。
1. **[!UICONTROL JavaScript変数]** **[!UICONTROL データ要素タイプ]** を使用して、Luma のデータレイヤーの値を指すようにします。`adobeDataLayer.0.page.name`

1. 「**[!UICONTROL 小文字を強制]**」および「**[!UICONTROL テキストをクリーン]**」チェックボックスをオンにして大文字と小文字を区別し、不要なスペースを削除します

1. この値はページごとに異なるので、`None` を **[!UICONTROL ストレージ期間]** 設定のままにします

1. 「**[!UICONTROL 保存]**」を選択します

   ![&#x200B; ページ名データ要素 &#x200B;](assets/data-element-pageName.png)

同じ手順に従って、これらの追加のデータ要素を作成します。

* **`User Id`** マッピング先
  `adobeDataLayer.0.user.id`

* **`User Logged In`** マッピング先
  `adobeDataLayer.0.user.loggedIn`

* **`Ecommerce Product Id`** にマッピングされた `adobeDataLayer.0.ecommerce.detail.products.0.id`
* **`Ecommerce Product Name`** にマッピングされた `adobeDataLayer.0.ecommerce.detail.products.0.name`
* **`Ecommerce Purchase Id`** にマッピングされた `adobeDataLayer.0.ecommerce.purchase.actionField.id`
* **`Ecommerce Product Category`** カスタムコード **&#x200B;**&#x200B;データ要素タイプ **[!UICONTROL と次のカスタムコードを使用する]** 要があります。

  ```javascript
  return adobeDataLayer[0].ecommerce.detail.products[0].category+":"+adobeDataLayer[0].ecommerce.detail.products[0].subcategory;
  ```

* 次のカスタムコードを使用して **`Ecommerce Cart Products`** きます。

  ```javascript
  const cartProducts = adobeDataLayer
  .flatMap(evt => Array.isArray(evt?.ecommerce?.cart?.items) ? evt.ecommerce.cart.items : [])
  .filter(item => item && item.id && item.name && item.brand)
  .map(({ id, name, brand }) => ({ id, name, brand }));
  
  return cartProducts;
  ```

* 次のカスタムコードを使用して **`Ecommerce Purchase Products`** きます。

  ```javascript
  const purchaseEvent = adobeDataLayer.find(e => e.event === "purchase");
  
  const currencyCode = purchaseEvent?.ecommerce?.currencyCode ?? "USD";
  
  const purchasedProducts = (purchaseEvent?.ecommerce?.purchase?.products || []).map(p => {
     const unitPrice = parseFloat(String(p.price).replace(/[^0-9.-]/g, "")) || 0;
     const qty = Number(p.quantity) || 0;
  
     return {
     SKU: p.id,                       // id -> SKU
     name: p.name,                    // name -> name
     quantity: qty,                   // quantity -> quantity
     priceTotal: unitPrice * qty,     // price -> priceTotal (unit price × quantity)
     currencyCode                     // "USD" -> currencyCode (from ecommerce.currencyCode)
     };
  });
  
  return(purchasedProducts);
  ```


>[!CAUTION]
>
>[!UICONTROL JavaScript変数 &#x200B;] データ要素タイプは、配列参照を角括弧ではなくドットとして扱うので、ユーザー名データ要素を `adobeDataLayer[0].page.name` **として参照することは機能しません**。

## XDM およびデータオブジェクト用の変数データ要素の作成

作成したデータ要素は、XDM オブジェクト（Platform アプリケーション用）とデータオブジェクト（Analytics、Target およびAudience Manager用）の作成に使用されます。 これらのオブジェクトには、非常に簡単に作成できる **[!UICONTROL 変数]** データ要素と呼ばれる独自の特別なデータ要素があります。

XDM の変数データ要素を作成するには、[&#x200B; スキーマの設定 &#x200B;](configure-schemas.md) レッスンで作成したスキーマに関連付けます。

1. 「**[!UICONTROL データ要素を追加]**」を選択します。
1. データ要素に `XDM Variable` という名前を付けます。 タグプロパティを整理しやすくするために、XDM に固有のデータ要素を「XDM」というプレフィックスを付けることをお勧めします
1. 「**[!UICONTROL Extension]**」として「**[!UICONTROL Adobe Experience Platform Web SDK]**」を選択します
1. **[!UICONTROL データ要素タイプ]** として **[!UICONTROL 変数]** を選択します。
1. **[!UICONTROL プロパティ]** として **[!UICONTROL XDM]** を選択します
1. スキーマを作成した **[!UICONTROL サンドボックス]** を選択します
1. 適切な **[!UICONTROL スキーマ]** を選択します。ここでは `Luma Web Event Data` です
1. 「**[!UICONTROL 保存]**」を選択します

   ![XDM の変数データ要素 &#x200B;](assets/analytics-tags-data-element-xdm-variable.png)

次に、データオブジェクトの変数データ要素を作成します。

1. 「**[!UICONTROL データ要素を追加]**」を選択します。
1. データ要素に `Data Variable` という名前を付けます。
1. 「**[!UICONTROL Extension]**」として「**[!UICONTROL Adobe Experience Platform Web SDK]**」を選択します
1. **[!UICONTROL データ要素タイプ]** として **[!UICONTROL 変数]** を選択します。
1. **[!UICONTROL data]** を **[!UICONTROL property]** として選択します
1. このチュートリアルの一部として実装するExperience Cloud ソリューションを選択します
1. 「**[!UICONTROL 保存]**」を選択します

   ![&#x200B; データオブジェクトの可変データ要素 &#x200B;](assets/data-element-data-variable.png)


これらの手順の最後で、次のデータ要素が作成されているはずです。

| コア拡張機能のデータ要素 | Platform Web SDK Extension のデータ要素 |
-----------------------------|-------------------------------
| `Ecommerce Cart Products` | `Data Variable` |
| `Ecommerce Product Category` | `XDM Variable` |
| `Ecommerce Product Id` | |
| `Ecommerce Product Name` | |
| `Ecommerce Purchase Id` | |
| `Ecommerce Purchase Products` | |
| `Page Name` | |
| `User Id` | |
| `User Logged In` | |

これらのデータ要素を配置すると、タグルールを使用して Platform Edge Networkへのデータ送信を開始する準備が整います。 ただし、最初に、Web SDKを使用して ID を収集する方法を説明します。

>[!NOTE]
>
>Adobe Experience Platform Web SDKの学習にご協力いただき、ありがとうございます。 ご不明な点がある場合や、一般的なフィードバックを共有したい場合、または今後のコンテンツに関するご提案がある場合は、この [Experience League Community Discussion の投稿でお知らせください &#x200B;](https://experienceleaguecommunities.adobe.com/adobe-experience-platform-18/tutorial-discussion-implement-adobe-experience-cloud-with-web-sdk-tutorial-248848)
