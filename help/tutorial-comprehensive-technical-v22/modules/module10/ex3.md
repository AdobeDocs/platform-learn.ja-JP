---
title: Adobe Journey Optimizer - E メールメッセージでのパーソナライゼーションの適用
description: この演習では、E メールコンテンツ内でセグメントのパーソナライゼーションを使用する方法を説明します
kt: 5342
audience: Data Engineer, Data Architect, Data Analyst
doc-type: tutorial
activity: develop
exl-id: 573ecfba-4f1d-4242-8358-1d33109aaea3
source-git-commit: cc7a77c4dd380ae1bc23dc75608e8e2224dfe78c
workflow-type: tm+mt
source-wordcount: '495'
ht-degree: 11%

---

# 10.3 電子メールメッセージへのパーソナライゼーションの適用

に移動してAdobe Experience Cloudにログインします。 [Adobe Experience Cloud](https://experience.adobe.com). クリック **Adobe Journey Optimizer**.

![ACOP](../module7/images/acophome.png)

リダイレクト先： **ホーム** Journey Optimizerで表示 続行する前に、 **サンドボックス**. 選択するサンドボックスの名前はです ``--aepTenantId--``. これを行うには、 **[!UICONTROL 実稼動版]** 画面の上の青い線で表示されます。

![ACOP](../module7/images/acoptriglp.png)

## 10.3.1 セグメントベースのパーソナライゼーション

この演習では、セグメントのメンバーシップに基づいてパーソナライズされたテキストを使用して、ニュースレターの E メールメッセージを改善します。

に移動します。 **ジャーニー**. 前の演習で作成したニュースレターのジャーニーを見つけます。 `--demoProfileLdap-- - Newsletter` を検索します。ジャーニーをクリックして開きます。

![Journey Optimizer](./images/sbp1.png)

これが見えます 「**複製**」をクリックします。

![Journey Optimizer](./images/sbp2.png)

「**複製**」をクリックします。

![Journey Optimizer](./images/sbp3.png)

を選択します。 **電子メール** 「 」アクションとクリック **コンテンツを編集**.

![Journey Optimizer](./images/sbp3a.png)

クリック **メールデザイナー**.

![Journey Optimizer](./images/sbp4.png)

これが見えます

![Journey Optimizer](./images/sbp5.png)

開く **コンテンツコンポーネント** をクリックし、 **テキスト** 現在のニュースレターコンテンツの下のコンポーネント。

![Journey Optimizer](./images/sbp6.png)

デフォルトのテキスト全体を選択して削除します。 次に、 **パーソナライゼーションを追加** 」ボタンをクリックします。

![Journey Optimizer](./images/sbp7.png)

次の内容が表示されます。

![Journey Optimizer](./images/seg1.png)

左側のメニューで、 **セグメントメンバーシップ**.

![Journey Optimizer](./images/seg2.png)

>[!NOTE]
>
>このリストにセグメントが見つからない場合は、少し下にスクロールして、セグメント ID を手動で取得する方法に関する手順を見つけます。

セグメントを選択 `Luma - Women's Category Interest` をクリックし、 **+** アイコンは次のようになります。

![Journey Optimizer](./images/seg3.png)

次に、最初の行をそのまま残し、次のコードで行 2 と 3 を置き換えます。

``
Psssst... a private sale in the women category will launch soon, we will keep you posted
{%else%}
Thanks for taking the time to read our newsletter. Here is a 10% promo code to use on the website: READER10
{%/if%}
``

その後、次の情報が表示されます。

![Journey Optimizer](./images/seg4.png)

クリック **検証** をクリックして、コードが正しいことを確認します。 「**保存**」をクリックします。

![Journey Optimizer](./images/sbp8.png)

これで、このメッセージを保存するには、 **保存** 」ボタンを使用します。 次に、「 **コンテンツをシミュレート**.

![Journey Optimizer](./images/sbp9.png)

このチュートリアルの一部として作成したプロファイルの 1 つを選択し、「 **プレビュー**. 設定の結果が表示されます。

![Journey Optimizer](./images/sbp10.png)

これが見えます 次に、「 **閉じる**.

![Journey Optimizer](./images/sbp10fff.png)

次をクリックして、メッセージダッシュボードに戻ります。 **矢印** 左上隅の件名行テキストの横に表示されます。

![Journey Optimizer](./images/sbp11.png)

左上隅の矢印をクリックして、ジャーニーに戻ります。

![Journey Optimizer](./images/oc79afff.png)

クリック **Ok** ：電子メールアクションを閉じます。

![Journey Optimizer](./images/oc79bfff.png)

を **スケジュール** から **1 回** をクリックし、 **日時**. 「**OK**」をクリックします。

>[!NOTE]
>
>メッセージの送信日時は 1 時間以上にする必要があります。

![Journey Optimizer](./images/sbp18.png)

をクリックします。 **公開** ボタンをクリックします。

![Journey Optimizer](./images/sbp19.png)

ポップアップウィンドウで、 **公開** 再び

![Journey Optimizer](./images/sbp20.png)

これで、基本的なニュースレターのジャーニーが公開されました。 ニュースレターの電子メールメッセージは、スケジュールに基づいて送信され、最後の電子メールが送信されるとすぐにジャーニーが停止します。

![Journey Optimizer](./images/sbp20fff.png)

この練習は終わりました。

次のステップ： [10.4 iOSのプッシュ通知のセットアップと使用](./ex4.md)

[モジュール 10 に戻る](./journeyoptimizer.md)

[すべてのモジュールに戻る](../../overview.md)
