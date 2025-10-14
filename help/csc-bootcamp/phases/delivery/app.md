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

- Android デバイスに [&#x200B; こちら &#x200B;](https://tinyurl.com/CSCBootcampApp) からモバイルアプリをダウンロードします。 [Android エミュレーター &#x200B;](https://developer.android.com/studio/run/emulator) または物理Android デバイスにダウンロードできます。

![&#x200B; アプリをダウンロード &#x200B;](./images/delivery-app-android-download.png)

- ファイルをタップして開きます。

![APK ファイルを開きます &#x200B;](./images/delivery-app-android-install.png)

- ポップアップで、インストールボタンをクリックしてから、「とにかくインストール」をクリックして確認してください。

![&#x200B; アプリのインストール &#x200B;](./images/delivery-app-android-install-prompt.png)

![&#x200B; アプリを信頼 &#x200B;](./images/delivery-app-android-install-anyway.png)

- アプリが正常にインストールされたら、「開く」ボタンをクリックして開きます。

![&#x200B; アプリを開きます &#x200B;](./images/delivery-app-android-open.png)。


## iOS

>[!WARNING]
>
> Bootcamp Wifi ネットワークに接続されていることを確認してください。 アプリは同じ Wi-Fi ネットワーク上にある場合にのみ機能するので、これは不可欠です。

これは公式に配布されているアプリではないので、iOSの設定は、以前とは多少異なります。

- [App Store](https://itunes.apple.com/app/apple-store/id982107779) から Expo Go アプリをダウンロードします。

![expo go アプリをダウンロード &#x200B;](./images/delivery-app-ios-download.png)

- iPhone カメラアプリで、Adobeチームがブートキャンプで投影する QR コードをスキャンします。 プロンプトが表示されたら、表示されるボタンをクリックします。

![QR コードをクリックしてください &#x200B;](./images/delivery-app-ios-scan.png)

- これにより、iPhoneでアプリを開くための web ページが読み込まれます。 「Expo Go」ボタンをクリックして、ダウンロードしたアプリで開きます。

![&#x200B; 「expo go」ボタンをクリック &#x200B;](./images/delivery-app-ios-open-expo.png)

- ポップアップ表示されるダイアログで「開く」を選択すると、Expo Go アプリに正しい情報が読み込まれます。

![&#x200B; 「開く」ボタンをクリック &#x200B;](./images/delivery-app-ios-open.png)

- Expo Go アプリが開かれると、ローカルネットワーク上のデバイスを見つけるように求められます。 前述のように、これは必要です私たちは、私たちのAdobe機器からあなたの携帯電話にアプリをダウンロードすることができます。 「許可」をクリックしてこれを読み込みます。

![&#x200B; 必要な権限の許可 &#x200B;](./images/delivery-app-ios-allow.png)

- 最初にエラーページが表示される場合があります。 「もう一度試す」ボタンをクリックするだけで、デバイスにアプリを読み込むことができます。 Expo Go アプリを閉じるか、Wi-Fi ネットワークからデバイスを切断すると、アプリが応答しなくなります。

![&#x200B; 失敗した場合に再試行 &#x200B;](./images/delivery-app-ios-retry.png)

## アプリのナビゲーション

アプリで、ドロップダウンからチームを選択できます。 これにより、AEMで作成したコンテンツに動的に読み込まれます。 コンテンツに満足できない場合は、前に作成したコンテンツフラグメントでコンテンツをいつでも更新して、コンテンツを再公開できます。 変更がアプリに反映されているのが確認できます。

![&#x200B; チームを選択する前にアプリ &#x200B;](./images/delivery-app-initial.png)
![&#x200B; チーム選択後のアプリ &#x200B;](./images/delivery-app-loaded.png)

次の手順：[&#x200B; フェーズ 3 – 配信：AEMでページを作成 &#x200B;](./page-in-aem.md)

[フェーズ 2 に戻る – 実稼動：モバイルアプリコンテンツの作成](../production/app.md)

[すべてのモジュールに戻る](../../overview.md)
