---
title: パラメーターの送信 – モバイルアプリのAdobe Target実装をOffer Decisioningおよび Target 拡張機能に移行します
description: Experience Platform Web SDKを使用して、mbox、プロファイル、エンティティパラメーターをAdobe Targetに送信する方法について説明します。
exl-id: 927d83f9-c019-4a6b-abef-21054ce0991b
source-git-commit: 876e664a213aec954105bf2d5547baab5d8a84ea
workflow-type: tm+mt
source-wordcount: '786'
ht-degree: 1%

---

# Offer Decisioningと Target 拡張機能を使用した Target へのパラメーターの送信

Target の実装は、アプリケーションのアーキテクチャ、ビジネス要件、使用される機能によって、モバイルアプリケーション間で異なります。 ほとんどの Target 実装には、コンテキスト情報、オーディエンスおよびコンテンツの推奨事項に関する様々なパラメーターの受け渡しが含まれています。

Target 拡張機能では、すべての Target パラメーターが `TargetParameters` 関数を使用して渡されました。

Offer Decisioningと Target 拡張機能を使用した場合：

* 複数のAdobe アプリケーション向けのパラメーターは、XDM オブジェクトで渡すことができます
* Target 専用のパラメーターは、`data.__adobe.target` オブジェクトで渡すことができます


>[!IMPORTANT]
>
> 意思決定拡張機能では、リクエストで送信されるパラメーターは、リクエスト内のすべてのスコープに適用されます。 異なるスコープに異なるパラメーターを設定する必要がある場合は、追加のリクエストを行う必要があります。

## カスタムパラメーター

カスタム mbox パラメーターは、データを Target に渡す最も基本的な方法で、`xdm` オブジェクトまたは `data.__adobe.target` オブジェクトで渡すことができます。

## プロファイルパラメーター

プロファイルパラメーターは、ユーザーの Target プロファイルに長期間データを格納するもので、`data.__adobe.target` オブジェクトに渡す必要があります。

## エンティティパラメーター

