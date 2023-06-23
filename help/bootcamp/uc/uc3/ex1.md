---
title: Bootcamp — 物理とデジタルの組み合わせ — モバイルアプリとビーコンエントリのトリガーを使用
description: Bootcamp — 物理とデジタルの組み合わせ — モバイルアプリとビーコンエントリのトリガーを使用
jira: KT-5342
audience: Data Engineer, Data Architect, Marketer
doc-type: tutorial
activity: develop
exl-id: c33c973b-db8a-49ce-bd6c-a6c4fbe579a0
source-git-commit: 90f7621536573f60ac6585404b1ac0e49cb08496
workflow-type: tm+mt
source-wordcount: '533'
ht-degree: 0%

---

# 3.1 モバイルアプリを使用し、ビーコンエントリをトリガーする

## モバイルアプリのインストール

アプリをインストールする前に、を有効にする必要があります **トラッキング** をiOSデバイスで使用できます。 これをおこなうには、に移動します。 **設定** > **プライバシーとセキュリティ** > **トラッキング** およびオプションを確認します。 **アプリの追跡リクエストを許可**.

![DSN](./../uc3/images/app4.png)

Apple App Storeに移動して、を検索します。 `aepmobile-bootcamp`. クリック **インストール** または **ダウンロード**.

![DSN](./../uc3/images/app1.png)

アプリがインストールされたら、 **開く**.

![DSN](./../uc3/images/app2.png)

「**OK**」をクリックします。

![DSN](./../uc3/images/app9.png)

クリック **許可**.

![DSN](./../uc3/images/app3.png)

クリック **同意します**.

![DSN](./../uc3/images/app7.png)

クリック **アプリの使用中に許可**.

![DSN](./../uc3/images/app8.png)

クリック **許可**.

![DSN](./../uc3/images/app5.png)

これで、ホームページ上のアプリで、カスタマージャーニーを経由する準備が整いました。

![DSN](./../uc3/images/app12.png)

## カスタマージャーニーフロー

まず、ログインする必要があります。 「**ログイン**」をクリックします。

![DSN](./images/app13.png)

前の演習でアカウントを作成した後、Web サイトでこれを確認しました。 次に、アプリで作成したアカウントの電子メールアドレスを再利用してログインする必要があります。

![デモ](./images/pv1.png)

Web サイトで使用したメールアドレスをここに入力し、 **ログイン**.

![DSN](./images/app14.png)

ログインしていることを確認するメッセージが表示され、プッシュ通知が送信されます。

![DSN](./images/app15.png)

アプリのホームページに戻ると、追加の機能が表示されます。

![DSN](./images/app17.png)

まず、に移動します。 **製品**. 任意の製品（この例では）をクリックします。 **行くコーヒー**.

![DSN](./images/app19.png)

次の項目が表示されます。 **行くコーヒー** 製品ページに表示されます。

![DSN](./images/app20.png)

オフラインストアの場所でのビーコンエントリイベントをシミュレートするようになりました。 これをシミュレートする目的は、店舗内の画面での顧客体験をパーソナライズすることです。 店舗内のエクスペリエンスを視覚化するために、店舗に入った顧客に関連する情報を動的に表示するページが作成されました。

続行する前に、お使いのコンピューターでこの Web ページを開いてください： [https://bootcamp.aepdemo.net/content/aep-bootcamp-experience/language-masters/en/screen.html](https://bootcamp.aepdemo.net/content/aep-bootcamp-experience/language-masters/en/screen.html)

次の内容が表示されます。

![DSN](./images/screen1.png)

次に、ホームページに戻ります。 次をクリック： **ビーコン** アイコン

![DSN](./images/app23.png)

これが見えます まず、「 」を選択します。 **Bootcamp Screen Beacon** そして、 **エントリ** 」ボタンをクリックします。 これにより、ビーコンエントリをシミュレートできます。

![DSN](./images/app21.png)

次に、ストア内画面を見てみましょう。 最後に表示した製品が、5 秒以内に表示されます。

![DSN](./images/screen2.png)

次に、に戻ります。 **製品**. 任意の製品（この例では）をクリックします。 **ビーチブランケットタン**.

![DSN](./images/app22.png)

次に、ホームページに戻ります。 次をクリック： **ビーコン** アイコン

![DSN](./images/app23.png)

これが見えます まず、「 」を選択します。 **Bootcamp Screen Beacon** そして、 **エントリ** ボタンを再度クリックします。 これにより、ビーコンエントリをシミュレートできます。

![DSN](./images/app21.png)

次に、ストア内画面をもう一度見てみましょう。 最後に表示した製品が、5 秒以内に表示されます。

![DSN](./images/screen3.png)

また、Web サイト上のプロファイルビューアも見てみましょう。 多くのイベントが追加され、顧客とのインタラクションが収集され、Adobe Experience Platformに保存されていることを示すだけです。

![DSN](./images/screen4.png)

次の演習では、独自のビーコンエントリジャーニーを設定およびテストします。

次のステップ： [3.2 イベントの作成](./ex2.md)

[ユーザーフローに戻る 3](./uc3.md)

[すべてのモジュールに戻る](../../overview.md)
