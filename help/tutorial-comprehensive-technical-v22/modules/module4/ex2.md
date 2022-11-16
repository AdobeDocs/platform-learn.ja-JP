---
title: クエリサービス — クエリサービスの使用
description: クエリサービス — クエリサービスの使用
kt: 5342
audience: Data Engineer, Data Architect, Data Analyst, BI Expert
doc-type: tutorial
activity: develop
exl-id: dbf19991-cb09-43cf-887c-52996dfd2986
source-git-commit: cc7a77c4dd380ae1bc23dc75608e8e2224dfe78c
workflow-type: tm+mt
source-wordcount: '705'
ht-degree: 0%

---

# 4.2 クエリサービスの使用

## 目的

- データセットの検索と調査
- クエリでエクスペリエンスデータモデルのオブジェクトと属性に対処する方法を説明します。

## コンテキスト

ここでは、PSQL を使用して、使用可能なデータセットに関する情報を取得する方法、Experience Data Model(XDM) 用のクエリを記述する方法、Query Service と Citi Signal データセットを使用して最初の単純なレポートクエリを記述する方法について説明します。

## 4.2.1 基本的なクエリ

ここでは、使用可能なデータセットに関する情報を取得する方法と、XDM データセットからクエリを使用してデータを適切に取得する方法について説明します。

1.の始めにAdobe Experience Platformで調べたすべてのデータセットは、SQL インターフェイスを介してテーブルとしてアクセスすることもできます。 これらのテーブルを一覧表示するには、 **テーブルを表示** コマンドを使用します。

実行 **テーブルを表示** の **PSQL コマンドラインインターフェイス**. （必ずセミコロンでコマンドを終了してください）。

コマンドをコピーする **テーブルを表示** プロンプトに対して貼り付けます。

![command-prompt-show-tables.png](./images/command-prompt-show-tables.png)

次の結果が表示されます。

```text
aepenablementfy21:all=> show tables;
                            name                            |        dataSetId         |                            dataSet                             | description | resolved 
------------------------------------------------------------+--------------------------+----------------------------------------------------------------+-------------+----------
 demo_system_event_dataset_for_call_center_global_v1_1      | 5fd1a9dea30603194baeea43 | Demo System - Event Dataset for Call Center (Global v1.1)      |             | false
 demo_system_event_dataset_for_mobile_app_global_v1_1       | 5fd1a9de250e4f194bec84cd | Demo System - Event Dataset for Mobile App (Global v1.1)       |             | false
 demo_system_event_dataset_for_voice_assistants_global_v1_1 | 5fd1a9de49ee76194b85f73c | Demo System - Event Dataset for Voice Assistants (Global v1.1) |             | false
 demo_system_event_dataset_for_website_global_v1_1          | 5fd1a9dee3224d194cdfe786 | Demo System - Event Dataset for Website (Global v1.1)          |             | false
 demo_system_profile_dataset_for_loyalty_global_v1_1        | 5fd1a9de250e4f194bec84cc | Demo System - Profile Dataset for Loyalty (Global v1.1)        |             | false
 demo_system_profile_dataset_for_ml_predictions_global_v1_1 | 5fd1a9de241f58194b0cb117 | Demo System - Profile Dataset for ML Predictions (Global v1.1) |             | false
 demo_system_profile_dataset_for_mobile_app_global_v1_1     | 5fd1a9deddf353194a2e00b7 | Demo System - Profile Dataset for Mobile App (Global v1.1)     |             | false
 demo_system_profile_dataset_for_website_global_v1_1        | 5fd1a9de42a61c194dd7b810 | Demo System - Profile Dataset for Website (Global v1.1)        |             | false
 journey_step_events                                        | 5fd1a7f30268c5194bbb7e5e | Journey Step Events                                            |             | false
```

コロンで、結果セットの次のページを表示するにはスペースバーを押すか、 `q` をクリックして、コマンドプロンプトに戻ります。

Platform 内のすべてのデータセットには、対応するクエリサービステーブルがあります。 データセットのテーブルは、データセット UI から見つけることができます。

![ui-dataset-tablename.png](./images/ui-dataset-tablename.png)

この `demo_system_event_dataset_for_website_global_v1_1` テーブルは、 `Demo System - Event Schema for Website (Global v1.1)` データセット。

製品がどこで閲覧されたかに関する情報を問い合わせるには、 **地域** 情報。

以下の文をコピーし、プロンプトで **PSQL コマンドラインインターフェイス** を押して、次のように入力します。

```sql
select placecontext.geo
from   demo_system_event_dataset_for_website_global_v1_1
where  eventType = 'commerce.productViews'
and placecontext.geo.countryCode <> ''
limit 1;
```

クエリ結果では、Experience Data Model(XDM) の列は、スカラー型だけでなく複雑な型になる可能性があることに気がつきます。 上記のクエリでは、 **commerce.productViews** が発生した。 を識別するには、以下を実行します。 **commerce.productViews** を使用して XDM モデル全体をナビゲートする必要があります。 **.** （ドット）表記。

