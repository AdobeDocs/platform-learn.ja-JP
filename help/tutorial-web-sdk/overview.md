---
title: Web SDK を使用した Adobe Experience Cloud 実装のチュートリアル
description: Adobe Experience Platform Web SDK を使用してExperience Cloudアプリケーションを実装する方法について説明します。
recommendations: catalog, noDisplay
exl-id: cf0ff74b-e81e-4f6d-ab7d-6c70e9b52d78
source-git-commit: aeff30f808fd65370b58eba69d24e658474a92d7
workflow-type: tm+mt
source-wordcount: '717'
ht-degree: 4%

---

# Web SDK を使用した Adobe Experience Cloud 実装のチュートリアル

Adobe Experience Platform Web SDK を使用してExperience Cloudアプリケーションを実装する方法について説明します。

Experience Platform Web SDK は、Adobe Experience Cloudのお客様がAdobe Experience Platform Edge Networkを通じてAdobeアプリケーションとサードパーティのサービスの両方を操作できるようにする、クライアントサイド JavaScript ライブラリです。 参照： [Adobe Experience Platform Web SDK の概要](https://experienceleague.adobe.com/en/docs/experience-platform/edge/home) を参照してください。

![Experience Platform Web SDK アーキテクチャ](assets/dc-websdk.png)

このチュートリアルでは、Luma と呼ばれるサンプルの小売 web サイトでの Platform Web SDK の実装について説明します。 この [Luma サイト](https://luma.enablementadobe.com/content/luma/us/en.html) には、現実的な実装を構築できる豊富なデータレイヤーと機能があります。 このチュートリアルでは、次の操作を行います。

* Luma web サイトの Platform Web SDK 実装を使用して、独自のアカウントに独自のタグプロパティを作成します。
* データストリーム、スキーマ、ID 名前空間など、Web SDK 実装のすべてのデータ収集機能を設定します。
* 次のAdobe Experience Cloud アプリケーションを追加します。
   * **[Adobe Experience Platform](setup-experience-platform.md)** （およびAdobe Real-time Customer Data Platform、Adobe Journey Optimizer、Adobe Customer Journey Analyticsなどの Platform 上に構築されたアプリケーション）
   * **[Adobe Analytics](setup-analytics.md)**
   * **[Adobe Audience Manager](setup-audience-manager.md)**
   * **[Adobe Target](setup-target.md)**
* イベント転送を実装して、Web SDK で収集されたデータをAdobe以外の宛先に送信します。
* Platform Debugger と Assurance を使用して独自のExperience Platform Web SDK 実装を検証します。

このチュートリアルを完了すると、Platform Web SDK を使用してすべてのマーケティングアプリケーションの実装を独自の web サイトで開始する準備が整います。


>[!NOTE]
>
>同様のマルチソリューションチュートリアルを次のユーザー向けに使用できます [Mobile SDK](../tutorial-mobile-sdk/overview.md).

## 前提条件

すべてのExperience Cloudユーザーは、Platform Web SDK を使用できます。 Web SDK を使用する場合、Real-time Customer Data PlatformやJourney Optimizerなどのプラットフォームベースのアプリケーションのライセンスを取得する必要はありません。

これらのレッスンでは、Adobeアカウントと、レッスンを完了するために必要なパーミッションがあることを前提としています。 そうでない場合、アクセス権を取得するには、会社のExperience Cloud管理者に問い合わせる必要があります。

* の場合 **データ収集**&#x200B;には、次が必要です。
   * **[!UICONTROL プラットフォーム]** – の権限 **[!UICONTROL Web]** ライセンスがある場合は、 **[!UICONTROL Edge]**
   * **[!UICONTROL プロパティ権限]** – に対する権限 **[!UICONTROL 承認]**, **[!UICONTROL 開発]**, **[!UICONTROL プロパティを編集]**, **[!UICONTROL 環境の管理]**, **[!UICONTROL 拡張機能の管理]**、および **[!UICONTROL 公開]**,
   * **[!UICONTROL 会社権限]** – に対する権限 **[!UICONTROL プロパティの管理]**

     タグの権限について詳しくは、を参照してください。 [ドキュメント](https://experienceleague.adobe.com/en/docs/experience-platform/tags/admin/user-permissions).

* の場合 **Experience Platform**&#x200B;には、次が必要です。

   * アクセス （への） **デフォルトの実稼動**, **「Prod」** サンドボックス。
   * アクセス先 **[!UICONTROL スキーマの管理]** および **[!UICONTROL スキーマの表示]** 未満 **[!UICONTROL データモデリング]**.
   * アクセス先 **[!UICONTROL ID 名前空間の管理]** および **[!UICONTROL ID 名前空間の表示]** 未満 **[!UICONTROL Identity Management]**.
   * アクセス先 **[!UICONTROL データストリームの管理]** および **[!UICONTROL データストリームを表示]** 未満 **[!UICONTROL データ収集]**.
   * Platform ベースのアプリケーションの顧客が、 [Experience Platformの設定](setup-experience-platform.md) レッスンでは、次の内容も習得する必要があります。
      * アクセス権限 **開発** サンドボックス。
      * の下のすべての権限項目 **[!UICONTROL データ管理]**、および **[!UICONTROL プロファイル管理]**:

     Real-Time CDPのようなプラットフォームベースのアプリケーションのお客様でなくても、すべてのExperience Cloudのお客様が必要な機能を利用できる必要があります。

     Platform のアクセス制御について詳しくは、を参照してください。 [ドキュメント](https://experienceleague.adobe.com/en/docs/experience-platform/access-control/home).

* オプションの場合 **Adobe Analytics** 教訓、あなたは持っている必要があります [レポートスイート設定、処理ルールおよびAnalysis Workspaceへの管理者アクセス](https://experienceleague.adobe.com/en/docs/analytics/admin/admin-console/home)

* オプションの場合 **Adobe Target** 教訓、あなたは持っている必要があります [編集者または承認者](https://experienceleague.adobe.com/docs/target/using/administer/manage-users/enterprise/properties-overview.html#section_8C425E43E5DD4111BBFC734A2B7ABC80) アクセス。

* オプションの場合 **Audience Manager** 特性、セグメントおよび宛先を作成、読み取り、書き込むためのアクセス権が必要です。 詳しくは、のチュートリアルを参照してください。 [Audience Managerの役割ベースのアクセス制御](https://experienceleague.adobe.com/en/docs/audience-manager-learn/tutorials/setup-and-admin/user-management/setting-permissions-with-role-based-access-control).


>[!NOTE]
>
>HTMLや JavaScript などのフロントエンド開発言語に精通していることを前提としています。 これらの言語のエキスパートである必要はありませんが、コードを読んで理解できれば、このチュートリアルをさらに活用できます。

## 更新

* 2024 年 4 月 24 日：変数の設定/変数の更新、分割パーソナライゼーションおよび分析リクエストの追加を含む大規模な更新、Journey Optimizerの賃貸事業者

## Luma web サイトを読み込みます

を読み込みます [Luma web サイト](https://luma.enablementadobe.com/content/luma/us/en.html){target="blank"} 別のブラウザータブでブックマークに追加しておくと、チュートリアル中に必要に応じて簡単に読み込むことができます。 ホストされている実稼動サイトを読み込める以外に、Luma への追加アクセスは必要ありません。

[![Luma web サイト](assets/old-overview-luma.png)](https://luma.enablementadobe.com/content/luma/us/en.html){target="blank"}

それでは、始めましょう。

[次へ： ](configure-schemas.md)

>[!NOTE]
>
>Adobe Experience Platform Web SDK の学習に時間を費やしていただき、ありがとうございます。 ご質問がある場合、一般的なフィードバックを共有したい場合、または将来のコンテンツに関するご提案がある場合は、このページでお知らせください [Experience League コミュニティ ディスカッションの投稿](https://experienceleaguecommunities.adobe.com/t5/adobe-experience-platform-launch/tutorial-discussion-implement-adobe-experience-cloud-with-web/td-p/444996)
