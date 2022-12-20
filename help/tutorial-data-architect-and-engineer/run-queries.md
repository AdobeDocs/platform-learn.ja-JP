---
title: クエリを実行
seo-title: Run queries | Getting Started with Adobe Experience Platform for Data Architects and Data Engineers
breadcrumb-title: クエリを実行
description: このレッスンでは、取り込んだデータを検証するクエリを設定、書き込み、実行する方法について説明します。
role: Data Architect, Data Engineer
feature: Queries
kt: 4348
thumbnail: 4348-run-queries.jpg
exl-id: a37531cb-96ad-4547-86af-84f7ed65f019
source-git-commit: cf0193e3aae4d6536c868f078f4773ee14e90408
workflow-type: tm+mt
source-wordcount: '323'
ht-degree: 4%

---

# クエリを実行

<!-- 15 min-->
このレッスンでは、取り込んだデータを検証するクエリを設定、書き込み、実行する方法について説明します。

Adobe Experience Platformクエリサービスを使用すると、標準の SQL を使用して Platform のデータに対してクエリを実行でき、データの意味を理解できます。 クエリサービスを使用すると、データレイク内の任意のデータセットを結合し、クエリ結果を新しいデータセットとして取り込み、レポート、機械学習、リアルタイム顧客プロファイルへの取り込みに使用できます。

**データアーキテクト** および **データエンジニア** このチュートリアル以外で、クエリサービスを使用する必要があります。

演習を始める前に、次の短いビデオを見てクエリサービスの詳細を確認してください。
>[!VIDEO](https://video.tv.adobe.com/v/29795?quality=12&learn=on)

## 必要な権限

内 [権限の設定](configure-permissions.md) レッスンでは、このレッスンを完了するために必要なすべてのアクセス制御を設定します。

<!-- Settings > **[!UICONTROL Services]** > **[!UICONTROL Query Service]**
* Permission items Data Management > **[!UICONTROL View Datasets]** and  **[!UICONTROL Manage Datasets]**
* Permission item Sandboxes > `Luma Tutorial`
* User-role access to the `Luma Tutorial Platform` product profile
-->

## 単純なクエリ

簡単なクエリをいくつか開始します。

1. Platform ユーザーインターフェイスで、に移動します。 **クエリ** 左のナビゲーション
1. を選択します。 **クエリを作成** ボタンを使用して、クエリを実行および実行するためのテキストボックスを開きます。
1. エディターで次のクエリを入力し、Shift + Enter キーまたは Shift + Return キーを押してクエリを実行します。

   ```
   SHOW TABLES
   ```

1. 使用可能なテーブルのリストを表示します

   ![テーブルクエリを表示](assets/queries-showTables.png)


1. 次に、このクエリを試してください。 `_techmarketingdemos` 独自のテナント名前空間を使用します。これを思い出したら、スキーマに表示されます。

   ```
   SELECT person.name.lastName,loyalty.tier
   FROM luma_loyalty_dataset
   WHERE loyalty.tier ='gold'
   ```

   ![ロイヤルティデータセットからデータを選択](assets/queries-loyaltySelect.png)

1. エラーが発生した場合は、詳細なメッセージが **[!UICONTROL コンソール]** タブ、下の図のように
   ![クエリでエラーが発生しました](assets/queries-error.png)

1. 成功したクエリで、 **[!UICONTROL 名前]** it `Luma Gold Level Customers`
1. を選択します。 **[!UICONTROL 保存]** ボタン
   ![クエリの保存](assets/queries-loyaltySelect-save.png)


<!--SELECT COUNT(DISTINCT (_techmarketingdemos.systemIdentifier.loyaltyId)) FROM luma_loyalty_dataset 


SELECT _techmarketingdemos.systemIdentifier.loyaltyId, COUNT(_techmarketingdemos.systemIdentifier.loyaltyId)
FROM luma_loyalty_dataset 
GROUP BY _techmarketingdemos.systemIdentifier.loyaltyId
HAVING COUNT(_techmarketingdemos.systemIdentifier.loyaltyId) > 1;-->

## その他の演習

追加のクエリサービスの演習は、後日チュートリアルに追加されます。
<!--
## Join Datasets

In this exercise, we will join two datasets `Luma Loyalty Dataset` and `Luma Offline Purchase` to get list of gold customers who have spend over $500 dollars in one purchase.

1. Create a new query
1. Copy and paste following query in query editor and execute, again replacing `_techmarketingdemos` with your own tenant namespace
    
    ```
    SELECT DISTINCT lopd.commerce.order.purchaseID as PurchaseId ,
        lld.person.name.firstName as LastName ,
        lld.person.name.lastName as LastName ,
        lopd.personalEmail.address as email,
        lopd.commerce.order.priceTotal as Total

    FROM luma_loyalty_dataset lld
    JOIN luma_offline_purchase_event_dataset lopd
    ON lopd._techmarketingdemos.systemIdentifier.loyaltyId = lld._techmarketingdemos.systemIdentifier.loyaltyId

    WHERE lld._techmarketingdemos.loyalty.level ='gold' AND lopd.commerce.order.priceTotal >500;
    ```

1. You should get list of Gold Customers who have spend over $500 in single purchase.

## Output datasets

1. Select on Output Dataset button
1. Provide name and description to the dataset
1. Save.
1. Go to **Datasets** under **Data Management** to find new dataset created.

-->
<!--Add content for Adobe Defined Functions-->

## その他のリソース

* [クエリサービスドキュメント](https://experienceleague.adobe.com/docs/experience-platform/query/home.html?lang=ja)
* [クエリサービス API リファレンス](https://www.adobe.io/experience-platform-apis/references/query-service/)

そして最後の実践レッスンで [セグメントの作成](build-segments.md)!
