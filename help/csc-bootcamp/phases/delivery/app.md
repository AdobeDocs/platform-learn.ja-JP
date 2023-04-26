---
title: CSC Bootcamp — モバイルアプリの確認
description: CSC Bootcamp — モバイルアプリの確認
doc-type: multipage-overview
source-git-commit: 989e4e2add1d45571462eccaeebcbe66a77291db
workflow-type: tm+mt
source-wordcount: '435'
ht-degree: 0%

---

# モバイルアプリを検証

## Android

- 次からモバイルアプリをダウンロード： [ここ](https://tinyurl.com/CSCBootcampApp) を Android デバイスにアップロードします。 次のサイトにダウンロードできます。 [Android エミュレーター](https://developer.android.com/studio/run/emulator) またはお使いの物理 Android デバイス

![アプリをダウンロード](./images/delivery-app-android-download.png)

- ダウンロードしたファイルをタップして開きます。

![APK ファイルを開きます。](./images/delivery-app-android-install.png)

- ポップアップで「インストール」ボタンをクリックし、「インストール」をクリックして確定します。

![アプリのインストール](./images/delivery-app-android-install-prompt.png)

![アプリを信頼する](./images/delivery-app-android-install-anyway.png)

- アプリが正常にインストールされたら、「開く」ボタンをクリックして開きます。

![アプリを開く](./images/delivery-app-android-open.png)


## iOS

>[!WARNING]
>
> Bootcamp Wifi ネットワークに接続していることを確認します。 アプリは同じ WiFi ネットワークを使用している場合にのみ機能するので、これは重要です。

これは正式に配布されたアプリではないので、iOSのセットアップ方法は以前とは少し異なります。

- Expo Go アプリを [App Store](https://itunes.apple.com/app/apple-store/id982107779).

![Expo Go アプリをダウンロード](./images/delivery-app-ios-download.png)

- iPhone Camera アプリで、Adobeチームがブートキャンプで予測する QR コードをスキャンします。 プロンプトが表示されたら、表示されるボタンをクリックします。

![QR コードをクリックします](./images/delivery-app-ios-scan.png)

- これにより、iPhoneでアプリを開くための Web ページが読み込まれます。 「Expo Go」ボタンをクリックして、先ほどダウンロードしたアプリで開きます。

![「万博」ボタンをクリックします。](./images/delivery-app-ios-open-expo.png)

- ポップアップ表示されるダイアログで、「開く」を選択して、Expo Go アプリに正しい情報を読み込めるようにします。

![「開く」ボタンをクリックします。](./images/delivery-app-ios-open.png)

- Expo Go アプリが開くと、ローカルネットワーク上でデバイスを検索するように促すメッセージが表示されます。 前述のように、これは必要です。アドビのAdobeデバイスからお使いの電話にアプリをダウンロードできます。 「許可」をクリックして読み込みます。

![必要な権限を許可](./images/delivery-app-ios-allow.png)

- 最初はエラーページが表示される場合があります。 「再試行」ボタンをクリックするだけで、最後にデバイスにアプリを読み込みます。 Expo Go アプリを閉じるか、WiFi ネットワークからデバイスを切断すると、アプリが応答しなくなることに注意してください。

![失敗した場合は再試行](./images/delivery-app-ios-retry.png)

## アプリのナビゲーション

デスクトップアプリケーションでは、ドロップダウンからチームを選択できます。 これにより、AEMで作成したコンテンツに動的に読み込まれます。 コンテンツに満足できない場合は、前に作成したコンテンツフラグメントでいつでも更新して、コンテンツを再公開できます。 その後、変更内容がアプリに反映されます。

![チームを選択する前のアプリ](./images/delivery-app-initial.png)
![チーム選択後のアプリ](./images/delivery-app-loaded.png)

次のステップ： [フェーズ 3 — 配信：AEMでページを作成](./page-in-aem.md)

[フェーズ 2 — 実稼動に戻る：モバイルアプリコンテンツを作成](../production/app.md)

[すべてのモジュールに戻る](../../overview.md)
