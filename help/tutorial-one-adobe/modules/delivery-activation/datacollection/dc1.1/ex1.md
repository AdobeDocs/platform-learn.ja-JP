---
title: Foundation - Adobe Experience Platform Data Collection と Web SDK拡張機能の設定 – Adobe Experience Platform Data Collection について
description: Foundation - Adobe Experience Platform Data Collection と Web SDK拡張機能の設定 – Adobe Experience Platform Data Collection について
kt: 5342
doc-type: tutorial
exl-id: 1f5dd730-d84a-4d3a-b5ef-2be3e089c7fd
source-git-commit: 9c4d585d99920f0cdfd9de083c3f020f0d8171ab
workflow-type: tm+mt
source-wordcount: '573'
ht-degree: 2%

---

# 1.1.1 Adobe Experience Platformのデータ収集について

## コンテキスト

Adobe Experience Platform Data Collection は、企業が様々なユースケースに使用しています。 これは、関連性の高いカスタマーエクスペリエンス（顧客体験）を実現するために必要なすべての分析、マーケティング、広告などのソリューションを、簡単にデプロイして管理できる、次世代のTag Management システム（TMS）です。 Adobe Experience Platform Data Collection は追加料金なしで、Adobe Experience Cloudをご利用のお客様であれば誰でも利用できます。 ブランドがAdobe Experience Platform データ収集を使用して、以下を行うことができます。

- Adobe Experience Cloud アプリケーションおよびAdobe Experience Platformを実装します。
- それぞれに独自の **プロパティ** を提供して、組織の異なる部分の異なる要件を管理します。
- テストとライフサイクル管理が可能です。
- カスタム JavaScriptおよびサードパーティタグを挿入し、すべて 1 か所で管理します。

## UI の探索

[Adobe Experience Platform Data Collection](https://experience.adobe.com/#/data-collection/) に移動します。 正しい環境を使用していることを確認します。これは `--aepImsOrgName--` です。

>[!NOTE]
>
>このチュートリアルは、環境 **Experience Platform International** を使用してドキュメント化されています。 環境名は異なる可能性が高いので、スクリーンショットに **Experience Platform International** という名前が表示される場合は、必ず `--aepImsOrgName--` を付けた独自の環境名に置き換える必要があります。

![Launch のプロパティビュー ](./images/launch0.png)

**タグ** に移動します。 **[!UICONTROL プロパティ]** ビューが表示されます。 ここに一覧表示されるプロパティは、チュートリアル管理のためのものです。 これらのプロパティは、次の項目を表します。

- アプリと web のプロパティ
- 様々な方法で顧客にサービスを提供する様々な web サイト。 例えば、Luma Retail に 1 つのプロパティがあり、Luma Travel にはもう 1 つのプロパティがあるとします。
- 従来の Web サイトと現在の Web サイト
- 複数の異なる web サイトに共通の特定のAdobe Analytics デザイン
- 内部イントラネットページと外部サイト

![Launch のプロパティビュー ](./images/launch1.png)

次に、左側のレールを見てみましょう。

![ 左パネルを開く ](./images/launch2.png)

- **[!UICONTROL タグ]** クライアントサイドのすべてのプロパティの概要を説明します
- **[!UICONTROL アプリサーフェス]** では、プッシュ通知を有効にするすべてのアプリ設定の概要を示します（この設定は Project Sierra と組み合わせて使用または有効になります）
- **[!UICONTROL データストリーム]** については、[ 次の演習 ](./ex2.md) で説明します
- **[!UICONTROL イベント転送]** では、[ モジュール 2.5 - Real-Time CDP Connections：イベント転送 ](./../../../../modules/delivery-activation/rtcdp-b2c/rtcdpb2c-5/aep-data-collection-ssf.md) で説明するすべてのサーバーサイドプロパティの概要を説明します。
- **[!UICONTROL 監視]** イベント転送を通じた送受信イベントトラフィックの概要を示します
- **[!UICONTROL Assurance]** Adobe Debuggerを使用して実装をデバッグするためのアクセスを提供します
- **[!UICONTROL Places]** を使用すると、モバイルアプリケーションで場所ベースのパーソナライゼーションにアクセス可能になる POI を管理できます
- **[!UICONTROL スキーマ]** Adobe Experience Platformのスキーマエディターへのアクセスを提供します
- **[!UICONTROL ID]** Adobe Experience Platformの ID グラフ設定へのアクセスを提供します

## 詳細情報

Adobe Experience Platform Data Collection は、Adobe Experience Platform チュートリアルの範囲を超えた非常に高度なツールです。 組織では、タグ管理機能にAdobe Experience Platform Data Collection を使用せず、代わりにAdobe以外のタグ管理ソリューションを使用して、コードの挿入やタグの管理を行っている場合があります。 Adobe以外のタグ管理ソリューションの使用は、AdobeおよびAdobe Professional Servicesでサポートされています。
Adobe Experience Platform Data Collection の理解に興味があるユーザー向けの参考資料を以下に示します。

- [Adobe Experience Platform データ収集ユーザーガイド ](https://experienceleague.adobe.com/docs/experience-platform/tags/home.html?lang=ja)
- [Web SDK を使用した Adobe Experience Cloud 実装のチュートリアル](https://experienceleague.adobe.com/docs/platform-learn/implement-web-sdk/overview.html?lang=ja)
- [ ユーザー権限の設定 ](https://experienceleague.adobe.com/docs/experience-platform/tags/admin/user-permissions.html?lang=ja)
- [API ドキュメント ](https://developer.adobelaunch.com/api/)

## 次の手順

[1.1.2 Edge Network、データストリーム、サーバーサイドのデータ収集に移動します ](./ex2.md){target="_blank"}

[Adobe Experience Platform データ収集の設定と web SDK タグ拡張機能 ](./data-ingestion-launch-web-sdk.md){target="_blank"} に戻ります

[ すべてのモジュール ](./../../../../overview.md){target="_blank"} に戻る
