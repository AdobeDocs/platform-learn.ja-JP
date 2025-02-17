---
title: Adobe Journey Optimizer - メールメッセージでのパーソナライゼーションの適用
description: この演習では、メールコンテンツ内でセグメントパーソナライゼーションを使用する方法について説明します
kt: 5342
doc-type: tutorial
exl-id: a1ad649e-d0c4-4e87-b784-1e2d99f34a2e
source-git-commit: 3d61d91111d8693ab031fbd7b26706c02818108c
workflow-type: tm+mt
source-wordcount: '402'
ht-degree: 10%

---

# 3.4.3 メールメッセージでのセグメントベースのパーソナライゼーションの適用

[Adobe Experience Cloud](https://experience.adobe.com) に移動して、Adobe Experience Cloudにログインします。 **Adobe Journey Optimizer** をクリックします。

![ACOP](./../../../../modules/delivery-activation/ajo-b2c/ajob2c-1/images/acophome.png)

Journey Optimizerの **ホーム** ビューにリダイレクトされます。 続行する前に、**サンドボックス** を選択する必要があります。 選択するサンドボックスの名前は ``--aepTenantId--`` です。

![ACOP](./../../../../modules/delivery-activation/ajo-b2c/ajob2c-1/images/acoptriglp.png)

## 3.4.3.1 セグメントベースのパーソナライゼーション

この演習では、前の演習で作成したニュースレターのメールメッセージを、セグメントメンバーシップに基づいてパーソナライズされたテキストで改善します。

**キャンペーン** に移動します。 前の演習で作成したニュースレタージャーニーを見つけます。 `--aepUserLdap-- - CitiSignal Newsletter` を検索します。 3 つのドット **...** を右クリックし、「**複製**」をクリックします。

![Journey Optimizer](./images/sbp1.png)

その後、これが表示されます。 **タイトル**:`--aepUserLdap-- - CitiSignal Newsletter (SBP)` に使用します。 「**複製**」をクリックします。

![Journey Optimizer](./images/sbp2.png)

複製したキャンペーンをクリックして開きます。

![Journey Optimizer](./images/sbp3.png)

**編集** をクリックして、コンテンツを変更します。

![Journey Optimizer](./images/sbp3a.png)

**メール本文を編集** をクリックします。

![Journey Optimizer](./images/sbp4.png)

その後、これが表示されます。

![Journey Optimizer](./images/sbp5.png)

**コンテンツコンポーネント** を開き、**1:1 列** を AirPods オファーの上にドラッグします。

![Journey Optimizer](./images/sbp6.png)

**テキスト** コンポーネントを 1:1 列にドラッグ&amp;ドロップします。

![Journey Optimizer](./images/sbp6a.png)

デフォルトのテキスト全体を選択して削除します。 次に、ツールバーの「**パーソナライゼーションを追加**」ボタンをクリックします。

![Journey Optimizer](./images/sbp7.png)

その後、これが表示されます。 左側のメニューで、「**オーディエンス**」をクリックします。

![Journey Optimizer](./images/seg1.png)

セグメント `--aepUserLdap-- - Interest in Plans` を選択し、「**+**」アイコンをクリックしてキャンバスに追加します。

![Journey Optimizer](./images/seg3.png)

その後、最初の行をそのままにし、行 2 と 3 をこのコードに置き換える必要があります。

``
    PS: It may be a good idea to check if your plan still meets your needs! Click here to be contacted by one of our experts!
{%else%}
    PS: Thanks for taking the time to read our newsletter. Here is a 10% promo code to use on the website: NEWSLETTER10
{%/if%}
``

これで完了です。 「**保存**」をクリックします。

![Journey Optimizer](./images/seg4.png)

テキストの整列を **中央揃え** に変更します。

![Journey Optimizer](./images/sbp9.png)

右上隅の **保存** ボタンをクリックして、このメッセージを保存できます。 次に、左上隅の件名行のテキストの横にある **矢印** をクリックします。

![Journey Optimizer](./images/sbp9a.png)

**アクティブ化するレビュー** をクリックします。

![Journey Optimizer](./images/oc79afff.png)

**アクティブ化** をクリックします。

![Journey Optimizer](./images/oc79bfff.png)

これで、セグメントベースのパーソナライゼーションを使用したニュースレターが公開されました。 ニュースレターのメールメッセージはスケジュールに基づいて送信され、最後のメールが送信されるとジャーニーは停止します。

使用されたセグメントに適合すると、次の内容がメールで表示されます。

![Journey Optimizer](./images/sbp20fff.png)

この演習は完了しました。

## 次の手順

[3.4.4 セットアップに移動し、iOSのプッシュ通知を使用する ](./ex4.md){target="_blank"}

[Adobe Journey Optimizer](journeyoptimizer.md){target="_blank"} に戻る

[ すべてのモジュール ](./../../../../overview.md){target="_blank"} に戻る
