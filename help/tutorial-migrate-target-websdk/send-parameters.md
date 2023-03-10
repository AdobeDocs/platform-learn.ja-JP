---
title: 送信パラメーター | at.js 2.x から Web SDK への Target の移行
description: Experience PlatformWeb SDK を使用して、mbox、プロファイル、エンティティの各パラメーターをAdobe Targetに送信する方法について説明します。
source-git-commit: 287ebcb275c4fca574dbd6cdf7e07ba4268bddb5
workflow-type: tm+mt
source-wordcount: '1646'
ht-degree: 1%

---

# Platform Web SDK を使用して Target にパラメーターを送信する

Target の実装は、サイトのアーキテクチャ、ビジネス要件、使用する機能によって Web サイト間で異なります。 ほとんどの Target 実装には、コンテキスト情報、オーディエンスおよびコンテンツレコメンデーション用の様々なパラメーターを渡す機能が含まれています。

シンプルな製品の詳細ページと注文の確認ページを使用して、Target にパラメーターを渡す際のライブラリの違いを示します。

at.js を使用する 2 つのページの例を次に示します。

+++at.js を製品の詳細ページに追加します。

```HTML
<!doctype html>
<html>
<head>
  <title>Product Details - Men's Shirt</title>
  <!--Target parameters -->
  <script>
    targetPageParams = function() {
      return {
        // Property token
        "at_property": "5a0fd9bb-67de-4b5a-0fd7-9cc09f50a58d",
        // Mbox parameters
        "pageName": "product detail",
        // Profile parameters
        "profile.gender": "male",
        "user.categoryId": "clothing",
        // Entity parameters for Target Recomendations
        "entity.id": "SKU-00001-LARGE",
        "entity.categoryId": "clothing,shirts",
        "entity.customEntity": "some value",
        "cartIds": "SKU-00002,SKU-00003",
        "excludedIds": "SKU-00001-SMALL",
        // Customer ID for cross-device profile synching and Customer Attributes
        "mbox3rdPartyId": "TT8675309",
      };
    };
  </script>
  <!--Target at.js library loaded asynchonously-->
  <script src="/libraries/at.js" async></script>
</head>
<body>
  <h1 id="title">Men's Large Shirt</h1>
  <p>SKU: SKU-00001-LARGE</p>
</body>
</html>
```

+++


+++at.js を注文の確認ページに表示：

```HTML
<!doctype html>
<html>
<head>
  <title>Order Confirmation</title>-->
  <!--Target parameters -->
  <script>
    targetPageParams = function() {
      return {
        // Property token
        "at_property": "5a0fd9bb-67de-4b5a-0fd7-9cc09f50a58d",
        // Order confirmation parameters
        "orderId": "ABC123",
        "productPurchasedId": "SKU-00002,SKU-00003",
        "orderTotal": 1337.89,
        // Customer ID for cross-device profile synching and Customer Attributes
        "mbox3rdPartyId": "TT8675309",
      };
    };
  </script>
  <!--Target at.js library loaded asynchonously-->
  <script src="/libraries/at.js" async></script>
</head>
<body>
  <h1 id="title">Order Confirmation</h1>
  <p>Thank you for your order</p>
</body>
</html>
```

+++


## パラメーターマッピングの概要

Platform Web SDK を使用した場合、これらのページの Target パラメーターの送信方法が異なります。 at.js を使用して Target にパラメーターを渡す方法は複数あります。

- 次で設定： `targetPageParams()` 関数をページ読み込みイベントに対して使用します（このページの例で使用）。
- 次で設定： `targetPageParamsAll()` 関数を使用して、ページ上のすべての Target リクエストに対して
- を使用して直接パラメーターを送信 `getOffer()` 単一の場所に対する関数
- を使用して直接パラメーターを送信 `getOffers()` 1 つ以上の場所で機能


Platform Web SDK は、追加の関数を必要とせずに、1 つの一貫した方法でデータを送信できます。 すべてのパラメーターは、 `sendEvent` コマンドを使用し、次の 2 つのカテゴリに分類できます。

- 自動的に `xdm` object
- を使用して手動で渡す `data.__adobe.target` object

次の表に、Platform Web SDK を使用してパラメーターの例を再マッピングする方法を示します。

