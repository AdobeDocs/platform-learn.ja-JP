---
title: Adobe Journey Optimizer - iOS用のプッシュ通知の設定と使用
description: iOSのプッシュ通知の設定と使用
kt: 5342
doc-type: tutorial
source-git-commit: 6962a0d37d375e751a05ae99b4f433b0283835d0
workflow-type: tm+mt
source-wordcount: '1831'
ht-degree: 6%

---

# 3.4.4 iOS用のプッシュ通知の設定と使用

Adobe Journey Optimizerでプッシュ通知を使用するには、確認して知っておくべき設定がいくつかあります。

検証するすべての設定を次に示します。

- Adobe Experience Platformのデータセットとスキーマ
- モバイル用データストリーム
- モバイルのデータ収集プロパティ
- プッシュ証明書のアプリサーフェス
- AEP Assuranceを使用したプッシュ設定のテスト

1 つずつ見ていきましょう。

[Adobe Experience Cloud](https://experience.adobe.com) に移動して、Adobe Journey Optimizerにログインします。 **Journey Optimizer** をクリックします。

![ACOP](./../../../modules/ajo-b2c/module3.2/images/acophome.png)

Journey Optimizerの **ホーム** ビューにリダイレクトされます。 最初に、正しいサンドボックスを使用していることを確認します。 使用するサンドボックスは `--aepSandboxName--` です。 サンドボックスを切り替えるには、「**実稼動製品（VA7）」をクリックし** リストからサンドボックスを選択します。 この例では、サンドボックスの名前は **AEP イネーブルメント FY22** です。 その後、サンドボックス `--aepSandboxName--` ージの **ホーム** ビューに移動します。

![ACOP](./../../../modules/ajo-b2c/module3.2/images/acoptriglp.png)

## 3.4.4.1 プッシュデータセット

Adobe Journey Optimizerは、データセットを使用して、モバイルデバイスからのプッシュトークンや、プッシュメッセージとのインタラクション（送信済みメッセージ、開封されたメッセージなど）をAdobe Journey Optimizerのデータセットに保存します。

これらのデータセットは、画面左側のメニューにある **[!UICONTROL データセット]** に移動すると見つかります。 システムデータセットを表示するには、フィルターアイコンをクリックします。

![データ取得](./images/menudsjo.png)

「**システムデータセットを表示** オプションを有効にして、**AJO** を検索します。 プッシュ通知に使用するデータセットが表示されます。

![データ取得](./images/menudsjo1.png)

## 3.4.4.2 モバイル用データストリーム

[https://experience.adobe.com/#/data-collection/](https://experience.adobe.com/#/data-collection/) に移動します。

左側のメニューで、**[!UICONTROL データストリーム]** に移動し、[ 演習 0.2](./../../../modules/gettingstarted/gettingstarted/ex2.md) で作成したデータストリーム（`--aepUserLdap-- - Demo System Datastream (Mobile)` という名前）を検索します。 クリックして開きます。

![ 左側のナビゲーションでデータストリームアイコンをクリック ](./images/edgeconfig1a.png)

**2}Adobe Experience Platform** サービスの「編集 **をクリックします。**

![ 左側のナビゲーションでデータストリームアイコンをクリック ](./images/edgeconfig1.png)

次に、定義したデータストリーム設定と、どのデータセットイベントおよびプロファイル属性に保存されるかを確認します。

![ データストリームに名前を付けて保存する ](./images/edgeconfig2.png)

変更は必要ありません。これで、データストリームをモバイルのデータ収集クライアントプロパティで使用する準備が整いました。

## 3.4.4.3 モバイルのデータ収集プロパティを確認する

[https://experience.adobe.com/#/data-collection/](https://experience.adobe.com/#/data-collection/) に移動します。 [ 演習 0.1](./../../../modules/gettingstarted/gettingstarted/ex1.md) の一部として、2 つのデータ収集プロパティが作成されました。
これらのデータ収集クライアントプロパティは、既に以前のモジュールの一部として使用しています。

クリックして、モバイルのデータ収集プロパティを開きます。

![DSN](./images/launchprop.png)

データ収集プロパティで、「**拡張機能**」に移動します。 次に、モバイルアプリに必要な様々な拡張機能が表示されます。 クリックして、拡張機能 **Adobe Experience Platform Edge Network** を開きます。

![Adobe Experience Platform のデータ収集](./images/launchprop1.png)

その後、モバイルのデータストリームがここにリンクされていることがわかります。 次に、「**キャンセル**」をクリックして、拡張機能の概要に戻ります。

![Adobe Experience Platform のデータ収集](./images/launchprop2.png)

その後、ここに戻ってきます。 **AEP Assurance** の拡張機能が表示されます。 AEP Assuranceは、モバイルアプリでデータを収集したりエクスペリエンスを提供したりする方法を検査、配達確認、シミュレートおよび検証するのに役立ちます。 AEP Assuranceとプロジェクト Griffon について詳しくは、[https://aep-sdks.gitbook.io/docs/beta/project-griffon](https://aep-sdks.gitbook.io/docs/beta/project-griffon) を参照してください。

![Adobe Experience Platform のデータ収集](./images/launchprop8.png)

次に、「**設定**」をクリックして、拡張機能 **2}Adobe Journey Optimizer} を開きます。**

![Adobe Experience Platform のデータ収集](./images/launchprop9.png)

プッシュイベントをトラッキングするデータセットがリンクされている場所がわかります。

![Adobe Experience Platform のデータ収集](./images/launchprop10.png)

データ収集プロパティを変更する必要はありません。

## 3.4.4.4 アプリサーフェスの設定の確認

[https://experience.adobe.com/#/data-collection/](https://experience.adobe.com/#/data-collection/) に移動します。 左側のメニューで **アプリサーフェス** に移動し、「**DX Demo App APNS** のアプリサーフェスを開きます。

![Adobe Experience Platform のデータ収集](./images/appsf.png)

iOSとAndroid用に設定されたアプリサーフェスが表示されます。

![Adobe Experience Platform のデータ収集](./images/appsf1.png)

## 3.4.4.5 AEP Assuranceを使用したプッシュ通知の設定のテスト。

アプリがインストールされると、デバイスのホーム画面に表示されます。 アイコンをクリックして、アプリを開きます。

![DSN](./../../../modules/gettingstarted/gettingstarted/images/mobileappn1.png)

アプリを初めて使用する場合は、Adobe IDを使用してログインするように求められます。 ログインプロセスを完了します。

![DSN](./../../../modules/gettingstarted/gettingstarted/images/mobileappn2.png)

ログインすると、通知を送信する権限を要求する通知が表示されます。 チュートリアルの一部として通知を送信するので、「**許可**」をクリックします。

![DSN](./../../../modules/gettingstarted/gettingstarted/images/mobileappn3.png)

その後、アプリのホームページが表示されます。 **設定** に移動します。

![DSN](./../../../modules/gettingstarted/gettingstarted/images/mobileappn4.png)

設定では、現在 **公開プロジェクト** がアプリに読み込まれていることがわかります。 **カスタムプロジェクト** をクリックします。

![DSN](./../../../modules/gettingstarted/gettingstarted/images/mobileappn5.png)

これで、カスタムプロジェクトを読み込めるようになりました。 QR コードをクリックして、プロジェクトを簡単に読み込みます。

![DSN](./../../../modules/gettingstarted/gettingstarted/images/mobileappn6.png)

演習 0.1 の後、この結果が得られました。 クリックして、作成された **モバイル小売プロジェクト** を開きます。

![DSN](./../../../modules/gettingstarted/gettingstarted/images/dsn5b.png)

誤ってブラウザーウィンドウを閉じてしまった場合や、今後のデモまたはイネーブルメントセッションの際には、[https://builder.adobedemo.com/projects](https://builder.adobedemo.com/projects) にアクセスして web サイトプロジェクトにアクセスすることもできます。 Adobe IDでログインすると、このが表示されます。 モバイルアプリプロジェクトをクリックして開きます。

![DSN](./../../../modules/gettingstarted/gettingstarted/images/web8a.png)

その後、これが表示されます。 **統合** をクリックします。

![DSN](./../../../modules/gettingstarted/gettingstarted/images/web8aa.png)

演習 0.1 で作成したモバイルのデータ収集プロパティを選択する必要があります。次に、「**実行** をクリックします。

![DSN](./../../../modules/gettingstarted/gettingstarted/images/web8b.png)

QR コードを含むこのポップアップが表示されます。 モバイルアプリ内からこの QR コードをスキャンします。

![DSN](./../../../modules/gettingstarted/gettingstarted/images/web8c.png)

プロジェクト ID がアプリに表示されたら、「**保存**」をクリックします。

![DSN](./../../../modules/gettingstarted/gettingstarted/images/mobileappn7.png)

次に、アプリで **ホーム** に戻ります。 これで、アプリを使用する準備が整いました。

![DSN](./../../../modules/gettingstarted/gettingstarted/images/mobileappn8.png)

ここでは、QR コードをスキャンして、モバイルデバイスを AEP Assurance セッションに接続する必要があります。

AEP Assurance セッションを開始するには、[https://experience.adobe.com/#/@experienceplatform/griffon](https://experience.adobe.com/#/@experienceplatform/griffon) に移動します。 **セッションを作成** をクリックします。

![Adobe Experience Platform のデータ収集](./images/griffon3.png)

「**開始**」をクリックします。

![Adobe Experience Platform のデータ収集](./images/griffon5.png)

次の値を入力します。

- セッション名：`--aepUserLdap-- - push debugging` を使用して、ldap を ldap に置き換えます
- ベース URL: **dxdemo://default** を使用します

「**次へ**」をクリックします。

![Adobe Experience Platform のデータ収集](./images/griffon4.png)

画面に QR コードが表示されるので、iOS デバイスでスキャンする必要があります。

![Adobe Experience Platform のデータ収集](./images/griffon6.png)

モバイルデバイスでカメラアプリを開き、AEP Assuranceに表示される QR コードをスキャンします。

![Adobe Experience Platform のデータ収集](./images/ipadPushTest8a.png)

PIN コードを入力するように求めるポップアップ画面が表示されます。 AEP Assurance画面から PIN コードをコピーし、「**接続**」をクリックします。

![Adobe Experience Platform のデータ収集](./images/ipadPushTest9.png)

その後、これが表示されます。

![Adobe Experience Platform のデータ収集](./images/ipadPushTest11.png)

AEP Assuranceで、デバイサーが AEP Assurance セッションにアクセスすることがわかります。

![Adobe Experience Platform のデータ収集](./images/griffon7.png)

**プッシュデバッグ** に移動します。 このようなものが表示されます。

![Adobe Experience Platform のデータ収集](./images/griffon10.png)

説明：

- 最初の列 **クライアント** には、iOS デバイスで使用可能な識別子が表示されます。 ECID とプッシュトークンが表示されます。
- 2 番目の列には、**プロファイル** 情報と、プッシュトークンが格納されているプラットフォーム（APNS または APNSSandbox）に関する追加情報が表示されます。 「**Inspect プロファイル**」ボタンをクリックすると、Adobe Experience Platformに移動し、完全なリアルタイム顧客プロファイルが表示されます。
- 3 番目の列には、演習 **3.4.5.4 Launch でのアプリ設定の作成** の一部として設定された **アプリ設定** が表示されます。

プッシュ設定をテストするには、「**プッシュ通知を送信** ボタンをクリックします。

![Adobe Experience Platform のデータ収集](./images/griffon11.png)

**プッシュ通知を送信** ボタンをクリックしたときに **DX デモ** アプリが開いていないことを確認する必要があります。 アプリが開いている場合、プッシュ通知はバックグラウンドで受信され、表示されない可能性があります。

次に、このようなプッシュ通知がモバイルデバイスに表示されます。

![Adobe Experience Platform のデータ収集](./images/ipadPush2.png)

プッシュ通知が届いた場合は、設定が正しく、正常に動作しています。

## 3.4.4.6 新しいイベントの作成

メニューで、**ジャーニー管理** に移動し、[**イベント** の下の **管理** をクリックします。

![ACOP](./images/acopmenu.png)

**イベント** 画面には、次のようなビューが表示されます。 **イベントを作成** をクリックします。

![ACOP](./images/add.png)

空のイベント設定が表示されます。

![ACOP](./images/emptyevent.png)

まず、イベントに `--aepUserLdap--StoreEntryEvent` のような名前を付け、説明を `Store Entry Event` に設定します。

![ACOP](./images/eventname.png)

次に「**イベントタイプ** の選択です。 **単一** を選択します。

![ACOP](./images/eventidtype1.png)

次に、「**イベント ID タイプ** の選択です。 「**システムで生成**」を選択します

![ACOP](./images/eventidtype.png)

次に、スキーマを選択します。 この演習では、スキーマを準備しました。 スキーマ `Demo System - Event Schema for Mobile App (Global v1.1) v.1` を使用してください。

![ACOP](./images/eventschema.png)

スキーマを選択すると、「**ペイロード**」セクションで多数のフィールドが選択されます。 これで、イベントが完全に設定されました。

![ACOP](./images/eventpayload.png)

この画像が表示されます。 「**保存**」をクリックします。

![ACOP](./images/eventsave.png)

これで、イベントが設定され、保存されました。 イベントを再度クリックすると、**イベントを編集** 画面が再度開きます。

![ACOP](./images/eventdone.png)

**ペイロード** フィールドにマウスポインターを置き、**ペイロードを表示** アイコンをクリックします。

![ACOP](./images/hover.png)

これで、期待されるペイロードの例が表示されます。

![ACOP](./images/fullpayload.png)

イベントには一意のオーケストレーション eventID があり、`_experience.campaign.orchestration.eventID` が表示されるまでペイロードを下にスクロールすると見つかります。

![ACOP](./images/payloadeventID.png)

イベント ID は、次の手順で作成するジャーニーをトリガーにするためにAdobe Experience Platformに送信する必要があるものです。 次の手順で必要になるので、この eventID を書き留めます。
`"eventID": "e3a8f0bdc0b609667cd96a72a6b1e5aafa0ddaf6ccf121c574e6a2030860a633"`

**OK** をクリックし、続いて **キャンセル** をクリックします。

## 3.4.4.7 ジャーニーの作成

メニューで、**ジャーニーに移動し** 「**ジャーニーを作成**」をクリックします。

![DSN](./images/sjourney1.png)

その後、これが表示されます。 ジャーニーに名前を付けます。 `--aepUserLdap-- - Store Entry journey`.を使用します。「**OK**」をクリックします。

![DSN](./images/sjourney3.png)

まず、ジャーニーの出発点としてイベントを追加する必要があります。 イベント `--aepUserLdap--StoreEntryEvent` を検索して、キャンバスにドラッグ&amp;ドロップします。 「**OK**」をクリックします。

![DSN](./images/sjourney4.png)

次に、**アクション** で **プッシュ** アクションを検索します。
**プッシュ** アクションをキャンバスにドラッグ&amp;ドロップします。

![DSN](./images/sjourney5.png)

**カテゴリ** を **マーケティング** に設定し、プッシュ通知の送信を可能にするプッシュサーフェスを選択します。 この場合、選択するメールサーフェスは **プッシュ - iOS - Android** です。

![ACOP](./images/journeyactions1push.png)

次の手順では、メッセージを作成します。 それには、「**コンテンツを編集** をクリックします。

![ACOP](./images/journeyactions2push.png)

その後、これが表示されます。 **タイトル** フィールドの **パーソナライズ機能** アイコンをクリックします。

![プッシュ](./images/bp5.png)

その後、これが表示されます。 リアルタイム顧客プロファイルから任意のプロファイル属性を直接選択できるようになりました。

![プッシュ](./images/bp6.png)

フィールド **名** を検索し、フィールド **名** の横にある **+** アイコンをクリックします。 次に、名のパーソナライゼーショントークンが追加されています：**{{profile.person.name.firstName}}**。

![プッシュ](./images/bp9.png)

次に、テキスト **を追加します。**{{profile.person.name.firstName}}**の後ろに** る。

「**保存**」をクリックします。

![プッシュ](./images/bp10.png)

あなたはこれを手に入れました。 **本文** フィールドの **パーソナライズ機能** アイコンをクリックします。

![プッシュ](./images/bp11.png)

このテキストを入力してください **今日ご購入いただくと、10% の割引が適用されます。** 保存 **をクリック** ます。

![プッシュ](./images/bp12.png)

これで完了です。 左上隅の矢印をクリックして、ジャーニーに戻ります。

![Journey Optimizer](./images/bp12a.png)

「**OK**」をクリックして、プッシュアクションを閉じます。

![DSN](./images/sjourney8.png)

「**公開**」をクリックします。

![DSN](./images/sjourney10.png)

もう一度 **0}Publish} をクリックします。**

![DSN](./images/sjourney10a.png)

これで、ジャーニーが公開されました。

![DSN](./images/sjourney11.png)

## 3.4.4.8 ジャーニーのテストとプッシュメッセージ

DX Demo 2.0 モバイルアプリケーションで、**設定** 画面に移動します。 **ストアエントリ** ボタンをクリックします。

>[!NOTE]
>
>「**ストアエントリ**」ボタンは現在実装中です。 アプリにはまだ表示されません。

![DSN](./images/demo1b.png)

**ストアエントリ** アイコンをクリックした後、必ずアプリを直ちに閉じてください。閉じないと、プッシュメッセージは表示されません。

![DSN](./images/demo2.png)

数秒後に、メッセージが表示されます。

![DSN](./images/demo3.png)

この演習は完了しました。

次の手順：[3.4.5 ビジネスイベントジャーニーの作成 ](./ex5.md)

[モジュール 3.4 に戻る](./journeyoptimizer.md)

[すべてのモジュールに戻る](../../../overview.md)
