---
title: クエリサービス — クエリサービス API
description: クエリサービス — クエリサービス API
kt: 5342
audience: Data Engineer, Data Architect, Data Analyst, BI Expert
doc-type: tutorial
activity: develop
exl-id: 6f437bd3-b134-4509-8e32-ad6f7b70608e
source-git-commit: cc7a77c4dd380ae1bc23dc75608e8e2224dfe78c
workflow-type: tm+mt
source-wordcount: '1000'
ht-degree: 5%

---

# 4.7 クエリサービス API

## 目的

- クエリサービス API を使用して、クエリテンプレートとクエリスケジュールを管理します

## コンテキスト

この演習では、API 呼び出しを実行し、Postmanコレクションを使用してクエリテンプレートとクエリスケジュールを管理します。 クエリテンプレートを定義し、通常のクエリと CTAS クエリを実行します。 A **CTAS** query （select クエリとしてテーブルを作成）は、その結果セットを明示的なデータセットに保存します。 通常のクエリは暗黙的な（またはシステム生成の）データセットに格納されますが、通常は Parquet ファイル形式で書き出されます。

## ドキュメント

- [Adobe Experience Platform クエリサービスのヘルプ](https://experienceleague.adobe.com/docs/experience-platform/query/api/getting-started.html?lang=ja)
- [クエリサービス API](https://www.adobe.io/apis/experienceplatform/home/api-reference.html#!acpdr/swagger-specs/qs-api.yaml)

## 4.7.1 クエリサービス API

クエリサービス API を使用すると、Adobe Experience Platformデータレイクに対する非インタラクティブクエリを管理できます。

非インタラクティブとは、クエリを実行するリクエストが即座に応答しないことを意味します。 クエリが処理され、その結果セットが暗黙的または明示的な (CTAS:データセットとしてテーブルを作成します。

## 4.7.2 サンプルクエリ

サンプルクエリとして、 [4.3 — クエリ、クエリ、クエリ…およびチャーン分析](./ex3.md):

1 日に表示される製品の数

**SQL**

```sql
select date_format( timestamp , 'yyyy-MM-dd') AS Day,
       count(*) AS productViews
from   demo_system_event_dataset_for_website_global_v1_1
where  --aepTenantId--.demoEnvironment.brandName IN ('Luma Telco', 'Citi Signal')
and eventType = 'commerce.productViews'
group by Day
limit 10;
```

## 4.7.3 クエリ

コンピューターでPostmanを開きます。 モジュール 3 の一部として、Postman環境を作成し、Postmanコレクションを読み込みました。 詳しくは、 [演習 3.3.3](./../module3/ex3.md) まだそれをしていない場合に備えて。

読み込んだPostmanコレクションの一部として、フォルダーが表示されます **3. クエリサービス**. このフォルダが表示されない場合は、 [Postmanコレクション](../../assets/postman/postman_profile.zip) をクリックし、指示に従ってPostmanにコレクションを再読み込みします。 [演習 3.3.3](./../module3/ex3.md).

![質問](./images/pm3.png)

>[!NOTE]
>
>現時点では、フォルダーのみ **1. クエリ** にはリクエストが含まれています。 その他のリクエストは、レイヤーステージに追加されます。

そのフォルダーを開き、クエリ結果セットを実行、監視およびダウンロードするクエリサービス API 呼び出しを知るには、このクエリ結果セットを開きます。

へのPOST呼び出し [/query/queries] 以下のペイロードを使用して、トリガーのクエリの実行を設定します。

### 4.7.3.1 クエリの作成

次の名前のリクエストをクリックします。 **1.1 QS — クエリの作成** そして、 **ヘッダー**. 次の内容が表示されます。

![セグメント化](./images/s1_call.png)

このヘッダーフィールドに焦点を当ててみましょう。

| キー | 値 |
| ----------- | ----------- |
| x-sandbox-name | `--module7sandbox--` |

>[!NOTE]
>
>使用しているAdobe Experience Platformサンドボックスの名前を指定する必要があります。 ヘッダーフィールド **x-sandbox-name** は、 `--module7sandbox--`.

次に進みます。 **本文** 」セクションに表示されます。 内 **本文** このリクエストには、次の情報が含まれます。

![セグメント化](./images/s1_bodydtl.png)

```sql
{
    "name" : "ldap - QS API demo - Citi Signal - Product Views Per Day",
	"description": "ldap - QS API demo - Citi Signal - Product Views Per Day",
	"dbName": "module7:all",
	"sql": "select date_format( timestamp , 'yyyy-MM-dd') AS Day, count(*) AS productViews from demo_system_event_dataset_for_website_global_v1_1 where _experienceplatform.demoEnvironment.brandName IN ('Luma Telco', 'Citi Signal') and eventType = 'commerce.productViews' group by Day limit 10"
}
```

注意：変数を更新してください **名前** 以下のリクエストで、 **ldap** を **ldap**.

特定の **ldap**&#x200B;の場合、本文は次のようになります。

```json
{
    "name" : "vangeluw - QS API demo - Citi Signal - Product Views Per Day",
	"description": "vangeluw - QS API demo - Citi Signal - Product Views Per Day",
	"dbName": "module7:all",
	"sql": "select date_format( timestamp , 'yyyy-MM-dd') AS Day, count(*) AS productViews from demo_system_event_dataset_for_website_global_v1_1 where _experienceplatform.demoEnvironment.brandName IN ('Luma Telco', 'Citi Signal') and eventType = 'commerce.productViews' group by Day limit 10"
}
```

>[!NOTE]
>
>キー **dbName** 上記の JSON の本文は、Adobe Experience Platformインスタンスで使用されるサンドボックスを参照します。 PROD サンドボックスを使用している場合、dbName は **prod:all**&#x200B;例えば、などの別のサンドボックスを使用する場合は、 **module7**&#x200B;の場合、dbName はと等しい必要があります **module7:all**.

次に、青色をクリックします。 **送信** ボタンをクリックしてセグメントを作成し、その結果を表示します。

![セグメント化](./images/s1_bodydtl_results.png)

成功すると、POSTリクエストは次の応答を返します。

```json
{
    "isInsertInto": false,
    "request": {
        "dbName": "module7:all",
        "sql": "select date_format( timestamp , 'yyyy-MM-dd') AS Day, count(*) AS productViews from demo_system_event_dataset_for_website_global_v1_1 where _experienceplatform.demoEnvironment.brandName IN ('Luma Telco', 'Citi Signal') and eventType = 'commerce.productViews' group by Day limit 10",
        "name": "vangeluw - QS API demo - Citi Signal - Product Views Per Day",
        "description": "vangeluw - QS API demo - Citi Signal - Product Views Per Day"
    },
    "clientId": "5a143b5ae4aa4631a1f3b09cd051333f",
    "state": "SUBMITTED",
    "rowCount": 0,
    "errors": [],
    "isCTAS": false,
    "version": 1,
    "id": "8f0d7f25-f7aa-493b-9792-290f884a7e5b",
    "elapsedTime": 0,
    "updated": "2021-01-20T13:23:13.951Z",
    "client": "API",
    "userId": "A3392DB95FFF08EE0A495E87@techacct.adobe.com",
    "created": "2021-01-20T13:23:13.951Z",
    "_links": {
        "self": {
            "href": "https://platform-va7.adobe.io/data/foundation/query/queries/8f0d7f25-f7aa-493b-9792-290f884a7e5b",
            "method": "GET"
        },
        "soft_delete": {
            "href": "https://platform-va7.adobe.io/data/foundation/query/queries/8f0d7f25-f7aa-493b-9792-290f884a7e5b",
            "method": "PATCH",
            "body": "{ \"op\": \"soft_delete\"}"
        },
        "cancel": {
            "href": "https://platform-va7.adobe.io/data/foundation/query/queries/8f0d7f25-f7aa-493b-9792-290f884a7e5b",
            "method": "PATCH",
            "body": "{ \"op\": \"cancel\"}"
        }
    }
}
```

現在の **state** を **送信済み**、実行後の状態は **成功**.

また、Adobe Experience Platform UI を使用して、送信されたクエリを開いて検索することもできます [Adobe Experience Platform](https://experience.adobe.com/#/@experienceplatform/platform/home)に移動します。 **クエリ**、 **ログ** クエリを選択します。

![セグメント化](./images/s1_bodydtl_results_qs.png)

### 4.7.3.2 クエリの取得

次の名前のリクエストをクリックします。 **1.2 QS — クエリの取得** そして、 **ヘッダー**. 次の内容が表示されます。

![セグメント化](./images/s2_call.png)

このヘッダーフィールドに焦点を当ててみましょう。

| キー | 値 |
| ----------- | ----------- |
| x-sandbox-name | `--module7sandbox--` |

>[!NOTE]
>
>使用しているAdobe Experience Platformサンドボックスの名前を指定する必要があります。 ヘッダーフィールド **x-sandbox-name** は、 `--module7sandbox--`.

に移動します。 **パラメーター**. 次の内容が表示されます。

![セグメント化](./images/s2_call_p.png)

この **orderby** パラメーターを使用すると、 **作成済み** プロパティ。 注意： **&#39;-&#39;** 作成日の前にサインインします。つまり、クエリのリストが返される順序は、作成日を使用して **降順** 注文。 クエリはリストの先頭に置く必要があります。

次に、青色をクリックします。 **送信** ボタンをクリックしてセグメントを作成し、その結果を表示します。

![セグメント化](./images/s2_bodydtl_results.png)

リクエストが成功すると、次のような応答が返されます。 この **state** 応答の **送信済み**, **IN_PROGRESS** または **成功**. クエリが **成功** 状態。 このリクエストの送信は、 **成功** 状態。

```json
{
    "queries": [
        {
            "isInsertInto": false,
            "request": {
                "dbName": "module7:all",
                "sql": "select date_format( timestamp , 'yyyy-MM-dd') AS Day, count(*) AS productViews from demo_system_event_dataset_for_website_global_v1_1 where _experienceplatform.demoEnvironment.brandName IN ('Luma Telco', 'Citi Signal') and eventType = 'commerce.productViews' group by Day limit 10",
                "name": "vangeluw - QS API demo - Citi Signal - Product Views Per Day",
                "description": "vangeluw - QS API demo - Citi Signal - Product Views Per Day"
            },
            "clientId": "5a143b5ae4aa4631a1f3b09cd051333f",
            "state": "SUCCESS",
            "rowCount": 1,
            "errors": [],
            "isCTAS": false,
            "version": 1,
            "id": "8f0d7f25-f7aa-493b-9792-290f884a7e5b",
            "elapsedTime": 217481,
            "updated": "2021-01-20T13:26:51.432Z",
            "client": "API",
            "userId": "A3392DB95FFF08EE0A495E87@techacct.adobe.com",
            "created": "2021-01-20T13:23:13.951Z",
            "_links": {
                "self": {
                    "href": "https://platform-va7.adobe.io/data/foundation/query/queries/8f0d7f25-f7aa-493b-9792-290f884a7e5b",
                    "method": "GET"
                },
                "soft_delete": {
                    "href": "https://platform-va7.adobe.io/data/foundation/query/queries/8f0d7f25-f7aa-493b-9792-290f884a7e5b",
                    "method": "PATCH",
                    "body": "{ \"op\": \"soft_delete\"}"
                },
                "referenced_datasets": [
                    {
                        "id": "60080ace62c49a19490c5870",
                        "href": "https://platform-va7.adobe.io/data/foundation/catalog/dataSets/60080ace62c49a19490c5870"
                    }
                ]
            }
        }
     ]
    },
    "version": 1
}
```

状態が **成功**、次のリクエストに進んでください。

### 4.7.3.3 クエリステータスの取得

次の名前のリクエストをクリックします。 **1.3 QS — クエリステータスの取得** そして、 **ヘッダー**. 次の内容が表示されます。

![セグメント化](./images/s3_call.png)

このヘッダーフィールドに焦点を当ててみましょう。

| キー | 値 |
| ----------- | ----------- |
| x-sandbox-name | `--module7sandbox--` |

>[!NOTE]
>
>使用しているAdobe Experience Platformサンドボックスの名前を指定する必要があります。 ヘッダーフィールド **x-sandbox-name** は、 `--module7sandbox--`.

次に、青色をクリックします。 **送信** ボタンをクリックしてセグメントを作成し、その結果を表示します。

![セグメント化](./images/s3_bodydtl_results.png)

リクエストが成功すると、次のような応答が返されます。

```json
{
    "isInsertInto": false,
    "request": {
        "dbName": "module7:all",
        "sql": "select date_format( timestamp , 'yyyy-MM-dd') AS Day, count(*) AS productViews from demo_system_event_dataset_for_website_global_v1_1 where _experienceplatform.demoEnvironment.brandName IN ('Luma Telco', 'Citi Signal') and eventType = 'commerce.productViews' group by Day limit 10",
        "name": "vangeluw - QS API demo - Citi Signal - Product Views Per Day",
        "description": "vangeluw - QS API demo - Citi Signal - Product Views Per Day"
    },
    "clientId": "5a143b5ae4aa4631a1f3b09cd051333f",
    "state": "SUCCESS",
    "rowCount": 1,
    "errors": [],
    "isCTAS": false,
    "version": 1,
    "id": "8f0d7f25-f7aa-493b-9792-290f884a7e5b",
    "elapsedTime": 217481,
    "updated": "2021-01-20T13:26:51.432Z",
    "client": "API",
    "userId": "A3392DB95FFF08EE0A495E87@techacct.adobe.com",
    "created": "2021-01-20T13:23:13.951Z",
    "_links": {
        "self": {
            "href": "https://platform-va7.adobe.io/data/foundation/query/queries/8f0d7f25-f7aa-493b-9792-290f884a7e5b",
            "method": "GET"
        },
        "soft_delete": {
            "href": "https://platform-va7.adobe.io/data/foundation/query/queries/8f0d7f25-f7aa-493b-9792-290f884a7e5b",
            "method": "PATCH",
            "body": "{ \"op\": \"soft_delete\"}"
        },
        "referenced_datasets": [
            {
                "id": "60080ace62c49a19490c5870",
                "href": "https://platform-va7.adobe.io/data/foundation/catalog/dataSets/60080ace62c49a19490c5870"
            }
        ]
    }
}
```

クエリが **成功**&#x200B;の場合、応答は、 **rowCount** プロパティ。 この例では、10 行がクエリによって返されます。 次の節で、10 行を取得する方法について説明します。

### 4.7.3.4 クエリ結果の取得

この **成功** 上記の応答には、 **referenced_datasets** プロパティ。クエリ結果を保存する暗黙のデータセットを指します。 結果にアクセスするには、 **href** または **id** プロパティ。

次の名前のリクエストをクリックします。 **1.4 QS — クエリ結果の取得** そして、 **ヘッダー**. 次の内容が表示されます。

![セグメント化](./images/s4_call.png)

このヘッダーフィールドに焦点を当ててみましょう。

| キー | 値 |
| ----------- | ----------- |
| x-sandbox-name | `--module7sandbox--` |

>[!NOTE]
>
>使用しているAdobe Experience Platformサンドボックスの名前を指定する必要があります。 ヘッダーフィールド **x-sandbox-name** は、 `--module7sandbox--`.

次に、青色をクリックします。 **送信** ボタンをクリックしてセグメントを作成し、その結果を表示します。

![セグメント化](./images/s4_bodydtl_results.png)

このリクエストの応答は、データセットファイルを指します。

```json
{
    "60080ace62c49a19490c5870": {
        "name": "Demo System - Event Dataset for Website (Global v1.1)",
        "description": "Demo System - Event Dataset for Website (Global v1.1)",
        "enableErrorDiagnostics": false,
        "tags": {
            "adobe/siphon/partition/definition": [
                "day(timestamp, _ACP_DATE)",
                "identity(_ACP_BATCHID)"
            ],
            "aep/siphon/partitions": [
                "_ACP_DATE",
                "_ACP_BATCHID"
            ],
            "acp_granular_plugin_validation_flags": [
                "identity:enabled",
                "profile:enabled"
            ],
            "adobe/siphon/buffered-promotion-recency": [
                "live"
            ],
            "adobe/siphon/use-buffered-promotion": [
                "true"
            ],
            "adobe/pqs/table": [
                "demo_system_event_dataset_for_website_global_v1_1"
            ],
            "aep/siphon/expire-snapshot-timestamp": [
                "1611141272703"
            ],
            "acp_granular_validation_flags": [
                "requiredFieldCheck:enabled"
            ],
            "acp_validationContext": [
                "enabled"
            ],
            "adobe/siphon/table/format": [
                "iceberg"
            ],
            "unifiedProfile": [
                "enabled:true",
                "enabledAt:2021-01-20 10:49:51"
            ],
            "unifiedIdentity": [
                "enabled:true"
            ]
        },
        "namespace": "ACP",
        "state": "DRAFT",
        "imsOrg": "907075E95BF479EC0A495C73@AdobeOrg",
        "sandboxId": "62cd9f38-8529-4b05-8d9f-388529db0540",
        "lastBatchId": "01EWFQZ15XRNNB1FPKPW5ETRVP",
        "lastBatchStatus": "success",
        "lastSuccessfulBatch": "01EWFQZ15XRNNB1FPKPW5ETRVP",
        "version": "1.0.6",
        "created": 1611139790698,
        "updated": 1611149266031,
        "createdClient": "750e24ee855b4ac18ccc4f4817f96ee1",
        "createdUser": "3A260B485E909A170A495E76@techacct.adobe.com",
        "updatedUser": "acp_foundation_dataTracker@AdobeID",
        "viewId": "60080ace62c49a19490c5871",
        "fileDescription": {
            "persisted": true,
            "containerFormat": "parquet",
            "format": "parquet"
        },
        "files": "@/dataSets/60080ace62c49a19490c5870/views/60080ace62c49a19490c5871/files",
        "schemaMetadata": {
            "delta": [],
            "gdpr": []
        },
        "schemaRef": {
            "id": "https://ns.adobe.com/experienceplatform/schemas/d9b88a044ad96154637965a97ed63c7b20bdf2ab3b4f642e",
            "contentType": "application/vnd.adobe.xed-full+json;version=1"
        }
    }
}
```

>[!NOTE]
>
>クエリサービス API の操作に役立つ演習がまもなく追加されます。

次のステップ： [概要とメリット](./summary.md)

[モジュール 4 に戻る](./query-service.md)

[すべてのモジュールに戻る](../../overview.md)
