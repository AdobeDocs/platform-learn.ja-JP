---
title: Photoshop API の操作
description: Photoshop API とFirefly サービスの使用方法を学ぶ
role: Developer
level: Beginner
jira: KT-5342
doc-type: Tutorial
exl-id: 60eecc24-1713-4fec-9ffa-a3186db1a8ca
source-git-commit: d33df99e9c75e7d5feef503b68174b93860ac245
workflow-type: tm+mt
source-wordcount: '952'
ht-degree: 0%

---

# 1.1.3 Photoshop API の操作

Photoshop API とFirefly サービスの使用方法について説明します。

## 1.1.3.1 Adobe I/O統合の更新

1. [https://developer.adobe.com/console/home](https://developer.adobe.com/console/home){target="_blank"} に移動します。

![Adobe I/O新規統合 ](./images/iohome.png){zoomable="yes"}

1. **プロジェクト** に移動し、前の演習で作成したプロジェクト（`--aepUserLdap-- Firefly`）を選択します。

![Azure ストレージ ](./images/ps1.png){zoomable="yes"}

1. 「**+ プロジェクトに追加」を選択し** 「**API**」を選択します。

![Azure ストレージ ](./images/ps2.png){zoomable="yes"}

1. **Creative Cloud** を選択してから、**Photoshop - Firefly サービス** を選択してください。 「**次へ**」を選択します。

![Azure ストレージ ](./images/ps3.png){zoomable="yes"}

1. 「**次へ**」を選択します。

![Azure ストレージ ](./images/ps4.png){zoomable="yes"}

次に、この統合で使用できる権限を定義する製品プロファイルを選択する必要があります。

1. **デフォルトのFirefly サービス設定** および **デフォルトのCreative Cloud Automation Services 設定** を選択します。

1. **設定済み API を保存** を選択します。

![Azure ストレージ ](./images/ps5.png){zoomable="yes"}

これで、Adobe I/O プロジェクトが、Photoshop API とFirefly サービス API で動作するように更新されました。

![Azure ストレージ ](./images/ps6.png){zoomable="yes"}

## 1.1.3.2 PSD ファイルをプログラムで操作する

>[!IMPORTANT]
>
>Adobeの従業員の場合は、こちらの手順に従って [PostBuster](./../../../postbuster.md) を使用してください。

1. [citisignal-fiber.psd](./../../../assets/ff/citisignal-fiber.psd){target="_blank"} をデスクトップにダウンロードします。

1. Photoshopで **citisignal-fiber.psd** を開きます。

![Azure ストレージ ](./images/ps7.png){zoomable="yes"}

**レイヤー** パネルでは、ファイルのデザイナーが各レイヤーに一意の名前を付けました。 PhotoshopでPSD ファイルを開くと、レイヤー情報を表示できますが、プログラムで開くこともできます。

最初の API リクエストをPhotoshop API に送信しましょう。

1. Postmanでは、API リクエストをPhotoshopに送信する前に、Adobe I/Oへの認証が必要です。前のリクエストを「**POST - アクセストークンの取得**」という名前で開きます。

1. **Params** に移動し、パラメーター **Scope** が正しく設定されていることを確認します。 **範囲** の **値** は次のようになります。

`openid,session,AdobeID,read_organizations,additional_info.projectedProductContext, ff_apis, firefly_api`

1. **送信** を選択します。

![Azure ストレージ ](./images/ps8.png){zoomable="yes"}

これで、Photoshop API とやり取りするための有効なアクセストークンが作成されました。

![Azure ストレージ ](./images/ps9.png){zoomable="yes"}

### Photoshop API - Hello World

次に、Photoshop API のみなさん、すべての権限とアクセス権が正しく設定されているかどうかをテストしましょう。

1. コレクション **Photoshop** で、リクエスト **Photoshop Hello （テスト認証）を開きます。**。**送信** を選択します。

![Azure ストレージ ](./images/ps10.png){zoomable="yes"}

「Photoshop API へようこそ **という応答が返され** す。

![Azure ストレージ ](./images/ps11.png){zoomable="yes"}

次に、PSD ファイル **citisignal-fiber.psd** をプログラムで操作するには、それをストレージアカウントにアップロードする必要があります。 Azure ストレージエクスプローラーを使用してコンテナに手動でドラッグ&amp;ドロップできますが、今回は API を通じて行う必要があります。

### PSDの Azure へのアップロード

1. Postmanで、**PSDを Azure ストレージアカウントにアップロード** リクエストを開きます。 前の演習では、Postmanでこれらの環境変数を設定しました。ここでは、これを使用します。

- `AZURE_STORAGE_URL`
- `AZURE_STORAGE_CONTAINER`
- `AZURE_STORAGE_SAS_READ`
- `AZURE_STORAGE_SAS_WRITE`

**PSDを Azure ストレージアカウントにアップロード** リクエストに示すように、URL はこれらの変数を使用するように設定されています。

![Azure ストレージ ](./images/ps12.png){zoomable="yes"}

1. **Body** で、ファイル **citisignal-fiber.psd** を選択します。

![Azure ストレージ ](./images/ps13.png){zoomable="yes"}

1. 画面は次のようになります。 **送信** を選択します。

![Azure ストレージ ](./images/ps14.png){zoomable="yes"}

この空の応答を Azure から返す必要があります。つまり、ファイルは Azure ストレージアカウントのコンテナに保存されます。

![Azure ストレージ ](./images/ps15.png){zoomable="yes"}

Azure ストレージエクスプローラーを使用してファイルを表示する場合は、必ずフォルダーを更新してください。

![Azure ストレージ ](./images/ps16.png){zoomable="yes"}

### Photoshop API - マニフェストを取得する

次に、PSD ファイルのマニフェストファイルを取得する必要があります。

1. Postmanで、リクエスト **Photoshop - PSD マニフェストの取得** を開きます。 **本文** に移動します。

本文は次のようになります。

```json
{
  "inputs": [
    {
      "storage": "external",
      "href": "{{AZURE_STORAGE_URL}}/{{AZURE_STORAGE_CONTAINER}}/citisignal-fiber.psd{{AZURE_STORAGE_SAS_READ}}"
    }
  ],
  "options": {
    "thumbnails": {
      "type": "image/jpeg"
    }
  }
}
```

1. **送信** を選択します。

応答に、リンクが表示されます。 Photoshopの操作は完了までに時間がかかる場合があるので、Photoshopでは、ほとんどの受信リクエストに対する応答としてステータスファイルを提供します。 リクエストに何が起こっているかを理解するには、ステータスファイルを読む必要があります。

![Azure ストレージ ](./images/ps17.png){zoomable="yes"}

1. ステータスファイルを読み取るには、リクエスト **Photoshop - PS ステータスの取得** を開きます。 このリクエストが URL として変数を使用していることを確認できます。この変数は、送信した前のリクエスト（**Photoshop - PSD マニフェストの取得** によって設定された変数です。 変数は、各リクエストの **スクリプト** で設定されます。 **送信** を選択します。

![Azure ストレージ ](./images/ps18.png){zoomable="yes"}

画面は次のようになります。 現在、ステータスは **保留中** に設定されています。これは、プロセスがまだ完了していないことを意味します。

![Azure ストレージ ](./images/ps19.png){zoomable="yes"}

1. ステータスが **成功** に変わるまで、「**Photoshop - PS ステータスの取得**」でさらに複数回送信を選択します。 これには数分かかることがあります。

応答が使用可能な場合、PSD ファイルのすべてのレイヤーの情報を含んだ json ファイルが表示されます。 レイヤー名やレイヤー ID などを識別できるため、これは役に立つ情報です。

![Azure ストレージ ](./images/ps20.png){zoomable="yes"}

例えば、`2048x2048-cta` というテキストを検索します。 画面は次のようになります。

![Azure ストレージ ](./images/ps21.png){zoomable="yes"}

### Photoshop API - テキストを変更

次に、API を使用してコールトゥアクションのテキストを変更する必要があります。

1. Postmanで、リクエスト **Photoshop - Change Text を開き****Body** に移動します。

画面は次のようになります。

- まず、入力ファイルを指定します。`citisignal-fiber.psd`
- 次に、変更するレイヤーを指定し、テキストを変更します。
- 3 番目に、出力ファイルを指定します。`citisignal-fiber-changed-text.psd`

```json
{
  "inputs": [
    {
      "storage": "external",
      "href": "{{AZURE_STORAGE_URL}}/{{AZURE_STORAGE_CONTAINER}}/citisignal-fiber.psd{{AZURE_STORAGE_SAS_READ}}"
    }
  ],
  "options": {
    "layers": [
      {
        "name": "2048x2048-cta",
        "text": {
          "content": "Get Fiber now!"
        }
      }
    ]
  },
  "outputs": [
    {
      "storage": "azure",
      "href": "{{AZURE_STORAGE_URL}}/{{AZURE_STORAGE_CONTAINER}}/citisignal-fiber-changed-text.psd{{AZURE_STORAGE_SAS_WRITE}}",
      "type": "vnd.adobe.photoshop",
      "overwrite": true
    }
  ]
}
```

元の入力ファイルを上書きしないので、出力ファイルの名前は異なります。

1. **送信** を選択します。

![Azure ストレージ ](./images/ps23.png){zoomable="yes"}

前と同じように、応答には、進行状況を追跡するステータスファイルを指すリンクが含まれています。

![Azure ストレージ ](./images/ps22.png){zoomable="yes"}

1. ステータスファイルを読み取るには、リクエスト **Photoshop - PS ステータスの取得を開き** 「**送信**」を選択します。 ステータスが **成功** に設定されていない場合は、数秒待ってから再度 **送信** を選択します。

1. 出力ファイルのダウンロード URL を選択します。

![Azure ストレージ ](./images/ps24.png){zoomable="yes"}

1. ファイルをコンピューターにダウンロードしたら、**citisignal-fiber-changed-text.psd** を開きます。 コールトゥアクションのプレースホルダーが「Get Fiber now **というテキストに置き換えられたことがわかります**。

![Azure ストレージ ](./images/ps25.png){zoomable="yes"}

Azure ストレージエクスプローラーを使用して、コンテナ内でこのファイルを表示することもできます。

![Azure ストレージ ](./images/ps26.png){zoomable="yes"}

## 次の手順

[Firefly カスタムモデル API](./ex4.md){target="_blank"} に移動します

[Adobe Firefly サービスの概要 ](./firefly-services.md){target="_blank"} に戻ります

[ すべてのモジュール ](./../../../overview.md){target="_blank"} に戻る
