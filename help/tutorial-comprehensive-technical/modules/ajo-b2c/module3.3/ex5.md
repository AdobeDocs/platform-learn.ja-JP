---
title: Offer decisioning – 決定をメールで使用
description: メールでの決定の使用
kt: 5342
doc-type: tutorial
source-git-commit: 2cdc145d7f3933ec593db4e6f67b60961a674405
workflow-type: tm+mt
source-wordcount: '381'
ht-degree: 11%

---

# 3.3.5 メールでの決定の使用

この演習では、決定を使用してメールと SMS の配信をパーソナライズします。

**ジャーニー** に移動します。 演習 7.2 で作成した `--demoProfileLdap-- - Account Creation Journey` という名前のジャーニーを見つけます。 ジャーニーをクリックして開きます。

![Journey Optimizer](./images/emailoffer1.png)

その後、これが表示されます。 **新しいバージョンを作成** をクリックします。

![Journey Optimizer](./images/journey1.png)

**新しいバージョンを作成** をクリックします。

![Journey Optimizer](./images/journey2.png)

**メール** アクションをクリックし、**コンテンツを編集** をクリックします。

![Journey Optimizer](./images/journey3.png)

その後、メッセージダッシュボードが表示されます。 **メールDesigner** をクリックします。

![Journey Optimizer](./images/emailoffer2.png)

その後、これが表示されます。

![Journey Optimizer](./images/emailoffer5.png)

その後、これが表示されます。 新しい **1:1 列** 構造コンポーネントをキャンバスにドラッグします。

![Journey Optimizer](./images/emailoffer6.png)

メニューの **コンテンツコンポーネント** に移動します。 **オファーの決定** コンポーネントを選択し、次に示すように、このコンポーネントをメールのコンテンツオファープレースホルダーにドラッグ&amp;ドロップします。 次に、「**追加** をクリックします。

![Journey Optimizer](./images/emailoffer7.png)

メールに含めるプレースメントのタイプを選択します。 **プレースメント** ドロップダウンメニューで **メール – 画像** を選択し、決定 `--demoProfileLdap-- - Luma Decision` を選択します。 「**追加**」をクリックします。

![Journey Optimizer](./images/emailoffer8.png)

これで、すべてのパーソナライズされたオファーとフォールバックオファーが電子メールデザイナー内で視覚化されて表示されるようになります。 **コンテンツをシミュレート** をクリックして、実際の顧客プロファイルでメールメッセージをプレビューします。

![Journey Optimizer](./images/emailoffer9.png)

まず、プレビューに使用するプロファイルを特定します。 **メール** 名前空間を選択し、デモ Web サイトで作成した顧客プロファイルのメールアドレスを入力します。 次に、「**プレビュー**」をクリックします。

![Journey Optimizer](./images/emailoffer10.png)

メールが表示され、オファーが正しく表示されたら、「**閉じる**」ボタンをクリックします。

![Journey Optimizer](./images/emailoffer11.png)

最後に、「**保存** をクリックします。

![Journey Optimizer](./images/emailoffer12.png)

ここで、矢印をクリックして前の画面に戻ります。

![Journey Optimizer](./images/emailoffer13.png)

その後、これが表示されます。 左上隅の矢印をクリックして、ジャーニーに戻ります。

![Journey Optimizer](./images/emailoffer14.png)

**OK** をクリックして **メール** アクションを閉じます。

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
