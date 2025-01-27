---
title: PostBuster - Adobe社員
description: PostBuster - Adobe社員
doc-type: multipage-overview
exl-id: 01e30878-e1a9-4f46-bcf2-0074686ec1b5
source-git-commit: 54303033e23a28c45e9ef6c7a85135b21b3e29dc
workflow-type: tm+mt
source-wordcount: '216'
ht-degree: 0%

---

# PostBuster

>[!IMPORTANT]
>
>以下の手順は、Adobeの従業員のみを対象としています。

## PostBuster のインストール

[https://adobe.service-now.com/esc?id=adb_esc_kb_article&amp;sysparm_article=KB0020542](https://adobe.service-now.com/esc?id=adb_esc_kb_article&amp;sysparm_article=KB0020542) に移動します。

**PostBuster** の最新リリースをダウンロードします。

![ ポストバスター ](./assets/images/pb1.png)

お使いの OS に適したバージョンをダウンロードします。

![ ポストバスター ](./assets/images/pb2.png)

ダウンロードが完了し、インストールしたら、PostBuster を開きます。 この画像が表示されます。 **インポート** をクリックします。

![ ポストバスター ](./assets/images/pb3.png)

[postbuster.json.zip](./assets/postman/postbuster.json.zip) をダウンロードし、デスクトップに抽出します。

![ ポストバスター ](./assets/images/pbpb.png)

**ファイルを選択** をクリックします。

![ ポストバスター ](./assets/images/pb4.png)

ファイル **postbuster.json** を選択します。 「**開く**」をクリックします。

![ ポストバスター ](./assets/images/pb5.png)

この画像が表示されます。 **スキャン** をクリックします。

![ ポストバスター ](./assets/images/pb6.png)

**インポート** をクリックします。

![ ポストバスター ](./assets/images/pb7.png)

この画像が表示されます。 クリックして、読み込んだコレクションを開きます。

![ ポストバスター ](./assets/images/pb8.png)

これで、コレクションが表示されます。 環境変数を保持するには、引き続き環境を設定する必要があります。

![ ポストバスター ](./assets/images/pb9.png)

**ベース環境** をクリックしてから、**編集** アイコンをクリックします。

![ ポストバスター ](./assets/images/pb10.png)

この画像が表示されます。

![ ポストバスター ](./assets/images/pb11.png)

以下の環境プレースホルダーをコピーして、**ベース環境** に貼り付けます。

```json
{
	"CLIENT_SECRET": "",
	"API_KEY": "",
	"ACCESS_TOKEN": "",
	"SCOPES": [
		"openid",
		"AdobeID",
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

![ ポストバスター ](./assets/images/pb12.png)

**Fireflyサービス** モジュールを実行すると、環境は次のようになります。 これは後で対処されるため、今すぐ行う必要はありません。

![ ポストバスター ](./assets/images/pb13.png)

>[!NOTE]
>
>![ 技術インサイダー ](./assets/images/techinsiders.png){width="50px" align="left"}
>
>ご不明な点がある場合は、have suggestions on future content の一般的なフィードバックをお知らせください。**techinsiders@adobe.com** に電子メールを送信して、技術インサイダーに直接問い合わせてください。

[すべてのモジュールに戻る](./overview.md)
