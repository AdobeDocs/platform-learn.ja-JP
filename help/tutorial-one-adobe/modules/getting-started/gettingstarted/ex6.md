---
title: はじめに – Adobe I/O
description: はじめに – Adobe I/O
kt: 5342
doc-type: tutorial
exl-id: 00f17d4f-a2c8-4e8e-a1ff-556037a60629
source-git-commit: cc8efbdbcf90607f5a9bc98a2e787b61b4cd66d9
workflow-type: tm+mt
source-wordcount: '435'
ht-degree: 4%

---

# Adobe I/O プロジェクトの設定

## Adobe I/O プロジェクトの作成

この演習では、Adobe I/Oを使用して、様々なAdobe エンドポイントに対してクエリを実行します。 Adobe I/Oを設定するには、次の手順に従います。

[https://developer.adobe.com/console/home](https://developer.adobe.com/console/home){target="_blank"} に移動します。

![Adobe I/O新規統合 ](./images/iohome.png){zoomable="yes"}

画面の右上隅で正しいインスタンスを選択してください。 インスタンスは `--aepImsOrgName--` です。

>[!NOTE]
>
> 次のスクリーンショットは、特定の組織が選択されていることを示しています。 このチュートリアルを進めていくと、組織の名前が異なる可能性が非常に高くなります。 このチュートリアルに登録したときに、使用する環境の詳細が提供されました。これらの手順に従ってください。

次に、「**新規プロジェクトを作成**」を選択します。

![Adobe I/O新規統合 ](./images/iocomp.png){zoomable="yes"}

### FIREFLY SERVICES API

この画像が表示されます。 「**+ プロジェクトに追加**」、「**API**」の順に選択します。

![Adobe I/O新規統合 ](./images/adobe_io_access_api.png){zoomable="yes"}

画面は次のようになります。

![Adobe I/O新規統合 ](./images/api1.png){zoomable="yes"}

「**Creative Cloud**」、「**Firefly - Firefly Services**」の順に選択して、「**次へ**」を選択します。

![Adobe I/O新規統合 ](./images/api3.png){zoomable="yes"}

秘密鍵証明書の名前を指定し `--aepUserLdap-- - One Adobe OAuth credential`**「次へ」** を選択します。

![Adobe I/O新規統合 ](./images/api4.png){zoomable="yes"}

デフォルトプロファイル **デフォルトのFirefly Services設定** を選択し、「**設定済み API を保存**」を選択します。

![Adobe I/O新規統合 ](./images/api9.png){zoomable="yes"}

この画像が表示されます。

![Adobe I/O新規統合 ](./images/api10.png){zoomable="yes"}

### PHOTOSHOP SERVICES API

「**+ プロジェクトに追加」を選択し** 「**API**」を選択します。

![Azure ストレージ ](./images/ps2.png){zoomable="yes"}

**Creative Cloud** を選択してから、**Photoshop - Firefly Services** を選択してください。 「**次へ**」を選択します。

![Azure ストレージ ](./images/ps3.png){zoomable="yes"}

「**次へ**」を選択します。

![Azure ストレージ ](./images/ps4.png){zoomable="yes"}

次に、この統合で使用できる権限を定義する製品プロファイルを選択する必要があります。

**デフォルトのFirefly Services設定** および **デフォルトのCreative Cloud Automation Services 設定** を選択します。

**設定済み API を保存** を選択します。

![Azure ストレージ ](./images/ps5.png){zoomable="yes"}

この画像が表示されます。

![Adobe I/O新規統合 ](./images/ps7.png){zoomable="yes"}

### ADOBE EXPERIENCE PLATFORM API

「**+ プロジェクトに追加」を選択し** 「**API**」を選択します。

![Azure ストレージ ](./images/aep1.png){zoomable="yes"}

**Adobe Experience Platform を選択し**&#x200B;**Experience Platform API** を選択します。 「**次へ**」を選択します。

![Azure ストレージ ](./images/aep2.png){zoomable="yes"}

「**次へ**」を選択します。

![Azure ストレージ ](./images/aep3.png){zoomable="yes"}

次に、この統合で使用できる権限を定義する製品プロファイルを選択する必要があります。

「**Adobe Experience Platform – すべてのユーザー – PROD**」を選択します。

**設定済み API を保存** を選択します。

![Azure ストレージ ](./images/aep4.png){zoomable="yes"}

この画像が表示されます。

![Adobe I/O新規統合 ](./images/aep5.png){zoomable="yes"}

### プロジェクト名

プロジェクト名をクリックします。

![Adobe I/O新規統合 ](./images/api13.png){zoomable="yes"}

**プロジェクトを編集** を選択します。

![Adobe I/O新規統合 ](./images/api14.png){zoomable="yes"}

統合のわかりやすい名前 `--aepUserLdap-- One Adobe tutorial` を入力し、「**保存**」を選択します。

![Adobe I/O新規統合 ](./images/api15.png){zoomable="yes"}

これで、Adobe I/O プロジェクトの設定が完了しました。

![Adobe I/O新規統合 ](./images/api16.png){zoomable="yes"}

## 次の手順

[ オプション 1:Postman設定 ](./ex7.md){target="_blank"} に移動します。

[ オプション 2:PostBuster 設定 ](./ex8.md){target="_blank"} に移動します。

[ はじめに ](./getting-started.md){target="_blank"} に戻る

[ すべてのモジュール ](./../../../overview.md){target="_blank"} に戻る
