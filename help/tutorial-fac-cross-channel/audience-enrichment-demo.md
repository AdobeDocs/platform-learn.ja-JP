---
title: Federated Data を使用してExperience Platform オーディエンスを強化
seo-title: Enrich Experience Platform audiences with federated data | Unlock cross-channel insights with Federated Audience Composition
breadcrumb-title: Federated Data を使用してExperience Platform オーディエンスを強化
description: このレッスンでは、federated data を使用してExperience Platform オーディエンスを強化します。
role: Data Architect, Data Engineer
jira: KT-18743
thumbnail: 18743-enrich-audience-with-federated-data.jpg
hide: true
source-git-commit: a5ae2695763bc3d6dce786861dcbc15f3422c035
workflow-type: tm+mt
source-wordcount: '289'
ht-degree: 5%

---


# 連合オーディエンス構成

Federated Audience Composition を使用すると、Enterprise Data Warehouse からフェデレーションされた構成オーディエンスデータを利用して、Adobe Experience Platform（AEP）の既存のオーディエンスを強化できます。 このデータは、Adobe Experience Platform の顧客プロファイルには保存されません。

## フェデレーションのオーディエンス構成をエンリッチメントする方法

Federated Audience コンポジションを強化するには、主に 2 つの方法があります。

### &#x200B;1. フェデレーテッド コンポジション内のAEP オーディエンスの読み取り

この最初の例では、AEPのプロファイルサービスに保存された **SecurFinancial Loan Application Page Visitor** オーディエンスを使用して、フェデレーション コンポジションを開始します。 Snowflakeのフェデレーティッドデータを使用してオーディエンスをエンリッチメントし、クレジットスコアとローンアクティビティに基づいて事前承認を判断します。

![federated-composition-example](assets/snowflake-preapproval.png)

1. **AEP オーディエンスを** Federated Audience Composition の宛先にマッピングします。
2. マッピングされたオーディエンスを読み取りオーディエンスとして使用して **コンポジションを作成** します。
3. 読み取りオーディエンスの **ID を紐付け** フェデレーション データと結合します。

![federated-method-1-1](assets/federated-method-1-1.png)

![federated-method-1-2](assets/federated-method-1-2.png)

### &#x200B;2. フェデレーティッドオーディエンスを使用したExperience Platform オーディエンスルールの強化

2 番目の例では、信用スコアとローンアクティビティでクエリされた連合オーディエンスを使用して、ローン申請 web ページ訪問者の行動オーディエンスを強化します。

Edgeでこのオーディエンスを評価すると、事前に承認されたローン申し込みページの訪問者を、サイト上のパーソナライズされたオファーで即座にリターゲティングできます。

![edge-audience-enrich](assets/edge-audience-enrich.png)

1. federated audience コンポジションを **保存して開始** します。 コンポジションが実行されると、フェデレーションされたオーディエンスがオーディエンスポータルに表示されます。
2. Federated Audience を組み込み、プロファイルサービスのプロファイル属性とエクスペリエンスイベントを使用して、**オーディエンスルールを作成** します。

最後に、[ 学習の概要と最終的な留意点 ](conclusion.md) を紹介します。
