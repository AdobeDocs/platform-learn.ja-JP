---
title: Federated Data を使用してExperience Platform オーディエンスを強化
seo-title: Enrich Experience Platform audiences with federated data | Unlock cross-channel insights with Federated Audience Composition
breadcrumb-title: Federated Data を使用してExperience Platform オーディエンスを強化
description: この視覚的な演習では、Experience Platform オーディエンスをフェデレーテッド データで強化します。
role: Data Architect, Data Engineer
jira: KT-18743
thumbnail: 18743-enrich-audience-with-federated-data.jpg
exl-id: 3f6aa121-0dbd-4ad9-b136-d1455eed03ca
source-git-commit: 3de9721332379f9fd3dd45768ba2ca2308e09357
workflow-type: tm+mt
source-wordcount: '175'
ht-degree: 7%

---

# Federated Data を使用してExperience Platform オーディエンスを強化

Federated Audience Composition を使用すると、Enterprise Data Warehouse からフェデレーションされた構成オーディエンスデータを利用して、Adobe Experience Platform（AEP）の既存のオーディエンスを強化できます。 このデータは、Adobe Experience Platform の顧客プロファイルには保存されません。

## フェデレーテッド コンポジション内のAEP オーディエンスの読み取り

この視覚的な演習では、AEPのプロファイルサービスに保存された **SecurFinancial Loan Application Page Visitor** オーディエンスを使用して、フェデレーション コンポジションを開始します。 Snowflakeの連合データを使用して、信用スコアとローンアクティビティに基づいて事前承認を判断します。

![federated-composition-example](assets/snowflake-preapproval.png)

### 手順

1. **AEP オーディエンスを** Federated Audience Composition の宛先にマッピングします。
2. マッピングされたオーディエンスを読み取りオーディエンスとして使用して **コンポジションを作成** します。
3. 読み取りオーディエンスの **ID を紐付け** フェデレーション データと結合します。

![federated-method-1-1](assets/federated-method-1-1.png)

![federated-method-1-2](assets/federated-method-1-2.png)

連合データを使用して [ その時点での」パーソナライゼーションをサポート ](drive-in-the-moment-personalization.md) する別の例を見てみましょう。
