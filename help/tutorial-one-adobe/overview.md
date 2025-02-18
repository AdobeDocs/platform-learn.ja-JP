---
title: 概要 – 包括的な技術チュートリアル - 1 つのAdobe
description: 包括的なテクニカルチュートリアル - 1 つのAdobe
doc-type: multipage-overview
exl-id: 5bc0d621-0662-4d94-80a0-b6c173c0ac9e
source-git-commit: 9169b0f9be7f192fd7e16ddcc2ae32f6a8cca92c
workflow-type: tm+mt
source-wordcount: '936'
ht-degree: 2%

---

# 包括的なテクニカルチュートリアル - 1 つのAdobe

![ 技術インサイダー ](./assets/images/techinsiders.png){width="50px" align="left"}

## 概要

このチュートリアルは非常に多様で、次のアプリケーションで明確なインサイトを提供します。

- Adobe Firefly サービス
- Adobe Photoshop
- Adobe WorkfrontとAdobe Workfront Fusion
- Adobe Experience Manager Cloud Service、Sites、AssetsおよびEdge Delivery Services
- Adobe Experience Platform
- Adobe Real-Time CDP
- Adobe Journey Optimizer


このチュートリアルでは、Adobeのアプリケーションに重点を置くだけでなく、ブランドが運用する広範なエコシステムを考慮します。 そのために、いくつかの教訓では、Adobe以外のアプリケーションとAdobeのアプリケーションとの統合方法に重点を置いています。 そのため、次のアプリケーションがAdobe Experience Platformとどのように連携するかについて、深く理解することができます。

- AmazonAWS
- Google Cloud Platform
- Microsoft Azure
- Postman
- Snowflake
- ...

## 前提条件

独自のAdobe Experience Cloud インスタンスを使用してこのチュートリアルを実行する場合は、インスタンスに次のアプリケーションをプロビジョニングし、にアクセスできるようにする必要があります。

