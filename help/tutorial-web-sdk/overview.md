---
title: Web SDK を使用した Adobe Experience Cloud 実装のチュートリアル
description: Adobe Experience Platform Web SDK を使用して、Experience Cloud アプリケーションを実装する方法について説明します。
recommendations: catalog, noDisplay
exl-id: cf0ff74b-e81e-4f6d-ab7d-6c70e9b52d78
source-git-commit: cf0193e3aae4d6536c868f078f4773ee14e90408
workflow-type: tm+mt
source-wordcount: '417'
ht-degree: 25%

---

# Web SDK を使用した Adobe Experience Cloud 実装のチュートリアル

Adobe Experience Platform Web SDK を使用して、Experience Cloud アプリケーションを実装する方法について説明します。

Experience PlatformWeb SDK は、Adobe Experience Cloudのお客様がAdobe Experience Platform Edge Network を通じてAdobeアプリケーションとサードパーティのサービスの両方を操作できる、クライアントサイド JavaScript ライブラリです。 詳しくは、 [Adobe Experience Platform Web SDK の概要](https://experienceleague.adobe.com/docs/experience-platform/edge/home.html?lang=ja) を参照してください。

このチュートリアルでは、Luma と呼ばれるサンプルの小売 Web サイトで Platform Web SDK を実装する手順を説明します。 [](https://luma.enablementadobe.com/content/luma/us/en.html)Luma サイトには、現実的な実装を構築できる豊富なデータレイヤーと機能があります。このチュートリアルを完了すると、すべてのマーケティングソリューションを、お客様独自の Web サイト上で Platform Web SDK を通じて実装する準備が整います。

[![Luma Web サイト](assets/old-overview-luma.png)](https://luma.enablementadobe.com/content/luma/us/en.html)


## 学習内容

このチュートリアルでは、以下の内容について学習します。

* データストリームの設定

* XDM スキーマの作成

* 次のAdobe Experience Cloudアプリケーションを追加します。
   * **[Adobe Experience Platform](setup-experience-platform.md)** ( および、Adobe Real-time Customer Data Platform、Adobe Journey Optimizer、Adobe Customer Journey Analyticsなど、Platform 上で構築されたアプリケーション )
   * **[Adobe Analytics](setup-analytics.md)**
   * **[Adobe Audience Manager](setup-audience-manager.md)**
   * **[Adobe Target](setup-target.md)**

* タグルールと XDM オブジェクトのデータ要素を作成して、データをAdobeアプリケーションに送信する

* Adobe Experience Platform Debugger を使用した実装の検証

* ユーザーの同意を取得する

* イベント転送を使用してサードパーティにデータを転送する

>[!NOTE]
>
>同様のマルチソリューションチュートリアルを [モバイル SDK](../tutorial-mobile-sdk/overview.md).

## 前提条件

すべてのExperience Cloudユーザーが Platform Web SDK を使用できます。 Real-time Customer Data PlatformやJourney Optimizerなどのプラットフォームベースのアプリケーションのライセンスを取得して Web SDK を使用する必要はありません。

このレッスンでは、Adobeアカウントと [必要な権限](configure-permissions.md) レッスンを完了するために。 アクセスできない場合は、Experience Cloud管理者に問い合わせて、アクセス権を要求する必要があります。

また、HTML や JavaScript などのフロントエンド開発言語に精通していることを前提としています。これらの言語の専門家である必要はありませんが、コードを読んで理解できる場合は、このチュートリアルをさらに活用できます。

それでは、始めましょう。

[次へ： ](configure-permissions.md)

>[!NOTE]
>
>Adobe Experience Platform Web SDK の学習に時間を割いていただき、ありがとうございます。 ご質問がある場合、一般的なフィードバックを共有したい場合、または今後のコンテンツに関する提案がある場合は、こちらで共有してください [Experience Leagueコミュニティディスカッション投稿](https://experienceleaguecommunities.adobe.com/t5/adobe-experience-platform-launch/tutorial-discussion-implement-adobe-experience-cloud-with-web/td-p/444996)
