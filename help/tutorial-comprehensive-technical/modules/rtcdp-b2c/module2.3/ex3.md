---
title: Real-time CDP - セグメントを作成してアクションを実行 – セグメントを DV360 に送信します
description: Real-time CDP - セグメントを作成してアクションを実行 – セグメントを DV360 に送信します
kt: 5342
doc-type: tutorial
source-git-commit: 6962a0d37d375e751a05ae99b4f433b0283835d0
workflow-type: tm+mt
source-wordcount: '238'
ht-degree: 2%

---

# 2.3.3 アクションの実行：セグメントを DV360 に送信します

[Adobe Experience Platform](https://experience.adobe.com/platform) に移動します。 ログインすると、Adobe Experience Platformのホームページが表示されます。

![データ取得](./../../../modules/datacollection/module1.2/images/home.png)

続行する前に、**サンドボックス** を選択する必要があります。 選択するサンドボックスの名前は ``--aepSandboxName--`` です。 これを行うには、画面上部の青い線のテキスト **[!UICONTROL 実稼動製品]** をクリックします。 適切な [!UICONTROL  サンドボックス ] を選択すると、画面が変更され、専用の [!UICONTROL  サンドボックス ] が表示されます。

![データ取得](./../../../modules/datacollection/module1.2/images/sb1.png)

左側のメニューで **宛先** に移動し、**カタログ** に移動します。 **宛先カタログ** が表示されます。

![RTCDP](./images/rtcdpmenudest.png)

**宛先** で、**Google ディスプレイ&amp;ビデオ 360** カードの **セグメントのアクティブ化** をクリックします。

![RTCDP](./images/rtcdpgoogleseg.png)

宛先を選択し、「**次へ**」をクリックします。

![RTCDP](./images/rtcdpcreatedest2.png)

使用可能なセグメントのリストで、前の演習で作成したセグメントを選択します。 「**次へ**」をクリックします。

![RTCDP](./images/rtcdpcreatedest3.png)

**セグメントスケジュール** ページで、「**次へ**」をクリックします。

![RTCDP](./images/rtcdpcreatedest4.png)

最後に、「レビュー **ページで** 「終了 **をクリック** します。

![RTCDP](./images/rtcdpcreatedest5.png)

これで、セグメントがGoogle DV360 にリンクされました。 お客様がこのセグメントの資格を得るたびに、Google DV360 側のオーディエンスに含めるようにというシグナルがGoogle DV360 に送信されます。

次の手順：[2.3.4 アクションを実行：セグメントを S3 の宛先に送信し ](./ex4.md) す。

[モジュール 2.3 に戻る](./real-time-cdp-build-a-segment-take-action.md)

[すべてのモジュールに戻る](../../../overview.md)
