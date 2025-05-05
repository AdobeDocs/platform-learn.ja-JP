---
title: Tags を使用した web サイトへのExperience Cloudの実装
description: Tags を使用して web サイトにExperience Cloudを実装することは、web サイトにAdobe Experience Cloud ソリューションを実装する方法を学びたいと考えているフロントエンド開発者やテクニカルマーケターにとって最適な出発点になります。
recommendations: catalog, noDisplay
exl-id: 1b95f0b2-3062-49d1-9b0b-e6824a54008f
source-git-commit: 2483409b52562e13a4f557fe5bdec75b5afb4716
workflow-type: tm+mt
source-wordcount: '851'
ht-degree: 37%

---

# 概要

_Tags を使用して web サイトにExperience Cloudを実装する_ は、web サイトにAdobe Experience Cloud ソリューションを実装する方法を学びたいと考えているフロントエンド開発者やテクニカルマーケターにとって最適な出発点になります。

各レッスンには、Experience Cloud の実装およびその価値を理解するのに役立つ、ハウツー演習や基本的な情報が含まれています。デモを完了するためのデモサイトが提供されているので、基本的な技術を安全な環境で学習することができます。このチュートリアルを完了すると、独自の web サイトのタグを使用して、すべてのマーケティングソリューションの実装を開始する準備が整います。

>[!INFO]
>
>このチュートリアルでは、アプリケーション固有の拡張機能およびライブラリ（Adobe AnalyticsのAppMeasurement.js、Adobe Targetの at.js）を使用します。 Adobe Experience Platform Web SDK の実装を行う場合は、[Web SDK を使用したAdobe Experience Cloudの実装 ](/help/tutorial-web-sdk/overview.md) チュートリアルを参照してください。


このチュートリアルでは、以下の内容について学習します。

* タグプロパティの作成

* Web サイトへのタグプロパティのインストール

* 次の Adobe Experience Cloud ソリューションを追加する
   * **[Adobe Experience Platform ID サービス](id-service.md)**
   * **[Adobe Target](target.md)**
   * **[Adobe Analytics](analytics.md)**
   * **[Adobe Audience Manager](audience-manager.md)**

* ルールとデータ要素を作成し、データをアドビソリューションに送信する

* Adobe Experience Cloud デバッガーを使用して実装を検証する

* 開発環境、ステージング環境、実稼動環境を通じたPublishの変更

