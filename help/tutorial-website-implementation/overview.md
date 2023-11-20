---
title: タグ付き Web サイトへのExperience Cloudの実装
description: Web サイトにタグを使用してExperience Cloudを実装することは、Web サイトにAdobe Experience Cloudソリューションを実装する方法を学びたいフロントエンド開発者や技術マーケターにとって最適な出発点です。
recommendations: catalog, noDisplay
exl-id: 1b95f0b2-3062-49d1-9b0b-e6824a54008f
source-git-commit: 2483409b52562e13a4f557fe5bdec75b5afb4716
workflow-type: tm+mt
source-wordcount: '896'
ht-degree: 40%

---

# 概要

_タグ付き Web サイトへのExperience Cloudの実装_ は、自社の Web サイトにAdobe Experience Cloudソリューションを実装する方法を学びたいと考えている、フロントエンド開発者やテクニカルマーケターにとって最適な出発点です。

各レッスンには、Experience Cloud の実装およびその価値を理解するのに役立つ、ハウツー演習や基本的な情報が含まれています。デモを完了するためのデモサイトが提供されているので、基本的な技術を安全な環境で学習することができます。このチュートリアルを完了すると、お客様独自の Web サイト上でタグを使用して、すべてのマーケティングソリューションの実装を開始する準備が整います。

>[!INFO]
>
>このチュートリアルでは、アプリケーション固有の拡張機能とライブラリ (Adobe Analyticsの場合はAppMeasurement.js、Adobe Targetの場合は at.js) を使用します。 Adobe Experience Platform Web SDK を実装する場合は、 [Web SDK を使用したAdobe Experience Cloudの実装](/help/tutorial-web-sdk/overview.md) チュートリアル


このチュートリアルでは、以下の内容について学習します。

* タグプロパティの作成

* Web サイトにタグプロパティをインストールする

* 次の Adobe Experience Cloud ソリューションを追加する
   * **[Adobe Experience Platform ID サービス](id-service.md)**
   * **[Adobe Target](target.md)**
   * **[Adobe Analytics](analytics.md)**
   * **[Adobe Audience Manager](audience-manager.md)**

* ルールとデータ要素を作成し、データをアドビソリューションに送信する

* Adobe Experience Cloud デバッガーを使用して実装を検証する

* 開発環境、ステージング環境および実稼動環境を通じて変更を公開する

