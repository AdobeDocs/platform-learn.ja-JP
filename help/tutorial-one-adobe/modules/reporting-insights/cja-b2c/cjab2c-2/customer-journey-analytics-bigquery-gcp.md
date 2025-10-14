---
title: BigQuery Source コネクタを使用した、Adobe Experience PlatformでのGoogle Analytics データの取り込みと分析
description: BigQuery Source コネクタを使用した、Adobe Experience PlatformでのGoogle Analytics データの取り込みと分析
kt: 5342
doc-type: tutorial
exl-id: 19266ac3-7c93-4cdb-8b65-75ce5c38649c
source-git-commit: 1e3a8d585503eddad4c642a3b13d2b5f7ddc9943
workflow-type: tm+mt
source-wordcount: '448'
ht-degree: 0%

---

# 1.2 BigQuery Source Connector を使用したAdobe Experience PlatformでのGoogle Analytics データの取り込みと分析

このモジュールでは、Google Cloud Platform の独自のインスタンスを設定し、Google Cloud Platform にサンプルデータを読み込んだ後、BigQuery Source コネクタを使用して、Google Cloud Platform からAdobe Experience Platformにデータを取り込みます。 最後に、Customer Journey Analyticsを使用して、そのデータを視覚化します。

Adobe Experience PlatformのSource コネクタを使用すると、データをAdobe Experience Platformに簡単に取り込むことができます。 Google BigQuery は、既に利用可能なコネクタの 1 つです。 Adobe Experience Platformと BigQuery Source コネクタにより、Google Analytics データをCustomer Journey AnalyticsのAnalysis Workspaceに取り込めるようになりました。

さらに、CRM、コールセンター、Customer Journey Analytics内のロイヤルティデータなど、他のデータソースと結合することで、Google Analytics データを強化できます。

## 学習内容

- Google Cloud Platform と BigQuery ユーザーインターフェイスについて理解する
- Google Analytics データのAdobe Experience Platformへの取り込み
- Customer Journey Analyticsを使用したGoogle Analytics データの分析
- オフラインデータによるGoogle Analytics データのエンリッチメント

## 前提条件

- Customer Journey Analyticsに関する知識がある程度必要ですが、必須ではありません
- Adobe Experience Platformへのアクセス：[https://experience.adobe.com/platform](https://experience.adobe.com/platform)
- Customer Journey Analyticsへのアクセス
- Google Cloud Platform およびGoogle BigQuery へのアクセス
- **これらのアセットをダウンロードします**。
   - [JSON - サンプルデータ：ロイヤルティデータ](./../../../../assets/json/bqLoyalty.json)

>[!NOTE]
>
>[Experience League ドキュメントのChrome拡張機能のインストール &#x200B;](../../../getting-started/gettingstarted/ex1.md) で参照されているように、Chrome拡張機能をインストール、設定、使用することを忘れないでください。

## 演習

[1.2.1 Google Cloud Platform の使用を開始する](./ex1.md)

Google Cloud Platform 環境の使用を開始します。

[1.2.2 BigQuery で最初のクエリを作成する](./ex2.md)

BigQuery を使用して、Platform に読み込むデータを準備する方法を説明します。

[1.2.3 GCP および BigQuery のAdobe Experience Platformへの接続](./ex3.md)

Adobe Experience Platformでソースコネクタを設定する方法を説明します。

[1.2.4 BigQuery からAdobe Experience Platformへのデータのロード](./ex4.md)

Adobe Experience Platformで BigQuery ソースコネクタを設定して、Google Analytics データを取り込む方法を説明します。

[1.2.5 Customer Journey Analyticsを使用したGoogle Analytics データの分析](./ex5.md)

Customer Journey AnalyticsでGoogle Analytics データを分析し、ロイヤルティデータと組み合わせる方法を説明します。

[概要と利点](./summary.md)

このモジュールの概要とメリットの概要

![&#x200B; 技術インサイダー &#x200B;](./../../../../assets/images/techinsiders.png){width="50px" align="left"}

>[!NOTE]
>
>Adobe Experience Platformとそのアプリケーションについて知るのに時間を費やしていただき、ありがとうございます。 ご不明な点がある場合は、have suggestions on future content の一般的なフィードバックをお知らせください。**techinsiders@adobe.com** に電子メールを送信して、技術インサイダーに直接問い合わせてください。

[すべてのモジュールに戻る](./../../../../overview.md)
