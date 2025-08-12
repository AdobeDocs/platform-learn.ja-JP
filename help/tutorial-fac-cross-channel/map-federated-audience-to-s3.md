---
title: フェデレーションされたオーディエンスの S3 へのマッピング
seo-title: Map a federated audience to S3 | Unlock cross-channel insights with Federated Audience Composition
breadcrumb-title: フェデレーションされたオーディエンスの S3 へのマッピング
description: このレッスンでは、パーソナライズされたオフラインエクスペリエンスをサポートするために、フェデレーテッド オーディエンスをダウンストリーム Real-Time CDPの宛先にマッピングします。
role: Data Architect, Data Engineer
jira: KT-18743
thumbnail: 18743-create-an-audience.jpg
hide: true
source-git-commit: a5ae2695763bc3d6dce786861dcbc15f3422c035
workflow-type: tm+mt
source-wordcount: '221'
ht-degree: 0%

---


# Federated Audience を S3 にマッピングして、オーディエンス属性を活用してエンリッチメントを行います

この演習では、Data Warehouse でオーディエンス属性を活用して、RTCDPの宛先を使用したダウンストリームアクティベーションワークフローでオーディエンスのエクスペリエンスを強化する方法を説明します。 SecurFinancial の場合、これらのフェデレーション属性を使用して、顧客オーディエンスのパーソナライゼーションエクスペリエンスをオフラインで強化できます。 この例では、federated audience を事前設定済みのAmazon S3 の宛先にマッピングします。

## 手順

1. **宛先** ポータルに移動します。

2. 事前設定済みのAmazon S3 の宛先の横にある「**3 ドットメニュー**」ボタンをクリックし、「**オーディエンスをアクティブ化**」をクリックします。

   ![activate-audiences](assets/activate-audiences.png)

3. **S3 の宛先** を選択し、「**次へ**」をクリックします。

   ![select-s3-destination](assets/select-s3-destination.png)

4. **SecureFinancial 顧客 – ローンなし、良い信用** オーディエンスを選択します。

   ![select-s3-audience](assets/select-s3-audience.png)

5. **スケジュール** セクションで、すべての設定をデフォルトのままにして **次へ** をクリックします。

6. **マッピング** ステップで、次のものが含まれ、**重複排除キー** として選択されていることを確認します。 次に、「**次へ** をクリックします。
   - `xdm: personalEmail.address`

   ![ 重複排除キー ](assets/deduplication-key.png)

7. 次のマッピング手順では、フェデレーションされたオーディエンス構成のオーディエンスフィールドのマッピングに基づいてエンリッチメント属性を選択できます。 **鉛筆（編集）** アイコンをクリックして、事前に選択された属性を表示します。

   ![edit-attributes](assets/edit-attributes.png)

   ![final-attributes](assets/final-attribution.png)

8. オーディエンスマッピングを確認し、「**完了** を押します。

[ ジャーニーの構築 ](build-journey-federated-audience.md) に進む準備が整いました。
