---
title: はじめに – Postmanの設定
description: はじめに – Postmanの設定
kt: 5342
doc-type: tutorial
exl-id: fc1ee238-cce8-40a9-aba7-3605019a0077
source-git-commit: 07c890d1f3e5dbcec5b3a81badb9a7147eed72db
workflow-type: tm+mt
source-wordcount: '430'
ht-degree: 3%

---

# オプション 2:PostBuster セットアップ

>[!IMPORTANT]
>
>Adobeの従業員でない場合は、手順に従って [Postmanをインストール ](./ex7.md) してください。 以下の手順は、Adobeのユーザーのみを対象としています。

## PostBuster のインストール

[https://adobe.service-now.com/esc?id=adb_esc_kb_article&amp;sysparm_article=KB0020542](https://adobe.service-now.com/esc?id=adb_esc_kb_article&amp;sysparm_article=KB0020542) に移動します。

**PostBuster** の最新リリースをダウンロードします。

![ ポストバスター ](./images/pb1.png)

お使いの OS に適したバージョンをダウンロードします。

![ ポストバスター ](./images/pb2.png)

ダウンロードが完了し、インストールしたら、PostBuster を開きます。 この画像が表示されます。 **インポート** をクリックします。

![ ポストバスター ](./images/pb3.png)

[postbuster.json.zip](./../../../assets/postman/postbuster.json.zip) をダウンロードし、デスクトップに抽出します。

![ ポストバスター ](./images/pbpb.png)

**ファイルを選択** をクリックします。

![ ポストバスター ](./images/pb4.png)

ファイル **postbuster.json** を選択します。 「**開く**」をクリックします。

![ ポストバスター ](./images/pb5.png)

この画像が表示されます。 **スキャン** をクリックします。

![ ポストバスター ](./images/pb6.png)

**インポート** をクリックします。

![ ポストバスター ](./images/pb7.png)

この画像が表示されます。 クリックして、読み込んだコレクションを開きます。

![ ポストバスター ](./images/pb8.png)

これで、コレクションが表示されます。 環境変数を保持するには、引き続き環境を設定する必要があります。

![ ポストバスター ](./images/pb9.png)

**ベース環境** をクリックしてから、**編集** アイコンをクリックします。

![ ポストバスター ](./images/pb10.png)

この画像が表示されます。

![ ポストバスター ](./images/pb11.png)

以下の環境プレースホルダーをコピーして、**ベース環境** に貼り付けます。

```json
{
	"CLIENT_SECRET": "",
	"API_KEY": "",
	"ACCESS_TOKEN": "",
	"SCOPES": [
		"openid",
		"AdobeID",
		"read_organizations", 
		"additional_info.projectedProductContext", 
		"session",
		"ff_apis",
		"firefly_api"
	],
	"TECHNICAL_ACCOUNT_ID": "",
	"IMS": "ims-na1.adobelogin.com",
	"IMS_ORG": "",
	"access_token": "",
	"IMS_TOKEN": "",
	"AZURE_STORAGE_URL": "",
	"AZURE_STORAGE_CONTAINER": "",
	"AZURE_STORAGE_SAS_READ": "",
	"AZURE_STORAGE_SAS_WRITE": ""
}
```

これで完了です。

![ ポストバスター ](./images/pb12.png)

## Adobe I/O変数を入力

[https://developer.adobe.com/console/home](https://developer.adobe.com/console/home){target="_blank"} に移動し、プロジェクトを開きます。

![Adobe I/O新規統合 ](./images/iopr.png){zoomable="yes"}

**OAuth サーバー間** に移動します。

![Adobe I/O新規統合 ](./images/iopbvar1.png){zoomable="yes"}

次に、Adobe I/O プロジェクトから次の値をコピーして、PostBuster のベース環境に貼り付ける必要があります。

- クライアント ID
- クライアント秘密鍵（「**クライアント秘密鍵を取得**」をクリック）
- テクニカルアカウント ID
- 組織 ID （下にスクロールして組織 ID を探します）

![Adobe I/O新規統合 ](./images/iopbvar2.png){zoomable="yes"}

上記の変数を 1 つずつコピーして、PostBuster の **ベース環境** に貼り付けます。

| Adobe I/Oの変数名 | PostBuster ベース環境の変数名 |
|:-------------:| :---------------:| 
| クライアント ID | `API_KEY` |
| クライアント秘密鍵 | `CLIENT_SECRET` |
| テクニカルアカウント ID | `TECHNICAL_ACCOUNT_ID` |
| 組織 ID | `IMS_ORG` |

これらの変数をに 1 つずつコピーすると、PostBuster ベース環境は次のようになります。

![Adobe I/O新規統合 ](./images/iopbvar3.png){zoomable="yes"}

**Adobe I/O - OAuth** コレクションで、「**POST - アクセストークンを取得**」という名前のリクエストを選択し、「**送信**」を選択します。

次の情報を含む同様の応答が表示されます。

| キー | 値 |
|:-------------:| :---------------:| 
| token_type | **ベアラー** |
| access_token | **eyJhbGciOiJS...** |
| expires_in | **86399** |

Adobe I/O **bearer-token** には、特定の値（非常に長い access_token）と有効期限があり、24 時間有効になりました。 つまり、24 時間後にPostmanを使用してAdobe API とやり取りする場合は、このリクエストを再度実行して新しいトークンを生成する必要があります。

![Adobe I/O新規統合 ](./images/iopbvar4.png){zoomable="yes"}

これで、PostBuster 環境がセットアップされ、機能するようになりました。 これで、はじめる前にモジュールを完了しました。

## 次の手順

[ インストールするアプリケーション ](./ex9.md){target="_blank"} に移動します

[ はじめに ](./getting-started.md){target="_blank"} に戻る

[ すべてのモジュール ](./../../../overview.md){target="_blank"} に戻る
