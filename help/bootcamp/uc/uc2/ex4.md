---
title: Bootcamp - Journey Optimizer ジャーニーの作成
description: Bootcamp - Journey Optimizer ジャーニーの作成
jira: KT-5342
audience: developer
doc-type: tutorial
activity: develop
solution: Journey Optimizer
feature-set: Journey Optimizer
feature: Journeys
exl-id: e4464502-60c8-4fba-a429-169b7a4516c8
source-git-commit: 3c86f9b19cecf92c9a324fb6fcfcefaebf82177f
workflow-type: tm+mt
source-wordcount: '222'
ht-degree: 2%

---

# 2.4 ジャーニーのテスト

## カスタマージャーニーフロー

新しいクリーンな匿名ブラウザーウィンドウを開き、[https://bootcamp.aepdemo.net](https://bootcamp.aepdemo.net) に移動します。 **すべて許可** をクリックします。 以前のユーザーフローでの閲覧行動に基づいて、パーソナライゼーションが web サイトのホームページで発生することがわかります。

![DSN](./images/web8a.png)

画面の右上隅にある「**プロファイル**」アイコンをクリックします。

![デモ](./images/web8b.png)

**アカウントを作成** をクリックします。

![デモ](./images/pv5.png)

フォームのすべてのフィールドに入力します。 メールアドレスと電話番号には実際の値を使用します。この値は、後の演習でメールと SMS の配信に使用します。

![デモ](./images/pv7a.png)

下にスクロールします。 演習 2.2 で作成したカスタムイベントの eventID を入力する必要があります。次の場所で参照できます。

![ACOP](./images/payloadeventID.png)

イベント ID は、作成したジャーニーをトリガーするためにAdobe Experience Platformに送信する必要があるものです。 次の例の eventID です。`19cab7852cdef99d25b6d5f1b6503da39d1f486b1d585743f97ed2d1e6b6c74f`

**アカウント作成イベント ID** フィールドに eventID を入力し、**登録** をクリックします。

![デモ](./images/pv8a.png)

その後、これが表示されます。

![デモ](./images/pv9.png)

また、このメールも届きます。このメールは、この演習の一環として自分で作成したメールです。

![デモ](./images/pv10a.png)

これで、この演習が完了しました。

次の手順：[2.5 モバイルアプリをインストールして使用する ](./ex5.md)

[ユーザーフロー 2 に戻る](./uc2.md)

[すべてのモジュールに戻る](../../overview.md)
