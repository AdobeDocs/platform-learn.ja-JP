---
title: AEM CS - ドキュメントベースの web サイトの作成
description: AEM CS - ドキュメントベースの web サイトの作成
kt: 5342
doc-type: tutorial
exl-id: db366111-3873-4504-95f1-b240836c833f
source-git-commit: 5b15d54af26d67b4193a1ac4d5d62f5c62a37362
workflow-type: tm+mt
source-wordcount: '763'
ht-degree: 1%

---

# 2.1.2 ドキュメントベースの web サイトの作成

Cloud Manager プログラムが作成されるのを待っている間、最初のドキュメントベースのオーサリング web サイトを設定するのに十分な時間があります。 以下の演習は、[aem.live 開発者向けチュートリアル ](https://www.aem.live/developer/tutorial){target="_blank"} に基づいています。 開始するには、次の手順に従います。

## 2.1.2.1 Google ドライブの設定

[https://drive.google.com](https://drive.google.com){target="_blank"} に移動します。 **+新規をクリックし** 次に **新規フォルダー** をクリックします。

![AEMCS](./images/googledrive1.png)

フォルダーに `aemdocb-test` という名前を付けます。 「**作成**」をクリックします。

![AEMCS](./images/googledrive2.png)

ファイル [aemboilerplate.zip](./../../../assets/aem/aemboilerplate.zip){target="_blank"} をダウンロードし、コンピューターに抽出します。

![AEMCS](./images/googledrive3.png)

そのフォルダーには 3 つのファイルが表示されます。 これらのファイルを新しいGoogle Drive フォルダーにコピーします。

![AEMCS](./images/googledrive4.png)

次に、これらのファイルをネイティブのGoogle ファイルに変換する必要があります。 これをおこなうには、各ファイルを開き、**ファイル**/**Google Docsとして保存** に移動します。

![AEMCS](./images/googledrive5.png)

3 つのファイルすべてに対してこの操作を行うと、Google Drive フォルダーに 6 つのファイルが表示されます。

![AEMCS](./images/googledrive6.png)

その後、これをフォルダーに入れます。

![AEMCS](./images/googledrive7.png)

ドキュメントベースのオーサリングのデモを機能させるには、Google Drive フォルダーをメールアドレス **helix@adobe.com** と共有する必要があります。 フォルダー名をクリックし、「**共有**」をクリックしてから、もう一度 **共有** をクリックします。

![AEMCS](./images/googledrive8.png)

メールアドレス **helix@adobe.com** を入力し、「**送信**」をクリックします。

![AEMCS](./images/googledrive9.png)

次に、Google Drive フォルダーの URL をコピーして、次の演習で必要になるので書き留めます。 フォルダー名をクリックし、「**共有**」をクリックして、「**リンクをコピー**」をクリックします。

![AEMCS](./images/googledrive10.png)

`https://drive.google.com/drive/folders/1PNIOFeptIfszSebawT-Y_bwB4_anQWk5?usp=drive_link`

URL が次のようになるように、クエリ文字列パラメーター `?usp=drive_link` を削除する必要があります。

`https://drive.google.com/drive/folders/1PNIOFeptIfszSebawT-Y_bwB4_anQWk5`

## 2.1.2.2 GitHub リポジトリのセットアップ

[https://github.com](https://github.com){target="_blank"} に移動します。 「**ログイン**」をクリックします。

![AEMCS](./images/aemcssetup1.png)

資格情報を入力します。 「**ログイン**」をクリックします。

![AEMCS](./images/aemcssetup2.png)

ログインすると、GitHub ダッシュボードが表示されます。

![AEMCS](./images/aemcssetup3.png)

[https://github.com/adobe/aem-boilerplate](https://github.com/adobe/aem-boilerplate){target="_blank"} に移動します。 その後、これが表示されます。 「**このテンプレートを使用**」をクリックし、「**新しいリポジトリを作成**」をクリックします。

![AEMCS](./images/aemdocbcssetup4.png)

**リポジトリ名** には、`aemdocb-test` を使用します。 表示を **プライベート** に設定します。 **リポジトリを作成** をクリックします。

![AEMCS](./images/aemdocbcssetup5.png)

数秒後に、リポジトリが作成されます。

![AEMCS](./images/aemdocbcssetup6.png)

次に、[https://github.com/apps/aem-code-sync](https://github.com/apps/aem-code-sync){target="_blank"} に移動します。 **設定** をクリックします。

![AEMCS](./images/aemcssetup7.png)

GitHub アカウントをクリックします。

![AEMCS](./images/aemcssetup8.png)

**リポジトリのみを選択** をクリックし、作成したリポジトリを追加します。 次に、「**インストール**」をクリックします。

![AEMCS](./images/aemdocbcssetup9.png)

この確認が表示されます。

![AEMCS](./images/aemcssetup10.png)

## 2.1.2.3 ファイル fstab.yaml の更新

GitHub リポジトリで、をクリックしてファイル `fstab.yaml` を開きます。

![AEMCS](./images/aemdocbcssetup11.png)

**編集** アイコンをクリックします。

![AEMCS](./images/aemdocbcssetup12.png)

ここで、2 行目のフィールド **url** の値を更新する必要があります。

![AEMCS](./images/aemdocbcssetup13.png)

GitHub リポジトリの設定と組み合わせて、特定のAEM CS 環境の URL で現在の値を置き換える必要があります。

URL の現在の値：`https://drive.google.com/drive/u/0/folders/1MGzOt7ubUh3gu7zhZIPb7R7dyRzG371j`。

その値を、Google Drive フォルダーからコピーした URL （`https://drive.google.com/drive/folders/1PNIOFeptIfszSebawT-Y_bwB4_anQWk5`）に置き換えます。 「**変更をコミット…**」をクリックします。

![AEMCS](./images/aemdocbcssetup14.png)

「**変更をコミット**」をクリックします。

![AEMCS](./images/aemdocbcssetup15.png)

## 2.1.2.4 AEM Sidekick拡張機能のインストール

[https://chromewebstore.google.com/detail/aem-sidekick/ccfggkjabjahcjoljmgmklhpaccedipo](https://chromewebstore.google.com/detail/aem-sidekick/ccfggkjabjahcjoljmgmklhpaccedipo){target="_blank"} に移動します。 **Chromeに追加** をクリックします。

![AEMCS](./images/aemdocbcssetup16.png)

**AEM Sidekick** 拡張機能をピン留めします。

![AEMCS](./images/aemdocbcssetup17.png)

## 2.1.2.5 ドキュメントベースの web サイトのプレビューとPublish

Googleのドライブに戻ります。 タスクバーで、**AEM Sidekick** 拡張機能をクリックします。 フォルダーにAEM Sidekickバーのポップアップが表示されます。

![AEMCS](./images/aemdocbcssetup18.png)

Google Drive フォルダー内の 3 つのファイルを選択します。 「**プレビュー**」をクリックします。

![AEMCS](./images/aemdocbcssetup19.png)

もう一度 **プレビュー** をクリックします。

![AEMCS](./images/aemdocbcssetup20.png)

クリックして、緑色のダイアログポップアップを閉じます。

![AEMCS](./images/aemdocbcssetup21.png)

Google Drive フォルダー内の 3 つのファイルを再度選択します。 今すぐ、**Publish** をクリックします。

![AEMCS](./images/aemdocbcssetup22.png)

「**公開**」をクリックします。

![AEMCS](./images/aemdocbcssetup23.png)

をクリックして、緑色のダイアログをもう一度閉じます。 ファイル **インデックス** を選択し、「**URL をコピー**」をクリックしてから、「**ライブ URL をコピー**」をクリックします。

![AEMCS](./images/aemdocbcssetup24.png)

コピーされた URL は、`https://main--aemdocb-test--woutervangeluwe.aem.live/` のようになります。

上記の URL で：

- **main** は、GitHub リポジトリ上のブランチを参照します
- **aemdocb-test** は GitHub リポジトリ名を指します
- **woutervangeluwe** は、GitHub ユーザーアカウント名を指します
- **.live** は、AEM インスタンスのライブ環境を指します
- **.live を**.page **に置き換えて** AEM インスタンスのプレビュー環境を開くことができます

新規ブラウザーウィンドウを開き、URL に移動します。

![AEMCS](./images/aemdocbcssetup25.png)

## 2.1.2.6 変更を加えて公開する

Google ドライブに戻り、Googleでファイラー **インデックス** を開きます。

![AEMCS](./images/aemdocbcssetup27.png)

テキスト **テスト** を他の任意のテキストに置き換えます。 「**プレビュー**」をクリックします。

![AEMCS](./images/aemdocbcssetup28.png)

Web サイトのプレビューバージョンが開きます。 変更内容を確認し、**Publish** をクリックします。

![AEMCS](./images/aemdocbcssetup29.png)

その後、web サイトのライブバージョンが表示されます。

![AEMCS](./images/aemdocbcssetup30.png)

上記の演習は、基本を学び、自分でドキュメントベースのオーサリングを体験するための良い方法でした。 次の演習では、CitiSignal をデモブランドとして使用して独自のデモ Web サイトを設定します。

次の手順：[2.1.3 AEM CS 環境のセットアップ ](./ex3.md){target="_blank"}

[ モジュール 2.1 に戻る ](./aemcs.md){target="_blank"}

[ すべてのモジュールに戻る ](./../../../overview.md){target="_blank"}
