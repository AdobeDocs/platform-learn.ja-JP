---
title: チュートリアルの権限の設定
description: Experience PlatformWeb SDK へのアクセスをリクエストする方法と、「 Web SDK を使用したAdobe Experience Cloudの実装」チュートリアルを完了するために必要な権限の設定方法について説明します。
feature: Web SDK,Tags,Access Control
exl-id: d7c4f2c3-cf3c-4587-88f8-82113d250084
source-git-commit: 9f75ef042342e1ff9db6039e722159ad96ce5e5b
workflow-type: tm+mt
source-wordcount: '403'
ht-degree: 3%

---

# チュートリアルの権限の設定


>[!CAUTION]
>
>このチュートリアルに対する大きな変更は、2024 年 3 月 15 日（金）に公開される予定です。 その後、多くの演習が変更され、すべてのレッスンを完了するには、チュートリアルを最初から再起動する必要が生じる場合があります。

Experience PlatformWeb SDK へのアクセスをリクエストする方法と、このチュートリアルを完了するために必要な権限を設定する方法について説明します。 データ収集インターフェイスのタグを使用して Platform Web SDK を実装するには、 [Admin Console](https://adminconsole.adobe.com).

## データ収集

* 次の権限を持っている： **[!UICONTROL 開発]**, **[!UICONTROL 編集]**, **[!UICONTROL 承認]**, **[!UICONTROL 公開]**, **[!UICONTROL 拡張機能の管理]**, **[!UICONTROL 環境の管理]**、および **[!UICONTROL プロパティを管理]**. タグ権限について詳しくは、 [ドキュメント](https://experienceleague.adobe.com/docs/experience-platform/tags/admin/user-permissions.html?lang=ja).
* オプションのイベント転送レッスンを完了する場合は、エッジ転送と権限項目を含む製品ライセンスをお持ちください。 **[!UICONTROL プラットフォーム]** > **[!UICONTROL Edge]**

## Experience Platform

Real-Time CDPなどの Platform ベースのExperience Cloudをお使いでない場合でも、これらの機能をすべてのアプリケーションのお客様が利用できる必要があります。

* へのアクセス **デフォルトの実稼動**, **&quot;Prod&quot;** サンドボックス。
* アクセス先 **[!UICONTROL スキーマを管理]** および **[!UICONTROL スキーマを表示]** under **[!UICONTROL データモデリング]**
* アクセス先 **[!UICONTROL ID 名前空間の管理]** および **[!UICONTROL ID 名前空間の表示]** under **[!UICONTROL Identity Management]**
* アクセス先 **[!UICONTROL データストリームの管理]** および **[!UICONTROL データストリームの表示]** under **[!UICONTROL データ収集]**
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
>Adobe Experience Platform Web SDK の学習に時間を割いていただき、ありがとうございます。 ご質問がある場合、一般的なフィードバックを共有する場合、または今後のコンテンツに関する提案がある場合は、このドキュメントで共有します [Experience Leagueコミュニティディスカッション投稿](https://experienceleaguecommunities.adobe.com/t5/adobe-experience-platform-launch/tutorial-discussion-implement-adobe-experience-cloud-with-web/td-p/444996)
