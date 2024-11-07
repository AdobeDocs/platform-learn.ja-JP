---
title: Adobe Journey Optimizer - メールメッセージでのパーソナライゼーションの適用
description: この演習では、メールコンテンツ内でセグメントパーソナライゼーションを使用する方法について説明します
kt: 5342
doc-type: tutorial
source-git-commit: 2cdc145d7f3933ec593db4e6f67b60961a674405
workflow-type: tm+mt
source-wordcount: '502'
ht-degree: 10%

---

# 3.4.3 メールメッセージでのパーソナライゼーションの適用

[Adobe Experience Cloud](https://experience.adobe.com) に移動して、Adobe Experience Cloudにログインします。 **Adobe Journey Optimizer** をクリックします。

![ACOP](./../../../modules/ajo-b2c/module3.2/images/acophome.png)

Journey Optimizerの **ホーム** ビューにリダイレクトされます。 続行する前に、**サンドボックス** を選択する必要があります。 選択するサンドボックスの名前は ``--aepTenantId--`` です。 これを行うには、画面上部の青い線のテキスト **[!UICONTROL 実稼動製品]** をクリックします。

![ACOP](./../../../modules/ajo-b2c/module3.2/images/acoptriglp.png)

## 3.4.3.1 セグメントベースのパーソナライゼーション

この演習では、セグメントメンバーシップに基づいてパーソナライズされたテキストを使用して、ニュースレターのメールメッセージを改善します。

**ジャーニー** に移動します。 前の演習で作成したニュースレタージャーニーを見つけます。 `--demoProfileLdap-- - Newsletter` を検索します。 ジャーニーをクリックして開きます。

![Journey Optimizer](./images/sbp1.png)

その後、これが表示されます。 「**複製**」をクリックします。

![Journey Optimizer](./images/sbp2.png)

「**複製**」をクリックします。

![Journey Optimizer](./images/sbp3.png)

**メール** アクションを選択し、「**コンテンツを編集**」をクリックします。

![Journey Optimizer](./images/sbp3a.png)

**メールDesigner** をクリックします。

![Journey Optimizer](./images/sbp4.png)

その後、これが表示されます。

![Journey Optimizer](./images/sbp5.png)

**コンテンツコンポーネント** を開き、**テキスト** コンポーネントを現在のニュースレターコンテンツの下にドラッグします。

![Journey Optimizer](./images/sbp6.png)

デフォルトのテキスト全体を選択して削除します。 次に、ツールバーの「**パーソナライゼーションを追加**」ボタンをクリックします。

![Journey Optimizer](./images/sbp7.png)

次の画面が表示されます。

![Journey Optimizer](./images/seg1.png)

左側のメニューで、「**セグメントメンバーシップ**」をクリックします。

![Journey Optimizer](./images/seg2.png)

>[!NOTE]
>
>このリストでセグメントが見つからない場合は、少し下にスクロールして、セグメント ID を手動で取得する方法を確認します。

セグメント `Luma - Women's Category Interest` を選択し、「**+**」アイコンをクリックします。次のようになります。

![Journey Optimizer](./images/seg3.png)

その後、最初の行をそのままにし、行 2 と 3 をこのコードに置き換える必要があります。

``
    Psssst... a private sale in the women category will launch soon, we will keep you posted
{%else%}
    Thanks for taking the time to read our newsletter. Here is a 10% promo code to use on the website: READER10
{%/if%}
``

すると、次のようになります。

![Journey Optimizer](./images/seg4.png)

「**検証**」をクリックして、コードが正しいことを確認します。 「**保存**」をクリックします。

![Journey Optimizer](./images/sbp8.png)

右上隅の **保存** ボタンをクリックして、このメッセージを保存できます。 次に、「**コンテンツをシミュレート**」をクリックします。

![Journey Optimizer](./images/sbp9.png)

このチュートリアルの一部として作成したプロファイルの 1 つを選択し、「**プレビュー**」をクリックします。 その後、設定の結果が表示されます。

![Journey Optimizer](./images/sbp10.png)

その後、これが表示されます。 次に、「**閉じる** をクリックします。

![Journey Optimizer](./images/sbp10fff.png)

メッセージダッシュボードに戻るには、左上隅の件名テキストの横にある **矢印** をクリックします。

![Journey Optimizer](./images/sbp11.png)

左上隅の矢印をクリックして、ジャーニーに戻ります。

![Journey Optimizer](./images/oc79afff.png)

「**OK**」をクリックして、メールアクションを閉じます。

![Journey Optimizer](./images/oc79bfff.png)

**スケジュール** を **1 回** に変更し、**日付/時刻** を定義します。 「**OK**」をクリックします。

>[!NOTE]
>
>メッセージの送信日時は 1 時間以上である必要があります。

![Journey Optimizer](./images/sbp18.png)

ジャーニーの「**Publish**」ボタンをクリックします。

![Journey Optimizer](./images/sbp19.png)

ポップアップウィンドウで、「**Publish**」をもう一度クリックします。

![Journey Optimizer](./images/sbp20.png)

これで、基本的なニュースレタージャーニーが公開されました。 ニュースレターのメールメッセージはスケジュールに基づいて送信され、最後のメールが送信されるとジャーニーは停止します。

![Journey Optimizer](./images/sbp20fff.png)

この演習は完了しました。

次の手順：[3.4.4 iOSのプッシュ通知を設定して使用する ](./ex4.md)

[モジュール 3.4 に戻る](./journeyoptimizer.md)

[すべてのモジュールに戻る](../../../overview.md)
