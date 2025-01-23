---
title: 概要
description: データエンジニア、データアナリスト、データアーキテクト、データサイエンティスト、オーケストレーションエンジニアおよびマーケターが、Adobe Experience Platformとそのアプリケーションサービスのビジネス価値を完全に理解するための出発点です。
doc-type: multipage-overview
exl-id: 88c19383-c185-40f0-b118-6cb82db0ce0e
source-git-commit: bd46be455f88007174f7e6be9a1ce5f508edc09b
workflow-type: tm+mt
source-wordcount: '1251'
ht-degree: 2%

---

# Adobe Experience Platform の包括的な技術チュートリアル

![ 技術インサイダー ](./assets/images/techinsiders.png){width="50px" align="left"}

## 概要

このチュートリアルは、データエンジニア、データアナリスト、データアーキテクト、データサイエンティスト、オーケストレーションエンジニアおよびマーケターが、Adobe Experience Platformとそのアプリケーションサービスすべてのビジネス価値を完全に理解するための最適な出発点となります。 各レッスンでは、今日のパーソナライゼーションの複雑なエコシステムで企業が直面している実際の課題に焦点を当て、様々な実践的な演習でExperience Platformがその課題をどのように解決するかを説明します。

このチュートリアルは非常に多様で、次のアプリケーションで明確なインサイトを提供します。

- Adobe Experience Platform
- Adobe Experience Platform のデータ収集
- Real-time CDP
- Adobe Journey Optimizer
- Customer Journey Analytics

このチュートリアルでは、Adobeアプリケーションに焦点を当てているだけでなく、ブランドが機能する広範なエコシステムを考慮しています。 そのために、一部の教訓では、_非Adobe_ アプリケーションとAdobe Experience Platformの統合方法に重点を置いています。 そのため、次のアプリケーションがAdobe Experience Platformとどのように連携するかについて、深く理解することができます。

- Amazon:AWS Lambda、AWS S3、AWS Kinesis
- Google:Google Cloud Platform、Google BigQuery、Google Display&amp;Video 360、Google AdWords
- Microsoft:Power BI、Azure EventHub、Azure Blob Storage
- Salesforce: Tableau
- Apache Kafka
- Postman
- ...

このチュートリアルの演習を完了すると、次のことができるようになります。

- スキーマ、フィールドグループ、データセット、Id の設定
- Adobe Experience Platform Data Collection プロパティを設定し、Adobe Experience Platform Data Collection に新しい web SDK拡張機能を設定します
- Adobe Experience Platform Data Collection を使用したリアルタイムのAdobe Experience Platformへのデータのストリーミング
- ワークフローを使用するか、ETL （抽出、変換、読み込み）アプリケーションを使用して、Adobe Experience Platformにデータをバッチ取得します
- Adobe Experience Platformでのリアルタイム顧客プロファイルの視覚化と使用
- オーディエンスを作成
- 複数のAdobe Experience Platform API の使用
- SQL を使用してAdobe Experience Platformでデータに対してクエリを実行する
- リアルタイムのトリガーベースのジャーニーの設定と実行
- Real-time CDP を使用して、様々な宛先に対するオーディエンスをアクティブ化することでアクションを実行します
- Customer Journey Analyticsを使用して、Google BigQuery を含む様々なソースからのオムニチャネルカスタマーデータに関するレポートを作成します

## 前提条件

独自のAdobe Experience Platform インスタンスを使用してこのチュートリアルを受ける場合は、手順 [ こちら ](./setup.md) に従って組織をチュートリアルに備えます。

