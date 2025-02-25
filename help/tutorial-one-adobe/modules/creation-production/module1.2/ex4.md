---
title: コネクタを使用した自動化
description: コネクタを使用した自動化
role: Developer
level: Beginner
jira: KT-5342
doc-type: Tutorial
exl-id: 0b20ba91-28d4-4f4d-8abe-074f802c389e
source-git-commit: 8cdfc543a7d107f77e38e61f116893bed0d85165
workflow-type: tm+mt
source-wordcount: '1721'
ht-degree: 1%

---

# 1.2.4 コネクタを使用した自動化

次に、Photoshop用Workfront Fusion の標準コネクタの使用を開始し、Firefly Text-2-Image リクエストとPhotoshop リクエストを 1 つのシナリオに接続します。

## 1.2.4.1 シナリオの複製と準備

左側のメニューで、**シナリオ** に移動し、フォルダー `--aepUserLdap--` を選択します。 これにより、以前に作成した `--aepUSerLdap-- - Adobe I/O Authentication` という名前のシナリオが表示されます。

![WF Fusion](./images/wffc1.png)

矢印をクリックしてドロップダウンメニューを開き、「**クローン**」を選択します。

![WF Fusion](./images/wffc2.png)

複製したシナリオの **名前** を `--aepUserLdap-- - Firefly + Photoshop` に設定し、適切な **ターゲットチーム** を選択します。 **追加** をクリックして、新しい Webhook を追加します。

![WF Fusion](./images/wffc3.png)

**Webhook 名** を `--aepUserLdap-- - Firefly + Photoshop Webhook` に設定します。 「**保存**」をクリックします。

![WF Fusion](./images/wffc4.png)

この画像が表示されます。 「**保存**」をクリックします。

![WF Fusion](./images/wffc5.png)

この画像が表示されます。 **Webhook** ノードをクリックします。

![WF Fusion](./images/wffc6.png)

[**アドレスをクリップボードにコピー**] をクリックし、[**データ構造を再決定**] をクリックします。

![WF Fusion](./images/wffc7.png)

Postmanを開きます。 以前に使用していたのと同じフォルダーに新しいリクエストを追加します。

![WF Fusion](./images/wffc9.png)

次の設定が適用されていることを確認します。

- 要求名：`POST - Send Request to Workfront Fusion Webhook Firefly + Photoshop`
- 要求の種類：`POST`
- リクエスト URL: Workfront Fusion シナリオの Webhook からコピーした URL を貼り付けます。

**本文** に移動し、**本文タイプ** を **raw** - **JSON** に設定します。 次のペイロードを **Body** に貼り付けます。

```json
{
    "psdTemplate": "citisignal-fiber.psd",
    "xlsFile": "placeholder",
    "prompt":"misty meadows",
    "cta": "Buy this now!",
    "button": "Click here to buy!"
}
```

この新しいペイロードでは、変数情報をシナリオにハードコードするのではなく、シナリオの外部から、すべての変数情報を提供します。 エンタープライズシナリオでは、組織は再利用可能な方法でシナリオを定義する必要があります。つまり、多数の変数をシナリオにハードコードするのではなく、入力変数として提供する必要があります。

これで完了です。 「**送信**」をクリックします。

![WF Fusion](./images/wffc10.png)

Workfront Fusion Webhook は入力待ちの状態です。

![WF Fusion](./images/wffc11.png)

**送信** をクリックすると、メッセージが tp **正常に決定されました** に変わります。 「**OK**」をクリックします。

![WF Fusion](./images/wffc12.png)

## Firefly T2I ノードの 1.2.4.2 アップデート

ノード **Firefly T2I** をクリックします。 この画像が表示されます。 このリクエストのプロンプトは、以前は **フィールド内の馬** にハードコードされていました。 次に、そのハードコードされたテキストを削除し、Webhook からのフィールドに置き換えます。

![WF Fusion](./images/wffcfft2i1.png)

テキスト **フィールド内の馬** を削除して、変数 **prompt** に置き換えます。この変数は **Webhook** 変数の下にあります。 「**OK**」をクリックして変更を保存します。

![WF Fusion](./images/wffcfft2i2.png)

## 1.2.4.2 PSD ファイルの背景の変更

