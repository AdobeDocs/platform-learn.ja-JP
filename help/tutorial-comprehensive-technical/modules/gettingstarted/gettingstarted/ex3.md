---
title: はじめに – データストリームの作成
description: はじめに – データストリームの作成
kt: 5342
doc-type: tutorial
exl-id: b3e6f66d-fb7a-43ab-aedb-45141af76d3e
source-git-commit: 1526661a80b4d551627dfca42a7e97c9498dd1f2
workflow-type: tm+mt
source-wordcount: '848'
ht-degree: 1%

---

# データストリームの作成

[https://experience.adobe.com/#/data-collection/](https://experience.adobe.com/#/data-collection/) に移動します。

![DSN](./images/launchprop.png)

左側のメニューで、「**[!UICONTROL タグ]**」をクリックします。 前の演習の後、3 つのデータ収集プロパティが得られました。1 つは web 用、1 つはモバイル用、もう 1 つは CX アプリ用です。

![DSN](./images/launchprop1.png)

これらのプロパティは、ほとんど使用する準備ができていますが、これらのプロパティを使用してデータの収集を開始する前に、データストリームを設定する必要があります。 データストリームとは何か、およびその意味に関する概念については、後のデータ収集モジュールの演習で詳しく説明します。

今のところ、次の手順に従ってください。

## Web データ収集用のデータストリームの作成

**[!UICONTROL データストリーム]** をクリックします。

![&#x200B; 左側のナビゲーションで「Edge設定」アイコンをクリック &#x200B;](./images/edgeconfig1a.png)

画面の右上隅にあるサンドボックス名を選択します（`--aepSandboxName--` にする必要があります）。

![&#x200B; 左側のナビゲーションで「Edge設定」アイコンをクリック &#x200B;](./images/edgeconfig1b.png)

**[!UICONTROL 新規データストリーム]** をクリックします。

![&#x200B; 左側のナビゲーションで「Edge設定」アイコンをクリック &#x200B;](./images/edgeconfig1.png)

**[!UICONTROL 名前]** には、オプションの説明には、`--aepUserLdap-- - Demo System Datastream` と入力します。 **マッピングスキーマ** については、**デモシステム - Web サイトのイベントスキーマ（グローバル v1.1）** を選択してください。 「**保存**」をクリックします。

![Edge設定に名前を付けて保存する &#x200B;](./images/edgeconfig2.png)

その後、これが表示されます。 **サービスを追加** をクリックします。

![Edge設定に名前を付けて保存する &#x200B;](./images/edgeconfig3.png)

サービス **[!UICONTROL Adobe Experience Platform]** を選択すると、追加のフィールドが表示されます。 その後、これが表示されます。

「イベントデータセット」で **「Demo System - Event Dataset for Website （Global v1.1）」を選択し** 「プロファイルデータセット」で **「Demo System - Profile Dataset for Website （Global v1.1）**」を選択します。 「**保存**」をクリックします。

![Edge設定に名前を付けて保存する &#x200B;](./images/edgeconfig4.png)

この画面が表示されます。

![Edge設定に名前を付けて保存する &#x200B;](./images/edgeconfig5.png)

今のところはこれで終わりです。 [&#x200B; モジュール 1.1](./../../../modules/datacollection/module1.1/data-ingestion-launch-web-sdk.md) では、Web SDKとその機能をすべて設定する方法について説明します。

左側のメニューで、「**[!UICONTROL タグ]**」をクリックします。

検索結果をフィルタリングして、データ収集プロパティを表示します。 **Web** プロパティをクリックして開きます。

![Edge設定に名前を付けて保存する &#x200B;](./images/edgeconfig10a.png)

その後、これが表示されます。 **拡張機能** をクリックします。

![Edge設定に名前を付けて保存する &#x200B;](./images/edgeconfig11.png)

最初に、Adobe Experience Platform Web SDK拡張機能をクリックしてから、**設定** をクリックします。

![Edge設定に名前を付けて保存する &#x200B;](./images/edgeconfig12.png)

その後、これが表示されます。 **データストリーム** メニューを確認し、適切なサンドボックスが選択されていることを確認します。この場合、`--aepSandboxName--` にする必要があります。

![Edge設定に名前を付けて保存する &#x200B;](./images/edgeconfig12a.png)

**データストリーム** ドロップダウンを開き、前に作成したデータストリームを選択します。

![Edge設定に名前を付けて保存する &#x200B;](./images/edgeconfig13.png)

3 つの異なる環境すべてで、**データストリーム** が選択されていることを確認します。 次に、「**保存**」をクリックします。

![Edge設定に名前を付けて保存する &#x200B;](./images/edgeconfig14.png)

**公開フロー** に移動します。

![Edge設定に名前を付けて保存する &#x200B;](./images/edgeconfig15.png)

**メイン** の「**...**」をクリックし、「**編集**」をクリックします。

![Edge設定に名前を付けて保存する &#x200B;](./images/edgeconfig16.png)

「**変更されたリソースをすべて追加**」をクリックし、「**開発用に保存してビルド**」をクリックします。

![Edge設定に名前を付けて保存する &#x200B;](./images/edgeconfig17.png)

変更を公開中です。数分後に準備が整い、その後 **メイン** の横に緑の点が表示されます。

![Edge設定に名前を付けて保存する &#x200B;](./images/edgeconfig17a.png)

## モバイルデータ収集用のデータストリームを作成

[https://experience.adobe.com/#/data-collection/](https://experience.adobe.com/#/data-collection/) に移動します。

**[!UICONTROL データストリーム]** をクリックします。

![&#x200B; 左側のナビゲーションでデータストリームアイコンをクリック &#x200B;](./images/edgeconfig1a.png)

画面の右上隅にあるサンドボックス名を選択します（`--aepSandboxName--` にする必要があります）。

![&#x200B; 左側のナビゲーションで「Edge設定」アイコンをクリック &#x200B;](./images/edgeconfig1b.png)

**[!UICONTROL 新規データストリーム]** をクリックします。

![&#x200B; 左側のナビゲーションでデータストリームアイコンをクリック &#x200B;](./images/edgeconfig1.png)

**[!UICONTROL わかりやすい名前]** と、オプションの説明に `--aepUserLdap-- - Demo System Datastream (Mobile)` と入力します。 **マッピングスキーマ** については、**デモシステム – モバイルアプリのイベントスキーマ（グローバル v1.1）** を選択してください。 「**保存**」をクリックします。

「**[!UICONTROL 保存]**」をクリックします。

![&#x200B; データストリームに名前を付けて保存する &#x200B;](./images/edgeconfig2m.png)

その後、これが表示されます。 **サービスを追加** をクリックします。

![&#x200B; データストリームに名前を付けて保存する &#x200B;](./images/edgeconfig3m.png)

サービス **[!UICONTROL Adobe Experience Platform]** を選択すると、追加のフィールドが表示されます。 その後、これが表示されます。

「イベントデータセット」で **「デモシステム – モバイルアプリのイベントデータセット （グローバル v1.1）**」を選択し、「プロファイルデータセット」で **「デモシステム – モバイルアプリのプロファイルデータセット （グローバル v1.1）**」を選択します。 「**保存**」をクリックします。

![&#x200B; データストリーム設定に名前を付けて保存 &#x200B;](./images/edgeconfig4m.png)

その後、これが表示されます。

![&#x200B; データストリーム設定に名前を付けて保存 &#x200B;](./images/edgeconfig5m.png)

これで、モバイル用Adobe Experience Platform データ収集クライアントプロパティでデータストリームを使用する準備が整いました。

**タグ** に移動し、検索結果をフィルタリングして、データ収集プロパティを表示します。 **モバイル** のプロパティをクリックして開きます。

![Edge設定に名前を付けて保存する &#x200B;](./images/edgeconfig10am.png)

その後、これが表示されます。 **拡張機能** をクリックします。

![Edge設定に名前を付けて保存する &#x200B;](./images/edgeconfig11m.png)

**Adobe Experience Platform Edge Network** 拡張機能をクリックしてから、「**設定** をクリックします。

![Edge設定に名前を付けて保存する &#x200B;](./images/edgeconfig12m.png)

その後、これが表示されます。 ここで、設定した正しいサンドボックスとデータストリームを選択する必要があります。 使用するサンドボックスは `--aepSandboxName--` で、データストリームは `--aepUserLdap-- - Demo System Datastream (Mobile)` と呼ばれます。

**Edge Network ドメイン** の場合は、既定のドメインを使用してください。

「**保存**」をクリックして変更を保存します。

![Edge設定に名前を付けて保存する &#x200B;](./images/edgeconfig13m.png)

**公開フロー** に移動します。

![Edge設定に名前を付けて保存する &#x200B;](./images/edgeconfig15m.png)

**メイン** の横にある「**...**」をクリックし、「**編集**」をクリックします。

![Edge設定に名前を付けて保存する &#x200B;](./images/edgeconfig16m.png)

「**変更されたリソースをすべて追加**」をクリックし、「**開発用に保存してビルド**」をクリックします。

![Edge設定に名前を付けて保存する &#x200B;](./images/edgeconfig17m.png)

変更を公開中です。数分後に準備が整い、その後 **メイン** の横に緑の点が表示されます。

![Edge設定に名前を付けて保存する &#x200B;](./images/edgeconfig17ma.png)

次の手順：[Web サイトの使用 &#x200B;](./ex4.md)

[「はじめに」に戻る](./getting-started.md)

[すべてのモジュールに戻る](./../../../overview.md)
