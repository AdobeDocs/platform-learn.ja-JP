---
title: Fireflyカスタムモデル API
description: Fireflyカスタムモデル API の操作
role: Developer
level: Beginner
jira: KT-5342
doc-type: Tutorial
exl-id: 330f4492-d0df-4298-9edc-4174b0065c9a
source-git-commit: 18151b91d18ebb53fc485151effd12a6fdc2b6b8
workflow-type: tm+mt
source-wordcount: '836'
ht-degree: 1%

---

# 1.1.4 Fireflyカスタムモデル API

## 1.1.4.1 カスタムモデルの設定

[https://firefly.adobe.com/](https://firefly.adobe.com/) に移動します。 **カスタムモデル** をクリックします。

![Fireflyのカスタム モデル ](./images/ffcm1.png){zoomable="yes"}

このメッセージが表示される場合があります。 同意する場合は、「**同意する**」をクリックして続行します。

![Fireflyのカスタム モデル ](./images/ffcm2.png){zoomable="yes"}

この画像が表示されます。 **モデルのトレーニング** をクリックします。

![Fireflyのカスタム モデル ](./images/ffcm3.png){zoomable="yes"}

次のフィールドを設定します。

- **名前**：使用する `--aepUserLdap-- - Citi Signal Router Model`
- **トレーニングモード**:**件名（テクニカルプレビュー）** を選択
- **概念**:`router` を入力します。
- **保存先**：ドロップダウンリストを開いて、「**+新規プロジェクトを作成」をクリックします**

![Fireflyのカスタム モデル ](./images/ffcm4.png){zoomable="yes"}

新しいプロジェクトに `--aepUserLdap-- - Custom Models` という名前を付けます。 「**作成**」をクリックします。

![Fireflyのカスタム モデル ](./images/ffcm5.png){zoomable="yes"}

この画像が表示されます。 「**作成**」をクリックします。

![Fireflyのカスタム モデル ](./images/ffcm6.png){zoomable="yes"}

ここで、トレーニングするカスタムモデルの参照画像を指定する必要があります。 **コンピューターから画像を選択** をクリックします。

![Fireflyのカスタム モデル ](./images/ffcm7.png){zoomable="yes"}

参照画像を [ こちら ](https://tech-insiders.s3.us-west-2.amazonaws.com/CitiSignal_router.zip) からダウンロードします。 ダウンロードファイルを解凍すると、次の情報が得られます。

![Fireflyのカスタム モデル ](./images/ffcm8.png){zoomable="yes"}

ダウンロード画像ファイルを含むフォルダーに移動します。 それらをすべて選択し、「**開く** をクリックします。

![Fireflyのカスタム モデル ](./images/ffcm9.png){zoomable="yes"}

その後、画像が読み込まれていることがわかります。

![Fireflyのカスタム モデル ](./images/ffcm10.png){zoomable="yes"}

数分後、画像は正しく読み込まれます。 一部の画像にエラーが表示される場合があります。これは、画像のキャプションが生成されていないか、十分な長さがないことが原因です。 各画像をエラーで確認し、要件を満たしてその画像を説明するキャプションを入力します。

![Fireflyのカスタム モデル ](./images/ffcm11.png){zoomable="yes"}

すべての画像のキャプションが要件を満たしたら、サンプルプロンプトを指定する必要があります。 &#39;router&#39;という単語を使用するプロンプトを入力します。 完了したら、モデルのトレーニングを開始できます。 **トレーニング** をクリックします。

![Fireflyのカスタム モデル ](./images/ffcm12.png){zoomable="yes"}

その後、これが表示されます。 モデルのトレーニングには、20～30 分以上かかる場合があります。

![Fireflyのカスタム モデル ](./images/ffcm13.png){zoomable="yes"}

20 ～ 30 分後に、モデルのトレーニングが完了し、公開できるようになります。 「**公開**」をクリックします。

![Fireflyのカスタム モデル ](./images/ffcm14.png){zoomable="yes"}

もう一度 **0}Publish} をクリックします。**

![Fireflyのカスタム モデル ](./images/ffcm15.png){zoomable="yes"}

**カスタムモデルを共有** ポップアップを閉じます。

![Fireflyのカスタム モデル ](./images/ffcm16.png){zoomable="yes"}

## 1.1.4.2 UI でのカスタムモデルの使用

