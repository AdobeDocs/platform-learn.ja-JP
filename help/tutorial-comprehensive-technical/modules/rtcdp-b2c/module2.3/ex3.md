---
title: Real-time CDP - オーディエンスの作成とアクションの実行 – オーディエンスを DV360 に送信します
description: Real-time CDP - オーディエンスの作成とアクションの実行 – オーディエンスを DV360 に送信します
kt: 5342
doc-type: tutorial
exl-id: bb76524e-52c1-4c2c-8bcd-33cd39d12741
source-git-commit: acb941e4ee668248ae0767bb9f4f42e067c181ba
workflow-type: tm+mt
source-wordcount: '206'
ht-degree: 2%

---

# 2.3.3 アクションの実行：オーディエンスを DV360 に送信する

[Adobe Experience Platform](https://experience.adobe.com/platform) に移動します。 ログインすると、Adobe Experience Platformのホームページが表示されます。

![データ取得](./../../../modules/datacollection/module1.2/images/home.png)

続行する前に、**サンドボックス** を選択する必要があります。 選択するサンドボックスの名前は ``--aepSandboxName--`` です。 適切な [!UICONTROL &#x200B; サンドボックス &#x200B;] を選択すると、画面が変更され、専用の [!UICONTROL &#x200B; サンドボックス &#x200B;] が表示されます。

![データ取得](./../../../modules/datacollection/module1.2/images/sb1.png)

左側のメニューで **宛先** に移動し、**参照** に移動します。 **DV360** の宛先が表示されます。 3 つのドット **...** をクリックし、「**オーディエンスをアクティベート**」をクリックします。

![RTCDP](./images/rtcdpmenudest.png)

使用可能なオーディエンスのリストで、前の演習で作成したオーディエンスを選択します。 「**次へ**」をクリックします。

![RTCDP](./images/rtcdpcreatedest3.png)

**オーディエンススケジュール** ページで、「**次へ**」をクリックします。

![RTCDP](./images/rtcdpcreatedest4.png)

最後に、「レビュー **ページで** 「終了 **をクリック** します。

![RTCDP](./images/rtcdpcreatedest5.png)

これで、オーディエンスがGoogle DV360 にリンクされました。 お客様がこのオーディエンスに該当するたびに、シグナルがGoogle DV360 に送信され、そのお客様がGoogle DV360 サイドのオーディエンスに含まれます。

次の手順：[2.3.4 行動を起こす：S3 の宛先にオーディエンスを送信する ](./ex4.md)

[モジュール 2.3 に戻る](./real-time-cdp-build-a-segment-take-action.md)

[すべてのモジュールに戻る](../../../overview.md)
