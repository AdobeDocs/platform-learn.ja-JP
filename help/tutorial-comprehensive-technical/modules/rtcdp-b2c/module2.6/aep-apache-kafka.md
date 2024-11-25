---
title: Apache Kafka からAdobe Experience Platformへのデータのストリーミング
description: このモジュールでは、独自の Apache Kafka クラスターを設定し、トピック、プロデューサー、コンシューマーを定義し、Kafka Connect 用のAdobe Experience Platform シンクコネクタを使用してAdobe Experience Platformにデータをストリーミングする方法について説明します。
kt: 5342
doc-type: tutorial
exl-id: 2b7010f3-ab31-4099-aecd-fd4e73b7e96e
source-git-commit: 6485bfa1c75c43bb569f77c478a273ace24a61d4
workflow-type: tm+mt
source-wordcount: '366'
ht-degree: 1%

---

# 2.6 Apache Kafka からAdobe Experience Platformへのデータのストリーミング

このモジュールでは、独自の Apache Kafka クラスターを設定し、トピック、プロデューサー、コンシューマーを定義し、Kafka Connect を通じてAdobe Experience Platform シンクコネクタを使用してAdobe Experience Platformにデータをストリーミングする方法について説明します。

## 学習内容

- ローカル Kafka クラスターの基本設定の実行
- Kafka トピックを作成し、Kafka プロデューサーと Kafka コンシューマーを使用します
- Kafka Connect とAdobe Experience Platformシンクコネクタの設定
- イベントを手動で作成し、それらのイベントがAdobe Experience Platformに取り込まれるのを確認します
- Kafka Connect の既存のTwitterプロデューサーライブラリを使用して、TwitterデータをAdobe Experience Platformにストリーミングします

## 前提条件

- コンピューターに Java JDK23 以降をインストールする必要があります。次の場所から JDK をダウンロードできます：[https://www.oracle.com/java/technologies/javase-jdk11-downloads.html](https://www.oracle.com/java/technologies/javase-jdk11-downloads.html)
- Adobe Experience Platformへのアクセス

>[!NOTE]
>
>Experience LeagueドキュメントのChrome拡張機能のインストール [ で参照されているように、Chrome拡張機能をインストール、設定および使用することを忘れないでください ](../../gettingstarted/gettingstarted/ex1.md)

## 演習

[2.6.1 Apache Kafka の概要](./ex1.md)

この演習では、Apache Kafka の基本について説明します

[2.6.2 Kafka クラスターのインストールと設定](./ex2.md)

この演習では、基本的な Apache Kafka クラスターをダウンロード、インストール、設定します。

[2.6.3 Adobe Experience Platformで HTTP API ストリーミングエンドポイントを設定する](./ex3.md)

この演習では、Adobe Experience Platformで HTTP API Source コネクタを設定します。

[2.6.4 Kafka Connect とAdobe Experience Platformシンクコネクタのインストールと設定](./ex4.md)

この演習では、Kafka Connect を使用してAdobe Experience Platform シンクコネクタをインストールして使用し、イベントを手動でAdobe Experience Platformに送信します。

[概要と利点](./summary.md)

このモジュールの概要とメリットの概要

>[!NOTE]
>
>Adobe Experience Platformとそのアプリケーションについて知るのに時間を費やしていただき、ありがとうございます。 ご不明な点がある場合は、have suggestions on future content の一般的なフィードバックをお知らせください。**techinsiders@adobe.com** に電子メールを送信して、技術インサイダーに直接問い合わせてください。

[すべてのモジュールに戻る](../../../overview.md)
