---
title: 基盤 – Adobe Experience Platform Data Collection と Web SDK 拡張機能の設定 – Adobe Experience Platform Data Collection の概要
description: 基盤 – Adobe Experience Platform Data Collection と Web SDK 拡張機能の設定 – Adobe Experience Platform Data Collection の概要
kt: 5342
doc-type: tutorial
source-git-commit: 6962a0d37d375e751a05ae99b4f433b0283835d0
workflow-type: tm+mt
source-wordcount: '1334'
ht-degree: 9%

---

# 1.1.3 - Adobe Experience Platform Data Collection の概要

## コンテキスト

次に、Adobe Experience Platform Data Collection の構成要素を深く掘り下げて、デモ Web サイトにインストールされている内容を理解します。 Adobe Experience Platform Web SDK 拡張機能を詳しく見ていき、データ要素とルールを設定し、ライブラリの公開方法を説明します。

## 1.1.3.1 - Adobe Experience Platform Web SDK 拡張機能

拡張機能は、Adobe Experience Platform データ収集インターフェイスとライブラリ機能を拡張する、パッケージ化されたコードセットです。 Adobe Experience Platform Data Collection はプラットフォームであり、拡張機能はプラットフォーム上で実行されるアプリのようなものです。 このチュートリアルで使用する拡張機能はすべてAdobeが作成および管理しますが、サードパーティは独自の拡張機能を作成して、Adobe Experience Platform データ収集ユーザーが管理する必要があるカスタムコードの量を制限できます。

