---
title: Fireflyサービスの概要
description: Fireflyサービスの概要
kt: 5342
doc-type: tutorial
exl-id: 1b7b2630-864f-4982-be5d-c46b760739c3
source-git-commit: 0fe4bbf6bcc80d4fa88bc30718a1de6621f93f17
workflow-type: tm+mt
source-wordcount: '853'
ht-degree: 0%

---

# 1.2.3 Workfront Fusion によるプロセスの自動化

シナリオは次のようになります。

![WF Fusion](./images/wffusion200.png)

## 1.2.3.1 複数の値の反復処理

これまでに、Photoshop ファイルのテキストを静的な値で変更しました。 コンテンツ作成ワークフローを拡張および自動化するには、値のリストを繰り返し処理し、それらの値をPhotoshop ファイルに動的に挿入する必要があります。 次の手順では、既存のシナリオの値を繰り返し処理するウィジェットを追加します。

**ルーター** ノードと **Photoshop Change Text** ノードの間にある **レンチ** アイコンをクリックし、「**モジュールを追加**」を選択します。

![WF Fusion](./images/wffusion201.png)

`flow` を検索し、「**フロー制御**」を選択します。

![WF Fusion](./images/wffusion202.png)

**イテレータ** を選択します。

![WF Fusion](./images/wffusion203.png)

これで完了です。

![WF Fusion](./images/wffusion204.png)

CSV ファイルなどの入力ファイルは読み取ることができますが、現時点では、テキスト文字列を定義してテキストファイルを分割することで、基本的なバージョンの CSV ファイルを使用する必要があります。

**split** 関数を検索するには、「**T**」アイコンをクリックします。このアイコンには、テキスト値を操作するために使用できるすべての関数が表示されます。 **split** 関数をクリックすると、これが表示されます。

![WF Fusion](./images/wffusion206.png)

split 関数では、セミコロンの前に値の配列を指定し、セミコロンの後に区切り記号を指定する必要があります。 このテストでは、**今すぐ購入** と **ここをクリック** の 2 つのフィールドを持つ単純な配列を使用する必要があり、使用する区切り記号は **,** です。

現在空の **split** 関数 `{{split("Buy now, Click here "; ",")}}` を置き換えて、**配列** フィールドにこれを入力します。 「**OK**」をクリックします。

![WF Fusion](./images/wffusion205.png)

これでイテレータが設定され、ここでシナリオを実行すると、2 回実行されます。 現在、**Photoshop Change Text** ノードで静的な値を使用しているので、まだ問題が解決していません。 入力および出力フィールドに静的な値ではなく一部の変数を追加するには、**Photoshop テキストを変更** をクリックします。

![WF Fusion](./images/wffusion207.png)

**コンテンツをリクエスト** に、「ここをクリック **というテキストが表示され** す。 このテキストは、配列から取得した値で置き換える必要があります。

![WF Fusion](./images/wffusion208.png)

テキスト **ここをクリック** を削除し、「**Iterator**」ノードから変数 **Value** を選択して置き換えます。 これにより、Photoshop ドキュメントのボタンに表示されるテキストが動的に更新されます。

![WF Fusion](./images/wffusion209.png)

また、Azure ストレージアカウントにファイルを書き込むために使用されるファイル名を更新する必要もあります。 ファイル名が静的な場合、新しいイテレーションでは単に前のファイルが上書きされるので、カスタマイズされたファイルは失われます。 現在の静的ファイル名は **sevoi-psd-changed-text.psd** なので、これを更新する必要があります。 カーソルを `text` という単語の後ろに置きます。

![WF Fusion](./images/wffusion210.png)

最初にハイフン `-` を追加し、次に値 **バンドルの順序** を選択します。 Workfrontこれにより、1 回目のイテレーションではファイル名に `-1` が追加され、2 回目のイテレーションでは `-2` が追加されます。 「**OK**」をクリックします。

![WF Fusion](./images/wffusion211.png)

