---
title: 埋め込みコードの追加
description: タグプロパティの埋め込みコードを取得して、Web サイトに実装する方法を説明します。 このレッスンは、web サイトでのExperience Cloudの実装チュートリアルの一部です。
exl-id: a2959553-2d6a-4c94-a7df-f62b720fd230
source-git-commit: 277f5f2c07bb5818e8c5cc129bef1ec93411c90d
workflow-type: tm+mt
source-wordcount: '1037'
ht-degree: 45%

---

# 埋め込みコードの追加

このレッスンでは、タグプロパティの開発環境の非同期埋め込みコードを実装します。 この過程で、タグの 2 つの主な概念である環境と埋め込みコードについて学びます。

>[!NOTE]
>
>Adobe Experience Platform Launch は、データ収集テクノロジーのスイートとして Adobe Experience Platform に統合されています。 このコンテンツを使用する際に注意する必要があるインターフェイスで、いくつかの用語がロールアウトされました。
>
> * Platform launch（クライアントサイド）が **[[!DNL tags]](https://experienceleague.adobe.com/docs/experience-platform/tags/home.html?lang=ja)** になりました
> * Platform launchサーバーサイドが **[[!DNL event forwarding]](https://experienceleague.adobe.com/docs/experience-platform/tags/event-forwarding/overview.html?lang=ja)** になりました
> * Edgeの設定が **[[!DNL datastreams]](https://experienceleague.adobe.com/docs/experience-platform/edge/fundamentals/datastreams.html?lang=ja)** になりました

## 学習内容

このレッスンを最後まで学習すると、以下の内容を習得できます。

* タグプロパティの埋め込みコードの取得
* 開発環境、ステージング環境および実稼動環境の違いについて理解する。
* HTML ドキュメントへのタグ埋め込みコードの追加
* HTML ドキュメントの `<head>` の他のコードと関連するタグ埋め込みコードの最適な場所の説明

## 埋め込みコードをコピーする。

埋め込みコードは、タグで構築したロジックを読み込んで実行するために web ページに配置する `<script>` タグです。 ライブラリを非同期で読み込む場合、ブラウザーは引き続きページの読み込みを行い、タグライブラリを取得して並行して実行します。 この場合、`<head>` に配置する埋め込みコードは 1 つだけです。（タグが同期的にデプロイされる場合、2 つの埋め込みコードがあり、1 つは `<head>` に配置し、もう 1 つは `</body>` の前に配置します）。

プロパティの概要画面で、左側のナビゲーションの **[!UICONTROL 環境]** をクリックして、環境ページに移動します。 開発環境、ステージング環境、および実稼動環境は、事前に作成されています。

![上部のナビゲーションで「環境」をクリックする](images/launch-environments.png)

開発環境、ステージング環境、および実稼動環境は、コード開発やリリースプロセスの一般的な環境に対応しています。コードは、開発環境の開発者が最初に記述します。作業が完了したら、QA および他のチームがレビューできるよう、ステージング環境に送信します。QA チームやその他のチームが満足したら、コードは実稼動環境に公開されます。この環境は、訪問者が Web サイトにアクセスしたときに表示される、公開環境です。

タグを使用すると、追加の開発環境を使用できます。これは、複数の開発者が異なるプロジェクトに同時に取り組んでいる大規模組織で役立ちます。

チュートリアルの完了に必要なのは、これらの環境のみです。環境を使用すると、タグライブラリの異なる作業バージョンを異なる URL でホストできるので、新しい機能を安全に追加し、適切なユーザー（開発者、QA エンジニア、一般公開など）が利用できるようになります 。

次に、埋め込みコードをコピーします。

1. **[!UICONTROL 開発]** 行で、「インストール」アイコン ![&#x200B; 「インストール」アイコン &#x200B;](images/launch-installIcon.png) をクリックしてモーダルを開きます。

1. タグは、デフォルトで非同期埋め込みコードに設定されます

1. コピーアイコン![コピーアイコン](images/launch-copyIcon.png)をクリックして、埋め込みコードをクリップボードにコピーします。

1. 「**[!UICONTROL 閉じる]**」をクリックしてモーダルを閉じます。

   ![インストールアイコン](images/launch-copyInstallCode.png)

## サンプル HTML ページの `<head>` に埋め込みコードを実装します。

埋め込みコードは、プロパティを共有するすべての HTML ページの `<head>` 要素に実装する必要があります。サイト全体で `<head>` ータをグローバルに制御する 1 つまたは複数のテンプレートファイルがある場合があるので、タグを追加するプロセスは簡単です。

まだ行っていない場合は、サンプルの HTML ページコードをコピーして、コードエディターに貼り付けます。 エディターが必要な場合、[Brackets](https://brackets.io/)は、オープンソースの無料エディターです。

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

34 行目またはその周辺にある既存の埋め込みコードを、クリップボードのコードと置き換えてページを保存します。次に、Web ブラウザーでページを開きます。`file://` プロトコルを使用してページを読み込む場合は、コードエディターで、埋め込みコード URL の先頭に「https:」を付ける必要があります）。サンプルページの 33～36 行は次のようになります。

```html
    <!--Tags Header Embed Code: REPLACE LINE 39 WITH THE EMBED CODE FROM YOUR OWN DEVELOPMENT ENVIRONMENT-->
    <script src="https://assets.adobedtm.com/launch-ENa21cfed3f06f4ddf9690de8077b39e81-development.min.js" async></script>
    <!--/Tags Header Embed Code-->
```

Web ブラウザーの開発者ツールを開き、「ネットワーク」タブに移動します。この時点で、タグ環境 URL に対して 404 エラーが表示されます。
![404 エラー &#x200B;](images/samplepage-404.png)

このタグ環境ではまだライブラリを作成していないので、404 エラーが発生することが予想されます。 これについては、次のレッスンでおこないます。404 エラーではなく「Failed」メッセージが表示された場合は、埋め込みコードに `https://` プロトコルを追加し忘れている可能性があります。`file://` プロトコルを使用してサンプルページを読み込む場合にのみ、`https://` プロトコルを指定する必要があります。変更を加え、404 エラーが表示されるまでページをリロードします。

## タグ実装のベストプラクティス

サンプルページで示されている、タグ実装のベストプラクティスのいくつかを確認してみましょう。

* **データレイヤー**：

   * Analytics *Target* その他のマーケティングソリューションに変数を入力するために必要なすべての属性を含むデータレイヤーを、サイトに作成することを強くお勧めします。 このサンプルページには非常にシンプルなデータレイヤーのみが含まれていますが、実際のデータレイヤーにはページ、訪問者、買い物かごの詳細などの詳細情報が多数含まれる可能性があります。データレイヤーについて詳しくは、[Customer Experience Digital Data Layer 1.0](https://www.w3.org/2013/12/ceddl-201312.pdf) を参照してください。

   * Experience Cloudソリューションで実行できることを最大限に活用するために、タグ埋め込みコードの前にデータレイヤーを定義します。

* **JavaScript helper ライブラリ**: JQuery のようなライブラリがページの `<head>` に既に実装されている場合は、タグおよび Target で構文を活用するために、タグの前に読み込みます

* **HTML5 doctype**：HTML5 doctype は Target の実装に必要です。

* **preconnect および dns-prefetch**：ページの読み込み時間を改善するには preconnect および dns-prefetch を使用します。参照：[/](https://w3c.github.io/resource-hints/)https://w3c.github.io/resource-hints/

* **非同期 Target 実装の事前非表示スニペット**：これについて詳しくは、Target のレッスンを参照してください。ただし、Target が非同期のタグ埋め込みコードによってデプロイされている場合は、コンテンツのちらつきを管理するために、ページ上で事前非表示スニペットをタグ埋め込みコードの前にハードコードする必要があります

これらのベストプラクティスについて、推奨順にまとめました。アカウント固有の詳細を示すプレースホルダーがいくつかあります。

```html
<!doctype html>
<html lang="en">
<head>
    <title>Basic Demo</title>
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
    <!--prehiding snippet for Adobe Target with asynchronous tags deployment-->
    <script>
        (function(g,b,d,f){(function(a,c,d){if(a){var e=b.createElement("style");e.id=c;e.innerHTML=d;a.appendChild(e)}})(b.getElementsByTagName("head")[0],"at-body-style",d);setTimeout(function(){var a=b.getElementsByTagName("head")[0];if(a){var c=b.getElementById("at-body-style");c&&a.removeChild(c)}},f)})(window,document,"body {opacity: 0 !important}",3E3);
    </script>
    <!--/prehiding snippet for Adobe Target with asynchronous tags deployment-->
    <!--Tags Header Embed Code: REPLACE LINE 39 WITH THE INSTALL CODE FROM YOUR OWN DEVELOPMENT ENVIRONMENT-->
    <script src="//assets.adobedtm.com/launch-EN93497c30fdf0424eb678d5f4ffac66dc.min.js" async></script>
    <!--/Tags Header Embed Code-->
</head>
<body>
    <h1>Tags Basic Demo</h1>
    <p>This is a very simple page to demonstrate basic concepts of tags</p>
</body>
</html>
```

これで、タグ埋め込みコードをサイトに追加する方法を理解できました。

[次に「データ要素、ルールおよびライブラリの追加」 >](add-data-elements-rules.md)
