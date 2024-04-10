---
title: Bootcamp - Real-time CDP - オーディエンスの作成とアクションの実行 – オーディエンスを DV360 に送信する
description: Bootcamp - Real-time CDP - オーディエンスの作成とアクションの実行 – オーディエンスを DV360 に送信する
jira: KT-5342
audience: Data Architect, Orchestration Engineer, Marketer
doc-type: tutorial
activity: develop
feature: Destinations
exl-id: 31f46e37-f1c0-4730-8520-1ccd98df6501
source-git-commit: 9d12b3e3ad2238cf79aca3d9723e7e60d72e765c
workflow-type: tm+mt
source-wordcount: '281'
ht-degree: 3%

---

# 1.5 アクションの実行：オーディエンスをFacebookに送信します

に移動 [Adobe Experience Platform](https://experience.adobe.com/platform). ログインすると、Adobe Experience Platformのホームページが表示されます。

![データ取得](./images/home.png)

続行する前に、を選択する必要があります **sandbox**. 選択するサンドボックスの名前はです ``Bootcamp``. それには、テキストをクリックします **[!UICONTROL 実稼動製品]** 画面上部の青い線 適切なを選択した後 [!UICONTROL sandbox]画面が変わり、専用の画面が表示されます [!UICONTROL sandbox].

![データ取得](./images/sb1.png)

左側のメニューで、に移動します。 **宛先**&#x200B;に移動します。 **カタログ**. 「」が表示されます。 **宛先カタログ**. 対象： **宛先**&#x200B;を選択し、 **オーディエンスをアクティベート** 日 **Facebook カスタムオーディエンス** カード。

![RTCDP](./images/rtcdpgoogleseg.png)

宛先を選択 **bootcamp-facebook** をクリックして、 **次**.

![RTCDP](./images/rtcdpcreatedest2.png)

使用可能なオーディエンスのリストで、前の演習で作成したオーディエンスを選択します。 「**次へ**」をクリックします。

![RTCDP](./images/rtcdpcreatedest3.png)

日 **マッピング** ページの場合、必ず **変換を適用** チェックボックスが有効になっています。 「**次へ**」をクリックします。

![RTCDP](./images/rtcdpcreatedest4a.png)

日 **オーディエンススケジュール** ページで、 **オーディエンスの接触チャネル** およびを設定します **顧客から直接**. 「**次へ**」をクリックします。

![RTCDP](./images/rtcdpcreatedest4.png)

最後に、 **レビュー** ページ、クリック **終了**.

![RTCDP](./images/rtcdpcreatedest5.png)

これで、オーディエンスがFacebook カスタムオーディエンスにリンクされました。 お客様がこのオーディエンスの資格を得るたびに、シグナルがFacebook サーバーサイドに送信され、そのお客様がFacebook サイドのカスタムオーディエンスに含まれます。

facebookでは、「カスタムオーディエンス」の下にAdobe Experience Platformのオーディエンスが表示されます。

![RTCDP](./images/rtcdpcreatedest5b.png)

これで、カスタムオーディエンスがFacebookに表示されます。

![RTCDP](./images/rtcdpcreatedest5a.png)

[ユーザーフロー 1 に戻る](./uc1.md)

[すべてのモジュールに戻る](../../overview.md)
