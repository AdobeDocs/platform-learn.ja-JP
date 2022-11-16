---
title: Adobe Experience PlatformでのGoogle Analyticsデータの取り込みと分析（BigQuery Source Connector を使用）
description: Adobe Experience PlatformでのGoogle Analyticsデータの取り込みと分析（BigQuery Source Connector を使用）
kt: 5342
audience: Data Engineer, Data Architect, Data Analyst
doc-type: tutorial
activity: develop
exl-id: c9c28b5a-d158-49fa-9533-1a295876f6c4
source-git-commit: cc7a77c4dd380ae1bc23dc75608e8e2224dfe78c
workflow-type: tm+mt
source-wordcount: '555'
ht-degree: 3%

---

# 12. Adobe Experience Platformで BigQuery Source Connector を使用してGoogle Analyticsデータを取り込み、分析します。

**作成者： [ヴィクトル・ド・ラ・イグレシア](https://www.linkedin.com/in/victordelaiglesia/), [ウーターヴァンゲルウ](https://www.linkedin.com/in/woutervangeluwe/)**

このモジュールでは、Google Cloud Platform の独自のインスタンスを設定し、Google Cloud Platform でサンプルデータを読み込み、BigQuery ソースコネクタを使用して、Google Cloud Platform からAdobe Experience Platformにデータを取り込みます。 最後に、Customer Journey Analyticsを使用してデータを視覚化します。

Adobe Experience Platformのソースコネクタを使用すると、データをAdobe Experience Platformに簡単に取り込むことができます。 Google BigQuery は、既に利用可能なコネクタの 1 つです。 Adobe Experience Platformと BigQuery Source Connector の機能により、Google AnalyticsデータをAnalysis WorkspaceにCustomer Journey Analyticsで取り込めるようになりました。

さらに、Customer Journey Analytics内の CRM、コールセンター、ロイヤリティデータなどの他のデータソースと結合して、そのGoogle Analyticsデータをエンリッチメントすることができます。

## 学習内容

- Google Cloud Platform と BigQuery のユーザーインターフェイスについて
- Adobe Experience Platform への Google Analytics データの取り込み
- Customer Journey Analyticsを使用してGoogle Analyticsデータの分析を実行
- オフラインGoogle Analyticsでデータを強化

## 前提条件

- Customer Journey Analyticsに関する知識が好まれるが、必須ではない
- Adobe Experience Platformへのアクセス： [https://experience.adobe.com/platform](https://experience.adobe.com/platform)
- Customer Journey Analyticsへのアクセス
- Google Cloud Platform とGoogle BigQuery へのアクセス
- **これらのアセットをダウンロード**:
   - [JSON — サンプルデータ：ロイヤルティデータ](./../../assets/json/bqLoyalty.json)

>[!IMPORTANT]
>
>このチュートリアルは、特定のワークショップ形式を容易にするために作成されました。 アクセスできない特定のシステムおよびアカウントを使用します。 アクセスがなくても、この非常に詳細な内容を読むことで、多くを学ぶことができると思います。 ワークショップの参加者で、アクセス資格情報が必要な場合は、Adobe担当者に連絡し、必要な情報を伝えてもらってください。

## アーキテクチャの概要

以下のアーキテクチャを見てみましょう。このモジュールで説明および使用するコンポーネントが強調表示されます。

![アーキテクチャの概要](../../assets/images/architecturem16.png)

## 使用するサンドボックス

このモジュールでは、次のサンドボックスを使用してください。 `--aepSandboxId--`.

>[!NOTE]
>
>忘れずに、で参照されているように、Chrome 拡張機能をインストール、設定および使用してください。 [0.1 -Experience Leagueドキュメント用の Chrome 拡張機能のインストール](../module0/ex1.md)

## 演習

[12.1 Google Cloud Platform アカウントの作成](./ex1.md)

Google Cloud Platform アカウントを作成します。

[12.2 BigQuery で最初のクエリを作成する](./ex2.md)

BigQuery を使用して、Platform に読み込むデータを準備する方法を説明します。

[12.3 GCP と BigQuery のAdobe Experience Platformへの接続](./ex3.md)

Adobe Experience Platformでソースコネクタを設定する方法を説明します。

[12.4 BigQuery からAdobe Experience Platformへのデータの読み込み](./ex4.md)

Adobe Experience Platformで BigQuery ソースコネクタを設定して、Google Analyticsデータを取り込む方法を説明します。

[12.5Customer Journey Analyticsを使用したGoogle Analyticsデータの分析](./ex5.md)

Customer Journey AnalyticsのGoogle Analyticsデータを分析し、Loyalty データと組み合わせる方法を説明します。

[概要とメリット](./summary.md)

このモジュールの概要とメリットの概要。

>[!NOTE]
>
>Adobe Experience Platformについて知っておくべきすべてのことを学ぶために時間を費やしてくれてありがとう。 ご質問がある場合は、今後のコンテンツに関する提案がある一般的なフィードバックを共有したい場合は、Wouter Van Geluwe に直接お問い合わせください。 **vangeluw@adobe.com**.

[すべてのモジュールに戻る](../../overview.md)
