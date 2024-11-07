---
title: Journey Optimizer イベントの作成
description: Journey Optimizer イベントの作成
kt: 5342
doc-type: tutorial
source-git-commit: 6962a0d37d375e751a05ae99b4f433b0283835d0
workflow-type: tm+mt
source-wordcount: '457'
ht-degree: 0%

---

# 3.1.1 イベントの作成

[Adobe Experience Cloud](https://experience.adobe.com) に移動して、Adobe Journey Optimizerにログインします。 **Journey Optimizer** をクリックします。

![ACOP](./images/acophome.png)

Journey Optimizerの **ホーム** ビューにリダイレクトされます。 最初に、正しいサンドボックスを使用していることを確認します。 使用するサンドボックスは `--aepSandboxName--` です。 サンドボックスを切り替えるには、「**実稼動製品（VA7）」をクリックし** リストからサンドボックスを選択します。 この例では、サンドボックスの名前は **AEP イネーブルメント FY22** です。 その後、サンドボックス `--aepSandboxName--` ージの **ホーム** ビューに移動します。

![ACOP](./images/acoptriglp.png)

左側のメニューで、下にスクロールして、**設定** をクリックします。 次に、「イベント **の下にある** 管理 **ボタンをクリック** ます。

![ACOP](./images/acopmenu.png)

次に、使用可能なすべてのイベントの概要が表示されます。 「**イベントを作成**」をクリックして、独自のイベントの作成を開始します。

![ACOP](./images/emptyevent.png)

新しい空のイベントウィンドウがポップアップ表示されます。

![ACOP](./images/emptyevent1.png)

まず、イベントに `--aepUserLdap--AccountCreationEvent` のような名前を付けます。

![ACOP](./images/eventname.png)

次に、この `Account Creation Event` のような説明を追加します。

![ACOP](./images/eventdescription.png)

次に、**タイプ** が **単一** に設定されていることを確認し、**イベント ID タイプ** の選択で「**システム生成**」を選択します。

![ACOP](./images/eventidtype.png)

次に、スキーマを選択します。 この演習では、スキーマを準備しました。 スキーマ `Demo System - Event Schema for Website (Global v1.1) v.1` を使用してください。

![ACOP](./images/eventschema.png)

スキーマを選択すると、「**ペイロード**」セクションで多数のフィールドが選択されます。 **ペイロード** セクションにマウスポインターを置くと、3 つのアイコンのポップアップが表示されます。 **編集** アイコンをクリックします。

![ACOP](./images/eventpayload.png)

**フィールド** ウィンドウポップアップが表示され、メールをパーソナライズする必要のあるフィールドの一部を選択する必要があります。  既にAdobe Experience Platformにあるデータを使用して、後で他のプロファイル属性を選択します。

![ACOP](./images/eventfields.png)

オブジェクト `--aepTenantId--.demoEnvironment` で、必ず **brandLogo** フィールドと **brandName** フィールドを選択してください。

![ACOP](./images/eventpayloadbr.png)

オブジェクト `--aepTenantId--.identification.core` で、「**メール**」フィールドを必ず選択してください。

![ACOP](./images/eventpayloadbrid.png)

**OK** をクリックして、変更を保存します。

![ACOP](./images/saveok.png)

次の情報が表示されます。

![ACOP](./images/eventsave.png)

もう一度 **保存** をクリックして、変更を保存します。

![ACOP](./images/save1.png)

これで、イベントが設定され、保存されました。

![ACOP](./images/eventdone.png)

イベントを再度クリックすると、**イベントを編集** 画面が再度開きます。 「**ペイロード**」フィールドに再度ポインタを合わせると、3 つのアイコンが再び表示されます。 **ペイロードを表示** アイコンをクリックします。

![ACOP](./images/viewevent.png)

これで、期待されるペイロードの例が表示されます。

![ACOP](./images/fullpayload.png)

イベントには一意のオーケストレーション eventID があり、`_experience.campaign.orchestration.eventID` が表示されるまでペイロードを下にスクロールすると見つかります。

![ACOP](./images/payloadeventID.png)

イベント ID は、演習 7.2 で作成するジャーニーをトリガーするために、Adobe Experience Platformに送信する必要があるものです。この eventID は演習 7.3 で必要となるため、覚えておいてください。
`"eventID": "227402c540eb8f8855c6b2333adf6d54d7153d9d7d56fa475a6866081c574736"`

**OK** をクリックし、続いて **キャンセル** をクリックします。

これで、この演習が完了しました。

次の手順：[3.1.2Journey Optimizer：ジャーニーとメールメッセージを作成する ](./ex2.md)

[モジュール 3.1 に戻る](./journey-orchestration-create-account.md)

[すべてのモジュールに戻る](../../../overview.md)
