---
title: Adobe Experience Platform Data Collection とリアルタイムサーバーサイド転送
description: このモジュールでは、以前に設定したデータセット、スキーマ、Adobe Experience Platform Data Collection Server プロパティを使用してデータを収集し、そのデータサーバーサイドを選択したエンドポイントに転送します。
kt: 5342
doc-type: tutorial
exl-id: dbf5e995-9c2e-4f72-b336-e942cb22cde5
source-git-commit: 3d61d91111d8693ab031fbd7b26706c02818108c
workflow-type: tm+mt
source-wordcount: '460'
ht-degree: 0%

---

# 2.5 Real-Time CDP接続：イベント転送

このモジュールでは、以前に設定したデータセット、スキーマ、Adobe Experience Platform データ収集クライアントプロパティを使用してデータを収集し、そのデータサーバーサイドを選択したエンドポイントに転送します。

このモジュールでは、以下を行います。

- Adobe Experience Platform Data Collection Server プロパティの作成
- Adobe Experience Platform Data Collection にAdobe Cloud Connector 拡張機能をインストールして使用する
- Google関数エンドポイントを作成し、それにデータをストリーミングします
- AWS エンドポイントを作成し、それにデータをストリーミングします

## 学習内容

- Adobe Experience Platform Data Collection Server のプロパティと、新しいAdobe Cloud Connector 拡張機能について理解します
- GoogleやAWSなどのサードパーティソリューションでAdobe Experience Platform web SDK データを再利用する方法を理解する
- Adobe Experience Platform Data Collection とサーバーサイド転送の背後にあるアーキテクチャを理解します。

## 前提条件

- Adobe Experience PlatformおよびAdobe Experience Platform Data Collection へのアクセス
- Adobe Experience Platform データセットおよび XDM の理解

>[!NOTE]
>
>[Experience League ドキュメントのChrome拡張機能のインストール &#x200B;](../../../getting-started/gettingstarted/ex1.md) で参照されているように、Chrome拡張機能をインストール、設定、使用することを忘れないでください。

## 演習

[2.5.1 データ収集イベント転送プロパティの作成](./ex1.md)

この演習では、Adobe Experience Platform Data Collection Event Forwarding プロパティを作成します。

[2.5.2 データ収集イベント転送プロパティでデータを使用できるように、データストリームを更新する](./ex2.md)

この演習では、既存のデータストリームを更新して、Adobe Experience Platform Data Collection Client プロパティで収集されたデータをAdobe Experience Platform Data Collection Server プロパティで使用できるようにします。

[2.5.3 カスタム Webhook の作成と設定](./ex3.md)

この演習では、カスタム Webhook を作成および設定し、Web SDKで収集されたデータをそのカスタム Webhook に転送し始めます。

[2.5.4 GCP Pub/Sub にイベントを転送する](./ex4.md)

この演習では、Google Cloud 関数を作成および設定し、web SDKで収集されたデータのGoogleへの転送を開始します。

[2.5.5 AWS Kinesis およびAWS S3 へのフォワードイベント](./ex5.md)

この演習では、AWS IAM、AWS Kinesis、AWS Firehose、AWS S3 を使用してAWS環境を設定し、その後、Web SDKで収集されるイベントデータの転送を開始します。

[概要と利点](./summary.md)

このモジュールの概要とメリットの概要

![&#x200B; 技術インサイダー &#x200B;](./../../../../assets/images/techinsiders.png){width="50px" align="left"}

>[!NOTE]
>
>Adobe Experience Platformとそのアプリケーションについて知るのに時間を費やしていただき、ありがとうございます。 ご不明な点がある場合は、have suggestions on future content の一般的なフィードバックをお知らせください。**techinsiders@adobe.com** に電子メールを送信して、技術インサイダーに直接問い合わせてください。

[すべてのモジュールに戻る](./../../../../overview.md)
