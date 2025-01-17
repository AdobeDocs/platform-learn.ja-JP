---
title: Microsoft Azure と事前署名済み URL を使用したFireflyプロセスの最適化
description: Microsoft Azure と事前署名済み URL を使用したFireflyプロセスの最適化
kt: 5342
doc-type: tutorial
exl-id: 5f9803a4-135c-4470-bfbb-a298ab1fee33
source-git-commit: 2fe7d2528132301f559f9d51faa9ad128f5d890f
workflow-type: tm+mt
source-wordcount: '1527'
ht-degree: 1%

---

# 1.1.2 Microsoft Azure と事前署名済み URL を使用したFireflyプロセスの最適化

## 1.1.2.1 Azure サブスクリプションの作成

>[!NOTE]
>
>既存の Azure サブスクリプションがある場合は、この手順をスキップできます。 その場合は次の演習に進んでください。

[https://portal.azure.com](https://portal.azure.com){target="_blank"} に移動し、Azure アカウントでログインします。 お持ちでない場合は、個人の電子メール アドレスを使用して Azure アカウントを作成してください。

![Azure ストレージ ](./images/02azureportalemail.png)

ログインに成功すると、次の画面が表示されます。

![Azure ストレージ ](./images/03azureloggedin.png)

左側のメニューをクリックして **すべてのリソース** を選択すると、まだ購読していない場合は Azure サブスクリプション画面が表示されます。 その場合は、「**Azure 無料体験版で開始** を選択します。

![Azure ストレージ ](./images/04azurestartsubscribe.png)

Azure サブスクリプションフォームに入力し、アクティベーション用に携帯電話とクレジットカードを提供します（30 日間無料の層があり、アップグレードしない限り請求されません）。

購読プロセスが完了したら、次の操作を実行できます。

![Azure ストレージ ](./images/06azuresubscriptionok.png)

## 1.1.2.2 Azure ストレージアカウントの作成

`storage account` を検索し、「**ストレージアカウント**」をクリックします。

![Azure ストレージ ](./images/azs1.png)

「**+作成**」をクリックします。

![Azure ストレージ ](./images/azs2.png)

次の詳細を入力します。

- **サブスクリプション** を選択します
- **リソースグループ** を選択（または作成）
- **ストレージアカウント名**：使用 `--aepUserLdap--`

**レビューして作成** をクリックします。

![Azure ストレージ ](./images/azs3.png)

「**作成**」をクリックします。

![Azure ストレージ ](./images/azs4.png)

その後、同様の確認が表示されます。 「**リソースに移動**」をクリックします。

![Azure ストレージ ](./images/azs5.png)

これで、Azure ストレージアカウントを使用する準備が整いました。

![Azure ストレージ ](./images/azs6.png)

**データストレージ** をクリックし、**コンテナ** に移動します。 「**+ コンテナ**」をクリックします。

![Azure ストレージ ](./images/azs7.png)

名前には、`--aepUserLdap--` を使用します。 「**作成**」をクリックします。

![Azure ストレージ ](./images/azs8.png)

これで、コンテナを使用する準備が整いました。

![Azure ストレージ ](./images/azs9.png)

## 1.1.2.3 Azure ストレージエクスプローラーのインストール

Microsoft Azure ストレージエクスプローラーを使用してファイルを管理します。 [ このリンク ](https://azure.microsoft.com/en-us/products/storage/storage-explorer#Download-4){target="_blank"} からダウンロードできます。 特定の OS に適したバージョンを選択し、ダウンロードしてインストールします。

![Azure ストレージ ](./images/az10.png)

アプリケーションをインストールしたら、開きます。 これに類似したものが表示されます。 **Azure でログイン** をクリックします。

![Azure ストレージ ](./images/az11.png)

**購読** をクリックします。

![Azure ストレージ ](./images/az12.png)

**Azure** を選択して、「**次へ**」をクリックします。

![Azure ストレージ ](./images/az13.png)

Microsoft Azure アカウントを選択し、認証プロセスを完了します。

![Azure ストレージ ](./images/az14.png)

認証が完了すると、次のようなメッセージが表示されます。

![Azure ストレージ ](./images/az15.png)

Microsoft Azure ストレージエクスプローラーアプリに戻ります。 サブスクリプションを選択し、**エクスプローラーを開く** をクリックします。

>[!NOTE]
>
>アカウントが表示されない場合は、メールアドレスの横にある **歯車** アイコンをクリックし、「**フィルター解除**」を選択します。

![Azure ストレージ ](./images/az16.png)

ストレージアカウントは、「**ストレージアカウント** の下にあります。

![Azure ストレージ ](./images/az17.png)

**Blob コンテナ** を開き、前の演習で作成したコンテナをクリックします。

![Azure ストレージ ](./images/az18.png)

## 1.1.2.4 手動によるファイルのアップロードと、画像ファイルをスタイル参照として使用する

これで、任意の画像ファイルをコンテナにアップロードできるようになりました。 任意の画像ファイルを使用するか、コンピューターにダウンロードして [ このファイル ](./images/gradient.jpg){target="_blank"} を使用できます。

![Azure ストレージ ](./images/gradient.jpg)

Azure ストレージエクスプローラーで、画像ファイルをコンテナにドロップします。

アップロードが完了すると、コンテナに表示されます。

![Azure ストレージ ](./images/az19.png)

ファイル `gradient.jpg` を右クリックし、[**共有アクセス署名の取得**] をクリックします。

![Azure ストレージ ](./images/az20.png)

**権限** では、**読み取り** のみが必要です。 「**作成**」をクリックします。

![Azure ストレージ ](./images/az21.png)

その後、この画像ファイルの事前署名済み URL が表示されます。 Fireflyへの次の API リクエストで必要になるので、これをコピーします。

![Azure ストレージ ](./images/az22.png)

Postmanに戻ります。 リクエスト **POST-Firefly- T2I （styleref） V3** を開きます。 その後、これは **本文** に表示されます。

![Azure ストレージ ](./images/az23.png)

プレースホルダー URL を、Azure ストレージエクスプローラーからコピーした、画像ファイルの事前署名済み URL に置き換えます。 これで完了です。 「**送信**」をクリックします。

![Azure ストレージ ](./images/az24.png)

その後、Fireflyサービスから新しい画像と共に応答が返されます。 ブラウザーで画像ファイルを開きます。

![Azure ストレージ ](./images/az25.png)

`horses in a field` を含む別の画像が表示されますが、今回はスタイルはスタイル参照として指定した画像ファイルに類似しています。

![Azure ストレージ ](./images/az26.png)

## 1.1.2.5 プログラムによるファイルのアップロード

Azure ストレージアカウントでプログラムによるファイルのアップロードを使用するには、ファイルを書き込むための権限を持つ新しい **共有アクセス署名（SAS）** トークンを作成する必要があります。

これを行うには、Azure ストレージエクスプローラーに戻ります。 コンテナを右クリックし、[**共有アクセス署名の取得**] をクリックします。

![Azure ストレージ ](./images/az27.png)

**権限** には、次の権限が必要です。

- **読取り**
- **追加**
- **作成**
- **Write**
- **リスト**

「**作成**」をクリックします。

![Azure ストレージ ](./images/az28.png)

その後、**SAS-token** を取得します。 **コピー** をクリックします。

![Azure ストレージ ](./images/az29.png)

これで、この **SAS-token** を使用して、Azure ストレージアカウントにファイルをアップロードできるようになりました。 Postmanに戻ってそれをやりなさい。

**FF - Fireflyサービステクニカルインサイダー** をクリックしてフォルダーを選択し、フォルダー **Fireflyの 3 つのドット**...**をクリックして** 「**リクエストを追加**」をクリックします。

![Azure ストレージ ](./images/az30.png)

すると、空のリクエストが作成されます。 リクエストの名前を **Azure ストレージアカウントにファイルをアップロード** に変更し、**リクエストタイプ** を **PUT** に変更して、「URL」セクションに SAS-token URL を貼り付けます。

次に、**本文** をクリックします。

![Azure ストレージ ](./images/az31.png)

ローカルマシンからファイルを選択する必要があります。 任意の新しい画像ファイルを使用するか、[ こちら ](./images/gradient2-p.jpg){target="_blank"} にある別の画像ファイルを使用できます。

![ グラデーション ファイル ](./images/gradient2-p.jpg)

**本文** で **バイナリ** を選択して **ファイルを選択** をクリックし、「**+ ローカルマシンからの新しいファイル**」をクリックします。

![Azure ストレージ ](./images/az32.png)

任意のファイルを選択し、「**開く**」をクリックします。

![Azure ストレージ ](./images/az33.png)

その後、これが表示されます。 次に、Azure ストレージアカウントで使用するファイル名を指定します。 これを行うには、疑問符 **の前にカーソルを置く必要がありますか？URL を** します。 現在のところ、このは次の場所で確認できます。

![Azure ストレージ ](./images/az34.png)

URL は現在このようになっていますが、変更する必要があります。

`https://vangeluw.blob.core.windows.net/vangeluw?sv=2023-01-03...`

使用するファイル名は `gradient2-p.jpg` です。つまり、次のように、URL を変更してファイル名を含める必要があります。

`https://vangeluw.blob.core.windows.net/vangeluw/gradient2-p.jpg?sv=2023-01-03...`

![Azure ストレージ ](./images/az34a.png)

次に、**ヘッダー** に移動し、新しいヘッダーを手動で追加する必要があります。 次を使用します。

| キー | 値 |
|:-------------:| :---------------:| 
| `x-ms-blob-type` | `BlockBlob` |


![Azure ストレージ ](./images/az35.png)

**認証** に移動し、**認証タイプ** を **認証なし** に設定します。 「**送信**」をクリックします。

![Azure ストレージ ](./images/az36.png)

Postmanに、この空の応答が表示されます。つまり、ファイルのアップロードが正常に完了しました。

![Azure ストレージ ](./images/az37.png)

Azure ストレージエクスプローラーに戻り、フォルダーのコンテンツを更新すると、新しくアップロードされたファイルがそこに表示されます。

![Azure ストレージ ](./images/az38.png)

## 1.1.2.6 プログラムによるファイル利用

Azure ストレージアカウントからプログラムによってファイルを読み取りを使用するには、ファイルを読み取ることができる権限を持つ新しい **共有アクセス署名（SAS）** トークンを作成する必要があります。 前の演習で作成した SAS トークンを技術的に使用できますが、**読み取り** 権限のみを持つ別のトークンと、**書き込み** 権限のみを持つ別のトークンを用意することをお勧めします。

### 長期読み取り SAS トークン

これを行うには、Azure ストレージエクスプローラーに戻ります。 コンテナを右クリックし、[**共有アクセス署名の取得**] をクリックします。

![Azure ストレージ ](./images/az27.png)

**権限** には、次の権限が必要です。

- **読取り**
- **リスト**

**有効期限** を今から 1 年後に設定します。

「**作成**」をクリックします。

![Azure ストレージ ](./images/az100.png)

その後、読み取り権限を持つ長期 SAS トークンを取得します。 URL をコピーして、コンピューター上のファイルに書き留めます。

![Azure ストレージ ](./images/az101.png)

URL は次のようになります：

`https://vangeluw.blob.core.windows.net/vangeluw?sv=2023-01-03&st=2025-01-13T07%3A36%3A35Z&se=2026-01-14T07%3A36%3A00Z&sr=c&sp=rl&sig=4r%2FcSJLlt%2BSt9HdFdN0VzWURxRK6UqhB8TEvbWkmAag%3D`

上記の URL から、いくつかの値を取得できます。

- `AZURE_STORAGE_URL`：`https://vangeluw.blob.core.windows.net`
- `AZURE_STORAGE_CONTAINER`：`vangeluw`
- `AZURE_STORAGE_SAS_READ`：`?sv=2023-01-03&st=2025-01-13T07%3A36%3A35Z&se=2026-01-14T07%3A36%3A00Z&sr=c&sp=rl&sig=4r%2FcSJLlt%2BSt9HdFdN0VzWURxRK6UqhB8TEvbWkmAag%3D`

### 長期書き込み SAS トークン

これを行うには、Azure ストレージエクスプローラーに戻ります。 コンテナを右クリックし、[**共有アクセス署名の取得**] をクリックします。

![Azure ストレージ ](./images/az27.png)

**権限** には、次の権限が必要です。

- **追加**
- **作成**
- **Write**

**有効期限** を今から 1 年後に設定します。

「**作成**」をクリックします。

![Azure ストレージ ](./images/az102.png)

その後、読み取り権限を持つ長期 SAS トークンを取得します。 URL をコピーして、コンピューター上のファイルに書き留めます。

![Azure ストレージ ](./images/az103.png)

URL は次のようになります：

`https://vangeluw.blob.core.windows.net/vangeluw?sv=2023-01-03&st=2025-01-13T07%3A38%3A59Z&se=2026-01-14T07%3A38%3A00Z&sr=c&sp=acw&sig=lR9%2FMUfyYLcBK7W9Kv7YJdYz5HEEEovExAdOCOCUdMk%3D`

ここでも、上記の URL から複数の値を取得できます。

- `AZURE_STORAGE_URL`：`https://vangeluw.blob.core.windows.net`
- `AZURE_STORAGE_CONTAINER`：`vangeluw`
- `AZURE_STORAGE_SAS_READ`：`?sv=2023-01-03&st=2025-01-13T07%3A36%3A35Z&se=2026-01-14T07%3A36%3A00Z&sr=c&sp=rl&sig=4r%2FcSJLlt%2BSt9HdFdN0VzWURxRK6UqhB8TEvbWkmAag%3D`
- `AZURE_STORAGE_SAS_WRITE`：`?sv=2023-01-03&st=2025-01-13T07%3A38%3A59Z&se=2026-01-14T07%3A38%3A00Z&sr=c&sp=acw&sig=lR9%2FMUfyYLcBK7W9Kv7YJdYz5HEEEovExAdOCOCUdMk%3D`

### Postmanの変数

上記の節でわかるように、読み取りトークンと書き込みトークンの両方に共通の変数がいくつかあります。

次に、上記の SAS トークンの様々な要素を格納する変数をPostmanで作成する必要があります。
両方の URL で同じ値がいくつか存在します。

- `AZURE_STORAGE_URL`：`https://vangeluw.blob.core.windows.net`
- `AZURE_STORAGE_CONTAINER`：`vangeluw`
- `AZURE_STORAGE_SAS_READ`：`?sv=2023-01-03&st=2025-01-13T07%3A36%3A35Z&se=2026-01-14T07%3A36%3A00Z&sr=c&sp=rl&sig=4r%2FcSJLlt%2BSt9HdFdN0VzWURxRK6UqhB8TEvbWkmAag%3D`
- `AZURE_STORAGE_SAS_WRITE`：`?sv=2023-01-03&st=2025-01-13T07%3A38%3A59Z&se=2026-01-14T07%3A38%3A00Z&sr=c&sp=acw&sig=lR9%2FMUfyYLcBK7W9Kv7YJdYz5HEEEovExAdOCOCUdMk%3D`

今後の API インタラクションでは、主に変更されるのはアセット名ですが、上記の変数は変わりません。 その場合、変数をPostmanで作成すると、毎回手動で指定する必要がなくなるので便利です。

それには、Postmanを開きます。 **環境** アイコンをクリックし、**すべての変数** メニューを開いて、**環境** をクリックします。

![Azure ストレージ ](./images/az104.png)

次に、これを確認します。 表示されるテーブルにこれらの 4 つの変数を作成し、列 **初期値** および **現在の値** に対して、特定の個人の値を入力します。

- `AZURE_STORAGE_URL`：自分の url
- `AZURE_STORAGE_CONTAINER`：コンテナ名
- `AZURE_STORAGE_SAS_READ`:SAS 読み取りトークン
- `AZURE_STORAGE_SAS_WRITE`:SAS 書き込みトークン

「**保存**」をクリックします。

![Azure ストレージ ](./images/az105.png)

前の演習の 1 つで、リクエスト **2}Firefly- T2I （styleref） V3** の **本文」は次のようになります。**

`"url": "https://vangeluw.blob.core.windows.net/vangeluw/gradient.jpg?sv=2023-01-03&st=2025-01-13T07%3A16%3A52Z&se=2026-01-14T07%3A16%3A00Z&sr=b&sp=r&sig=x4B1XZuAx%2F6yUfhb28hF0wppCOMeH7Ip2iBjNK5A%2BFw%3D"`

![Azure ストレージ ](./images/az24.png)

これで、URL を次のように変更できます。

`"url": "{{AZURE_STORAGE_URL}}/{{AZURE_STORAGE_CONTAINER}}/gradient.jpg{{AZURE_STORAGE_SAS_READ}}"`

「**送信**」をクリックして、加えた変更をテストします。

![Azure ストレージ ](./images/az106.png)

変数が正しい方法で設定されている場合は、画像 URL が返されます。

![Azure ストレージ ](./images/az107.png)

画像 URL を開いて画像を確認します。

![Azure ストレージ ](./images/az108.jpg)

次の手順：[1.1.3 Adobe FireflyおよびAdobe Photoshop](./ex3.md){target="_blank"}

[ モジュール 1.1 に戻る ](./firefly-services.md){target="_blank"}

[ すべてのモジュールに戻る ](./../../../overview.md){target="_blank"}
