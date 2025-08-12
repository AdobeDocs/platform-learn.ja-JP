---
title: Federated Audience データを使用したジャーニーの作成
seo-title: Build a journey with federated audience data | Unlock cross-channel insights with Federated Audience Composition
breadcrumb-title: Federated Audience データを使用したジャーニーの作成
description: このレッスンでは、Journey Optimizer ジャーニーでフェデレーテッド オーディエンスを使用します。
role: Data Architect, Data Engineer
jira: KT-18743
thumbnail: 18743-build-a-journey-with-federated-audience-data.jpg
hide: true
source-git-commit: b5611dccdba66d31f7dfcd96506e06d1bdd5fb3d
workflow-type: tm+mt
source-wordcount: '410'
ht-degree: 0%

---


# Federated Audience Data を使用したジャーニーの作成

このレッスンでは、Adobe Journey Optimizer（AJO）内のジャーニーでフェデレーション オーディエンスを使用する方法を学びます。 これには、Federated Audience Composition からクエリされた属性を使用してメッセージをパーソナライズすることが含まれます。 SecurFinancial の顧客ストーリーを続け、顧客のリターゲティングとパーソナライゼーションのユースケースに取り組むために、事前に選定された顧客のジャーニーを調整します。 目標は、SecurFinancial のData Warehouseから統合された属性に基づいて、パーソナライズされた電子メールを送信することです。

## 手順

### オーディエンスを読み取りジャーニーを作成

1. **ジャーニー** ポータルに移動し、「**ジャーニーを作成**」ボタンをクリックします。

   ![ ジャーニーの作成 ](assets/create-journey.png)

2. 新しい名前でジャーニープロパティを更新します：**`SecurFinancial - Home Loan Offer`**。

3. **オーケストレーション** をクリックし、**オーディエンスを読み取り** タイルをキャンバスにドラッグ&amp;ドロップします。

4. 画面の右側にあるオーディエンスボックスの横にある **鉛筆アイコン** をクリックします。

5. 検索バーで **`SecureFinancial Customers - No Loans, Good Credit`** を検索し、「**保存**」をクリックします。

   ![ ジャーニーの作成 ](assets/select-audience.png)

6. 右側のメニューで、すべての設定をデフォルトのままにして、「**保存**」をクリックします。

   ![save-audience-settings](assets/save-audience-settings.png)

### メールをパーソナライズ

1. **アクション** をクリックし、「**メール**」タイルをクリックしてキャンバスにドラッグします。

2. 右側のメニューで「**メール設定**」をクリックし、「**メールマーケティング**」を選択します。 次に、「**コンテンツを編集** をクリックします。

3. 件名に、**`Learn more about SecurFinancial Home Loan`** を追加します。 次に、「**メール本文を編集**」をクリックします。

4. 右上隅の **コンテンツテンプレート** ボタンをクリックします。 `SecureFinancial Template` を検索して選択し、「**確認**」をクリックします。

   ![journey-email-config](assets/journey-email-config.png)

   ![journey-email-confirm](assets/journey-email-confirm.png)

5. テンプレートを確認し、「**テンプレートを使用**」をクリックします。

6. メールDesignerに移動します。 `{profile.person.name.firstName}` マクロの上にマウスポインターを置いて、「**パーソナライゼーションアバター**」をクリックします。

7. パーソナライゼーションウィンドウで、次のフォルダーパスにドリルダウンします。**`[sandbox] > audienceEnrichment > CustomerAudienceUpload`**

8. **オーディエンスを読み取り** フォルダーをクリックします。 フェデレーションされたオーディエンスのエンリッチメント属性は、こちらで確認できます。

9. 式ビルダーに **名** 属性を選択します。 メールは、顧客の名の値を動的に表して、メールをパーソナライズします。

10. 「**保存**」をクリックします。

11. 名のパーソナライゼーションが追加されたので、パーソナライゼーション変数の前に `Hi, ` を追加します。 次に、「**保存**」をクリックします。

    ![journey-email-save](assets/journey-email-save.png)

12. 「**戻る** ボタンを 2 回クリックして、ジャーニーキャンバスに戻ります。 次に、右側の **アクション：メール** メニューで、「**保存**」をクリックします。

   ![save-final-journey](assets/save-final-journey.png)

おめでとうございます。federated audience 属性と federated enrichment 属性を使用して、AJOでジャーニーを作成しました。

次に、Data Warehouse のフェデレーティッドデータを使用して、Experience Platformで [ 既存のオーディエンスを強化 ](audience-enrichment-demo.md) する方法を見ていきます。
