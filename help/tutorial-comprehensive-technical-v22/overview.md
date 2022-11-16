---
title: 概要
description: データエンジニア、データアナリスト、データアーキテクト、データサイエンティスト、オーケストレーションエンジニア、マーケターがAdobe Experience Platformとそのすべてのアプリケーションサービスのビジネス価値を完全に理解できるようにする出発点です。
doc-type: multipage-overview
hide: false
exl-id: 88c19383-c185-40f0-b118-6cb82db0ce0e
source-git-commit: cc7a77c4dd380ae1bc23dc75608e8e2224dfe78c
workflow-type: tm+mt
source-wordcount: '1869'
ht-degree: 2%

---

# Adobe Experience Platform の包括的な技術チュートリアル

## 概要

このチュートリアルは、データエンジニア、データアナリスト、データアーキテクト、データサイエンティスト、オーケストレーションエンジニア、マーケターがAdobe Experience Platformとそのすべてのアプリケーションサービスのビジネス価値を完全に理解できる出発点として最適です。 各レッスンでは、今日のパーソナライゼーションの複雑なエコシステムでビジネスが直面する実際の課題に焦点を当て、さまざまな実践演習でExperience Platformがその課題を解決する方法を分類します。 このビデオを見て、Adobe Experience Platformが解決に役立つ問題を理解してください。

