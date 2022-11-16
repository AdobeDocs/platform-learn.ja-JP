---
title: Bootcamp - Real-time CDP — セグメントの構築とアクション — セグメントを DV360 に送信する
description: Bootcamp - Real-time CDP — セグメントの構築とアクション — セグメントを DV360 に送信する
kt: 5342
audience: Data Architect, Orchestration Engineer, Marketer
doc-type: tutorial
activity: develop
exl-id: 31f46e37-f1c0-4730-8520-1ccd98df6501
source-git-commit: cc7a77c4dd380ae1bc23dc75608e8e2224dfe78c
workflow-type: tm+mt
source-wordcount: '281'
ht-degree: 4%

---

# 1.5 措置をとる：セグメントをFacebookに送信

に移動します。 [Adobe Experience Platform](https://experience.adobe.com/platform). ログイン後、Adobe Experience Platformのホームページに移動します。

![データ取得](./images/home.png)

続行する前に、 **サンドボックス**. 選択するサンドボックスの名前はです ``Bootcamp``. これを行うには、 **[!UICONTROL 実稼動版]** 画面の上の青い線で表示されます。 適切な [!UICONTROL サンドボックス]画面が変更され、専用の [!UICONTROL サンドボックス].

![データ取得](./images/sb1.png)

左側のメニューで、に移動します。 **宛先**&#x200B;を選択し、 **カタログ**. 次に、 **宛先カタログ**. In **宛先**&#x200B;をクリックし、 **セグメントのアクティブ化** の **Facebook Custom Audience** カード。

![RTCDP](./images/rtcdpgoogleseg.png)

宛先を選択 **bootcamp-facebook** をクリックし、 **次へ**.

![RTCDP](./images/rtcdpcreatedest2.png)

使用可能なセグメントのリストで、前の演習で作成したセグメントを選択します。 「**次へ**」をクリックします。

![RTCDP](./images/rtcdpcreatedest3.png)

の **マッピング** ページで、 **変換を適用** チェックボックスが有効になっている。 「**次へ**」をクリックします。

![RTCDP](./images/rtcdpcreatedest4a.png)

の **セグメントスケジュール** ページで、 **オーディエンスの起源** を設定し、 **顧客から直接**. 「**次へ**」をクリックします。

![RTCDP](./images/rtcdpcreatedest4.png)

最後に、 **レビュー** ページ、クリック **完了**.

![RTCDP](./images/rtcdpcreatedest5.png)

これで、セグメントがFacebook Custom Audiences にリンクされました。 顧客がこのセグメントを認定されるたびに、シグナルがFacebookサーバーサイドに送信され、Facebook側のカスタムオーディエンスにその顧客を含めます。

facebookでは、「カスタムオーディエンス」の下にAdobe Experience Platformからのセグメントが表示されます。

![RTCDP](./images/rtcdpcreatedest5b.png)

これで、カスタムオーディエンスがFacebookに表示されます。

![RTCDP](./images/rtcdpcreatedest5a.png)

[ユーザーフローに戻る 1](./uc1.md)

[すべてのモジュールに戻る](../../overview.md)
