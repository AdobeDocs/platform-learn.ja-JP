---
title: offer decisioning — 電子メールでの決定の使用
description: メールで決定を使用
kt: 5342
audience: Data Engineer, Data Architect, Orchestration Engineer, Marketer
doc-type: tutorial
activity: develop
exl-id: 0fb8c244-1025-479f-b82e-374d1aa5e4dc
source-git-commit: cc7a77c4dd380ae1bc23dc75608e8e2224dfe78c
workflow-type: tm+mt
source-wordcount: '373'
ht-degree: 11%

---

# 9.5 決定を電子メールで使用

この演習では、決定を使用して E メールと SMS の配信をパーソナライズします。

に移動します。 **ジャーニー**. 演習 7.2 で作成したジャーニーを見つけます。このジャーニーの名前はです。 `--demoProfileLdap-- - Account Creation Journey`. ジャーニーをクリックして開きます。

![Journey Optimizer](./images/emailoffer1.png)

これが見えます クリック **新しいバージョンを作成**.

![Journey Optimizer](./images/journey1.png)

クリック **新しいバージョンを作成**.

![Journey Optimizer](./images/journey2.png)

次をクリック： **電子メール** 「 」アクションを選択し、「 」をクリックします。 **コンテンツを編集**.

![Journey Optimizer](./images/journey3.png)

メッセージダッシュボードが表示されます。 クリック **メールデザイナー**.

![Journey Optimizer](./images/emailoffer2.png)

これが見えます

![Journey Optimizer](./images/emailoffer5.png)

これが見えます 新しい **1:1 列** 構造コンポーネントをキャンバス上に配置します。

![Journey Optimizer](./images/emailoffer6.png)

メニューで、に移動します。 **コンテンツコンポーネント**. を選択します。 **オファーの決定** コンポーネントを開き、指定されたように、e メールのコンテンツオファープレースホルダーにこのコンポーネントをドラッグ&amp;ドロップします。 次に、「 **追加**.

![Journey Optimizer](./images/emailoffer7.png)

電子メールに含める配置のタイプを選択します。 内 **配置** ドロップダウンメニュー選択 **電子メール — 画像**、決定を選択します。 `--demoProfileLdap-- - Luma Decision`. 「**追加**」をクリックします。

![Journey Optimizer](./images/emailoffer8.png)

これで、パーソナライズされたすべてのオファーと、E メールデザイナー内で視覚化されたフォールバックオファーが表示されます。 クリック  **コンテンツをシミュレート** ：実際の顧客プロファイルを使用して e メールメッセージをプレビューします。

![Journey Optimizer](./images/emailoffer9.png)

まず、プレビューに使用するプロファイルを指定します。 を選択します。 **電子メール** 名前空間を作成し、デモ Web サイトで作成した顧客プロファイルの電子メールアドレスを入力します。 次に、「 **プレビュー**.

![Journey Optimizer](./images/emailoffer10.png)

E メールが正しく表示されたら、 **閉じる** 」ボタンをクリックします。

![Journey Optimizer](./images/emailoffer11.png)

最後に、「 **保存**.

![Journey Optimizer](./images/emailoffer12.png)

次に、矢印をクリックして前の画面に戻ります。

![Journey Optimizer](./images/emailoffer13.png)

これが見えます 左上隅の矢印をクリックして、ジャーニーに戻ります。

![Journey Optimizer](./images/emailoffer14.png)

クリック **Ok** を閉じます。 **電子メール** アクション。

![Journey Optimizer](./images/emailoffer14a.png)

クリック **公開** 更新したジャーニーを公開する。

![Journey Optimizer](./images/emailoffer14b.png)

「 」をクリックして確定 **公開** 再び

![Journey Optimizer](./images/emailoffer15.png)

これで、メッセージが公開されました。

![Journey Optimizer](./images/emailoffer16.png)

デモ Web サイトで新しいアカウントを作成すると、次の電子メールが届きます。

![Journey Optimizer](./images/emailoffer17.png)

この練習は終わりました。

次のステップ： [9.6 API を使用した決定のテスト](./ex6.md)

[モジュール 9 に戻る](./offer-decisioning.md)

[すべてのモジュールに戻る](./../../overview.md)
