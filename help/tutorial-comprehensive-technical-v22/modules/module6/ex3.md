---
title: Real-time CDP — セグメントを構築してアクションを実行する — セグメントを DV360 に送信する
description: Real-time CDP — セグメントを構築してアクションを実行する — セグメントを DV360 に送信する
kt: 5342
audience: Data Architect, Orchestration Engineer, Marketer
doc-type: tutorial
activity: develop
exl-id: 7a78260f-cd25-4ed0-801b-87174babaffe
source-git-commit: cc7a77c4dd380ae1bc23dc75608e8e2224dfe78c
workflow-type: tm+mt
source-wordcount: '235'
ht-degree: 3%

---

# 6.3 措置をとる：セグメントを DV360 に送信します。

に移動します。 [Adobe Experience Platform](https://experience.adobe.com/platform). ログイン後、Adobe Experience Platformのホームページに移動します。

![データ取得](../module2/images/home.png)

続行する前に、 **サンドボックス**. 選択するサンドボックスの名前はです ``--aepSandboxId--``. これを行うには、 **[!UICONTROL 実稼動版]** 画面の上の青い線で表示されます。 適切な [!UICONTROL サンドボックス]画面が変更され、専用の [!UICONTROL サンドボックス].

![データ取得](../module2/images/sb1.png)

左側のメニューで、に移動します。 **宛先**&#x200B;を選択し、 **カタログ**. 次に、 **宛先カタログ**.

![RTCDP](./images/rtcdpmenudest.png)

In **宛先**、 **セグメントのアクティブ化** の **Google Display &amp; Video 360** カード。

![RTCDP](./images/rtcdpgoogleseg.png)

宛先を選択し、 **次へ**.

![RTCDP](./images/rtcdpcreatedest2.png)

使用可能なセグメントのリストで、前の演習で作成したセグメントを選択します。 「**次へ**」をクリックします。

![RTCDP](./images/rtcdpcreatedest3.png)

の **セグメントスケジュール** ページ、クリック **次へ**.

![RTCDP](./images/rtcdpcreatedest4.png)

最後に、 **レビュー** ページ、クリック **完了**.

![RTCDP](./images/rtcdpcreatedest5.png)

これで、セグメントがGoogle DV360 にリンクされました。 顧客がこのセグメントを認定されるたびに、シグナルがGoogle DV360 に送信され、その顧客がGoogle DV360 側のオーディエンスに含まれます。

次のステップ： [6.4 措置をとる：セグメントを S3 の宛先に送信する](./ex4.md)

[モジュール 6 に戻る](./real-time-cdp-build-a-segment-take-action.md)

[すべてのモジュールに戻る](../../overview.md)
