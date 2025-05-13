---
title: Microsoft Azure と事前署名済み URL を使用したFirefly プロセスの最適化
description: Microsoft Azure と事前署名済み URL を使用してFirefly プロセスを最適化する方法について説明します
role: Developer
level: Beginner
jira: KT-5342
doc-type: tutorial
exl-id: 5f9803a4-135c-4470-bfbb-a298ab1fee33
source-git-commit: da6917ec8c4e863e80eef91280e46b20816a5426
workflow-type: tm+mt
source-wordcount: '1438'
ht-degree: 1%

---

# 1.1.2 Microsoft Azure と事前署名済み URL を使用したFirefly プロセスの最適化

Microsoft Azure と事前署名済み URL を使用してFirefly プロセスを最適化する方法について説明します。

## 1.1.2.1 Azure サブスクリプションを作成するには

>[!NOTE]
>
>既存の Azure サブスクリプションがある場合は、この手順をスキップできます。 その場合は次の演習に進んでください。

[https://portal.azure.com](https://portal.azure.com){target="_blank"} に移動し、Azure アカウントでログインします。 お持ちでない場合は、個人の電子メール アドレスを使用して Azure アカウントを作成してください。

![Azure ストレージ ](./images/02azureportalemail.png){zoomable="yes"}

ログインに成功すると、次の画面が表示されます。

![Azure ストレージ ](./images/03azureloggedin.png){zoomable="yes"}

左側のメニューで **すべてのリソース** を選択すると、まだ購読していない場合は Azure サブスクリプション画面が表示されます。

まだ購読していない場合は、「**Azure 無料体験版で開始**」を選択します。

![Azure ストレージ ](./images/04azurestartsubscribe.png){zoomable="yes"}

Azure のサブスクリプションフォームに入力し、アクティベーション用に携帯電話とクレジットカードを提供します（30 日間無料利用枠があり、アップグレードしない限り料金は発生しません）。

購読プロセスが完了したら、問題ありません。

![Azure ストレージ ](./images/06azuresubscriptionok.png){zoomable="yes"}

## 1.1.2.2 Azure ストレージアカウントを作成するには

`storage account` を検索し、「**ストレージアカウント**」を選択します。

![Azure ストレージ ](./images/azs1.png){zoomable="yes"}

「**+作成**」を選択します。

![Azure ストレージ ](./images/azs2.png){zoomable="yes"}

**サブスクリプション** を選択し、**リソースグループ** を選択（または作成）します。

**ストレージアカウント名** で `--aepUserLdap--` を使用します。

「**レビューと作成**」を選択します。

![Azure ストレージ ](./images/azs3.png){zoomable="yes"}

「**作成**」を選択します。

![Azure ストレージ ](./images/azs4.png){zoomable="yes"}

確認後、「**リソースに移動**」を選択します。

![Azure ストレージ ](./images/azs5.png){zoomable="yes"}

これで、Azure ストレージアカウントを使用する準備が整いました。

![Azure ストレージ ](./images/azs6.png){zoomable="yes"}

**データストレージ** を選択し、**コンテナ** に移動します。 「**+ コンテナ**」を選択します。

![Azure ストレージ ](./images/azs7.png){zoomable="yes"}

名前に `--aepUserLdap--` を使用し、「作成 **を選択し** す。

![Azure ストレージ ](./images/azs8.png){zoomable="yes"}

これで、コンテナを使用する準備が整いました。

![Azure ストレージ ](./images/azs9.png){zoomable="yes"}

## 1.1.2.3 Azure ストレージエクスプローラーのインストール

[Microsoft Azure ストレージエクスプローラーをダウンロードしてファイルを管理 ](https://azure.microsoft.com/en-us/products/storage/storage-explorer#Download-4){target="_blank"} ます。 特定の OS に適したバージョンを選択し、ダウンロードしてインストールします。

![Azure ストレージ ](./images/az10.png){zoomable="yes"}

アプリケーションを開き、「**Azure でログイン**」を選択します。

![Azure ストレージ ](./images/az11.png){zoomable="yes"}

**購読** を選択します。

![Azure ストレージ ](./images/az12.png){zoomable="yes"}

**Azure** を選択してから **次へ** を選択します。

![Azure ストレージ ](./images/az13.png){zoomable="yes"}

Microsoft Azure アカウントを選択し、認証プロセスを完了します。

![Azure ストレージ ](./images/az14.png){zoomable="yes"}

認証後、このメッセージが表示されます。

![Azure ストレージ ](./images/az15.png){zoomable="yes"}

Microsoft Azure ストレージエクスプローラーアプリに戻り、サブスクリプションを選択して **エクスプローラーを開く** を選択します。

>[!NOTE]
>
>アカウントが表示されない場合は、メールアドレスの横にある **歯車** アイコンをクリックし、「**フィルター解除**」を選択します。

![Azure ストレージ ](./images/az16.png){zoomable="yes"}

ストレージアカウントは、「**ストレージアカウント** の下に表示されます。

![Azure ストレージ ](./images/az17.png){zoomable="yes"}

**Blob コンテナ** を開き、前の演習で作成したコンテナを選択します。

![Azure ストレージ ](./images/az18.png){zoomable="yes"}

## 1.1.2.4 手動でのファイルのアップロードと、スタイル参照としての画像ファイルの使用

選択した画像ファイルまたは [ このファイル ](./images/gradient.jpg){target="_blank"} をコンテナにアップロードします。

![Azure ストレージ ](./images/gradient.jpg)

アップロードが完了すると、コンテナに表示されます。

![Azure ストレージ ](./images/az19.png){zoomable="yes"}

`gradient.jpg` を右クリックして、「**共有アクセス署名の取得**」を選択します。

![Azure ストレージ ](./images/az20.png){zoomable="yes"}

**権限** では、**読み取り** のみが必要です。 「**作成**」を選択します。

![Azure ストレージ ](./images/az21.png){zoomable="yes"}

Fireflyへの次の API リクエストで、この画像ファイルの事前署名済み URL をコピーします。

![Azure ストレージ ](./images/az22.png){zoomable="yes"}

Postmanに戻り、リクエスト **POST - Firefly - T2I （styleref） V3** を開きます。
これは **本文** に表示されます。

![Azure ストレージ ](./images/az23.png){zoomable="yes"}

プレースホルダーの URL を画像ファイルの事前署名済み URL に置き換えて、「**送信**」を選択します。

![Azure ストレージ ](./images/az24.png){zoomable="yes"}

ブラウザーで応答のFirefly Servicesの新しい画像を開きます。

![Azure ストレージ ](./images/az25.png){zoomable="yes"}

別の画像には `horses in a field` が表示されますが、今回はスタイル参照として指定した画像ファイルとスタイルが似ています。

![Azure ストレージ ](./images/az26.png){zoomable="yes"}

## 1.1.2.5 プログラムによるファイルのアップロード

Azure ストレージアカウントでプログラムによるファイルのアップロードを使用するには、ファイルを書き込むための権限を持つ新しい **共有アクセス署名（SAS）** トークンを作成する必要があります。

Azure ストレージエクスプローラーで、コンテナを右クリックし、「**共有アクセス署名の取得**」を選択します。

![Azure ストレージ ](./images/az27.png){zoomable="yes"}

**権限** で、次の必要な権限を選択します。

- **読取り**
- **追加**
- **作成**
- **Write**
- **リスト**

「**作成**」を選択します。

![Azure ストレージ ](./images/az28.png){zoomable="yes"}

**共有アクセス署名** を受け取ったら、「**コピー**」を選択して URL をコピーします。

![Azure ストレージ ](./images/az29.png){zoomable="yes"}

**SAS-token** を使用して、Azure ストレージアカウントにファイルをアップロードします。

Postmanに戻り、フォルダー **FF - Firefly Services テクニカルインサイダー** を選択し、「**Firefly**」フォルダーで「**...**」を選択してから「**リクエストを追加**」を選択します。

![Azure ストレージ ](./images/az30.png){zoomable="yes"}

空のリクエストの名前を **Azure ストレージアカウントにファイルをアップロード** に変更し、**リクエストタイプ** を **PUT** に変更して、URL セクションに SAS-token URL を貼り付け、「**本文**」を選択します。

![Azure ストレージ ](./images/az31.png){zoomable="yes"}

次に、ローカルマシンからファイルを選択するか、[ こちら ](./images/gradient2-p.jpg){target="_blank"} にある別の画像ファイルを使用します。

![ グラデーション ファイル ](./images/gradient2-p.jpg)

**本文** で、「**バイナリ**」、「**ファイルを選択**」の順に選択し、「**+ ローカルマシンからの新しいファイル**」を選択します。

![Azure ストレージ ](./images/az32.png){zoomable="yes"}

目的のファイルを選択し、「**開く**」を選択します。

![Azure ストレージ ](./images/az33.png){zoomable="yes"}

次に、疑問符 **？の前にカーソルを置いて、Azure ストレージアカウントで使用するファイル名を指定しますURL で次のように** します。

![Azure ストレージ ](./images/az34.png){zoomable="yes"}

URL は現在このように表示されていますが、変更する必要があります。

`https://vangeluw.blob.core.windows.net/vangeluw?sv=2023-01-03...`

ファイル名を `gradient2-p.jpg` に変更し、URL を次のようなファイル名を含むように変更します。

`https://vangeluw.blob.core.windows.net/vangeluw/gradient2-p.jpg?sv=2023-01-03...`

![Azure ストレージ ](./images/az34a.png){zoomable="yes"}

次に、**ヘッダー** に移動して、次のように手動で新しいヘッダーを追加します。

| キー | 値 |
|:-------------:| :---------------:| 
| `x-ms-blob-type` | `BlockBlob` |


![Azure ストレージ ](./images/az35.png){zoomable="yes"}

**認証** に移動し、**認証タイプ** を **認証なし** に設定して、**送信** を選択します。

![Azure ストレージ ](./images/az36.png){zoomable="yes"}

次に、この空の応答がPostmanに表示され、ファイルのアップロードが問題ありません。

![Azure ストレージ ](./images/az37.png){zoomable="yes"}

Azure ストレージエクスプローラーに戻り、フォルダーのコンテンツを更新すると、新しくアップロードされたファイルが表示されます。

![Azure ストレージ ](./images/az38.png){zoomable="yes"}

## 1.1.2.6 プログラムによるファイル使用

Azure ストレージアカウントからプログラムによって長期的にファイルを読み取るには、ファイルを読み取ることができる権限を持つ新しい **共有アクセス署名（SAS）** トークンを作成する必要があります。 技術的には、前の演習で作成した SAS トークンを使用できますが、**読み取り** 権限のみを持つ別のトークンと、**書き込み** 権限のみを持つ別のトークンを用意することをお勧めします。

### 長期読み取り SAS トークン

Azure ストレージエクスプローラーに戻り、コンテナを右クリックして **共有アクセス署名の取得** を選択します。

![Azure ストレージ ](./images/az27.png){zoomable="yes"}

**権限** で、次の必要な権限を選択します。

- **読取り**
- **リスト**

**有効期限** を今から 1 年後に設定します。

「**作成**」を選択します。

![Azure ストレージ ](./images/az100.png){zoomable="yes"}

URL をコピーしてコンピューター上のファイルに書き留め、読み取り権限を持つ長期の SAS トークンを取得します。

![Azure ストレージ ](./images/az101.png){zoomable="yes"}

URL は次のようになります。

`https://vangeluw.blob.core.windows.net/vangeluw?sv=2023-01-03&st=2025-01-13T07%3A36%3A35Z&se=2026-01-14T07%3A36%3A00Z&sr=c&sp=rl&sig=4r%2FcSJLlt%2BSt9HdFdN0VzWURxRK6UqhB8TEvbWkmAag%3D`

上記の URL から、いくつかの値を取得できます。

- `AZURE_STORAGE_URL`：`https://vangeluw.blob.core.windows.net`
- `AZURE_STORAGE_CONTAINER`：`vangeluw`
- `AZURE_STORAGE_SAS_READ`：`?sv=2023-01-03&st=2025-01-13T07%3A36%3A35Z&se=2026-01-14T07%3A36%3A00Z&sr=c&sp=rl&sig=4r%2FcSJLlt%2BSt9HdFdN0VzWURxRK6UqhB8TEvbWkmAag%3D`

### 長期書き込み SAS トークン

Azure ストレージエクスプローラーに戻り、コンテナを右クリックして **共有アクセスの署名を取得** を選択します。

![Azure ストレージ ](./images/az27.png){zoomable="yes"}

**権限** で、次の必要な権限を選択します。

- **読取り**
- **リスト**
- **追加**
- **作成**
- **Write**

**有効期限** を今から 1 年後に設定します。

「**作成**」を選択します。

![Azure ストレージ ](./images/az102.png){zoomable="yes"}

URL をコピーしてコンピューター上のファイルに書き留め、読み取り権限を持つ長期の SAS トークンを取得します。

![Azure ストレージ ](./images/az103.png){zoomable="yes"}

URL は次のようになります。

`https://vangeluw.blob.core.windows.net/vangeluw?sv=2023-01-03&st=2025-01-13T07%3A38%3A59Z&se=2026-01-14T07%3A38%3A00Z&sr=c&sp=acw&sig=lR9%2FMUfyYLcBK7W9Kv7YJdYz5HEEEovExAdOCOCUdMk%3D`

上記の URL から、いくつかの値を取得できます。

- `AZURE_STORAGE_URL`：`https://vangeluw.blob.core.windows.net`
- `AZURE_STORAGE_CONTAINER`：`vangeluw`
- `AZURE_STORAGE_SAS_READ`：`?sv=2023-01-03&st=2025-01-13T07%3A36%3A35Z&se=2026-01-14T07%3A36%3A00Z&sr=c&sp=rl&sig=4r%2FcSJLlt%2BSt9HdFdN0VzWURxRK6UqhB8TEvbWkmAag%3D`
- `AZURE_STORAGE_SAS_WRITE`：`?sv=2023-01-03&st=2025-01-13T07%3A38%3A59Z&se=2026-01-14T07%3A38%3A00Z&sr=c&sp=acw&sig=lR9%2FMUfyYLcBK7W9Kv7YJdYz5HEEEovExAdOCOCUdMk%3D`

### Postmanの変数

上記の節でわかるように、読み取りトークンと書き込みトークンの両方に共通の変数がいくつかあります。

次に、上記の SAS トークンのさまざまな要素を格納する変数を、Postmanで作成する必要があります。 両方の URL で同じ値がいくつか存在します。

- `AZURE_STORAGE_URL`：`https://vangeluw.blob.core.windows.net`
- `AZURE_STORAGE_CONTAINER`：`vangeluw`
- `AZURE_STORAGE_SAS_READ`：`?sv=2023-01-03&st=2025-01-13T07%3A36%3A35Z&se=2026-01-14T07%3A36%3A00Z&sr=c&sp=rl&sig=4r%2FcSJLlt%2BSt9HdFdN0VzWURxRK6UqhB8TEvbWkmAag%3D`
- `AZURE_STORAGE_SAS_WRITE`：`?sv=2023-01-03&st=2025-01-13T07%3A38%3A59Z&se=2026-01-14T07%3A38%3A00Z&sr=c&sp=acw&sig=lR9%2FMUfyYLcBK7W9Kv7YJdYz5HEEEovExAdOCOCUdMk%3D`

今後の API インタラクションでは、上記の変数は変わらないが、主に変更されるのはアセット名です。 その場合、変数をPostmanで作成すると、毎回手動で指定する必要がなくなるので便利です。

Postmanで、「**環境**」を選択し、「**すべての変数**」を開いて「**環境**」を選択します。

![Azure ストレージ ](./images/az104.png){zoomable="yes"}

表示されるテーブルにこれらの 4 つの変数を作成し、列 **初期値** および **現在の値** に対して、特定の個人の値を入力します。

- `AZURE_STORAGE_URL`：自分の url
- `AZURE_STORAGE_CONTAINER`：コンテナ名
- `AZURE_STORAGE_SAS_READ`:SAS 読み取りトークン
- `AZURE_STORAGE_SAS_WRITE`:SAS 書き込みトークン

「**保存**」を選択します。

![Azure ストレージ ](./images/az105.png){zoomable="yes"}

### PostBuster の変数

上記の節でわかるように、読み取りトークンと書き込みトークンの両方に共通の変数がいくつかあります。

次に、上記の SAS トークンのさまざまな要素を格納する変数を PostBuster に作成する必要があります。 両方の URL で同じ値がいくつか存在します。

- `AZURE_STORAGE_URL`：`https://vangeluw.blob.core.windows.net`
- `AZURE_STORAGE_CONTAINER`：`vangeluw`
- `AZURE_STORAGE_SAS_READ`：`?sv=2023-01-03&st=2025-01-13T07%3A36%3A35Z&se=2026-01-14T07%3A36%3A00Z&sr=c&sp=rl&sig=4r%2FcSJLlt%2BSt9HdFdN0VzWURxRK6UqhB8TEvbWkmAag%3D`
- `AZURE_STORAGE_SAS_WRITE`：`?sv=2023-01-03&st=2025-01-13T07%3A38%3A59Z&se=2026-01-14T07%3A38%3A00Z&sr=c&sp=acw&sig=lR9%2FMUfyYLcBK7W9Kv7YJdYz5HEEEovExAdOCOCUdMk%3D`

PostBuster を開きます。 「**Base Environment**」を選択し、「**edit**」アイコンをクリックして Base Environment を開きます。

![Azure ストレージ ](./images/pbbe1.png)

次に、4 つの空の変数が表示されます。 Azure ストレージアカウントの詳細をここに入力します。

![Azure ストレージ ](./images/pbbe2.png)

ベース環境ファイルは次のようになります。 「**閉じる**」をクリックします。

![Azure ストレージ ](./images/pbbe3.png)

### 設定のテスト

前の演習の 1 つで、リクエスト **2&rbrace;Firefly - T2I （styleref） V3** の **本文」は次のようになります。**

`"url": "https://vangeluw.blob.core.windows.net/vangeluw/gradient.jpg?sv=2023-01-03&st=2025-01-13T07%3A16%3A52Z&se=2026-01-14T07%3A16%3A00Z&sr=b&sp=r&sig=x4B1XZuAx%2F6yUfhb28hF0wppCOMeH7Ip2iBjNK5A%2BFw%3D"`

![Azure ストレージ ](./images/az24.png){zoomable="yes"}

URL を次のように変更します。

`"url": "{{AZURE_STORAGE_URL}}/{{AZURE_STORAGE_CONTAINER}}/gradient.jpg{{AZURE_STORAGE_SAS_READ}}"`

「**送信**」を選択して、加えた変更をテストします。

![Azure ストレージ ](./images/az106.png){zoomable="yes"}

変数が正しく設定されている場合は、画像 URL が返されます。

![Azure ストレージ ](./images/az107.png){zoomable="yes"}

画像 URL を開いて画像を確認します。

![Azure ストレージ ](./images/az108.jpg)

## 次の手順

[Photoshop API の操作 ](./ex3.md){target="_blank"} に移動します。

[Adobe Firefly Servicesの概要 ](./firefly-services.md){target="_blank"} に戻る

[ すべてのモジュール ](./../../../overview.md){target="_blank"} に戻る