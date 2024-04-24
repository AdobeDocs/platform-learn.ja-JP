---
title: チュートリアルの権限の設定
description: Experience Platform Web SDK へのアクセスをリクエストする方法と、Web SDK を使用したAdobe Experience Cloudの実装チュートリアルを完了するために必要な権限を設定する方法について説明します。
feature: Web SDK,Tags,Access Control
source-git-commit: d81e7df36807778967bc0350735aec008fb1a55e
workflow-type: tm+mt
source-wordcount: '367'
ht-degree: 4%

---

# チュートリアルの権限の設定

Experience Platform Web SDK へのアクセスをリクエストする方法と、このチュートリアルを完了するために必要な権限を設定する方法について説明します。 データ収集インターフェイスのタグを使用して Platform Web SDK を実装するには、で適切なユーザー権限を設定する必要があります。 [Admin Console](https://adminconsole.adobe.com).

## データ収集

* ～する権限がある **[!UICONTROL 開発]**, **[!UICONTROL 編集]**, **[!UICONTROL 承認]**, **[!UICONTROL 公開]**, **[!UICONTROL 拡張機能の管理]**, **[!UICONTROL 環境の管理]**、および **[!UICONTROL プロパティの管理]**. タグの権限について詳しくは、を参照してください。 [ドキュメント](https://experienceleague.adobe.com/docs/experience-platform/tags/admin/user-permissions.html?lang=ja).
* オプションのイベント転送レッスンを完了する場合は、エッジ転送と権限項目を含む製品ライセンスを保有しています **[!UICONTROL プラットフォーム]** > **[!UICONTROL Edge]**

## Experience Platform

Real-Time CDPのようなプラットフォームベースのアプリケーションのお客様でなくても、すべてのExperience Cloudのお客様がこれらの機能を利用できます。

* アクセス （への） **デフォルトの実稼動**, **「Prod」** サンドボックス。
* アクセス先 **[!UICONTROL スキーマの管理]** および **[!UICONTROL スキーマの表示]** 未満 **[!UICONTROL データモデリング]**.
* アクセス先 **[!UICONTROL ID 名前空間の管理]** および **[!UICONTROL ID 名前空間の表示]** 未満 **[!UICONTROL Identity Management]**.
* アクセス先 **[!UICONTROL データストリームの管理]** および **[!UICONTROL データストリームを表示]** 未満 **[!UICONTROL データ収集]**.
* Platform ベースのアプリケーションの顧客が、 [Experience Platformの設定](setup-experience-platform.md) レッスンでは、次の内容も習得する必要があります。
   * アクセス権限 **開発** サンドボックス。
   * の下のすべての権限項目 **[!UICONTROL データ管理]**、および **[!UICONTROL プロファイル管理]**:


Platform のアクセス制御について詳しくは、を参照してください。 [ドキュメント](https://experienceleague.adobe.com/docs/experience-platform/access-control/home.html?lang=ja).

## Adobe Analytics

オプションのAdobe Analyticsのレッスンには、以下が必要です [レポートスイート設定、処理ルールおよびAnalysis Workspaceへの管理者アクセス](https://experienceleague.adobe.com/docs/analytics/admin/admin-console/home.html?lang=ja)

## Adobe Target

オプションのAdobe Targetのレッスンには、以下が必要です [編集者または承認者](https://experienceleague.adobe.com/docs/target/using/administer/manage-users/enterprise/properties-overview.html#section_8C425E43E5DD4111BBFC734A2B7ABC80) アクセス。

## Adobe Audience Manager

* オプションのAudience Managerレッスンでは、特性、セグメント、宛先を作成、読み取りおよび書き込むためのアクセス権が必要です。 詳しくは、のチュートリアルを参照してください。 [Audience Managerの役割ベースのアクセス制御](https://experienceleague.adobe.com/docs/audience-manager-learn/tutorials/setup-and-admin/user-management/setting-permissions-with-role-based-access-control.html?lang=en).

これで、初期設定手順を開始する準備が整いました。

[次へ： ](configure-schemas.md)

>[!NOTE]
>
>Adobe Experience Platform Web SDK の学習に時間を費やしていただき、ありがとうございます。 ご質問がある場合、一般的なフィードバックを共有したい場合、または将来のコンテンツに関するご提案がある場合は、このページでお知らせください [Experience League コミュニティ ディスカッションの投稿](https://experienceleaguecommunities.adobe.com/t5/adobe-experience-platform-launch/tutorial-discussion-implement-adobe-experience-cloud-with-web/td-p/444996)
