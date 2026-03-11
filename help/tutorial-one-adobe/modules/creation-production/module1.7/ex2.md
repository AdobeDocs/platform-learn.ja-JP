---
title: カスタムワークフローをプログラムで実行する
description: カスタムワークフローをプログラムで実行する
role: Developer
level: Beginner
jira: KT-5342
doc-type: Tutorial
source-git-commit: a3a78b12f8244c8288eb0fffc82ad769776eb118
workflow-type: tm+mt
source-wordcount: '910'
ht-degree: 0%

---

# 1.7.2 カスタムワークフローをプログラムで実行する

## 1.7.2.1 Postmanでカスタムワークフローを実行する

前の演習でワークフローを公開すると、次のようになります。 「**コピー** ボタンをクリックして、サンプルペイロードをコピーします。

![Fireflyのカスタムワークフロー ](./images/ffcw61.png)

Postmanを開き、**Firefly Custom Workflows** という名前で **コレクション** を新規作成します。 次に、「**リクエストを追加**」をクリックします。

![Fireflyのカスタムワークフロー ](./images/ffcw62.png)

すると、新しい空のリクエストが表示されます。 アドレスバーに、公開済みのワークフローからコピーしたペイロードを貼り付けます。

Postmanは、貼り付けた cURL コマンドを認識し、ペイロードからすべての情報を取得して、正しい方法でリクエストに追加します。

![Fireflyのカスタムワークフロー ](./images/ffcw63.png)

これで、これらの **ヘッダー** 変数が表示されます。

![Fireflyのカスタムワークフロー ](./images/ffcw64.png)

**本文** に移動すると、これに似たものを表示する必要があります。

![Fireflyのカスタムワークフロー ](./images/ffcw65.png)

次に、このリクエストの本文で必要な手順を指定する必要があります。 プログラムによる方法でファイルを操作する場合は、事前署名済み URL の使用が必要です。 この演習では、この演習の一部である 3 つの画像に対して、以下の事前署名済み URL を見つけることができます。 これらの事前署名済み URL は、Microsoft Azure ストレージ機能を使用して作成されました。 事前署名済み URL の作成方法について詳しくは、「[Microsoft Azureと事前署名済み URL を使用してFirefly プロセスを最適化する ](./../module1.1/ex2.md) を参照してください。

この演習では、以下の URL を使用できるので、新しい事前署名済み URL を自分で作成する必要はありません。

- **airpods.jpg**

```
https://techinsiders.blob.core.windows.net/vangeluw/airpods.jpg?sv=2023-01-03&st=2026-03-11T01%3A22%3A04Z&se=2027-03-12T01%3A22%3A00Z&sr=b&sp=r&sig=MmQi9lS4lm4DJM1BELmZZM7VLa4ln5zYOcuGisLnrz4%3D
```

- **watch.jpg**

```
https://techinsiders.blob.core.windows.net/vangeluw/watch.jpg?sv=2023-01-03&st=2026-03-11T01%3A26%3A54Z&se=2027-03-12T01%3A26%3A00Z&sr=b&sp=r&sig=xCwQ09E%2F%2FT%2B7RLcb31Fum4uUBfsX0xHITKZTz4Ds9Zs%3D
```

- **phone.jpg**

```
https://techinsiders.blob.core.windows.net/vangeluw/phone.png?sv=2023-01-03&st=2026-03-11T01%3A27%3A20Z&se=2027-03-12T01%3A27%3A00Z&sr=b&sp=r&sig=VVbX88P2sFSHHo9lmgoRhXRIXb42c0nDQhM9Z8nUG%2Bc%3D
```

また、Postman リクエストの一部としてプロンプトを指定する必要があります。 使用できるプロンプトは次のとおりです。

- **プロンプト 1**:

```
magazine quality photo of a phone on a red pedestal with a pink background surrounded by origami style pink paper hearts
```

- **プロンプト 2**:

```
background hearts fluttering
```

サンプルペイロードは **node_id** フィールドがワークフローに固有なので、コピーして再利用することはできません。これは、ペイロードがどのように見えるかを把握するためのものです。

```json
{
    "workflow": {
        "workflowId": "e0c63806-cf7c-442d-8884-26d57e9c0518",
        "inputs": [
            [
                {
                    "node_id": "node_1772156869527_d8mjasues_1_u10dlg",
                    "content": [
                        {
                            "presignedUrl": "https://techinsiders.blob.core.windows.net/vangeluw/airpods.jpg?sv=2023-01-03&st=2026-03-11T01%3A22%3A04Z&se=2027-03-12T01%3A22%3A00Z&sr=b&sp=r&sig=MmQi9lS4lm4DJM1BELmZZM7VLa4ln5zYOcuGisLnrz4%3D",
                            "storageType": "Azure"
                        }
                    ]
                },
                {
                    "node_id": "node_1772157264659_oq2csr2nn_5_fh5hek",
                    "content": "magazine quality photo of a phone on a red pedestal with a pink background surrounded by origami style pink paper hearts"
                },
                {
                    "node_id": "node_1772157397147_qdwxiyktg_8_nm0o2k",
                    "content": "background hearts fluttering"
                }
            ]
        ]
    }
}
```

