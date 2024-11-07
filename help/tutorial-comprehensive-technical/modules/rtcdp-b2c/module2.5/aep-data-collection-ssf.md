---
title: Adobe Experience Platform Data Collection とリアルタイムサーバーサイド転送
description: このモジュールでは、以前に設定したデータセット、スキーマ、Adobe Experience Platform Data Collection Server プロパティを使用してデータを収集し、そのデータサーバーサイドを選択したエンドポイントに転送します。
kt: 5342
doc-type: tutorial
source-git-commit: 2cdc145d7f3933ec593db4e6f67b60961a674405
workflow-type: tm+mt
source-wordcount: '480'
ht-degree: 0%

---

# 2.5 Real-Time CDP接続：イベント転送

**著者：[Wouter Van Geluwe](https://www.linkedin.com/in/woutervangeluwe/), [Clement Delalande](https://www.linkedin.com/in/clement-delalande/)**

このモジュールでは、以前に設定したデータセット、スキーマ、Adobe Experience Platform データ収集クライアントプロパティを使用してデータを収集し、そのデータサーバーサイドを選択したエンドポイントに転送します。

このモジュールでは、以下を行います。

- Adobe Experience Platform Data Collection Server プロパティの作成
- Adobe Experience Platform Data Collection にAdobeクラウドコネクタ拡張機能をインストールして使用する
- Google関数エンドポイントを作成し、それにデータをストリーミングします
- AWS エンドポイントを作成し、それにデータをストリーミングします

このビデオを視聴すると、価値、カスタマージャーニー、設定プロセスについて理解できます。

>[!VIDEO](https://video.tv.adobe.com/v/331987?quality=12&learn=on)

## 学習内容

- Adobe Experience Platform Data Collection Server のプロパティと、新しいAdobeCloud Connector 拡張機能について理解します
- GoogleやAWSなどのサードパーティソリューションでAdobe Experience Platform Web SDK データを再利用する方法を説明します
- Adobe Experience Platform Data Collection とサーバーサイド転送の背後にあるアーキテクチャを理解します。

## 前提条件

- Adobe Experience PlatformおよびAdobe Experience Platform Data Collection へのアクセス
- Adobe Experience Platform データセットおよび XDM の理解

>[!NOTE]
>
>[0.1 -Experience Leagueドキュメント用のChrome拡張機能のインストールで参照されているように、Chrome拡張機能をインストール、設定および使用することを忘れないでください ](../../gettingstarted/gettingstarted/ex1.md)

## 演習

[2.5.1 データ収集イベント転送プロパティの作成](./ex1.md)

この演習では、Adobe Experience Platform Data Collection Event Forwarding プロパティを作成します。

[2.5.2 データ収集イベント転送プロパティでデータを使用できるように、データストリームを更新する](./ex2.md)

この演習では、既存のデータストリームを更新して、Adobe Experience Platform Data Collection Client プロパティで収集されたデータをAdobe Experience Platform Data Collection Server プロパティで使用できるようにします。

[2.5.3 カスタム Webhook の作成と設定](./ex3.md)

この演習では、カスタム Webhook を作成および設定し、Web SDK によって収集されたデータをそのカスタム Webhook に転送し始めます。

[2.5.4 Google Cloud 関数の作成と設定](./ex4.md)

この演習では、Google Cloud 関数を作成および設定し、Web SDK で収集されたデータのGoogleへの転送を開始します。

[2.5.5 AWSエコシステムに向けたフォワードイベント](./ex5.md)

この演習では、AWS API Gateway、AWS Kinesis、AWS Firehose、AWS S3 を使用してAWS環境を設定し、Web SDK で収集されるイベントデータの転送を開始します。

[概要と利点](./summary.md)

このモジュールの概要とメリットの概要

>[!NOTE]
>
>Adobe Experience Platformとそのアプリケーションについて知るのに時間を費やしていただき、ありがとうございます。 ご不明な点がある場合は、have suggestions on future content の一般的なフィードバックをお知らせください。**techinsiders@adobe.com** に電子メールを送信して、技術インサイダーに直接問い合わせてください。

[すべてのモジュールに戻る](../../../overview.md)