- Adobe Experience Platformへのアクセス：[https://experience.adobe.com/platform](https://experience.adobe.com/platform)
- Adobe Experience Platform Data Collection へのアクセス：[https://experience.adobe.com/#/data-collection/](https://experience.adobe.com/#/data-collection/)
- デモシステムへのアクセス：[https://dsn.adobe.com/](https://dsn.adobe.com/)

## ビデオ

Tech Academy のウェビナーや Bootcamps などの興味深いビデオを [Experience Makers Community YouTube チャンネル ](https://www.youtube.com/channel/UCUKG2dkZ9pYuZUPebQ21jUw) で多数紹介しています。

## 完了と資格認定

このチュートリアルは、Adobe資格認定コースの一部です。 このチュートリアルと共にコースに新規登録するには、[https://certification.adobe.com](https://certification.adobe.com) にアクセスします。

以下のチュートリアルを使用して完了するすべてのモジュールについて、以下に示すように完了証明書を送信する必要があります [ こちら ](./completion.md)。

## コンテンツ

以下の内容のステータスを確認するには、[ ステータスページ ](./status.md) をご覧ください。

[0.はじめに](./modules/gettingstarted/gettingstarted/getting-started.md)

この基本モジュールでは、デモ環境にアクセスして使用できるように、すべてを設定します。

**時間的投資：** 30 分

### 1. データ収集

[1.1 Foundation - Adobe Experience Platform Data Collection および Web SDKのセットアップ](./modules/datacollection/module1.1/data-ingestion-launch-web-sdk.md)

この基本モジュールでは、Adobe Experience Platform データ収集と、新しい web SDK拡張機能について説明します。

**時間的投資：** 30 分

[1.2 基盤 – データ取り込み](./modules/datacollection/module1.2/data-ingestion.md)

この基本モジュールでは、様々なソースからAdobe Experience Platformにデータを取り込みます

**時間投資：** 120 分

[1.3 Federated Audience の構成](./modules/datacollection/module1.3/fac.md)

このモジュールでは、Federated Audiences モデルを設定し、Federated データを使用してオーディエンスを生成する方法について説明します。

**時間的投資：** 90 分

### 2. Real-Time CDP B2C

[2.1 の基盤 – リアルタイム顧客プロファイル](./modules/rtcdp-b2c/module2.1/real-time-customer-profile.md)

この基本モジュールでは、UI と API を利用して、Adobe Experience Platformのリアルタイム顧客プロファイルを探索します。

**時間的投資：** 90 分

[2.2 インテリジェントサービス](./modules/rtcdp-b2c/module2.2/intelligent-services.md)

このモジュールでは、Adobe Experience Platform インテリジェントサービスを設定、設定および使用する方法について説明します。

**時間的投資：** 60 分

[2.3 Real-Time CDP - オーディエンスを作成し、アクションを実行します](./modules/rtcdp-b2c/module2.3/real-time-cdp-build-a-segment-take-action.md)

このモジュールでは、オーディエンスを設定し、Google DV360、Adobe Target、AWS S3 など、複数の宛先に対してオーディエンスをアクティブ化します。

**時間的投資：** 90 分

[2.4 Real-Time CDP:Microsoft Azure Event Hub へのAudience Activation](./modules/rtcdp-b2c/module2.4/segment-activation-microsoft-azure-eventhub.md)

このモジュールでは、Adobe Experience Platform Real-time CDP のリアルタイムの宛先として、Microsoft Azure EventHub の宛先を設定します。 また、Adobe Experience Platformが Azure EventHub の宛先にオーディエンスペイロードを配信するたびにリアルタイムでトリガーされる Azure 関数をセットアップしてデプロイします。 トリガーする Azure 関数は、Adobe Experience Platform Real-time CDP のアクティベーション機能のメカニズムを示します。
また、このモジュールの一部として、指定された宛先にペイロードを実際に配信する Real-time CDP のトリガーについても理解します。 また、オーディエンスの選定のステータスと、アクティベーションとの関係についても説明します。

**時間的投資：** 90 分

[2.5 Real-Time CDP接続：イベント転送](./modules/rtcdp-b2c/module2.5/aep-data-collection-ssf.md)

このモジュールでは、以前に設定したデータセット、スキーマ、Adobe Experience Platform Data Collection プロパティを使用してデータを収集し、そのデータサーバーサイドをGoogle Cloud Platform Pub/Sub やAWS Kinesisなどの複数のエンドポイントに転送します。

**時間的投資：** 90 分

[2.6 Apache Kafka からReal-Time CDPへのデータのストリーミング](./modules/rtcdp-b2c/module2.6/aep-apache-kafka.md)

このモジュールでは、独自の Apache Kafka クラスターを設定し、トピック、プロデューサー、コンシューマーを定義し、Kafka Connect 用のAdobe Experience Platform シンクコネクタを使用してAdobe Experience Platformにデータをストリーミングする方法について説明します。

**時間的投資：** 90 分

### 3. Adobe Journey Optimizer B2C

[3.1 Adobe Journey Optimizer：オーケストレーション](./modules/ajo-b2c/module3.1/journey-orchestration-create-account.md)

このモジュールでは、Adobe Journey Optimizerを使用して、トリガーベースのジャーニーを構築します。

**時間的投資：** 60 分

[3.2 Adobe Journey Optimizer：外部データソースとカスタムアクション](./modules/ajo-b2c/module3.2/journey-orchestration-external-weather-api-sms.md)

このモジュールでは、Adobe Journey Optimizerを使用して、オンラインとオフラインの両方で顧客の行動をリッスンし、様々なチャネルにわたってインテリジェントでコンテキストに応じたリアルタイムの方法で対応します。

**時間的投資：** 90 分

[3.3 Adobe Journey Optimizer:Offer decisioning](./modules/ajo-b2c/module3.3/offer-decisioning.md)

このモジュールでは、Adobe Experience Platform - オファー/決定アプリケーションサービスを実践的な方法で使用して、パーソナライズされたオファーと独自のオファーアクティビティを設定します。

**時間投資：** 120 分

[3.4 Adobe Journey Optimizer：イベントベースのジャーニー](./modules/ajo-b2c/module3.4/journeyoptimizer.md)

このモジュールでは、企業が、コンテキストに応じた、つながりのあるパーソナライズされたエクスペリエンスを設計して顧客に提供するのに役立つ、Journey Optimizerについて知っておくべきことをすべて学びます。

**時間投資：** 120 分

### 4.Adobe Customer Journey Analytics

[4.1 Customer Journey Analytics:Adobe Experience Platform上にAnalysis Workspaceを使用してダッシュボードを作成する](./modules/cja-b2c/module4.1/customer-journey-analytics-build-a-dashboard.md)

このモジュールでは、Web サイトのインタラクション、モバイルアプリのインタラクション、コールセンターのインタラクション、店舗のインタラクションなどのオムニチャネルデータを含むダッシュボードを設定することで、オンラインからオフラインでのインサイトを得ることができます。

**時間投資：** 120 分

[4.2Customer Journey Analytics:BigQuery Source コネクタを使用したAdobe Experience PlatformでのGoogle Analyticsデータの取り込みと分析](./modules/cja-b2c/module4.2/customer-journey-analytics-bigquery-gcp.md)

このモジュールでは、Google Cloud Platform の独自のインスタンスを設定し、Google Cloud Platform にデモデータを読み込んだ後、BigQuery Source コネクタを使用して、Google Cloud Platform からAdobe Experience Platformにデータを取り込みます。 最後に、Customer Journey Analyticsを使用して、そのデータを視覚化します。

**時間投資：** 120 分

### 5. データDistiller

[5.1 クエリサービス](./modules/datadistiller/module5.1/query-service.md)

このモジュールでは、Adobe Experience Platform クエリサービスの使用方法を説明します。

**時間的投資：** 90 分

![ 技術インサイダー ](./assets/images/techinsiders.png){width="50px" align="left"}

>[!NOTE]
>
>ご不明な点がある場合は、have suggestions on future content の一般的なフィードバックをお知らせください。**techinsiders@adobe.com** に電子メールを送信して、技術インサイダーに直接問い合わせてください。
