---
title: Journey Optimizerイベントの作成
description: Journey Optimizerイベントの作成
kt: 5342
audience: developer
doc-type: tutorial
activity: develop
exl-id: e35d2357-21f9-4566-b2a1-cc0cf0c64956
source-git-commit: cc7a77c4dd380ae1bc23dc75608e8e2224dfe78c
workflow-type: tm+mt
source-wordcount: '449'
ht-degree: 0%

---

# 7.1 イベントの作成

に移動してAdobe Journey Optimizerにログインします。 [Adobe Experience Cloud](https://experience.adobe.com). クリック **Journey Optimizer**.

![ACOP](./images/acophome.png)

リダイレクト先： **ホーム**  Journey Optimizerで表示 まず、正しいサンドボックスを使用していることを確認します。 使用するサンドボックスは、と呼ばれます。 `--aepSandboxId--`. サンドボックス間を切り替えるには、 **実稼動 (VA7)** リストからサンドボックスを選択します。 この例では、サンドボックスの名前はです。 **AEP 有効化 FY22**. その後、 **ホーム** サンドボックスの表示 `--aepSandboxId--`.

![ACOP](./images/acoptriglp.png)

左側のメニューで、下にスクロールして、 **設定**. 次に、 **管理** 下のボタン **イベント**.

![ACOP](./images/acopmenu.png)

その後、使用可能なすべてのイベントの概要が表示されます。 クリック **イベントを作成** をクリックして、独自のイベントの作成を開始します。

![ACOP](./images/emptyevent.png)

新しい空のイベントウィンドウがポップアップ表示されます。

![ACOP](./images/emptyevent1.png)

まず、イベントに次のような名前を付けます。 `--demoProfileLdap--AccountCreationEvent`.

![ACOP](./images/eventname.png)

次に、次のような説明を追加します `Account Creation Event`.

![ACOP](./images/eventdescription.png)

次に、 **タイプ** が **単一**、および **イベント ID タイプ** 選択、選択 **生成されたシステム**.

![ACOP](./images/eventidtype.png)

次に、「スキーマ」を選択します。 この演習では、スキーマが準備されました。 スキーマを使用してください `Demo System - Event Schema for Website (Global v1.1) v.1`.

![ACOP](./images/eventschema.png)

スキーマを選択すると、 **ペイロード** 」セクションに入力します。 これで、 **ペイロード** セクションに 3 つのアイコンのポップアップが表示されます。 をクリックします。 **編集** アイコン

![ACOP](./images/eventpayload.png)

表示される **フィールド** ウィンドウポップアップ。E メールをパーソナライズするために必要なフィールドの一部を選択する必要があります。  後で、既にAdobe Experience Platformにあるデータを使用して、他のプロファイル属性を選択します。

![ACOP](./images/eventfields.png)

オブジェクト内 `--aepTenantId--.demoEnvironment`フィールドを必ず選択してください。 **brandLogo** および **brandName**.

![ACOP](./images/eventpayloadbr.png)

オブジェクト内 `--aepTenantId--.identification.core`フィールドを必ず選択してください。 **電子メール**.

![ACOP](./images/eventpayloadbrid.png)

クリック **Ok** 変更を保存します。

![ACOP](./images/saveok.png)

次のように表示されます。

![ACOP](./images/eventsave.png)

クリック **保存** もう一度変更を保存します。

![ACOP](./images/save1.png)

これで、イベントが設定され、保存されました。

![ACOP](./images/eventdone.png)

イベントを再度クリックして、 **イベントを編集** 画面を再度表示します。 次の項目にカーソルを合わせます。 **ペイロード** フィールドに再度挿入し、3 つのアイコンを再度表示します。 をクリックします。 **ペイロードを表示** アイコン

![ACOP](./images/viewevent.png)

これで、期待されるペイロードの例が表示されます。

![ACOP](./images/fullpayload.png)

イベントには一意のオーケストレーション eventID があり、見つかるまでペイロード内を下にスクロールすると見つかります `_experience.campaign.orchestration.eventID`.

![ACOP](./images/payloadeventID.png)

イベント ID は、演習 7.2 で作成するジャーニーをトリガーするためにAdobe Experience Platformに送信する必要があるものです。この eventID は、演習 7.3 で必要になるので、覚えておいてください。
`"eventID": "227402c540eb8f8855c6b2333adf6d54d7153d9d7d56fa475a6866081c574736"`

クリック **Ok**&#x200B;をクリックし、その後に「 **キャンセル**.

これで、この練習が完了しました。

次のステップ： [7.2Journey Optimizer:ジャーニーと E メールメッセージを作成する](./ex2.md)

[モジュール 7 に戻る](./journey-orchestration-create-account.md)

[すべてのモジュールに戻る](../../overview.md)