>[!NOTE]
>
>Adobe Experience Platform Launch は、データ収集テクノロジーのスイートとして Adobe Experience Platform に統合されています。 このコンテンツを使用する際に注意する必要があるインターフェイスで、いくつかの用語がロールアウトされました。
>
> * Platform launch（クライアントサイド）が **[[!DNL tags]](https://experienceleague.adobe.com/docs/experience-platform/tags/home.html?lang=ja)** になりました
> * Platform launchサーバーサイドが **[[!DNL event forwarding]](https://experienceleague.adobe.com/docs/experience-platform/tags/event-forwarding/overview.html?lang=ja)** になりました
> * Edgeの設定が **[[!DNL datastreams]](https://experienceleague.adobe.com/docs/experience-platform/edge/fundamentals/datastreams.html?lang=ja)** になりました

>[!NOTE]
>
>[Web SDK](../tutorial-mobile-sdk/overview.md) と [Mobile SDK](../tutorial-web-sdk/overview.md) に関する同様のマルチソリューションチュートリアルも利用できます。

## 前提条件

このレッスンでは、練習を完了するために必要な Adobe ID と権限があることを前提としています。Adobe ID と権限がない場合は、Experience Cloud 管理者に連絡して、アクセスをリクエストする必要がある場合があります。

* タグの場合、環境の開発、承認、Publish、拡張機能の管理および管理を行う権限が必要です。 タグユーザー権限について詳しくは、[ ドキュメント ](https://experienceleague.adobe.com/docs/experience-platform/tags/admin/user-permissions.html?lang=ja) を参照してください。
* Adobe Analytics の場合は、このチュートリアルを完了させるために使用するトラッキングサーバーとレポートスイートについて把握しておく必要があります。
* Audience Managerするには、Audience Managerサブドメイン（「パートナー名」、「パートナー ID」、「パートナーサブドメイン」とも呼ばれます）を把握している必要があります

また、HTML や JavaScript などのフロントエンド開発言語に精通していることを前提としています。レッスンを完了するために、これらの言語の専門家である必要はありませんが、コードを快適に読んで理解できれば、これらの言語からより多くを得ることができます。

## タグについて

Adobe Experience Platformのタグ機能は、Adobeが提供する次世代型の web サイトタグおよび Mobile SDK の管理機能です。 タグを使用すると、関連する顧客体験を強化するために必要なすべての分析、マーケティング、広告などのソリューションを、簡単にデプロイして管理できます。 タグについては、追加料金はかかりません。 Adobe Experience Cloud のお客様は、Launch を利用できます。

Web サイト用タグを使用すると、デスクトップサイトやモバイルサイトで使用する分析、マーケティング、広告ソリューションに関連するすべてのJavaScriptを一元的に管理できます。 例えば、Adobe Analyticsをデプロイすると、タグはAppMeasurement JavaScript ライブラリを管理し、変数を設定し、リクエストを実行します。

カスタムコードを含む、コンテナのコンテンツが縮小されます。すべてがモジュラー式です。項目が不要な場合は、ライブラリに含まれません。その結果、高速でコンパクトな実装になります。

また、タグは、サードパーティベンダーが拡張機能を作成して、タグを通じてソリューションを簡単にデプロイできるようにするプラットフォームでもあります。 拡張機能は、タグインターフェイスとクライアント機能を拡張するコードのパッケージ（JavaScript、HTML、CSS）です。 タグはオペレーティングシステム、拡張機能はタスクの遂行に使用されるアプリと考えることができます。

## レッスンについて

このレッスンでは、Adobe Experience Cloud を練習用の小売 Web サイト「Luma」に実装します。[Luma サイト](https://luma.enablementadobe.com/content/luma/us/en.html)には、現実的な実装を構築できる豊富なデータレイヤーと機能があります。独自のExperience CloudExperience Cloud Debuggerで独自のタグプロパティを作成し、組織を使用してホストされている Luma サイトにマッピングします。

[![Luma web サイト ](images/overview-luma.png)](https://luma.enablementadobe.com/content/luma/us/en.html)

## ツールの取得

1. 拡張機能にはブラウザー固有のものがあるため、[Chrome Web ブラウザー](https://www.google.com/chrome/)を使用してチュートリアルを完了することをお勧めします。
1. Chrome ブラウザーに [&#128279;](https://chromewebstore.google.com/detail/adobe-experience-platform/bfnnokhpnncpkdmbokanobigaccjkpob)0&rbrace; 拡張機能 &rbrace; をAdobe Experience Platform Debuggerします
1. サンプルの HTML ページコードをコピーします

   +++サンプルの HTML ページコード

   ```html
   <!doctype html>
   <html lang="en">
   <head>
       <title>Tags: Sample HTML Page</title>
       <!--Preconnect and DNS-Prefetch to improve page load time. REPLACE "techmarketingdemos" WITH YOUR OWN AAM PARTNER ID, TARGET CLIENT CODE, AND ANALYTICS TRACKING SERVER-->
       <link rel="preconnect" href="//dpm.demdex.net">
       <link rel="preconnect" href="//fast.techmarketingdemos.demdex.net">
       <link rel="preconnect" href="//techmarketingdemos.demdex.net">
       <link rel="preconnect" href="//cm.everesttech.net">
       <link rel="preconnect" href="//techmarketingdemos.tt.omtrdc.net">
       <link rel="preconnect" href="//techmarketingdemos.sc.omtrdc.net">
       <link rel="dns-prefetch" href="//dpm.demdex.net">
       <link rel="dns-prefetch" href="//fast.techmarketingdemos.demdex.net">
       <link rel="dns-prefetch" href="//techmarketingdemos.demdex.net">
       <link rel="dns-prefetch" href="//cm.everesttech.net">
       <link rel="dns-prefetch" href="//techmarketingdemos.tt.omtrdc.net">
       <link rel="dns-prefetch" href="//techmarketingdemos.sc.omtrdc.net">
       <!--/Preconnect and DNS-Prefetch-->
       <!--Data Layer to enable rich data collection and targeting-->
       <script>
       var digitalData = {
           "page": {
               "pageInfo" : {
                   "pageName": "Home"
                   }
               }
       };
       </script>
       <!--/Data Layer-->
       <!--jQuery or other helper libraries-->
       <script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
       <!--/jQuery-->
       <!--Tags Header Embed Code: REPLACE THE NEXT LINE WITH THE EMBED CODE FROM YOUR OWN DEVELOPMENT ENVIRONMENT-->
       <script src="//assets.adobedtm.com/launch-EN93497c30fdf0424eb678d5f4ffac66dc.min.js" async></script>
       <!--/Tags Header Embed Code-->
   </head>
   <body>
       <h1>Tags: Sample HTML Page</h1>
       <p>This is a very simple page to demonstrate basic implementation concepts of Tags</p>
       <p>See <a href="https://docs.adobe.com/content/help/ja-JP/experience-cloud/implementing-in-websites-with-launch/index.html">Implementing the Experience Cloud in Websites with Tags</a> for the complete tutorial</p>
   </body>
   </html>
   ```

   +++

1. サンプルの HTML ページを変更できるテキストエディターを取得します。（エディターがない場合は、[Brackets](https://brackets.io/) を試すことをお勧めします）。
1. [Luma サイト](https://luma.enablementadobe.com/content/luma/us/en.html)をブックマークします。

>[!NOTE]
>
>このチュートリアルを読んで別のブラウザーでデータ収集インターフェイスの手順を完了する間に、Chromeで Luma サイトを開くと、このチュートリアルを完了しやすくなります。

それでは、始めましょう。

[次へ「タグプロパティの作成」 >](create-a-property.md)