シナリオを保存し、「**1 回実行**」をクリックします。

![WF Fusion](./images/wffusion212.png)

シナリオが実行されたら、Azure ストレージエクスプローラーに戻り、フォルダーを更新します。 新しく作成された 2 つのファイルが表示されます。

![WF Fusion](./images/wffusion213.png)

ファイルをダウンロードして開きます。 その後、ボタン上の様々なテキストが表示されます。 これはファイル `sevoi-psd-changed-text-1.psd` です。

![WF Fusion](./images/wffusion214.png)

これはファイル `sevoi-psd-changed-text-2.psd` です。

![WF Fusion](./images/wffusion215.png)

## 1.2.3.2 Webhook を使用してシナリオをアクティブにする

これまでのところ、シナリオを手動で実行してテストしてきました。 次に、Webhook を使用してシナリオを更新し、外部環境からアクティブ化できるようにします。

**+** アイコンをクリックし、**webhook** を検索して **Webhook** を選択します。

![WF Fusion](./images/wffusion216.png)

**Custom Webhook** を選択します。

**Custom Webhook** ノードをドラッグして接続し、キャンバスの最初のノード（**Initialize Constants** と呼ばれる）に接続します。

![WF Fusion](./images/wffusion217.png)

**Custom Webhook** ノードをクリックします。 次に、「**追加** をクリックします。

![WF Fusion](./images/wffusion218.png)

**Webhook 名** を `--aepUserLdap-- - Tutorial 1.2` に設定します。

![WF Fusion](./images/wffusion219.png)

**リクエストヘッダーを取得** のチェックボックスをオンにします。 「**保存**」をクリックします。

![WF Fusion](./images/wffusion220.png)

これで、Webhook URL が使用できるようになります。 URL をコピーします。

![WF Fusion](./images/wffusion221.png)

Postmanを開き、コレクションに新しいフォルダーを追加します **FF - Fireflyサービステクニカルインサイダー**。

![WF Fusion](./images/wffusion222.png)

フォルダーに `--aepUserLdap-- - Workfront Fusion` という名前を付けます。

![WF Fusion](./images/wffusion223.png)

作成したフォルダーで、3 つのドット **...** をクリックし、「**リクエストを追加**」を選択します。

![WF Fusion](./images/wffusion224.png)

**POSTタイプ** を **メソッド** に設定し、Webhook の URL をアドレスバーに貼り付けます。

![WF Fusion](./images/wffusion225.png)

変数要素を外部ソースからWorkfront Fusion シナリオに提供できるように、カスタム本文を送信する必要があります。 **本文** に移動し、「**生**」を選択します。

![WF Fusion](./images/wffusion226.png)

以下のテキストをリクエストの本文に貼り付けます。 「**送信**」をクリックします。

```json
{
    "psdTemplate": "placeholder",
    "xlsFile": "placeholder"
}
```

![WF Fusion](./images/wffusion229.png)

Workfront Fusion に戻ります。 これで、カスタム Webhook に、「**正常に決定されました** というメッセージが表示されます。

![WF Fusion](./images/wffusion227.png)

「**保存**」をクリックしてから、「**1 回実行**」をクリックします。 これで、シナリオはアクティブになりますが、Postmanで「**送信**」を再度クリックするまで実行されません。

![WF Fusion](./images/wffusion230.png)

Postmanに移動し、「**送信** を再度クリックします。

![WF Fusion](./images/wffusion228.png)

シナリオが再度実行され、前と同じように 2 つのファイルが作成されます。

![WF Fusion](./images/wffusion232.png)

続行する前に、Postman リクエストの名前を `POST - Send Request to Workfront Fusion Webhook` に変更します。

![WF Fusion](./images/wffusion233.png)


次の手順：[ 概要とメリット ](./summary.md)

[モジュール 1.2 に戻る](./automation.md)

[すべてのモジュールに戻る](./../../../overview.md)
