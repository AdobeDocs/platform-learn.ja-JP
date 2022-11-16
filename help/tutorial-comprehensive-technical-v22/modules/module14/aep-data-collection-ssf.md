---
title: Adobe Experience Platformデータ収集およびリアルタイムサーバー側転送
description: このモジュールでは、以前に設定したデータセット、スキーマ、Adobe Experience Platform Data Collection Server プロパティを使用してデータを収集し、そのデータをサーバー側で任意のエンドポイントに転送します。
kt: 5342
audience: Data Engineer, Data Architect, Data Analyst
doc-type: tutorial
activity: develop
exl-id: c157ca52-c84f-4398-a658-2b6067e41707
source-git-commit: cc7a77c4dd380ae1bc23dc75608e8e2224dfe78c
workflow-type: tm+mt
source-wordcount: '574'
ht-degree: 1%

---

# 14.Real-Time CDP接続：イベント転送

**作成者： [ウーターヴァンゲルウ](https://www.linkedin.com/in/woutervangeluwe/), [クレメントデラランデ](https://www.linkedin.com/in/clement-delalande/)**

このモジュールでは、以前に設定したデータセット、スキーマ、Adobe Experience Platform Data Collection Client プロパティを使用してデータを収集し、そのデータをサーバー側で任意のエンドポイントに転送します。

このモジュールでは、次の操作を実行します。

- Adobe Experience Platform Data Collection Server プロパティの作成
- Adobe Experience Platformデータ収集でのAdobeCloud Connector 拡張機能のインストールと使用
- Google Function エンドポイントを作成し、そのエンドポイントにデータをストリーミングする
- AWSエンドポイントを作成し、そのエンドポイントにデータをストリーミングする

価値、カスタマージャーニー、設定プロセスについては、このビデオをご覧ください。

>[!VIDEO](https://video.tv.adobe.com/v/331987?quality=12&learn=on)

## 学習内容

- Adobe Experience Platform Data Collection Server のプロパティと新しい Cloud Connector 拡張機能について説明します。
- GoogleやAWSなどのサードパーティソリューションでAdobe Experience Platform Web SDK データを再利用する方法を理解する
- Adobe Experience Platformデータ収集およびサーバー側転送のアーキテクチャを理解します。

## 前提条件

- Adobe Experience PlatformとAdobe Experience Platformのデータ収集へのアクセス
- Adobe Experience Platformデータセットと XDM について

>[!IMPORTANT]
>
>このチュートリアルは、特定のワークショップ形式を容易にするために作成されました。 アクセスできない特定のシステムおよびアカウントを使用します。 アクセスがなくても、この非常に詳細な内容を読むことで、多くを学ぶことができると思います。 ワークショップの参加者で、アクセス資格情報が必要な場合は、Adobe担当者に連絡し、必要な情報を伝えてもらってください。

## アーキテクチャの概要

以下のアーキテクチャを見てみましょう。このモジュールで説明および使用するコンポーネントが強調表示されます。

![アーキテクチャの概要](../../assets/images/architecturem21.png)

## 使用するサンドボックス

このモジュールでは、次のサンドボックスを使用してください。 `--aepSandboxId--`.

>[!NOTE]
>
>忘れずに、で参照されているように、Chrome 拡張機能をインストール、設定および使用してください。 [0.1 -Experience Leagueドキュメント用の Chrome 拡張機能のインストール](../module0/ex1.md)

## 演習

[14.1 データ収集イベント転送プロパティの作成](./ex1.md)

この演習では、 Adobe Experience Platformデータ収集イベント転送プロパティを作成します。

[14.2 データストリームを更新して、データ収集イベント転送プロパティでデータを使用できるようにします。](./ex2.md)

この演習では、既存の Datastream を更新して、Adobe Experience Platform Data Collection Client プロパティで収集されたデータをAdobe Experience Platform Data Collection Server プロパティで使用できるようにします。

[14.3 カスタム Webhook の作成と設定](./ex3.md)

この演習では、カスタム Webhook を作成して設定し、Web SDK で収集されたデータのそのカスタム Webhook への転送を開始します。

[14.4 Googleクラウド機能の作成と設定](./ex4.md)

この演習では、Google Cloud Function を作成して設定し、Web SDK で収集されたデータのGoogleへの転送を開始します。

[14.5 AWSエコシステムに向けてイベントを進める](./ex5.md)

この演習では、AWS API Gateway、AWS Kinesis、AWS Firehose、AWS S3 を使用してAWS環境を設定し、その後、Web SDK で収集されたイベントデータの転送を開始します。

[概要とメリット](./summary.md)

このモジュールの概要とメリットの概要。

>[!NOTE]
>
>Adobe Experience Platformについて知っておくべきすべてのことを学ぶために時間を費やしてくれてありがとう。 ご質問がある場合は、今後のコンテンツに関する提案がある一般的なフィードバックを共有したい場合は、Wouter Van Geluwe に直接お問い合わせください。 **vangeluw@adobe.com**.

[すべてのモジュールに戻る](../../overview.md)