>[!NOTE]
>
>Adobe Experience Platform Launch は、データ収集テクノロジーのスイートとして Adobe Experience Platform に統合されています。 このコンテンツを使用する際に注意が必要な、いくつかの用語の変更がインターフェイスにロールアウトされました。
>
> * Platform launch（クライアント側）が **[[!DNL tags]](https://experienceleague.adobe.com/docs/experience-platform/tags/home.html?lang=ja)**
> * Platform launchサーバー側が **[[!DNL event forwarding]](https://experienceleague.adobe.com/docs/experience-platform/tags/event-forwarding/overview.html)**
> * エッジ設定が **[[!DNL datastreams]](https://experienceleague.adobe.com/docs/experience-platform/edge/fundamentals/datastreams.html?lang=ja)**

>[!NOTE]
>
>同様のマルチソリューションチュートリアルも [Web SDK](../tutorial-web-sdk/overview.md) および [モバイル SDK](../tutorial-mobile-sdk/overview.md).

## 前提条件

このレッスンでは、練習を完了するために必要な Adobe ID と権限があることを前提としています。Adobe ID と権限がない場合は、Experience Cloud 管理者に連絡して、アクセスをリクエストする必要がある場合があります。

* タグの場合は、開発、承認、公開、拡張機能の管理、および環境の管理の権限が必要です。 タグのユーザー権限について詳しくは、 [ドキュメント](https://experienceleague.adobe.com/docs/experience-platform/tags/admin/user-permissions.html?lang=ja).
* Adobe Analytics の場合は、このチュートリアルを完了させるために使用するトラッキングサーバーとレポートスイートについて把握しておく必要があります。
* Audience Managerの場合は、Audience Managerのサブドメイン（「パートナー名」、「パートナー ID」または「パートナーサブドメイン」とも呼ばれます）を把握しておく必要があります。

また、HTML や JavaScript などのフロントエンド開発言語に精通していることを前提としています。これらの言語の専門家でなくてもレッスンを完了することができますが、コードを快適に読んで理解できれば、レッスンを最大限活用することができます。

## タグについて

Adobe Experience Platformのタグ機能は、Adobeが提供する次世代型の Web サイトタグおよびモバイル SDK の管理機能です。 タグを使用すると、顧客体験の実現に必要なすべての分析、マーケティングおよび広告のソリューションをデプロイおよび管理するためのシンプルな手段を提供します。 タグに関しては、追加料金はかかりません。 Adobe Experience Cloud のお客様は、Launch を利用できます。

Web サイトのタグを使用すると、デスクトップおよびモバイルサイトで使用される分析、マーケティング、広告の各ソリューションに関するすべての JavaScript を一元的に管理できます。 例えば、Adobe Analyticsをデプロイする場合、タグはAppMeasurementJavaScript ライブラリを管理し、変数を設定し、要求を実行します。

カスタムコードを含む、コンテナのコンテンツが縮小されます。すべてがモジュラー式です。項目が不要な場合は、ライブラリに含まれません。その結果、高速でコンパクトな実装になります。

また、タグは、サードパーティベンダーが拡張機能を作成し、タグを使用してソリューションを簡単に導入できるようにするプラットフォームでもあります。 拡張機能は、タグインターフェイスとクライアント機能を拡張するコードのパッケージ (JavaScript、HTMLおよび CSS) です。 タグはオペレーティングシステム、拡張はタスクの遂行に使用されるアプリと考えることができます。

## レッスンについて

このレッスンでは、Adobe Experience Cloud を練習用の小売 Web サイト「Luma」に実装します。[Luma サイト](https://luma.enablementadobe.com/content/luma/us/en.html)には、現実的な実装を構築できる豊富なデータレイヤーと機能があります。お客様は、独自のExperience Cloud組織内で独自のタグプロパティを構築し、Experience Cloud Debuggerを使用してホストされている Luma サイトにマッピングします。

[![Luma Web サイト](images/overview-luma.png)](https://luma.enablementadobe.com/content/luma/us/en.html)

## ツールの取得

1. 拡張機能にはブラウザー固有のものがあるため、[Chrome Web ブラウザー](https://www.google.com/chrome/)を使用してチュートリアルを完了することをお勧めします。
1. 次を追加： [Adobe Experience Platform Debugger](https://chromewebstore.google.com/detail/adobe-experience-platform/bfnnokhpnncpkdmbokanobigaccjkpob) Chrome ブラウザーの拡張機能
1. サンプルの HTML ページコードをコピーする

   +++サンプル HTML ページコード

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
       <p>See <a href="https://docs.adobe.com/content/help/en/experience-cloud/implementing-in-websites-with-launch/index.html">Implementing the Experience Cloud in Websites with Tags</a> for the complete tutorial</p>
   </body>
   </html>
   ```

+++

1. サンプルの HTML ページを変更できるテキストエディターを取得します。（エディターがない場合は、[Brackets](https://brackets.io/) を試すことをお勧めします）。
1. [Luma サイト](https://luma.enablementadobe.com/content/luma/us/en.html)をブックマークします。

>[!NOTE]
>
>このチュートリアルを完了するには、Chrome で Luma サイトを開いたままにして、別のブラウザーでこのチュートリアルを読んでデータ収集インターフェイスの手順を完了する方が簡単な場合があります。

それでは、始めましょう。

[次：「タグプロパティの作成」>](create-a-property.md)
