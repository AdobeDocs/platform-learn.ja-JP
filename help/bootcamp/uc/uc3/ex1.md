---
title: Bootcamp – 物理とデジタルの融合 – モバイルアプリを使用し、ビーコンエントリをトリガーします
description: Bootcamp – 物理とデジタルの融合 – モバイルアプリを使用し、ビーコンエントリをトリガーします
jira: KT-5342
audience: Data Engineer, Data Architect, Marketer
doc-type: tutorial
activity: develop
feature: Mobile SDK
exl-id: c33c973b-db8a-49ce-bd6c-a6c4fbe579a0
source-git-commit: 3c86f9b19cecf92c9a324fb6fcfcefaebf82177f
workflow-type: tm+mt
source-wordcount: '526'
ht-degree: 0%

---

# 3.1 モバイルアプリを使用し、ビーコンエントリをトリガーします

## モバイルアプリのインストール

アプリケーションをインストールする前に、iOS デバイスで **トラッキング** を有効にする必要があります。 これを行うには、**設定**/**プライバシーとセキュリティ**/**トラッキング** に移動し、「**アプリによるトラッキングのリクエストを許可**」オプションを確認します。

![DSN](./../uc3/images/app4.png)

Apple App Storeに移動し、`aepmobile-bootcamp` を検索します。 **インストール** または **ダウンロード** をクリックします。

![DSN](./../uc3/images/app1.png)

アプリケーションをインストールしたら、「**開く**」をクリックします。

![DSN](./../uc3/images/app2.png)

「**OK**」をクリックします。

![DSN](./../uc3/images/app9.png)

**許可** をクリックします。

![DSN](./../uc3/images/app3.png)

**同意します** をクリックします。

![DSN](./../uc3/images/app7.png)

「**アプリの使用中に許可**」をクリックします。

![DSN](./../uc3/images/app8.png)

**許可** をクリックします。

![DSN](./../uc3/images/app5.png)

これで、ホームページのアプリで、カスタマージャーニーを実行する準備が整いました。

![DSN](./../uc3/images/app12.png)

## カスタマージャーニーフロー

まず第一に、ログインする必要があります。 **ログイン** をクリックします。

![DSN](./images/app13.png)

前の演習でアカウントを作成した後、Web サイトでこれを見ました。 ログインするには、アプリで作成したアカウントのメールアドレスを再利用する必要があります。

![デモ](./images/pv1.png)

Web サイトで使用したメールアドレスをここに入力し、「**ログイン**」をクリックします。

![DSN](./images/app14.png)

その後、ログインしたという確認が表示され、プッシュ通知が届きます。

![DSN](./images/app15.png)

アプリのホームページに戻ると、追加の機能が表示されます。

![DSN](./images/app17.png)

まず、**製品** に移動します。 任意の製品（この例では **Coffee to go** をクリックします。

![DSN](./images/app19.png)

アプリに **Coffee to go** 製品ページが表示されます。

![DSN](./images/app20.png)

次に、オフラインストアの場所でのビーコンエントリイベントをシミュレートします。 これをシミュレートする目的は、店舗の画面での顧客体験をパーソナライズすることです。 店舗でのエクスペリエンスを視覚化するために、店舗に入ったばかりの顧客に関連する情報を動的に表示するページが作成されました。

続行する前に、コンピューターでこの Web ページを開いてください：[https://bootcamp.aepdemo.net/content/aep-bootcamp-experience/language-masters/en/screen.html](https://bootcamp.aepdemo.net/content/aep-bootcamp-experience/language-masters/en/screen.html)

次の画面が表示されます。

![DSN](./images/screen1.png)

次に、ホームページに戻ります。 **ビーコン** アイコンをクリックします。

![DSN](./images/app23.png)

その後、これが表示されます。 最初に **Bootcamp スクリーンビーコン** を選択し、次に **エントリ** ボタンをクリックします。 これにより、ビーコンエントリをシミュレートできます。

![DSN](./images/app21.png)

次に、店舗の画面を見てみましょう。 最後に表示した製品が 5 秒以内にそこに表示されます。

![DSN](./images/screen2.png)

次に、**製品** に戻ります。 任意の製品（この例では **ビーチブランケット日焼け** をクリックします。

![DSN](./images/app22.png)

次に、ホームページに戻ります。 **ビーコン** アイコンをクリックします。

![DSN](./images/app23.png)

その後、これが表示されます。 最初に **Bootcamp スクリーンビーコン** を選択し、次にもう一度 **エントリ** ボタンをクリックします。 これにより、ビーコンエントリをシミュレートできます。

![DSN](./images/app21.png)

ここで、店舗の画面を再度見てみましょう。 最後に表示した製品が 5 秒以内にそこに表示されます。

![DSN](./images/screen3.png)

次に、web サイトでプロファイルビューアも見てみましょう。 ここには、顧客とのやり取りがAdobe Experience Platformに収集され保存されていることを示すために、追加された多くのイベントが表示されます。

![DSN](./images/screen4.png)

次の演習では、独自のビーコンエントリジャーニーを設定およびテストします。

次の手順：[3.2 イベントを作成する &#x200B;](./ex2.md)

[ユーザーフロー 3 に戻る](./uc3.md)

[すべてのモジュールに戻る](../../overview.md)
