---
title: Federated Audience Composition を使用して、Data Warehouseのオーディエンスを取り込みます
description: Federated Audience Composition は、データアーキテクトとデータエンジニアがサードパーティのデータウェアハウスから直接オーディエンスを作成し、強化できる強力な機能です。
breadcrumb-title: 概要
role: Data Architect, Data Engineer
jira: KT-18743
thumbnail: 18743-overview.jpg
recommendations: catalog, noDisplay
last-substantial-update: 2025-08-11T00:00:00Z
exl-id: 9d5a2e40-6cda-4164-87db-1bfffe3438e3
source-git-commit: dd5f594a54a9cab8ef78d36d2cf15a9b5f2b682a
workflow-type: tm+mt
source-wordcount: '501'
ht-degree: 0%

---

# Federated Audience Composition を使用して、Data Warehouseのオーディエンスを取り込みます

Federated Audience Composition （FAC）は、Adobe Real-Time Customer Data Platform（Real-Time CDP）およびAdobe Journey Optimizer環境で使用できる強力な機能です。 これにより、データアーキテクトやデータエンジニアは、顧客データをコピーしたりAdobe Experience Platform（AEP[ に移動したりすることなく、](https://experienceleague.adobe.com/ja/docs/federated-audience-composition/using/start/access-prerequisites){target="_blank"} サポートされているエンタープライズデータウェアハウス）から直接価値の高いオーディエンスをキュレーションおよびアクティブ化できます。 この構成可能な CDP アプローチ（顧客向けにカスタマイズされたソリューション）は、業界の傾向に合わせており、企業がデータガバナンスを維持しながら、パーソナライズされたデジタルエクスペリエンスのためにデータインフラストラクチャを活用できるようにします。

## ビジネスコンテキスト

SecurFinancial 社は、金融サービスを提供する大手企業です。 異なるソースをまたぐ豊富な顧客データを活用して、多数のセグメント向けにオファーとキャンペーンをパーソナライズします。 Adobes Real-Time CDP Federated Audience Composition 機能を使用して、Data Warehouse 内のオーディエンスをキュレーションしながらAdobe Experience Platformの宛先に対してアクティブ化したり、Adobe Journey Optimizerに対してパーソナライズされたカスタマーエクスペリエンスを提供するためにカスタマイズされたソリューションを提供したりすることを計画しています。

## ビジネスシナリオ

SecurFinancial は、SecurFinancial のポートフォリオに有効なローンがなく、優良な信用に基づくローンの資格を事前に満たしている顧客を再ターゲットするメール・キャンペーンを開始したいと考えています。 オンラインの行動データをリアルタイムで取り込む一方で、クレジット情報をAEPに取り込むことに制限があるため、お客様の事前選定を特定する際に課題に直面します。 制限されたデータを移動せずに事前認定済みのお客様を選定するために、Federated Audience Composition を使用してAEP行動オーディエンスを強化します。

## ガイド

このガイドでは、SecureFinancial Business シナリオのサポート方法を示します。 特に、S3 ストレージアカウント、メールキャンペーンを推進するためのJourney Optimizerのジャーニー、ローンの事前承認されたお客様へのオンサイトリターゲティングなど、オーディエンスをこれらのオーディエンスを必要とするシステムにオーディエンスを公開する方法について説明します。

手順は次のとおりです。

1. Adobe Experience Platformをエンタープライズデータウェアハウスに接続します。
2. Federated Audience コンポジションを使用してオーディエンスを作成します。
3. 外部のAmazon S3 宛先へのフェデレーテッド オーディエンスのマッピング。
4. federated audience データを使用してカスタマージャーニーを作成します。
5. 連合データでオーディエンスを強化します。
6. Edgeで「その時点の」パーソナライゼーションを促進します。

## 前提条件

環境内で同様のアクティビティを実行するには、以下を確認します。

- Real-Time CDPまたはJourney OptimizerでプロビジョニングされたAdobe Experience Platform アカウントへのアクセス。
- システム管理者の権限、または権限を設定する機能。
- スキーマ、データセット、オーディエンスなど、Adobe Experience Platformの概念に精通している（推奨：Experience Leagueの [Adobe Experience Platform プレイリストの概要 ](https://experienceleague.adobe.com/ja/playlists/experience-platform-introduction?lang=en){target="_blank"} を完了する）。
- サポートされている [ エンタープライズデータウェアハウス ](https://experienceleague.adobe.com/ja/docs/federated-audience-composition/using/start/access-prerequisites){target="_blank"} へのアクセス。
- データウェアハウスをクエリするための SQL の基本知識。
- **サンドボックス環境**：組織のインスタンスにサンドボックスを作成して、実稼動データに影響を与えずに安全に実験します。
- **Data Warehouse接続**：このチュートリアルではSnowflake接続を使用しますが、任意の [ サポートされている Data Warehouse](https://experienceleague.adobe.com/ja/docs/federated-audience-composition/using/start/access-prerequisites) を使用できます。

最初に、[Federated Audience Composition のアーキテクチャの概要とフロー ](fac-architecture-and-flow.md) を見てみましょう。
