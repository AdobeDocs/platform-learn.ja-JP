---
title: Workfront Fusion 内でのAdobe API の使用
description: Workfront Fusion でのAdobe API の使用方法について説明します
role: Developer
level: Beginner
jira: KT-5342
doc-type: Tutorial
exl-id: 23ebf8b4-3f16-474c-afe1-520d88331417
source-git-commit: b083a817700320e8e45645702c2868423c1fae99
workflow-type: tm+mt
source-wordcount: '1749'
ht-degree: 0%

---

# 1.2.2 Workfront Fusion でのAdobe API の使用

Workfront Fusion でAdobe API を使用する方法を説明します。

## 1.2.2.1 Firefly テキストを使用してWorkfront Fusion で API を画像に変換する

1. 2 つ目の **複数の変数を設定** ノードにマウスポインターを置き、「**+**」を選択して別のモジュールを追加します。

![WF Fusion](./images/wffusion48.png)

1. **http** を検索し、**HTTP** を選択します。

![WF Fusion](./images/wffusion49.png)

1. 「**リクエストを行う**」を選択します。

![WF Fusion](./images/wffusion50.png)

1. 次の変数を選択します。

- **URL**: `https://firefly-api.adobe.io/v3/images/generate`
- **メソッド**: `POST`

1. **ヘッダーを追加** を選択します。

![WF Fusion](./images/wffusion51.png)

1. 次のヘッダーを入力します。

| キー | 値 |
|:-------------:| :---------------:| 
| `x-api-key` | `CONST_client_id` 用に保存した変数 |
| `Authorization` | `Bearer ` + `bearer_token` 用に保存した変数 |
| `Content-Type` | `application/json` |
| `Accept` | `*/*` |

1. `x-api-key` の詳細を入力します。 「**追加**」を選択します。

![WF Fusion](./images/wffusion52.png)

1. **ヘッダーを追加** を選択します。

![WF Fusion](./images/wffusion53.png)

1. `Authorization` の詳細を入力します。 「**追加**」を選択します。

![WF Fusion](./images/wffusion54.png)

1. **ヘッダーを追加** を選択します。 `Content-Type` の詳細を入力します。 「**追加**」を選択します。

![WF Fusion](./images/wffusion541.png)

1. **ヘッダーを追加** を選択します。 `Accept` の詳細を入力します。 「**追加**」を選択します。

![WF Fusion](./images/wffusion542.png)

1. **Body type** を **Raw** に設定します。 「**コンテンツタイプ**」には、「**JSON （application/json）**」を選択します。

![WF Fusion](./images/wffusion55.png)

1. このペイロードを「**コンテンツをリクエスト** フィールドに貼り付けます。

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

1. 「応答を解析 **のチェックボックスをオンに** ます。 **OK** を選択します。

![WF Fusion](./images/wffusion56.png)

1. **1 回実行** を選択します。

![WF Fusion](./images/wffusion57.png)

画面は次のようになります。

![WF Fusion](./images/wffusion58.png)

1. **を選択しますか？4 番目** ノードの HTTP 上にアイコンがあり、応答を確認できます。 応答に画像ファイルが表示されます。

![WF Fusion](./images/wffusion59.png)

1. 画像 URL をコピーし、ブラウザーウィンドウで開きます。 画面は次のようになります。

![WF Fusion](./images/wffusion60.png)

1. **HTTP** を右クリックして、名前を **Firefly T2I** に変更します。

![WF Fusion](./images/wffusion62.png)

1. 「**保存**」を選択して変更を保存します。

![WF Fusion](./images/wffusion61.png)

## 1.2.2.2 Workfront Fusion でのPhotoshop API の使用

1. **ベアラートークンを設定** ノードと **4}Firefly T2I** ノードの間の「レンチ **を選択します。****ルーターを追加** を選択します。

![WF Fusion](./images/wffusion63.png)

1. **Firefly T2I** オブジェクトを右クリックし、「**クローン**」を選択します。

![WF Fusion](./images/wffusion64.png)

1. クローンしたオブジェクトを **Router** オブジェクトの近くにドラッグ&amp;ドロップします。このオブジェクトは **Router** に自動的に接続されます。 画面は次のようになります。

![WF Fusion](./images/wffusion65.png)

これで、**Firefly T2I** HTTP リクエストに基づいて、同一のコピーが作成されます。 **Firefly T2I** HTTP リクエストの一部の設定は、時間を節約する **Photoshop API** とのやり取りに必要なものと似ています。 ここで変更する必要があるのは、リクエスト URL やペイロードなど、同じではない変数のみです。

