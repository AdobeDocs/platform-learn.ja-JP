---
title: Apache Kafka からAdobe Experience Platformへのデータのストリーミング
description: このモジュールでは、Kafka Connect 用Adobe Experience Platform Sink Connect を使用して、独自の Apache Kafka クラスターを設定し、トピック、プロデューサー、コンシューマーを定義し、Adobe Experience Platformにデータをストリーミングする方法を学びます。
kt: 5342
audience: Data Engineer, Data Architect, Data Analyst
doc-type: tutorial
activity: develop
exl-id: e1e283b1-93b7-4d06-b9ed-beac48a99c3f
source-git-commit: cc7a77c4dd380ae1bc23dc75608e8e2224dfe78c
workflow-type: tm+mt
source-wordcount: '419'
ht-degree: 2%

---

# 15. Apache Kafka からAdobe Experience Platformへのデータのストリーミング

**作成者： [Vivek Tiwari](https://www.linkedin.com/in/vivek-tiwari-25092656/), [Nipun Nair](https://www.linkedin.com/in/nipunnair/), [ウーターヴァンゲルウ](https://www.linkedin.com/in/woutervangeluwe/)**

このモジュールでは、独自の Apache Kafka クラスターを設定し、トピック、プロデューサー、コンシューマーを定義し、Kafka Connect を通じてAdobe Experience Platform Sink Connector を使用してAdobe Experience Platformにデータをストリーミングする方法を学びます。

## 学習内容

- ローカル Kafka クラスタの基本設定の実行
- Kafka トピックを作成し、Kafka プロデューサーと Kafka コンシューマーを使用します。
- Kafka Connect とAdobe Experience Platform Sink Connector の設定
- 手動でイベントを作成し、それらのイベントがAdobe Experience Platformに取り込まれるのを確認する
- Kafka Connect の既存のTwitterプロデューサーライブラリを使用して、TwitterデータをAdobe Experience Platformにストリーミングします

## 前提条件

- お使いのコンピューターに Java JDK11 以降をインストールする必要があります。その JDK は、次の場所でダウンロードできます。 [https://www.oracle.com/java/technologies/javase-jdk11-downloads.html](https://www.oracle.com/java/technologies/javase-jdk11-downloads.html)
- Adobe Experience Platform へのアクセス

## アーキテクチャの概要

以下のアーキテクチャを見てみましょう。このモジュールで説明および使用するコンポーネントが強調表示されます。

![アーキテクチャの概要](../../assets/images/architecturem24.png)

## 使用するサンドボックス

このモジュールでは、次のサンドボックスを使用してください。 `--aepSandboxId--`.

>[!NOTE]
>
>忘れずに、で参照されているように、Chrome 拡張機能をインストール、設定および使用してください。 [0.1 -Experience Leagueドキュメント用の Chrome 拡張機能のインストール](../module0/ex1.md)

## 演習

[15.1 Apache Kafka の概要](./ex1.md)

この練習では、Apache Kafka の基本について学びます。

[15.2 Kafka クラスターのインストールと設定](./ex2.md)

この演習では、基本的な Apache Kafka クラスターをダウンロード、インストール、設定します。

[15.3 Adobe Experience Platformでの HTTP API ストリーミングエンドポイントの設定](./ex3.md)

この演習では、Adobe Experience Platformで HTTP API ソースコネクタを設定します。

[15.4 Kafka Connect とAdobe Experience Platform Sink Connector のインストールと設定](./ex4.md)

この練習では、Kafka Connect を使用してAdobe Experience Platform Sink Connector をインストールして使用し、イベントをAdobe Experience Platformに手動で送信します。

[概要とメリット](./summary.md)

このモジュールの概要とメリットの概要。

>[!NOTE]
>
>Adobe Experience Platformについて知っておくべきすべてのことを学ぶために時間を費やしてくれてありがとう。 ご質問がある場合は、今後のコンテンツに関する提案がある一般的なフィードバックを共有したい場合は、Wouter Van Geluwe に直接お問い合わせください。 **vangeluw@adobe.com**.

[すべてのモジュールに戻る](../../overview.md)
