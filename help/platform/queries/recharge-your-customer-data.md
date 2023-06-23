---
title: 顧客データを充実させ、エクスペリエンスを実現
description: 低品質のデータの影響を軽減し、価値までの時間を短縮し、多くの使用例に同じデータを使用して ROI を増やす方法を説明します。
role: Data Engineer, Data Architect, Developer
feature: Queries
jira: KT-10323
thumbnail: 342533.jpeg
exl-id: 30574cc5-66fa-4ab8-83ed-7af710294dbf
source-git-commit: 90f7621536573f60ac6585404b1ac0e49cb08496
workflow-type: tm+mt
source-wordcount: '172'
ht-degree: 3%

---

# 顧客データを充実させ、エクスペリエンスを実現

オムニチャネルデータは、アクティベーションを調整し、結果として生じるカスタマージャーニーを測定するためにマーケターが使用する、実用的な顧客プロファイルを強化するための重要な要素です。 しかし、組織は、このデータの品質、規模、様々な管理に関して課題に直面しています。 低品質のデータの影響を軽減し、価値までの時間を短縮し、多くの用途に同じデータを使用して ROI を増やすために、合理化されたソリューションが必要です。

このビデオでは、次の内容について説明します。

* Adobe Experience Platformの
* Adobe Real-Time CDP、Adobe Journey Optimizer、Customer Journey Analyticsによる ROI の向上

>[!VIDEO](https://video.tv.adobe.com/v/342533?quality=12&learn=on)

## SQL の例

```sql
INSERT INTO summit_adv_data_prep_dataset
SELECT STRUCT(
customerId AS crmCustomerId, struct(sku AS sku, price AS sku_price, abandonTS AS abandonTS) AS abandonBrowse) AS _pfreportingonprod
FROM
(SELECT
B.personKey.sourceID AS customerId,
A.productListItems[0].SKU AS sku,
max(A.timestamp) AS abandonTS,
max(C._pfreportingonprod.price) AS price
FROM summit_adobe_analytics_dataset A,profile_attribute_14adf268_2a20_4dee_bee6_a6b0e34616a9 B,summit_product_dataset C
WHERE A._experience.analytics.customDimensions.eVars.eVar1 = B.personKey.sourceID
AND A.productListItems[0].sku = C._pfreportingonprod.sku
AND A.web.webpagedetails.URL NOT LIKE '%orderconfirmation%'
AND timestamp > current_date - interval '4 day'
GROUP BY customerId,sku
order by price desc)D;
```

詳しくは、 [クエリサービスドキュメント](https://experienceleague.adobe.com/docs/experience-platform/query/home.html?lang=ja).

>[!NOTE]
>
>このビデオは、Adobe Summit2020 セッションの抜粋です *[エクスペリエンスを帯電させるためのオムニチャネルデータの再充電](https://business.adobe.com/summit/2022/sessions/recharging-omnichannel-data-for-electrifying-exper-s409.html)*.
