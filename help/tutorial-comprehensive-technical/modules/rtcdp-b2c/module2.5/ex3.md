---
title: Adobe Experience Platform Data Collection とリアルタイムサーバーサイド転送 – カスタム Webhook を作成および設定します
description: カスタム Webhook の作成と設定
kt: 5342
doc-type: tutorial
exl-id: bb712980-5910-4f01-976b-b7fcf03f5407
source-git-commit: b4a7144217a68bc0b1bc70b19afcbc52e226500f
workflow-type: tm+mt
source-wordcount: '1107'
ht-degree: 1%

---

# 2.5.3 カスタム Webhook の作成と設定

## カスタム Webhook の作成

[https://pipedream.com/requestbin](https://pipedream.com/requestbin) に移動します。 このアプリケーションは、[Exercise 2.3.7 Destinations SDK](./../../../modules/rtcdp-b2c/module2.3/ex7.md) で既に使用されています

そのサービスをまだ使用していない場合は、アカウントを作成してからワークスペースを作成します。 ワークスペースを作成すると、次のような情報が表示されます。

「**コピー**」をクリックして、URL をコピーします。 次の演習では、この URL を指定する必要があります。 この例の URL は `https://eodts05snjmjz67.m.pipedream.net` です。

![ デモ ](./images/webhook1.png)

この web サイトは、あなたのためにこの Webhook を作成しました。イベントの転送のテストを開始するために、**[!DNL Event Forwarding property]** でこの Webhook を設定できるようになります。

## イベント転送プロパティの更新：データ要素の作成

[https://experience.adobe.com/#/data-collection/](https://experience.adobe.com/#/data-collection/) に移動し、**イベント転送** に移動します。 イベント転送プロパティを検索し、クリックして開きます。

![Adobe Experience Platform データ収集 SSF](./images/prop1.png)

左側のメニューで、**データ要素** に移動します。 「**新規データ要素を作成**」をクリックします。

![Adobe Experience Platform データ収集 SSF](./images/de1.png)

その後、設定する新しいデータ要素が表示されます。

![Adobe Experience Platform データ収集 SSF](./images/de2.png)

次の選択を行います。

- 「**名前**」に「**XDM イベント**」と入力します。
- **拡張機能** として、「**コア**」を選択します。
- **データ要素タイプ** として、「**パス**」を選択します。
- **パス** として、「**XDM からデータを読み取り（arc.event.xdm）**」を選択します。 このパスを選択すると、web サイトやモバイルアプリからAdobe Edgeに送信されるイベントペイロードから **XDM** セクションがフィルタリングされます。

![Adobe Experience Platform データ収集 SSF](./images/de3.png)

これで完了です。 「**保存**」をクリックします。

![Adobe Experience Platform データ収集 SSF](./images/de3a.png)

>[!NOTE]
>
>上記のパスでは、**arc** への参照が作成されます。 **arc** はAdobeリソースコンテキストを表し、**arc** は常にサーバーサイドコンテキストで使用可能な最も高いオブジェクトを表します。 Adobe Experience Platform Data Collection Server の関数を使用して、その **arc** オブジェクトにエンリッチメントと変換を追加できます。
>
>上記のパスでは、**event** への参照が作成されます。 **event** は一意のイベントを表し、Adobe Experience Platform Data Collection Server は常にすべてのイベントを個別に評価します。 Web SDK クライアントサイドで送信されるペイロードに **events** への参照が表示されることがありますが、Adobe Experience Platform Data Collection Server では、すべてのイベントが個別に評価されます。

## Adobe Experience Platform Data Collection Server プロパティの更新：ルールの作成

左側のメニューで、「ルール **に移動** ます。 「**新規ルールを作成**」をクリックします。

![Adobe Experience Platform データ収集 SSF](./images/rl1.png)

設定する新しいルールが表示されます。 **名前**:**すべてのページ** を入力します。 この演習では、条件を設定する必要はありません。 代わりに、アクションを設定します。 **アクション** の下の「**+追加**」ボタンをクリックします。

![Adobe Experience Platform データ収集 SSF](./images/rl2.png)

その後、これが表示されます。 次の選択を行います。

- **拡張機能**:**Adobeクラウドコネクタ** を選択します。
- **アクションタイプ**:**フェッチ呼び出しを実行** を選択します。

これにより、次の **名前** が得られます。**Adobeクラウドコネクタ – フェッチ呼び出しを行う**。 次の情報が表示されます。

![Adobe Experience Platform データ収集 SSF](./images/rl4.png)

次に、以下を設定します。

- リクエストメソッドをGETから **POSTに変更します**
- 前の手順の 1 つで作成したカスタム Webhook の URL を、次のように入力します。`https://eodts05snjmjz67.m.pipedream.net`

これで、このが得られます。 次に、**本文** に移動します。

![Adobe Experience Platform データ収集 SSF](./images/rl6.png)

その後、これが表示されます。 以下に示すように、データ要素アイコンをクリックします。

![Adobe Experience Platform データ収集 SSF](./images/rl7.png)

ポップアップで、前の手順で作成したデータ要素 **XDM イベント** を選択します。 「**選択**」をクリックします。

![Adobe Experience Platform データ収集 SSF](./images/rl8.png)

その後、これが表示されます。 「**変更を保存**」をクリックします。

![Adobe Experience Platform データ収集 SSF](./images/rl9.png)

その後、これが表示されます。 「**保存**」をクリックします。

![Adobe Experience Platform データ収集 SSF](./images/rl10.png)

これで、イベント転送プロパティの最初のルールが設定されました。 **公開フロー** に移動して、変更を公開します。
示すように **編集** をクリックして、開発ライブラリ **メイン** を開きます。

![Adobe Experience Platform データ収集 SSF](./images/rl11.png)

「**変更されたすべてのリソースを追加**」ボタンをクリックすると、ルールとデータ要素がこのライブラリに表示されます。 次に、「開発用に保存してビルド **をクリックします**。 変更をデプロイしています。

![Adobe Experience Platform データ収集 SSF](./images/rl13.png)

数分後、デプロイメントが完了し、テストする準備が整ったことが表示されます。

![Adobe Experience Platform データ収集 SSF](./images/rl14.png)

## 設定のテスト

[https://dsn.adobe.com](https://dsn.adobe.com) に移動します。 Adobe IDでログインすると、このが表示されます。 Web サイトプロジェクトで「。..**」** いう 3 つのドットをクリックし、「**実行**」をクリックして開きます。

![DSN](./../../datacollection/module1.1/images/web8.png)

その後、デモ Web サイトが開きます。 URL を選択してクリップボードにコピーします。

![DSN](../../gettingstarted/gettingstarted/images/web3.png)

新しい匿名ブラウザーウィンドウを開きます。

![DSN](../../gettingstarted/gettingstarted/images/web4.png)

前の手順でコピーしたデモ Web サイトの URL を貼り付けます。 その後、Adobe IDを使用してログインするように求められます。

![DSN](../../gettingstarted/gettingstarted/images/web5.png)

アカウントタイプを選択し、ログインプロセスを完了します。

![DSN](../../gettingstarted/gettingstarted/images/web6.png)

次に、匿名ブラウザーウィンドウに web サイトが読み込まれます。 演習ごとに、新しい匿名ブラウザーウィンドウを使用して、デモ Web サイトの URL を読み込む必要があります。

![DSN](../../gettingstarted/gettingstarted/images/web7.png)

ブラウザーの開発者ビューを開くと、次に示すようにネットワークリクエストを調べることができます。 フィルター **interact** を使用すると、Adobe Experience Platform データ収集クライアントからAdobe Edgeに送信されるネットワークリクエストが表示されます。

![Adobe Experience Platform データ収集のセットアップ ](./images/hook1.png)

生のペイロードを選択した場合は、[https://jsonformatter.org/json-pretty-print](https://jsonformatter.org/json-pretty-print) に移動して、ペイロードを貼り付けます。 **縮小/美化** をクリックします。 次に、JSON ペイロード、**events** オブジェクト、および **xdm** オブジェクトが表示されます。 前の手順の 1 つで、データ要素を定義したとき、参照 **arc.event.xdm** を使用しました。これにより、このペイロードの **xdm** オブジェクトが解析されます。

![Adobe Experience Platform データ収集のセットアップ ](./images/hook2.png)

前の手順のいずれかで使用したカスタム Webhook ](https://webhook.site/)0}https://webhook.site/} に表示を切り替えます。 [これで、これに類似したビューが作成され、左側のメニューにネットワークリクエストが表示されます。 上記のネットワークリクエストから除外された **xdm** ペイロードが表示されます。

![Adobe Experience Platform データ収集のセットアップ ](./images/hook3.png)

ペイロードを少し下にスクロールして、ページ名（この場合は **home**）を見つけます。

![Adobe Experience Platform データ収集のセットアップ ](./images/hook4.png)

Web サイト上を移動すると、追加のネットワークリクエストが、このカスタム Webhook でリアルタイムに利用できるようになります。

![Adobe Experience Platform データ収集のセットアップ ](./images/hook5.png)

これで、外部のカスタム Webhook への Web SDK/XDM ペイロードのサーバーサイドのイベント転送を設定しました。 次の演習では、同様のアプローチを設定し、同じデータをGoogle環境とAWS環境に送信します。

次の手順：[2.5.4 Google Cloud 関数を作成して設定する ](./ex4.md)

[モジュール 2.5 に戻る](./aep-data-collection-ssf.md)

[すべてのモジュールに戻る](./../../../overview.md)
