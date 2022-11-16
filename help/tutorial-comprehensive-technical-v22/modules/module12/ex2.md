---
title: Adobe Experience Platformで BigQuery Source Connector を使用してGoogle Analyticsデータを取り込み、分析 — BigQuery で最初のクエリを作成します
description: Adobe Experience Platformで BigQuery Source Connector を使用してGoogle Analyticsデータを取り込み、分析 — BigQuery で最初のクエリを作成します
kt: 5342
audience: Data Engineer, Data Architect, Data Analyst
doc-type: tutorial
activity: develop
exl-id: 73154afc-c3e3-420c-9471-5bb106dbfd02
source-git-commit: cc7a77c4dd380ae1bc23dc75608e8e2224dfe78c
workflow-type: tm+mt
source-wordcount: '521'
ht-degree: 1%

---

# 12.2 BigQuery で最初のクエリを作成する

## 目標

- BigQuery UI の参照
- BigQuery 内に SQL クエリを作成する
- SQL クエリの結果を BigQuery 内のデータセットに保存します

## コンテキスト

Google Analyticsデータが BigQuery の場合、ディメンション、指標およびその他の変数はすべてネストされます。 また、Google Analyticsデータは毎日異なるテーブルに読み込まれます。 つまり、BigQuery 内のGoogle AnalyticsテーブルをAdobe Experience Platformに直接接続するのは非常に難しく、良い考えではありません。

この問題の解決策は、Google Analyticsのデータを読み取り可能な形式に変換して、Adobe Experience Platformへの取り込みを容易にすることです。

## 12.2.1 新しい BigQuery テーブルを保存するためのデータセットの作成

