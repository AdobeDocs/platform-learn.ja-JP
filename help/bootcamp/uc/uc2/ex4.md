---
title: Bootcamp - Journey Optimizerジャーニーを作成
description: Bootcamp - Journey Optimizerジャーニーを作成
jira: KT-5342
audience: developer
doc-type: tutorial
activity: develop
exl-id: e4464502-60c8-4fba-a429-169b7a4516c8
source-git-commit: 90f7621536573f60ac6585404b1ac0e49cb08496
workflow-type: tm+mt
source-wordcount: '220'
ht-degree: 2%

---

# 2.4 ジャーニーのテスト

## カスタマージャーニーフロー

新しい、クリーンな匿名ブラウザーウィンドウを開き、に移動します。 [https://bootcamp.aepdemo.net](https://bootcamp.aepdemo.net). クリック **すべて許可**. 前のユーザーフローでの閲覧行動に基づいて、Web サイトのホームページにパーソナライゼーションが表示されます。

![DSN](./images/web8a.png)

次をクリック： **プロファイル** アイコンをクリックします。

![デモ](./images/web8b.png)

クリック **アカウントの作成**.

![デモ](./images/pv5.png)

フォームのすべてのフィールドに入力します。 電子メールアドレスと電話番号には、実際の値を使用します。電子メールと SMS の配信に関する後の演習で使用されるからです。

![デモ](./images/pv7a.png)

下にスクロールします。 次に、演習 2.2 で作成したカスタムイベントの eventID を入力する必要があります。次の ID を参照してください。

![ACOP](./images/payloadeventID.png)

イベント ID は、作成したジャーニーをトリガー化するために、Adobe Experience Platformに送信する必要があるものです。 この例では eventID です。 `19cab7852cdef99d25b6d5f1b6503da39d1f486b1d585743f97ed2d1e6b6c74f`

「 」フィールドに eventID を入力します。 **アカウント作成イベント ID** をクリックし、 **登録**.

![デモ](./images/pv8a.png)

これが見えます

![デモ](./images/pv9.png)

また、この電子メールも届きます。この電子メールは、この演習の一環として自分で作成した電子メールです。

![デモ](./images/pv10a.png)

これで、この練習が完了しました。

次のステップ： [2.5 モバイルアプリをインストールして使用する](./ex5.md)

[ユーザーフローに戻る 2](./uc2.md)

[すべてのモジュールに戻る](../../overview.md)
