---
title: Real-time CDP - オーディエンスの作成とアクションの実行 – Google DV360 などのAdvertisingの宛先の設定
description: Real-time CDP - オーディエンスの作成とアクションの実行 – Google DV360 などのAdvertisingの宛先の設定
kt: 5342
doc-type: tutorial
exl-id: fdc590d5-b986-422c-97ef-b5a439644439
source-git-commit: acb941e4ee668248ae0767bb9f4f42e067c181ba
workflow-type: tm+mt
source-wordcount: '331'
ht-degree: 1%

---

# 2.3.2 Advertising DV360 などのGoogleの宛先の設定

>[!IMPORTANT]
>
>以下のコンテンツは一部お勧めです。そのような宛先がインスタンスに既に存在する場合は、DV360 の新しい宛先を設定する必要は **ありません**。 この場合、宛先は既に作成されているので、次の演習で使用できます。

[Adobe Experience Platform](https://experience.adobe.com/platform) に移動します。 ログインすると、Adobe Experience Platformのホームページが表示されます。

![データ取得](./../../../modules/datacollection/module1.2/images/home.png)

続行する前に、**サンドボックス** を選択する必要があります。 選択するサンドボックスの名前は ``--aepSandboxName--`` です。 適切な [!UICONTROL &#x200B; サンドボックス &#x200B;] を選択すると、画面が変更され、専用の [!UICONTROL &#x200B; サンドボックス &#x200B;] が表示されます。

![データ取得](./../../../modules/datacollection/module1.2/images/sb1.png)

左側のメニューで **宛先** に移動し、**カタログ** に移動します。 **宛先カタログ** が表示されます。

![RTCDP](./images/rtcdp.png)

**宛先** で、**Google ディスプレイ&amp;ビデオ 360** をクリックし、**+設定** をクリックします。

![RTCDP](./images/rtcdpgoogle.png)

その後、これが表示されます。 **宛先に接続** をクリックします。

![RTCDP](./images/rtcdpgooglecreate1.png)

次の画面で、Google DV360 の宛先を設定します。

![RTCDP](./images/rtcdpgooglecreatedest.png)

**名前** および **説明** フィールドに値を入力します。

フィールド **アカウント ID** は、DV360 アカウントの **広告主 ID** です。 次の場所で確認できます。

![RTCDP](./images/rtcdpgoogledv360advid.png)

**アカウントタイプ** は、「広告主を招待 **に設定する必要があり** す。

今、あなたはこれを持っています。 「**次へ**」をクリックします。

![RTCDP](./images/rtcdpgoogldv360new.png)

>[!NOTE]
>
>GoogleがGoogle DV360 にデータを送信するには、Adobe Experience Platformが許可リストAdobeを行う必要があります。 このデータフローを有効にするには、Google担当営業または販売店にお問い合わせください。

宛先を作成すると、これが表示されます。 オプションで、データガバナンスポリシーを選択できます。 次に、「**保存して終了** をクリックします。

![RTCDP](./images/rtcdpcreatedest1.png)

使用可能な宛先のリストが表示されます。
次の演習では、前の演習で作成したオーディエンスをGoogle DV360 の宛先に接続します。

次の手順：[2.3.3 対処：オーディエンスを DV360 に送信 ](./ex3.md)

[モジュール 2.3 に戻る](./real-time-cdp-build-a-segment-take-action.md)

[すべてのモジュールに戻る](../../../overview.md)
