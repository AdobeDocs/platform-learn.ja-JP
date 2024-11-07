---
title: Microsoft Azure Event Hub へのセグメントのアクティベーション - Azure 関数を定義する
description: Microsoft Azure Event Hub へのセグメントのアクティベーション - Azure 関数を定義する
kt: 5342
doc-type: tutorial
source-git-commit: 2cdc145d7f3933ec593db4e6f67b60961a674405
workflow-type: tm+mt
source-wordcount: '819'
ht-degree: 0%

---

# 2.4.5 Microsoft Azure プロジェクトの作成

## 2.4.5.1 Azure Event Hub 関数の理解

Azure Functions を使用すると、アプリケーションインフラストラクチャを気にすることなく、小さなコード（**functions** と呼ばれます）を実行できます。 Azure Functions を使用すると、クラウドインフラストラクチャは、アプリケーションを大規模に実行するために必要な最新のサーバーをすべて提供します。

関数は、特定のタイプのイベントによって **トリガー** されます。 サポートされるトリガーには、データの変化への対応、メッセージ（Event Hubs など）への対応、スケジュールに従った実行、または HTTP リクエストの結果としての応答が含まれます。

Azure Functions は、インフラストラクチャを明示的にプロビジョニングまたは管理することなく、イベントトリガーコードを実行できる、サーバーレスの計算サービスです。

Azure Event Hubs は、サーバーレス アーキテクチャのために Azure Functions と統合されています。

## 2.4.5.2 Visual Studio Code を開き、Azure にログオンします

Visual Studio Code を使用すると、次のことが簡単になります。

- azure 関数の定義と Event Hubs へのバインド
- ローカルでテスト
- azure にデプロイ
- リモートログ関数の実行

### Visual Studio Code を開きます。

Visual Studio Code を開くには、オペレーティングシステムの検索で **visual** と入力します（OSX でのスポットライト検索、Window のタスクバーで検索）。 見つからない場合は、[ 演習 0 – 前提条件 ](./ex0.md) で説明されている手順を繰り返す必要があります。

![visual-studio-code-icon.png](./images/visual-studio-code-icon.png)

### Azure へのログオン

[ 演習 0 – 前提条件 ](./ex0.md) で登録した Azure アカウントでログオンすると、Visual Studio Code ですべての Event Hub リソースを検索してバインドできます。

Visual Studio Code で「**Azure**」アイコンをクリックします。 そのオプションがない場合、必要な拡張機能のインストールで問題が発生した可能性があります。

次に、「**Azure にログイン**」を選択します。

![3-01-vsc-open.png](./images/3-01-vsc-open.png)

ログインするには、ブラウザーにリダイレクトされます。 登録に使用した Azure アカウントを忘れずに選択してください。

![3-02-vsc-pick-account.png](./images/3-02-vsc-pick-account.png)

ブラウザーに次の画面が表示されたら、Visual Code Studio にログインしています。

![3-03-vsc-login-ok.png](./images/3-03-vsc-login-ok.png)

Visual Code Studio に戻ります（例：**Azure サブスクリプション 1**）。

![3-04-vsc-logged-in.png](./images/3-04-vsc-logged-in.png)

## 2.4.5.3 Azure プロジェクトの作成

**Azure サブスクリプション 1** の上にマウスポインターを置くと、セクションの上にメニューが表示されるので、「**新規プロジェクトを作成…**」を選択します。

![3-05-vsc-create-project.png](./images/vsc2.png)

プロジェクトを保存するローカルフォルダーを選択し、「**選択**」をクリックします。

![3-06-vsc-select-folder.png](./images/vsc3.png)

プロジェクト作成ウィザードに入ります。 プロジェクトの言語として **Javascript** を選択します。

![3-07-vsc-select-language.png](./images/vsc4.png)

プロジェクトの最初の関数トリガーとして **Azure Event Hub テンプレート** を選択します。

![3-08-vsc-function-template.png](./images/vsc5.png)

関数の名前を入力し、次の書式 `--demoProfileLdap---aep-event-hub-trigger` を使用して Enter キーを押します。

![3-09-vsc-function-name.png](./images/vsc6.png)

**新しいローカルアプリ設定を作成** を選択します。

![3-10-vsc-function-local-app-setting.png](./images/vsc7.png)

イベントハブ名前空間を選択すると、**演習 2** で定義したイベントハブが表示されます。 この例では、イベントハブの名前空間は **vangeluw-aep-enablement** です。

![3-11-vsc-function-select-namespace.png](./images/vsc8.png)

