---
title: Edge Networkを使用して「その時点の」パーソナライゼーションを提供する
seo-title: Deliver "in-the moment" personalization using Edge Network | Engage with audiences directly from your data warehouse using Federated Audience Composition
breadcrumb-title: Edge Networkを使用して「その時点の」パーソナライゼーションを提供する
description: この演習では、フェデレーション オーディエンスがEdge上で評価され、即時の「その時点の」リターゲティングが可能になります。
role: Data Architect, Data Engineer
jira: KT-18743
thumbnail: 18743-drive-in-the-moment-personalization.jpg
exl-id: 20bfafb1-1d1b-48d8-84eb-97d4c9e03b76
source-git-commit: 93b787112134919444150974c7149dc10c2d0ca6
workflow-type: tm+mt
source-wordcount: '192'
ht-degree: 0%

---

# Edge Networkを使用して「その時点の」パーソナライゼーションを提供する

Federated Audience Composition を使用すると、Enterprise Data Warehouse からフェデレーションされた構成オーディエンスデータを利用して、Adobe Experience Platform（AEP）の既存のオーディエンスを強化できます。 このデータはAdobe Experience Platformに保持されませんが、[&#x200B; イベント転送 &#x200B;](https://experienceleague.adobe.com/ja/docs/experience-platform/tags/event-forwarding/overview){target="_blank"} 機能を使用して、このデータをデータウェアハウスに直接送信できます。

この演習では、クレジットスコアおよびローンアクティビティでクエリされたフェデレーテッド オーディエンスを使用して、ローン申請 web ページ訪問者の行動オーディエンスを強化します。

Edgeでこのオーディエンスを評価すると、事前に承認されたローン申し込みページの訪問者を、サイト上のパーソナライズされたオファーで即座にリターゲティングします。

![edge-audience-enrich](assets/edge-audience-enrich.png)

## 手順

1. federated audience コンポジションを **保存して開始** します。 コンポジションが実行されると、フェデレーションされたオーディエンスがオーディエンスポータルに表示されます。
2. Federated Audience を組み込み、プロファイルサービスのプロファイル属性とエクスペリエンスイベントを使用して、**オーディエンスルールを作成** します。

最後に、[&#x200B; 学習の概要と最終的な留意点 &#x200B;](conclusion.md) を紹介します。
