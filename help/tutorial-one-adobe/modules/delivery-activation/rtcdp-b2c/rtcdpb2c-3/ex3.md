---
title: Real-time CDP - オーディエンスの作成とアクションの実行 – オーディエンスを DV360 に送信します
description: Real-time CDP - オーディエンスの作成とアクションの実行 – オーディエンスを DV360 に送信します
kt: 5342
doc-type: tutorial
exl-id: 5cdb1f66-580c-4b3f-ada6-e224762eab59
source-git-commit: 3d61d91111d8693ab031fbd7b26706c02818108c
workflow-type: tm+mt
source-wordcount: '214'
ht-degree: 3%

---

# 2.3.3 アクションの実行：オーディエンスを DV360 に送信する

[Adobe Experience Platform](https://experience.adobe.com/platform) に移動します。 ログインすると、Adobe Experience Platformのホームページが表示されます。

![データ取得](./../../../../modules/delivery-activation/datacollection/dc1.2/images/home.png)

続行する前に、**サンドボックス** を選択する必要があります。 選択するサンドボックスの名前は ``--aepSandboxName--`` です。 適切な [!UICONTROL &#x200B; サンドボックス &#x200B;] を選択すると、画面が変更され、専用の [!UICONTROL &#x200B; サンドボックス &#x200B;] が表示されます。

![データ取得](./../../../../modules/delivery-activation/datacollection/dc1.2/images/sb1.png)

左側のメニューで **宛先** に移動し、**参照** に移動します。 **DV360** の宛先が表示されます。 3 つのドット **...** をクリックし、「**オーディエンスをアクティベート**」をクリックします。

![RTCDP](./images/rtcdpmenudest.png)

使用可能なオーディエンスのリストで、前の演習で作成したオーディエンスを選択します。 「**次へ**」をクリックします。

![RTCDP](./images/rtcdpcreatedest3.png)

**オーディエンススケジュール** ページで、「**次へ**」をクリックします。

![RTCDP](./images/rtcdpcreatedest4.png)

最後に、「レビュー **ページで** 「終了 **をクリック** します。

![RTCDP](./images/rtcdpcreatedest5.png)

これで、オーディエンスがGoogle DV360 にリンクされました。 お客様がこのオーディエンスに該当するたびに、シグナルがGoogle DV360 に送信され、そのお客様がGoogle DV360 サイドのオーディエンスに含まれます。

## 次の手順

[2.3.4 に移動アクションの実行：オーディエンスを S3 の宛先に送信します &#x200B;](./ex4.md){target="_blank"}

[Real-time CDP - オーディエンスの作成とアクションの実行 &#x200B;](./real-time-cdp-build-a-segment-take-action.md){target="_blank"} に戻る

[&#x200B; すべてのモジュール &#x200B;](./../../../../overview.md){target="_blank"} に戻る