1. **URL** を `https://image.adobe.io/pie/psdService/text` に変更します。

![WF Fusion](./images/wffusion66.png)

1. **コンテンツをリクエスト** を以下のペイロードに置き換えます。

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
        "name": "2048x2048-button-text",
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
      "href": "{{AZURE_STORAGE_URL}}/{{AZURE_STORAGE_CONTAINER}}/citisignal-fiber-changed-text.psd{{AZURE_STORAGE_SAS_WRITE}}",
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

1. 最初のノードに戻り、「**定数を初期化**」を選択し、次にこれらの変数ごとに **項目を追加** を選択します。

![WF Fusion](./images/wffusion69.png)

| キー | 値の例 |
|:-------------:| :---------------:| 
| `AZURE_STORAGE_URL` | `https://vangeluw.blob.core.windows.net` |
| `AZURE_STORAGE_CONTAINER` | `vangeluw` |
| `AZURE_STORAGE_SAS_READ` | `?sv=2023-01-03&st=2025-01-13T07%3A36%3A35Z&se=2026-01-14T07%3A36%3A00Z&sr=c&sp=rl&sig=4r%2FcSJLlt%2BSt9HdFdN0VzWURxRK6UqhB8TEvbWkmAag%3D` |
| `AZURE_STORAGE_SAS_WRITE` | `?sv=2023-01-03&st=2025-01-13T17%3A21%3A09Z&se=2025-01-14T17%3A21%3A09Z&sr=c&sp=racwl&sig=FD4m0YyyqUj%2B5T8YyTFJDi55RiTDC9xKtLTgW0CShps%3D` |

変数を見つけるには、Postmanに戻って **環境変数** を開きます。

![Azure ストレージ ](./../module1.1/images/az105.png)

1. これらの値をWorkfront Fusion にコピーし、これら 4 つの変数のそれぞれに新しい項目を追加します。

1. 画面は次のようになります。 **OK** を選択します。

![WF Fusion](./images/wffusion68.png)

次に、複製された HTTP リクエストに戻って、**リクエストコンテンツ** を更新します。 **リクエストコンテンツ** の黒い変数に注意してください。これは、Postmanからコピーした変数です。 Workfront Fusion で定義したばかりの変数に変更する必要があります。 各変数を 1 つずつ置き換えます。黒いテキストを削除して、正しい変数に置き換えます。

![WF Fusion](./images/wffusion70.png)

1. **inputs** セクションで、次の 3 つの変更を行います。 **OK** を選択します。

![WF Fusion](./images/wffusion71.png)

1. 次の 3 つの変更を「**output**」セクションで行います。 **OK** を選択します。

![WF Fusion](./images/wffusion72.png)

1. クローン作成されたノードを右クリックし、「**名前を変更**」を選択します。 名前を **Photoshop テキストを変更** に変更します。

![WF Fusion](./images/wffusion73.png)

画面は次のようになります。

![WF Fusion](./images/wffusion74.png)

1. **1 回実行** を選択します。

![WF Fusion](./images/wffusion75.png)

1. **2}Photoshop Change Text** ノードの「**検索 } アイコンを選択して、応答を確認します。**&#x200B;ステータスファイルへのリンクを含む、次のような応答が得られます。

![WF Fusion](./images/wffusion76.png)

1. Photoshop API のインタラクションを続行する前に、**Firefly T2I** ノードへのルートを無効にして、その API エンドポイントに不要な API 呼び出しを送信しないようにします。 **レンチ** アイコンを選択し、「**ルートを無効にする**」を選択します。

![WF Fusion](./images/wffusion77.png)

画面は次のようになります。

![WF Fusion](./images/wffusion78.png)

1. 次に、別の **複数の変数を設定** ノードを追加します。

![WF Fusion](./images/wffusion79.png)

1. **Photoshop Change Text** ノードの後ろに配置します。

![WF Fusion](./images/wffusion80.png)

1. 「**複数の変数を設定**」ノードを選択し、「**項目を追加**」を選択します。 前のリクエストの応答から変数値を選択します。

| 変数名 | 変数値 |
|:-------------:| :---------------:| 
| `psdStatusUrl` | `data > _links > self > href` |

1. 「**追加**」を選択します。

![WF Fusion](./images/wffusion81.png)

1. **OK** を選択します。

![WF Fusion](./images/wffusion82.png)

1. **Photoshop Change Text** ノードを右クリックし、「**クローン**」を選択します。

