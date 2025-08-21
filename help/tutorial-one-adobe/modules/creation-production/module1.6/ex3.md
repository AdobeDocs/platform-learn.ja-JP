---
title: 外部 DAM アプリの作成
description: 外部 DAM アプリの作成
role: Developer
level: Beginner
jira: KT-5342
doc-type: Tutorial
exl-id: 6823e8a0-dde7-460a-a48a-6787e65e4104
source-git-commit: 1f9a868c5e4ef4aa0e09d7f5d73a951006ee6c5a
workflow-type: tm+mt
source-wordcount: '877'
ht-degree: 1%

---

# 1.6.3 外部 DAM アプリケーションの作成とデプロイ

## 1.6.3.1 サンプルアプリファイルのダウンロード

[https://github.com/woutervangeluwe/genstudio-external-dam-app](https://github.com/woutervangeluwe/genstudio-external-dam-app) に移動します。 「**コード**」をクリックし、「**ZIP をダウンロード**」を選択します。

![ 内線 DAM](./images/extdam1.png)

zip ファイルをデスクトップに解凍します。

![ 内線 DAM](./images/extdam2.png)

## 1.6.3.2 Adobe Developer コマンドラインインターフェイスの設定

**genstudio-external-dam-app-main** フォルダーを右クリックし、「**フォルダーに新しいターミナル**」を選択します。

![ 内線 DAM](./images/extdam5.png)

この画像が表示されます。 コマンド `aio login` を入力します。 このコマンドは、ブラウザにリダイレクトし、ログインすることを期待します。

![ 内線 DAM](./images/extdam6.png)

ログインに成功すると、ブラウザーにこれが表示されます。

![ 内線 DAM](./images/extdam7.png)

その後、ブラウザーはターミナルウィンドウにリダイレクトします。 **ログインに成功しました** というメッセージと、ブラウザーから返される長いトークンが表示されます。

![ 内線 DAM](./images/extdam8.png)

次の手順では、外部 DAM アプリに使用するインスタンスとAdobe IO プロジェクトを設定します。

これを行うには、以前に設定したAdobe IO プロジェクトからファイルをダウンロードする必要があります。

[https://developer.adobe.com/console/home](https://developer.adobe.com/console/home){target="_blank"} に移動し、以前に作成した `--aepUserLdap-- GSPeM EXT` という名前のプロジェクトを開きます。 **実稼動** ワークスペースを開きます。

![ 内線 DAM](./images/extdam9.png)

**すべてダウンロード** をクリックします。 これにより、JSON ファイルがダウンロードされます。

![ 内線 DAM](./images/extdam10.png)

**ダウンロード** ディレクトリから外部 DAM アプリのルートディレクトリに JSON ファイルをコピーします。

![ 内線 DAM](./images/extdam11.png)

ターミナルウィンドウに戻ります。 コマンド `aio app use XXX-YYY-Production.json` を入力します。

>[!NOTE]
>
>上記のコマンドでファイルの名前をファイル名と一致するように変更する必要があります。

コマンドが実行されると、外部 DAM アプリが、以前に作成したApp Builderを使用してAdobe I/O プロジェクトに接続されるようになります。

![ 内線 DAM](./images/extdam12.png)

## GenStudio拡張機能SDKのインストール 1.6.3.3

次に、**GenStudio拡張機能SDK** をインストールする必要があります。 SDKについて詳しくは、[https://github.com/adobe/genstudio-extensibility-sdk](https://github.com/adobe/genstudio-extensibility-sdk) を参照してください。

SDKをインストールするには、ターミナルウィンドウで次のコマンドを実行します。

`npm install @adobe/genstudio-extensibility-sdk`

![ 内線 DAM](./images/extdam13.png)

数分後、SDKがインストールされます。

![ 内線 DAM](./images/extdam14.png)

## 1.6.3.4 Visual Studio Code で外部 DAM アプリを確認する

Visual Studio Code を開きます。 **開く…** をクリックしてフォルダーを開きます。

![ 内線 DAM](./images/extdam15.png)

前にダウンロードしたアプリを含んだフォルダー **genstudio-external-dam-app-main** を選択します。 「**開く**」をクリックします。

![ 内線 DAM](./images/extdam16.png)

**.env** ファイルをクリックして開きます。

![ 内線 DAM](./images/extdam17.png)

**.env** ファイルは、前の手順で実行したコマンド `aio app use` ードによって作成され、App Builderを使用してAdobe I/O プロジェクトに接続するために必要な情報が含まれています。

![ 内線 DAM](./images/extdam18.png)

外部 DAM アプリが、以前作成したAWS S3 バケットに接続できるように、次の詳細を **.env** ファイルに追加する必要があります。

```
AWS_ACCESS_KEY_ID=
AWS_SECRET_ACCESS_KEY=
AWS_REGION=
AWS_BUCKET_NAME=
```

フィールド **`AWS_ACCESS_KEY_ID`** と **`AWS_SECRET_ACCESS_KEY`** は、前の演習で IAM ユーザーを作成した後で使用できます。 あなたはそれらを書き留めるように頼まれました、あなたは今、値をコピーすることができます。

![ETL](./images/cred1.png)

このフィールド **`AWS_REGION`** は、AWS S3 ホームビューの、バケット名の横から取得できます。 この例では、領域は **us-west-2** です。

![ETL](./images/bucket2.png)

フィールド **`AWS_BUCKET_NAME`** は `--aepUserLdap---gspem-dam` にする必要があります。

この情報を使用すると、これらの各変数の値を更新できます。

```
AWS_ACCESS_KEY_ID=XXX
AWS_SECRET_ACCESS_KEY=YYY
AWS_REGION=us-west-2
AWS_BUCKET_NAME=--aepUserLdap---gspem-dam
```

このテキストをファイル `.env.dev` と `.env.prod` の両方に貼り付ける必要があります。 忘れずに変更を保存してください。

![ 内線 DAM](./images/extdam21.png)

次に、ターミナルウィンドウに戻ります。 次のコマンドを実行します。

`export $(grep -v '^#' .env | xargs)`

![ 内線 DAM](./images/extdam23.png)

最後に、外部 DAM アプリと他の統合機能を区別できるように、GenStudio for Performance Marketing内に表示されるラベルを変更する必要があります。 これを行うには、エクスプローラーで **src/genstudiopem/web-src/src** にドリルダウンして、ファイル **Constants.ts** を開きます。

行 14 をに変更する必要があります。

`export const extensionLabel: string = "--aepUserLdap-- - External S3 DAM";`

忘れずに変更を保存してください。

![ 内線 DAM](./images/extdam22.png)

## 1.6.3.5 外部 DAM アプリの実行

ターミナルウィンドウで、`aio app run` コマンドを実行します。 その後 1～2 分後にこれを表示します。

![ 内線 DAM](./images/extdam24.png)

これで、アプリが実行中であることを確認しました。 次の手順では、デプロイします。

まず、**Ctrl+C** を押して、アプリの実行を停止します。 次に、コマンド `aio app deploy` を入力します。 このコマンドは、コードをAdobe IO にデプロイします。

その結果、デプロイされたアプリケーションにアクセスするための同様の URL が届きます。

`https://133309-201burgundyguan.adobeio-static.net/index.html`

![ 内線 DAM](./images/extdam27.png)

テストの目的で、上記の URL に `?ext=` をプレフィックスとして追加することで、その URL をクエリ文字列パラメーターとして使用できるようになりました。 その結果、次のクエリ文字列パラメーターが得られます。

`?ext=https://133309-201burgundyguan.adobeio-static.net/index.html`

[https://experience.adobe.com/genstudio/create](https://experience.adobe.com/genstudio/create) に移動します。

![ 内線 DAM](./images/extdam25.png)

次に、クエリ文字列パラメーターを **#** の直前に追加します。 新しい URL は次のようになります。

`https://experience.adobe.com/?ext=https://133309-201burgundyguan.adobeio-static.net/index.html#/@experienceplatform/genstudio/create`

ページは通常どおり読み込まれます。 **バナー** をクリックして、新しいバナーの作成を開始します。

![ 内線 DAM](./images/extdam26.png)

テンプレートを選択し、「**使用**」をクリックします。

![ 内線 DAM](./images/extdam28.png)

**コンテンツから選択** をクリックします。

![ 内線 DAM](./images/extdam29.png)

これで、ドロップダウンリストから `--aepUserLdap-- - External S3 DAM` という名前の外部 DAM を選択できるようになります。

![ 内線 DAM](./images/extdam30.png)

この画像が表示されます。 画像 **neon_rabbit_banner.jpg** を選択し、「**使用**」をクリックします。

![ 内線 DAM](./images/extdam31.png)

これで、S3 バケットで実行されている外部 DAM から画像を選択しました。 画像を選択した状態で、メタ広告の作成と承認の演習に記載されてい [1.3.3.4 通常のワークフローに従うことができ ](./../module1.3/ex3.md#create--approve-meta-ad) す。

![ 内線 DAM](./images/extdam32.png)

ローカルマシンのコードに変更を加える場合は、アプリを再デプロイする必要があります。 再デプロイする場合は、次のターミナルコマンドを使用します。

`aio app deploy --force-build --force-deploy`

![ 内線 DAM](./images/extdam33.png)

これで、アプリを公開する準備が整いました。

## 次の手順

[ アプリを非公開で公開する ](./ex4.md){target="_blank"} に移動します。

[GenStudio for Performance Marketing – 拡張機能 ](./genstudioext.md){target="_blank"} に戻る

[ すべてのモジュール ](./../../../overview.md){target="_blank"} に戻る
