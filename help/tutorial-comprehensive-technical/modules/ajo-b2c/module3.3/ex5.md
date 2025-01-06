---
title: Offer decisioning – 決定をメールで使用
description: メールでの決定の使用
kt: 5342
doc-type: tutorial
exl-id: 7eddb239-2666-485a-b81a-1f7e6f3aeed2
source-git-commit: fc24f3c9fb1683db35026dc53d0aaa055aa87e34
workflow-type: tm+mt
source-wordcount: '310'
ht-degree: 11%

---

# 3.3.5 メールでの決定の使用

この演習では、決定を使用してメールと SMS の配信をパーソナライズします。

**ジャーニー** に移動します。 演習 3.1.3 で作成した `--aepUserLdap-- - Registration Journey` という名前のジャーニーを見つけます。 ジャーニーをクリックして開きます。

![Journey Optimizer](./images/emailoffer1.png)

その後、これが表示されます。 「**...」をクリックします。詳細を表示し**[**新しいバージョンの作成**] をクリックします。

![Journey Optimizer](./images/journey1.png)

**新しいバージョンを作成** をクリックします。

![Journey Optimizer](./images/journey2.png)

**メール** アクションをクリックし、**コンテンツを編集** をクリックします。

![Journey Optimizer](./images/journey3.png)

その後、メッセージダッシュボードが表示されます。 **メール本文を編集** をクリックします。

![Journey Optimizer](./images/emailoffer2.png)

その後、これが表示されます。 新しい **1:1 列** 構造コンポーネントをキャンバスにドラッグします。

![Journey Optimizer](./images/emailoffer6.png)

メニューの **コンテンツ** に移動します。 **オファーの決定** コンポーネントを選択し、次に示すように、このコンポーネントをメールのコンテンツオファープレースホルダーにドラッグ&amp;ドロップします。 次に、「**追加** をクリックします。

![Journey Optimizer](./images/emailoffer7.png)

メールに含めるプレースメントのタイプを選択します。 **プレースメント** ドロップダウンメニューで **メール – 画像** を選択し、決定 `--aepUserLdap-- - CitiSignal Decision` を選択します。 「**追加**」をクリックします。

![Journey Optimizer](./images/emailoffer8.png)

これで、すべてのパーソナライズされたオファーとフォールバックオファーを切り替えることができ、それらのすべてが電子メールデザイナー内で視覚化されます。 「**保存**」をクリックします。

![Journey Optimizer](./images/emailoffer9.png)

ここで、矢印をクリックして前の画面に戻ります。

![Journey Optimizer](./images/emailoffer13.png)

左上隅の矢印をクリックして、ジャーニーに戻ります。

![Journey Optimizer](./images/emailoffer14.png)

**保存** をクリックして、**メール** アクションを閉じます。

![Journey Optimizer](./images/emailoffer14a.png)

**Publish** をクリックして、更新されたジャーニーを公開します。

![Journey Optimizer](./images/emailoffer14b.png)

「**Publish**」を再度クリックして、確定します。

![Journey Optimizer](./images/emailoffer15.png)

メッセージが公開されました。

![Journey Optimizer](./images/emailoffer16.png)

デモ Web サイトで新しいアカウントを作成すると、このメールが届きます。

![Journey Optimizer](./images/emailoffer17.png)

この演習は完了しました。

次の手順：[3.3.6 API を使用して決定をテストする ](./ex6.md)

[モジュール 3.3 に戻る](./offer-decisioning.md)

[すべてのモジュールに戻る](./../../../overview.md)
