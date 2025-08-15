---
title: フェデレーションされたオーディエンスの作成
seo-title: Create a federated audience | Engage with Audiences from your Data Warehouse using Federated Audience Composition
breadcrumb-title: フェデレーションされたオーディエンスの作成
description: この演習では、Adobe Experience Platformと Enterprise Data Warehouseの間の接続を設定して、Federated Audience Composition を有効にします。
role: Data Architect, Data Engineer
jira: KT-18743
thumbnail: 18743-create-an-audience.jpg
exl-id: a507cab5-dba9-4bf7-a043-d7c967e9e07d
source-git-commit: dd5f594a54a9cab8ef78d36d2cf15a9b5f2b682a
workflow-type: tm+mt
source-wordcount: '343'
ht-degree: 1%

---

# Federated Audience の作成

次に、Federated Audience Composition を使用してData Warehouseからオーディエンスを作成する手順について説明します。 オーディエンスは、信用スコアが 650 以上で、現在 SecurFinancial ポートフォリオにローンを持っていない SecurFinancial のお客様で構成されています。

## 手順

1. **顧客/オーディエンス** ポータルで、「**Federated コンポジション**」タブをクリックします。
2. **コンポジションを作成** をクリックします。

   ![create-composition](assets/create-composition.png)

3. コンポジションにラベルを付けます。 この例では `SecurFinancial Customers - No Loans, Good Credit` です。 「**作成**」をクリックします。

4. キャンバスで「**+**」ボタンをクリックし、「**オーディエンスを作成**」を選択します。 右側のパネルが表示されます。

5. 「**スキーマを選択**」をクリックし、適切なスキーマを選択して「**確認**」をクリックします。

6. 「**続行**」をクリックします。Query Builder ウィンドウで、「**+**」ボタン、「**カスタム条件** の順にクリックします。 条件を記述します。 この例では、次を使用します。

   `CURRENTPRODUCTS does not contain loan`
   `AND`
   `CREDITSCORE greater than or equal to 650`
   `AND`
   `CONSENTSMARKETINGPREFERRED equal to email`

   *最後の条件により、マーケティング環境設定データを使用して、希望するコミュニケーションチャネルとしてメールを選択した顧客をセグメント化できます*。

   **メモ：** 値フィールドでは大文字と小文字が区別されます。

   ![query-builder](assets/query-builder.png)

7. 次の **+** ボタンをクリックし、「**オーディエンスを保存**」をクリックします。 この手順にラベルを付けます。 この例では、`SecurFinancial Customers - No Loans, Good Credit` のようにラベルを付けます。

8. 関連するオーディエンスマッピングを追加します。 この例では、次のようになります。

   - **Source オーディエンスフィールド：** メール
   - **Source オーディエンスフィールド：** CURRENTPRODUCTS
   - **Source オーディエンスフィールド：** 名

9. プロファイルに使用するプライマリ ID と名前空間を選択します。 これらは、データに使用される ID とフィールドです。

   - **プライマリ ID フィールド：** メール
   - **ID 名前空間：** メール

10. 「**保存**」をクリックしてから「**開始**」をクリックして、コンポジションのクエリを実行します。

>[**概要**]
>
> この例では、商品とクレジット情報を使用して、Adobe Experience Platformからコピーを作成せずにSnowflakeのエンタープライズデータに直接アクセスしてオーディエンスを作成しました。 外部システムがクエリを処理すると、関連するメール、現在の製品、名の値のみがダウンストリームのアクティベーション用にオーディエンス定義に引き継がれます。 これは、RTCDPがサポートするすべての宛先に適用されます。

オーディエンス構成について詳しくは、[Experience League](https://experienceleague.adobe.com/ja/docs/federated-audience-composition/using/compositions/create-composition/create-composition){target="_blank"} を参照してください。

federated audience が作成されたので、[S3 アカウントにマッピング ](map-federated-audience-to-s3.md) します。
