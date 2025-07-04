---
title: プッシュ通知の概要
description: プッシュ通知の概要
kt: 5342
audience: Data Engineer, Data Architect, Orchestration Engineer, Marketer
doc-type: tutorial
exl-id: b46e0205-b0a1-4a14-95f6-9afe21cd2b5e
source-git-commit: fb14ba45333bdd5834ff0c6c2dc48dda35cfe85f
workflow-type: tm+mt
source-wordcount: '1235'
ht-degree: 9%

---

# 3.3.1 プッシュ通知の概要

Adobe Journey Optimizerでプッシュ通知を使用するには、確認して知っておくべき設定がいくつかあります。

検証するすべての設定を次に示します。

- Adobe Experience Platformのデータセットとスキーマ
- モバイル用データストリーム
- モバイルのデータ収集プロパティ
- プッシュ証明書のアプリサーフェス
- AEP Assuranceを使用したプッシュ設定のテスト

1 つずつ見ていきましょう。

[Adobe Experience Cloud](https://experience.adobe.com) に移動して、Adobe Journey Optimizerにログインします。 **Journey Optimizer** をクリックします。

![ACOP](./../../../../modules/delivery-activation/ajo-b2c/ajob2c-1/images/acophome.png)

Journey Optimizerの **ホーム** ビューにリダイレクトされます。 最初に、正しいサンドボックスを使用していることを確認します。 使用するサンドボックスは `--aepSandboxName--` です。 その後、サンドボックス **ージの** ホーム `--aepSandboxName--` ビューに移動します。

![ACOP](./../../../../modules/delivery-activation/ajo-b2c/ajob2c-1/images/acoptriglp.png)

## 3.3.1.1 プッシュデータセット

Adobe Journey Optimizerは、データセットを使用して、モバイルデバイスからのプッシュトークンや、プッシュメッセージとのインタラクション（送信済みメッセージ、開封されたメッセージなど）をAdobe Journey Optimizerのデータセットに保存します。

これらのデータセットは、画面左側のメニューにある **データセット** に移動すると見つかります。 システムデータセットを表示するには、「**フィルターを有効にする** アイコンをクリックします。

**System** のオプションを有効にして、**AJO** を検索します。 プッシュ通知に使用するデータセットが表示されます。

![データ取り込み](./images/menudsjo1.png)

## モバイル用 3.3.1.2 データストリーム

[https://experience.adobe.com/#/data-collection/](https://experience.adobe.com/#/data-collection/) に移動します。

左側のメニューで、**データストリーム** に移動し、[ はじめに ](./../../../../modules/getting-started/gettingstarted/ex2.md) で作成したデータストリームを検索します。名前は `--aepUserLdap-- - One Adobe Datastream (Mobile)` です。 クリックして開きます。

![データストリーム](./images/edgeconfig1a.png)

**2&rbrace;Adobe Experience Platform** サービスの「編集 **をクリックします。**

![データストリーム](./images/edgeconfig1.png)

次に、定義したデータストリーム設定と、どのデータセットイベントおよびプロファイル属性に保存されるかを確認します。

また、まだ有効になっていない場合は、次のオプションを有効にする必要があります。

- **Offer Decisioning**
- **パーソナライゼーションの宛先**
- **Adobe Journey Optimizer**

「**保存**」をクリックします。

![ データストリームに名前を付けて保存する ](./images/edgeconfig2.png)

## モバ 3.3.1.3 ルのデータ収集プロパティを確認するには

[https://experience.adobe.com/#/data-collection/](https://experience.adobe.com/#/data-collection/) の **Tags** に移動します。 [ はじめに ](./../../../../modules/getting-started/gettingstarted/ex1.md) モジュールの一部として、データ収集タグのプロパティが作成されました。

これらのデータ収集タグのプロパティは、既に以前のモジュールの一部として使用しています。

クリックして、モバイルのデータ収集プロパティを開きます。

![DSN](./images/launchprop.png)

データ収集プロパティで、「**拡張機能**」に移動します。 次に、モバイルアプリに必要な様々な拡張機能が表示されます。 拡張機能 **Adobe Experience Platform Edge Networkをクリックして選択し** 「**設定**」を選択します。

![Adobe Experience Platform のデータ収集](./images/launchprop1.png)

その後、モバイルのデータストリームがここにリンクされていることがわかります。 次に、「**キャンセル**」をクリックして、拡張機能の概要に戻ります。

![Adobe Experience Platform のデータ収集](./images/launchprop2.png)

その後、ここに戻ってきます。 **AEP Assurance** の拡張機能が表示されます。 AEP Assuranceは、モバイルアプリでデータを収集したりエクスペリエンスを提供したりする方法を検査、配達確認、シミュレートおよび検証するのに役立ちます。 AEP Assuranceについて詳しくは、[https://experienceleague.adobe.com/en/docs/experience-platform/assurance/home](https://experienceleague.adobe.com/ja/docs/experience-platform/assurance/home) を参照してください。

![Adobe Experience Platform のデータ収集](./images/launchprop8.png)

次に、「**設定**」をクリックして、拡張機能 **2&rbrace;Adobe Journey Optimizer&rbrace; を開きます。**&#x200B;この拡張機能により、Adobe Journey Optimizerのプッシュ通知と測定が可能になります。

![Adobe Experience Platform のデータ収集](./images/launchprop9.png)

プッシュイベントをトラッキングするデータセットがリンクされている場所がわかります。 データ収集プロパティを変更する必要はありません。 前の画面に戻るには、「**キャンセル**」をクリックします。

![Adobe Experience Platform のデータ収集](./images/launchprop10.png)

## 3.3.1.4 アプリサーフェスの設定を確認する

[https://experience.adobe.com/#/data-collection/](https://experience.adobe.com/#/data-collection/) に移動します。 左側のメニューで **アプリサーフェス** に移動し、「DX Demo App APNS **のアプリサーフェスを開き** す。

![Adobe Experience Platform のデータ収集](./images/appsf.png)

iOSとAndroid用に設定されたアプリサーフェスが表示されます。

![Adobe Experience Platform のデータ収集](./images/appsf1.png)

## 3.3.1.5 AEP Assuranceを使用してプッシュ通知の設定をテストします。

**DX デモ** モバイルアプリケーションは **はじめに** モジュールの一部として既にインストールされています。 アプリがインストールされると、デバイスのホーム画面に表示されます。 アイコンをクリックして、アプリを開きます。

![DSN](./../../../../modules/getting-started/gettingstarted/images/mobileappn1.png)

ログインすると、通知を送信する権限を要求する通知が表示されます。 チュートリアルの一部として通知を送信するので、「**許可**」をクリックします。

![DSN](./../../../modules/../getting-started/gettingstarted/images/mobileappn2.png)

その後、アプリのホームページが表示されます。 **設定** に移動します。

![DSN](./../../../modules/../getting-started/gettingstarted/images/mobileappn3.png)

設定では、現在 **公開プロジェクト** がアプリに読み込まれていることがわかります。 **カスタムプロジェクト** をクリックします。

![DSN](./../../../modules/../getting-started/gettingstarted/images/mobileappn4.png)

これで、カスタムプロジェクトを読み込めるようになりました。 QR コードをクリックして、プロジェクトを簡単に読み込みます。

![DSN](./../../../modules/../getting-started/gettingstarted/images/mobileappn5.png)

**はじめに** の節を実行すると、次の結果が得られます。 クリックして、作成された **モバイル小売プロジェクト** を開きます。

![DSN](./../../../modules/../getting-started/gettingstarted/images/dsn5b.png)

誤ってブラウザーウィンドウを閉じてしまった場合や、今後のデモまたはイネーブルメントセッションの際には、[https://dsn.adobe.com/projects](https://dsn.adobe.com/projects) にアクセスして web サイトプロジェクトにアクセスすることもできます。 Adobe IDでログインすると、このが表示されます。 モバイルアプリプロジェクトをクリックして開きます。

![DSN](./../../../modules/../getting-started/gettingstarted/images/web8a.png)

次に、「**実行** をクリックします。

![DSN](./images/web8b.png)

QR コードを含むこのポップアップが表示されます。 モバイルアプリ内からこの QR コードをスキャンします。

![DSN](./../../../modules/../getting-started/gettingstarted/images/web8c.png)

その後、アプリにプロジェクト ID が表示され、「切り替え **をクリックでき** す。

![DSN](./../../../modules/../getting-started/gettingstarted/images/mobileappn7.png)

これで、アプリを使用する準備が整いました。

![DSN](./../../../modules/../getting-started/gettingstarted/images/mobileappn8.png)

ここでは、QR コードをスキャンして、モバイルデバイスをAssurance セッションに接続する必要があります。

AEP Assuranceのセッションを開始するには、[https://experience.adobe.com/#/data-collection/](https://experience.adobe.com/#/data-collection/) に移動します。 左側のメニューで **0&rbrace;Assurance&rbrace; をクリックします。**&#x200B;次に、「**セッションを作成**」をクリックします。

![Adobe Experience Platform のデータ収集](./images/griffon3.png)

**ディープリンク接続** を選択してから、**開始** をクリックします。

![Adobe Experience Platform のデータ収集](./images/griffon5.png)

次の値を入力します。

- セッション名：`--aepUserLdap-- - Push Debugging`
- ベース URL: `dxdemo://default`

「**次へ**」をクリックします。

![Adobe Experience Platform のデータ収集](./images/griffon4.png)

画面に QR コードが表示されるので、iOS デバイスでスキャンする必要があります。

![Adobe Experience Platform のデータ収集](./images/griffon6.png)

モバイルデバイスでカメラアプリを開き、Assuranceに表示される QR コードをスキャンします。

![Adobe Experience Platform のデータ収集](./images/ipadPushTest8a.png)

PIN コードを入力するように求めるポップアップ画面が表示されます。 AEP Assurance画面から PIN コードをコピーし、「**接続**」をクリックします。

![Adobe Experience Platform のデータ収集](./images/ipadPushTest9.png)

その後、これが表示されます。

![Adobe Experience Platform のデータ収集](./images/ipadPushTest11.png)

Assuranceで、クライアントデバイスがAssurance セッションに接続されていることがわかります。 次に、「**設定**」をクリックします。

![Adobe Experience Platform のデータ収集](./images/griffon7.png)

下にスクロールして **プッシュデバッグ** を表示します。 **+** アイコンをクリックしてから、「**保存** をクリックします。

![Adobe Experience Platform のデータ収集](./images/griffon7a.png)

**プッシュデバッグ** に移動します。 これが表示されます。

![Adobe Experience Platform のデータ収集](./images/griffon10.png)

説明：

- 最初の列 **クライアント** には、iOS デバイスで使用可能な識別子が表示されます。 ECID とプッシュトークンが表示されます。
- 2 番目の列には、**App Storeの資格情報と設定** が表示されます
- 2 番目の列には、**プロファイル** 情報と、プッシュトークンが格納されているプラットフォーム（APNS または APNSSandbox）に関する追加情報が表示されます。 「**プロファイルを検査**」ボタンをクリックすると、Adobe Experience Platformに移動し、完全なリアルタイム顧客プロファイルが表示されます。

プッシュ設定をテストするには、「**テストプッシュ設定を送信** ボタンに移動します。 「**テストプッシュ通知を送信**」をクリックします

![Adobe Experience Platform のデータ収集](./images/griffon11.png)

**プッシュ通知を送信** ボタンをクリックしたときに **DX デモ** アプリが開いていないことを確認する必要があります。 アプリが開いている場合、プッシュ通知はバックグラウンドで受信され、表示されない可能性があります。

次に、このようなプッシュ通知がモバイルデバイスに表示されます。

![Adobe Experience Platform のデータ収集](./images/ipadPush2.png)

プッシュ通知を受け取った場合は、設定が正しく、正常に機能しており、実際のジャーニーを作成して、Journey Optimizerからプッシュメッセージを送信できるようになりました。

## 次の手順

[3.3.2 プッシュメッセージを使用したジャーニーの設定を参照してください ](./ex2.md){target="_blank"}

[Adobe Journey Optimizer: プッシュとアプリ内メッセージ ](ajopushinapp.md){target="_blank"} に戻る

[ すべてのモジュール ](./../../../../overview.md){target="_blank"} に戻る
