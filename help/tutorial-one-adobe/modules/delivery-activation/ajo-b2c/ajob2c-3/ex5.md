---
title: Offer Decisioning - メールでの決定の使用
description: メールでの決定の使用
kt: 5342
doc-type: tutorial
exl-id: c94b4ed4-0122-4cfd-a69f-40ae2063d449
source-git-commit: 3d61d91111d8693ab031fbd7b26706c02818108c
workflow-type: tm+mt
source-wordcount: '312'
ht-degree: 12%

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

**公開** をクリックして、更新したジャーニーを公開します。

![Journey Optimizer](./images/emailoffer14b.png)

「**公開** を再度クリックして確認します。

![Journey Optimizer](./images/emailoffer15.png)

メッセージが公開されました。

![Journey Optimizer](./images/emailoffer16.png)

デモ Web サイトで新しいアカウントを作成すると、このメールが届きます。

![Journey Optimizer](./images/emailoffer17.png)

この演習は完了しました。

## 次の手順

[3.3.6 API を使用した決定のテストに移動します ](./ex6.md){target="_blank"}

[Offer Decisioning](offer-decisioning.md){target="_blank"} に戻る

[ すべてのモジュール ](./../../../../overview.md){target="_blank"} に戻る