- Adobe Firefly [https://firefly.adobe.com/](https://firefly.adobe.com/){target="_blank"}
- Adobe Photoshop
- Adobe Workfront
- Adobe Workfront Fusion [https://fusion.adobe.com/](https://fusion.adobe.com/){target="_blank"}
- Adobe Experience Platform: [https://experience.adobe.com/platform](https://experience.adobe.com/platform){target="_blank"}
- Adobe Experience Platform データ収集：[https://experience.adobe.com/#/data-collection/](https://experience.adobe.com/#/data-collection/){target="_blank"}
- デモシステムへのアクセス：[https://dsn.adobe.com/](https://dsn.adobe.com/){target="_blank"}

## 完了と資格認定

このチュートリアルは、Adobe認定制度コースの一部です。 このチュートリアルと共にコースに新規登録するには、[https://certification.adobe.com](https://certification.adobe.com) にアクセスします。

以下のチュートリアルを使用して完了するすべてのモジュールについて、以下に示すように完了証明書を送信する必要があります [ こちら ](./completion.md)。

## コンテンツステータス

以下の内容のステータスを確認するには、[ ステータスページ ](./status.md){target="_blank"} をご覧ください。

### はじめに

[はじめに](./modules/getting-started/gettingstarted/getting-started.md){target="_blank"}

この基本モジュールでは、デモ環境にアクセスして使用できるように、すべてを準備します。

### 1. ワークフローと計画

### 2.創造・生産

[1.1 Adobe Firefly サービス ](./modules/creation-production/module1.1/firefly-services.md){target="_blank"}

このモジュールでは、Adobe Firefly サービス API、Photoshop API およびMicrosoft Azure ストレージサービスを使用して、画像を生成し、プログラムで保存します。

[1.2 Workfront Fusion によるクリエイティブワークフローの自動処理 ](./modules/creation-production/module1.2/automation.md){target="_blank"}

この基本モジュールでは、Adobe Workfront Fusion を使用して、コンテンツ作成ワークフローを自動化および拡張します。

### 3.資産管理

[1.1 Adobe Experience Manager Cloud ServiceおよびEdge Delivery Services](./modules/asset-mgmt/module2.1/aemcs.md){target="_blank"}

この基本モジュールでは、Adobe Experience Manager Cloud Service プログラム、サイトおよびAssets リポジトリを設定します。

[1.2 Adobe Workfrontを使用したワークフロー管理 ](./modules/asset-mgmt/module2.2/workfront.md){target="_blank"}

この基本モジュールでは、Adobe Workfrontを設定および使用して承認フローを管理し、Adobe Experience Manager Assets、ユニバーサルエディター、Photoshopなどとの統合を使用します。

### 4.配信とアクティベーション

#### データ収集

[1.1 Foundation - Adobe Experience Platform Data Collection および Web SDKのセットアップ](./modules/delivery-activation/datacollection/dc1.1/data-ingestion-launch-web-sdk.md)

この基本モジュールでは、Adobe Experience Platform データ収集と、新しい web SDK拡張機能について説明します。

[1.2 基盤 – データ取り込み](./modules/delivery-activation/datacollection/dc1.2/data-ingestion.md)

この基本モジュールでは、様々なソースからAdobe Experience Platformにデータを取り込みます

[1.3 Federated Audience の構成](./modules/delivery-activation/datacollection/dc1.3/fac.md)

このモジュールでは、Federated Audiences モデルを設定し、Federated データを使用してオーディエンスを生成する方法について説明します。

#### Real-Time CDP B2C

[2.1 の基盤 – リアルタイム顧客プロファイル](./modules/delivery-activation/rtcdp-b2c/rtcdpb2c-1/real-time-customer-profile.md)

この基本モジュールでは、UI と API を利用して、Adobe Experience Platformのリアルタイム顧客プロファイルを探索します。

[2.2 インテリジェントサービス](./modules/delivery-activation/rtcdp-b2c/rtcdpb2c-2/intelligent-services.md)

このモジュールでは、Adobe Experience Platform インテリジェントサービスを設定、設定および使用する方法について説明します。

[2.3 Real-Time CDP - オーディエンスを作成し、アクションを実行します](./modules/delivery-activation/rtcdp-b2c/rtcdpb2c-3/real-time-cdp-build-a-segment-take-action.md)

このモジュールでは、オーディエンスを設定し、Google DV360、Adobe Target、AWS S3 など、複数の宛先に対してオーディエンスをアクティブ化します。

[2.4 Real-Time CDP:Audience ActivationからMicrosoft Azure Event Hub へ](./modules/delivery-activation/rtcdp-b2c/rtcdpb2c-4/segment-activation-microsoft-azure-eventhub.md)

このモジュールでは、Adobe Experience Platform Real-time CDP のリアルタイムの宛先として、Microsoft Azure EventHub の宛先を設定します。

[2.5 Real-Time CDP接続：イベント転送](./modules/delivery-activation/rtcdp-b2c/rtcdpb2c-5/aep-data-collection-ssf.md)

このモジュールでは、Google Cloud Platform Pub/Sub やAWS Kinesis など、いくつかのエンドポイントにデータサーバーサイドで転送します。

[2.6 Apache Kafka からReal-Time CDPへのデータのストリーミング](./modules/delivery-activation/rtcdp-b2c/rtcdpb2c-6/aep-apache-kafka.md)

このモジュールでは、独自の Apache Kafka クラスターを設定し、データをAdobe Experience Platformにストリーミングする方法を説明します。

#### Adobe Journey Optimizer B2C

[3.1 Adobe Journey Optimizer：オーケストレーション](./modules/delivery-activation/ajo-b2c/ajob2c-1/journey-orchestration-create-account.md)

このモジュールでは、Adobe Journey Optimizerを使用して、トリガーベースのジャーニーを構築します。

[3.2 Adobe Journey Optimizer：外部データソースとカスタムアクション](./modules/delivery-activation/ajo-b2c/ajob2c-2/journey-orchestration-external-weather-api-sms.md)

このモジュールでは、Adobe Journey Optimizerを使用して、オンラインとオフラインの両方で顧客の行動をリッスンし、様々なチャネルにわたってインテリジェントでコンテキストに応じたリアルタイムの方法で対応します。

[3.3 Adobe Journey Optimizer:Offer Decisioning](./modules/delivery-activation/ajo-b2c/ajob2c-3/offer-decisioning.md)

このモジュールでは、Adobe Journey Optimizerを使用して、パーソナライズされたオファーと独自のオファー決定を設定します。

[3.4 Adobe Journey Optimizer：イベントベースのジャーニー](./modules/delivery-activation/ajo-b2c/ajob2c-4/journeyoptimizer.md)

このモジュールでは、企業が、コンテキストに応じた、つながりのあるパーソナライズされたエクスペリエンスを設計して顧客に提供するのに役立つ、Journey Optimizerについて知っておくべきことをすべて学びます。

[3.5 Adobe Journey Optimizer：翻訳サービス](./modules/delivery-activation/ajo-b2c/ajob2c-5/ajotranslationsvcs.md)

このモジュールでは、Adobe Journey Optimizer内で翻訳サービスを設定および使用して、メッセージを顧客にローカライズする方法について説明します。

### 5. レポートとインサイト

#### Adobe Customer Journey Analytics

[1.1 Customer Journey Analytics:Adobe Experience Platform上にAnalysis Workspaceを使用してダッシュボードを作成する](./modules/reporting-insights/cja-b2c/cjab2c-1/customer-journey-analytics-build-a-dashboard.md)

このモジュールでは、オムニチャネルデータを含んだダッシュボードを設定することで、オンラインからオフラインのインサイトを取得します。

[1.2 Customer Journey Analytics:BigQuery Source コネクタを使用したAdobe Experience PlatformでのGoogle Analytics データの取り込みと分析](./modules/reporting-insights/cja-b2c/cjab2c-2/customer-journey-analytics-bigquery-gcp.md)

このモジュールでは、Google Cloud Platform の独自のインスタンスを設定し、Google Cloud Platform にデモデータを読み込んだ後、BigQuery Source コネクタを使用して、Google Cloud Platform からAdobe Experience Platformにデータを取り込みます。

#### Data Distiller

[2.1 クエリサービス](./modules/reporting-insights/datadistiller/dd-1/query-service.md)

このモジュールでは、Adobe Experience Platform クエリサービスの使用方法を説明します。

![ 技術インサイダー ](./assets/images/techinsiders.png){width="50px" align="left"}

>[!NOTE]
>
>ご不明な点がある場合は、have suggestions on future content の一般的なフィードバックをお知らせください。**techinsiders@adobe.com** に電子メールを送信して、技術インサイダーに直接問い合わせてください。
