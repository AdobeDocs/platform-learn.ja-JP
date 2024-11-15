---
title: BigQuery Source コネクタを使用したAdobe Experience PlatformでのGoogle Analyticsデータの取り込みと分析
description: BigQuery Source コネクタを使用したAdobe Experience PlatformでのGoogle Analyticsデータの取り込みと分析
kt: 5342
doc-type: tutorial
exl-id: b078d003-da25-44c5-b000-77e3b3188fb6
source-git-commit: 0dbcda0cfc9f199a44c845c1b5caf00a8d740251
workflow-type: tm+mt
source-wordcount: '456'
ht-degree: 0%

---

# 4.2 BigQuery Source Connector を使用したAdobe Experience PlatformでのGoogle Analyticsデータの取り込みと分析

**著者：[Victor de la Iglesia](https://www.linkedin.com/in/victordelaiglesia/)、[Wouter Van Geluwe](https://www.linkedin.com/in/woutervangeluwe/)**

このモジュールでは、Google Cloud Platform の独自のインスタンスを設定し、Google Cloud Platform にサンプルデータを読み込んだ後、BigQuery Source コネクタを使用して、Google Cloud Platform からAdobe Experience Platformにデータを取り込みます。 最後に、Customer Journey Analyticsを使用して、そのデータを視覚化します。

Adobe Experience PlatformのSource コネクタを使用すると、データをAdobe Experience Platformに簡単に取り込むことができます。 Google BigQuery は、既に利用可能なコネクタの 1 つです。 Adobe Experience Platformと BigQuery Source コネクタにより、Google AnalyticsデータをCustomer Journey AnalyticsのAnalysis Workspaceに取り込めるようになりました。

さらに、CRM、コールセンター、Customer Journey Analytics内のロイヤルティデータなどの他のデータソースと結合することで、そのGoogle Analyticsデータを強化できます。

## 学習内容

- Google Cloud Platform と BigQuery ユーザーインターフェイスについて理解する
- Adobe Experience PlatformへのGoogle Analyticsデータの取り込み
- Customer Journey Analyticsを使用したGoogle Analyticsデータの分析
- オフラインデータによるGoogle Analyticsデータのエンリッチメント

## 前提条件

- Customer Journey Analyticsにある程度慣れることが望ましいですが、必要ではありません
- Adobe Experience Platformへのアクセス：[https://experience.adobe.com/platform](https://experience.adobe.com/platform)
- Customer Journey Analyticsへのアクセス
- Google Cloud Platform およびGoogle BigQuery へのアクセス
- **これらのアセットをダウンロードします**。
   - [JSON - サンプルデータ：ロイヤルティデータ](./../../../assets/json/bqLoyalty.json)

>[!NOTE]
>
>Experience LeagueドキュメントのChrome拡張機能のインストール [ で参照されているように、Chrome拡張機能をインストール、設定および使用することを忘れないでください ](../../gettingstarted/gettingstarted/ex1.md)

## 演習

[4.2.1 Google Cloud Platform アカウントの作成](./ex1.md)

Google Cloud Platform アカウントを作成します。

[4.2.2 BigQuery で最初のクエリを作成する](./ex2.md)

BigQuery を使用して、Platform に読み込むデータを準備する方法を説明します。

[4.2.3 GCP および BigQuery のAdobe Experience Platformへの接続](./ex3.md)

Adobe Experience Platformでソースコネクタを設定する方法を説明します。

[4.2.4 BigQuery からAdobe Experience Platformへのデータのロード](./ex4.md)

Adobe Experience Platformで BigQuery ソースコネクタを設定して、Google Analyticsデータを取り込む方法を説明します。

[4.2.5 Customer Journey Analyticsを使用したGoogle Analyticsデータの分析](./ex5.md)

Customer Journey AnalyticsのGoogle Analyticsデータを分析し、ロイヤルティデータと組み合わせる方法を説明します。

[概要と利点](./summary.md)

このモジュールの概要とメリットの概要

>[!NOTE]
>
>Adobe Experience Platformとそのアプリケーションについて知るのに時間を費やしていただき、ありがとうございます。 ご不明な点がある場合は、have suggestions on future content の一般的なフィードバックをお知らせください。**techinsiders@adobe.com** に電子メールを送信して、技術インサイダーに直接問い合わせてください。

[すべてのモジュールに戻る](../../../overview.md)
