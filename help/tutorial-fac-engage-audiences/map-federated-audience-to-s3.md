---
title: Federated Audience の S3 の宛先へのマッピング
seo-title: Map a Federated Audience to an S3 Destination | Engage with audiences directly from your data warehouse using Federated Audience Composition
breadcrumb-title: Federated Audience の S3 へのマッピング
description: この演習では、パーソナライズされたオフラインエクスペリエンスをサポートするために、フェデレーテッド オーディエンスをダウンストリーム Real-Time CDPの宛先にマッピングします。
role: Data Architect, Data Engineer
jira: KT-18743
thumbnail: 18743-create-an-audience.jpg
exl-id: a47b8f7b-7bd0-43a0-bc58-8b57d331b444
source-git-commit: 93b787112134919444150974c7149dc10c2d0ca6
workflow-type: tm+mt
source-wordcount: '277'
ht-degree: 0%

---

# Federated Audience を S3 の宛先にマッピングして、オーディエンス属性を活用してエンリッチメントを行います

Data Warehouse でオーディエンス属性を活用すると、RTCDPの宛先を使用したダウンストリームアクティベーションワークフローでのオーディエンスのエクスペリエンスを強化できます。 SecurFinancial の場合、これらのフェデレーション属性を使用して、顧客オーディエンスのパーソナライゼーションエクスペリエンスをオフラインで強化できます。 以下では、federated audience が事前設定済みのAmazon S3 の宛先にマッピングされます。

## 手順

1. **宛先** ポータルに移動します。

2. 事前設定済みのAmazon S3 の宛先の横にある「**3 ドットメニュー**」ボタンをクリックし、「**オーディエンスをアクティブ化**」をクリックします。

   ![activate-audiences](assets/activate-audiences.png)

3. **S3 の宛先** を選択し、「**次へ**」をクリックします。

   ![select-s3-destination](assets/select-s3-destination.png)

4. 適切なオーディエンスを選択します。 この例では、**SecureFinancial Customers - No Loans, Good Credit** audience です。

   ![select-s3-audience](assets/select-s3-audience.png)

5. [**スケジュール設定**] セクションで、既定の設定を使用し、[**次へ**] をクリックします。

6. **マッピング** ステップで、重複除外キーを選択します。 この例では、`xdm: personalEmail.address` が含まれており、**重複除外キー** として選択されています。 次に、「**次へ** をクリックします。

   ![ 重複排除キー ](assets/deduplication-key.png)

7. マッピングステップでは、フェデレーションされたオーディエンス構成のオーディエンスフィールドマッピングに基づいてエンリッチメント属性を選択します。 **鉛筆（編集）** アイコンをクリックして、事前に選択された属性を表示します。

   ![edit-attributes](assets/edit-attributes.png)

   ![final-attributes](assets/final-attribution.png)

8. オーディエンスマッピングを確認し、「**完了** を押します。

>[**!SUMMARY**]
>
> オーディエンスを正常に作成し、S3 の宛先に対して簡単にアクティブ化しました。 他のソリューションでは、このオーディエンスを受け取り、すぐに使用できます。 この使いやすいインターフェイスを使用することで、マーケティングチームは、基になるデータを移動することなく、オーディエンスをすばやく作成してアクティブ化できます。 このアプローチを採用するお客様は、約 1 か月で初めて使用を開始しました。

次に、[ ジャーニーの構築 ](build-journey-federated-audience.md) を行います。
