---
title: 設定 ID を更新し、ジャーニーをテストする
description: 設定 ID を更新し、ジャーニーをテストする
kt: 5342
doc-type: tutorial
source-git-commit: 2cdc145d7f3933ec593db4e6f67b60961a674405
workflow-type: tm+mt
source-wordcount: '618'
ht-degree: 0%

---

# 3.1.3 データ収集プロパティを更新し、ジャーニーをテストする

## 3.1.3.1 データ収集プロパティの更新

[Adobe Experience Platform Data Collection に移動し ](https://experience.adobe.com/launch/) 「**Tags**」を選択します。

これは、以前に表示したAdobe Experience Platform データ収集のプロパティページです。

![ プロパティページ ](./../../../modules/datacollection/module1.1/images/launch1.png)

モジュール 0 で、デモシステムは 2 つのクライアントプロパティを作成しました。1 つは Web サイト用、もう 1 つはモバイルアプリ用です。 **[!UICONTROL 検索]** ボックスで `--demoProfileLdap--` を検索して見つけます。 クリックして **Web** プロパティを開きます。

![ 検索ボックス ](./../../../modules/datacollection/module1.1/images/property6.png)

その後、これが表示されます。

![Launch の設定 ](./images/rule1.png)

左側のメニューで、**ルール** に移動し、ルールを検索します **プロファイルを登録**。 ルール **プロファイルを登録** をクリックして開きます。

![Launch の設定 ](./images/rule2.png)

このルールの詳細が表示されます。 クリックしてアクション **「Registration Event」を AEP - トリガー JO に送信** を開きます。

![Launch の設定 ](./images/rule3.png)

次に、このアクションがトリガーされると、特定のデータ要素を使用して XDM データ構造が定義されます。 そのデータ要素を更新し、**演習 7.1** で設定したイベントの [ イベント ID](./ex1.md) を定義する必要があります。

![Launch の設定 ](./images/rule4.png)

ここで、データ要素 **XDM – 登録イベント** を更新する必要があります。 これを行うには、**データ要素** に移動します。 **XDM – 登録イベント** を検索し、クリックしてデータ要素を開きます。

![Launch の設定 ](./images/rule5.png)

次の画面が表示されます。

![Launch の設定 ](./images/rule6.png)

フィールド `_experience.campaign.orchestration.eventID` に移動します。 現在の値を削除し、eventID をそこに貼り付けます。

イベント ID はAdobe Journey Optimizerの **設定/イベント** にあり、イベント ID はイベントのサンプルペイロードに次のように表示されます。`"eventID": "227402c540eb8f8855c6b2333adf6d54d7153d9d7d56fa475a6866081c574736"`

![ACOP](./images/payloadeventID.png)

eventID を貼り付けると、画面は次のようになります。 次に、「**保存**」または **ライブラリに保存** をクリックします。

![Launch の設定 ](./images/rule7.png)

最後に、変更を公開する必要があります。 左メニューの **公開フロー** に移動します。

![Launch の設定 ](./images/rule8.png)

「**変更されたリソースをすべて追加**」をクリックし、「**開発用に保存およびビルド**」をクリックします。

![Launch の設定 ](./images/rule9.png)

その後、ライブラリが更新され、1 ～ 2 分後に、設定をテストできます。

## 3.1.3.2ジャーニーのテスト

[https://builder.adobedemo.com/projects](https://builder.adobedemo.com/projects) に移動します。 Adobe IDでログインすると、このが表示されます。 Web サイトプロジェクトをクリックして開きます。

![DSN](./../../../modules/gettingstarted/gettingstarted/images/web8.png)

**Screens** ページで、「**実行** をクリックします。

![DSN](./../../../modules/datacollection/module1.1/images/web2.png)

その後、デモ Web サイトが開きます。 URL を選択してクリップボードにコピーします。

![DSN](./../../../modules/gettingstarted/gettingstarted/images/web3.png)

新しい匿名ブラウザーウィンドウを開きます。

![DSN](./../../../modules/gettingstarted/gettingstarted/images/web4.png)

前の手順でコピーしたデモ Web サイトの URL を貼り付けます。 その後、Adobe IDを使用してログインするように求められます。

![DSN](./../../../modules/gettingstarted/gettingstarted/images/web5.png)

アカウントタイプを選択し、ログインプロセスを完了します。

![DSN](./../../../modules/gettingstarted/gettingstarted/images/web6.png)

次に、匿名ブラウザーウィンドウに web サイトが読み込まれます。 デモごとに、新しい匿名ブラウザーウィンドウを使用して、デモ Web サイトの URL を読み込む必要があります。

![DSN](./../../../modules/gettingstarted/gettingstarted/images/web7.png)

画面の左上隅にあるAdobeロゴアイコンをクリックして、プロファイルビューアを開きます。

![デモ](./../../../modules/datacollection/module1.2/images/pv1.png)

現在は不明なこの顧客のプライマリ ID として **0} ユーザー ID} を持つプロファイルビューアパネルとリアルタイムExperience Cloudプロファイルをご覧ください。**

![デモ](./../../../modules/datacollection/module1.2/images/pv2.png)

登録/ログインページに移動します。 **アカウントを作成** をクリックします。

![デモ](./../../../modules/datacollection/module1.2/images/pv9.png)

詳細を入力して **登録** をクリックすると、前のページにリダイレクトされます。

![デモ](./../../../modules/datacollection/module1.2/images/pv10.png)

プロファイルビューアパネルを開き、リアルタイム顧客プロファイルに移動します。 プロファイルビューアパネルには、新しく追加されたメール識別子や電話識別子など、すべての個人データが表示されます。

![デモ](./../../../modules/datacollection/module1.2/images/pv11.png)

アカウントを作成してから 1 分が経過すると、Adobe Journey Optimizerからアカウント作成メールが届きます。

![Launch の設定 ](./images/email.png)

次の手順：[ 概要とメリット ](./summary.md)

[モジュール 3.1 に戻る](./journey-orchestration-create-account.md)

[すべてのモジュールに戻る](../../../overview.md)
