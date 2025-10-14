---
title: Offer Decisioning – 意思決定のテスト
description: Offer Decisioning – 意思決定のテスト
kt: 5342
doc-type: tutorial
exl-id: c40b9b8c-9717-403c-bf02-6b8f42a59c05
source-git-commit: 2e856759e1a9b5509ad0632e28b269bcfc4ae861
workflow-type: tm+mt
source-wordcount: '414'
ht-degree: 1%

---

# 3.3.3 アプリ内メッセージを含むキャンペーンの設定

[Adobe Experience Cloud](https://experience.adobe.com) に移動して、Adobe Journey Optimizerにログインします。 **Journey Optimizer** をクリックします。

![ACOP](./../../../../modules/delivery-activation/ajo-b2c/ajob2c-1/images/acophome.png)

Journey Optimizerの **ホーム** ビューにリダイレクトされます。 最初に、正しいサンドボックスを使用していることを確認します。 使用するサンドボックスは `--aepSandboxName--` です。 その後、サンドボックス **ージの** ホーム `--aepSandboxName--` ビューに移動します。

![ACOP](./../../../../modules/delivery-activation/ajo-b2c/ajob2c-1/images/acoptriglp.png)

## 3.3.3.1 アプリ内メッセージチャネルの設定

左側のメニューで、**チャネル** に移動し、**チャネル設定** を選択します。 **チャネル設定を作成** をクリックします。

![&#x200B; アプリ内 &#x200B;](./images/inapp1.png)

名前 `--aepUserLdap--_In-app_Messages` を入力し、チャンネル **アプリ内メッセージ** を選択してから、プラットフォーム **Web**、**iOS** および **Android** を有効にします。

![&#x200B; アプリ内 &#x200B;](./images/inapp2.png)

下にスクロールすると、これが表示されます。

![&#x200B; アプリ内 &#x200B;](./images/inapp3.png)

**単一ページ** が有効になっていることを確認します。

**Web** については、**はじめに** モジュールの一部として以前に作成した web サイトの URL を入力します。次に `https://dsn.adobe.com/web/--aepUserLdap---XXXX` を示します。 必ず **XXXX** を web サイトの一意のコードに変更してください。

**iOS** および **Android** には、`com.adobe.dsn.dxdemo` と入力します。

![&#x200B; アプリ内 &#x200B;](./images/inapp4.png)

上にスクロールして、「送信 **をクリックし** す。

![&#x200B; アプリ内 &#x200B;](./images/inapp5.png)

これで、チャネル設定を使用する準備が整いました。

![&#x200B; アプリ内 &#x200B;](./images/inapp6.png)

## 3.3.3.2 アプリ内メッセージ用のスケジュール済みキャンペーンの設定

左側のメニューで **キャンペーン** に移動し、「**キャンペーンを作成**」をクリックします。

![&#x200B; アプリ内 &#x200B;](./images/inapp7.png)

**スケジュール済み – マーケティング** を選択し、「**作成**」をクリックします。

![&#x200B; アプリ内 &#x200B;](./images/inapp8.png)

`--aepUserLdap-- - CitiSignal Fiber Max` という名前を入力し、「**アクション**」をクリックします。

![&#x200B; アプリ内 &#x200B;](./images/inapp9.png)

「**+アクションを追加**」をクリックし、「**アプリ内メッセージ**」を選択します。

![&#x200B; アプリ内 &#x200B;](./images/inapp10.png)

前の手順で作成したアプリ内メッセージチャネル設定（`--aepUserLdap--_In-app_Messages`）を選択します。 「**コンテンツを編集**」をクリックします。

![&#x200B; アプリ内 &#x200B;](./images/inapp11.png)

この画像が表示されます。 **モーダル** をクリックします。

![&#x200B; アプリ内 &#x200B;](./images/inapp12.png)

**レイアウトを変更** をクリックします。

![&#x200B; アプリ内 &#x200B;](./images/inapp13.png)

**メディア URL** アイコンをクリックして、AEM Assetsからアセットを選択します。

![&#x200B; アプリ内 &#x200B;](./images/inapp14.png)

フォルダー **citignal-images** に移動し、画像ファイル **neon-rabbit.jpg** を選択します。 「**選択**」をクリックします。

![&#x200B; アプリ内 &#x200B;](./images/inapp15.png)

**ヘッダー** テキストには、`CitiSignal Fiber Max` を使用します。
**本文** テキストには、`Conquer lag with Fiber Max` を使用します。

![&#x200B; アプリ内 &#x200B;](./images/inapp16.png)

**Button #1 text** を `Go to Plans` に設定します。
**target** を `com.adobe.dsn.dxdemo://plans` に設定します。

**アクティブ化するレビュー** をクリックします。

![&#x200B; アプリ内 &#x200B;](./images/inapp17.png)

**アクティブ化** をクリックします。

![&#x200B; アプリ内 &#x200B;](./images/inapp18.png)

これで、キャンペーンのステータスが「**アクティブ化中** に設定されました。 キャンペーンが開始されるまでに数分かかる場合があります。

![&#x200B; アプリ内 &#x200B;](./images/inapp19.png)

ステータスが **ライブ** に変更されたら、キャンペーンをテストできます。

![&#x200B; アプリ内 &#x200B;](./images/inapp20.png)

## 3.3.3.3 モバイルでのアプリ内メッセージキャンペーンのテスト

モバイルデバイスで、アプリを開きます。 アプリを起動すると、新しいアプリ内メッセージが表示されます。 「計画に進む **ボタンをクリックし** す。

![&#x200B; アプリ内 &#x200B;](./images/inapp21.png)

その後、**プラン** ページに移動します。

![&#x200B; アプリ内 &#x200B;](./images/inapp22.png)

## 次の手順

[&#x200B; 概要とメリット &#x200B;](./summary.md){target="_blank"} に移動します。

[Adobe Journey Optimizer: プッシュとアプリ内メッセージ &#x200B;](ajopushinapp.md){target="_blank"} に戻る

[&#x200B; すべてのモジュール &#x200B;](./../../../../overview.md){target="_blank"} に戻る
