---
title: 概要
description: データエンジニア、データアナリスト、データアーキテクト、データサイエンティスト、オーケストレーションエンジニアおよびマーケターが、Adobe Experience Platformとそのアプリケーションサービスのビジネス価値を完全に理解するための出発点です。
doc-type: multipage-overview
hide: false
exl-id: 88c19383-c185-40f0-b118-6cb82db0ce0e
source-git-commit: b6c98ca773ba46205c467321a7796c29b614e75c
workflow-type: tm+mt
source-wordcount: '1511'
ht-degree: 2%

---

# Adobe Experience Platform の包括的な技術チュートリアル

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
- Adobe Experience Platform Data Collection プロパティを設定し、Adobe Experience Platform Data Collection に新しい Web SDK 拡張機能を設定します。
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

- Adobe Experience Platformへのアクセス：[https://experience.adobe.com/platform](https://experience.adobe.com/platform)
- Adobe Experience Platform Data Collection へのアクセス：[https://experience.adobe.com/#/data-collection/](https://experience.adobe.com/#/data-collection/)
- デモシステムへのアクセス：[https://dsn.adobe.com/](https://dsn.adobe.com/)

## ビデオ

Tech Academy のウェビナーや Bootcamps などの興味深いビデオを [Experience Makers Community YouTube チャンネル ](https://www.youtube.com/channel/UCUKG2dkZ9pYuZUPebQ21jUw) で多数紹介しています。

## コンテンツ

[0.はじめに](./modules/gettingstarted/gettingstarted/getting-started.md)

- **対象読者：** Adobe Experience Platformの包括的なテクニカルチュートリアルのすべての参加者
- **前提条件：** デモシステムへのアクセス次に、Adobe Experience PlatformとAdobe Experience Platformのデータ収集です。
- **説明：** この基本モジュールでは、デモ環境にアクセスして使用できるように、すべてを設定します。
- **時間的投資：** 30 分

### 1. データ収集

[1.1 Foundation - Adobe Experience Platform Data Collection および Web SDK のセットアップ](./modules/datacollection/module1.1/data-ingestion-launch-web-sdk.md)

- **対象読者：** データエンジニア、データアーキテクト
- **前提条件：** Adobe Experience PlatformおよびAdobe Experience Platform Data Collection へのアクセス。
- **説明：** この基本モジュールでは、Adobe Experience Platform Data Collection と、新しい Web SDK 拡張機能について説明します。
- **時間的投資：** 30 分

[1.2 基盤 – データ取り込み](./modules/datacollection/module1.2/data-ingestion.md)

- **対象読者：** データエンジニア、データアーキテクト
- **前提条件：** Adobe Experience PlatformおよびAdobe Experience Platform Data Collection へのアクセス。
- **説明：** この基本モジュールでは、web サイトから Platform にデータを取り込みます
- **時間投資：** 120 分

[1.3 Federated Audience の構成](./modules/datacollection/module1.3/fac.md)

- **対象読者：** データアナリスト、データエンジニア、データアーキテクト
- **前提条件：Adobe Experience Platformへ** アクセス
- **説明：** このモジュールでは、独自の Apache Kafka クラスターを設定し、トピック、プロデューサー、コンシューマーを定義し、Kafka Connect 用のAdobe Experience Platform シンクコネクタを使用してAdobe Experience Platformにデータをストリーミングする方法を学びます。
- **時間的投資：** 90 分

### 2. Real-Time CDP B2C

[2.1 の基盤 – リアルタイム顧客プロファイル](./modules/rtcdp-b2c/module2.1/real-time-customer-profile.md)

- **対象読者：** データエンジニア、データアーキテクト、マーケター
- **前提条件：Adobe Experience PlatformおよびPostmanへの** クセス
- **説明：** この基本モジュールでは、UI と API を利用して、Adobe Experience Platformのリアルタイム顧客プロファイルを調べます。
- **時間的投資：** 90 分
- **これらのアセットをダウンロードします**。
   - [Postman コレクション](./assets/postman/postman_profile.zip)

[2.2 インテリジェントサービス](./modules/rtcdp-b2c/module2.2/intelligent-services.md)

- **対象読者：** データエンジニア、データアーキテクト、データサイエンティスト
- **前提条件：** Adobe Experience Platform、インテリジェントサービスへのアクセス
- **説明：** このモジュールでは、Adobe Experience Platform インテリジェントサービスを設定、設定および使用する方法について説明します。
- **時間的投資：** 60 分

[2.3 Real-Time CDP - オーディエンスを作成し、アクションを実行します](./modules/rtcdp-b2c/module2.3/real-time-cdp-build-a-segment-take-action.md)

- **対象読者：** データアーキテクト、オーケストレーションエンジニア、マーケター
- **前提条件：** Adobe Experience Platform、Real-time CDP、Adobe Audience Manager、Adobe Target、AWS S3 へのアクセス
- **説明：** このモジュールでは、オーディエンスを設定し、Google DV360、Adobe Target、AWS S3 などの複数の宛先に対してオーディエンスをアクティブ化します。
- **時間的投資：** 90 分

[2.4 Real-Time CDP:Microsoft Azure Event Hub へのAudience Activation](./modules/rtcdp-b2c/module2.4/segment-activation-microsoft-azure-eventhub.md)

- **対象読者：** データエンジニア、データアーキテクト、データアナリスト
- **前提条件：Adobe Experience Platform、Real-time CDP およびMicrosoft Azure への** アクセス
- **説明：** このモジュールでは、Adobe Experience Platform Real-time CDP のリアルタイムの宛先として、Microsoft Azure EventHub の宛先を設定します。 また、Adobe Experience Platformが Azure EventHub の宛先にオーディエンスペイロードを配信するたびにリアルタイムでトリガーされる Azure 関数をセットアップしてデプロイします。 トリガーする Azure 関数は、Adobe Experience Platform Real-time CDP のアクティベーション機能のメカニズムを示します。
また、このモジュールの一部として、指定された宛先にペイロードを実際に配信する Real-time CDP のトリガーについても理解します。 また、オーディエンスの選定のステータスと、アクティベーションとの関係についても説明します。
- **時間的投資：** 90 分

[2.5 Real-Time CDP接続：イベント転送](./modules/rtcdp-b2c/module2.5/aep-data-collection-ssf.md)

- **対象読者：** データエンジニア、データアーキテクト、データアナリスト
- **前提条件：Real-Time CDP Connections、タグおよびイベント転送のプロパティへのアクセス**
- **説明：** このモジュールでは、以前に設定したデータセット、スキーマ、Adobe Experience Platform Data Collection プロパティを使用してデータを収集し、そのデータをサーバーサイドで選択したエンドポイントに転送します。
- **時間的投資：** 90 分

[2.6 Apache Kafka からReal-Time CDPへのデータのストリーミング](./modules/rtcdp-b2c/module2.6/aep-apache-kafka.md)

- **対象読者：** データアナリスト、データエンジニア、データアーキテクト
- **前提条件：Adobe Experience Platformへ** アクセス
- **説明：** このモジュールでは、独自の Apache Kafka クラスターを設定し、トピック、プロデューサー、コンシューマーを定義し、Kafka Connect 用のAdobe Experience Platform シンクコネクタを使用してAdobe Experience Platformにデータをストリーミングする方法を学びます。
- **時間的投資：** 90 分

### 3. Adobe Journey Optimizer B2C

[3.1 Adobe Journey Optimizer：オーケストレーション](./modules/ajo-b2c/module3.1/journey-orchestration-create-account.md)

- **対象読者：** データエンジニア、データアーキテクト、オーケストレーションエンジニア
- **前提条件：Adobe Experience PlatformおよびAdobe Journey Optimizerへの** クセス
- **説明：** このモジュールでは、Adobe Journey Optimizerを使用して、トリガーベースのジャーニーを作成します。
- **時間的投資：** 60 分

[3.2 Adobe Journey Optimizer：外部データソースとカスタムアクション](./modules/ajo-b2c/module3.2/journey-orchestration-external-weather-api-sms.md)

- **対象読者：** データエンジニア、データアーキテクト、オーケストレーションエンジニア、マーケター
- **前提条件：** Adobe Experience Platform、Adobe Journey Optimizer、Open Weather API、Twilio へのアクセス
- **説明：** このモジュールでは、Adobe Journey Optimizerを使用して、オンラインとオフラインの両方で顧客の行動をリッスンし、インテリジェントでコンテキストに応じたリアルタイムの方法で、様々なチャネルで対応します。
- **時間的投資：** 90 分

[3.3 Adobe Journey Optimizer:Offer decisioning](./modules/ajo-b2c/module3.3/offer-decisioning.md)

- **対象読者：** データエンジニア、データアーキテクト、オーケストレーションエンジニア、マーケター
- **前提条件：** Adobe Experience PlatformへのアクセスとOffer decisioning
- **説明：** このモジュールでは、Adobe Experience Platform - Offers/Decisioning アプリケーションサービスを実践的な方法で使用して、パーソナライズされたオファーと独自のオファーアクティビティを設定します。
- **時間投資：** 120 分

[3.4 Adobe Journey Optimizer：イベントベースのジャーニー](./modules/ajo-b2c/module3.4/journeyoptimizer.md)

- **対象読者：** メールマーケター、オーケストレーションスペシャリスト、データエンジニア、データアーキテクト、データアナリスト
- **前提条件：Adobe Experience PlatformおよびJourney Optimizerへの** クセス
- **説明：** このモジュールでは、企業が接続され、コンテキストに応じて、パーソナライズされたエクスペリエンスを設計して顧客に提供するのに役立つ、Journey Optimizerについて知っておくべきすべてのことを学びます。
- **時間投資：** 120 分

### 4.Adobe Customer Journey Analytics

[4.1 Customer Journey Analytics:Adobe Experience Platform上にAnalysis Workspaceを使用してダッシュボードを作成する](./modules/cja-b2c/module4.1/customer-journey-analytics-build-a-dashboard.md)

- **対象読者：** データエンジニア、データアーキテクト、データアナリスト
- **前提条件：** Adobe Experience PlatformへのアクセスとCustomer Journey Analytics
- **説明：** このモジュールでは、Web サイトインタラクション、モバイルアプリインタラクション、コールセンターインタラクション、店舗インタラクションなどのオムニチャネルデータを含むダッシュボードを設定することで、オンラインからオフラインのインサイトを得ることができます。
- **時間投資：** 120 分

[4.2Customer Journey Analytics:BigQuery Source コネクタを使用したAdobe Experience PlatformでのGoogle Analyticsデータの取り込みと分析](./modules/cja-b2c/module4.2/customer-journey-analytics-bigquery-gcp.md)

- **対象読者：** データエンジニア、データアーキテクト、データアナリスト
- **前提条件：** Adobe Experience Platform、Customer Journey Analytics、Google Cloud Platform、Google BigQuery へのアクセス
- **説明：** このモジュールでは、Google Cloud Platform の独自のインスタンスを設定し、Google Cloud Platform にデモデータを読み込んだ後、BigQuery Source コネクタを使用して、Google Cloud Platform からAdobe Experience Platformにデータを取り込みます。 最後に、Customer Journey Analyticsを使用して、そのデータを視覚化します。
- **時間投資：** 120 分
- **これらのアセットをダウンロードします**。
   - [JSON - サンプルデータ：デモ – ロイヤルティデータ](./assets/json/bqLoyalty.json)

### 5. データDistiller

[5.1 クエリサービス](./modules/datadistiller/module5.1/query-service.md)

- **対象読者：** データエンジニア、データアーキテクト、データアナリスト、BI エキスパート
- **前提条件：** Adobe Experience Platform、クエリサービス、Power BIまたは Tableau へのアクセス
- **説明：** このモジュールでは、Adobe Experience Platform クエリサービスの使用方法を説明します。
- **時間的投資：** 90 分
- **これらのアセットをダウンロードします**。
   - [JSON - サンプルデータ：デモシステム - Web サイトのイベントデータセット](./assets/json/ee.json)
   - [JSON - サンプルデータ：デモシステム – コールセンターのイベントデータセット](./assets/json/callcenter.json)
   - [JSON - サンプルデータ：デモシステム – ロイヤルティのプロファイルデータセット](./assets/json/loyalty.json)