イベントハブを選択すると、**演習 2** で定義したイベントハブが表示されます。 ここでは、**vangeluw-aep-enablement-event-hub** です。

![3-12-vsc-function-select-eventhub.png](./images/vsc9.png)

イベントハブポリシーとして **RootManageSharedAccessKey** を選択します。

![3-13-vsc-function-select-eventhub-policy.png](./images/vsc10.png)

入力して **$Default** を使用：

![3-14-vsc-eventhub-consumer-group.png](./images/vsc11.png)

プロジェクトを開く方法については、**ワークスペースに追加** を選択してください。

![3-15-vsc-project-add-to-workspace.png](./images/vsc12.png)

プロジェクトが作成されたら、「**index.js**」をクリックして、エディターでファイルを開きます。

![3-16-vsc-open-index-js.png](./images/vsc13.png)

Adobe Experience Platformからイベントハブに送信されるペイロードには、次のセグメント ID が含まれます。

```json
[{
"segmentMembership": {
"ups": {
"ca114007-4122-4ef6-a730-4d98e56dce45": {
"lastQualificationTime": "2020-08-31T10:59:43Z",
"status": "realized"
},
"be2df7e3-a6e3-4eb4-ab12-943a4be90837": {
"lastQualificationTime": "2020-08-31T10:59:56Z",
"status": "realized"
},
"39f0feef-a8f2-48c6-8ebe-3293bc49aaef": {
"lastQualificationTime": "2020-08-31T10:59:56Z",
"status": "realized"
}
}
},
"identityMap": {
"ecid": [{
"id": "08130494355355215032117568021714632048"
}]
}
}]
```

Visual Studio Code の index.js のコードを以下のコードに置き換えます。 このコードは、Real-time CDP がセグメント選定をイベントハブ宛先に送信するたびに実行されます。 この例では、コードは受信したペイロードの表示と強化に過ぎません。 ただし、セグメントの選定をリアルタイムで処理するあらゆる種類の機能を想像できます。

```javascript
// Marc Meewis - Solution Consultant Adobe - 2020
// Adobe Experience Platform Enablement - Module 13

// Main function
// -------------
// This azure function is fired for each segment activated to the Adobe Exeperience Platform Real-time CDP Azure 
// Eventhub destination
// This function enriched the received segment payload with the name fo the segment. 
// You can replace this function with any logic that is require to process and deliver
// Adobe Experience Platform segments in real-time to any application or platform that 
// would need to act upon an AEP segment qualiification.
// 

module.exports = async function (context, eventHubMessages) {

    return new Promise (function (resolve, reject) {

        context.log('Message : ' + JSON.stringify(eventHubMessages, null, 2));

        resolve();

    });    

};
```

結果は次のようになります。

![3-16b-vsc-edit-index-js.png](./images/vsc1.png)

## 2.4.5.4 Azure プロジェクトの実行

次に、プロジェクトを実行します。 この段階では、プロジェクトを Azure にデプロイしません。 デバッグモードでローカルに実行します。 [ ファイル名を指定して実行 ] アイコンを選択し、緑色の矢印をクリックします。

![3-17-vsc-run-project.png](./images/vsc14.png)

初めてデバッグモードでプロジェクトを実行する際は、Azure ストレージアカウントを添付し、「**ストレージアカウントを選択**」をクリックする必要があります。

![3-17-vsc-run-project.png](./images/vsc15.png)

ストレージアカウントのリストから、[13.1.4 Azure ストレージアカウントの設定 ](./ex1.md) の一部として作成したものを選択します。 ストレージアカウントの名前は `--demoProfileLdap--aepstorage` です（例：**mmeewisaepstorage**）。

![3-22-vsc-select-storage-account.png](./images/vsc16.png)

これで、プロジェクトが起動および実行され、イベントハブにイベントがリストされるようになりました。 次の演習では、Luma デモ web サイトで行動を実演し、これらのセグメントの資格を得ることができます。 その結果、Event Hub トリガー関数のターミナルにセグメントの選定ペイロードが届きます。

![3-23-vsc-application-started.png](./images/vsc17.png)

## 2.4.5.5 Azure プロジェクトを停止

プロジェクトを停止するには、「**ターミナル**」タブを選択し、ターミナルウィンドウ内をクリックして、OSX の場合は **CMD-C**、Windows の場合は **CTRL-C** を押します。

![3-24-vsc-application-stop.png](./images/vsc18.png)

次の手順：[2.4.6 エンドツーエンドのシナリオ ](./ex6.md)

[モジュール 2.4 に戻る](./segment-activation-microsoft-azure-eventhub.md)

[すべてのモジュールに戻る](./../../../overview.md)
