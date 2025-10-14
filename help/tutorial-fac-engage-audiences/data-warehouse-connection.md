---
title: データウェアハウス接続
seo-title: Configure a data warehouse connection | Engage with audiences directly from your data warehouse using Federated Audience Composition
breadcrumb-title: データウェアハウス接続
description: この演習では、Adobe Experience Platformと Enterprise Data Warehouseの間の接続を設定して、Federated Audience Composition を有効にします。
role: Data Architect, Data Engineer
jira: KT-18743
thumbnail: 18743-configure-a-data-warehouse-connection.jpg
exl-id: 3935f3ff-7728-4cd1-855e-2cd02c2ecc59
source-git-commit: 7e2f7bbb392eba51c0d6b9ccc8224c2081a01c7c
workflow-type: tm+mt
source-wordcount: '478'
ht-degree: 3%

---

# データウェアハウス接続

まず、Adobe Experience Platformと Enterprise Data Warehouse間の接続を設定します。 Data Warehouseでのデータの位置に基づいてスキーマとデータモデルを使用し、クエリの作成をサポートします。

デモを行うために、Snowflake アカウントに接続します。 Federated Audience Composition では、増加する Data Warehouse 接続のリストをサポートしています。 統合の最新のリスト [&#x200B; を参照してください &#x200B;](https://experienceleague.adobe.com/ja/docs/federated-audience-composition/using/start/access-prerequisites){target="_blank"}。

## 手順

1. 左側のパネルで **FEDERATED DATA** セクションを参照します。
2. **連合データベース** リンクで、「**連合データベースを追加**」ボタンをクリックします。
3. 名前を追加して、「**Snowflake**」を選択します。
4. 詳細を入力し、「**接続をテスト**」ボタン、「**関数をデプロイ**」ボタンの順にクリックします。

   ![snowflake-connection-setup](assets/snowflake-connection-setup.png)

   ![snowflake-connection-setup-step2](assets/snowflake-connection-setup-step2.png)

   ![snowflake-connection-setup-step3](assets/snowflake-connection-setup-step3.png)

## スキーマの作成

Federated Audience Composition でスキーマを作成するには、次の手順に従います。

### 手順

1. **FEDERATED DATA** セクションで、「**モデル**」をクリックします。
2. 「**スキーマ**」タブを参照し、「**スキーマを作成**」ボタンをクリックします。
3. リストでソースデータベースを選択し、「**テーブルを追加**」タブをクリックします。
4. フェデレーション ソースからテーブルを選択します。 この例では、次のようになります。
   - FSI_CRM
   - FSI_CRM_CONSENT_PREFERENCE

   ![create-schema](assets/create-schema.png)

   ![select-table](assets/select-table.png)

テーブルを選択したら、各テーブルの列を確認し、主キーを選択します。 このビジネスケースをサポートするために、両方のテーブルでプライマリキーとして **EMAIL** が選択されています。

![create-schema](assets/create-schema.png)

![create-schema-step2](assets/create-schema-step2.png)

## データモデルを作成

データモデルを使用すると、テーブル間のリンクを作成できます。 リンクは、同じデータベース内のテーブル（Snowflakeのテーブルなど）間に作成することも、異なるデータベース内のテーブル間（SnowflakeのテーブルとAmazon Redshift のテーブルの間のリンクなど）に作成することもできます。

### 手順

1. 「**FEDERATED DATA**」セクションで、「**モデル**」をクリックし、「**データモデル**」をクリックします。
2. 「**データモデルを作成**」ボタンをクリックします。
3. データモデルの名前を指定します。
4. **スキーマを追加** をクリックし、新しい連合データスキーマを選択します。 この例では、「**FSI_CRM**」スキーマと「**FSI_CRM_CONSENT_PREFERENCE**」スキーマを選択します。
5. **リンクを作成** をクリックして、これらのテーブル間にリンクを作成します。

リンクを作成する場合は、該当するカーディナリティを選択します。

- **1-N**：ソーステーブルの 1 つのオカレンスを、ターゲットテーブルの複数のオカレンスに対応させることができますが、ターゲットテーブルの 1 つのオカレンスは、最大でソーステーブルの 1 つのオカレンスに対応させることができます。
- **N-1**：ターゲットテーブルの 1 つのオカレンスを、ソーステーブルの複数のオカレンスに対応させることができますが、ソーステーブルの 1 つのオカレンスは、最大でターゲットテーブルの 1 つのオカレンスに対応させることができます。
- **1-1**：ソーステーブルの 1 つのオカレンスを、ターゲットテーブルの最大 1 つのオカレンスに対応させることができます。

上記の手順で作成されたリンクのプレビューを以下に示します。 リンクにより、**EMAIL** のプライマリキーを使用して CRM と同意テーブルを結合し、結合を実行できます。

![preview-data-model](assets/preview-data-model.png)

次に、[Federated Audience の作成 &#x200B;](create-a-federated-audience.md) を行う準備が整いました。