次に、標準搭載のコネクタを使用して、シナリオを更新して、よりスマートにします。 また、Fireflyからの出力をFireflyに接続して、Photoshopの「画像を生成」アクションからの出力を使用してPSD ファイルの背景画像が動的に変化するようにします。

前の演習では、**Firefly T2I** ルートを無効にしました。 今すぐそれを元に戻すべきです。 **stop**-icon をクリックして、ルートを再度有効にします。

![WF Fusion](./images/wffc13.png)

**stop** アイコンが表示されなくなります。 次に、前の演習の設定に向かう他のルートの **レンチ** アイコンをクリックし、**ルートを無効** を選択します。

![WF Fusion](./images/wffc14.png)

この画像が表示されます。 次に、**Firefly T2I** ノードにマウスポインターを置き、「**+**」アイコンをクリックします。

![WF Fusion](./images/wffc15.png)

検索メニューに「`Photoshop`」と入力し、**Adobe Photoshop** アクションをクリックします。

![WF Fusion](./images/wffc16.png)

**PSDの編集内容を適用** を選択します。

![WF Fusion](./images/wffc17.png)

この画像が表示されます。 **追加** をクリックして、Adobe Photoshopへの新しい接続を追加します。

![WF Fusion](./images/wffc18.png)

次のように接続を設定します。

- 接続の種類：**Adobe Photoshop （サーバー間）を選択してください**
- 接続名：`--aepUserLdap-- - Adobe IO` と入力します
- クライアント ID: クライアント ID を貼り付けます
- クライアント秘密鍵：クライアント秘密鍵を貼り付けます

「**続行**」をクリックします。

![WF Fusion](./images/wffc19.png)

