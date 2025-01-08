---
title: Fireflyサービスの概要
description: Fireflyサービスの概要
kt: 5342
doc-type: tutorial
exl-id: 52385c33-f316-4fd9-905f-72d2d346f8f5
source-git-commit: 608fc570f9aa172db3578664e793f35fb3f1bf50
workflow-type: tm+mt
source-wordcount: '929'
ht-degree: 1%

---

# 1.1.1 Fireflyサービスの概要

この演習では、PostmanとAdobe I/Oを使用して、Adobe Fireflyサービス API に対してクエリを実行します。

## Adobe I/Oプロジェクトの設定

この演習では、Adobe I/Oを非常に集中的に使用して、Fireflyサービス API に対してクエリを実行します。 以下の手順に従って、Adobe I/Oを設定してください。

[https://developer.adobe.com/console/home](https://developer.adobe.com/console/home) に移動します

![Adobe I/Oの新規統合 ](./images/iohome.png)

画面の右上隅で正しいインスタンスを選択してください。 インスタンスは `--aepImsOrgName--` です。 **新規プロジェクトを作成** をクリックします。

![Adobe I/Oの新規統合 ](./images/iocomp.png)

「**+ プロジェクトに追加**」を選択し、「**API**」を選択します。

![Adobe I/Oの新規統合 ](./images/adobe_io_access_api.png)

次の画面が表示されます。

![Adobe I/Oの新規統合 ](./images/api1.png)

「**Creative Cloud**」を選択し、「**Firefly- Fireflyサービス**」をクリックします。 「**次へ**」をクリックします。

![Adobe I/Oの新規統合 ](./images/api3.png)

この画面が表示されます。 資格情報の名前を指定：`--aepUserLdap-- - Firefly Services OAuth credential`。 「**次へ**」をクリックします。

![Adobe I/Oの新規統合 ](./images/api4.png)

次に、この統合で使用できる権限を定義する製品プロファイルを選択する必要があります。

プロファイル **デフォルトのFireflyサービス設定** を選択します。

**設定済み API を保存** をクリックします。

![Adobe I/Oの新規統合 ](./images/api9.png)

これで、Adobe I/Oの統合の準備が整いました。

![Adobe I/Oの新規統合 ](./images/api11.png)

「**Postman用にダウンロード**」ボタンをクリックし、「**OAuth サーバー間**」をクリックしてPostman環境をダウンロードします。

![Adobe I/Oの新規統合 ](./images/iopm.png)

IO プロジェクトには現在、汎用名があります。 統合にはわかりやすい名前を付ける必要があります。 示されているように、**プロジェクト X** （または類似の名前）をクリックします

![Adobe I/Oの新規統合 ](./images/api13.png)

**プロジェクトを編集** をクリックします。

![Adobe I/Oの新規統合 ](./images/api14.png)

統合の名前を入力します：`--aepUserLdap-- Firefly`

「**保存**」をクリックします。

![Adobe I/Oの新規統合 ](./images/api15.png)

これで、Adobe I/O統合の設定が完了しました。

![Adobe I/Oの新規統合 ](./images/api16.png)

## Adobe I/Oに対するPostman認証

[https://www.postman.com/downloads/](https://www.postman.com/downloads/) に移動します。

お使いの OS に関連するバージョンのPostmanをダウンロードしてインストールします。

![Adobe I/Oの新規統合 ](./images/getstarted.png)

Postmanをインストールしたら、アプリケーションを起動します。

Postmanには、環境とコレクションという 2 つのコンセプトがあります。

- 環境ファイルには、多かれ少なかれ一貫性のあるすべての環境変数が含まれています。 環境には、クライアント ID などのセキュリティ認証情報と共に、Adobe環境の IMSOrg などが表示されます。 環境ファイルは、前の演習でのAdobe I/O設定時にダウンロードしたファイルで、**`oauth_server_to_server.postman_environment.json`** のような名前になっています。

- コレクションには、使用可能な多数の API リクエストが含まれています。 2 つのコレクションを使用します
   - Adobe I/Oへの認証のための 1 つのコレクション
   - このモジュールの演習の 1 つのコレクション

[postman.zip](./../../../assets/postman/postman-ff.zip) ファイルをローカルデスクトップにダウンロードしてください。

![Adobe I/Oの新規統合 ](./images/pmfolder.png)

この **postman.zip** ファイルには、次のファイルがあります。

- `Adobe IO - OAuth.postman_collection.json`
- `FF - Firefly Services Tech Insiders.postman_collection.json`

**postman-ff.zip** ファイルを解凍し、これらの 2 つのファイルをダウンロードしたPostmanAdobe I/O環境と共に、デスクトップのフォルダーに保存します。このフォルダーはファイル `oauth_server_to_server.postman_environment.json` です。 そのフォルダーには、次の 3 つのファイルが必要です。

![Adobe I/Oの新規統合 ](./images/pmfolder1.png)

Postmanに戻ります。 **インポート** をクリックします。

![Adobe I/Oの新規統合 ](./images/postmanui.png)

**ファイル** をクリックします。

![Adobe I/Oの新規統合 ](./images/choosefiles.png)

ダウンロードした 2 つのファイルを抽出したデスクトップ上のフォルダーに移動します。 これらの 3 つのファイルを同時に選択し、「開く **をクリックし** す。

![Adobe I/Oの新規統合 ](./images/selectfiles.png)

**開く** をクリックすると、Postmanに読み込む環境とコレクションの概要が表示されます。 **インポート** をクリックします。

![Adobe I/Oの新規統合 ](./images/impconfirm.png)

これで、API を使用してFireflyサービスとの対話を開始するためにPostmanで必要なすべてが揃いました。

まず最初にすべきことは、正しく認証されていることを確認することです。 認証を受けるには、アクセストークンをリクエストする必要があります。

リクエストを実行する前に、適切な環境が選択されていることを確認します。 右上隅の「環境」ドロップダウンリストを確認すると、現在選択されている環境を確認できます。

選択した環境の名前は、`--aepUserLdap-- Firefly Services OAuth Credential` のようになります。

![Postman](./images/envselemea.png)

これで、Postman環境とコレクションが設定され、機能するようになりました。 PostmanからAdobe I/Oに対して認証できるようになりました。

**Adobe IO - OAuth** コレクションで、**POST - アクセストークンの取得** という名前のリクエストを選択します。 **Params** の下で、`API_KEY` と `CLIENT_SECRET` の 2 つの変数が参照されています。 これらの変数は、選択した環境 `--aepUserLdap-- Firefly Services OAuth Credential` から取得されます。

「**送信**」をクリックします。

![Postman](./images/ioauth.png)

「**送信**」をクリックすると、Postmanの「**本文**」セクションに応答が表示されます。

![Postman](./images/ioauthresp.png)

設定が成功すると、次の情報を含む同様の応答が表示されます。

| キー | 値 |
|:-------------:| :---------------:| 
| token_type | **ベアラー** |
| access_token | **eyJhbGciOiJSU...** |
| expires_in | **86399** |

Adobe I/Oから、特定の値 **非常に長い access_token）と有効期限のウィンドウを持つ bearer**-token が提供されました。

受信したトークンは 24 時間有効になりました。 つまり、24 時間後にPostmanを使用してAdobe I/Oへの認証を行う場合は、このリクエストを再度実行して新しいトークンを生成する必要があります。

## Fireflyサービス API、テキスト 2 画像

これで、最初のリクエストをFireflyサービス API に送信できます。

**FF - Fireflyサービス技術インサイダー** コレクションで、**POST- Firefly - T2I V3** という名前のリクエストを選択します。 **Body** セクションには、`Horses in a field` を示すデフォルトのプロンプトが表示されます。 「**送信**」をクリックして、Fireflyサービスでその画像を生成します。

![Firefly](./images/ff1.png)

その後、画像の URL を含む、同様の応答が表示されます。 画像 URL をコピーし、web ブラウザーで開きます。

![Firefly](./images/ff2.png)

`horses in a field` を描いた美しい画像が表示されます。

![Firefly](./images/ff3.png)

次の演習に進む前に、API リクエストをいろいろと試してください。

次の手順：仕様を使用して画像をリクエストする [1.1.2](./ex2.md)

[モジュール 1.1 に戻る](./firefly-services.md)

[すべてのモジュールに戻る](./../../../overview.md)
