---
title: Bootcamp - リアルタイム顧客プロファイル – 独自のリアルタイム顧客プロファイルを視覚化 – UI
description: Bootcamp - リアルタイム顧客プロファイル – 独自のリアルタイム顧客プロファイルを視覚化 – UI
jira: KT-5342
audience: Data Engineer, Data Architect, Marketer
doc-type: tutorial
activity: develop
feature: Profiles
exl-id: 4c810767-00ab-4cae-baa9-97b0cb9bf2df
source-git-commit: 5876de5015e4c8c337c235c24cc28b0a32e274dd
workflow-type: tm+mt
source-wordcount: '491'
ht-degree: 0%

---

# 1.2 独自のリアルタイム顧客プロファイルの視覚化 – UI

この演習では、Adobe Experience Platformにログインし、独自のリアルタイム顧客プロファイルを UI で表示します。

## ストーリー

リアルタイム顧客プロファイルでは、すべてのプロファイルデータがイベントデータと共に、既存のオーディエンスメンバーシップと共に表示されます。 表示されるデータは、Adobeアプリケーションや外部ソリューションなど、どこからでも取得できます。 これは、Adobe Experience Platformで最も強力なビュー、つまり真のレコードのエクスペリエンスシステムです。

## 1.2.1 Adobe Experience Platformで顧客プロファイルビューを使用する

[Adobe Experience Platform](https://experience.adobe.com/platform) に移動します。 ログインすると、Adobe Experience Platformのホームページが表示されます。

![データ取得](./images/home.png)

続行する前に、**サンドボックス** を選択する必要があります。 選択するサンドボックスの名前は ``Bootcamp`` です。 これを行うには、画面上部の青い線のテキスト **[!UICONTROL 実稼動製品]** をクリックします。 適切な [!UICONTROL &#x200B; サンドボックス &#x200B;] を選択すると、画面が変更され、専用の [!UICONTROL &#x200B; サンドボックス &#x200B;] が表示されます。



左側のメニューで、**プロファイル**、「参照 **の順に移動** ます。

![ 顧客プロファイル ](./images/homemenu.png)

Web サイトのプロファイルビューアパネルで、ID の概要を確認できます。 すべての ID が名前空間にリンクされています。

![ 顧客プロファイル ](./images/identities.png)




Adobe Experience Platformでは、すべての ID が同じように重要です。 以前は、ECID はAdobeコンテキストで最も重要な ID であり、他のすべての ID は階層的な関係で ECID にリンクされていました。 Adobe Experience Platformでは、これは該当しなくなり、すべての ID がプライマリ識別情報と見なすことができます。

通常、プライマリ識別子はコンテキストに依存します。 コールセンターに問い合わせる場合 **最も重要な ID は何ですか？彼ら** おそらく答えるだろう **電話番号！** しかし、CRM チームに質問すると、**メールアドレスです！** Adobe Experience Platformは、この複雑さを理解し、管理します。 Adobe用アプリケーションであれ、非Adobe用アプリケーションであれ、すべてのアプリケーションは、プライマリと見なされる ID を参照することでAdobe Experience Platformと通信します。 そしてそれは単に機能します。

「**ID 名前空間**」フィールドで **ECID** を選択し、「**ID 値**」フィールドで Bootcamp web サイトのプロファイルビューアパネルにある ECID を入力します。 **表示** をクリックします。 すると、リストにプロファイルが表示されます。 **プロファイル ID** をクリックして、プロファイルを開きます。

![ 顧客プロファイル ](./images/popupecid.png)

これで、顧客プロファイルの重要な **プロファイル属性** の概要が表示されます。

![ 顧客プロファイル ](./images/profile.png)

**イベント** に移動すると、プロファイルにリンクされているすべてのエクスペリエンスイベントのエントリを確認できます。

![ 顧客プロファイル ](./images/profileee.png)

最後に、メニューオプション **オーディエンスメンバーシップ** に移動します。 このプロファイルに適格なすべてのオーディエンスが表示されます。

![ 顧客プロファイル ](./images/profileseg.png)

次に、匿名または既知の顧客に対してカスタマーエクスペリエンスをパーソナライズできる新しいオーディエンスを作成します。

次の手順：[1.3 オーディエンスの作成 – UI](./ex3.md)

[ユーザーフロー 1 に戻る](./uc1.md)

[すべてのモジュールに戻る](../../overview.md)
