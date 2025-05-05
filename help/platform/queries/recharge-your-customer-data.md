---
title: 顧客データを再充電して、魅力的なエクスペリエンスを提供します
description: 多数のユースケースに同じデータを使用することで、低品質データの影響を軽減し、価値創出までの時間を短縮し、ROI を向上させる方法を説明します。
feature: Queries
role: Data Engineer, Data Architect, Developer
level: Beginner
jira: KT-10323
thumbnail: 342533.jpeg
exl-id: 30574cc5-66fa-4ab8-83ed-7af710294dbf
source-git-commit: 286c85aa88d44574f00ded67f0de8e0c945a153e
workflow-type: tm+mt
source-wordcount: '163'
ht-degree: 0%

---

# 顧客データを再充電して、魅力的なエクスペリエンスを提供します

オムニチャネルデータは、マーケターがアクティベーションを調整し、結果として生じるカスタマージャーニーを測定するために使用する、実用的な顧客プロファイルを強化するための重要な要素です。 ただし、組織は、このデータの品質、規模、多様性を管理する上で課題に直面しています。 そのためには、低品質のデータの影響を軽減し、価値実現までの時間を短縮し、多数のユースケースに同じデータを使用することで ROI を向上させる、合理化されたソリューションが必要となります。
詳しくは、[ クエリサービスのドキュメント ](https://experienceleague.adobe.com/docs/experience-platform/query/home.html?lang=ja) を参照してください。

このビデオでは、以下について説明します。

* 活用できるAdobe Experience Platformのデータ準備機能
* Adobe Real-Time CDP、Adobe Journey Optimizer、Customer Journey Analyticsによる ROI の向上

>[!VIDEO](https://video.tv.adobe.com/v/3454936?learn=on&enablevpops&captions=jpn)

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

>[!NOTE]
>
>このビデオは、Adobe Summit 2020 セッション *[エクスペリエンスを電動化するためのオムニチャネルデータの充電 ](https://business.adobe.com/summit/2022/sessions/recharging-omnichannel-data-for-electrifying-exper-s409.html)* の抜粋です。
