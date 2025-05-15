---
title: コネクタを使用した自動化
description: コネクタを使用した自動化
role: Developer
level: Beginner
jira: KT-5342
doc-type: Tutorial
exl-id: 0b20ba91-28d4-4f4d-8abe-074f802c389e
source-git-commit: 9ddabdf0b66ea4772352f5aa82c612fa07891db3
workflow-type: tm+mt
source-wordcount: '2058'
ht-degree: 1%

---

# 1.2.4 コネクタを使用した自動化

次に、Photoshop用Workfront Fusion の標準コネクタの使用を開始し、Firefly Text-2-Image リクエストとPhotoshop リクエストを 1 つのシナリオに接続します。

## 1.2.4.1 シナリオの複製と準備

左側のメニューで、**シナリオ** に移動し、フォルダー `--aepUserLdap--` を選択します。 これにより、以前に作成した `--aepUserLdap-- - Adobe I/O Authentication` という名前のシナリオが表示されます。

![WF Fusion](./images/wffc1.png)

矢印をクリックしてドロップダウンメニューを開き、「**クローン**」を選択します。

![WF Fusion](./images/wffc2.png)

複製したシナリオの **名前** を `--aepUserLdap-- - Firefly + Photoshop` に設定し、適切な **ターゲットチーム** を選択します。 **追加** をクリックして、新しい Webhook を追加します。

>[!NOTE]
>
>**ターゲットチーム** を選択するオプションが表示されない場合があります。 このオプションは、Workfront Fusion で 1 人以上のチームに所属しているユーザーにのみ表示されます。 このオプションが表示されない場合は、単に 1 チームに追加されただけなので、選択は不要です。

![WF Fusion](./images/wffc3.png)

**Webhook 名** を `--aepUserLdap-- - Firefly + Photoshop Webhook` に設定します。 「**保存**」をクリックします。

![WF Fusion](./images/wffc4.png)

この画像が表示されます。 「**保存**」をクリックします。

![WF Fusion](./images/wffc5.png)

この画像が表示されます。 **Webhook** モジュールをクリックします。

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

## Firefly T2I モジュールの 1.2.4.2 アップデート

モジュール **Firefly T2I** を右クリックし、「**モジュールを削除**」を選択します。

![WF Fusion](./images/wffcff1.png)

「**+**」アイコンをクリックし、検索語句「`firefly`」を入力して「**Adobe Firefly**」を選択します。

![WF Fusion](./images/wffcff2.png)

**画像を生成** を選択します。

![WF Fusion](./images/wffcff3.png)

**Adobe Firefly** モジュールをドラッグ&amp;ドロップして、**ルーター** モジュールに接続します。

![WF Fusion](./images/wffcff4.png)

**Adobe Firefly** モジュールをクリックして開き、「**追加**」をクリックして新しい接続を作成します。

![WF Fusion](./images/wffcff5.png)

次のフィールドに入力します。

- **接続名**:`--aepUserLdap-- - Firefly connection` を使用します。
- **環境**: **実稼動** を使用します。
- **タイプ**: **個人用アカウント** を使用します。
- **クライアント ID**:`--aepUserLdap-- - One Adobe tutorial` という名前のAdobe I/O プロジェクトから **クライアント ID** をコピーします。
- **クライアント秘密鍵**: **クライアント秘密鍵** を `--aepUserLdap-- - One Adobe tutorial` という名前のAdobe I/O プロジェクトからコピーします。