>[!VIDEO](https://video.tv.adobe.com/v/344237?quality=12&enable=on)

このチュートリアルは非常に多様で、次のアプリケーションに関する明確なインサイトを提供します。

- Adobe Experience Platform
- Adobe Experience Platform のデータ収集
- Real-time CDP
- Adobe Journey Optimizer
- Customer Journey Analytics
- Offer Decisioning

このチュートリアルでは、Adobeアプリケーションに焦点を当てるだけでなく、ブランドが動作するより広範なエコシステムを考慮に入れます。 そのために、いくつかのレッスンでは、次の方法に焦点を当てています _非Adobe_ アプリケーションはAdobe Experience Platformと統合されます。 そのため、以下のアプリケーションがAdobe Experience Platformと連携する仕組みについて深く理解できます。

- Amazon:AWS Lambda、AWS S3、AWS Kinesis
- Google:Google Cloud Platform、Google BigQuery、Google Display&amp;Video 360、Google AdWords
- Microsoft:Power BI、Azure EventHub、Azure Blob ストレージ
- Salesforce:Tableau
- Apache Kafka
- Postman
- ...

このチュートリアルでは、次の内容について学習します。

- スキーマ、Mixin、データセット、ID の設定
- Adobe Experience Platformデータ収集プロパティを設定し、Adobe Experience Platformデータ収集で新しい Web SDK 拡張機能を設定する
- Adobe Experience Platformデータ収集、Google Tag Manager、Amazon Alexaを使用した、Adobe Experience Platformへのデータのリアルタイムストリーミング
- ワークフローを使用するか、抽出、変換、読み込み (ETL) アプリケーションを使用して、データをAdobe Experience Platformにバッチ取り込み
- Adobe Experience Platformでのリアルタイム顧客プロファイルの視覚化と使用
- セグメントの作成
- 複数のAdobe Experience Platform API を使用する
- SQL を使用してAdobe Experience Platformでデータをクエリする
- Adobe Experience Platformでの機械学習モデルの設定、トレーニング、スコアリング
- Journey Orchestrationを使用して、リアルタイムのトリガーベースのジャーニーを設定します
- リアルタイム CDP を使用して、様々な宛先へのセグメントをアクティブ化し、アクションを実行する
- Customer Journey Analyticsを使用して、Google BigQuery を含む様々なソースからのオムニチャネル顧客データをレポートします

## 前提条件

- Adobe Experience Platformへのアクセス： [https://experience.adobe.com/platform](https://experience.adobe.com/platform)
- Adobe Experience Platform Data Collection へのアクセス： [https://experience.adobe.com/#/data-collection/](https://experience.adobe.com/#/data-collection/)
- デモシステムへのアクセス： [https://dashboard.adobedemo.com/](https://dashboard.adobedemo.com/)

>[!IMPORTANT]
>
>このチュートリアルは、特定のワークショップ形式を容易にするために作成されました。 アクセスできない特定のシステムおよびアカウントを使用します。 アクセスがなくても、この非常に詳細な内容を読むことで、多くを学ぶことができると思います。 ワークショップの参加者で、アクセス資格情報が必要な場合は、Adobe担当者に連絡し、必要な情報を伝えてもらってください。

## このチュートリアルについて

このレッスンでは、複数の業界をサポートするデモ Web サイトを使用してAdobe Experience Platformと Application Services を実装します。 デモ Web サイトとモバイルアプリには、現実的な実装を構築できる豊富なデータレイヤーと機能があります。 次のようなデモブランドにアクセスできます。 **Luma**, **シティ信号**, **EXP ニュース**, **相互 365**, **カルベロ** その他にも何人か お客様は独自のAdobe Experience Platform Data Collection Client プロパティを独自のExperience Cloud組織に構築し、デモ Web サイトにマッピングします。 これにより、独自のAdobe Experience Platformインスタンスに送信されるデータが生成されます。

## アーキテクチャ

実践演習を始める前に、このチュートリアルの背後にあるアーキテクチャを見てみましょう。 上記の概要に示すように、このチュートリアルでは、Adobe Experience Platformの様々な機能について詳しく説明しますが、様々なソースおよび宛先での複数の統合についても説明します。 このチュートリアルの背後にあるアーキテクチャと、Adobe Experience Platformのエンタープライズエコシステムへの全体的な位置付けを適切に理解するには、まずアーキテクチャのビデオと図を確認します。

に移動します。 [アーキテクチャ](./architecture.md).


## ビデオ

![ビデオ](./assets/images/yt.jpeg)

Tech Academy のイベントや Bootcamps など、当社のイベントで多くの興味深いビデオをご覧いただけます。 [Experience Makers コミュニティYouTubeチャネル](https://www.youtube.com/channel/UCUKG2dkZ9pYuZUPebQ21jUw).

Adobe Experience Platformアプリケーションと非Adobeアプリケーションとの間のイネーブルメントと強力な統合の要素を紹介するビデオがいくつか作成されました。 以下のリンクをクリックすると、これらのビデオの概要を確認できます。

に移動します。 [ビデオ](./videos.md).



## Adobe Experience Platformの包括的なテクニカルチュートリアルを完了するには、どのようにして測定しますか。

AdobeパートナーまたはAdobe従業員としてこのチュートリアルに参加する場合は、各イネーブルメントモジュールを完了してから進捗を送信する必要があります。

完了通知の要件とプロセスは、次の場所で確認できます。 [完了の測定](./completion.md)

## コンテンツ

[0.はじめに](./modules/module0/getting-started.md)

- **対象ユーザ：** Adobe Experience Platformの包括的なテクニカルチュートリアルのすべての参加者
- **前提条件：** デモシステムへのアクセス次へ、Adobe Experience PlatformとAdobe Experience Platformのデータ収集。 Adobe Experience Platform環境のデフォルトの設定 ID へのアクセス
- **説明：** この基本的なモジュールでは、デモ環境にアクセスして使用できるようにすべてを設定します。
- **投資期間：** 30 分

[1. Foundation - Adobe Experience Platformデータ収集および Web SDK のセットアップ](./modules/module1/data-ingestion-launch-web-sdk.md)

- **対象ユーザ：** データエンジニア、データアーキテクト
- **前提条件：** Adobe Experience PlatformとAdobe Experience Platformのデータ収集にアクセスする。
- **説明：** この基本的なモジュールでは、Adobe Experience Platformデータ収集と新しい Web SDK 拡張機能について学びます。
- **投資期間：** 30 分

[2.基盤 — データ取り込み](./modules/module2/data-ingestion.md)

- **対象ユーザ：** データエンジニア、データアーキテクト
- **前提条件：** Adobe Experience PlatformとAdobe Experience Platformのデータ収集にアクセスする。
- **説明：** この基本的なモジュールでは、Web サイトから Platform にデータを取り込みます
- **投資期間：** 120 分

[3.基盤 — リアルタイム顧客プロファイル](./modules/module3/real-time-customer-profile.md)

- **対象ユーザ：** データエンジニア、データアーキテクト、マーケター
- **前提条件：** Adobe Experience PlatformとPostmanへのアクセス
- **説明：** この基本的なモジュールでは、UI と API を利用してAdobe Experience Platformのリアルタイム顧客プロファイルを調べます。
- **投資期間：** 90 分
- **これらのアセットをダウンロード**:
   - [Postmanコレクション](./assets/postman/postman_profile.zip)

[4.クエリサービス](./modules/module4/query-service.md)

- **対象ユーザ：** データエンジニア、データアーキテクト、データアナリスト、BI エキスパート
- **前提条件：** Adobe Experience Platform、クエリサービス、Power BI、Tableau へのアクセス
- **説明：** このモジュールでは、Adobe Experience Platform Query Service の使用方法を学びます。
- **投資期間：** 90 分
- **これらのアセットをダウンロード**:
   - [JSON — サンプルデータ：デモシステム — Web サイトのイベントデータセット](./assets/json/ee.json)
   - [JSON — サンプルデータ：デモシステム — コールセンターのイベントデータセット](./assets/json/callcenter.json)
   - [JSON — サンプルデータ：デモシステム — ロイヤルティ用のプロファイルデータセット](./assets/json/loyalty.json)

[5.インテリジェントサービス](./modules/module5/intelligent-services.md)

- **対象ユーザ：** データエンジニア、データアーキテクト、データサイエンティスト
- **前提条件：** Adobe Experience Platform、インテリジェントサービスへのアクセス
- **説明：** このモジュールでは、Adobe Experience Platform Intelligent Services を設定、設定および使用する方法を学びます。
- **投資期間：** 60 分

[6. Real-Time CDP — セグメントを作成し、アクションを実行する](./modules/module6/real-time-cdp-build-a-segment-take-action.md)

- **対象ユーザ：** マーケター、オーケストレーションエンジニア、データアーキテクト
- **前提条件：** Adobe Experience Platform、リアルタイム CDP、Adobe Audience Manager、Adobe Target、AWS S3 へのアクセス
- **説明：** このモジュールでは、セグメントをストリーミングセグメント化用に設定し、セグメントを有効にして、Google DV360、Google AdWords、Adobe Audience Manager、Adobe Target、S3-destinations(SalesforceMarketing Cloudなど ) を含む複数の宛先に対してアクティブ化します。
- **投資期間：** 90 分

[7.Adobe Journey OptimizerOrchestration](./modules/module7/journey-orchestration-create-account.md)

- **対象ユーザ：** データエンジニア、データアーキテクト、オーケストレーションエンジニア
- **前提条件：** Adobe Experience PlatformとAdobe Journey Optimizerへのアクセス
- **説明：** このモジュールでは、Adobe Journey Optimizerを使用してトリガーベースのジャーニーを構築します。
- **投資期間：** 60 分

[8.Adobe Journey Optimizer外部データソースとカスタムアクション](./modules/module8/journey-orchestration-external-weather-api-sms.md)

- **対象ユーザ：** データエンジニア、データアーキテクト、オーケストレーションエンジニア、マーケター
- **前提条件：** Adobe Experience Platform、Adobe Journey Optimizer、オープンウェザー API、Twilio へのアクセス
- **説明：** このモジュールでは、Adobe Journey Optimizerを使用して、オンラインとオフラインの両方で顧客の行動をリッスンし、様々なチャネルをまたいでインテリジェントで、コンテキストに沿った、リアルタイムな方法で応答します。
- **投資期間：** 90 分

[9.Adobe Journey Optimizeroffer decisioning](./modules/module9/offer-decisioning.md)

- **対象ユーザ：** データエンジニア、データアーキテクト、オーケストレーションエンジニア、マーケター
- **前提条件：** Adobe Experience PlatformとOffer decisioningへのアクセス
- **説明：** このモジュールでは、Adobe Experience Platform - Offers/Decisioning アプリケーションサービスを実際の方法で使用し、パーソナライズされたオファーと独自のオファーアクティビティを設定します。
- **投資期間：** 120 分

[10.Adobe Journey Optimizer:イベントベースのジャーニー](./modules/module10/journeyoptimizer.md)

- **対象ユーザ：** メールマーケター、オーケストレーションスペシャリスト、データエンジニア、データアーキテクト、データアナリスト
- **前提条件：** Adobe Experience PlatformとJourney Optimizerへのアクセス
- **説明：** このモジュールでは、Journey Optimizerに関して知っておくべきすべてのことを学びます。これは、企業が、顧客に対して、つながりのある、コンテキストに沿った、パーソナライズされたエクスペリエンスを設計し、提供するのに役立ちます。
- **投資期間：** 120 分

[11.Customer Journey Analytics:Adobe Experience Platform上部のAnalysis Workspaceを使用したダッシュボードの作成](./modules/module11/customer-journey-analytics-build-a-dashboard.md)

- **対象ユーザ：** データエンジニア、データアーキテクト、データアナリスト
- **前提条件：** Adobe Experience PlatformとCustomer Journey Analyticsへのアクセス
- **説明：** このモジュールでは、Web サイトでのインタラクション、モバイルアプリでのインタラクション、コールセンターでのインタラクション、店舗でのインタラクションなどのオムニチャネルデータを含むダッシュボードを設定して、オンラインからオフラインへのインサイトを得ます。
- **投資期間：** 120 分

[12.Customer Journey Analytics:Adobe Experience PlatformでのGoogle Analyticsデータの取り込みと分析（BigQuery Source Connector を使用）](./modules/module12/customer-journey-analytics-bigquery-gcp.md)

- **対象ユーザ：** データエンジニア、データアーキテクト、データアナリスト
- **前提条件：** Adobe Experience Platform、Customer Journey Analytics、Google Cloud Platform、Google BigQuery へのアクセス
- **説明：** このモジュールでは、Google Cloud Platform の独自のインスタンスを設定し、Google Cloud Platform でデモデータを読み込んだ後、BigQuery ソースコネクタを使用して、Google Cloud Platform からAdobe Experience Platformにデータを取り込みます。 最後に、Customer Journey Analyticsを使用してデータを視覚化します。
- **投資期間：** 120 分
- **これらのアセットをダウンロード**:
   - [JSON — サンプルデータ：デモ — ロイヤルティデータ](./assets/json/bqLoyalty.json)

[13.Real-Time CDP:Microsoft Azure Event Hub に対するセグメントのアクティベーション](./modules/module13/segment-activation-microsoft-azure-eventhub.md)

- **対象ユーザ：** データエンジニア、データアーキテクト、データアナリスト
- **前提条件：** Adobe Experience Platform、リアルタイム CDP、Microsoft Azure へのアクセス
- **説明：** このモジュールでは、Adobe Experience Platform Real-time CDP のリアルタイムの宛先としてMicrosoft Azure EventHub の宛先を設定します。 また、Adobe Experience Platformが Azure EventHub の宛先にセグメントペイロードを配信するたびにリアルタイムでトリガーされる Azure 関数を設定し、デプロイします。 トリガーに使用する Azure 機能は、Adobe Experience Platform Real-time CDP のアクティベーション機能のメカニズムを示します。
また、このモジュールの一部として、リアルタイム CDP がトリガーに対して、指定した宛先にペイロードを実際に配信する方法についても理解できます。 また、セグメント認定のステータスと、それとアクティベーションとの関連についても説明します。
- **投資期間：** 90 分

[14.Real-Time CDP接続：イベント転送](./modules/module14/aep-data-collection-ssf.md)

- **対象ユーザ：** データエンジニア、データアーキテクト、データアナリスト
- **前提条件：** Real-Time CDP接続、タグ、イベント転送プロパティへのアクセス
- **説明：** このモジュールでは、以前に設定したデータセット、スキーマ、Adobe Experience Platformデータ収集プロパティを使用してデータを収集し、そのデータをサーバー側で任意のエンドポイントに転送します。
- **投資期間：** 90 分

[15. Apache Kafka からReal-Time CDPへのデータのストリーミング](./modules/module15/aep-apache-kafka.md)

- **対象ユーザ：** データ・アナリスト、データ・エンジニア、データ・アーキテクト
- **前提条件：** Adobe Experience Platformへのアクセス
- **説明：** このモジュールでは、Kafka Connect 用Adobe Experience Platform Sink Connect を使用して、独自の Apache Kafka クラスターを設定し、トピック、プロデューサー、コンシューマーを定義し、Adobe Experience Platformにデータをストリーミングする方法を学びます。
- **投資期間：** 90 分

>[!NOTE]
>
>Adobe Experience Platformについて知っておくべきすべてのことを学ぶために時間を費やしてくれてありがとう。 ご質問がある場合は、今後のコンテンツに関する提案がある一般的なフィードバックを共有したい場合は、Wouter Van Geluwe に直接お問い合わせください。 **vangeluw@adobe.com**.