[&#x200B; エンティティパラメーター &#x200B;](https://experienceleague.adobe.com/ja/docs/target/using/recommendations/entities/entity-attributes) は、Target Recommendations の行動データと追加のカタログ情報を渡すために使用されます。 プロファイルパラメーターと同様に、ほとんどのエンティティパラメーターは `data.__adobe.target` オブジェクトの下に渡す必要があります。 唯一の例外は、`xdm.productListItems` 配列が存在する場合で、最初の `SKU` 値が `entity.id` として使用されます。

適切にデータを取得するには、特定の項目のエンティティパラメーターの先頭に `entity.` を付ける必要があります。 Recommendations アルゴリズムの予約済みの `cartIds` と `excludedIds` のパラメーターにはプレフィックスを付けてはいけません。また、それぞれの値には、エンティティ ID のコンマ区切りリストを含める必要があります。

## 購入パラメーター

購入パラメーターは、注文が成功した後、注文確認ページで渡され、Target のコンバージョンと最適化の目標に使用されます。 Offer Decisioningと Target 拡張機能を使用した Platform Mobile SDKの実装により、これらのパラメーターおよびは、`commerce` フィールドグループの一部として渡される XDM データから自動的にマッピングされます。

`commerce` フィールドグループが `purchases.value` に設定されている場合、購入情報 `1`Target に渡されます。 注文 ID と注文合計は、`order` オブジェクトから自動的にマッピングされます。 `productListItems` 配列が存在する場合、`SKU` の値が `productPurchasedId` に使用されます。

`commerce` オブジェクトで `xdm` フィールドを渡さない場合は、`data.__adobe.target.orderId`、`data.__adobe.target.orderTotal`、`data.__adobe.target.productPurchasedId` の各フィールドを使用して、注文の詳細を target に渡すことができます。

## 顧客 Id （mbox3rdPartyId）

Target では、単一の顧客 ID を使用して、デバイスやシステム間でプロファイルを同期できます。 この顧客 ID は、XDM オブジェクトの `identityMap` フィールドに渡し、データストリームのターゲットサードパーティ ID フィールドにマッピングする必要があります。

## テーブル

| at.js パラメーターの例 | Platform Web SDK オプション | メモ |
| --- | --- | --- |
| `at_property` | なし | プロパティトークンは [datastream](https://experienceleague.adobe.com/ja/docs/experience-platform/datastreams/configure#target) で設定され、`sendEvent` 呼び出しでは設定できません。 |
| `pageName` | `xdm.web.webPageDetails.name` または <br> `data.__adobe.target.pageName` | ターゲット mbox パラメーターは、`xdm` オブジェクトの一部または `data.__adobe.target` オブジェクトの一部として渡すことができます。 |
| `profile.gender` | `data.__adobe.target.profile.gender` | 適切にマッピングするには、すべての Target プロファイルパラメーターを `data` オブジェクトの一部として渡し、`profile.` のプレフィックスを付ける必要があります。 |
| `user.categoryId` | `data.__adobe.target.user.categoryId` | `data` オブジェクトの一部として渡す必要がある Target のカテゴリ親和性機能に使用される予約済みのパラメーター。 |
| `entity.id` | `data.__adobe.target.entity.id` <br> または <br> `xdm.productListItems[0].SKU` | エンティティ ID は、Target Recommendations の行動カウンターに使用されます。 これらのエンティティ ID は、`data` オブジェクトの一部として渡すことも、実装でそのフィールドグループを使用している場合は `xdm.productListItems` 配列の最初の項目から自動的にマッピングすることもできます。 |
| `entity.categoryId` | `data.__adobe.target.entity.categoryId` | エンティティ カテゴリ ID は、`data` オブジェクトの一部として渡すことができます。 |
| `entity.customEntity` | `data.__adobe.target.entity.customEntity` | カスタムエンティティパラメーターは、Recommendations 製品カタログの更新に使用されます。 これらのカスタムパラメーターは、`data` オブジェクトの一部として渡す必要があります。 |
| `cartIds` | `data.__adobe.target.cartIds` | Target の買い物かごベースのレコメンデーションアルゴリズムに使用します。 |
| `excludedIds` | `data.__adobe.target.excludedIds` | Recommendations デザインで特定のエンティティ ID が返されるのを防ぐために使用します。 |
| `mbox3rdPartyId` | `xdm.identityMap` オブジェクトに設定 | デバイスや顧客属性をまたいで Target プロファイルを同期するために使用します。 顧客 ID に使用する名前空間は、[&#x200B; データストリームの Target 設定 &#x200B;](https://experienceleague.adobe.com/ja/docs/experience-platform/edge/personalization/adobe-target/using-mbox-3rdpartyid) で指定する必要があります。 |
| `orderId` | `xdm.commerce.order.purchaseID`<br> （`commerce.purchases.value` が `1` に設定されている場合） <br> または <br> `data.__adobe.target.orderId` | Target コンバージョントラッキングの一意の順序を識別するために使用します。 |
| `orderTotal` | `xdm.commerce.order.priceTotal`<br> （`commerce.purchases.value` が `1` に設定されている場合） <br> または <br> `data.__adobe.target.orderTotal` | Target のコンバージョンと最適化の目標で、注文の合計をトラッキングするために使用します。 |
| `productPurchasedId` | `xdm.productListItems[0-n].SKU`<br> （`commerce.purchases.value` が `1` に設定されている場合） <br>OR<br> `data.__adobe.target.productPurchasedId` | Target のコンバージョントラッキングとレコメンデーションアルゴリズムに使用します。 |
| `mboxPageValue` | `data.__adobe.target.mboxPageValue` | [&#x200B; カスタムスコア &#x200B;](https://experienceleague.adobe.com/ja/docs/target/using/activities/success-metrics/capture-score) アクティビティ目標に使用します。 |

{style="table-layout:auto"}


## パラメーターを渡す例

簡単な例を使用して、Target にパラメーターを渡す際の拡張機能の違いを示してみましょう。

### Android

>[!BEGINTABS]

>[!TAB SDKの最適化 ]

```Java
final Map<String, Object> data = new HashMap<>();
final Map<String, String> targetParameters = new HashMap<>();
 
// Mbox parameters
targetParameters.put("status", "platinum");
 
// Profile parameters - prefix with profile.
targetParameters.put("profile.gender", "male");
 
// Product parameters
targetParameters.put("productId", "pId1");
targetParameters.put("categoryId", "cId1");
 
// Order parameters
targetParameters.put("orderId", "id1");
targetParameters.put("orderTotal", "1.0");
targetParameters.put("purchasedProductIds", "ppId1");
 
data.put("__adobe", new HashMap<String, Object>() {
  {
    put("target", targetParameters);
  }
});
 
// Target location (or mbox)
final DecisionScope decisionScope = DecisionScope("myTargetLocation")
 
final List<DecisionScope> decisionScopes = new ArrayList<>();
decisionScopes.add(decisionScope);
 
Optimize.updatePropositions(decisionScopes, null, data);
```

>[!TAB Target SDK]

```Java
Map<String, String> mboxParameters = new HashMap<String, String>();
mboxParameters1.put("status", "platinum");
 
Map<String, String> profileParameters = new HashMap<String, String>();
profileParameters1.put("gender", "male");
 
List<String> purchasedProductIds = new ArrayList<String>();
purchasedProductIds.add("ppId1");
TargetOrder targetOrder = new TargetOrder("id1", 1.0, purchasedProductIds);
 
TargetProduct targetProduct = new TargetProduct("pId1", "cId1");
 
TargetParameters targetParameters = new TargetParameters.Builder()
                                    .parameters(mboxParameters)
                                    .profileParameters(profileParameters)
                                    .product(targetProduct)
                                    .order(targetOrder)
                                    .build();
```

>[!ENDTABS]

### iOS

>[!BEGINTABS]

>[!TAB SDKの最適化 ]

```Swift
var data: [String: Any] = [:]
var targetParameters: [String: String] = [:]
 
// Mbox parameters
targetParameters["status"] = "platinum"
 
// Profile parameters - prefix with profile.
targetParameters["profile.gender"] = "make"
 
// Product parameters
targetParameters["productId"] = "pId1"
targetParameters["categoryId"] = "cId1"
 
// Add order parameters
targetParameters["orderId"] = "id1"
targetParameters["orderTotal"] = "1.0"
targetParameters["purchasedProductIds"] = "ppId1"
 
data["__adobe"] = [
  "target": targetParameters
]
 
// Target location (or mbox)
let decisionScope = DecisionScope(name: "myTargetLocation")
Optimize.updatePropositions(for: [decisionScope] withXdm: nil andData: data)
```

>[!TAB Target SDK]

```Swift
let mboxParameters = [
                        "status": "platinum"
                     ]
 
let profileParameters = [
                            "gender": "male"
                        ]
 
let order = TargetOrder(id: "id1", total: 1.0, purchasedProductIds: ["ppId1"])
 
let product = TargetProduct(productId: "pId1", categoryId: "cId1")
 
let targetParameters = TargetParameters(parameters: mboxParameters, profileParameters: profileParameters, order: order, product: product))
```


>[!ENDTABS]






次に、Platform web SDKを使用して Target コンバージョンイベントを [&#x200B; トラッキング &#x200B;](track-events.md) する方法について説明します。

>[!NOTE]
>
>アドビは、Target 拡張機能からOffer Decisioningおよび Target 拡張機能への Mobile Target の移行を成功させるために取り組んでいます。 移行の際に問題が発生した場合、またはこのガイドに重要な情報が欠落していると感じる場合は、[&#x200B; このコミュニティのディスカッション &#x200B;](https://experienceleaguecommunities.adobe.com/t5/adobe-experience-platform-data/tutorial-discussion-migrate-adobe-target-to-mobile-sdk-on-edge/m-p/747484?profile.language=ja#M625) に投稿してお知らせください。
