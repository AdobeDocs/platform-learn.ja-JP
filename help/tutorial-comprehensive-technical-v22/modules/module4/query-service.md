---
title: クエリサービス
description: クエリサービス
kt: 5342
audience: Data Engineer, Data Architect, Data Analyst, BI Expert
doc-type: tutorial
activity: develop
exl-id: 74943e52-8a7e-4db7-9407-7deeab008fa7
source-git-commit: cc7a77c4dd380ae1bc23dc75608e8e2224dfe78c
workflow-type: tm+mt
source-wordcount: '648'
ht-degree: 2%

---

# 4.クエリサービス

**作成者： [マルク・メウィス](https://www.linkedin.com/in/marcmeewis/), [ウーターヴァンゲルウ](https://www.linkedin.com/in/woutervangeluwe/)**

このモジュールでは、Adobe Experience Platform Query Service の実践プレビューを確認します。 クエリサービスを使用すると、Adobe Campaign、Analytics、Audience Manager、Target、Advertising Cloud、およびAdobe Experience Platformに読み込まれた/挿入されたその他の顧客データを結合し、分析し、すべてのAdobe Experience Cloudアプリケーションデータに対してオムニチャネルクエリを実行できます。

クエリサービスはサーバーレスのツールです。 PostgreSQL の互換性を通じて、複数のクライアントアプリケーションから SQL クエリと接続をサポートします。
Web インタラクションデータ、コールセンターのインタラクション、およびプラットフォームにアップロードされた顧客の忠誠度データを組み合わせて、プラットフォームに挿入されたデータを使用します。

## 学習内容

- Adobe Experience Platform UI の理解
- クエリサービスに接続して SQL クエリを実行する
- Adobe Experience Platformでのデータセットの調査
- Tableau またはPower BIをAdobe Experience Platformクエリサービスに接続して、ビジュアライゼーションとレポートを作成する

## 前提条件

- SQL に関する知識があることが推奨されますが、必須ではありません
- Adobe Experience Platformへのアクセス： [https://experience.adobe.com/platform](https://experience.adobe.com/platform)
- データセット（ラボで使用されるデータセット、事前読み込み）
- PostgreSQL
- Tableau またはMicrosoftPower BIデスクトップ
- **これらのアセットをダウンロード**:
   - [JSON — サンプルデータ：Web サイトの操作](./../../assets/json/ee.json)
   - [JSON — サンプルデータ：コールセンターでのインタラクション](./../../assets/json/callcenter.json)
   - [JSON — サンプルデータ：ロイヤルティ](./../../assets/json/loyalty.json)

>[!IMPORTANT]
>
>このチュートリアルは、特定のワークショップ形式を容易にするために作成されました。 アクセスできない特定のシステムおよびアカウントを使用します。 アクセスがなくても、この非常に詳細な内容を読むことで、多くを学ぶことができると思います。 ワークショップの参加者で、アクセス資格情報が必要な場合は、Adobe担当者に連絡し、必要な情報を伝えてもらってください。

## アーキテクチャの概要

以下のアーキテクチャを見てみましょう。このモジュールで説明および使用するコンポーネントが強調表示されます。

![アーキテクチャの概要](../../assets/images/architecturem7.png)

## 使用するサンドボックス

このモジュールでは、次のサンドボックスを使用してください。 `--module7sandbox--`.

>[!NOTE]
>
>忘れずに、で参照されているように、Chrome 拡張機能をインストール、設定および使用してください。 [0.1 -Experience Leagueドキュメント用の Chrome 拡張機能のインストール](../module0/ex1.md)

## 演習

[4.0 前提条件](./ex0.md)

クエリを実行するには、PSQL をインストールする必要があります。このイネーブルメントの演習では、 ご使用のオペレーティングシステムに応じて、MicrosoftPower BIまたは Tableau をインストールする必要があります。 Windows ユーザーは、Power BIか Tableau かを選択できます。 Macのユーザーは、Tableau をインストールする必要があります。

[4.1 はじめに](./ex1.md)

この演習では、Adobe Experience Platformクエリサービスのユーザーインターフェイスを調べ、データセットの詳細、クエリの検索、PSQL からの接続の設定を行います。

[4.2 クエリサービスの使用](./ex2.md)

この演習では、基本的なクエリサービス構文について学び、クエリで XDM スキーマの属性を識別できます。

[4.3 クエリ、クエリ、クエリ…およびチャーン分析](./ex3.md)

この演習では、クエリを実行し、チャーン分析をおこなう際に、Adobe定義関数について学びます。 この最後に、MicrosoftPower BIで使用するデータセットを準備するクエリを記述します。

[4.4 クエリからデータセットを生成する](./ex4.md)

この演習では、前の演習で実行したクエリからデータセットを生成し、次の演習でこのデータセットを使用します。

[4.5 クエリサービスとPower BI](./ex5.md)

この演習では、Power BIをAdobe Experience Platformとクエリサービスに接続して、Callcenter インタラクション分析を実行します。

[4.6 クエリサービスと Tableau](./ex6.md)

この練習では、Tableau をAdobe Experience Platformとクエリサービスに接続し、Callcenter インタラクション分析を実行します。

[4.7 クエリサービス API](./ex7.md)

この演習では、クエリサービス API を使用して、クエリテンプレートとクエリスケジュールを管理します。

[概要とメリット](./summary.md)

このモジュールの概要とメリットの概要。

>[!NOTE]
>
>Adobe Experience Platformについて知っておくべきすべてのことを学ぶために時間を費やしてくれてありがとう。 ご質問がある場合は、今後のコンテンツに関する提案がある一般的なフィードバックを共有したい場合は、Wouter Van Geluwe に直接お問い合わせください。 **vangeluw@adobe.com**.

[すべてのモジュールに戻る](../../overview.md)
