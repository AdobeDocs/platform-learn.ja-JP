---
title: Foundation — リアルタイム顧客プロファイル — 自分のリアルタイム顧客プロファイルを視覚化 — UI
description: Foundation — リアルタイム顧客プロファイル — 自分のリアルタイム顧客プロファイルを視覚化 — UI
kt: 5342
audience: Data Engineer, Data Architect, Marketer
doc-type: tutorial
activity: develop
exl-id: ed13e37f-48eb-4668-b828-6c58340a7cc1
source-git-commit: cc7a77c4dd380ae1bc23dc75608e8e2224dfe78c
workflow-type: tm+mt
source-wordcount: '557'
ht-degree: 2%

---

# 3.2 自身のリアルタイム顧客プロファイルの視覚化 — UI

この演習では、 Adobe Experience Platformにログインし、UI に独自のリアルタイム顧客プロファイルを表示します。

## Story

リアルタイム顧客プロファイルでは、すべてのプロファイルデータが、既存のセグメントメンバーシップと共にイベントデータと共に表示されます。 表示されるデータは、Adobe・アプリケーションや外部ソリューションなど、どこからでも取得できます。 これは、Adobe Experience Platformで最も強力なビューで、本当の経験システムです。

## 3.2.1 Adobe Experience Platformでの顧客プロファイルビューの使用

に移動します。 [Adobe Experience Platform](https://experience.adobe.com/platform). ログイン後、Adobe Experience Platformのホームページに移動します。

![データ取得](../module2/images/home.png)

続行する前に、 **サンドボックス**. 選択するサンドボックスの名前はです ``--aepSandboxId--``. これを行うには、 **[!UICONTROL 実稼動版]** 画面の上の青い線で表示されます。 適切な [!UICONTROL サンドボックス]画面が変更され、専用の [!UICONTROL サンドボックス].

![データ取得](../module2/images/sb1.png)

左側のメニューで、に移動します。 **プロファイル** および **参照**.

![顧客プロファイル](./images/homemenu.png)

Web サイトのプロファイルビューアパネルでは、複数の ID を検索できます。 すべての ID は名前空間にリンクされます。

![顧客プロファイル](./images/identities.png)

プロファイルビューアパネルで、ID と名前空間の次の組み合わせを確認できます。

| ID | 名前空間 |
|:-------------:| :---------------:|
| Experience Cloud ID (ECID) | 12507560687324495704459439363261812234 |
| 電子メール ID | woutervangeluwe+06022022-01@gmail.com |
| モバイル番号 ID | +32473622044+06022022-01 |

Adobe Experience Platformでは、すべての ID が同様に重要です。 以前は、ECID はAdobeコンテキストで最も重要な ID で、その他すべての ID は階層関係で ECID にリンクされていました。 Adobe Experience Platformの場合は、これが無効になり、すべての ID を主な識別子と見なすことができます。

通常、主な識別子はコンテキストに依存します。 コールセンターに問い合わせる場合、 **最も重要な ID は何ですか？** 彼らは答えるだろう **電話番号！** しかし、CRM チームに質問すれば、彼らは次のように答えます。 **メールアドレス！**  Adobe Experience Platformは、この複雑さを理解し、管理します。 AdobeアプリケーションとAdobe以外のアプリケーションとを問わず、すべてのアプリケーションは、プライマリと見なす ID を参照してAdobe Experience Platformと通信します。 そして、それは単に機能します。

フィールド **ID 名前空間**&#x200B;を選択します。 **電子メール** そしてフィールドに **ID 値** 前の演習で登録に使用した電子メールアドレスを入力します。 クリック **表示**. その後、リストに自分のプロファイルが表示されます。 次をクリック： **プロファイル ID** をクリックして、プロファイルを開きます。

![顧客プロファイル](./images/popupecid.png)

次に、いくつかの重要な概要を示します **プロファイル属性** 顧客プロファイルの

![顧客プロファイル](./images/profile.png)

プロファイルで使用可能なすべてのプロファイル属性を表示するには、に移動します。 **属性**.

![顧客プロファイル](./images/profilattr.png)

に移動します。 **イベント**&#x200B;を開き、プロファイルにリンクされているすべてのエクスペリエンスイベントのエントリを確認できます。

![顧客プロファイル](./images/profileee.png)

最後に、メニューオプションに移動します。 **セグメントのメンバーシップ**. これで、このプロファイルに適合するすべてのセグメントが表示されます。

![顧客プロファイル](./images/profileseg.png)

Adobe Experience Platformのユーザーインターフェイスを使用して、顧客のリアルタイムプロファイルを表示する方法を学びました。PostmanとAdobe I/Oを使用してAdobe Experience Platformの API に対するクエリを実行し、API を使用して同じ操作を行います。

次のステップ： [3.3 自身のリアルタイム顧客プロファイルの視覚化 — API](./ex3.md)

[モジュール 3 に戻る](./real-time-customer-profile.md)

[すべてのモジュールに戻る](../../overview.md)
