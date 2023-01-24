---
title: Bootcamp - Journey Optimizerイベントを作成 — ブラジル
description: Bootcamp - Journey Optimizerイベントを作成 — ブラジル
kt: 5342
audience: developer
doc-type: tutorial
activity: develop
source-git-commit: 75a878ba596078e6d013b65062606931402302dd
workflow-type: tm+mt
source-wordcount: '445'
ht-degree: 0%

---

# 2.2 イベントの作成

に移動してAdobe Journey Optimizerにログインします。 [Adobe Experience Cloud](https://experience.adobe.com). クリック **Journey Optimizer**.

![ACOP](./images/acophome.png)

リダイレクト先： **ホーム**  Journey Optimizerで表示 まず、正しいサンドボックスを使用していることを確認します。 使用するサンドボックスは、と呼ばれます。 `Bootcamp`. サンドボックス間を切り替えるには、 **Prod** リストからサンドボックスを選択します。 この例では、サンドボックスの名前はです。 **Bootcamp**. その後、 **ホーム** サンドボックスの表示 `Bootcamp`.

![ACOP](./images/acoptriglp.png)

左側のメニューで、下にスクロールして、 **設定**. 次に、 **管理** 下のボタン **イベント**.

![ACOP](./images/acopmenu.png)

その後、使用可能なすべてのイベントの概要が表示されます。 クリック **イベントを作成** をクリックして、独自のイベントの作成を開始します。

![ACOP](./images/emptyevent.png)

新しい空のイベントウィンドウがポップアップ表示されます。

![ACOP](./images/emptyevent1.png)

まず、イベントに次のような名前を付けます。 `yourLastNameAccountCreationEvent` 次のような説明を追加します。 `Account Creation Event`.

![ACOP](./images/eventdescription.png)

次に、 **タイプ** が **単一**、および **イベント ID タイプ** 選択、選択 **生成されたシステム**.

![ACOP](./images/eventidtype.png)

次に、「スキーマ」を選択します。 この演習では、スキーマが準備されました。 スキーマを使用してください `Demo System - Event Schema for Website (Global v1.1) v.1`.

![ACOP](./images/eventschema.png)

スキーマを選択すると、 **フィールド** 」セクションに入力します。 これで、 **フィールド** セクションに 3 つのアイコンのポップアップが表示されます。 をクリックします。 **編集** アイコン

![ACOP](./images/eventpayload.png)

表示される **フィールド** ウィンドウポップアップ。E メールをパーソナライズするために必要なフィールドの一部を選択する必要があります。  後で、既にAdobe Experience Platformにあるデータを使用して、他のプロファイル属性を選択します。

![ACOP](./images/eventfields.png)

オブジェクト内 `_experienceplatform.demoEnvironment`フィールドを必ず選択してください。 **brandLogo** および **brandName**.

![ACOP](./images/eventpayloadbr.png)

オブジェクト内 `_experienceplatform.identification.core`フィールドを必ず選択してください。 **電子メール**.

![ACOP](./images/eventpayloadbrid.png)

クリック **Ok** 変更を保存します。

![ACOP](./images/saveok.png)

次に、これが表示されます。 クリック **保存** もう一度変更を保存します。

![ACOP](./images/eventsave.png)

これで、イベントが設定され、保存されました。

![ACOP](./images/eventdone.png)

イベントを再度クリックして、 **イベントを編集** 画面を再度表示します。 上にマウスポインターを置く **フィールド** 3 つのアイコンを再度表示します。 をクリックします。 **ペイロードを表示** アイコン

![ACOP](./images/viewevent.png)

これで、期待されるペイロードの例が表示されます。
イベントには一意のオーケストレーション eventID があり、見つかるまでペイロード内を下にスクロールすると見つかります `_experience.campaign.orchestration.eventID`.

![ACOP](./images/payloadeventID.png)

次の演習の 1 つで作成するジャーニーをトリガーにするには、イベント ID をAdobe Experience Platformに送信する必要があります。 この eventID は、後で必要になる場合があるので、覚えておいてください。
`"eventID": "19cab7852cdef99d25b6d5f1b6503da39d1f486b1d585743f97ed2d1e6b6c74f"`

クリック **Ok**&#x200B;をクリックし、その後に「 **キャンセル**.

これで、この練習が完了しました。

次のステップ： [2.3 電子メールメッセージの作成](./ex3.md)

[ユーザーフローに戻る 2](./uc2.md)

[すべてのモジュールに戻る](../../overview.md)
