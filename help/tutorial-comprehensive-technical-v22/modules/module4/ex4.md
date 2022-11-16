---
title: クエリサービス —Power BI/Tableau
description: クエリサービス —Power BI/Tableau
kt: 5342
audience: Data Engineer, Data Architect, Data Analyst, BI Expert
doc-type: tutorial
activity: develop
exl-id: 11525d05-1c19-4d41-8f47-4feb3e8aed66
source-git-commit: cc7a77c4dd380ae1bc23dc75608e8e2224dfe78c
workflow-type: tm+mt
source-wordcount: '385'
ht-degree: 1%

---

# 4.4 クエリからデータセットを生成する

## 目的

クエリ結果からPower BIセットを生成する方法を説明します。 Microsoft Data Desktop/Tableau を直接クエリサービスに接続するMicrosoft Data Desktop/Tableau Desktop でのレポートの作成

## レッスンコンテキスト

データをクエリするコマンドラインインターフェイスは魅力的ですが、うまく表示されません。 このレッスンでは、Microsoft Desktop/Tableau をクエリサービスで直接使用して、関係者向けの視覚的なレポートを作成する方法について、推奨されるワークフローを順に説明します。

## 4.4.1 SQL クエリからのデータセットの作成

クエリの複雑さは、クエリサービスが結果を返すのにかかる時間に影響します。 また、コマンドラインやMicrosoftPower BI/Tableau などの他のソリューションから直接クエリを実行する場合、クエリサービスは 5 分のタイムアウト（600 秒）で設定されます。 また、場合によっては、これらのソリューションのタイムアウトが短く設定されることがあります。 より大きなクエリを実行し、結果を返すのに要する時間を前面読み込みに使用するには、クエリ結果からデータセットを生成する機能を用意しています。 この機能では、CTAS(Create Table As Select) と呼ばれる標準の SQL 機能を使用します。 Platform UI のクエリリストから使用でき、PSQL を使用してコマンドラインから直接実行することもできます。

以前の **名前を入力** を PSQL で実行する前に、独自の ldap に置き換えます。

```sql
select /* enter your name */
       e.--aepTenantId--.identification.core.ecid as ecid,
       e.placeContext.geo.city as city,
       e.placeContext.geo._schema.latitude latitude,
       e.placeContext.geo._schema.longitude longitude,
       e.placeContext.geo.countryCode as countrycode,
       c.--aepTenantId--.interactionDetails.core.callCenterAgent.callFeeling as callFeeling,
       c.--aepTenantId--.interactionDetails.core.callCenterAgent.callTopic as callTopic,
       c.--aepTenantId--.interactionDetails.core.callCenterAgent.callContractCancelled as contractCancelled,
       l.--aepTenantId--.loyaltyDetails.level as loyaltystatus,
       l.--aepTenantId--.loyaltyDetails.points as loyaltypoints,
       l.--aepTenantId--.identification.core.loyaltyId as crmid
from   demo_system_event_dataset_for_website_global_v1_1 e
      ,demo_system_event_dataset_for_call_center_global_v1_1 c
      ,demo_system_profile_dataset_for_loyalty_global_v1_1 l
where  e.--aepTenantId--.demoEnvironment.brandName IN ('Luma Telco', 'Citi Signal')
and    e.web.webPageDetails.name in ('Cancel Service', 'Call Start')
and    e.--aepTenantId--.identification.core.ecid = c.--aepTenantId--.identification.core.ecid
and    l.--aepTenantId--.identification.core.ecid = e.--aepTenantId--.identification.core.ecid;
```

Adobe Experience Platform UI に移動します。 [https://experience.adobe.com/platform](https://experience.adobe.com/platform)

Adobe Experience Platformクエリ UI で、実行した文を検索するには、検索フィールドに ldap を入力します。

選択 **クエリ**&#x200B;に移動します。 **ログ** 検索フィールドに ldap を入力します。

![search-query-for-ctas.png](./images/search-query-for-ctas.png)

クエリを選択し、 **データセットを出力**.

![search-query-for-ctas.png](./images/search-query-for-ctasa.png)

入力 `--demoProfileLdap-- Callcenter Interaction Analysis` データセットの名前と説明として「 」を入力し、 **クエリを実行** ボタン

![create-ctas-dataset.png](./images/create-ctas-dataset.png)

その結果、新しいクエリが「 」ステータスで表示されます **送信済み**.

![ctas-query-submitted.png](./images/ctas-query-submitted.png)

完了すると、 **データセットが作成されました** （ページの更新が必要になる場合があります）。

![ctas-dataset-created.png](./images/ctas-dataset-created.png)

データセットが作成され次第（5 ～ 10 分かかる場合があります）、演習を続行できます。

次の手順 — オプション A: [4.5 クエリサービスとPower BI](./ex5.md)

次の手順 — オプション B: [4.6 クエリサービスと Tableau](./ex6.md)

[モジュール 4 に戻る](./query-service.md)

[すべてのモジュールに戻る](../../overview.md)
