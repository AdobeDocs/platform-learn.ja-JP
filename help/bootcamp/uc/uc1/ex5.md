---
title: Bootcamp - Real-time CDP - オーディエンスの作成とアクションの実行 – オーディエンスを DV360 に送信する
description: Bootcamp - Real-time CDP - オーディエンスの作成とアクションの実行 – オーディエンスを DV360 に送信する
jira: KT-5342
audience: Data Architect, Orchestration Engineer, Marketer
doc-type: tutorial
activity: develop
feature: Destinations
exl-id: 31f46e37-f1c0-4730-8520-1ccd98df6501
source-git-commit: 5876de5015e4c8c337c235c24cc28b0a32e274dd
workflow-type: tm+mt
source-wordcount: '281'
ht-degree: 3%

---

# 1.5 アクションの実行：オーディエンスをFacebookに送信します

[Adobe Experience Platform](https://experience.adobe.com/platform) に移動します。 ログインすると、Adobe Experience Platformのホームページが表示されます。

![データ取得](./images/home.png)

続行する前に、**サンドボックス** を選択する必要があります。 選択するサンドボックスの名前は ``Bootcamp`` です。 これを行うには、画面上部の青い線のテキスト **[!UICONTROL 実稼動製品]** をクリックします。 適切な [!UICONTROL  サンドボックス ] を選択すると、画面が変更され、専用の [!UICONTROL  サンドボックス ] が表示されます。

![データ取得](./images/sb1.png)

左側のメニューで **宛先** に移動し、**カタログ** に移動します。 **宛先カタログ** が表示されます。 **宛先** で、**Facebook カスタムオーディエンス** カードの **オーディエンスをアクティブ化** をクリックします。

![RTCDP](./images/rtcdpgoogleseg.png)

宛先 **bootcamp-facebook** を選択し、「**次へ**」をクリックします。

![RTCDP](./images/rtcdpcreatedest2.png)

使用可能なオーディエンスのリストで、前の演習で作成したオーディエンスを選択します。 「**次へ**」をクリックします。

![RTCDP](./images/rtcdpcreatedest3.png)

**マッピング** ページで、「**変換を適用**」チェックボックスが有効になっていることを確認します。 「**次へ**」をクリックします。

![RTCDP](./images/rtcdpcreatedest4a.png)

**オーディエンススケジュール** ページで、「**オーディエンスの接触チャネル** を選択し、「**顧客から直接**」に設定します。 「**次へ**」をクリックします。

![RTCDP](./images/rtcdpcreatedest4.png)

最後に、「レビュー **ページで** 「終了 **をクリック** します。

![RTCDP](./images/rtcdpcreatedest5.png)

これで、オーディエンスがFacebook カスタムオーディエンスにリンクされました。 お客様がこのオーディエンスの資格を得るたびに、シグナルがFacebook サーバーサイドに送信され、そのお客様がFacebook サイドのカスタムオーディエンスに含まれます。

facebookでは、「カスタムオーディエンス」の下にAdobe Experience Platformのオーディエンスが表示されます。

![RTCDP](./images/rtcdpcreatedest5b.png)

これで、カスタムオーディエンスがFacebookに表示されます。

![RTCDP](./images/rtcdpcreatedest5a.png)

[ユーザーフロー 1 に戻る](./uc1.md)

[すべてのモジュールに戻る](../../overview.md)