**クライアント ID** と **クライアントシークレット** を見つけるには、[https://developer.adobe.com/console/home](https://developer.adobe.com/console/home){target="_blank"} に移動し、`--aepUserLdap-- One Adobe tutorial` という名前のAdobe I/O プロジェクトを開きます。 **OAuth サーバー間** に移動して、クライアント ID とクライアントシークレットを検索します。 これらの値をコピーして、Workfront Fusion の接続設定に貼り付けます。

![WF Fusion](./images/wffc20.png)

**続行** をクリックすると、資格情報の検証中にポップアップウィンドウが短時間表示されます。 完了したら、次の画面が表示されます。

![WF Fusion](./images/wffc21.png)

次に、Fusion で操作するPSD ファイルの場所を入力する必要があります。 **ストレージ** には **Azure** を選択し、**ファイルの場所** には `{{1.AZURE_STORAGE_URL}}/{{1.AZURE_STORAGE_CONTAINER}}/{{1.AZURE_STORAGE_SAS_READ}}` と入力します。 2 番目の `/` の隣にカーソルを置きます。 次に、使用可能な変数を確認し、下にスクロールして変数 **psdTemplate** を見つけます。 変数 **psdTemplate** をクリックして選択します。

![WF Fusion](./images/wffc22.png)

この画像が表示されます。

![WF Fusion](./images/wffc23.png)

**レイヤー** が表示されるまで下にスクロールします。 **項目を追加** をクリックします。

![WF Fusion](./images/wffc24.png)

この画像が表示されます。 次に、ファイルの背景に使用するPhotoshop PSD テンプレートのレイヤーの名前を入力する必要があります。

![WF Fusion](./images/wffc25.png)

**citisignal-fiber.psd** ファイルには、背景に使用するレイヤーがあります。 この例では、レイヤーの名前は **2048 x 2048-background** です。

![WF Fusion](./images/wffc26.png)

Workfront Fusion ダイアログに、**2048x2048-background** という名前を貼り付けます。

![WF Fusion](./images/wffc27.png)

**入力** が表示されるまで下にスクロールします。 ここで、背景レイヤーに挿入する必要があるものを定義する必要があります。 この場合、動的に生成された画像を含むFirefly T2I オブジェクトの出力を選択する必要があります。

**ストレージ** については、「**外部**」を選択します。 **ファイルの場所** について、**Firefly T2I** リクエストの出力から変数 `data.outputs[].image.url` を検索して見つけます。

![WF Fusion](./images/wffc28.png)

次に、**編集** が表示されるまで下にスクロールします。 **編集** を **はい** に設定し、**タイプ** を **レイヤー** に設定します。 「**追加**」をクリックします。

![WF Fusion](./images/wffc29.png)

この画像が表示されます。 次に、アクションの出力を定義する必要があります。 **output** の下の **項目を追加** をクリックします。

![WF Fusion](./images/wffc30.png)

**ストレージ** の場合は **Azure** を選択し、この `{{1.AZURE_STORAGE_URL}}/{{1.AZURE_STORAGE_CONTAINER}}/citisignal-fiber-replacedbg.psd{{1.AZURE_STORAGE_SAS_WRITE}}` を **ファイルの場所** の下に貼り付けて、**タイプ** の下の **vnd.adobe.photoshop** を選択します。 クリックして **詳細設定を表示** を有効にします。

![WF Fusion](./images/wffc31.png)

[**詳細設定**] で、[**はい**] を選択して、同じ名前のファイルを上書きします。
「**追加**」をクリックします。

![WF Fusion](./images/wffc32.png)

これで完了です。 「**OK**」をクリックします。

![WF Fusion](./images/wffc33.png)

## 1.2.4.3 PSD ファイルのテキストレイヤーの変更

### コールトゥアクションテキスト

次に、**Adobe Photoshop - PSDの編集を適用** ノードにマウスポインターを置き、「**+**」アイコンをクリックします。

![WF Fusion](./images/wffc34.png)

「**Adobe Photoshop**」を選択します。

![WF Fusion](./images/wffc35.png)

**テキストレイヤーを編集** を選択します。

![WF Fusion](./images/wffc36.png)

この画像が表示されます。 まず、以前に設定済みのAdobe Photoshop接続を選択します（`--aepUserLdap-- Adobe IO` という名前にする必要があります）。

次に、前の手順の出力である **入力ファイル** の場所を定義する必要があります。**レイヤー** の下に、変更するテキストレイヤーの **名前** を入力する必要があります。

![WF Fusion](./images/wffc37.png)

**入力ファイル** の場合は、「入力ファイルストレージ **に** Azure **** を選択し、前のリクエストの出力を必ず選択してください（**Adobe Photoshop - PSDの編集を適用**）。こちらから取得できます。`data[]._links.renditions[].href`

![WF Fusion](./images/wffc37a.png)

ファイル **citisignal-fiber.psd** を開きます。 ファイルには、コールトゥアクションを含むレイヤーの名前が **2048 x 2048-cta** になっていることがわかります。

![WF Fusion](./images/wffc38.png)

ダイアログの **名前** の下に、**2048x2048-cta** と入力します。

![WF Fusion](./images/wffc39.png)

下にスクロールして **テキスト**/**コンテンツ** を表示します。 Webhook ペイロードから変数 **cta** を選択します。

![WF Fusion](./images/wffc40.png)

**出力** が表示されるまで下にスクロールします。 **ストレージ** については、「**Azure**」を選択します。 **ファイルの場所** には、次の場所を入力します。 生成される各ファイルの名前が必ず一意になるようにするために使用されるファイル名に、変数 `{{timestamp}}` が追加されることに注意してください。 また、**タイプ** を **vnd.adobe.photoshop** に設定します。 「**OK**」をクリックします。

`{{1.AZURE_STORAGE_URL}}/{{1.AZURE_STORAGE_CONTAINER}}/citisignal-fiber-changed-text-{{timestamp}}.psd{{1.AZURE_STORAGE_SAS_WRITE}}`

![WF Fusion](./images/wffc41.png)

### ボタンのテキスト

作成したノードを右クリックし、「**クローン**」を選択します。 これにより、2 つ目の類似オブジェクトが作成されます。

![WF Fusion](./images/wffc42.png)

この画像が表示されます。 まず、以前に設定済みのAdobe Photoshop接続を選択します（`--aepUserLdap-- Adobe IO` という名前にする必要があります）。

次に、前の手順の出力である **入力ファイル** の場所を定義する必要があります。**レイヤー** の下に、変更するテキストレイヤーの **名前** を入力する必要があります。

![WF Fusion](./images/wffc43.png)

**入力ファイル** の場合は、「入力ファイルストレージ **に** Azure **** を選択し、前のリクエストの出力を必ず選択してください（**Adobe Photoshop - テキストレイヤーを編集**）。次から取得できます。`data[]._links.renditions[].href`

ファイル **citisignal-fiber.psd** を開きます。 ファイルには、コールトゥアクションを含むレイヤーの名前が **2048 x 2048-button-text** になっていることがわかります。

![WF Fusion](./images/wffc44.png)

ダイアログの **名前** の下に、**2048x2048-cta** と入力します。

![WF Fusion](./images/wffc43.png)

下にスクロールして **テキスト**/**コンテンツ** を表示します。 Webhook ペイロードから変数 **cta** を選択します。

![WF Fusion](./images/wffc45.png)

**出力** が表示されるまで下にスクロールします。 **ストレージ** については、「**Azure**」を選択します。 **ファイルの場所** には、次の場所を入力します。 生成される各ファイルの名前が必ず一意になるようにするために使用されるファイル名に、変数 `{{timestamp}}` が追加されることに注意してください。 また、**タイプ** を **vnd.adobe.photoshop** に設定します。 「**OK**」をクリックします。

`{{1.AZURE_STORAGE_URL}}/{{1.AZURE_STORAGE_CONTAINER}}/citisignal-fiber-changed-text-{{timestamp}}.psd{{1.AZURE_STORAGE_SAS_WRITE}}`

![WF Fusion](./images/wffc46.png)

「**保存**」をクリックして変更を保存します。

![WF Fusion](./images/wffc47.png)

## 1.2.4.4 Webhook 応答

これらの変更をPhotoshop ファイルに適用した後、次に **Webhook レスポンス** を設定する必要があります。

ノード **Adobe Photoshop - テキストレイヤーを編集にカーソルを合わせ** 「**+**」アイコンをクリックしてください。

![WF Fusion](./images/wffc48.png)

**Webhook** を検索し、「**Webhook**」を選択します。

![WF Fusion](./images/wffc49.png)

**Webhook 応答** を選択します。

![WF Fusion](./images/wffc50.png)

この画像が表示されます。 以下のペイロードを **本文** に貼り付けます。

```json
{
    "newPsdTemplate": ""
}
```

![WF Fusion](./images/wffc51.png)

前のリクエストの出力からパス `data[]._links.renditions[].href` を選択します。 **詳細設定を表示** のチェックボックスを有効にして、「**項目を追加**」をクリックします。

![WF Fusion](./images/wffc52.png)

「**キー**」フィールドに「`Content-Type`」と入力します。 **値** フィールドに「`application/json`」と入力します。 「**保存**」をクリックします。

![WF Fusion](./images/wffc52a.png)

これで完了です。 「**OK**」をクリックします。

![WF Fusion](./images/wffc53.png)

**自動整列** をクリックします。

![WF Fusion](./images/wffc54.png)

この画像が表示されます。 **1 回実行** をクリックします。

![WF Fusion](./images/wffc55.png)

Postmanに戻り、「**送信**」をクリックします。 ここで使用されているプロンプトは **霧の深い牧草地** です。

![WF Fusion](./images/wffc56.png)

その後、シナリオがアクティブ化され、しばらくすると、新しく作成されたPSD ファイルの URL を含むレスポンスがPostmanに表示されます。

![WF Fusion](./images/wffc58.png)

注意：Workfront Fusion でシナリオを実行したら、各ノードの上のバブルをクリックすると、各ノードに関する情報を確認できます。

![WF Fusion](./images/wffc59.png)

Azure ストレージエクスプローラーを使用すると、Azure ストレージエクスプローラー内で新しく作成したPSD ファイルをダブルクリックして、ファイルを探して開くことができます。

![WF Fusion](./images/wffc60.png)

これでファイルは次のようになります。背景は **misty meadows** です。

![WF Fusion](./images/wffc61.png)

シナリオを再度実行し、別のプロンプトを使用してPostmanから新しいリクエストを送信すると、シナリオが簡単で再利用可能になったことがわかります。 この例では、新しく使用するプロンプトは **sunny desert** です。

![WF Fusion](./images/wffc62.png)

数分後、新しい背景を持つ新しいPSD ファイルが生成されました。

![WF Fusion](./images/wffc63.png)

## 次の手順

[Firefly Services Automation の概要とメリット ](./summary.md){target="_blank"} を参照してください。

[Adobe Firefly サービスの自動化 ](./automation.md){target="_blank"} に戻る

[ すべてのモジュール ](./../../../overview.md){target="_blank"} に戻る
