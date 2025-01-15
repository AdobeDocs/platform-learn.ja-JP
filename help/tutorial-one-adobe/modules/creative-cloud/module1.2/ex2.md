---
title: Fireflyサービスの概要
description: Fireflyサービスの概要
kt: 5342
doc-type: tutorial
exl-id: 23ebf8b4-3f16-474c-afe1-520d88331417
source-git-commit: a0c16a47372d322a7931578adca30a246b537183
workflow-type: tm+mt
source-wordcount: '594'
ht-degree: 2%

---

# 1.2.2 Workfront Fusion 内でのAdobeAPI の使用

## 1.2.2.1 Fireflyテキストを使用してWorkfront Fusion で API を画像に変換する

2 つ目の **複数の変数を設定** ノードにマウスポインターを置き、「**+**」をクリックして別のモジュールを追加します。

![WF Fusion](./images/wffusion48.png)

**http** を検索し、**HTTP** を選択します。

![WF Fusion](./images/wffusion49.png)

「**リクエストを行う**」を選択します。

![WF Fusion](./images/wffusion50.png)

次の変数を選択します。

- **URL**: `https://firefly-api.adobe.io/v3/images/generate`
- **メソッド**: `POST`

**ヘッダーを追加** をクリックします。

![WF Fusion](./images/wffusion51.png)

次のヘッダーを入力する必要があります。

| キー | 値 |
|:-------------:| :---------------:| 
| `x-api-key` | `CONST_client_id` 用に保存した変数 |
| `Authorization` | `Bearer ` + `bearer_token` 用に保存した変数 |
| `Content-Type` | `application/json` |
| `Accept` | `*/*` |

`x-api-key` の詳細を入力します。 「**追加**」をクリックします。

![WF Fusion](./images/wffusion52.png)

**ヘッダーを追加** をクリックします。

![WF Fusion](./images/wffusion53.png)

`Authorization` の詳細を入力します。 「**追加**」をクリックします。

![WF Fusion](./images/wffusion54.png)

**ヘッダーを追加** をクリックします。 `Content-Type` の詳細を入力します。 「**追加**」をクリックします。

![WF Fusion](./images/wffusion541.png)

**ヘッダーを追加** をクリックします。 `Accept` の詳細を入力します。 「**追加**」をクリックします。

![WF Fusion](./images/wffusion542.png)

**Body type** を **Raw** に設定します。 「**コンテンツタイプ**」には、「**JSON （application/json）**」を選択します。

![WF Fusion](./images/wffusion55.png)

このペイロードを「**コンテンツをリクエスト** フィールドに貼り付けます。

```json
{
  "numVariations": 1,
  "size": {
    "width": 2048,
    "height": 2048
  },
  "prompt": "Horses in a field",
  "promptBiasingLocaleCode": "en-US"
}
```

**応答を解析** のチェックボックスをオンにします。 「**OK**」をクリックします。

![WF Fusion](./images/wffusion56.png)

**1 回実行** をクリックします。

![WF Fusion](./images/wffusion57.png)

シナリオが実行されると、次の画面が表示されます。

![WF Fusion](./images/wffusion58.png)

**をクリックする4 番目** ノードの HTTP 上にアイコンがあり、応答を確認できます。 応答に画像ファイルが表示されます。

![WF Fusion](./images/wffusion59.png)

画像 URL をコピーし、ブラウザーウィンドウで開きます。 次のようなメッセージが表示されます。

![WF Fusion](./images/wffusion60.png)

**HTTP** オブジェクトを右クリックし、名前を **FireflyT2I** に変更します。

![WF Fusion](./images/wffusion62.png)

「**保存**」をクリックして変更を保存します。

![WF Fusion](./images/wffusion61.png)

## 1.2.2.2 Workfront Fusion でのPhotoshop API の使用

**ベアラートークンを設定** ノードと **4}FireflyT2I} の間にある** レンチ **アイコンをクリックします。****ルーターを追加** を選択します。

![WF Fusion](./images/wffusion63.png)

**FireflyT2I** オブジェクトを右クリックし、「**クローン**」を選択します。

![WF Fusion](./images/wffusion64.png)

複製されたオブジェクトを **Router** オブジェクトの近くにドラッグ&amp;ドロップすると、**Router** に自動接続されます。 これで完了です。

![WF Fusion](./images/wffusion65.png)

