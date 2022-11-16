---
title: モジュール 7 設定 ID の更新とジャーニーのテスト
description: 設定 ID の更新とジャーニーのテスト
kt: 5342
audience: developer
doc-type: tutorial
activity: develop
exl-id: d3ceb676-d7f5-4f52-85a4-deaa5ef24034
source-git-commit: cc7a77c4dd380ae1bc23dc75608e8e2224dfe78c
workflow-type: tm+mt
source-wordcount: '615'
ht-degree: 1%

---

# 7.3 データ収集プロパティを更新し、ジャーニーをテストする

## 7.3.1 データ収集プロパティの更新

に移動します。 [Adobe Experience Platform Data Collection](https://experience.adobe.com/launch/) を選択し、 **タグ**.

これは、以前に表示したAdobe Experience Platformデータ収集プロパティページです。

![プロパティページ](../module1/images/launch1.png)

モジュール 0 では、Demo System によって次の 2 つのクライアントプロパティが作成されました。1 つは web サイト用、もう 1 つはモバイルアプリ用です。 次を検索して検索 `--demoProfileLdap--` 内 **[!UICONTROL 検索]** ボックス クリックして **Web** プロパティ。

![検索ボックス](../module1/images/property6.png)

これが見えます

![起動の設定](./images/rule1.png)

左側のメニューで、に移動します。 **ルール** ルールを検索します。 **プロファイルを登録**. ルールをクリックします。 **プロファイルを登録** をクリックして開きます。

![起動の設定](./images/rule2.png)

このルールの詳細が表示されます。 クリックしてアクションを開きます。 **「登録イベント」を AEP に送信 —トリガーJO**.

![起動の設定](./images/rule3.png)

次に、このアクションがトリガーされると、XDM データ構造を定義するために特定のデータ要素が使用されることがわかります。 そのデータ要素を更新し、 **イベント ID** に設定されたイベントの [演習 7.1](./ex1.md).

![起動の設定](./images/rule4.png)

次に、データ要素を更新する必要があります **XDM — 登録イベント**. これをおこなうには、に移動します。 **データ要素**. を検索 **XDM — 登録イベント** をクリックして、そのデータ要素を開きます。

![起動の設定](./images/rule5.png)

次の内容が表示されます。

![起動の設定](./images/rule6.png)

フィールドに移動します。 `_experience.campaign.orchestration.eventID`. 現在の値を削除し、そこに eventID を貼り付けます。

イベント ID は、Adobe Journey Optimizerの **設定/イベント** イベント ID は、イベントのサンプルペイロードに次のように表示されます。 `"eventID": "227402c540eb8f8855c6b2333adf6d54d7153d9d7d56fa475a6866081c574736"`.

![ACOP](./images/payloadeventID.png)

eventID を貼り付けると、画面は次のようになります。 次に、「 **保存** または **ライブラリに保存**.

![起動の設定](./images/rule7.png)

最後に、変更を公開する必要があります。 に移動します。 **公開フロー** をクリックします。

![起動の設定](./images/rule8.png)

クリック **変更されたリソースをすべて追加** 次に、 **開発用に保存およびビルド**.

![起動の設定](./images/rule9.png)

その後、ライブラリが更新され、1～2 分後に、設定をテストできます。

## 7.3.2ジャーニーのテスト

に移動します。 [https://builder.adobedemo.com/projects](https://builder.adobedemo.com/projects). Adobe IDでログインすると、次の内容が表示されます。 Web サイトプロジェクトをクリックして開きます。

![DSN](../module0/images/web8.png)

の **スクリーン** ページ、クリック **実行**.

![DSN](../module1/images/web2.png)

次に、デモ Web サイトが開いているのがわかります。 URL を選択して、クリップボードにコピーします。

![DSN](../module0/images/web3.png)

新しい匿名ブラウザーウィンドウを開きます。

![DSN](../module0/images/web4.png)

前の手順でコピーしたデモ Web サイトの URL を貼り付けます。 その後、Adobe IDを使用してログインするように求められます。

![DSN](../module0/images/web5.png)

アカウントのタイプを選択し、ログインプロセスを完了します。

![DSN](../module0/images/web6.png)

Web サイトが匿名ブラウザーウィンドウに読み込まれます。 デモ Web サイトの URL を読み込むには、新しい匿名ブラウザーウィンドウを使用する必要があります。

![DSN](../module0/images/web7.png)

画面の左上隅にあるAdobeロゴアイコンをクリックして、プロファイルビューアを開きます。

![デモ](../module2/images/pv1.png)

プロファイルビューアパネルと、リアルタイム顧客プロファイルを **Experience CloudID** を、現在不明なこの顧客の主な識別子として使用する。

![デモ](../module2/images/pv2.png)

登録/ログインページに移動します。 クリック **アカウントの作成**.

![デモ](../module2/images/pv9.png)

詳細を入力し、 **登録** その後、前のページにリダイレクトされます。

![デモ](../module2/images/pv10.png)

プロファイルビューアパネルを開き、リアルタイム顧客プロファイルに移動します。 プロファイルビューアパネルに、新しく追加された E メールや電話番号など、すべての個人データが表示されます。

![デモ](../module2/images/pv11.png)

アカウントを作成して 1 分後に、Adobe Journey Optimizerからアカウント作成用の電子メールが届きます。

![起動の設定](./images/email.png)

次のステップ： [概要とメリット](./summary.md)

[モジュール 7 に戻る](./journey-orchestration-create-account.md)

[すべてのモジュールに戻る](../../overview.md)
