---
title: Bootcamp - リアルタイム顧客プロファイル – 独自のリアルタイム顧客プロファイルを視覚化 – UI
description: Bootcamp - リアルタイム顧客プロファイル – 独自のリアルタイム顧客プロファイルを視覚化 – UI
jira: KT-5342
audience: Data Engineer, Data Architect, Marketer
doc-type: tutorial
activity: develop
feature: Profiles
exl-id: 4c810767-00ab-4cae-baa9-97b0cb9bf2df
source-git-commit: 0474808b42925bf95529e10a42a0563f0ecc43b8
workflow-type: tm+mt
source-wordcount: '509'
ht-degree: 1%

---

# 1.2 独自のリアルタイム顧客プロファイルの視覚化 – UI

この演習では、Adobe Experience Platformにログインし、独自のリアルタイム顧客プロファイルを UI で表示します。

## ストーリー

リアルタイム顧客プロファイルでは、すべてのプロファイルデータがイベントデータと共に、既存のオーディエンスメンバーシップと共に表示されます。 表示されるデータは、Adobeアプリケーションや外部ソリューションなど、どこからでも取得できます。 これは、Adobe Experience Platformで最も強力なビュー、つまり真のレコードのエクスペリエンスシステムです。

## 1.2.1 Adobe Experience Platformで顧客プロファイルビューを使用する

に移動 [Adobe Experience Platform](https://experience.adobe.com/platform). ログインすると、Adobe Experience Platformのホームページが表示されます。

![データ取得](./images/home.png)

続行する前に、を選択する必要があります **sandbox**. 選択するサンドボックスの名前はです ``Bootcamp``. それには、テキストをクリックします **[!UICONTROL 実稼動製品]** 画面上部の青い線 適切なを選択した後 [!UICONTROL sandbox]画面が変わり、専用の画面が表示されます [!UICONTROL sandbox].



左側のメニューで、に移動します。 **プロファイル** および **参照**.

![顧客プロファイル](./images/homemenu.png)

Web サイトのプロファイルビューアパネルで、ID の概要を確認できます。 すべての ID が名前空間にリンクされています。

![顧客プロファイル](./images/identities.png)


現在、プロファイルビューアパネルでは、次の ID を表示できます。

| 名前空間 | ID |
|:-------------:| :---------------:|
| Experience Cloud ID（ECID） | 19428085896177382402834560825640259081 |

Adobe Experience Platformでは、すべての ID が同じように重要です。 以前は、ECID はAdobeコンテキストで最も重要な ID であり、他のすべての ID は階層的な関係で ECID にリンクされていました。 Adobe Experience Platformでは、これは該当しなくなり、すべての ID がプライマリ識別情報と見なすことができます。

通常、プライマリ識別子はコンテキストに依存します。 コールセンターに問い合わせれば、 **最も重要な ID は何ですか？** 彼らはおそらく答えるだろう **電話番号！** しかし、CRM チームに次のような質問をすれば、チームは次のように回答するでしょう。 **メールアドレス！**  Adobe Experience Platformはこの複雑さを理解し、管理します。 Adobe用アプリケーションであれ、非Adobe用アプリケーションであれ、すべてのアプリケーションは、プライマリと見なされる ID を参照することでAdobe Experience Platformと通信します。 そしてそれは単に機能します。

フィールドの **ID 名前空間**&#x200B;を選択 **ECID** およびフィールドの場合 **ID 値** bootcamp web サイトのプロファイルビューアパネルにある ECID を入力します。 クリック **表示**. すると、リストにプロファイルが表示されます。 「」をクリックします **プロファイル ID** をクリックしてプロファイルを開きます。

![顧客プロファイル](./images/popupecid.png)

ここでは、いくつかの重要な事項の概要を説明します **プロファイル属性** 顧客プロファイル

![顧客プロファイル](./images/profile.png)

に移動 **イベント**&#x200B;を参照してください。プロファイルにリンクされているすべてのエクスペリエンスイベントのエントリを確認できます。

![顧客プロファイル](./images/profileee.png)

最後に、「メニュー」オプションに移動します **オーディエンスメンバーシップ**. このプロファイルに適格なすべてのオーディエンスが表示されます。

![顧客プロファイル](./images/profileseg.png)

次に、匿名または既知の顧客に対してカスタマーエクスペリエンスをパーソナライズできる新しいオーディエンスを作成します。

次の手順： [1.3 オーディエンスの作成 – UI](./ex3.md)

[ユーザーフロー 1 に戻る](./uc1.md)

[すべてのモジュールに戻る](../../overview.md)
