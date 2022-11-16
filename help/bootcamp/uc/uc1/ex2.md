---
title: Bootcamp — リアルタイム顧客プロファイル — 自分のリアルタイム顧客プロファイルを視覚化 — UI
description: Bootcamp — リアルタイム顧客プロファイル — 自分のリアルタイム顧客プロファイルを視覚化 — UI
kt: 5342
audience: Data Engineer, Data Architect, Marketer
doc-type: tutorial
activity: develop
exl-id: 4c810767-00ab-4cae-baa9-97b0cb9bf2df
source-git-commit: cc7a77c4dd380ae1bc23dc75608e8e2224dfe78c
workflow-type: tm+mt
source-wordcount: '508'
ht-degree: 2%

---

# 1.2 自身のリアルタイム顧客プロファイルの視覚化 — UI

この演習では、 Adobe Experience Platformにログインし、UI に独自のリアルタイム顧客プロファイルを表示します。

## Story

リアルタイム顧客プロファイルでは、すべてのプロファイルデータが、既存のセグメントメンバーシップと共にイベントデータと共に表示されます。 表示されるデータは、Adobe・アプリケーションや外部ソリューションなど、どこからでも取得できます。 これは、Adobe Experience Platformで最も強力なビューで、本当の経験システムです。

## 1.2.1 Adobe Experience Platformでの顧客プロファイルビューの使用

に移動します。 [Adobe Experience Platform](https://experience.adobe.com/platform). ログイン後、Adobe Experience Platformのホームページに移動します。

![データ取得](./images/home.png)

続行する前に、 **サンドボックス**. 選択するサンドボックスの名前はです ``Bootcamp``. これを行うには、 **[!UICONTROL 実稼動版]** 画面の上の青い線で表示されます。 適切な [!UICONTROL サンドボックス]画面が変更され、専用の [!UICONTROL サンドボックス].

![データ取得](./images/sb1.png)

左側のメニューで、に移動します。 **プロファイル** および **参照**.

![顧客プロファイル](./images/homemenu.png)

Web サイトのプロファイルビューアパネルで、ID の概要を確認できます。 すべての ID は名前空間にリンクされます。

![顧客プロファイル](./images/identities.png)

プロファイルビューアパネルでは、現在、次の ID を確認できます。

| 名前空間 | ID |
|:-------------:| :---------------:|
| Experience Cloud ID (ECID) | 19428085896177382402834560825640259081 |

Adobe Experience Platformでは、すべての ID が同様に重要です。 以前は、ECID はAdobeコンテキストで最も重要な ID で、その他すべての ID は階層関係で ECID にリンクされていました。 Adobe Experience Platformの場合は、これが無効になり、すべての ID を主な識別子と見なすことができます。

通常、主な識別子はコンテキストに依存します。 コールセンターに問い合わせる場合、 **最も重要な ID は何ですか？** 彼らは答えるだろう **電話番号！** しかし、CRM チームに質問すれば、彼らは次のように答えます。 **メールアドレス！**  Adobe Experience Platformは、この複雑さを理解し、管理します。 AdobeアプリケーションとAdobe以外のアプリケーションとを問わず、すべてのアプリケーションは、プライマリと見なす ID を参照してAdobe Experience Platformと通信します。 そして、それは単に機能します。

フィールド **ID 名前空間**&#x200B;を選択します。 **ECID** そしてフィールドに **ID 値** bootcamp web サイトのプロファイルビューアパネルにある ECID を入力します。 クリック **表示**. その後、リストに自分のプロファイルが表示されます。 次をクリック： **プロファイル ID** をクリックして、プロファイルを開きます。

![顧客プロファイル](./images/popupecid.png)

次に、いくつかの重要な概要を示します **プロファイル属性** 顧客プロファイルの

![顧客プロファイル](./images/profile.png)

に移動します。 **イベント**&#x200B;を開き、プロファイルにリンクされているすべてのエクスペリエンスイベントのエントリを確認できます。

![顧客プロファイル](./images/profileee.png)

最後に、メニューオプションに移動します。 **セグメントのメンバーシップ**. これで、このプロファイルに適合するすべてのセグメントが表示されます。

![顧客プロファイル](./images/profileseg.png)

次に、匿名顧客や既知の顧客に対して顧客体験をパーソナライズする新しいセグメントを作成します。

次のステップ： [1.3 セグメントの作成 — UI](./ex3.md)

[ユーザーフローに戻る 1](./uc1.md)

[すべてのモジュールに戻る](../../overview.md)
