---
title: クエリサービス
description: クエリサービス
kt: 5342
doc-type: tutorial
exl-id: 6eb65de3-d0e8-49d4-a702-5c9d6a1952b7
source-git-commit: bd46be455f88007174f7e6be9a1ce5f508edc09b
workflow-type: tm+mt
source-wordcount: '549'
ht-degree: 1%

---

# 5.1 クエリサービス

このモジュールでは、Adobe Experience Platform クエリサービスの実践プレビューを取得します。 クエリサービスを使用すると、すべてのAdobe Experience Cloud アプリケーションデータにわたってオムニチャネルクエリを実行し、Adobe Campaign、Analytics、Audience Manager、Target、Advertising CloudおよびAdobe Experience Platformに読み込まれた/挿入されたその他の顧客データを結合して分析できます。

クエリサービスはサーバーレスのツールです。 PostgreSQL の互換性を通じて、複数のクライアントアプリケーションからの SQL クエリと接続をサポートしています。
Web インタラクションデータ、コールセンターインタラクションのいずれかを使用してプラットフォームに挿入されたデータを、プラットフォームにアップロードされた顧客ロイヤルティデータと組み合わせて使用します。

## 学習内容

- Adobe Experience Platformの UI に精通する
- クエリサービスに接続し、SQL クエリを実行する
- Adobe Experience Platformのデータセットの調査
- Tableau またはPower BIをAdobe Experience Platform クエリサービスに接続して、ビジュアライゼーションとレポートを作成します

## 前提条件

- SQL についてある程度理解していることが望ましいですが、必須ではありません
- Adobe Experience Platformへのアクセス：[https://experience.adobe.com/platform](https://experience.adobe.com/platform)
- データセット（ラボで使用するデータセットで、事前に読み込まれているもの）
- PostgreSQL
- Tableau またはMicrosoft Power BIデスクトップ
- **これらのアセットをダウンロードします**。
   - [JSON - サンプルデータ：Web サイトのインタラクション](./../../../assets/json/ee.json)
   - [JSON - サンプルデータ：コールセンターインタラクション](./../../../assets/json/callcenter.json)
   - [JSON - サンプルデータ：ロイヤルティ](./../../../assets/json/loyalty.json)

>[!NOTE]
>
>Experience LeagueドキュメントのChrome拡張機能のインストール [ で参照されているように、Chrome拡張機能をインストール、設定および使用することを忘れないでください ](../../gettingstarted/gettingstarted/ex1.md)

## 演習

[5.1.1 前提条件](./ex1.md)

このイネーブルメント演習では、クエリを実行するために PSQL をインストールする必要があります。 オペレーティングシステムに応じて、Microsoft Power BIまたは Tableau をインストールする必要があります。 Windows ユーザーは、Power BIまたは Tableau から選択できます。 Macのユーザーは、Tableau をインストールする必要があります。

[5.1.2 はじめに](./ex2.md)

この演習では、Adobe Experience Platform クエリサービスのユーザーインターフェイスを探索し、データセットについて学び、クエリを見つけて、最後に PSQL からの接続を設定します。

[5.1.3 クエリサービスの使用](./ex3.md)

この演習では、基本的なクエリサービス構文について説明し、クエリ内の XDM スキーマの属性を特定できます。

[5.1.4 クエリ、クエリ、クエリ…およびチャーン分析](./ex4.md)

この演習では、クエリを実行し、チャーン分析を行いながらAdobe定義関数について学びます。 この作業の最後に、Microsoft データで使用するPower BIセットを準備するクエリを作成します。

[5.1.5 クエリからのデータセットの生成](./ex5.md)

この演習では、前の演習で実行したクエリからデータセットを生成し、次の演習でこのデータセットを使用します。

[5.1.6 クエリサービスとPower BI](./ex6.md)

この演習では、Power BIをAdobe Experience Platformとクエリサービスに接続して、Callcenter インタラクション分析を実行します。

[5.1.7 クエリサービスと Tableau](./ex7.md)

この演習では、Tableau をAdobe Experience Platformとクエリサービスに接続して、Callcenter Interaction Analysis を実行します。

[5.1.8 クエリサービス API](./ex8.md)

この演習では、Query Service API を使用して、クエリテンプレートとクエリスケジュールを管理します。

[概要と利点](./summary.md)

このモジュールの概要とメリットの概要

![ 技術インサイダー ](./../../../assets/images/techinsiders.png){width="50px" align="left"}

>[!NOTE]
>
>Adobe Experience Platformとそのアプリケーションについて知るのに時間を費やしていただき、ありがとうございます。 ご不明な点がある場合は、have suggestions on future content の一般的なフィードバックをお知らせください。**techinsiders@adobe.com** に電子メールを送信して、技術インサイダーに直接問い合わせてください。

[すべてのモジュールに戻る](../../../overview.md)
