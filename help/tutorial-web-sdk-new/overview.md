---
title: Web SDK を使用した Adobe Experience Cloud 実装のチュートリアル
description: Adobe Experience Platform Web SDK を使用してExperience Cloudアプリケーションを実装する方法について説明します。
recommendations: catalog, noDisplay
source-git-commit: 12e6e9d06ae0d6945c165032d89fd0f801d94ff2
workflow-type: tm+mt
source-wordcount: '695'
ht-degree: 4%

---

# Web SDK を使用した Adobe Experience Cloud 実装のチュートリアル

Adobe Experience Platform Web SDK を使用してExperience Cloudアプリケーションを実装する方法について説明します。

Experience PlatformWeb SDK は、Adobe Experience Cloudのお客様がAdobe Experience Platform Edge Network を通じてAdobeアプリケーションとサードパーティのサービスの両方を操作できる、クライアントサイド JavaScript ライブラリです。 詳しくは、 [Adobe Experience Platform Web SDK の概要](https://experienceleague.adobe.com/docs/experience-platform/edge/home.html?lang=ja) を参照してください。

![Experience PlatformWeb SDK のアーキテクチャ](assets/dc-websdk.png)

このチュートリアルでは、Luma と呼ばれるサンプルの小売 Web サイトで Platform Web SDK を実装する手順を説明します。 The [Luma サイト](https://luma.enablementadobe.com/content/luma/us/en.html) には、現実的な実装を構築できる豊富なデータレイヤーと機能があります。 このチュートリアルでは、次の操作をおこないます。

* Luma Web サイト用の Platform Web SDK 実装を使用して、独自のアカウントで独自のタグプロパティを作成します。
* データストリーム、スキーマ、ID 名前空間など、Web SDK 実装のすべてのデータ収集機能を設定します。
* 次のAdobe Experience Cloudアプリケーションを追加します。
   * **[Adobe Experience Platform](setup-experience-platform.md)** ( および、Adobe Real-time Customer Data Platform、Adobe Journey Optimizer、Adobe Customer Journey Analyticsなど、Platform 上で構築されたアプリケーション )
   * **[Adobe Analytics](setup-analytics.md)**
   * **[Adobe Audience Manager](setup-audience-manager.md)**
   * **[Adobe Target](setup-target.md)**
* イベント転送を実装して、Web SDK で収集されたデータをAdobe以外の宛先に送信する。
* Platform Debugger とアシュランスを使用して、独自の Platform Web SDKExperience Platformを検証します。

このチュートリアルを完了すると、すべてのマーケティングアプリケーションを、お客様独自の Web サイト上で Platform Web SDK を通じて実装する準備が整います。


>[!NOTE]
>
>同様のマルチソリューションチュートリアルを、 [モバイル SDK](../tutorial-mobile-sdk/overview.md).

## 前提条件

すべてのExperience Cloudユーザーが Platform Web SDK を使用できます。 Real-time Customer Data PlatformやJourney Optimizerなどのプラットフォームベースのアプリケーションのライセンスを取得して Web SDK を使用する必要はありません。

このレッスンでは、レッスンを完了するために必要なAdobeアカウントと権限があることを前提としています。 アクセスできない場合は、Experience Cloud管理者に問い合わせて、アクセス権を要求する必要があります。

* の場合 **データ収集**&#x200B;を使用するには、次の条件を満たす必要があります。
   * **[!UICONTROL プラットフォーム]** — 許可を得ている **[!UICONTROL Web]** および（ライセンスが必要な場合） **[!UICONTROL Edge]**
   * **[!UICONTROL プロパティ権限]** — 許可を得て **[!UICONTROL 承認]**, **[!UICONTROL 開発]**, **[!UICONTROL プロパティを編集]**, **[!UICONTROL 環境の管理]**, **[!UICONTROL 拡張機能の管理]**、および **[!UICONTROL 公開]**,
   * **[!UICONTROL 会社権限]** — 許可を得て **[!UICONTROL プロパティを管理]**

     タグの権限について詳しくは、 [ドキュメント](https://experienceleague.adobe.com/docs/experience-platform/tags/admin/user-permissions.html?lang=ja).

* の場合 **Experience Platform**&#x200B;を使用するには、次の条件を満たす必要があります。

   * へのアクセス **デフォルトの実稼動**, **&quot;Prod&quot;** サンドボックス。
   * アクセス先 **[!UICONTROL スキーマを管理]** および **[!UICONTROL スキーマを表示]** under **[!UICONTROL データモデリング]**.
   * アクセス先 **[!UICONTROL ID 名前空間の管理]** および **[!UICONTROL ID 名前空間の表示]** under **[!UICONTROL Identity Management]**.
   * アクセス先 **[!UICONTROL データストリームの管理]** および **[!UICONTROL データストリームの表示]** under **[!UICONTROL データ収集]**.
   * Platform ベースのアプリケーションをご利用のお客様で、 [設定Experience Platform](setup-experience-platform.md) レッスン：
      * へのアクセス **開発** サンドボックス。
      * 以下のすべての権限項目 **[!UICONTROL データ管理]**、および **[!UICONTROL プロファイル管理]**:

     Real-Time CDPなどの Platform ベースのExperience Cloudをお使いでない場合でも、必要な機能をすべてのアプリケーションのお客様が利用できる必要があります。

     Platform のアクセス制御について詳しくは、 [ドキュメント](https://experienceleague.adobe.com/docs/experience-platform/access-control/home.html?lang=ja).

* オプションの **Adobe Analytics** レッスン： [レポートスイート設定、処理ルールおよびAnalysis Workspaceへの管理者アクセス権](https://experienceleague.adobe.com/docs/analytics/admin/admin-console/home.html?lang=ja)

* オプションの **Adobe Target** レッスン： [編集者または承認者](https://experienceleague.adobe.com/docs/target/using/administer/manage-users/enterprise/properties-overview.html#section_8C425E43E5DD4111BBFC734A2B7ABC80) にアクセスします。

* オプションの **Audience Manager** レッスンでは、特性、セグメント、宛先の作成、読み取り、書き込みをおこなう権限が必要です。 詳しくは、 [Audience Managerの役割に基づくアクセス制御](https://experienceleague.adobe.com/docs/audience-manager-learn/tutorials/setup-and-admin/user-management/setting-permissions-with-role-based-access-control.html?lang=en).


>[!NOTE]
>
>ユーザーがHTMLや JavaScript などのフロントエンド開発言語に詳しいことを前提としています。 これらの言語の専門家である必要はありませんが、コードを読んで理解できる場合は、このチュートリアルをさらに活用できます。

## Luma Web サイトを読み込みます。

を読み込む [Luma Web サイト](https://luma.enablementadobe.com/content/luma/us/en.html) を別のブラウザータブに追加し、ブックマークに追加して、チュートリアル中に必要に応じて簡単に読み込めるようにします。 Luma への追加のアクセス権は、ホストされている実稼動サイトを読み込む以外に必要ありません。

[![Luma Web サイト](assets/old-overview-luma.png)](https://luma.enablementadobe.com/content/luma/us/en.html)

それでは、始めましょう。

[次へ： ](configure-schemas.md)

>[!NOTE]
>
>Adobe Experience Platform Web SDK の学習に時間を割いていただき、ありがとうございます。 ご質問がある場合、一般的なフィードバックを共有したい場合、または今後のコンテンツに関する提案がある場合は、こちらで共有してください [Experience Leagueコミュニティディスカッション投稿](https://experienceleaguecommunities.adobe.com/t5/adobe-experience-platform-launch/tutorial-discussion-implement-adobe-experience-cloud-with-web/td-p/444996)