これで、**Firefly T2I** HTTP リクエストに基づいて、同一のコピーが作成されます。 **Firefly T2I** HTTP リクエストの一部の設定は、時間を節約する **Photoshop API** とのやり取りに必要なものと似ています。 ここで変更する必要があるのは、リクエスト URL やペイロードなど、同じではない変数のみです。

**URL** を `https://image.adobe.io/pie/psdService/text` に変更します。

![WF Fusion](./images/wffusion66.png)

**コンテンツをリクエスト** を以下のペイロードに置き換えます。

```json
{
  "inputs": [
    {
      "storage": "external",
      "href": "{{AZURE_STORAGE_URL}}/{{AZURE_STORAGE_CONTAINER}}/sevoi-psd.psd{{AZURE_STORAGE_SAS_READ}}"
    }
  ],
  "options": {
    "layers": [
      {
        "name": "2048x2048-button",
        "text": {
          "content": "Click here"
        }
      },
      {
        "name": "2048x2048-cta",
        "text": {
          "content": "Buy this stuff"
        }
      }
    ]
  },
  "outputs": [
    {
      "storage": "azure",
      "href": "{{AZURE_STORAGE_URL}}/{{AZURE_STORAGE_CONTAINER}}/sevoi-psd-changed-text.psd{{AZURE_STORAGE_SAS_WRITE}}",
      "type": "vnd.adobe.photoshop",
      "overwrite": true
    }
  ]
}
```

![WF Fusion](./images/wffusion67.png)

この **リクエストコンテンツ** が正しく機能するには、いくつかの変数が欠落しています。

- `AZURE_STORAGE_URL`
- `AZURE_STORAGE_CONTAINER`
- `AZURE_STORAGE_SAS_READ`
- `AZURE_STORAGE_SAS_WRITE`

最初のノードに戻り、「**定数の初期化**」をクリックし、これらの変数ごとに **項目を追加** を選択します。

![WF Fusion](./images/wffusion69.png)

| キー | 値の例 |
|:-------------:| :---------------:| 
| `AZURE_STORAGE_URL` | `https://vangeluw.blob.core.windows.net` |
| `AZURE_STORAGE_CONTAINER` | `vangeluw` |
| `AZURE_STORAGE_SAS_READ` | `?sv=2023-01-03&st=2025-01-13T07%3A36%3A35Z&se=2026-01-14T07%3A36%3A00Z&sr=c&sp=rl&sig=4r%2FcSJLlt%2BSt9HdFdN0VzWURxRK6UqhB8TEvbWkmAag%3D` |
| `AZURE_STORAGE_SAS_WRITE` | `?sv=2023-01-03&st=2025-01-13T17%3A21%3A09Z&se=2025-01-14T17%3A21%3A09Z&sr=c&sp=racwl&sig=FD4m0YyyqUj%2B5T8YyTFJDi55RiTDC9xKtLTgW0CShps%3D` |

変数を見つけるには、Postmanに戻って **環境変数** を開きます。

![Azure ストレージ ](./../module1.1/images/az105.png)

これらの値をWorkfront Fusion にコピーし、これら 4 つの変数のそれぞれに新しい項目を追加します。

これで完了です。 「**OK**」をクリックします。

![WF Fusion](./images/wffusion68.png)

次に、複製された HTTP リクエストに戻って、**リクエストコンテンツ** を更新します。 **リクエストコンテンツ** のこれらの黒い変数に気づくでしょう。これは、Postmanからコピーした変数です。 次に、これらをWorkfront Fusion で定義したばかりの変数に変更する必要があります。 各変数を 1 つずつ置き換えます。黒いテキストを削除して、正しい変数に置き換えます。

![WF Fusion](./images/wffusion70.png)

**inputs** セクションには 3 つの変更があります。

![WF Fusion](./images/wffusion71.png)

**output** セクションには 3 つの変更もあります。 「**OK**」をクリックします。

![WF Fusion](./images/wffusion72.png)

クローン作成されたノードを右クリックし、「**名前を変更**」を選択します。 名前を **Photoshop テキストを変更** に変更します。

![WF Fusion](./images/wffusion73.png)

これで完了です。

![WF Fusion](./images/wffusion74.png)

次の手順：[1.2.3 ...](./ex3.md)

[モジュール 1.2 に戻る](./automation.md)

[すべてのモジュールに戻る](./../../../overview.md)
