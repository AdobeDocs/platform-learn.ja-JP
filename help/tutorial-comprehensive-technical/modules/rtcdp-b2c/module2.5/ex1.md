---
title: Adobe Experience Platform データ収集とリアルタイムイベント転送サイド転送 – Adobe Experience Platform データ収集イベント転送プロパティを作成します
description: Adobe Experience Platform Data Collection イベント転送プロパティの作成
kt: 5342
doc-type: tutorial
source-git-commit: 2cdc145d7f3933ec593db4e6f67b60961a674405
workflow-type: tm+mt
source-wordcount: '759'
ht-degree: 1%

---

# 2.5.1 Adobe Experience Platform Data Collection Event Forwarding プロパティを作成する

>[!NOTE]
>
>Adobe Experience Platform Edge モバイル拡張機能は、現在BETAにあります。 この拡張機能は招待状でのみ使用できます。 このチュートリアルの詳細や資料へのアクセスについては、担当のAdobeカスタマーサクセスマネージャーにお問い合わせください。

## 2.5.1.1 Adobe Experience Platform Data Collection Event Forwarding プロパティとは

通常、Adobe Experience Platform データ収集を使用してデータを収集する場合、データは **クライアントサイド** で収集されます。 **クライアントサイド** は web サイトやモバイルアプリケーションなどの環境です。 モジュール 0 とモジュール 1 では、Adobe Experience Platform Data Collection Client プロパティの設定について詳しく説明し、顧客が web サイトやモバイルアプリケーションを操作する際にデータを収集できるように、Adobe Experience Platform Data Collection Client プロパティを web サイトやモバイルアプリケーションに実装しました。

そのインタラクションデータがAdobe Experience Platform データ収集クライアントプロパティによって収集されると、web サイトまたはモバイルアプリからAdobeのEdgeにリクエストが送信されます。 Edgeは、Adobeのデータ収集Adobeであり、クリックストリームデータを環境エコシステムに入力するためのエントリポイントです。 Edgeから収集されたデータは、Adobe Experience Platform、Adobe Analytics、Adobe Audience Manager、Adobe Targetなどのアプリケーションに送信されます。

Adobe Experience Platform Data Collection Event Forwarding プロパティの追加により、Edgeで受信データをリッスンするAdobe Experience Platform Data Collection プロパティを設定できるようになりました。 Edgeで実行中のAdobe Experience Platform Data Collection Event Forwarding プロパティは、受信データを表示すると、そのデータを使用して別の場所に転送できます。 他の場所もAdobe以外の外部 Webhook にできるようになりました。これにより、そのデータを、例えば、任意のデータレイク、決定アプリケーション、または Webhook を開くことができるその他のアプリケーションに送信できます。

Adobe Experience Platform データ収集イベント転送プロパティの設定はクライアントプロパティによく知られていますが、Adobe Experience Platform データ収集クライアントプロパティでデータ要素とルールを以前と同じように設定できます。 ただし、データにアクセスして使用する方法は、使用例によって若干異なります。

まず、Adobe Experience Platform Data Collection Event Forwarding プロパティを作成します。

## 2.5.1.2 Adobe Experience Platform Data Collection Event Forwarding プロパティを作成する

[https://experience.adobe.com/#/data-collection/](https://experience.adobe.com/#/data-collection/) に移動します。 左側のメニューで、「**イベント転送**」をクリックします。 次に、使用可能なすべてのAdobe Experience Platform Data Collection Event Forwarding プロパティの概要が表示されます。 「**新規プロパティ**」ボタンをクリックします。

![Adobe Experience Platform データ収集 SSF](./images/launchhome.png)

Adobe Experience Platform Data Collection Event Forwarding プロパティの名前を入力する必要があります。 命名規則として、`--demoProfileLdap-- - Demo System (DD/MM/YYYY) (Edge)` を使用します。 例えば、この例では、名前は **vangeluw - Demo System （22/02/2022） （Edge）** です。 「**保存**」をクリックします。

![Adobe Experience Platform データ収集 SSF](./images/ssf1.png)

Adobe Experience Platform Data Collection Event Forwarding プロパティのリストに戻ります。 クリックして、作成したプロパティを開きます。

![Adobe Experience Platform データ収集 SSF](./images/ssf2.png)

## 2.5.1.2 Adobeの Cloud Connector 拡張機能の設定

左側のメニューで、**拡張機能** に移動します。 **Core** 拡張機能が既に設定されていることがわかります。

![Adobe Experience Platform データ収集 SSF](./images/ssf3.png)

**カタログ** に移動します。 **Adobeクラウドコネクタ** 拡張機能が表示されます。 「**インストール**」をクリックして、インストールします。

![Adobe Experience Platform データ収集 SSF](./images/ssf4.png)

その後、拡張機能が追加されます。 この手順では、行う設定はありません。 インストールされた拡張機能の概要に戻されます。

![Adobe Experience Platform データ収集 SSF](./images/ssf5.png)

## 2.5.1.3 Adobe Experience Platform Data Collection Event Forwarding プロパティのデプロイ

左側のメニューで、**公開フロー** に移動します。 **ライブラリを追加** をクリックします。

![Adobe Experience Platform データ収集 SSF](./images/ssf6.png)

名前 **メイン** を入力し、環境 **開発（開発）** を選択して、「**+変更されたすべてのリソースを追加**」をクリックします。

![Adobe Experience Platform データ収集 SSF](./images/ssf7.png)

その後、これが表示されます。 「**保存して開発用にビルド**」をクリックします。

![Adobe Experience Platform データ収集 SSF](./images/ssf8.png)

その後、ライブラリが構築されます（1～2 分かかる場合があります）。

![Adobe Experience Platform データ収集 SSF](./images/ssf9.png)

最後に、ライブラリが構築され、準備が整います。

![Adobe Experience Platform データ収集 SSF](./images/ssf10.png)

次の手順：[2.5.2 データ収集イベント転送プロパティでデータを使用できるように、データストリームを更新する ](./ex2.md)

[モジュール 2.5 に戻る](./aep-data-collection-ssf.md)

[すべてのモジュールに戻る](./../../../overview.md)
