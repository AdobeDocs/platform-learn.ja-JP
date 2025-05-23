---
title: Offer Decisioning - API を使用した決定のテスト
description: API を使用した決定のテスト
kt: 5342
doc-type: tutorial
exl-id: 52f90b9f-32ea-49c2-af5d-8742ca8b3b4e
source-git-commit: 3d61d91111d8693ab031fbd7b26706c02818108c
workflow-type: tm+mt
source-wordcount: '399'
ht-degree: 0%

---

# 3.3.6 API を使用して決定をテストする

## 3.3.6.1 Postmanを使用してOffer Decisioning API を操作する

>[!IMPORTANT]
>
>Adobeの従業員の場合は、こちらの手順に従って [PostBuster](./../../../../modules/getting-started/gettingstarted/ex8.md) を使用してください。

[ このOffer Decisioning用Postman コレクション ](./../../../../assets/postman/postman_offer-decisioning.zip) をデスクトップにダウンロードして解凍します。 すると、次のようになります。

![OD API](./images/unzip.png)

これで、デスクトップ上に次のファイルが作成されました。

- `_AJO- Decisioning Service.postman_collection.json`

[ 演習 2.1.3 - Adobe I/Oに対するPostman認証 ](./../../../../modules/delivery-activation/rtcdp-b2c/rtcdpb2c-1/ex3.md) では、Postmanをインストールしました。 この演習では、Postmanを再度使用する必要があります。

Postmanを開き、ファイル `_AJO- Decisioning Service.postman_collection.json` を読み込みます。 このコレクションをPostmanで使用できるようになります。

![Adobe I/O新規統合 ](./images/postmanui.png)

これで、API を使用してPostmanとの対話を開始するためにAdobe Experience Platformで必要なすべてが揃いました。

以下の API を使用する前に、演習 2.1.3 で設定したコレクション **Adobe IO - OAuth** を使用して再認証してください。

![Adobe I/O新規統合 ](./images/postmanui1.png)


### 3.3.6.2 顧客プロファイルのオファーの取得

クリックしてリクエスト **POST – 顧客プロファイルのオファーを取得** を開きます。 最初に更新するのは、**x-sandbox-name** の **Header** 変数です。 `--aepSandboxName--` に設定してください。

![OD API](./images/api23.png)

このリクエストでは、多数のフィールドを更新する必要があります。 **本文** に移動します。

- **xdm:placementId**
- **xdm:activityId**
- **xdm:id**
- **xdm:itemCount** （choice の値に変更します）

![OD API](./images/api24.png)

フィールド **xdm:activityId** に入力する必要があります。 これは、以下に示すように、Adobe Experience Platform UI で取得できます。

![OD API](./images/activityid.png)

フィールド **[!UICONTROL xdm:placementId]** に入力する必要があります。 これは、以下に示すように、Adobe Experience Platform UI で取得できます。 次の例では、プレースメントの placementId を確認できます **[!UICONTROL Web – 画像]**。

![OD API](./images/placementid.png)

**xdm:id** フィールドに、オファーをリクエストする顧客プロファイルのメールアドレスを入力します。 すべての値を必要に応じて設定したら、「**[!UICONTROL 送信]**」をクリックします。

![OD API](./images/api24a.png)

最後に、パーソナライズされたオファーの種類と、この顧客に表示する必要のあるアセットの結果を確認します。 この例では、2 つの項目がリクエストされ、ご覧のように、2 つのパーソナライズされたオファーが返されました。 Galaxy Watch のオファー 1 件と、Apple Watch 7 のオファー 1 件。

![OD API](./images/api25.png)

これで、この演習が完了しました。

## 次の手順

[ 概要とメリット ](./summary.md){target="_blank"} に移動します。

[Offer Decisioning](offer-decisioning.md){target="_blank"} に戻る

[ すべてのモジュール ](./../../../../overview.md){target="_blank"} に戻る