```text
aepenablementfy21:all=> select placecontext.geo
aepenablementfy21:all-> from   demo_system_event_dataset_for_website_global_v1_1
aepenablementfy21:all-> where  eventType = 'commerce.productViews'
aepenablementfy21:all-> and placecontext.geo.countryCode <> ''
aepenablementfy21:all-> limit 1;
                  geo                   
----------------------------------------
 ("(57.4694803,-3.1269422)",Tullich,GB)
(1 row)
```

結果は単一の値ではなくフラットなオブジェクトですか？ この **placecontext.geo** オブジェクトには 4 つの属性が含まれます。スキーマ、国、市区町村。 また、オブジェクトが列として宣言されると、オブジェクト全体が文字列として返されます。 XDM スキーマは、使い慣れたものよりも複雑な場合がありますが、非常に強力で、多くのソリューション、チャネル、使用例をサポートするように設計されています。

オブジェクトの個々のプロパティを選択するには、 **.** （ドット）表記。

以下の文をコピーし、プロンプトで **PSQL コマンドラインインターフェイス**:

```sql
select placecontext.geo._schema.longitude
      ,placecontext.geo._schema.latitude
      ,placecontext.geo.city
      ,placecontext.geo.countryCode
from   demo_system_event_dataset_for_website_global_v1_1
where  eventType = 'commerce.productViews'
and placecontext.geo.countryCode <> ''
limit 1;
```

上記のクエリの結果は、次のようになります。
結果は、設定された単純な値になりました。

```text
aepenablementfy21:all=> select placecontext.geo._schema.longitude
aepenablementfy21:all->       ,placecontext.geo._schema.latitude
aepenablementfy21:all->       ,placecontext.geo.city
aepenablementfy21:all->       ,placecontext.geo.countryCode
aepenablementfy21:all-> from   demo_system_event_dataset_for_website_global_v1_1
aepenablementfy21:all-> where  eventType = 'commerce.productViews'
aepenablementfy21:all-> and placecontext.geo.countryCode <> ''
aepenablementfy21:all-> limit 1;
 longitude  |  latitude  |  city   | countrycode 
------------+------------+---------+-------------
 -3.1269422 | 57.4694803 | Tullich | GB
(1 row)
```

特定のプロパティへのパスを簡単に取得できるので、心配する必要はありません。 この後の部分では、その方法を学びます。

クエリを編集する必要があるので、まずエディターを開きましょう。

Windows の場合

次をクリック： **検索** ウィンドウのツールバーのアイコンに、「 」と入力します。 **メモ帳** 内 **検索** フィールドで、 **メモ帳** 結果：

![windows-start-notepad.png](./images/windows-start-notepad.png)

Mac

インストール [Brackets](https://github.com/adobe/brackets/releases/download/release-1.14/Brackets.Release.1.14.dmg) または、別のテキストエディターを使用して、インストールしていない場合は、その指示に従ってください。 インストール後、 **Brackets** Macのスポットライト検索を使用して開きます。

次の文をメモ帳またはブラケットにコピーします。

```sql
select your_attribute_path_here
from   demo_system_event_dataset_for_website_global_v1_1
where  eventType = 'commerce.productViews'
and placecontext.geo.countryCode <> ''
limit 1;
```

Adobe Experience Platform UI に戻る（ブラウザーで開く）か、に移動します。 [https://platform.adobe.com](https://platform.adobe.com).

選択 **スキーマ**&#x200B;を入力して、 `Demo System - Event Schema for Website (Global v1.1)` 内 **検索** フィールドと選択 `Demo System - Event Schema for Website (Global v1.1) Schema` を選択します。

![browse-schema.png](./images/browse-schema.png)

の XDM モデルの参照 **デモシステム — Web サイトのイベントスキーマ (Global v1.1)**&#x200B;をクリックします。 ツリーを展開します。 **placecontext**, **地域** および **スキーマ**. 実際の属性を選択した場合 **longitude**&#x200B;を選択すると、強調表示された赤いボックスに完全なパスが表示されます。 属性のパスをコピーするには、パスをコピーアイコンをクリックします。

![explore-schema-for-path.png](./images/explore-schema-for-path.png)

メモ帳やブラケットに切り替えて、次を削除します。 **your_attribute_path_here** 最初の行から 次の後にカーソルを置きます。 **選択** 最初の行に貼り付けます (Ctrl + V)。

変更した文をメモ帳やブラケットからコピーし、プロンプトで **PSQL コマンドラインインターフェイス** を押し、enter を押します。

結果は次のようになります。

```text
aepenablementfy21:all=> select placeContext.geo._schema.longitude
aepenablementfy21:all-> from   demo_system_event_dataset_for_website_global_v1_1
aepenablementfy21:all-> where  eventType = 'commerce.productViews'
aepenablementfy21:all-> and placecontext.geo.countryCode <> ''
aepenablementfy21:all-> limit 1;
 longitude  
------------
 -3.1269422
```

次のステップ： [4.3 クエリ、クエリ、クエリ…およびチャーン分析](./ex3.md)

[モジュール 4 に戻る](./query-service.md)

[すべてのモジュールに戻る](../../overview.md)
