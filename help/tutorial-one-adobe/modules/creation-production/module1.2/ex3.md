---
title: Workfront Fusion によるプロセスの自動化
description: Workfront Fusion で自動処理を処理する方法を説明します
role: Developer
level: Beginner
jira: KT-5342
doc-type: Tutorial
exl-id: 1b7b2630-864f-4982-be5d-c46b760739c3
source-git-commit: 603e48e0453911177823fe7ceb340f8ca801c5e1
workflow-type: tm+mt
source-wordcount: '947'
ht-degree: 0%

---

# 1.2.3 Workfront Fusion によるプロセスの自動化

Workfront Fusion でプロセスの自動処理を実行する方法を説明します。

## 複数 1.2.3.1 値の反復

シナリオは次のようになります。

![WF Fusion](./images/wffusion200.png)

これまでに、Photoshop ファイルのテキストを静的な値で変更しました。 コンテンツ作成ワークフローを拡張および自動化するには、値のリストを繰り返し処理し、それらの値をPhotoshop ファイルに動的に挿入する必要があります。 次の手順では、既存のシナリオの値を繰り返し処理するウィジェットを追加します。

**Router** ノードと **Photoshop Change Text** ノードの間にある **レンチ** アイコンを選択し、「**モジュールを追加**」を選択します。

![WF Fusion](./images/wffusion201.png)

`flow` を検索し、「**フロー制御**」を選択します。

![WF Fusion](./images/wffusion202.png)

**イテレータ** を選択します。

![WF Fusion](./images/wffusion203.png)

画面は次のようになります。

![WF Fusion](./images/wffusion204.png)

CSV ファイルなどの入力ファイルは読み取ることができますが、現時点では、テキスト文字列を定義してテキストファイルを分割することで、基本的なバージョンの CSV ファイルを使用する必要があります。

**split** 関数を見つけるには、「**T**」アイコンを選択します。このアイコンには、テキスト値を操作するために使用できるすべての関数が表示されます。 **split** 関数を選択すると、これが表示されます。

![WF Fusion](./images/wffusion206.png)

split 関数では、セミコロンの前に値の配列を指定し、セミコロンの後に区切り記号を指定する必要があります。 このテストでは、**今すぐ購入** と **ここをクリック** の 2 つのフィールドを持つ単純な配列を使用する必要があり、使用する区切り記号は **,** です。

現在空の **split** 関数 `{{split("Buy now, Click here "; ",")}}` を置き換えて、**配列** フィールドにこれを入力します。 **OK** を選択します。

![WF Fusion](./images/wffusion205.png)

入力および出力フィールドに静的な値ではなく一部の変数を追加するには、{0 **Photoshop変更テキスト } を選択します。**

![WF Fusion](./images/wffusion207.png)

**コンテンツをリクエスト** 内に、というテキストがあります **ここをクリック**。 このテキストは、配列から取得した値で置き換える必要があります。

![WF Fusion](./images/wffusion208.png)

テキスト **ここをクリック** を削除し、「**Iterator**」ノードから変数 **Value** を選択して置き換えます。 これにより、Photoshop ドキュメントのボタン上のテキストが動的に更新されます。

![WF Fusion](./images/wffusion209.png)

また、Azure ストレージアカウントにファイルを書き込むために使用するファイル名を更新する必要もあります。 ファイル名が静的な場合、新しいイテレーションでは単に以前のファイルが上書きされるので、カスタマイズされたファイルは失われます。 現在の静的ファイル名は **citignal-fiber-changed-text.psd** ですが、これを更新する必要があります。

カーソルを `text` という単語の後ろに置きます。

![WF Fusion](./images/wffusion210.png)

最初にハイフン `-` を追加し、次に値 **バンドルの順序** を選択します。 Workfrontこれにより、最初のイテレーションではファイル名に `-1` が追加され、2 番目のイテレーションではファイル `-2` に追加されます。 **OK** を選択します。

![WF Fusion](./images/wffusion211.png)

シナリオを保存し、「**1 回実行**」を選択します。

![WF Fusion](./images/wffusion212.png)

シナリオが実行されたら、Azure ストレージエクスプローラーに戻り、フォルダーを更新します。 新しく作成された 2 つのファイルが表示されます。

![WF Fusion](./images/wffusion213.png)

ファイルをダウンロードして開きます。 ボタンにさまざまなテキストを入力する必要があります。 これはファイル `citisignal-fiber-changed-text-1.psd` です。

![WF Fusion](./images/wffusion214.png)