Adobe I/O プロジェクトの **クライアント ID** と **クライアントシークレット** は、（こちら [ で確認でき ](https://developer.adobe.com/console/projects.){target="_blank"} す。

![WF Fusion](./images/wffc20.png)

すべてのフィールドに入力したら、「**続行**」をクリックします。 すると、接続が自動的に検証されます。

![WF Fusion](./images/wffcff6.png)

次に、受信した **Custom Webhook** によってシナリオに提供される **prompt** 変数を選択します。

![WF Fusion](./images/wffcff7.png)

次に、**モデルバージョン**&#x200B;**prompt** を **image4 standard** に設定します。 「**OK**」をクリックします。

![WF Fusion](./images/wffcff7b.png)

続行する前に、シナリオで古いルートを無効にする必要があります。この演習では、現在設定している新しいルートのみを使用します。 これを行うには、**Router** モジュールと **Iterator** モジュールの間にある **レンチ** アイコンをクリックし、**ルートを無効にする** を選択します。

![WF Fusion](./images/wffcff7a.png)

「**保存**」をクリックして変更を保存し、「**1 回実行**」をクリックして設定をテストします。

![WF Fusion](./images/wffcff8.png)

Postmanに移動し、リクエストのプロンプトを確認して、「**送信**」をクリックします。

![WF Fusion](./images/wffcff8a.png)

「送信」をクリックしたら、Workfront Fusion に戻り、**Adobe Firefly** モジュールのバブルアイコンをクリックして詳細を確認します。

![WF Fusion](./images/wffcff9.png)

**OUTPUT** から **Details** / **url** に移動し、**Adobe Firefly** で生成された画像の URl を見つけます。

![WF Fusion](./images/wffcff10.png)

Postman リクエストから送信されたプロンプト（この場合は **Misty Meadows** を表す画像が表示されます。

![WF Fusion](./images/wffcff11.png)

## 1.2.4.2 PSD ファイルの背景の変更

次に、標準搭載のコネクタを使用してシナリオを更新し、よりスマートにします。 また、Fireflyからの出力をFireflyに接続して、Photoshopの「画像を生成」アクションからの出力を使用してPSD ファイルの背景画像が動的に変化するようにします。

この画像が表示されます。 次に、**Adobe Firefly** モジュールにポインタを合わせて、「**+**」アイコンをクリックします。

![WF Fusion](./images/wffc15.png)

検索メニューで、「`Photoshop`」と入力して「**Adobe Photoshop**」アクションをクリックします。

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

**入力** が表示されるまで下にスクロールします。 ここで、背景レイヤーに挿入する必要があるものを定義する必要があります。 この場合、動的に生成された画像を含む **Adobe Firefly** モジュールの出力を選択する必要があります。

**ストレージ** については、「**外部**」を選択します。 **ファイルの場所** の場合は、**Adobe Firefly** モジュールの出力から変数 `{{XX.details[].url}}` をコピーして貼り付ける必要がありますが、変数内の **XX** を **Adobe Firefly** モジュールのシーケンス番号（この例では **22**）に置き換える必要があります。

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

「**保存**」をクリックして変更を保存し、「**1 回実行**」をクリックして設定をテストします。

![WF Fusion](./images/wffc33a.png)

Postmanに移動し、リクエストのプロンプトを確認して、「**送信**」をクリックします。

![WF Fusion](./images/wffcff8a.png)

この画像が表示されます。 **Adobe Photoshop - PSDの編集を適用** モジュールのバブルをクリックします。

![WF Fusion](./images/wffc33b.png)

新しいPSD ファイルが正常に生成され、Microsoft Azure ストレージアカウントに保存されたことを確認できます。

![WF Fusion](./images/wffc33c.png)

## 1.2.4.3 PSD ファイルのテキストレイヤーの変更

次に、**Adobe Photoshop - PSDの編集を適用** モジュールにカーソルを合わせ、「**+**」アイコンをクリックします。

![WF Fusion](./images/wffc34.png)

「**Adobe Photoshop**」を選択します。

![WF Fusion](./images/wffc35.png)

**テキストレイヤーを編集** を選択します。

![WF Fusion](./images/wffc36.png)

この画像が表示されます。 まず、以前に設定済みのAdobe Photoshop接続を選択します（`--aepUserLdap-- Adobe IO` という名前にする必要があります）。

次に、前の手順の出力である **入力ファイル** の場所を定義する必要があります。**レイヤー** の下で、テキストを変更する必要があるレイヤーごとに **+項目を追加** をクリックする必要があります。

![WF Fusion](./images/wffc37.png)

**入力ファイル** の場合、「入力ファイルストレージ **に** Azure **&#x200B;**&#x200B;を選択し、前のリクエストの出力を必ず選択してください **Adobe Photoshop - PSDの編集を適用**。次のように定義できます。``{{XX.data[].`_links`.renditions[].href}}`` （XX を前のモジュールのシーケンス番号に置き換えます。Adobe Photoshop - PSDの編集を適用）

次に、**レイヤー** の下の「**+項目を追加**」をクリックして、更新する必要があるテキストレイヤーの追加を開始します。

![WF Fusion](./images/wffc37a.png)

2 つの変更を加える必要があります。ファイル **citisignal-fiber.psd** 内のCTA テキストとボタンテキストを更新する必要があります。

レイヤー名を見つけるには、ファイル **citisignal-fiber.psd** を開きます。 ファイルには、コールトゥアクションを含むレイヤーの名前が **2048 x 2048-cta** になっていることがわかります。

![WF Fusion](./images/wffc38.png)

ファイル **citisignal-fiber.psd** 内で、call to actionを含むレイヤーの名前が **2048x2048-button-text** になっていることにも注目してください。

![WF Fusion](./images/wffc44.png)

まず、レイヤー **2048 x 2048-cta** に対して行う必要がある変更を設定する必要があります。 ダイアログの **名前** の下に、**2048x2048-cta** と入力します。

![WF Fusion](./images/wffc39.png)

下にスクロールして **テキスト**/**コンテンツ** を表示します。 Webhook ペイロードから変数 **cta** を選択します。 「**追加**」をクリックします。

![WF Fusion](./images/wffc40.png)

この画像が表示されます。 **レイヤー** の下の「**+項目を追加**」をクリックして、更新する必要のあるテキストレイヤーの追加を開始します。

![WF Fusion](./images/wffc40a.png)

ダイアログの **Name** の下に、名前 **2048x2048-button-text** を入力します。

![WF Fusion](./images/wffc40b.png)

下にスクロールして **テキスト**/**コンテンツ** を表示します。 Webhook ペイロードから変数 **button** を選択します。 「**追加**」をクリックします。

![WF Fusion](./images/wffc40c.png)

この画像が表示されます。

![WF Fusion](./images/wffc40d.png)

**出力** が表示されるまで下にスクロールします。 **ストレージ** については、「**Azure**」を選択します。 **ファイルの場所** には、次の場所を入力します。 生成される各ファイルの名前が必ず一意になるようにするために使用されるファイル名に、変数 `{{timestamp}}` が追加されることに注意してください。 また、**タイプ** を **vnd.adobe.photoshop** に設定します。

`{{1.AZURE_STORAGE_URL}}/{{1.AZURE_STORAGE_CONTAINER}}/citisignal-fiber-changed-text-{{timestamp}}.psd{{1.AZURE_STORAGE_SAS_WRITE}}`

![WF Fusion](./images/wffc41.png)

**タイプ** を **vnd.adobe.photoshop** に設定します。 「**OK**」をクリックします。

![WF Fusion](./images/wffc41a.png)

「**保存**」をクリックして変更を保存します。

![WF Fusion](./images/wffc47.png)

## 1.2.4.4 Webhook 応答

これらの変更をPhotoshop ファイルに適用した後、次に **Webhook レスポンス** を設定する必要があります。

モジュール **Adobe Photoshop - テキストレイヤーを編集にカーソルを合わせ** 「**+**」アイコンをクリックしてください。

![WF Fusion](./images/wffc48.png)

`webhooks` を検索し、「**Webhook**」を選択します。

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

変数 `{{XX.data[]._links.renditions[].href}}` をコピーして貼り付け、**XX** を最後の **Adobe Photoshop - テキストレイヤーを編集** モジュール（この場合は **30** のシーケンス番号に置き換えます。

![WF Fusion](./images/wffc52.png)

**詳細設定を表示** のチェックボックスを有効にして、「**項目を追加**」をクリックします。

![WF Fusion](./images/wffc52b.png)

「**キー**」フィールドに「`Content-Type`」と入力します。 **値** フィールドに「`application/json`」と入力します。 「**追加**」をクリックします。

![WF Fusion](./images/wffc52a.png)

これで完了です。 「**OK**」をクリックします。

![WF Fusion](./images/wffc53.png)

**自動整列** をクリックします。

![WF Fusion](./images/wffc54.png)

この画像が表示されます。 「**保存**」をクリックして変更を保存し、「**1 回実行**」をクリックしてシナリオをテストします。

![WF Fusion](./images/wffc55.png)

Postmanに戻り、「**送信**」をクリックします。 ここで使用されているプロンプトは **霧の深い牧草地** です。

![WF Fusion](./images/wffc56.png)

その後、シナリオがアクティブ化され、しばらくすると、新しく作成されたPSD ファイルの URL を含むレスポンスがPostmanに表示されます。

![WF Fusion](./images/wffc58.png)

注意：Workfront Fusion でシナリオを実行したら、各モジュールの上にあるバブルをクリックすると、各モジュールに関する情報を確認できます。

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

[1.2.5 Frame.io とWorkfront Fusion に移動します ](./ex5.md){target="_blank"}

[Workfront Fusion のCreative Workflow Automation に戻る ](./automation.md){target="_blank"}

[ すべてのモジュール ](./../../../overview.md){target="_blank"} に戻る