[Adobe Experience Platform Data Collection に移動し ](https://experience.adobe.com/launch/) 「**Tags**」を選択します。

これは、以前に表示したAdobe Experience Platform データ収集のプロパティページです。

![ プロパティページ ](./images/launch1.png)

モジュール 0 で、デモシステムは 2 つのクライアントプロパティを作成しました。1 つは Web サイト用、もう 1 つはモバイルアプリ用です。 **[!UICONTROL 検索]** ボックスで `--aepUserLdap--` を検索して見つけます。

![ 検索ボックス ](./images/property6.png)

**Web** プロパティを開きます。

次に、プロパティの概要ページが表示されます。 左側のパネルで **[!UICONTROL 拡張機能]** をクリックします。 Adobe Experience Platform Web SDK 拡張機能の下にある「**[!UICONTROL 設定]**」ボタンをクリックします。

![ プロパティの概要ページ ](./images/property7.png)

Adobe Experience Platform Web SDK へようこそ。 ここでは、[ 演習 0.2](./../../../modules/gettingstarted/gettingstarted/ex2.md) で作成したデータストリームやその他の高度な設定を使用して拡張機能を設定できます。 この演習では、2 つの設定のみを設定します。

デフォルトのEdge ドメインは、常に **edge.adobedc.net** です。 Adobe Experience CloudまたはAdobe Experience Platform環境に CNAME 設定を実装した場合は、**[!UICONTROL Edge ドメイン]** を更新する必要があります。 Adobe Experience Platform インスタンスはこのEdge ドメインを使用しています：`--webSdkEdgeDomain--`。

インスタンスのEdge ドメインがデフォルトのドメインと異なる場合は、Edge ドメインを更新してください。 Edge ドメインを使用すると、ファーストパーティトラッキングサーバーを設定し、その後、バックエンドで CNAME 設定を使用してデータがAdobeに収集されるようにします。

![ 拡張機能ホーム ](./images/property9edgedomain.png)

ここで、「**[!UICONTROL データストリーム]**」見出しの下の「**[!UICONTROL リストから選択]**」ラジオボタンが選択されていることを確認し、「**[!UICONTROL データストリーム]**」ボックスのリストから、`--aepUserLdap-- - Demo System Datastream` という名前のデータストリームを選択します。

![ 拡張機能ホーム ](./images/property9edge.png)

「**[!UICONTROL 保存]**」をクリックして、拡張機能ビューに戻ります。

![Adobe Experience Platform Web SDK ホームページ ](./images/save.png)

## 1.1.3.2 データ要素

データ要素は、データディクショナリ（またはデータマップ）の構築ブロックです。データ要素を使用して、マーケティングおよび広告テクノロジー全体でデータを収集、整理、配信します。

単一のデータ要素は、クエリ文字列、URL、cookie 値、JavaScript 変数などに値をマッピングできる変数です。この値は、Adobe Experience Platform データ収集全体で変数名によって参照できます。 このデータ要素コレクションは、ルール（イベント、条件、アクション）の作成に使用する、定義済みデータの辞書になります。このデータディクショナリは、プロパティに追加した拡張機能で使用するために、すべてのAdobe Experience Platform Data Collection で共有されます。

次に、既存のデータ要素を、Web SDK に対応した形式で編集します。

左側のパネルで「データ要素」をクリックして、データ要素ページに移動します。

![ データ要素ホームページ ](./images/dataelement1.png)

>[!NOTE]
>
>この演習ではデータ要素のみを編集していますが、このページには「**[!UICONTROL データ要素の追加]**」ボタンが表示されます。このボタンを使用して、データディクショナリに新しい変数を追加します。 これは、Adobe Experience Platform Data Collection 全体で使用できます。 他の既存のデータ要素を見てみてください。主にローカルストレージをデータソースとして使用しています。

検索バーに「**XDM – 製品表示**」と入力し、返されるデータ要素をクリックします。

![ruleArticlePages の検索 ](./images/dataelement2.png)

この画面には、編集する XDM オブジェクトが表示されます。 エクスペリエンスデータモデル（XDM）は、このテクニカルチュートリアルでさらに詳しく説明する概念ですが、現時点では、Adobe Experience Platform Web SDK で必要な形式として理解するだけで十分です。 デモ Web サイトの記事ページで収集されたデータに、もう少し情報を追加します。

ツリーの下部にある **Web** の横のプラスボタンをクリックします。

**webPageDetails** の横にあるプラスボタンをクリックします。

**siteSection** をクリックします。 **siteSection** がまだデータ要素にリンクされていないことがわかります。 それを変えましょう。

![ サイトセクションに移動 ](./images/dataelement3.png)

上にスクロールし、テキスト `%Product Category%` を入力します。 「**[!UICONTROL 保存]**」をクリックします。

![保存](./images/dataelement4.png)

この時点で、Adobe Experience Platform Web SDK Extension がインストールされ、XDM 構造に対してデータを収集するためのデータ要素を更新しました。 次に、正しいタイミングでデータを送信するルールを確認しましょう。

## 1.1.3.3 ルール

Adobe Experience Platformのデータ収集は、ルールベースのシステムです。 ユーザーの操作に関する各種データを参照します。ルールで設定された条件が満たされると、ルールは、特定した拡張機能、スクリプトまたはクライアント側コードをトリガーします。

異なる製品を 1 つのソリューションに統合するマーケティングおよび広告テクノロジーのデータと機能を統合するためのルールを構築します。

記事ページにデータを送信するルールを分類しましょう。

左側のパネルで **[!UICONTROL ルール]** をクリックします。

`Product View` を **[!UICONTROL 検索]** します。

返されるルールをクリックします。

![ メディア – 記事ページルールの検索 ](./images/rule1.png)

このルールを構成する個々の要素を見てみましょう。 すべてのルールに対して指定した **[!UICONTROL イベント]** が発生すると、**[!UICONTROL 条件]** が評価され、必要に応じて指定した **[!UICONTROL アクション]** が実行されます。

![ メディア – 記事ページルール ](./images/rule2.png)

イベント **カスタムイベント – 製品表示** をクリックします。 これは、が読み込まれるビューです。

**イベントタイプ** ドロップダウンをクリックします。

条件が true の場合に、Adobe Experience Platform データ収集に対してアクションを実行するようシグナルを送信するために使用できる、標準インタラクションの一部をリストします。

![イベント](./images/rule3.png)

ルールに戻るには、「**[!UICONTROL キャンセル]**」をクリックします。

アクション **「製品表示」イベントを AEP に送信** をクリックします。

ここでは、Adobe Experience Platform Web SDK によってAdobe Edgeに送信されているデータを確認できます。 具体的には、Web SDK の **alloy** **[!UICONTROL Instance]** を使用しています。 別の **[!UICONTROL インスタンス]** を設定すると、特に、様々なデータストリームを使用できます。 イベント **[!UICONTROL タイプ]** を **commerce.productViews** として指定しており、送信している XDM データは、以前に変更した **XDM – 製品表示** データ要素です。

![ イベント送信アクション ](./images/rule5.png)

これでルールを確認したので、Adobe Experience Platform Data Collection ですべての変更を公開できます。

## 1.1.3.4 ライブラリ内のPublish

最後に、更新したルールとデータ要素を検証するには、編集した項目を含むライブラリをプロパティに公開する必要があります。 Adobe Experience Platform Data Collection の **[!UICONTROL 公開]** セクションでは、いくつかの簡単な手順を実行する必要があります。

左側のナビゲーションで **[!UICONTROL 公開フロー]** をクリックします

**メイン** という既存のライブラリをクリックします。

![ ライブラリアクセス ](./images/publish1.png)

「**変更されたすべてのリソースを追加**」ボタンをクリックします。

![ ライブラリアクセス ](./images/publish1a.png)

下にスクロールすると、ほとんどのリソースが **リビジョン 1 （最新）** のままになりますが、変更した 2 つの **Data Element: ruleArticlePages** と **Extension: Adobe Experience Platform Web SDK** は **最新** とマークされます。

**開発用に保存してビルド** ボタンをクリックします。

![ コンテンツライブラリ ](./images/publish2.png)

ライブラリのビルドには数分かかる場合があり、完了すると、ライブラリ名の左側に緑のドットが表示されます。

公開フロー画面で確認できるように、Adobe Experience Platform データ収集の公開プロセスには多くの詳細があり、これはこのチュートリアルの範囲外です。 開発環境では、単一のライブラリを使用します。

次の手順：[1.1.4 クライアントサイドの Web データ収集 ](./ex4.md)

[モジュール 1.1 に戻る](./data-ingestion-launch-web-sdk.md)

[すべてのモジュールに戻る](./../../../overview.md)
