---
title: Microsoft Azure Event Hub へのセグメントのアクティベーション - Microsoft Azure 環境を設定します
description: Microsoft Azure Event Hub へのセグメントのアクティベーション - Microsoft Azure 環境を設定します
kt: 5342
doc-type: tutorial
source-git-commit: 2cdc145d7f3933ec593db4e6f67b60961a674405
workflow-type: tm+mt
source-wordcount: '467'
ht-degree: 0%

---

# 2.4.0 環境の設定

## 2.4.0.1 Azure サブスクリプションの作成

>[!NOTE]
>
>既に Azure サブスクリプションがある場合は、この手順をスキップできます。 その場合は、演習 13.0.2 を続行してください。

[https://portal.azure.com](https://portal.azure.com) に移動し、Azure アカウントでログインします。 お持ちでない場合は、個人の電子メール アドレスを使用して Azure アカウントを作成してください。

![02-azure-portal-email.png](./images/02-azure-portal-email.png)

ログインに成功すると、次の画面が表示されます。

![03-azure-logged-in.png](./images/03-azure-logged-in.png)

左側のメニューをクリックして **すべてのリソース** を選択すると、まだ購読していない場合は Azure サブスクリプション画面が表示されます。 その場合は、「**Azure 無料体験版で開始** を選択します。

![04-azure-start-subscribe.png](./images/04-azure-start-subscribe.png)

Azure のサブスクリプションフォームに入力し、アクティベーション用に携帯電話とクレジットカードを提供します（30 日間無料利用枠があり、アップグレードしない限り料金は発生しません）。

![05-azure-subscription-form.png](./images/05-azure-subscription-form.png)

購読プロセスが完了したら、次の操作を実行できます。

![06-azure-subscription-ok.png](./images/06-azure-subscription-ok.png)


## 2.4.0.2 Visual Code Studio のインストール

Microsoft Visual Code Studio を使用して、Azure プロジェクトを管理します。 [ このリンク ](https://code.visualstudio.com/download) からダウンロードできます。 同じ Web サイト上の特定の OS のインストール手順に従います。

## 2.4.0.3 ビジュアルコード拡張機能のインストール

[https://marketplace.visualstudio.com/items?itemName=ms-azuretools.vscode-azurefunctions](https://marketplace.visualstudio.com/items?itemName=ms-azuretools.vscode-azurefunctions) から Visual Studio Code 用の Azure 関数をインストールします。 インストールボタンをクリックします。

![07-azure-code-extension-install.png](./images/07-azure-code-extension-install.png)

Azure アカウントをインストールし、[https://marketplace.visualstudio.com/items?itemName=ms-vscode.azure-account](https://marketplace.visualstudio.com/items?itemName=ms-vscode.azure-account) から Visual Studio Code にサインインします。 インストールボタンをクリックします。

![08-azure-account-extension-install.png](./images/08-azure-account-extension-install.png)

## 2.4.0.4 node.js のインストール

>[!NOTE]
>
>既に node.js がインストールされている場合は、この手順をスキップできます。 その場合は、演習 13.0.5 を続行してください。

### macOS

最初に [Homebrew](https://brew.sh/) がインストールされていることを確認します。 [ こちら ](https://brew.sh/) の手順に従います。

![ ノード ](./images/brew.png)

Homebrew をインストールしたら、次のコマンドを実行します。

```javascript
brew install node
```

### Windows

[nodejs.org](https://nodejs.org/en/#home-downloadhead) web サイトから [Windows インストーラー ](https://nodejs.org/en/) を直接ダウンロードします。

## 2.4.0.5 node.js のバージョンの確認

このモジュールでは、node.js バージョン 12 がインストールされている必要があります。 その他のバージョンの node.js では、演習 13.5 で問題が発生する場合があります。

続行する前に、node.js のバージョンを今すぐ確認してください。

次のコマンドを実行して、node.js のバージョンを確認します。

```javascript
node -v
```

バージョンが 12 を下回る、または上回る場合は、アップグレードまたはダウングレードが必要です。

### macOSの node.js バージョンのアップグレード/ダウングレード

パッケージ **n** がインストールされていることを確認します。

パッケージ **n** をインストールするには、次のコマンドを実行します。

```javascript
sudo npm install -g n
```

バージョンがバージョン 12 以下またはバージョンより上の場合は、次のコマンドを実行してアップグレードまたはダウングレードします。

```javascript
sudo n 12.6.0
```

### Windows での node.js バージョンのアップグレード/ダウングレード

Windows/Campaign コントロールパネル/プログラムの追加と削除で、node.js をアンインストールします。

[nodejs.org](https://nodejs.org/en/) web サイトから必要なバージョンをインストールする。

## 2.4.0.6 NPM パッケージのインストール：リクエスト

node.js の設定の一環として、パッケージ **リクエスト** をインストールする必要があります。

パッケージ **request** をインストールするには、次のコマンドを実行します。

```javascript
npm install request
```


次の手順：[2.4.1 Microsoft Azure EventHub 環境を設定する ](./ex1.md)

[モジュール 2.4 に戻る](./segment-activation-microsoft-azure-eventhub.md)

[すべてのモジュールに戻る](./../../../overview.md)
