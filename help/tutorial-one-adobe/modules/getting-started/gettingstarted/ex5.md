---
title: はじめに – モバイルアプリの使用
description: はじめに – モバイルアプリの使用
kt: 5342
doc-type: tutorial
exl-id: a619dd84-5c9e-4c1e-a753-2d98f50f4cfb
source-git-commit: 53f21d39caa047170811a063ff9d01d57e456626
workflow-type: tm+mt
source-wordcount: '436'
ht-degree: 1%

---

# モバイルアプリの使用

## アプリのダウンロード

コンピューターで [https://dsn.adobe.com/install](https://dsn.adobe.com/install){target="_blank"} に移動し、**Beta Version** に移動します。 Adobe IDを使用してログインすると、これが表示されます。

![DSN](./images/mobileapp.png)

スマートフォンの **カメラ** アプリを使って、デバイスの OS に対応したモバイルアプリをインストールします。 このイネーブルメントでは、Adobe Experience Platform Mobile SDKを使用するバージョン **0.6.1** （またはそれ以降）をインストールする必要があります。

>[!NOTE]
>
>iOS デバイスにアプリを初めてインストールした後、アプリを開こうとすると、「**信頼できないエンタープライズデベロッパー**」というエラーメッセージが表示される場合があります。 これを修正するには、**設定/一般/VPN とデバイスの管理/Adobe Systems Inc.** に移動し、**Trust Adobe Systems Inc.** をクリックする必要があります。

QR コードをスキャンした後、**インストール** を選択します。

![DSN](./images/mobileappn0.png)

アプリがインストールされると、デバイスのホーム画面に表示されます。 アイコンをクリックして、アプリを開きます。

![DSN](./images/mobileappn1.png)

ログインすると、通知を送信する権限を要求する通知が表示されます。 チュートリアルの一部として通知を送信するので、「**許可**」をクリックします。

![DSN](./images/mobileappn2.png)

その後、アプリのホームページが表示されます。 **設定** に移動します。

![DSN](./images/mobileappn3.png)

設定では、現在 **公開プロジェクト** がアプリに読み込まれていることがわかります。 **カスタムプロジェクト** をクリックします。

![DSN](./images/mobileappn4.png)

これで、カスタムプロジェクトを読み込めるようになりました。 QR コードをクリックして、プロジェクトを簡単に読み込みます。

![DSN](./images/mobileappn5.png)

前の演習の後、この結果が得られました。 クリックして、作成済みの **モバイル Edge Telco プロジェクト** を開きます。

![DSN](./images/dsn5b.png)

誤ってブラウザーウィンドウを閉じてしまった場合や、今後のデモまたはイネーブルメントセッションの際には、[https://dsn.adobe.com](https://dsn.adobe.com){target="_blank"} にアクセスして web サイトプロジェクトにアクセスすることもできます。 Adobe IDでログインすると、このが表示されます。 モバイルアプリプロジェクトで「。..**」という 3 つのドット** をクリックし、「**編集**」をクリックします。

![DSN](./images/web8a.png)

**統合** ページで、前の演習で作成したデータ収集プロパティを選択する必要があります。 それには、「**環境を選択**」をクリックします。

![DSN](./images/web8aa.png)

前の手順で作成した **という名前のデータ収集プロパティで、「** 選択 `--aepUserLdap - One Adobe (DD/MM/YYYY) (mobile)`」をクリックします。 次に、「**保存**」をクリックします。

![DSN](./images/web8b.png)

その後、これが表示されます。 次に、「**実行** をクリックします。

![DSN](./images/web8bb.png)

QR コードを含むこのポップアップが表示されます。 モバイルアプリ内からこの QR コードをスキャンします。

![DSN](./images/web8c.png)

プロジェクト ID がアプリに読み込まれたので、「切り替え **」をクリックし** す。

![DSN](./images/mobileappn7.png)

**CitiSignal** デモブランドが読み込まれているのが確認できます。 これで、アプリを使用する準備が整いました。

![DSN](./images/mobileappn8.png)

## 次の手順

[Adobe I/O プロジェクトの設定 ](./ex6.md){target="_blank"} に移動します。

[ はじめに ](./getting-started.md){target="_blank"} に戻る

[ すべてのモジュール ](./../../../overview.md){target="_blank"} に戻る