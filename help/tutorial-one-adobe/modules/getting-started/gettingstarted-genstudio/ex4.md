---
title: はじめに – Postmanの設定
description: はじめに – Postmanの設定
kt: 5342
doc-type: tutorial
source-git-commit: 2a552768bb4d0fcc46cb91e0e4afae247b946b16
workflow-type: tm+mt
source-wordcount: '486'
ht-degree: 4%

---

# オプション 2: PostBusterの設定

>[!IMPORTANT]
>
>Adobeの社員でない場合は、[Postmanのインストール ](./ex3.md){target="_blank"}の手順に従ってください。 以下の手順は、Adobeの従業員のみを対象としています。

## ビデオ

このビデオでは、この演習に関連するすべての手順の説明とデモを行います。

>[!VIDEO](https://video.tv.adobe.com/v/3476496?quality=12&learn=on)

## PostBusterのインストール

[https://adobe.service-now.com/esc?id=adb_esc_kb_article&amp;sysparm_article=KB0020542](https://adobe.service-now.com/esc?id=adb_esc_kb_article&sysparm_article=KB0020542){target="_blank"}に移動します。

クリックして、**PostBuster**&#x200B;の最新リリースをダウンロードします。

![PostBuster](./images/pb1.png)

OSの正しいバージョンをクリックします。

![PostBuster](./images/pb2.png)

ファイルをダウンロードします。

![PostBuster](./images/pb2a.png)

ダウンロードが完了し、インストールが完了したら、PostBusterを開きます。 そうすると、これが表示されます。 「**インポート**」をクリックします。

![PostBuster](./images/pb3.png)

[postbuster.json.zip](./../../../assets/postman/postbuster.json.zip){target="_blank"}をダウンロードし、デスクトップに展開します。

![PostBuster](./images/pbpb.png)

「**ファイルを選択**」をクリックします。

![PostBuster](./images/pb4.png)

ファイル **postbuster.json**&#x200B;を選択します。 「**開く**」をクリックします。

![PostBuster](./images/pb5.png)

そうすると、これが表示されます。 「**スキャン**」をクリックします。

![PostBuster](./images/pb6.png)

「**インポート**」をクリックします。

![PostBuster](./images/pb7.png)

そうすると、これが表示されます。 クリックして、読み込んだコレクションを開きます。

![PostBuster](./images/pb8.png)

あなたのコレクションが見えてきます。 一部の環境変数を保持するように環境を設定する必要があります。

![PostBuster](./images/pb9.png)

**Base Environment**&#x200B;をクリックし、**edit** アイコンをクリックします。

![PostBuster](./images/pb10.png)

そうすると、これが表示されます。

![PostBuster](./images/pb11.png)

次の環境プレースホルダーをコピーし、その場所にあるものを置き換えて&#x200B;**Base Environment**&#x200B;に貼り付けます。

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
        "firefly_api",
        "frame.s2s.all"
    ],
    "TECHNICAL_ACCOUNT_ID": "",
    "IMS": "ims-na1.adobelogin.com",
    "IMS_ORG": "",
    "access_token": "",
    "IMS_TOKEN": "",
    "AZURE_STORAGE_URL": "",
    "AZURE_STORAGE_CONTAINER": "",
    "AZURE_STORAGE_SAS_READ": "",
    "AZURE_STORAGE_SAS_WRITE": "",
    "FRAME_IO_BASE_URL": "https://api.frame.io",
    "FRAME_IO_ACCOUNT_ID": "",
    "FRAME_IO_WORKSPACE_ID": ""
}
```

では、これを使ってください。

![PostBuster](./images/pb12.png)

## Adobe I/Oの変数を入力すると

[https://developer.adobe.com/console/home](https://developer.adobe.com/console/home){target="_blank"}に移動し、プロジェクトを開きます。

![Adobe I/Oの新しい統合](./images/iopr.png)

**OAuth サーバー間**&#x200B;に移動します。

![Adobe I/Oの新しい統合](./images/iopbvar1.png)

次の値をAdobe I/O プロジェクトからコピーし、PostBuster Base Environmentに貼り付ける必要があります。

- クライアント ID
- クライアントシークレット （**クライアントシークレットの取得**&#x200B;をクリック）
- テクニカルアカウント ID
- 組織ID （下にスクロールして組織IDを検索します）

![Adobe I/Oの新しい統合](./images/iopbvar2.png)

上記の変数を1つずつコピーし、PostBusterの&#x200B;**Base Environment**&#x200B;に貼り付けます。

| Adobe I/Oの変数名 | PostBuster ベース環境の変数名 |
|:-------------:| :---------------:|
| クライアント ID | `API_KEY` |
| クライアント秘密鍵 | `CLIENT_SECRET` |
| テクニカルアカウント ID | `TECHNICAL_ACCOUNT_ID` |
| 組織 ID | `IMS_ORG` |

これらの変数を1つずつコピーした後、PostBuster ベース環境は次のようになります。

「**閉じる**」をクリックします。

![Adobe I/Oの新しい統合](./images/iopbvar3.png)

**Adobe IO - OAuth** コレクションで、**POST - Get Access Token**&#x200B;という名前のリクエストを選択し、**Send**&#x200B;を選択します。

![Adobe I/Oの新しい統合](./images/iopbvar3a.png)

次の情報を含む同様の応答が表示されます。

| キー | 値 |
|:-------------:| :---------------:|
| token_type | **ベアラー** |
| access_token | **eyJhbGciOiJS...** |
| expires_in | **86399** |

Adobe I/O **bearer-token**&#x200B;には、特定の値（非常に長いaccess_token）と有効期限が設定されており、24時間有効になっています。 つまり、24時間後にPostmanを使用してAdobe APIを操作する場合は、このリクエストを再度実行して新しいトークンを生成する必要があります。

![Adobe I/Oの新しい統合](./images/iopbvar4.png)

これで、PostBuster環境が設定され、動作するようになりました。 これで、この演習は完了しました。

## 次の手順

[ インストールするアプリケーション ](./ex5.md){target="_blank"}に移動

[はじめに – GenStudio](./getting-started-genstudio.md){target="_blank"}に戻ります

[すべてのモジュール ](./../../../overview.md){target="_blank"}に戻る
