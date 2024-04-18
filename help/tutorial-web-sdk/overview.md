---
title: Web SDK を使用した Adobe Experience Cloud 実装のチュートリアル
description: Adobe Experience Platform Web SDK を使用してExperience Cloudアプリケーションを実装する方法について説明します。
recommendations: catalog, noDisplay
exl-id: cf0ff74b-e81e-4f6d-ab7d-6c70e9b52d78
source-git-commit: 15bc08bdbdcb19f5b086267a6d94615cbfe1bac7
workflow-type: tm+mt
source-wordcount: '434'
ht-degree: 11%

---

# Web SDK を使用した Adobe Experience Cloud 実装のチュートリアル

>[!CAUTION]
>
>このチュートリアルの大きな変更は、2024 年 4 月 23 日火曜日（PT）に公開される予定です。 その後、多くの演習が変更され、すべてのレッスンを完了するには、最初からチュートリアルを再開する必要が生じる場合があります。


Adobe Experience Platform Web SDK を使用してExperience Cloudアプリケーションを実装する方法について説明します。

Experience Platform Web SDK は、Adobe Experience Cloudのお客様がAdobe Experience Platform Edge Networkを通じてAdobeアプリケーションとサードパーティのサービスの両方を操作できるようにする、クライアントサイド JavaScript ライブラリです。 参照： [Adobe Experience Platform Web SDK の概要](https://experienceleague.adobe.com/docs/experience-platform/edge/home.html?lang=ja) を参照してください。

このチュートリアルでは、Luma と呼ばれるサンプルの小売 web サイトでの Platform Web SDK の実装について説明します。 この [Luma サイト](https://luma.enablementadobe.com/content/luma/us/en.html) には、現実的な実装を構築できる豊富なデータレイヤーと機能があります。 このチュートリアルを完了すると、Platform Web SDK を使用してすべてのマーケティングソリューションの実装を独自の web サイトで開始する準備が整います。

[![Luma web サイト](assets/old-overview-luma.png)](https://luma.enablementadobe.com/content/luma/us/en.html)


## 学習目標

このチュートリアルを完了すると、次の操作を実行できるようになります。

* データストリームの設定

* XDM スキーマの作成

* 次のAdobe Experience Cloud アプリケーションを追加します。
   * **[Adobe Experience Platform](setup-experience-platform.md)** （およびAdobe Real-time Customer Data Platform、Adobe Journey Optimizer、Adobe Customer Journey Analyticsなどの Platform 上に構築されたアプリケーション）
   * **[Adobe Analytics](setup-analytics.md)**
   * **[Adobe Audience Manager](setup-audience-manager.md)**
   * **[Adobe Target](setup-target.md)**

* タグルールと XDM オブジェクトデータ要素を作成して、Adobeアプリケーションにデータを送信する

* Adobe Experience Platform Debuggerを使用した実装の検証

* ユーザーの同意の取得

* イベント転送を使用したサードパーティへのデータ転送

>[!NOTE]
>
>同様のマルチソリューションチュートリアルを次のユーザー向けに使用できます [Mobile SDK](../tutorial-mobile-sdk/overview.md).

## 前提条件

すべてのExperience Cloudユーザーは、Platform Web SDK を使用できます。 Web SDK を使用する場合、Real-time Customer Data PlatformやJourney Optimizerなどのプラットフォームベースのアプリケーションのライセンスを取得する必要はありません。

これらのレッスンでは、Adobeアカウントと [必要な権限](configure-permissions.md) レッスンを完了します。 そうでない場合、Experience Cloud管理者に問い合わせてアクセスをリクエストする必要があります。

また、HTML や JavaScript などのフロントエンド開発言語に精通していることを前提としています。これらの言語のエキスパートである必要はありませんが、コードを読んで理解できれば、このチュートリアルをさらに活用できます。

それでは、始めましょう。

[次へ： ](configure-permissions.md)

>[!NOTE]
>
>Adobe Experience Platform Web SDK の学習に時間を費やしていただき、ありがとうございます。 ご質問がある場合、一般的なフィードバックを共有する場合、将来のコンテンツに関する提案がある場合は、このページで共有します [Experience League コミュニティ ディスカッションの投稿](https://experienceleaguecommunities.adobe.com/t5/adobe-experience-platform-launch/tutorial-discussion-implement-adobe-experience-cloud-with-web/td-p/444996)