![WF Fusion](./images/wffusion83.png)

1. 作成した **複数の変数を設定** ノードの後に、複製した HTTP リクエストをドラッグします。

![WF Fusion](./images/wffusion83.png)

1. HTTP リクエストのクローンを右クリックして、「**名前を変更**」を選択し、名前を「**Photoshopステータスを確認**」に変更します。

![WF Fusion](./images/wffusion84.png)

1. 「」を選択して、HTTP リクエストを開きます。 前の手順で作成した変数を参照するように URL を変更し、**メソッド** を **GET** に設定します。

![WF Fusion](./images/wffusion85.png)

1. 空のオプションを選択して **本文** を削除します。

![WF Fusion](./images/wffusion86.png)

1. **OK** を選択します。

![WF Fusion](./images/wffusion87.png)

1. **1 回実行** を選択します。

![WF Fusion](./images/wffusion88.png)

フィールド **status** を含み、ステータスが **running** に設定された応答が表示されます。 Photoshopがプロセスを完了するまで数秒かかります。

![WF Fusion](./images/wffusion89.png)

これで、応答を完了するためにもう少し時間が必要がわかったので、すぐには実行されないように、この HTTP リクエストの前にタイマーを追加することをお勧めします。

1. **ツール** ノードを選択してから、「**スリープ**」を選択します。

![WF Fusion](./images/wffusion90.png)

1. **Set multiple variables** と **Photoshopチェックステータス** の間に **Sleep** ノードを配置します。 「**遅延**」を **5** 秒に設定します。 **OK** を選択します。

![WF Fusion](./images/wffusion91.png)

画面は次のようになります。 以下の設定の課題は、5 秒間の待機で十分な場合があるものの、十分ではない可能性があることです。 実際には、ステータスが **成功** になるまで、5 秒ごとにステータスを確認する do...while ループのような、よりインテリジェントなソリューションを使用することをお勧めします。 したがって、次の手順でそのような戦術を実装できます。

![WF Fusion](./images/wffusion92.png)

1. **複数の変数を設定** と **スリープ** の間の **レンチ** アイコンを選択します。 「**モジュールを追加**」を選択します。

![WF Fusion](./images/wffusion93.png)

1. `flow` を検索し、「**フロー制御**」を選択します。

![WF Fusion](./images/wffusion94.png)

1. **リピーター** を選択します。

![WF Fusion](./images/wffusion95.png)

1. **繰り返し** を **20** に設定します。 **OK** を選択します。

![WF Fusion](./images/wffusion96.png)

1. 次に、**Photoshopのステータスの確認** で「**+**」を選択して、別のモジュールを追加します。

![WF Fusion](./images/wffusion97.png)

1. **フロー** を検索し、「**フロー制御**」を選択します。

![WF Fusion](./images/wffusion98.png)

1. 「**配列アグリゲータ**」を選択します。

![WF Fusion](./images/wffusion99.png)

1. **Source モジュール** を **リピーター** に設定します。 **OK** を選択します。

![WF Fusion](./images/wffusion100.png)

画面は次のようになります。

![WF Fusion](./images/wffusion101.png)

1. **レンチ** アイコンを選択し、「**モジュールを追加**」を選択します。

![WF Fusion](./images/wffusion102.png)

1. **ツール** を検索して **ツール** を選択します。

![WF Fusion](./images/wffusion103.png)

1. **複数の変数を取得** を選択します。

![WF Fusion](./images/wffusion104.png)

1. 「**+項目を追加**」を選択し、「**変数名**」を `done` に設定します。

![WF Fusion](./images/wffusion105.png)

1. **OK** を選択します。

![WF Fusion](./images/wffusion106.png)

1. 前に設定した **複数の変数を設定** ノードを選択します。 変数 **done** を初期化するには、ここで `false` に設定する必要があります。 「**+項目を追加**」を選択します。

![WF Fusion](./images/wffusion107.png)

1. **変数名** には `done` を使用します

1. ステータスを設定するには、ブール値が必要です。 ブール値を検索するには、「**歯車**」を選択し、「`false`」を選択します。 「**追加**」を選択します。

![WF Fusion](./images/wffusion108.png)

1. **OK** を選択します。

![WF Fusion](./images/wffusion109.png)

1. 次に、設定した **複数の変数を取得** ノードの後に **レンチ** アイコンを選択します。

![WF Fusion](./images/wffusion110.png)