ペイロードに変更を加えると、次のようになります。 完了したら、「**送信**」をクリックします。 次に、**CMD + S** または **CTRL + S** を使用してリクエストを **保存** します。

![Fireflyのカスタムワークフロー ](./images/ffcw66.png)

応答ペイロードに、いくつかのリンクが表示されるようになりました。 これらのリンクを使用すると、ワークフローの **ステータス** をクエリできます。ステータスが **完了** になると、**results** URL を使用して、生成された画像とビデオを取得できます。

**ステータス** URL を選択し、コピーします。

![Fireflyのカスタムワークフロー ](./images/ffcw67.png)

現在使用しているリクエストの 3 つのドットをクリックし、「**複製**」を選択します。

![Fireflyのカスタムワークフロー ](./images/ffcw69.png)

新しいリクエストで、リクエストタイプを **GETに変更し** URL をコピーした status-URL に置き換えます。

![Fireflyのカスタムワークフロー ](./images/ffcw70.png)

**本文** の下で、すべてが削除されていることを確認します。 次に、「**送信**」をクリックします。 その後、同様の応答ペイロードを受け取り、ステータスを示します。 ステータスが **完了** に変わるまで、このリクエストを再送信できます。 リクエストを **保存** するには、**CMD + S** または **CTRL + S** を必ず使用してください。

![Fireflyのカスタムワークフロー ](./images/ffcw71.png)

最初の **POST** リクエストに戻ります。 次に、**results** URL をコピーします。

![Fireflyのカスタムワークフロー ](./images/ffcw72.png)

2 番目に作成したリクエストで 3 ドット **...** をクリックし、「**複製**」を選択します。

![Fireflyのカスタムワークフロー ](./images/ffcw73.png)

新しいリクエストに、コピーした **results** URL を貼り付け、「**送信**」をクリックします。 リクエストを **保存** するには、**CMD + S** または **CTRL + S** を必ず使用してください。

![Fireflyのカスタムワークフロー ](./images/ffcw74.png)

応答ペイロードを下にスクロールします。ここには、作成した画像とビデオへの参照が表示されます。 これらのファイルを開くには、リンクをクリックします。

![Fireflyのカスタムワークフロー ](./images/ffcw75.png)

生成された画像は次のとおりです。

![Fireflyのカスタムワークフロー ](./images/ffcw76.png)

## 1.7.2.2 Workfront Fusion でカスタムワークフローを実行する

[https://experience.adobe.com/](https://experience.adobe.com/){target="_blank"} に移動します。 **Workfront Fusion** を開きます。

![WF Fusion](./images/wffusion1.png)

**シナリオ** に移動します。 まだフォルダーがない場合は、フォルダーを作成し、フォルダー名として `--aepUserLdap--` を使用します。 フォルダーを選択し、「**新しいシナリオを作成**」を選択します。

![WF Fusion](./images/wffusion2.png)

この画像が表示されます。

![WF Fusion](./images/wffusion3.png)

前の演習でワークフローを公開すると、次のようになります。 「**コピー** ボタンをクリックして、サンプルペイロードをコピーします。

![Fireflyのカスタムワークフロー ](./images/ffcw61.png)

Workfront Fusion のシナリオに戻ります。 シナリオにコピーしたペイロードを貼り付けるには、**CMD + V** または **CTRL + V** を使用します。 Workfront Fusion は cURL リクエストを自動的に検出し、新しい **HTTP - リクエストを行う** モジュールを自動的に作成します。

**clock** アイコンを **HTTP - リクエストを行う** モジュールにドラッグします。

![WF Fusion](./images/wffusion5.png)

この画像が表示されます。 「**HTTP - リクエストを行う**」モジュールをクリックして開きます。

![WF Fusion](./images/wffusion6.png)

**Header** 変数が既に使用可能になっていることがわかります。

![WF Fusion](./images/wffusion7.png)

下にスクロールして、デフォルトのペイロードを表示します。 指示に従って **アイコン** をクリックし、JSON ペイロードを美化します。

![WF Fusion](./images/wffusion8.png)

Postmanに戻り、最初の **POST** リクエストに移動します。 ペイロードをコピーします。

![WF Fusion](./images/wffusion9.png)

Workfront Fusion のシナリオに戻ります。 既存のデフォルトのペイロードを、Postmanからコピーしたペイロードに置き換えます。 指示に従って **アイコン** をクリックし、JSON ペイロードを美化します。

**応答を解析** のチェックボックスをオンにします。

「**OK**」をクリックします。

![WF Fusion](./images/wffusion10.png)

変更を保存し、「**1 回実行**」をクリックします。

![WF Fusion](./images/wffusion11.png)

シナリオが実行されると、Postmanと同様の応答が表示されます。 Workfront Fusion でこの情報を利用できるようになったので、ステータスが完了するまで **status** URL をポーリングし、完了したら、**results** URL を使用して、生成された画像とビデオを収集できるようになりました。

![WF Fusion](./images/wffusion12.png)

## 次の手順

[Fireflyのカスタムワークフロー ](./workflowbuilder.md){target="_blank"} に戻る

[ すべてのモジュール ](./../../../overview.md){target="_blank"} に戻る
