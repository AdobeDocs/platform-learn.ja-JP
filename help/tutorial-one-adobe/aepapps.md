---
title: AEP & Apps Tech Labs
description: AEP & Apps Tech Labs
doc-type: multipage-overview
source-git-commit: 245bb4738d72ee52ef7e99fcb099953153b7b781
workflow-type: tm+mt
source-wordcount: '700'
ht-degree: 1%

---

# 概要 – AEP &amp; Apps Tech Labs

## 概要

## AEPとアプリアーキテクチャの概要

このビデオでは、このチュートリアルのAdobe Experience Platformとアプリケーションの背後にあるアーキテクチャについて説明します。

>[!VIDEO](https://video.tv.adobe.com/v/3481415?quality=12&learn=on)

以下のアーキテクチャの概要画像をダウンロードします。

![技術関係者](./assets/images/architecture_data.jpeg)

### はじめに

[はじめに](./modules/getting-started/gettingstarted/getting-started.md){target="_blank"}

この基本モジュールでは、デモ環境にアクセスして使用できるように、すべてを準備します。

### 配信/アクティベーション

#### データ収集

[1.1基盤 – Adobe Experience Platform データ収集とWeb SDKの設定](./modules/delivery-activation/datacollection/dc1.1/data-ingestion-launch-web-sdk.md)

この基本モジュールでは、Adobe Experience Platform Data Collectionと新しいWeb SDK拡張機能について説明します。

[1.2基盤 – データ収集](./modules/delivery-activation/datacollection/dc1.2/data-ingestion.md)

この基本モジュールでは、Adobe Experience Platformにさまざまなソースからデータを取り込みます

[1.3連合オーディエンス構成](./modules/delivery-activation/datacollection/dc1.3/fac.md)

このモジュールでは、連合オーディエンスモデルを設定し、連合データを使用してオーディエンスを生成する方法について説明します。

#### Real-Time CDP B2C

[2.1基盤 – リアルタイムの顧客プロファイル](./modules/delivery-activation/rtcdp-b2c/rtcdpb2c-1/real-time-customer-profile.md)

この基本モジュールでは、UIとAPIを利用して、Adobe Experience Platformのリアルタイム顧客プロファイルを確認します。

[2.2 インテリジェントサービス](./modules/delivery-activation/rtcdp-b2c/rtcdpb2c-2/intelligent-services.md)

このモジュールでは、Adobe Experience Platform インテリジェントサービスの設定、設定、使用方法について説明します。

[2.3 Real-Time CDP - オーディエンスの構築とアクションの実行](./modules/delivery-activation/rtcdp-b2c/rtcdpb2c-3/real-time-cdp-build-a-segment-take-action.md)

このモジュールでは、オーディエンスを設定し、Google DV360、Adobe Target、AWS S3などの複数の宛先にオーディエンスをアクティベートします。

[2.4 Real-Time CDP:Audience ActivationからMicrosoftへのAzure Event Hub](./modules/delivery-activation/rtcdp-b2c/rtcdpb2c-4/segment-activation-microsoft-azure-eventhub.md)

このモジュールでは、Microsoft Azure EventHubの宛先をAdobe Experience Platform Real-time CDPのリアルタイムの宛先として設定します。

[2.5 Real-Time CDP Connections：イベント転送](./modules/delivery-activation/rtcdp-b2c/rtcdpb2c-5/aep-data-collection-ssf.md)

このモジュールでは、Google Cloud Platform Pub/SubやAWS Kinesisなどの複数のエンドポイントにサーバーサイドでデータを転送します。

[2.6 Apache KafkaからReal-Time CDPへのストリームデータ](./modules/delivery-activation/rtcdp-b2c/rtcdpb2c-6/aep-apache-kafka.md)

このモジュールでは、独自のApache Kafka クラスターを設定し、データをAdobe Experience Platformにストリーミングする方法について説明します。

### Adobe Journey Optimizer B2C

[3.1 Adobe Journey Optimizer：オーケストレーション](./modules/delivery-activation/ajo-b2c/ajob2c-1/journey-orchestration-create-account.md)

Adobe Journey Optimizerを使用して、トリガーベースのジャーニーを構築します。

[3.2 Adobe Journey Optimizer：外部データソースとカスタムアクション](./modules/delivery-activation/ajo-b2c/ajob2c-2/journey-orchestration-external-weather-api-sms.md)

Adobe Journey Optimizerを利用して、オンラインとオフラインの両方の顧客の行動を把握し、さまざまなチャネルをまたいで、インテリジェントかつコンテクストに即したリアルタイムの対応をおこないます。

[3.3 Adobe Journey Optimizer：プッシュ通知とアプリ内メッセージ](./modules/delivery-activation/ajo-b2c/ajob2c-3/ajopushinapp.md)

ここでは、Adobe Journey Optimizerを使用して、プッシュ通知とアプリ内メッセージを設定します。

[3.4 Adobe Journey Optimizer：イベントベースのジャーニー](./modules/delivery-activation/ajo-b2c/ajob2c-4/journeyoptimizer.md)

本記事では、Journey Optimizerの概要、利点、導入方法を解説します。

[3.5 Adobe Journey Optimizer：翻訳サービス](./modules/delivery-activation/ajo-b2c/ajob2c-5/ajotranslationsvcs.md)

ここでは、Adobe Journey Optimizerで翻訳サービスを設定および使用して、メッセージをローカライズする方法を説明します。

[3.6 Adobe Journey Optimizer：コンテンツ管理](./modules/delivery-activation/ajo-b2c/ajob2c-6/ajocontent.md)

このモジュールでは、Adobe Journey Optimizerでコンテンツカードとランディングページを設定および使用する方法と、Adobe Journey OptimizerとGenStudio for Performance Marketingの連携について詳しく説明します。

[3.7 Adobe Journey Optimizer：意思決定](./modules/delivery-activation/ajo-b2c/ajob2c-7/ajo-decisioning.md)

このモジュールでは、Adobe Journey Optimizerで意思決定とコードベースのエクスペリエンスを設定して使用する方法について説明します。

[3.8 Adobe Journey Optimizer：施策](./modules/delivery-activation/ajo-b2c/ajob2c-8/ajocampaigns.md)

このモジュールでは、Adobe Journey OptimizerでCampaignsを設定して使用する方法について説明します。

### レポートとインサイト

#### Adobe Customer Journey Analytics

[1.1 Customer Journey Analytics:Adobe Experience Platform上でAnalysis Workspaceを使用してダッシュボードを構築する](./modules/reporting-insights/cja-b2c/cjab2c-1/customer-journey-analytics-build-a-dashboard.md)

このモジュールでは、オムニチャネルデータを含むダッシュボードを設定することで、オンラインからオフラインへのインサイトを獲得できます。

[1.2 Customer Journey Analytics:BigQuery Source Connectorを使用したAdobe Experience PlatformでのGoogle Analytics データの取り込みと分析](./modules/reporting-insights/cja-b2c/cjab2c-2/customer-journey-analytics-bigquery-gcp.md)

このモジュールでは、Google Cloud Platformの独自のインスタンスを設定し、Google Cloud Platformにデモデータを読み込みます。その後、BigQuery Source コネクタを使用して、そのデータをGoogle Cloud PlatformからAdobe Experience Platformに取り込みます。

#### Data Distiller

[2.1 クエリサービス](./modules/reporting-insights/datadistiller/dd-1/query-service.md)

Adobe Experience Platformの概要、利点、ベストプラクティスを解説します。

#### Content Analytics

[3.1 Content Analytics](./modules/reporting-insights/content/module3.1/contentanalytics.md)

このモジュールでは、Adobe Content Analyticsの実装方法と使用方法について説明します。

![技術関係者](./assets/images/techinsiders.png){width="50px" align="left"}

>[!NOTE]
>
>ご質問がある場合は、**techinsiders@adobe.com**&#x200B;に電子メールを送信して、今後のコンテンツに関する提案の一般的なフィードバックを共有するには、Tech Insidersに直接お問い合わせください。