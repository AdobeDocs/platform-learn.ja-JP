---
title: パラメーターの送信 – Target を at.js 2.x から Web SDK に移行します
description: Experience Platform Web SDK を使用して、mbox、プロファイル、エンティティパラメーターをAdobe Targetに送信する方法を説明します。
source-git-commit: 009548969b88d1bfa6eac23f65b1ca2144f27c34
workflow-type: tm+mt
source-wordcount: '649'
ht-degree: 0%

---

# Platform Web SDK を使用した Target へのパラメーターの送信

Target の実装は、サイトのアーキテクチャ、ビジネス要件、使用される機能により、web サイト間で異なります。 ほとんどの Target 実装には、コンテキスト情報、オーディエンスおよびコンテンツの推奨事項に関する様々なパラメーターの受け渡しが含まれています。

単純な製品の詳細ページと注文確認ページを使用して、パラメーターを Target に渡す際の拡張機能の違いを示してみましょう。


| at.js パラメーターの例 | Platform Web SDK オプション | メモ |
| --- | --- | --- |
| `at_property` | なし | プロパティトークンは [datastream](https://experienceleague.adobe.com/docs/experience-platform/edge/datastreams/configure.html#target) で設定され、`sendEvent` 呼び出しでは設定できません。 |
| `pageName` | `xdm.web.webPageDetails.name` | すべての Target mbox パラメーターは、`xdm` オブジェクトの一部として渡され、XDM ExperienceEvent クラスを使用してスキーマに準拠する必要があります。 Mbox パラメーターを `data` オブジェクトの一部として渡すことはできません。 |
| `profile.gender` | `data.__adobe.target.profile.gender` | 適切にマッピングするには、すべての Target プロファイルパラメーターを `data` オブジェクトの一部として渡し、`profile.` のプレフィックスを付ける必要があります。 |
| `user.categoryId` | `data.__adobe.target.user.categoryId` | `data` オブジェクトの一部として渡す必要がある Target のカテゴリ親和性機能に使用される予約済みのパラメーター。 |
| `entity.id` | `data.__adobe.target.entity.id` <br> または <br> `xdm.productListItems[0].SKU` | エンティティ ID は、Target Recommendationsの行動カウンターに使用されます。 これらのエンティティ ID は、`data` オブジェクトの一部として渡すことも、実装でそのフィールドグループを使用している場合は `xdm.productListItems` 配列の最初の項目から自動的にマッピングすることもできます。 |
| `entity.categoryId` | `data.__adobe.target.entity.categoryId` | エンティティ カテゴリ ID は、`data` オブジェクトの一部として渡すことができます。 |
| `entity.customEntity` | `data.__adobe.target.entity.customEntity` | カスタムエンティティパラメーターは、Recommendations商品カタログの更新に使用されます。 これらのカスタムパラメーターは、`data` オブジェクトの一部として渡す必要があります。 |
| `cartIds` | `data.__adobe.target.cartIds` | Target の買い物かごベースのレコメンデーションアルゴリズムに使用します。 |
| `excludedIds` | `data.__adobe.target.excludedIds` | Recommendations デザインで特定のエンティティ ID が返されるのを防ぐために使用します。 |
| `mbox3rdPartyId` | `xdm.identityMap` オブジェクトに設定 | デバイスや顧客属性をまたいで Target プロファイルを同期するために使用します。 顧客 ID に使用する名前空間は、[ データストリームの Target 設定 ](https://experienceleague.adobe.com/docs/experience-platform/edge/personalization/adobe-target/using-mbox-3rdpartyid.html) で指定する必要があります。 |
| `orderId` | `xdm.commerce.order.purchaseID` | Target コンバージョントラッキングの一意の順序を識別するために使用します。 |
| `orderTotal` | `xdm.commerce.order.priceTotal` | Target のコンバージョンと最適化の目標で、注文の合計をトラッキングするために使用します。 |
| `productPurchasedId` | `data.__adobe.target.productPurchasedId` <br> または <br> `xdm.productListItems[0-n].SKU` | Target のコンバージョントラッキングとレコメンデーションアルゴリズムに使用します。 詳しくは、以下の [ エンティティパラメーター ](#entity-parameters) の節を参照してください。 |
| `mboxPageValue` | `data.__adobe.target.mboxPageValue` | [ カスタムスコア ](https://experienceleague.adobe.com/docs/target/using/activities/success-metrics/capture-score.html) アクティビティ目標に使用します。 |

{style="table-layout:auto"}

## カスタムパラメーター

カスタム mbox パラメーターは、XDM として、または `sendEvent` コマンドでデータオブジェクトを使用して渡す必要があります。 XDM スキーマに、Target 実装に必要なすべてのフィールドが含まれていることを確認することが重要です。


## プロファイルパラメーター

ターゲットプロファイルパラメーターを渡す必要があります…

## エンティティパラメーター

エンティティパラメーターは、Target Recommendationsの行動データと追加のカタログ情報を渡すために使用されます。 at.js でサポートされているすべての [ エンティティパラメーター ](https://experienceleague.adobe.com/docs/target/using/recommendations/entities/entity-attributes.html) も、Platform Web SDK でサポートされています。 プロファイルパラメーターと同様に、すべてのエンティティパラメーターは、Platform Web SDK `sendEvent` コマンドペイロードの `data.__adobe.target` オブジェクトの下に渡す必要があります。

適切にデータを取得するには、特定の項目のエンティティパラメーターの先頭に `entity.` を付ける必要があります。 Recommendations アルゴリズムの予約済みの `cartIds` と `excludedIds` のパラメーターにはプレフィックスを付けてはいけません。また、それぞれの値には、エンティティ ID のコンマ区切りリストを含める必要があります。



## 購入パラメーター

購入パラメーターは、注文が成功した後、注文確認ページで渡され、Target のコンバージョンと最適化の目標に使用されます。 最適化拡張機能を使用した Platform Mobile SDK の実装では、これらのパラメーターとが、`commerce` フィールドグループの一部として渡された XDM データから自動的にマッピングされます。


`commerce` フィールドグループが `1` に設定されている場合、購入情報 `purchases.value`Target に渡されます。 注文 ID と注文合計は、`order` オブジェクトから自動的にマッピングされます。 `productListItems` 配列が存在する場合、`SKU` の値が `productPurchasedId` に使用されます。


## 顧客 Id （mbox3rdPartyId）

Target では、単一の顧客 ID を使用して、デバイスやシステム間でプロファイルを同期できます。



次に、Platform Web SDK を使用して Target コンバージョンイベントを [ トラッキング ](track-events.md) する方法について説明します。

>[!NOTE]
>
>アドビは、Target 拡張機能から Optimize 拡張機能へのモバイルターゲットの移行を成功させるために取り組んでいます。 移行の際に問題が発生した場合、またはこのガイドに重要な情報が欠落していると感じる場合は、[ このコミュニティのディスカッション ](https://experienceleaguecommunities.adobe.com/t5/adobe-experience-platform-data/tutorial-discussion-migrate-target-from-at-js-to-web-sdk/m-p/575587#M463) に投稿してお知らせください。