次に移動： [BigQuery コンソール](https://console.cloud.google.com/bigquery).

![デモ](./images/ex3/1.png)

In **エクスプローラ**&#x200B;に設定されている場合は、プロジェクト ID が表示されます。 プロジェクト ID をクリックします ( **bigquery-public-data** データセット )。

![デモ](./images/ex3/2.png)

まだデータセットがないことがわかります。次に、データセットを作成します。
クリック **データセットを作成**.

![デモ](./images/ex3/4.png)

画面の右側に、 **データセットを作成** メニュー

![デモ](./images/ex3/5.png)

の **データセット ID**&#x200B;の場合は、次の命名規則を使用します。 その他のフィールドについては、デフォルト設定をそのままにしてください。

| 命名 | 例 |
| ----------------- | ------------- | 
| `--demoProfileLdap--_BigQueryDataSets` | vangeluw_BigQueryDataSets |

![デモ](./images/ex3/6.png)

次に、「 **データセットを作成**.

![デモ](./images/ex3/7.png)

その後、BigQuery コンソールに戻り、データセットが作成されます。

![デモ](./images/ex3/8.png)

## 12.2.2 最初の SQL BigQuery の作成

次に、BigQuery で最初のクエリを作成します。 このクエリの目的は、Google Analyticsのサンプルデータを取得し、Adobe Experience Platformで取り込めるように変換することです。 次に移動： **編集者** タブをクリックします。

![デモ](./images/ex3/9.png)

次の SQL クエリをコピーして、そのクエリエディターに貼り付けてください。 クエリを自由に読み、Google AnalyticsBigQuery 構文を理解してください。


```sql
SELECT
  CONCAT(fullVisitorId, CAST(hitTime AS String), '-', hitNumber) AS _id,
  TIMESTAMP(DATETIME(Year_Current, Month_Current, Day_Current, Hour, Minutes, Seconds)) AS timeStamp,
  fullVisitorId as GA_ID,
  -- Fake CUSTOMER ID
  CONCAT('3E-D4-',fullVisitorId, '-1W-93F' ) as customerID,
  Page,
  Landing_Page,
  Exit_Page,
  Device,
  Browser,
  MarketingChannel,
  TrafficSource,
  TrafficMedium,
  -- Enhanced Ecommerce
  TransactionID,
  CASE
      WHEN EcommerceActionType = '2' THEN 'Product_Detail_Views'
      WHEN EcommerceActionType = '3' THEN 'Adds_To_Cart'
      WHEN EcommerceActionType = '4' THEN 'Product_Removes_From_Cart'
      WHEN EcommerceActionType = '5' THEN 'Product_Checkouts'
      WHEN EcommerceActionType = '6' THEN 'Product_Refunds'
    ELSE
    NULL
  END
     AS Ecommerce_Action_Type,
  -- Entrances (metric)
  SUM(CASE
      WHEN isEntrance = TRUE THEN 1
    ELSE
    0
  END
    ) AS Entries,
    
--Pageviews (metric)
    COUNT(*) AS Pageviews,
    
 -- Exits 
    SUM(
    IF
      (isExit IS NOT NULL,
        1,
        0)) AS Exits,
        
 --Bounces
   SUM(CASE
      WHEN isExit = TRUE AND isEntrance = TRUE THEN 1
    ELSE
    0
  END
    ) AS Bounces,
        
  -- Unique Purchases (metric)
  COUNT(DISTINCT TransactionID) AS Unique_Purchases,
  -- Product Detail Views (metric)
  COUNT(CASE
      WHEN EcommerceActionType = '2' THEN fullVisitorId
    ELSE
    NULL
  END
    ) AS Product_Detail_Views,
  -- Product Adds To Cart (metric)
  COUNT(CASE
      WHEN EcommerceActionType = '3' THEN fullVisitorId
    ELSE
    NULL
  END
    ) AS Adds_To_Cart,
  -- Product Removes From Cart (metric)
  COUNT(CASE
      WHEN EcommerceActionType = '4' THEN fullVisitorId
    ELSE
    NULL
  END
    ) AS Product_Removes_From_Cart,
  -- Product Checkouts (metric)
  COUNT(CASE
      WHEN EcommerceActionType = '5' THEN fullVisitorId
    ELSE
    NULL
  END
    ) AS Product_Checkouts,
  -- Product Refunds (metric)
  COUNT(CASE
      WHEN EcommerceActionType = '7' THEN fullVisitorId
    ELSE
    NULL
  END
    ) AS Product_Refunds
  FROM (
  SELECT
    -- Landing Page (dimension)
    CASE
      WHEN hits.isEntrance = TRUE THEN hits.page.pageTitle
    ELSE NULL
  END
    AS Landing_page,
    
        -- Exit Page (dimension)
    CASE
      WHEN hits.isExit = TRUE THEN hits.page.pageTitle
    ELSE
    NULL
  END
    AS Exit_page,
    
    hits.page.pageTitle AS Page,
    hits.isEntrance,
    hits.isExit,
    hits.hitNumber as hitNumber,
    hits.time as hitTime,
    date as Fecha,
    fullVisitorId,
    visitStartTime,
    device.deviceCategory AS Device,
    device.browser AS Browser,
    channelGrouping AS MarketingChannel,
    trafficSource.source AS TrafficSource,
    trafficSource.medium AS TrafficMedium,
    hits.transaction.transactionId AS TransactionID,
    CAST(EXTRACT(YEAR FROM CURRENT_DATE()) AS INT64) AS Year_Current,
    CAST(EXTRACT(MONTH FROM CURRENT_DATE()) AS INT64) AS Month_Current,
     CAST(EXTRACT(DAY FROM CURRENT_DATE()) AS INT64) AS Day_Current,
    CAST(EXTRACT(DAY FROM DATE_SUB(CURRENT_DATE(),INTERVAL 1 DAY)) AS INT64) AS Day_Current_Before,
    CAST(FORMAT_DATE('%Y', PARSE_DATE("%Y%m%d", date)) AS INT64) AS Year,
  CAST(FORMAT_DATE('%m', PARSE_DATE("%Y%m%d",date)) AS INT64) AS Month,
  CAST(FORMAT_DATE('%d', PARSE_DATE("%Y%m%d",date)) AS INT64) AS Day,
    CAST(EXTRACT (hour FROM TIMESTAMP_SECONDS(hits.time)) AS INT64) AS Hour,
  CAST(EXTRACT (minute FROM TIMESTAMP_SECONDS(hits.time)) AS INT64) AS Minutes,
  CAST(EXTRACT (second FROM TIMESTAMP_SECONDS(hits.time)) AS INT64) AS SecondS,
    hits.eCommerceAction.action_type AS EcommerceActionType
  
  FROM
    `bigquery-public-data.google_analytics_sample.ga_sessions_*`,
     UNNEST(hits) AS hits
  WHERE
    _table_suffix BETWEEN '20170101'
    AND '20170331'
    AND totals.visits = 1
    AND hits.type = 'PAGE'
    )
    
GROUP BY
  1,
  2,
  3,
  4,
  5,
  6,
  7,
  8,
  9,
  10,
  11,
  12,
  13,
  14
    
  ORDER BY 2 DESC
```

準備が整ったら、「 **実行** クエリを実行するには：

![デモ](./images/ex3/10.png)

クエリの実行には数分かかる場合があります。

クエリの実行が完了すると、次の出力が **クエリ結果**.

![デモ](./images/ex3/12.png)

## 12.2.3 BigQuery SQL クエリの結果を保存する

次の手順では、 **結果を保存** 」ボタンをクリックします。

![デモ](./images/ex3/13.png)

出力の場所として、「 」を選択します。 **BigQuery テーブル**.

![デモ](./images/ex3/14.png)

新しいポップアップが表示されます。 **プロジェクト名** および **データセット名** が事前に設定されている。 データセット名は、この演習の最初に作成したデータセットで、次の命名規則を使用する必要があります。

| 命名 | 例 |
| ----------------- | ------------- | 
| `--demoProfileLdap--_BigQueryDataSets` | `vangeluw_BigQueryDataSets` |

次に、テーブル名を入力する必要があります。 次の命名規則を使用してください：

| 命名 | 例 |
| ----------------- |------------- | 
| `--demoProfileLdap--_GAdataTableBigQuery` | `vangeluw_GAdataTableBigQuery` |

![デモ](./images/ex3/16.png)

「**保存**」をクリックします。

作成したテーブルでデータの準備が整うまで、時間がかかる場合があります。 数分後に、ブラウザーを更新します。 その後、データセット内に、 `--demoProfileLdap--_GAdataTableBigquery` 下のテーブル **エクスプローラ** を BigQuery プロジェクト内に追加します。

![デモ](./images/ex3/19.png)

次の演習を続行します。ここで、このテーブルをAdobe Experience Platformに接続します。

次のステップ： [12.3 GCP と BigQuery のAdobe Experience Platformへの接続](./ex3.md)

[モジュール 12 に戻る](./customer-journey-analytics-bigquery-gcp.md)

[すべてのモジュールに戻る](./../../overview.md)
