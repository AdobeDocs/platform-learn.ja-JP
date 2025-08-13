---
title: Edgeでの「その時点の」パーソナライゼーションの促進
seo-title: Drive "in-the moment" personalization on the Edge | Unlock cross-channel insights with Federated Audience Composition
breadcrumb-title: Edgeでの「その時点の」パーソナライゼーションの促進
description: この視覚的な演習では、Edge上で連合型オーディエンスが評価され、「その時点」でのリターゲティングが即座に行われます。
role: Data Architect, Data Engineer
jira: KT-18743
thumbnail: 18743-drive-in-the-moment-personalization.jpg
hide: true
source-git-commit: 0bbdc93969b4716407ecf51499d572cb50f5a0d3
workflow-type: tm+mt
source-wordcount: '178'
ht-degree: 7%

---


# Edgeでの「その時点の」パーソナライゼーションの促進

Federated Audience Composition を使用すると、Enterprise Data Warehouse からフェデレーションされた構成オーディエンスデータを利用して、Adobe Experience Platform（AEP）の既存のオーディエンスを強化できます。 このデータは、Adobe Experience Platform の顧客プロファイルには保存されません。

この視覚的演習では、クレジットスコアとローンアクティビティでクエリされたフェデレーテッド オーディエンスを使用して、ローン申請 web ページ訪問者の行動オーディエンスを強化します。

Edgeでこのオーディエンスを評価すると、事前に承認されたローン申し込みページの訪問者を、サイト上のパーソナライズされたオファーで即座にリターゲティングします。

![edge-audience-enrich](assets/edge-audience-enrich.png)

## 手順

1. federated audience コンポジションを **保存して開始** します。 コンポジションが実行されると、フェデレーションされたオーディエンスがオーディエンスポータルに表示されます。
2. Federated Audience を組み込み、プロファイルサービスのプロファイル属性とエクスペリエンスイベントを使用して、**オーディエンスルールを作成** します。

最後に、[ 学習の概要と最終的な留意点 ](conclusion.md) を紹介します。