1. **フィルターを設定** を選択します。 ここで、変数 **done** の値を確認する必要があります。 この値を **false** に設定した場合は、ループの次の部分を実行する必要があります。 値が **true** に設定されている場合は、プロセスが既に正常に完了しているので、ループの次の部分を続行する必要はありません。

![WF Fusion](./images/wffusion111.png)

1. ラベルには、「完了しました **を使用します。**。既存の変数 **done** を使用して **条件** を設定し、演算子を **Equal to** に設定し、値をブール変数 `false` にする必要があります。 **OK** を選択します。

![WF Fusion](./images/wffusion112.png)

1. 次に、ノード **Photoshopのステータスの確認** と **配列アグリゲータ** の間にスペースを作ります。 次に、**レンチ** アイコンを選択し、**ルーターを追加** を選択します。 これは、Photoshop ファイルのステータスを確認した後は 2 つのパスが存在する必要があるためです。 ステータスが `succeeded` の場合は、**done** の変数を `true` に設定する必要があります。 ステータスが `succeeded` に等しくない場合、ループは続行されます。 ルータはこれを確認して設定することを可能にします。

![WF Fusion](./images/wffusion113.png)

1. ルーターを追加したら、「**レンチ**」アイコンを選択し、「**フィルターを設定**」を選択します。

![WF Fusion](./images/wffusion114.png)

1. ラベルには、**完了** を使用します。 **2}Photoshopチェックステータス** ノードからの応答を使用して **条件を設定します。応答フィールド** data.outputs[].status **を選択し、演算子は** 次と等しい **に、値は `succeeded` にする必要があります。****OK** を選択します。

![WF Fusion](./images/wffusion115.png)

1. 次に、疑問符の付いた空のノードを選択し、**tools** を検索します。 次に、「**ツール**」を選択します。

![WF Fusion](./images/wffusion116.png)

1. 「**複数の変数を設定**」を選択します。

![WF Fusion](./images/wffusion117.png)

1. ルーターのこのブランチを使用すると、Photoshop ファイルの作成ステータスが正常に完了したことになります。 つまり、do...while ループでPhotoshopのステータスを引き続き確認する必要がなくなったので、変数 `done` を `true` に設定する必要があります。

1. **変数名** には、`done` を使用します。

1. **変数値** には、ブール値 `true` を使用する必要があります。 **歯車** アイコンを選択し、「`true`」を選択します。 「**追加**」を選択します。

![WF Fusion](./images/wffusion118.png)

1. **OK** を選択します。

![WF Fusion](./images/wffusion119.png)

1. 次に、作成した **複数の変数を設定** ノードを右クリックし、「**クローン**」を選択します。

![WF Fusion](./images/wffusion120.png)

1. クローンノードをドラッグして、**配列アグリゲータ** に接続します。 次に、ノードを右クリックして「**名前を変更**」を選択し、名前を `Placeholder End` に変更します。

![WF Fusion](./images/wffusion122.png)

1. 既存の変数を削除し、「**+項目を追加**」を選択します。 **変数名** には `placeholder` を使用し、**変数値** には `end` を使用します。 「**追加**」を選択してから、「**OK**」を選択します。

![WF Fusion](./images/wffusion123.png)

1. 「**保存**」を選択してシナリオを保存します。 次に、を選択します   **1 回実行**。

![WF Fusion](./images/wffusion124.png)

シナリオが実行され、正常に終了します。 設定した do...while ループは正常に動作します。 以下の実行では、**ツール/複数の変数を取得** ノードのバブルに基づいて **リピーター** が 20 回実行されたことがわかります。 そのノードの後、ステータスをチェックするフィルターを設定し、ステータスが **成功** でない場合にのみ、次のノードが実行されました。 この実行では、ステータスが最初の実行で既に **成功** しているので、フィルター後の部分は 1 回だけ実行されました。

![WF Fusion](./images/wffusion125.png)

1. 新しいPhotoshop ファイルの作成ステータスを確認するには、**Photoshop ステータスの確認** HTTP リクエストのバブルをクリックし、「**ステータス** フィールドにドリルダウンします。

![WF Fusion](./images/wffusion126.png)

これで、いくつかの手順を自動化する繰り返し可能なシナリオの基本バージョンを設定しました。 次の演習では、複雑さを増やして、これを繰り返し説明します。

## 次の手順

[Workfront Fusion によるプロセスの自動化 ](./ex3.md){target="_blank"} に移動します。

[Adobe Firefly サービスの自動化 ](./automation.md){target="_blank"} に戻る

[ すべてのモジュール ](./../../../overview.md){target="_blank"} に戻る
