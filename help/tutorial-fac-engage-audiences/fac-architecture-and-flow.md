---
title: Federated Audience Composition の全体的なアーキテクチャとフロー
seo-title: Federated Audience Composition High-level Architecture & Flow | Engage with Audiences from your Data Warehouse using Federated Audience Composition
breadcrumb-title: Federated Audience Composition の全体的なアーキテクチャとフロー
description: Federated Audience Composition のアーキテクチャ概要とフローの概要です。
role: Data Architect, Data Engineer
jira: KT-18743
thumbnail: 18743-high-level-architecture.jpg
source-git-commit: dd5f594a54a9cab8ef78d36d2cf15a9b5f2b682a
workflow-type: tm+mt
source-wordcount: '193'
ht-degree: 0%

---


# Federated Audience Composition の全体的なアーキテクチャとフロー

SecurFinancial のビジネス・シナリオをサポートする手順を説明する前に、この構成可能な CDP アプローチのアーキテクチャとフローの概要を確認します。

Adobe Experience Platformの Federated Audience Composition モジュールでは、基になるデータをコピーすることなく Data Warehouse データセットへのアクセスを拡張できるため、データの移動と複製を最小限に抑えることができます。

これにより、必要なデータ管理作業をウェアハウスですでに完了しており、Adobe Experience Platformをエンゲージメントエンジンとするゼロコピーパターンを使用したい、必要なコンポーザブルアーキテクチャも実現します。

これにより、企業は 1 つ以上のデータ・ウェアハウスに保存されている情報を迅速に処理できます。 これにより、Adobe Experience にデータを取り込む必要がなくなります。 さらに、エンタープライズデータウェアハウスに存在するが、これまでカスタマーエクスペリエンスワークフローではアクセスできなかった新しいデータセットへのアクセスを提供します。 例としては、顧客エンゲージメントの集計オーディエンスレベルで役立つ、トランザクション履歴や個人データなどがあります。

![fac-architecture](assets/fac-architecture.png)

次に、[Data Warehouse接続 ](data-warehouse-connection.md) の作成に進みます。

