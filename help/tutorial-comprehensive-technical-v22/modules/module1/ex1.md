---
title: Foundation - Adobe Experience Platformデータ収集と Web SDK 拡張機能の設定 — Adobe Experience Platformデータ収集について
description: Foundation - Adobe Experience Platformデータ収集と Web SDK 拡張機能の設定 — Adobe Experience Platformデータ収集について
kt: 5342
audience: Data Engineer, Data Architect
doc-type: tutorial
activity: develop
exl-id: f498bb8c-659c-44b4-bb2e-36ea14640773
source-git-commit: cc7a77c4dd380ae1bc23dc75608e8e2224dfe78c
workflow-type: tm+mt
source-wordcount: '459'
ht-degree: 8%

---

# 1.1 Adobe Experience Platformデータ収集について

## コンテキスト

Adobe Experience Platformデータ収集は、ブランドで多くの使用例に使用されます。 これは次世代のTag Managementシステム (TMS) で、顧客体験の実現に必要なすべての分析、マーケティング、広告の各ソリューションをデプロイおよび管理するためのシンプルな手段を提供します。 Adobe Experience Platform Data Collection では追加料金はかかりません。Adobe Experience Cloudのお客様で利用できます。 ブランドは、Adobe Experience Platformデータ収集を使用して次のことをおこなうことができます。

- Adobe Experience CloudアプリケーションとAdobe Experience Platformを実装します。
- それぞれに独自の情報を提供することで、組織の様々な部門の様々な要件を管理 **プロパティ** をクリックして管理します。
- テストとライフサイクル管理を許可します。
- すべて 1 か所で管理されるカスタム JavaScript およびサードパーティタグを挿入します。

## UI の参照

に移動します。 [Adobe Experience Platform Data Collection](https://experience.adobe.com/#/data-collection/).

に移動します。 **タグ**. 現在、 **[!UICONTROL プロパティ]** 表示 ここに示すプロパティは、チュートリアル管理用です。 これらのプロパティは次を表します…

- アプリと Web のプロパティ
- 様々な方法で顧客に提供される様々な Web サイト。 例えば、Luma Retail には 1 つのプロパティがあり、Luma Travel には別のプロパティがあります
- 従来の Web サイトと現在の Web サイト
- 複数の異なる Web サイトに共通の特定のAdobe Analyticsデザイン
- 外部サイトと共に内部イントラネットページを作成する

![ローンチのプロパティ表示](./images/launch1.png)

次に、左側のパネルを見てみましょう。

![左パネルを起動](./images/launch2.png)

- **[!UICONTROL タグ]** は、すべてのクライアント側プロパティの概要を示します。
- **[!UICONTROL アプリのサーフェス]** では、プッシュ通知を有効にするすべてのアプリ設定の概要を示します（Project Sierra との組み合わせで使用/有効化）。
- **[!UICONTROL データストリーム]** が [次の練習](./ex2.md)
- **[!UICONTROL イベント転送]** に、 [モジュール 14 - Real-Time CDP接続：イベント転送](../module14/aep-data-collection-ssf.md)

## その他の情報

Adobe Experience Platformデータ収集は、 Adobe Experience Platformチュートリアル以外の範囲を持つ、非常に高度なツールです。 組織では、タグ管理機能にAdobe Experience Platform Data Collection を使用せず、代わりに、コードの挿入やタグの管理に、Adobe以外のタグ管理ソリューションを使用する場合があります。 非Adobeタグ管理ソリューションの使用は、AdobeとAdobe Professional Servicesでサポートされます。
Adobe Experience Platformのデータ収集について詳しく理解したい場合は、以下の情報を参照してください。

- [Adobe Experience Platform Data Collection ユーザーガイド](https://experienceleague.adobe.com/docs/experience-platform/tags/home.html?lang=ja)
- [Web SDK を使用した Adobe Experience Cloud 実装のチュートリアル](https://experienceleague.adobe.com/docs/platform-learn/implement-web-sdk/overview.html?lang=ja)
- [ユーザー権限の設定](https://experienceleague.adobe.com/docs/experience-platform/tags/admin/user-permissions.html?lang=ja)
- [API ドキュメント](https://developer.adobelaunch.com/api/)

次のステップ： [1.2 Edge Network、Datastreams および Server Side のデータ収集](./ex2.md)

[モジュール 1 に戻る](./data-ingestion-launch-web-sdk.md)

[すべてのモジュールに戻る](./../../overview.md)