[https://firefly.adobe.com/cme/train](https://firefly.adobe.com/cme/train) に移動します。 カスタムモデルをクリックして開きます。

![Fireflyのカスタム モデル ](./images/ffcm19.png){zoomable="yes"}

**プレビューとテスト** をクリックします。

![Fireflyのカスタム モデル ](./images/ffcm17.png){zoomable="yes"}

次に、実行前に入力したサンプルプロンプトが表示されます。

![Fireflyのカスタム モデル ](./images/ffcm18.png){zoomable="yes"}

## 1.1.4.3 Fireflyサービスのカスタムモデルを有効にするカスタムモデル API

カスタムモデルは、トレーニングが完了すると、API から使用することもできます。 演習 1.1.1 では、API を使用してFireflyサービスとやり取りできるようにAdobe I/Oプロジェクトを既に設定しています。

[https://firefly.adobe.com/cme/train](https://firefly.adobe.com/cme/train) に移動します。 カスタムモデルをクリックして開きます。

![Fireflyのカスタム モデル ](./images/ffcm19.png){zoomable="yes"}

3 つのドット **...** をクリックし、「**共有**」をクリックします。

![Fireflyのカスタム モデル ](./images/ffcm20.png){zoomable="yes"}

Fireflyのカスタムモデルにアクセスするには、カスタムモデルをAdobe I/Oプロジェクトの **テクニカルアカウント ID** に共有する必要があります。

**テクニカルアカウント ID** を取得するには、[https://developer.adobe.com/console/projects](https://developer.adobe.com/console/projects) にアクセスします。 クリックして、`--aepUserLdap-- Firefly` という名前のプロジェクトを開きます。

![Fireflyのカスタム モデル ](./images/ffcm24.png){zoomable="yes"}

**OAuth サーバー間** をクリックします。

![Fireflyのカスタム モデル ](./images/ffcm25.png){zoomable="yes"}

**テクニカルアカウント ID** をクリックしてコピーします。

![Fireflyのカスタム モデル ](./images/ffcm23.png){zoomable="yes"}

**テクニカルアカウント ID** を貼り付け、「**編集に招待**」をクリックします。

![Fireflyのカスタム モデル ](./images/ffcm21.png){zoomable="yes"}

**テクニカルアカウント ID** がカスタムモデルにアクセスできるようになりました。

![Fireflyのカスタム モデル ](./images/ffcm22.png){zoomable="yes"}

## 1.1.4.4 Fireflyサービスのカスタムモデル API の操作

>[!IMPORTANT]
>
>Adobe社員の方は、こちらの説明に従って [PostBuster](./../../../postbuster.md) を使用してください。

演習 1.1.1 Fireflyサービスの概要では、次のファイルをダウンロードしました：[postman-ff.zip](./../../../assets/postman/postman-ff.zip) をローカルデスクトップにダウンロードし、そのコレクションをPostmanに読み込みました。

Postmanを開き、フォルダー **FF - カスタムモデル API** に移動します。

![Fireflyのカスタム モデル ](./images/ffcm30.png){zoomable="yes"}

リクエスト **1 を開きます。 FF - getCustomModels** と **送信** をクリックします。

![Fireflyのカスタム モデル ](./images/ffcm31.png){zoomable="yes"}

応答の一部として、以前に作成したカスタムモデル（`--aepUserLdap-- - Citi Signal Router Model` という名前）が表示されます。 フィールド **assetId** は、カスタムモデルの一意の識別子で、次のリクエストで参照されます。

![Fireflyのカスタム モデル ](./images/ffcm32.png){zoomable="yes"}

リクエスト **2 を開きます。 画像を非同期で生成**. この例では、2 つのバリエーションをカスタムモデルに基づいて生成するようにリクエストします。 この場合は `a white router on a volcano in Africa` のプロンプトを自由に更新してください。

「**送信**」をクリックします。

![Fireflyのカスタム モデル ](./images/ffcm33.png){zoomable="yes"}

応答には、フィールド **jobId** が含まれています。 これらの 2 つの画像を生成するジョブを実行中です。次のリクエストを使用してステータスを確認できます。

![Fireflyのカスタム モデル ](./images/ffcm34.png){zoomable="yes"}

リクエスト **3 を開きます。 CM のステータスを取得し** 「送信 **をクリック** ます。 ステータスが実行中に設定されていることがわかります。

![Fireflyのカスタム モデル ](./images/ffcm35.png){zoomable="yes"}

数分後、リクエスト **3 で再度** 送信 **をクリックします。 CM ステータスの取得**. すると、ステータスが **succeeded** に変更され、出力の一部として 2 つの画像 URL が表示されます。 クリックして両方のファイルを開きます。

![Fireflyのカスタム モデル ](./images/ffcm36.png){zoomable="yes"}

これは、この例で生成された最初の画像です。

![Fireflyのカスタム モデル ](./images/ffcm37.png){zoomable="yes"}

これは、この例で生成された 2 番目の画像です。

![Fireflyのカスタム モデル ](./images/ffcm38.png){zoomable="yes"}

これで、この演習が完了しました。

## 次の手順

[ 概要とメリット ](./summary.md){target="_blank"} に移動します。

[Photoshop API の操作 ](./ex3.md){target="_blank"} に戻る

[Adobe Fireflyサービスの概要 ](./firefly-services.md){target="_blank"} に戻る