これはファイル `citisignal-fiber-changed-text-2.psd` です。

![WF Fusion](./images/wffusion215.png)

## Webhook1.2.3.2 使用してシナリオをアクティブ化するには

これまでのところ、シナリオを手動で実行してテストしてきました。 次に、Webhook を使用してシナリオを更新し、外部環境からアクティブ化できるようにします。

**+** を選択し、**Webhook** を検索してから **Webhook** を選択します。

![WF Fusion](./images/wffusion216.png)

**Custom Webhook** を選択します。

**Custom Webhook** ノードをドラッグして接続し、キャンバスの最初のノード（**Initialize Constants** と呼ばれる）に接続します。

![WF Fusion](./images/wffusion217.png)

**Custom Webhook** ノードを選択します。 次に、「**追加**」を選択します。

![WF Fusion](./images/wffusion218.png)

**Webhook 名** を `--aepUserLdap-- - Tutorial 1.2` に設定します。

![WF Fusion](./images/wffusion219.png)

**リクエストヘッダーを取得** のチェックボックスをオンにします。 「**保存**」を選択します。

![WF Fusion](./images/wffusion220.png)

これで、Webhook URL が使用できるようになります。 URL をコピーします。

![WF Fusion](./images/wffusion221.png)

Postmanを開き、コレクションに新しいフォルダーを追加します **FF - Firefly Services テクニカルインサイダー**。

![WF Fusion](./images/wffusion222.png)

フォルダーに `--aepUserLdap-- - Workfront Fusion` という名前を付けます。

![WF Fusion](./images/wffusion223.png)

先ほど作成したフォルダーで、3 つのドット **...** を選択し、「**リクエストを追加**」を選択します。

![WF Fusion](./images/wffusion224.png)

**メソッドタイプ** を **POST** に設定し、Webhook の URL をアドレスバーに貼り付けます。

![WF Fusion](./images/wffusion225.png)

変数要素を外部ソースからWorkfront Fusion シナリオに提供できるように、カスタム本文を送信する必要があります。

**本文** に移動し、「**生**」を選択します。

![WF Fusion](./images/wffusion226.png)

以下のテキストをリクエストの本文に貼り付けます。 **送信** を選択します。

```json
{
	"psdTemplate": "placeholder",
	"xlsFile": "placeholder"
}
```

![WF Fusion](./images/wffusion229.png)

Workfront Fusion に戻ると、カスタム Webhook に「**正常に決定されました**」というメッセージが表示されます。

![WF Fusion](./images/wffusion227.png)

「**保存**」を選択してから、「**1 回実行**」を選択します。 シナリオは現在アクティブですが、Postmanで「**送信**」を再度選択するまで実行されません。

![WF Fusion](./images/wffusion230.png)

Postmanで **送信** を再度選択します。

![WF Fusion](./images/wffusion228.png)

シナリオが再び実行され、前と同じように 2 つのファイルが作成されます。

![WF Fusion](./images/wffusion232.png)

Postman リクエストの名前を `POST - Send Request to Workfront Fusion Webhook` に変更します。

![WF Fusion](./images/wffusion233.png)

ここで、変数 **psdTemplate** の使用を開始する必要があります。 **Photoshop Change Text** ノードの入力ファイルの場所をハードコーディングする代わりに、Postman リクエストから受け取った変数を使用します。

**Photoshop Change Text** ノードを開き、**コンテンツをリクエスト** に移動します。 **inputs** の下のハードコードされたファイル名 **citisignal-fiber.psd** を選択して削除します。

![WF Fusion](./images/wffusion234.png)

変数 **psdTemplate** を選択します。 「**OK**」を選択し、シナリオを保存します。

![WF Fusion](./images/wffusion235.png)

「**オン**」を選択して、シナリオをオンにします。 シナリオがノンストップで実行されます。

![WF Fusion](./images/wffusion236.png)

Postmanに戻り、ファイル名 `citisignal-fiber.psd` を変数 **psdTemplate** の値として入力し、「**送信**」を再度選択してシナリオを再実行します。

![WF Fusion](./images/wffusion237.png)

PSD テンプレートを外部システムから提供される変数として指定することで、再利用可能なシナリオを構築できました。

これで、この演習を完了しました。

## 次の手順

コネクタを使用した [1.2.4 の自動化に進む ](./ex4.md){target="_blank"}

[Workfront Fusion のCreative Workflow Automation に戻る ](./automation.md){target="_blank"}

[ すべてのモジュール ](./../../../overview.md){target="_blank"} に戻る
