---
title: カーソルを使用したプロジェクトの開発
description: カーソルを使用したプロジェクトの開発
kt: 5342
doc-type: tutorial
exl-id: c73498b6-5e08-41b5-81a9-c0a76a6e2792
source-git-commit: 25901342e8d9c46b0edce3b2092b9f1d66ba5849
workflow-type: tm+mt
source-wordcount: '1565'
ht-degree: 0%

---

# 1.7.2 Cursor を使用してプロジェクトを開発する

## 1.7.2.1 ディレクトリとツールの設定

デスクトップで、`--aepUserLdap---commerce` という名前で新しいディレクトリを作成します。

![Commerceとエージェンティック ](./images/cursorai1.png)

フォルダを右クリックし、**フォルダに新しいターミナル** を選択します。

![Commerceとエージェンティック ](./images/cursorai2.png)

この画像が表示されます。

![Commerceとエージェンティック ](./images/cursorai3.png)

次に、既存の Github リポジトリを複製する必要があります。これは、[https://github.com/adobe/commerce-integration-starter-kit](https://github.com/adobe/commerce-integration-starter-kit) で確認できます。

このリポジトリーは、Adobeを使用したAdobe Developer App Builder統合スターターキットで、リアルタイムの接続信頼性を高め、Adobe Commerceと ERP、CRM、PIM などの他のバックオフィスシステムとの統合の市場投入までの時間を短縮します。

![Commerceとエージェンティック ](./images/cursorai4.png)

このリポジトリを複製する方法はいくつかあります。この例では、ターミナルが使用されます。

ターミナルウィンドウに次のコマンドを入力して実行します。

`git clone https://github.com/adobe/commerce-integration-starter-kit`

![Commerceとエージェンティック ](./images/cursorai5.png)

数秒後、この結果が表示されます。

![Commerceとエージェンティック ](./images/cursorai6.png)

次に、先ほど作成したフォルダーに移動します。 次のコマンドを入力して実行します。

`cd commerce-integration-starter-kit`

![Commerceとエージェンティック ](./images/cursorai7.png)

この画像が表示されます。

![Commerceとエージェンティック ](./images/cursorai8.png)

次に、Cursor のCommerce拡張ツールを設定する必要があります。 次のコマンドを入力して実行します。

`aio commerce extensibility tools-setup`

![Commerceとエージェンティック ](./images/cursorai9.png)

**現在のディレクトリ** を選択します。

![Commerceとエージェンティック ](./images/cursorai10.png)

**カーソル** を選択します。

![Commerceとエージェンティック ](./images/cursorai11.png)

**npm** を選択します。

![Commerceとエージェンティック ](./images/cursorai12.png)

数分後、これが表示されます。

![Commerceとエージェンティック ](./images/cursorai13.png)

Cursor 用のCommerce拡張ツールをインストールすると、Cursor 環境の一部として MCP サーバーを使用できるようになります。 次の演習では、その MCP サーバーを使用して、App Builder プロジェクトの開発とデプロイを支援します。

## 1.7.2.2 Webhook の設定

この演習では、注文を作成したときに注文イベントをその Webhook にストリーミングできるように、設定する必要がある Webhook が必要です。 この演習では、[https://pipedream.com/requestbin](https://pipedream.com/requestbin) を使用してサンプルエンドポイントを使用します。

[https://pipedream.com/requestbin](https://pipedream.com/requestbin) に移動し、アカウントを作成してから、ワークスペースを作成します。 ワークスペースを作成すると、次のような情報が表示されます。

「**コピー**」をクリックして、URL をコピーします。 次の演習では、この URL を指定する必要があります。 この例の URL は `https://eodts05snjmjz67.m.pipedream.net` です。

![ カーソル + Commerce](./images/webhook1.png)

## 1.7.2.3 Cursor でアプリを作成

カーソルを開きます。 **プロジェクトを開く** をクリックします。

![ カーソル + Commerce](./images/cursorai14.png)

作成したフォルダーに移動します。`--aepUserLdap---commerce` という名前を付ける必要があります。 そのフォルダーで、`commerce-integration-starter-kit` という名前のフォルダーを選択します。 「**開く**」をクリックします。

![ カーソル + Commerce](./images/cursorai15.png)

この画像が表示されます。 続行する前に、Cursor で開いている最上位フォルダーが `commerce-integration-starter-kit` であることを確認します。

![ カーソル + Commerce](./images/cursorai16.png)

キーボードショートカット `Cmd + Shift + J` を使用して、カーソル設定を開きます。 この画像が表示されます。 **ツールと MCP** に移動します。

![ カーソル + Commerce](./images/cursorai17.png)

MCP サーバーを有効にします **commerce-extensibility**。 完了したら、「**X**」をクリックしてウィンドウを閉じます。

![ カーソル + Commerce](./images/cursorai18.png)

次のプロンプトをコピーして、カーソルに貼り付けます。 次に、「**送信** ボタンをクリックします。

`I would like to build an app that subscribes to order created events and sends them to a configurable URL with basic authentication`

![ カーソル + Commerce](./images/cursorai19.png)

カーソルが推論と実行を開始します。 カーソルは数回確認を求められます。 その場合は、「実行 **をクリックし** す。 これは、推論と設定に応じて、5～10 回発生する可能性があります。

![ カーソル + Commerce](./images/cursorai20.png)

数分後、次のようなメッセージが表示されます。

![ カーソル + Commerce](./images/cursorai21.png)

次の手順は、Cursor で指定されているように、`.env` という名前のファイルを作成し、そこに必要な変数を指定します。

## 1.7.2.4.env ファイルの作成

ファイル **env.dist** を選択します。 コマンド `Cmd + C` を入力し、次にコマンド `Cmd + V` を入力します。

![ カーソル + Commerce](./images/cursorai22.png)

新しく作成したファイルの名前を `.env` に変更します。

![ カーソル + Commerce](./images/cursorai23.png)

次に、**.env** ファイル内のすべての変数の値を指定する必要があります。

![ カーソル + Commerce](./images/cursorai24.png)

ここでは、必要なすべての情報を見つけることができます。

### Commerce エンドポイント

これらの変数は、[https://experience.adobe.com](https://experience.adobe.com) で確認できます。 **Commerce** をクリックします。

![ カーソル + Commerce](./images/cursorai25.png)

この画像が表示されます。 ACCS 環境の横にある **information** アイコンをクリックします。このアイコンには `--aepUserLdap-- - ACCS` という名前を付ける必要があります。 REST エンドポイントとGraphQL エンドポイントの値をコピーします。

この例では、これらがコピーする値です。 ファイル **.env** の 6 行目と 7 行目で、以下の変数の横にペーストします。


- **COMMERCE_BASE_URL** = https://na1-sandbox.api.commerce.adobe.com/Lkp3U7tvTBNAmpFvwnZJ4B/
- **COMMERCE_GRAPHQL_ENDPOINT** = https://na1-sandbox.api.commerce.adobe.com/Lkp3U7tvTBNAmpFvwnZJ4B/graphql

![ カーソル + Commerce](./images/cursorai26.png)

すると、これは **.env** ファイルに含まれます。

![ カーソル + Commerce](./images/cursorai26a.png)

### Adobe I/O プロジェクト変数

これらの変数は、[https://developer.adobe.com/console](https://developer.adobe.com/console) で確認できます。 **プロジェクト** に移動し、クリックして、前の演習で作成したAdobe I/O プロジェクトを開きます。`--aepUserLdap-- Commerce Events` という名前が付いている必要があります。

![ カーソル + Commerce](./images/cursorai27.png)

**実稼動** に移動します。

![ カーソル + Commerce](./images/cursorai28.png)

**OAuth サーバー間** に移動します。 この画像が表示されます。

![ カーソル + Commerce](./images/cursorai29.png)

**クライアント ID**、**クライアントシークレット**、**テクニカルアカウント ID**、**テクニカルアカウントメール**、**組織 ID** のフィールドの値をコピーして、13～17 行目の **.env** ファイルで以下の変数の横に貼り付けます。

- **OAUTH_CLIENT_ID**= **クライアント ID**
- **OAUTH_CLIENT_SECRET**= **クライアント秘密鍵**
- **OAUTH_TECHNICAL_ACCOUNT_ID**= **テクニカルアカウント ID**
- **OAUTH_TECHNICAL_ACCOUNT_EMAIL**= **テクニカルアカウントメール**
- **OAUTH_ORG_ID**= **組織 ID**

すると、これは **.env** ファイルに含まれます。

![ カーソル + Commerce](./images/cursorai29a.png)

### COMMERCE_ADOBE_IO_EVENTS_MERCHANT_ID

フィールド **COMMERCE_ADOBE_IO_EVENTS_MERCHANT_ID=** については、`--aepUserLdap--_commerce_events`.env **ファイルの 34 行目に** という値を入力します。

すると、これは **.env** ファイルに含まれます。

![ カーソル + Commerce](./images/cursorai30.png)

### Workspaceの設定

これらの変数を取得するには、Adobe I/O プロジェクトに戻って、**Workspace overview** をクリックします。

**Workspaceの概要** に移動して、URL を確認します。URL は **https://developer.adobe.com/console/projects/133309/4566206088345586770/workspaces/4566206088345619105/details** のようになります。

この例の最初の数値 133309 は、フィールド **IO_CONSUMER_ID** に使用する値です。
この例の 2 番目の番号 4566206088345586770 は、フィールド **IO_PROJECT_ID** に使用する値です。
この例の 3 番目の数値 4566206088345619105 は、フィールド **IO_WORKSPACE_ID** に使用する値です。

![ カーソル + Commerce](./images/cursorai31.png)

- **IO_CONSUMER_ID**= 133309
- **IO_PROJECT_ID**= 4566206088345586770
- **IO_WORKSPACE_ID**= 4566206088345619105

これらの値をコピーして、ファイル **.env** の 42～44 行目の以下の変数の横に貼り付けます。

![ カーソル + Commerce](./images/cursorai32.png)

### EVENT_PREFIX

**EVENT_PREFIX =** フィールドには、`--aepUserLdap--_`.env **ファイルの 47 行目に** る値を入力します。

すると、これは **.env** ファイルに含まれます。

![ カーソル + Commerce](./images/cursorai33.png)

### Webhook

**ORDER_WEBHOOK_URL** フィールドには、この演習で前に作成した Webhook の URL を貼り付ける必要があります。URL は次のようになります。`https://eodts05snjmjz67.m.pipedream.net`

すると、これは **.env** ファイルに含まれます。

![ カーソル + Commerce](./images/cursorai34.png)

### App Builder資格情報

54～55 行目の **.env** ファイルで次の変数を更新する必要があります。

- **AIO_RUNTIME_NAMESPACE**=
- **AIO_RUNTIME_AUTH**=

これらの変数の値は、Adobe I/O プロジェクトに戻って取得できます。 **Workspaceの概要に移動し** 「**すべてダウンロード**」をクリックします。

![ カーソル + Commerce](./images/cursorai35.png)

次のようなファイルがダウンロードされます。 テキストエディターを使用してそのファイルを開きます。

![ カーソル + Commerce](./images/cursorai36.png)

**runtime** が表示されるまで右にスクロールします。 次に、**AIO_RUNTIME_NAMESPACE** の値を含む **name** フィールドが表示されます。

![ カーソル + Commerce](./images/cursorai37.png)

さらに右にスクロールして **auth** を表示します。この中には、**AIO_RUNTIME_AUTH** の値が含まれています。

![ カーソル + Commerce](./images/cursorai38.png)

両方の値をファイル **.env** の 54～55 行目に貼り付けると、これが表示されます。

![ カーソル + Commerce](./images/cursorai39.png)

これで、**.env** ファイルの設定が完了しました。

## 1.7.2.5 workspace.json

前の手順では、次のようなファイルをAdobe I/O プロジェクトからダウンロードしました。

![ カーソル + Commerce](./images/cursorai36.png)

そのファイルの名前を変更し、`workspace.json` という名前を使用します。

![ カーソル + Commerce](./images/cursorai40.png)

ファイルをディレクトリ **scripts**>**onboarding**>**config** にコピーします。

![ カーソル + Commerce](./images/cursorai41.png)

## 1.7.2.6 Adobe I/O ログイン

以前に使用したターミナルウィンドウに戻ります。 コマンド `aio login` を入力します。

![ カーソル + Commerce](./images/cursorai44.png)

ブラウザーにログインすると、これが表示されます。

![ カーソル + Commerce](./images/cursorai45.png)

## 1.7.2.7 のデプロイ準備が完了しました

次のプロンプトをコピーして、カーソルに貼り付けます。 次に、「**送信** ボタンをクリックします。

`Please deploy this code to Adobe I/O`

![ カーソル + Commerce](./images/cursorai42.png)

**実行** をクリックしてアクションを許可すると、カーソルからアクションの確認を何度も求められる場合があります。

![ カーソル + Commerce](./images/cursorai43.png)

デプロイメントは数分後に終了します。

![ カーソル + Commerce](./images/cursorai46.png)

次のプロンプトをコピーして、カーソルに貼り付けます。 次に、「**送信** ボタンをクリックします。

`run the onboarding to commerce`

![ カーソル + Commerce](./images/cursorai50.png)

数分後、これが表示されます。

![ カーソル + Commerce](./images/cursorai51.png)

次のプロンプトをコピーして、カーソルに貼り付けます。 次に、「**送信** ボタンをクリックします。

`subscribe to commerce events`

![ カーソル + Commerce](./images/cursorai47.png)

数分後、これが表示されます。

![ カーソル + Commerce](./images/cursorai49.png)

## 1.7.2.8 Adobe Commerce as a Cloud Serviceでの設定の検証

[https://experience.adobe.com](https://experience.adobe.com) に移動します。 **Commerce** をクリックします。

![ カーソル + Commerce](./images/cursorai60.png)

Adobe Commerce as a Cloud Service環境をクリックして開き、ログインします。

![ カーソル + Commerce](./images/cursorai61.png)

**システム** に移動し、**イベント購読** に移動します。

![ カーソル + Commerce](./images/cursorai62.png)

このイベント購読のリストが表示されます。

![ カーソル + Commerce](./images/cursorai63.png)

**ストア** に移動し、**設定** に移動します。

![ カーソル + Commerce](./images/cursorai64.png)

**「Adobe サービス」に移動し** 「**Adobe I/O Events**」を選択します。 フィールド **Adobe I/O Workspace Configuration** の値は 2 つのアスタリスクであり、フィールド **マーチャント ID** の値も `--aepUserLdap--_commerce_events` のようになります。

![ カーソル + Commerce](./images/cursorai65.png)

この設定を行ったら、設定をテストできます。

## 1.7.2.9 シナリオをテストする

Web サイトを開きます。

![ カーソル + Commerce](./images/cursorai101.png)

**ウォッチ** に移動し、任意の製品をクリックします。

![ カーソル + Commerce](./images/cursorai102.png)

製品を設定し、「**買い物かごに追加**」をクリックします。

![ カーソル + Commerce](./images/cursorai103.png)

**買い物かご** アイコンをクリックし、「**チェックアウト**」を選択します。

![ カーソル + Commerce](./images/cursorai104.png)

詳細を入力し、**注文** をクリックします。

![ カーソル + Commerce](./images/cursorai105.png)

その後、注文確認が表示されます。

![ カーソル + Commerce](./images/cursorai106.png)

Webhook アプリケーションに切り替えます。 確認されたばかりの注文の受信イベントが表示されます。

![ カーソル + Commerce](./images/cursorai107.png)

## 1.7.2.10 Adobe I/Oのデバッグ

Adobe I/O プロジェクトに戻ります。 **Workspaceの概要** に移動します。 これに似た情報が表示されます。 少し下にスクロールします。

![ カーソル + Commerce](./images/cursorai108.png)

クリックして **Commerce Order Sync** を開きます。

![ カーソル + Commerce](./images/cursorai109.png)

**トレースのデバッグ** に移動します。 最新の受信イベントとそのペイロードを確認できます。 これは、処理されたイベントと、それらのイベントが正常に処理されたかどうかを理解するのに役立ちます。

![ カーソル + Commerce](./images/cursorai110.png)

## 次の手順

[Adobe Commerce用のインテリジェント開発者ツール ](./aiassisteddev.md){target="_blank"} に戻る

[ すべてのモジュールに戻る ](./../../../overview.md){target="_blank"}
