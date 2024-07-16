---
title: Web SDK を使用した Adobe Experience Cloud 実装のチュートリアル
description: Adobe Experience Platform Web SDK を使用して、Experience Cloud アプリケーションを実装する方法について説明します。
recommendations: catalog, noDisplay
exl-id: cf0ff74b-e81e-4f6d-ab7d-6c70e9b52d78
source-git-commit: 8602110d2b2ddc561e45f201e3bcce5e6a6f8261
workflow-type: tm+mt
source-wordcount: '717'
ht-degree: 7%

---

# Web SDK を使用した Adobe Experience Cloud 実装のチュートリアル

Adobe Experience Platform Web SDK を使用して、Experience Cloud アプリケーションを実装する方法について説明します。

Experience Platform Web SDK は、Adobe Experience Cloudのお客様がAdobe Experience Platform Edge Networkを通じてAdobeアプリケーションとサードパーティのサービスの両方を操作できるようにする、クライアントサイド JavaScript ライブラリです。 詳しくは、[Adobe Experience Platform Web SDK の概要 ](https://experienceleague.adobe.com/en/docs/experience-platform/edge/home) を参照してください。

![Experience Platform Web SDK アーキテクチャ ](assets/dc-websdk.png)

このチュートリアルでは、Luma と呼ばれるサンプルの小売 web サイトでの Platform Web SDK の実装について説明します。 [Luma サイト ](https://luma.enablementadobe.com/content/luma/us/en.html) には、現実的な実装を構築できる豊富なデータレイヤーと機能があります。 このチュートリアルでは、次の操作を行います。

* Luma web サイトの Platform Web SDK 実装を使用して、独自のアカウントに独自のタグプロパティを作成します。
* データストリーム、スキーマ、ID 名前空間など、Web SDK 実装のすべてのデータ収集機能を設定します。
* 次のAdobe Experience Cloud アプリケーションを追加します。
   * **[Adobe Experience Platform](setup-experience-platform.md)** （およびAdobe Real-time Customer Data Platform、Adobe Journey Optimizer、Adobe Customer Journey Analyticsなど、Platform 上で構築されたアプリケーション）
   * **[Adobe Analytics](setup-analytics.md)**
   * **[Adobe Audience Manager](setup-audience-manager.md)**
   * **[Adobe Target](setup-target.md)**
* イベント転送を実装して、Web SDK で収集されたデータをAdobe以外の宛先に送信します。
* Platform Debugger と Assurance を使用して独自のExperience Platform Web SDK 実装を検証します。

このチュートリアルを完了すると、Platform Web SDK を使用してすべてのマーケティングアプリケーションの実装を独自の web サイトで開始する準備が整います。


>[!NOTE]
>
>[Mobile SDK](../tutorial-mobile-sdk/overview.md) についても、同様のマルチソリューションチュートリアルが利用できます。

## 前提条件

すべてのExperience Cloudユーザーは、Platform Web SDK を使用できます。 Web SDK を使用する場合、Real-time Customer Data PlatformやJourney Optimizerなどのプラットフォームベースのアプリケーションのライセンスを取得する必要はありません。

これらのレッスンでは、Adobeアカウントと、レッスンを完了するために必要なパーミッションがあることを前提としています。 そうでない場合、アクセス権を取得するには、会社のExperience Cloud管理者に問い合わせる必要があります。

* **データ収集** の場合は、次を持つ必要があります。
   * **[!UICONTROL プラットフォーム]** - **[!UICONTROL Web]** に対する権限、およびライセンスがある場合は **[!UICONTROL Edge]**
   * **[!UICONTROL プロパティ権限]** - **[!UICONTROL 承認]**、**[!UICONTROL 開発]**、**[!UICONTROL プロパティの編集]**、**[!UICONTROL 環境の管理]**、**[!UICONTROL 拡張機能の管理]**、**[!UICONTROL Publish]** の権限
   * **[!UICONTROL 会社権限]** - プロパティを **[!UICONTROL 管理する権限]**

     タグの権限について詳しくは、[ ドキュメント ](https://experienceleague.adobe.com/en/docs/experience-platform/tags/admin/user-permissions) を参照してください。

* **Experience Platform** の場合、次が必要です。

   * **デフォルトの実稼動環境****「Prod」** サンドボックスにアクセスします。
   * **[!UICONTROL データモデリング]** の下の **[!UICONTROL スキーマの管理]** および **[!UICONTROL スキーマの表示]** にアクセスします。
   * **[!UICONTROL 4}Identity Management]** の下の **[!UICONTROL ID 名前空間の管理]** および ]**ID 名前空間の表示にアクセスします。**[!UICONTROL 
   * **[!UICONTROL データ収集]** の下の ]**データストリームの管理**[!UICONTROL  および ]**データストリームの表示**[!UICONTROL  にアクセスします。
   * Platform ベースのアプリケーションを使用し、[Experience Platformの設定 ](setup-experience-platform.md) のレッスンを修了する場合は、次のことも習得する必要があります。
      * **開発** サンドボックスへのアクセス。
      * **[!UICONTROL データ管理]**、**[!UICONTROL プロファイル管理]** 以下のすべての権限項目：

     Real-Time CDPのようなプラットフォームベースのアプリケーションのお客様でなくても、すべてのExperience Cloudのお客様が必要な機能を利用できる必要があります。

     Platform のアクセス制御について詳しくは、[ ドキュメント ](https://experienceleague.adobe.com/en/docs/experience-platform/access-control/home) を参照してください。

* オプションの **Adobe Analytics** レッスンでは、[ 管理者としてレポートスイートの設定、処理ルール、Analysis Workspaceにアクセスできる必要があり ](https://experienceleague.adobe.com/en/docs/analytics/admin/admin-console/home) す。

* オプションの **Adobe Target** レッスンでは、「編集者」または「承認者 [ のアクセス権が必要 ](https://experienceleague.adobe.com/en/docs/target/using/administer/manage-users/enterprise/properties-overview#section_8C425E43E5DD4111BBFC734A2B7ABC80) す。

* オプションの **Audience Manager** レッスンでは、特性、セグメント、宛先を作成、読み取り、書き込むためのアクセス権が必要です。 詳しくは、[Audience Managerの役割ベースのアクセス制御 ](https://experienceleague.adobe.com/en/docs/audience-manager-learn/tutorials/setup-and-admin/user-management/setting-permissions-with-role-based-access-control) のチュートリアルを参照してください。


>[!NOTE]
>
>HTMLやJavaScriptなどのフロントエンド開発言語に精通していることを前提としています。 これらの言語のエキスパートである必要はありませんが、コードを読んで理解できれば、このチュートリアルをさらに活用できます。

## 更新

* 2024 年 4 月 24 日：変数の設定/変数の更新、パーソナライゼーションおよび分析リクエストの分割、Journey Optimizerのレッスンを含む大幅な更新

## Luma web サイトを読み込みます

[Luma web サイト ](https://luma.enablementadobe.com/content/luma/us/en.html){target="blank"} を別のブラウザータブに読み込んでブックマークすると、チュートリアル中に必要に応じて簡単に読み込むことができます。 ホストされている実稼動サイトを読み込める以外に、Luma への追加アクセスは必要ありません。

[![Luma web サイト ](assets/old-overview-luma.png)](https://luma.enablementadobe.com/content/luma/us/en.html){target="blank"}

それでは、始めましょう。

[次へ： ](configure-schemas.md)

>[!NOTE]
>
>Adobe Experience Platform Web SDK の学習に時間を費やしていただき、ありがとうございます。 ご不明な点がある場合や、一般的なフィードバックを投稿したい場合、または今後のコンテンツに関するご提案がある場合は、この [Experience League コミュニティ ディスカッションの投稿でお知らせください ](https://experienceleaguecommunities.adobe.com/t5/adobe-experience-platform-data/tutorial-discussion-implement-adobe-experience-cloud-with-web/td-p/444996)
