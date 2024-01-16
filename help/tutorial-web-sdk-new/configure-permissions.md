---
title: チュートリアルの権限の設定
description: Experience PlatformWeb SDK へのアクセスをリクエストする方法と、「 Web SDK を使用したAdobe Experience Cloudの実装」チュートリアルを完了するために必要な権限の設定方法について説明します。
feature: Web SDK,Tags,Access Control
source-git-commit: f08866de1bd6ede50bda1e5f8db6dbd2951aa872
workflow-type: tm+mt
source-wordcount: '367'
ht-degree: 4%

---

# チュートリアルの権限の設定

Experience PlatformWeb SDK へのアクセスをリクエストする方法と、このチュートリアルを完了するために必要な権限を設定する方法について説明します。 データ収集インターフェイスのタグを使用して Platform Web SDK を実装するには、 [Admin Console](https://adminconsole.adobe.com).

## データ収集

* 次の権限を持っている： **[!UICONTROL 開発]**, **[!UICONTROL 編集]**, **[!UICONTROL 承認]**, **[!UICONTROL 公開]**, **[!UICONTROL 拡張機能の管理]**, **[!UICONTROL 環境の管理]**、および **[!UICONTROL プロパティを管理]**. タグの権限について詳しくは、 [ドキュメント](https://experienceleague.adobe.com/docs/experience-platform/tags/admin/user-permissions.html?lang=ja).
* オプションのイベント転送レッスンを完了する場合は、エッジ転送と権限項目を含む製品ライセンスをお持ちください。 **[!UICONTROL プラットフォーム]** > **[!UICONTROL Edge]**

## Experience Platform

Real-Time CDPなどの Platform ベースのExperience Cloudをお使いでない場合でも、これらの機能をすべてのアプリケーションのお客様が利用できる必要があります。

* へのアクセス **デフォルトの実稼動**, **&quot;Prod&quot;** サンドボックス。
* アクセス先 **[!UICONTROL スキーマを管理]** および **[!UICONTROL スキーマを表示]** under **[!UICONTROL データモデリング]**.
* アクセス先 **[!UICONTROL ID 名前空間の管理]** および **[!UICONTROL ID 名前空間の表示]** under **[!UICONTROL Identity Management]**.
* アクセス先 **[!UICONTROL データストリームの管理]** および **[!UICONTROL データストリームの表示]** under **[!UICONTROL データ収集]**.
* Platform ベースのアプリケーションをご利用のお客様で、 [設定Experience Platform](setup-experience-platform.md) レッスン：
   * へのアクセス **開発** サンドボックス。
   * 以下のすべての権限項目 **[!UICONTROL データ管理]**、および **[!UICONTROL プロファイル管理]**:


Platform のアクセス制御について詳しくは、 [ドキュメント](https://experienceleague.adobe.com/docs/experience-platform/access-control/home.html?lang=ja).

## Adobe Analytics

オプションのAdobe Analyticsレッスンの場合、 [レポートスイート設定、処理ルールおよびAnalysis Workspaceへの管理者アクセス権](https://experienceleague.adobe.com/docs/analytics/admin/admin-console/home.html?lang=ja)

## Adobe Target

オプションのAdobe Targetレッスンの場合、 [編集者または承認者](https://experienceleague.adobe.com/docs/target/using/administer/manage-users/enterprise/properties-overview.html#section_8C425E43E5DD4111BBFC734A2B7ABC80) にアクセスします。

## Adobe Audience Manager

* オプションのAudience Managerレッスンでは、特性、セグメント、宛先の作成、読み取り、書き込みをおこなうアクセス権が必要です。 詳しくは、 [Audience Managerの役割に基づくアクセス制御](https://experienceleague.adobe.com/docs/audience-manager-learn/tutorials/setup-and-admin/user-management/setting-permissions-with-role-based-access-control.html?lang=en).

これで、初期設定手順を開始する準備が整いました。

[次へ： ](configure-schemas.md)

>[!NOTE]
>
>Adobe Experience Platform Web SDK の学習に時間を割いていただき、ありがとうございます。 ご質問がある場合、一般的なフィードバックを共有したい場合、または今後のコンテンツに関する提案がある場合は、こちらで共有してください [Experience Leagueコミュニティディスカッション投稿](https://experienceleaguecommunities.adobe.com/t5/adobe-experience-platform-launch/tutorial-discussion-implement-adobe-experience-cloud-with-web/td-p/444996)
