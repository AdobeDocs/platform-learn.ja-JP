---
title: Federated Audience Composition でクロスチャネルインサイトのロックを解除
description: Federated Audience Composition は、データアーキテクトとデータエンジニアがサードパーティのデータウェアハウスから直接オーディエンスを作成し、強化できる強力な機能です。
breadcrumb-title: 概要
role: Data Architect, Data Engineer
jira: KT-18743
thumbnail: 18743-overview.jpg
recommendations: catalog, noDisplay
last-substantial-update: 2025-08-11T00:00:00Z
exl-id: 9d5a2e40-6cda-4164-87db-1bfffe3438e3
source-git-commit: a3c8d8b03472d01f491bf787ed647a696d3a5524
workflow-type: tm+mt
source-wordcount: '551'
ht-degree: 0%

---

# 概要

Federated Audience Composition は、Adobe Real-Time Customer Data Platform（Real-Time CDP）およびAdobe Journey Optimizer環境で使用できる強力な機能です。 データアーキテクトとデータエンジニアは、データをAdobe Experience Platformにレプリケートすることなく、[ サポート対象 ](https://experienceleague.adobe.com/en/docs/federated-audience-composition/using/start/access-prerequisites){target="_blank"} サードパーティのデータウェアハウスから直接オーディエンスを作成および強化できます。 このチュートリアルでは、技術ユーザーがエンタープライズデータウェアハウスを接続し、オーディエンスを作成および強化し、パーソナライズされたマーケティングエクスペリエンス用にアクティブ化するための実践的なガイダンスを提供します。

## ビジュアルガイド

このビジュアルガイドでは、ビジネスシナリオの様々な側面をサポートするために実行される各アクティビティの手順を示します。 目標は、環境で活用できる次のようなアクティビティを提供することです。

- Adobe Experience Platformをエンタープライズデータウェアハウスに接続します。
- Federated Audience Composition を使用してオーディエンスを作成および管理します。
- フェデレーションされたオーディエンスをAmazon S3 などの外部の宛先にマッピングします。
- Federated Data を使用して既存のオーディエンスを強化します。
- 「その場の」パーソナライゼーションを推進するオーディエンスを作成します。
- federated audience データを使用してカスタマージャーニーを作成します。

このガイドは、Real-Time CDPまたはJourney Optimizerを使用するデータアーキテクトおよびデータエンジニアを対象としています。 ここでは、Adobe Experience Platformと基本的な Data Warehouse の概念に関する知識を前提としています。

## ビジネスコンテキスト

SecurFinancial 社は、金融サービスを提供する大手企業です。 異なるソースをまたぐ豊富な顧客データを活用して、多数のセグメント向けにオファーとキャンペーンをパーソナライズします。 同社は、AdobeのReal-Time CDP Federated Audience Composition 機能を使用する予定です。この機能を使用すると、企業は既存の Data Warehouse を使用しながら、Adobe Experience Platformのアプリケーションを使用して、パーソナライズされたカスタマーエクスペリエンスを提供できます。 主なメリットは次のとおりです。

- **ウェアハウスデータへのアクセス**：データのレプリケーションを行わずに、サポート対象のデータウェアハウスのデータセットから価値の高いオーディエンスを作成します。
- **データ移動の最小化**: ウェアハウス内でデータを直接クエリし、重複を減らし、データガバナンスを維持します。
- **統合エクスペリエンスワークフロー**：クロスチャネルのユースケース向けに、Adobe Experience Platform内のオーディエンスをキュレーションおよびアクティブ化します。
- **パーソナライゼーションの強化**: ウェアハウス属性を使用してプロファイルとオーディエンスを強化し、リアルタイムのトリガーエクスペリエンスを強化します。

## ビジネスシナリオ

SecurFinancial は、SecurFinancial のポートフォリオに有効なローンがなく、優良な信用に基づくローンの資格を事前に満たしている顧客を再ターゲットするメール・キャンペーンを開始したいと考えています。 オンラインの行動データをリアルタイムで取り込む一方で、クレジット情報をAEPに取り込むことに制限があるため、お客様の事前選定を特定する際に課題に直面します。 制限付きデータを移動せずに事前認定されたお客様を選定するために、Federated Audience Composition を使用してAEP行動オーディエンスを強化します。

## 前提条件

環境内で同様のアクティビティを実行するには、以下を確認します。

- Real-Time CDPまたはJourney OptimizerでプロビジョニングされたAdobe Experience Platform アカウントへのアクセス。
- システム管理者の権限、または権限を設定する機能。
- スキーマ、データセット、オーディエンスなど、Adobe Experience Platformの概念に精通している（推奨：Experience Leagueの [Adobe Experience Platform プレイリストの概要 ](https://experienceleague.adobe.com/en/playlists/experience-platform-introduction?lang=en){target="_blank"} を完了する）。
- サポートされているエンタープライズデータウェアハウス（Amazon Redshift、Azure Synapse Analytics、Snowflake、Google BigQuery など）へのアクセス。
- データウェアハウスをクエリするための SQL の基本知識。
- **サンドボックス環境**：組織のReal-Time CDP インスタンスにサンドボックスを作成して、実稼動データに影響を与えずに安全に実験します。
- **Data Warehouse接続**：このチュートリアルではSnowflake接続を使用しますが、任意の [ サポートされている Cloud Warehouse](https://experienceleague.adobe.com/en/docs/federated-audience-composition/using/start/access-prerequisites) を使用することもできます。

[Data Warehouse接続 ](data-warehouse-connection.md) から始めましょう。