| at.js パラメーターの例 | Platform Web SDK オプション | メモ |
| --- | --- | --- |
| `at_property` | 該当なし | プロパティトークンは、 [datastream](https://experienceleague.adobe.com/docs/experience-platform/edge/datastreams/configure.html#target) また、 `sendEvent` 呼び出し。 |
| `pageName` | `xdm.web.webPageDetails.name` | すべての Target mbox パラメーターは、 `xdm` オブジェクトを作成し、XDM ExperienceEvent クラスを使用してスキーマに準拠します。 mbox パラメーターは、 `data` オブジェクト。 |
| `profile.gender` | `data.__adobe.target.profile.gender` | すべての Target プロファイルパラメーターは、 `data` オブジェクトと `profile.` を適切にマッピングする必要があります。 |
| `user.categoryId` | `data.__adobe.target.user.categoryId` | Target のカテゴリ親和性機能で使用される、の一部として渡す必要がある予約済みパラメーター `data` オブジェクト。 |
| `entity.id` | `data.__adobe.target.entity.id` <br>または<br> `xdm.productListItems[0].SKU` | エンティティ ID は、Target Recommendations行動カウンターで使用されます。 これらのエンティティ ID は、 `data` オブジェクトまたは `xdm.productListItems` 配列を返します。 |
| `entity.categoryId` | `data.__adobe.target.entity.categoryId` | エンティティカテゴリ ID は `data` オブジェクト。 |
| `entity.customEntity` | `data.__adobe.target.entity.customEntity` | カスタムエンティティパラメーターは、Recommendations製品カタログの更新に使用されます。 これらのカスタムパラメーターは、 `data` オブジェクト。 |
| `cartIds` | `data.__adobe.target.cartIds` | Target の買い物かごベースの Recommendations アルゴリズムに使用されます。 |
| `excludedIds` | `data.__adobe.target.excludedIds` | 特定のエンティティ ID が Recommendations デザインで返されるのを防ぐために使用します。 |
| `mbox3rdPartyId` | を `xdm.identityMap` object | デバイスと顧客属性をまたいで Target プロファイルを同期するために使用されます。 顧客 ID に使用する名前空間は、 [データストリームのターゲット設定](https://experienceleague.adobe.com/docs/experience-platform/edge/personalization/adobe-target/using-mbox-3rdpartyid.html). |
| `orderId` | `xdm.commerce.order.purchaseID` | Target コンバージョントラッキングの一意の注文を識別するために使用します。 |
| `orderTotal` | `xdm.commerce.order.priceTotal` | Target のコンバージョンと最適化目標の注文合計の追跡に使用します。 |
| `productPurchasedId` | `data.__adobe.target.productPurchasedId` <br>または<br> `xdm.productListItems[0-n].SKU` | Target のコンバージョントラッキングおよび Recommendations アルゴリズムで使用されます。 詳しくは、 [エンティティパラメーター](#entity-parameters) 詳しくは、以下の節を参照してください。 |
| `mboxPageValue` | `data.__adobe.target.mboxPageValue` | 次に使用 [カスタムスコアリング](https://experienceleague.adobe.com/docs/target/using/activities/success-metrics/capture-score.html) アクティビティ目標。 |

{style=&quot;table-layout:auto&quot;}

## カスタムパラメーター

カスタム mbox パラメーターは、 `sendEvent` コマンドを使用します。 XDM スキーマに、Target 実装に必要なすべてのフィールドが含まれていることを確認することが重要です。

at.js の使用例 `targetPageParams()`:

```JavaScript
targetPageParams = function() {
  return {
    "pageName": "product detail"
  };
};
```

Platform Web SDK JavaScript の例と使用 `sendEvent` コマンド：

>[!BEGINTABS]

>[!TAB JavaScript]

```JavaScript
alloy("sendEvent", {
  "xdm": {
    "web": {
      "webPageDetails": {
        // Other attributes included according to xdm schema
        "name": "product detail"
      }
    }
  }
});
```

>[!TAB タグ]

タグでは、最初に [!UICONTROL XDM オブジェクト] XDM フィールドにマッピングするデータ要素：

![XDM オブジェクトデータ要素の XDM フィールドへのマッピング](assets/params-tags-pageName.png){zoomable=&quot;yes&quot;}

次に、 [!UICONTROL XDM オブジェクト] の [!UICONTROL イベントを送信] [!UICONTROL アクション] ( 複数 [!UICONTROL XDM オブジェクト] は [結合済み](https://experienceleague.adobe.com/docs/experience-platform/tags/extensions/client/core/overview.html?lang=en#merged-objects)):

![Send イベントに XDM オブジェクトデータ要素を含める](assets/params-tags-sendEvent.png){zoomable=&quot;yes&quot;}

>[!ENDTABS]


>[!NOTE]
>
>カスタム mbox パラメーターは `xdm` オブジェクトの名前を変更し、mbox パラメーターを参照するオーディエンス、アクティビティまたはプロファイルスクリプトを更新する必要があります。 詳しくは、 [Platform Web SDK の互換性を考慮した Target オーディエンスとプロファイルスクリプトの更新](update-audiences.md) このチュートリアルのページを参照してください。


## プロファイルパラメーター

Target プロファイルパラメーターは、 `data.__adobe.target` Platform Web SDK のオブジェクト `sendEvent` コマンドペイロード。

at.js と同様に、すべてのプロファイルパラメーターの前にも、 `profile.` の値が永続的な Target プロファイル属性として適切に保存されるようにします。 予約済み `user.categoryId` Target のカテゴリ親和性機能のパラメーターには、「 `user.`.

at.js の使用例 `targetPageParams()`:

```JavaScript
targetPageParams = function() {
  return {
    "profile.gender": "male",
    "user.categoryId": "clothing"
  };
};
```

Platform Web SDK の使用例 `sendEvent` コマンド：

>[!BEGINTABS]

>[!TAB JavaScript]

```JavaScript
alloy("sendEvent", {
  "data": {
    "__adobe": {
      "target": {
        "profile.gender": "male",
        "user.categoryId": "clothing"
      }
    }
  }
});
```

>[!TAB タグ]

タグで、最初にデータ要素を作成し、 `data.__adobe.target` オブジェクト：

![データ要素でのデータオブジェクトの定義](assets/params-tags-dataObject.png){zoomable=&quot;yes&quot;}

次に、 [!UICONTROL イベントを送信] [!UICONTROL アクション] ( 複数 [!UICONTROL オブジェクト] は [結合済み](https://experienceleague.adobe.com/docs/experience-platform/tags/extensions/client/core/overview.html?lang=en#merged-objects)):

![Send イベントにデータオブジェクトを含める](assets/params-tags-sendEvent-withData.png){zoomable=&quot;yes&quot;}

>[!ENDTABS]

## エンティティパラメーター

エンティティパラメーターは、Target Recommendationsの行動データと追加のカタログ情報を渡すために使用されます。 すべて [エンティティパラメーター](https://experienceleague.adobe.com/docs/target/using/recommendations/entities/entity-attributes.html) at.js でサポートされているのは、Platform Web SDK でもサポートされています。 プロファイルパラメーターと同様、すべてのエンティティパラメーターは、 `data.__adobe.target` Platform Web SDK のオブジェクト `sendEvent` コマンドペイロード。

特定の項目のエンティティパラメーターの前には、「 」を付ける必要があります `entity.` 適切なデータキャプチャを行うために。 予約済み `cartIds` および `excludedIds` recommendations アルゴリズムのパラメーターの前にはを付けないでください。また、各値には、エンティティ ID のコンマ区切りリストを含める必要があります。

at.js の使用例 `targetPageParams()`:

```JavaScript
targetPageParams = function() {
  return {
    "entity.id": "SKU-00001-LARGE",
    "entity.categoryId": "clothing,shirts",
    "entity.customEntity": "some value",
    "cartIds": "SKU-00002,SKU-00003",
    "excludedIds": "SKU-00001-SMALL"
  };
};
```

Platform Web SDK の使用例 `sendEvent` コマンド：

>[!BEGINTABS]

>[!TAB JavaScript]

```JavaScript
alloy("sendEvent", {
  "data": {
    "__adobe": {
      "target": {
        "entity.id": "SKU-00001-LARGE",
        "entity.categoryId": "clothing,shirts",
        "entity.customEntity": "some value",
        "cartIds": "SKU-00002,SKU-00003",
        "excludedIds": "SKU-00001-SMALL"
      }
    }
  }
});
```

>[!TAB タグ]

タグで、最初にデータ要素を作成し、 `data.__adobe.target` オブジェクト：

![データ要素でのデータオブジェクトの定義](assets/params-tags-dataObject-entities.png){zoomable=&quot;yes&quot;}

次に、 [!UICONTROL イベントを送信] [!UICONTROL アクション] ( 複数 [!UICONTROL オブジェクト] は [結合済み](https://experienceleague.adobe.com/docs/experience-platform/tags/extensions/client/core/overview.html?lang=en#merged-objects)):

![Send イベントにデータオブジェクトを含める](assets/params-tags-sendEvent-withData.png){zoomable=&quot;yes&quot;}

>[!ENDTABS]

>[!NOTE]
>
>この `commerce` フィールドグループが使用され、 `productListItems` 配列が XDM ペイロードに含まれ、最初の `SKU` この配列の値が次にマッピングされている： `entity.id` 製品表示を増分する目的で


## 購入パラメーター

購入パラメーターは、注文が成功した後、注文確認ページで渡され、Target のコンバージョンと最適化の目標に使用されます。 Platform Web SDK 実装では、これらのパラメーターおよびは、 `commerce` フィールドグループを使用します。

at.js の使用例 `targetPageParams()`:

```JavaScript
targetPageParams = function() {
  return {
    "orderId": "ABC123",
    "productPurchasedId": "SKU-00002,SKU-00003"
    "orderTotal": 1337.89
  };
};
```

購入情報は、 `commerce` フィールドグループが次の値を持つ `purchases.value` に設定 `1`. 注文 ID と注文の合計は、 `order` オブジェクト。 この `productListItems` 配列が存在する場合、 `SKU` 値は次の場合に使用されます。 `productPurchasedId`.

Platform Web SDK の使用例 `sendEvent` コマンド：

>[!BEGINTABS]

>[!TAB JavaScript]

```JavaScript
alloy("sendEvent", {
  "xdm": {
    "commerce": {
      "order": {
        "purchaseID": "ABC123",
        "priceTotal": 1337.89
      },
      "purchases": {
        "value": 1
      }
    },
    "productListItems": [{
      "SKU": "SKU-00002"
    }, {
      "SKU": "SKU-00003"
    }]
  }
});
```

>[!TAB タグ]

タグでは、最初に [!UICONTROL XDM オブジェクト] XDM フィールドにマッピングするデータ要素：

![XDM オブジェクトデータ要素の XDM フィールドへのマッピング](assets/params-tags-purchase.png){zoomable=&quot;yes&quot;}

次に、 [!UICONTROL XDM オブジェクト] の [!UICONTROL イベントを送信] [!UICONTROL アクション] ( 複数 [!UICONTROL XDM オブジェクト] は [結合済み](https://experienceleague.adobe.com/docs/experience-platform/tags/extensions/client/core/overview.html?lang=en#merged-objects)):

![Send イベントに XDM オブジェクトデータ要素を含める](assets/params-tags-sendEvent-purchase.png){zoomable=&quot;yes&quot;}

>[!ENDTABS]


>[!NOTE]
>
>この `productPurchasedId` の値は、 `data` オブジェクト。


## 顧客 ID (mbox3rdPartyId)

Target では、1 つの顧客 ID を使用して、デバイスやシステム間でプロファイルを同期できます。 at.js を使用すると、これを `mbox3rdPartyId` （Target リクエスト内）、またはExperience CloudID サービスに最初に送信された顧客 id。 at.js とは異なり、Platform Web SDK の実装では、 `mbox3rdPartyId` 複数の値が存在する場合は、 例えば、ビジネスにグローバル顧客 ID と異なる事業部門向けに個別の顧客 ID がある場合、どの ID Target を使用するかを設定できます。

Target のクロスデバイスおよび顧客属性の使用例に対して ID 同期を設定するには、次の手順を実行します。

1. の作成 **[!UICONTROL id 名前空間]** の顧客 ID **[!UICONTROL ID]** データ収集またはプラットフォームの画面
1. 必ず **[!UICONTROL エイリアス]** 顧客属性では **[!UICONTROL 識別記号]** /
1. 次を指定： **[!UICONTROL インディティ記号]** を **[!UICONTROL Target サードパーティ ID 名前空間]** （データストリームの Target 設定）
1. の実行 `sendEvent` コマンドを使用する `identityMap` フィールドグループ

at.js の使用例 `targetPageParams()`:

```JavaScript
targetPageParams = function() {
  return {
    "mbox3rdPartyId": "TT8675309"
  };
};
```

Platform Web SDK の使用例 `sendEvent` コマンド：

>[!BEGINTABS]

>[!TAB JavaScript]

```JavaScript
alloy("sendEvent", {
  "xdm": {
    "identityMap": {
      "GLOBAL_CUSTOMER_ID": [{
        "id": "TT8675309",
        "authenticatedState": "authenticated"
      }]
    }
  }
});
```

>[!TAB タグ]

この [!UICONTROL ID] 値 [!UICONTROL 認証状態] および [!UICONTROL 名前空間] が [!UICONTROL ID マップ] データ要素：
![顧客 ID をキャプチャする ID マップデータ要素](assets/params-tags-customerIdDataElement.png){zoomable=&quot;yes&quot;}

この [!UICONTROL ID マップ] 次に、データ要素を使用して [!UICONTROL identityMap] フィールド [!UICONTROL XDM オブジェクト] データ要素：
![XDM オブジェクトデータ要素で使用される ID マップデータ要素](assets/params-tags-customerIdInXDMObject.png){zoomable=&quot;yes&quot;}

この [!UICONTROL XDM オブジェクト] が [!UICONTROL イベントを送信] ルールのアクション：

![Send イベントに XDM オブジェクトデータ要素を含める](assets/params-tags-sendEvent-xdm.png){zoomable=&quot;yes&quot;}

データストリームのAdobe Targetサービスで、必ず [!UICONTROL Target サードパーティ ID 名前空間] を [!UICONTROL ID マップ] データ要素：
![データストリームでの Target サードパーティ ID 名前空間の設定](assets/params-tags-customerIdNamespaceInDatastream.png){zoomable=&quot;yes&quot;}

>[!ENDTABS]

## Platform Web SDK の例

これで、Platform Web SDK を使用して様々な Target パラメーターをマッピングする方法を理解できました。次に示すように、2 つのページ例を at.js から Platform Web SDK に移行できます。 この例のページは次のとおりです。

- 非同期ライブラリ実装のスニペットを事前に非表示にする Target
- Platform Web SDK ベースコード
- Platform Web SDK JavaScript ライブラリ
- A `configure` ライブラリを初期化するコマンド
- A `sendEvent` データを送信し、レンダリングする Target コンテンツを要求するコマンド

+++製品の詳細ページの Web SDK:

```HTML
<!doctype html>
<html>
<head>
  <title>Product Details - Men's Shirt</title>

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

  <!--Configure Platform Web SDK and send event-->
  <script>
    alloy("configure", {
      "edgeConfigId": "ebebf826-a01f-4458-8cec-ef61de241c93",
      "orgId":"ADB3LETTERSANDNUMBERS@AdobeOrg"
    });
    alloy("sendEvent", {
      "renderDecisions": true,
      "xdm": {
        "identityMap": {
          "GLOBAL_CUSTOMER_ID": [{
            "id": "TT8675309",
            "authenticatedState": "authenticated"
          }]
        },
        "web": {
          "webPageDetails": {
            // Other attributes included according to XDM schema
            "pageName": "product detail"
          }
        }
      },
      "data": {
        "__adobe": {
          "target": {
            "profile.gender": "male",
            "user.categoryId": "clothing",
            "entity.id": "SKU-00001-LARGE",
            "entity.categoryId": "clothing,shirts",
            "entity.customEntity": "some value",
            "cartIds": "SKU-00002,SKU-00003",
            "excludedIds": "SKU-00001-SMALL"
          }
        }
      }
    });
  </script>
</head>
<body>
  <h1 id="title">Men's Large Shirt</h1>
  <p>SKU: SKU-00001-LARGE</p>
</body>
</html>
```

+++

+++注文の確認ページの Web SDK:

```HTML
<!doctype html>
<html>
<head>
  <title>Order Confirmation</title>


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

  <!--Configure Platform Web SDK and send event-->
  <script>
    alloy("configure", {
      "edgeConfigId": "ebebf826-a01f-4458-8cec-ef61de241c93",
      "orgId":"ADB3LETTERSANDNUMBERS@AdobeOrg"
    });
    alloy("sendEvent", {
      "xdm": {
        "identityMap": {
          "GLOBAL_CUSTOMER_ID": [{
            "id": "TT8675309",
            "authenticatedState": "authenticated"
          }]
        },
        "commerce": {
          "order": {
            "purchaseID": "ABC123",
            "priceTotal": 1337.89
          },
          "purchases": {
            "value": 1
          }
        },
        "productListItems": [{
          "SKU": "SKU-00002"
        }, {
          "SKU": "SKU-00003"
        }]
      }
    });
  </script>
</head>
<body>
  <h1 id="title">Order Confirmation</h1>
  <p>Thank you for your order</p>
</body>
</html>
```

+++

次に、 [Target コンバージョンイベントの追跡](track-events.md) Platform Web SDK を使用して、

>[!NOTE]
>
>at.js から Web SDK への Target の移行を成功に導くための支援に努めています。 移行時に障害が発生した場合や、このガイドに重要な情報が欠落していると思われる場合は、 [このコミュニティディスカッション](https://experienceleaguecommunities.adobe.com/t5/adobe-experience-platform-data/tutorial-discussion-migrate-target-from-at-js-to-web-sdk/m-p/575587#M463).
