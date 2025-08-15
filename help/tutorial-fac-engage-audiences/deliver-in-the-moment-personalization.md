---
title: Edge Networkを使用して「その時点の」パーソナライゼーションを提供する
seo-title: Deliver "in-the moment" personalization using Edge Network | Engage with Audiences from your Data Warehouse using Federated Audience Composition
breadcrumb-title: Edge Networkを使用して「その時点の」パーソナライゼーションを提供する
description: この演習では、フェデレーション オーディエンスがEdge上で評価され、即時の「その時点の」リターゲティングが可能になります。
role: Data Architect, Data Engineer
jira: KT-18743
thumbnail: 18743-drive-in-the-moment-personalization.jpg
exl-id: 20bfafb1-1d1b-48d8-84eb-97d4c9e03b76
source-git-commit: dd5f594a54a9cab8ef78d36d2cf15a9b5f2b682a
workflow-type: tm+mt
source-wordcount: '175'
ht-degree: 0%

---

# Edge Networkを使用して「その時点の」パーソナライゼーションを提供する

Federated Audience Composition を使用すると、Enterprise Data Warehouse からフェデレーションされた構成オーディエンスデータを利用して、Adobe Experience Platform（AEP）の既存のオーディエンスを強化できます。 このデータはAdobe Experience Platformには保持されません。

この視覚的演習では、クレジットスコアとローンアクティビティでクエリされたフェデレーテッド オーディエンスを使用して、ローン申請 web ページ訪問者の行動オーディエンスを強化します。

Edgeでこのオーディエンスを評価すると、事前に承認されたローン申し込みページの訪問者を、サイト上のパーソナライズされたオファーで即座にリターゲティングします。

![edge-audience-enrich](assets/edge-audience-enrich.png)

## 手順

1. federated audience コンポジションを **保存して開始** します。 コンポジションが実行されると、フェデレーションされたオーディエンスがオーディエンスポータルに表示されます。
2. Federated Audience を組み込み、プロファイルサービスのプロファイル属性とエクスペリエンスイベントを使用して、**オーディエンスルールを作成** します。

最後に、[ 学習の概要と最終的な留意点 ](conclusion.md) を紹介します。
