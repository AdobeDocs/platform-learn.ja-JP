---
title: CSC Bootcamp - モバイルアプリの検証
description: CSC Bootcamp - モバイルアプリの検証
doc-type: multipage-overview
exl-id: 930d9487-7c39-4657-9fe4-436dc53343e1
source-git-commit: 143da6340b932563a3309bb46c1c7091e0ab2ee2
workflow-type: tm+mt
source-wordcount: '427'
ht-degree: 0%

---

# モバイルアプリの検証

## Android

- Android デバイスに [ こちら ](https://tinyurl.com/CSCBootcampApp) からモバイルアプリをダウンロードします。 [Android エミュレーター ](https://developer.android.com/studio/run/emulator) または物理Android デバイスにダウンロードできます。

![ アプリをダウンロード ](./images/delivery-app-android-download.png)

- ファイルをタップして開きます。

![APK ファイルを開きます ](./images/delivery-app-android-install.png)

- ポップアップで、インストールボタンをクリックしてから、「とにかくインストール」をクリックして確認してください。

![ アプリのインストール ](./images/delivery-app-android-install-prompt.png)

![ アプリを信頼 ](./images/delivery-app-android-install-anyway.png)

- アプリが正常にインストールされたら、「開く」ボタンをクリックして開きます。

![ アプリを開きます ](./images/delivery-app-android-open.png)。


## iOS

>[!WARNING]
>
> Bootcamp Wifi ネットワークに接続されていることを確認してください。 アプリは同じ Wi-Fi ネットワーク上にある場合にのみ機能するので、これは不可欠です。

これは公式に配布されているアプリではないので、iOSの設定は、以前とは多少異なります。

- [App Store](https://itunes.apple.com/app/apple-store/id982107779) から Expo Go アプリをダウンロードします。

![expo go アプリをダウンロード ](./images/delivery-app-ios-download.png)

- iPhone カメラアプリで、Adobeチームがブートキャンプで投影する QR コードをスキャンします。 プロンプトが表示されたら、表示されるボタンをクリックします。

![QR コードをクリックしてください ](./images/delivery-app-ios-scan.png)

- これにより、iPhoneでアプリを開くための web ページが読み込まれます。 「Expo Go」ボタンをクリックして、ダウンロードしたアプリで開きます。

![ 「expo go」ボタンをクリック ](./images/delivery-app-ios-open-expo.png)

- ポップアップ表示されるダイアログで「開く」を選択すると、Expo Go アプリに正しい情報が読み込まれます。

![ 「開く」ボタンをクリック ](./images/delivery-app-ios-open.png)

- Expo Go アプリが開かれると、ローカルネットワーク上のデバイスを見つけるように求められます。 前述のように、これは必要です私たちは、私たちのAdobe機器からあなたの携帯電話にアプリをダウンロードすることができます。 「許可」をクリックしてこれを読み込みます。

![ 必要な権限の許可 ](./images/delivery-app-ios-allow.png)

- 最初にエラーページが表示される場合があります。 「もう一度試す」ボタンをクリックするだけで、デバイスにアプリを読み込むことができます。 Expo Go アプリを閉じるか、Wi-Fi ネットワークからデバイスを切断すると、アプリが応答しなくなります。

![ 失敗した場合に再試行 ](./images/delivery-app-ios-retry.png)

## アプリのナビゲーション

アプリで、ドロップダウンからチームを選択できます。 これにより、AEMで作成したコンテンツに動的に読み込まれます。 コンテンツに満足できない場合は、前に作成したコンテンツフラグメントでコンテンツをいつでも更新して、コンテンツを再公開できます。 変更がアプリに反映されているのが確認できます。

![ チームを選択する前にアプリ ](./images/delivery-app-initial.png)
![ チーム選択後のアプリ ](./images/delivery-app-loaded.png)

次の手順：[ フェーズ 3 – 配信：AEMでページを作成 ](./page-in-aem.md)

[フェーズ 2 に戻る – 実稼動：モバイルアプリコンテンツの作成](../production/app.md)

[すべてのモジュールに戻る](../../overview.md)
