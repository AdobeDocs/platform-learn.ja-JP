---
title: はじめに – データストリームの作成
description: はじめに – データストリームの作成
kt: 5342
doc-type: tutorial
exl-id: d36057b4-64c6-4389-9612-d3c9cf013117
source-git-commit: ef26abbeb0c1076adbada57f0f18f11c7634d022
workflow-type: tm+mt
source-wordcount: '827'
ht-degree: 2%

---

# データストリームの作成

[https://experience.adobe.com/#/data-collection/](https://experience.adobe.com/#/data-collection/) に移動します。

![DSN](./images/launchprop.png)

左側のメニューで、「**[!UICONTROL タグ]**」をクリックします。 前の演習の後、3 つのデータ収集プロパティが得られました。1 つは web 用、1 つはモバイル用、もう 1 つは CX アプリ用です。

![DSN](./images/launchprop1.png)

これらのプロパティは、ほとんど使用する準備ができていますが、これらのプロパティを使用してデータの収集を開始する前に、データストリームを設定する必要があります。 データストリームとは何か、およびその意味に関する概念については、後のデータ収集モジュールの演習で詳しく説明します。

今のところ、次の手順に従ってください。

## Web 用データストリームの作成

**[!UICONTROL データストリーム]** をクリックします。

![ 左側のナビゲーションで「Edge設定」アイコンをクリック ](./images/edgeconfig1a.png)

画面の右上隅にあるサンドボックス名を選択します（`--aepSandboxName--` にする必要があります）。

![ 左側のナビゲーションで「Edge設定」アイコンをクリック ](./images/edgeconfig1b.png)

**[!UICONTROL 新規データストリーム]** をクリックします。

![ 左側のナビゲーションで「Edge設定」アイコンをクリック ](./images/edgeconfig1.png)

**[!UICONTROL 名前]** には、オプションの説明には、`--aepUserLdap-- - One Adobe Datastream` と入力します。 **マッピングスキーマ** については、**デモシステム - Web サイトのイベントスキーマ（グローバル v1.1）** を選択してください。 「**保存**」をクリックします。

![Edge設定に名前を付けて保存する ](./images/edgeconfig2.png)

その後、これが表示されます。 **サービスを追加** をクリックします。

![Edge設定に名前を付けて保存する ](./images/edgeconfig3.png)

サービス **[!UICONTROL Adobe Experience Platform]** を選択すると、追加のフィールドが表示されます。 その後、これが表示されます。

「イベントデータセット」で **「Demo System - Event Dataset for Website （Global v1.1）」を選択し** 「プロファイルデータセット」で **「Demo System - Profile Dataset for Website （Global v1.1）**」を選択します。 「**保存**」をクリックします。

![Edge設定に名前を付けて保存する ](./images/edgeconfig4.png)

この画面が表示されます。

![Edge設定に名前を付けて保存する ](./images/edgeconfig5.png)

左側のメニューで、「**[!UICONTROL タグ]**」をクリックします。

検索結果をフィルタリングして、データ収集プロパティを表示します。 **Web** プロパティをクリックして開きます。

![Edge設定に名前を付けて保存する ](./images/edgeconfig10a.png)

その後、これが表示されます。 **拡張機能** をクリックします。

![Edge設定に名前を付けて保存する ](./images/edgeconfig11.png)

最初に、Adobe Experience Platform Web SDK拡張機能をクリックしてから、**設定** をクリックします。

![Edge設定に名前を付けて保存する ](./images/edgeconfig12.png)

その後、これが表示されます。 **データストリーム** メニューを確認し、適切なサンドボックスが選択されていることを確認します。この場合、`--aepSandboxName--` にする必要があります。

![Edge設定に名前を付けて保存する ](./images/edgeconfig12a.png)

**データストリーム** ドロップダウンを開き、前に作成したデータストリームを選択します。

![Edge設定に名前を付けて保存する ](./images/edgeconfig13.png)

3 つの異なる環境すべてで、**データストリーム** が選択されていることを確認します。 次に、「**保存**」をクリックします。

![Edge設定に名前を付けて保存する ](./images/edgeconfig14.png)

**公開フロー** に移動します。

![Edge設定に名前を付けて保存する ](./images/edgeconfig15.png)

**メイン** の「**...**」をクリックし、「**編集**」をクリックします。

![Edge設定に名前を付けて保存する ](./images/edgeconfig16.png)

「**変更されたリソースをすべて追加**」をクリックし、「**開発用に保存してビルド**」をクリックします。

![Edge設定に名前を付けて保存する ](./images/edgeconfig17.png)

変更を公開中です。数分後に準備が整い、その後 **メイン** の横に緑の点が表示されます。

![Edge設定に名前を付けて保存する ](./images/edgeconfig17a.png)

## モバイル用データストリームの作成

[https://experience.adobe.com/#/data-collection/](https://experience.adobe.com/#/data-collection/) に移動します。

**[!UICONTROL データストリーム]** をクリックします。

![ 左側のナビゲーションでデータストリームアイコンをクリック ](./images/edgeconfig1a.png)

画面の右上隅にあるサンドボックス名を選択します（`--aepSandboxName--` にする必要があります）。

![ 左側のナビゲーションで「Edge設定」アイコンをクリック ](./images/edgeconfig1b.png)

**[!UICONTROL 新規データストリーム]** をクリックします。

![ 左側のナビゲーションでデータストリームアイコンをクリック ](./images/edgeconfig1.png)

**[!UICONTROL わかりやすい名前]** と、オプションの説明に `--aepUserLdap-- - One Adobe Datastream (Mobile)` と入力します。 **マッピングスキーマ** については、**デモシステム – モバイルアプリのイベントスキーマ（グローバル v1.1）** を選択してください。 「**保存**」をクリックします。

「**[!UICONTROL 保存]**」をクリックします。

![ データストリームに名前を付けて保存する ](./images/edgeconfig2m.png)

その後、これが表示されます。 **サービスを追加** をクリックします。

![ データストリームに名前を付けて保存する ](./images/edgeconfig3m.png)

サービス **[!UICONTROL Adobe Experience Platform]** を選択すると、追加のフィールドが表示されます。 その後、これが表示されます。

「イベントデータセット」で **「デモシステム – モバイルアプリのイベントデータセット （グローバル v1.1）**」を選択し、「プロファイルデータセット」で **「デモシステム – モバイルアプリのプロファイルデータセット （グローバル v1.1）**」を選択します。 「**保存**」をクリックします。

![ データストリーム設定に名前を付けて保存 ](./images/edgeconfig4m.png)

その後、これが表示されます。

![ データストリーム設定に名前を付けて保存 ](./images/edgeconfig5m.png)

これで、モバイル用Adobe Experience Platform データ収集クライアントプロパティでデータストリームを使用する準備が整いました。

**タグ** に移動し、検索結果をフィルタリングして、2 つのデータ収集プロパティを表示します。 **モバイル** のプロパティをクリックして開きます。

![Edge設定に名前を付けて保存する ](./images/edgeconfig10am.png)

その後、これが表示されます。 **拡張機能** をクリックします。

![Edge設定に名前を付けて保存する ](./images/edgeconfig11m.png)

**Adobe Experience Platform Edge Network** 拡張機能をクリックしてから、「**設定** をクリックします。

![Edge設定に名前を付けて保存する ](./images/edgeconfig12m.png)

その後、これが表示されます。 ここで、設定した正しいサンドボックスとデータストリームを選択する必要があります。 使用するサンドボックスは `--aepSandboxName--` で、データストリームは `--aepUserLdap-- - Demo System Datastream (Mobile)` と呼ばれます。

**Edge Network ドメイン** の場合は、デフォルトのドメインを使用してください。

「**保存**」をクリックして変更を保存します。

![Edge設定に名前を付けて保存する ](./images/edgeconfig13m.png)

**公開フロー** に移動します。

![Edge設定に名前を付けて保存する ](./images/edgeconfig15m.png)

**メイン** の横にある「**...**」をクリックし、「**編集**」をクリックします。

![Edge設定に名前を付けて保存する ](./images/edgeconfig16m.png)

「**変更されたリソースをすべて追加**」をクリックし、「**開発用に保存してビルド**」をクリックします。

![Edge設定に名前を付けて保存する ](./images/edgeconfig17m.png)

変更を公開中です。数分後に準備が整い、その後 **メイン** の横に緑の点が表示されます。

![Edge設定に名前を付けて保存する ](./images/edgeconfig17ma.png)

## 次の手順

[Web サイトを使用 ](./ex4.md) に移動します。

[ はじめに ](./getting-started.md){target="_blank"} に戻る

[ すべてのモジュール ](./../../../overview.md){target="_blank"} に戻る