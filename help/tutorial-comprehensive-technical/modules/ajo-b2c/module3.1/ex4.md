---
title: 設定 ID を更新し、ジャーニーをテストする
description: 設定 ID を更新し、ジャーニーをテストする
kt: 5342
doc-type: tutorial
source-git-commit: 2bd4249d96eb697da66db68895761f8b0bd6e638
workflow-type: tm+mt
source-wordcount: '628'
ht-degree: 1%

---

# 3.1.3 データ収集プロパティを更新し、ジャーニーをテストする

## 3.1.3.1 データ収集プロパティの更新

[Adobe Experience Platform Data Collection に移動し &#x200B;](https://experience.adobe.com/launch/) 「**Tags**」を選択します。

![&#x200B; プロパティページ &#x200B;](./../../../modules/datacollection/module1.1/images/launch1.png)

**はじめに** で、デモシステムは 2 つのクライアントプロパティを作成しました。1 つは Web サイト用、もう 1 つはモバイルアプリ用です。 **[!UICONTROL 検索]** ボックスで `--aepUserLdap--` を検索して見つけます。 クリックして **Web** プロパティを開きます。

![&#x200B; 検索ボックス &#x200B;](./../../../modules/datacollection/module1.1/images/property6.png)

その後、これが表示されます。

![Launch の設定 &#x200B;](./images/rule1.png)

左側のメニューで、**ルール** に移動し、ルール **アカウントを作成** を検索します。 ルール **アカウントを作成** をクリックして開きます。

![Launch の設定 &#x200B;](./images/rule2.png)

このルールの詳細が表示されます。 クリックして、アクション **「登録イベント」エクスペリエンスイベントを送信** を開きます。

![Launch の設定 &#x200B;](./images/rule3.png)

次に、このアクションがトリガーされると、特定のデータ要素を使用して XDM データ構造が定義されます。 そのデータ要素を更新し、**演習 3.1.1** で設定したイベントの [&#x200B; イベント ID](./ex1.md) を定義する必要があります。

![Launch の設定 &#x200B;](./images/rule4.png)

ここで、データ要素 **XDM – 登録イベント** を更新する必要があります。 これを行うには、**データ要素** に移動します。 **XDM – 登録** を検索し、クリックしてデータ要素を開きます。

![Launch の設定 &#x200B;](./images/rule5.png)

次の画面が表示されます。

![Launch の設定 &#x200B;](./images/rule6.png)

フィールド `_experience.campaign.orchestration.eventID` に移動します。 現在の値を削除し、eventID をそこに貼り付けます。

イベント ID はAdobe Journey Optimizerの **設定/イベント** にあり、イベント ID はイベントのサンプルペイロードに次のように表示されます。`"eventID": "5ae9b8d3f68eb555502b0c07d03ef71780600c4bd0373a4065c692ae0bfbd34d"`

![ACOP](./images/payloadeventID.png)

eventID を貼り付けると、画面は次のようになります。 次に、「**保存**」または **ライブラリに保存** をクリックします。

![Launch の設定 &#x200B;](./images/rule7.png)

最後に、変更を公開する必要があります。 左側のメニューで **公開フロー** に移動し、クリックして **メイン** ライブラリを開きます。

![Launch の設定 &#x200B;](./images/rule8.png)

「**変更されたリソースをすべて追加**」をクリックし、「**開発用に保存およびビルド**」をクリックします。

![Launch の設定 &#x200B;](./images/rule9.png)

その後、ライブラリが更新され、1 ～ 2 分後に、設定をテストできます。

## 3.1.3.2ジャーニーのテスト

[https://dsn.adobe.com](https://dsn.adobe.com) に移動します。 Adobe IDでログインすると、このが表示されます。 Web サイトプロジェクトで「。..**」** いう 3 つのドットをクリックし、「**実行**」をクリックして開きます。

![DSN](./../../datacollection/module1.1/images/web8.png)

その後、デモ Web サイトが開きます。 URL を選択してクリップボードにコピーします。

![DSN](../../gettingstarted/gettingstarted/images/web3.png)

新しい匿名ブラウザーウィンドウを開きます。

![DSN](../../gettingstarted/gettingstarted/images/web4.png)

前の手順でコピーしたデモ Web サイトの URL を貼り付けます。 その後、Adobe IDを使用してログインするように求められます。

![DSN](../../gettingstarted/gettingstarted/images/web5.png)

アカウントタイプを選択し、ログインプロセスを完了します。

![DSN](../../gettingstarted/gettingstarted/images/web6.png)

次に、匿名ブラウザーウィンドウに web サイトが読み込まれます。 演習ごとに、新しい匿名ブラウザーウィンドウを使用して、デモ Web サイトの URL を読み込む必要があります。

![DSN](../../gettingstarted/gettingstarted/images/web7.png)

画面の左上隅にあるAdobeロゴアイコンをクリックして、プロファイルビューアを開きます。

![デモ](./../../../modules/datacollection/module1.2/images/pv1.png)

現在は不明なこの顧客のプライマリ ID として **0&rbrace; ユーザー ID&rbrace; を持つプロファイルビューアパネルとリアルタイムExperience Cloudプロファイルをご覧ください。**「**ログイン**」をクリックします。

![デモ](./../../../modules/datacollection/module1.2/images/pv2.png)

**アカウントを作成** をクリックします。

![デモ](./../../../modules/datacollection/module1.2/images/pv9.png)

詳細を入力して **登録** をクリックすると、前のページにリダイレクトされます。

![デモ](./../../../modules/datacollection/module1.2/images/pv10.png)

プロファイルビューアパネルを開き、リアルタイム顧客プロファイルに移動します。 プロファイルビューアパネルには、新しく追加されたメール識別子や電話識別子など、すべての個人データが表示されます。

![デモ](./../../../modules/datacollection/module1.2/images/pv11.png)

アカウントを作成してから 1 分が経過すると、Adobe Journey Optimizerからアカウント作成メールが届きます。

![Launch の設定 &#x200B;](./images/email.png)

また、Journey Optimizerのジャーニーのダッシュボードで、ジャーニーのエントリとジャーニーの進行状況も確認できます。

![Launch の設定 &#x200B;](./images/emaildash.png)

次の手順：[&#x200B; 概要とメリット &#x200B;](./summary.md)

[モジュール 3.1 に戻る](./journey-orchestration-create-account.md)

[すべてのモジュールに戻る](../../../overview.md)
