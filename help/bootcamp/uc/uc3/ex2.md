---
title: Bootcamp – 物理とデジタルの融合 – Journey Optimizer イベントを作成
description: Bootcamp – 物理とデジタルの融合 – Journey Optimizer イベントを作成
jira: KT-5342
audience: developer
doc-type: tutorial
activity: develop
solution: Journey Optimizer
feature-set: Journey Optimizer
feature: Events
exl-id: 3d47c686-c2d8-4961-a05b-0990025392fa
source-git-commit: 3c86f9b19cecf92c9a324fb6fcfcefaebf82177f
workflow-type: tm+mt
source-wordcount: '457'
ht-degree: 0%

---

# 3.2 イベントの作成

[Adobe Experience Cloud](https://experience.adobe.com) に移動して、Adobe Journey Optimizerにログインします。 **Journey Optimizer** をクリックします。

![ACOP](./images/acophome.png)

Journey Optimizerの **ホーム** ビューにリダイレクトされます。 最初に、正しいサンドボックスを使用していることを確認します。 使用するサンドボックスは `Bootcamp` です。 サンドボックスを切り替えるには、「**Prod**」をクリックし、リストからサンドボックスを選択します。 この例では、サンドボックスの名前は **Bootcamp2** です。 その後、サンドボックス `Bootcamp` ージの **ホーム** ビューに移動します。

![ACOP](./images/acoptriglp.png)

左側のメニューで、下にスクロールして、**設定** をクリックします。 次に、「イベント **の下にある** 管理 **ボタンをクリック** ます。

![ACOP](./images/acopmenu.png)

次に、使用可能なすべてのイベントの概要が表示されます。 「**イベントを作成**」をクリックして、独自のイベントの作成を開始します。

![ACOP](./images/emptyevent.png)

新しい空のイベントウィンドウがポップアップ表示されます。

まず、イベントに「`yourLastNameBeaconEntryEvent`」のような名前を付け、`Beacon Entry Event` のような説明を追加します。

![ACOP](./images/eventdescription.png)

次に、**タイプ** が **単一** に設定されていることを確認し、**イベント ID タイプ** の選択で「**システム生成**」を選択します。

![ACOP](./images/eventidtype.png)

次に、スキーマを選択します。 この演習では、スキーマを準備しました。 スキーマ `Demo System - Event Schema for Mobile App (Global v1.1) v.1` を使用してください。

![ACOP](./images/eventschema.png)

スキーマを選択すると、「**フィールド**」セクションで多数のフィールドが選択されます。 **フィールド** セクションの上にマウスポインターを置くと、3 つのアイコンポップアップが表示されます。 **編集** アイコンをクリックします。

![ACOP](./images/eventpayload.png)

**フィールド** ウィンドウポップアップが表示され、ジャーニーをパーソナライズするために必要なフィールドの一部を選択する必要があります。  既にAdobe Experience Platformにあるデータを使用して、後で他のプロファイル属性を選択します。

![ACOP](./images/eventfields.png)

下にスクロールしてオブジェクト `Place context` を表示し、チェックボックスをオンにします。 これにより、顧客の場所のすべてのコンテキストがジャーニーで利用できるようになります。 **OK** をクリックして、変更を保存します。

![ACOP](./images/eventpayloadbr.png)

この画像が表示されます。 もう一度 **保存** をクリックして、変更を保存します。

![ACOP](./images/eventsave.png)

これで、イベントが設定され、保存されました。

![ACOP](./images/eventdone.png)

イベントを再度クリックすると、**イベントを編集** 画面が再度開きます。 **フィールド** にポインタを合わせると、3 つのアイコンが表示されます。 **表示** アイコンをクリックします。

![ACOP](./images/viewevent.png)

これで、期待されるペイロードの例が表示されます。
イベントには一意のオーケストレーション eventID があり、`_experience.campaign.orchestration.eventID` が表示されるまでペイロードを下にスクロールすると見つかります。

![ACOP](./images/payloadeventID.png)

イベント ID は、ジャーニーをトリガーするためにAdobe Experience Platformに送信する必要があるものです。ジャーニーは、次の演習の 1 つで作成します。 この eventID は後で必要になることがあるので、覚えておいてください。
`"eventID": "e76c0bf0c77c3517e5b6f4c457a0754ebaf5f1f6b9357d74e0d8e13ae517c3d5"`

**OK** をクリックし、続いて **キャンセル** をクリックします。

これで、この演習が完了しました。

次の手順：[3.3 ジャーニーとプッシュ通知を作成する ](./ex3.md)

[ユーザーフロー 3 に戻る](./uc3.md)

[すべてのモジュールに戻る](../../overview.md)
