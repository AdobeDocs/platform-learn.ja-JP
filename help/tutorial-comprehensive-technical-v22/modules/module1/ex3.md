---
title: Foundation - Adobe Experience Platformデータ収集と Web SDK 拡張機能の設定 — Adobe Experience Platformデータ収集の概要
description: Foundation - Adobe Experience Platformデータ収集と Web SDK 拡張機能の設定 — Adobe Experience Platformデータ収集の概要
kt: 5342
audience: Data Engineer, Data Architect
doc-type: tutorial
activity: develop
exl-id: 16d97ec0-9ad9-41c6-b1a1-a0e688aa95df
source-git-commit: cc7a77c4dd380ae1bc23dc75608e8e2224dfe78c
workflow-type: tm+mt
source-wordcount: '1324'
ht-degree: 9%

---

# 1.3 - Adobe Experience Platformデータ収集の概要

## コンテキスト

次に、Adobe Experience Platformデータ収集の構成要素を詳しく見て、デモ Web サイトにがインストールされている内容を理解します。 Adobe Experience Platform Web SDK 拡張機能、データ要素とルールの設定、ライブラリの公開方法について詳しく説明します。

## 1.3.1 - Adobe Experience Platform Web SDK 拡張機能

拡張機能は、Adobe Experience Platformデータ収集インターフェイスとライブラリ機能を拡張する、パッケージ化されたコードセットです。 Adobe Experience Platformのデータ収集はプラットフォームであり、拡張機能はプラットフォーム上で実行されるアプリケーションのようなものです。 このチュートリアルで使用されるすべての拡張機能はAdobeが作成および管理しますが、サードパーティは独自の拡張機能を作成して、Adobe Experience Platformデータ収集ユーザーが管理するカスタムコードの量を制限できます。

に移動します。 [Adobe Experience Platform Data Collection](https://experience.adobe.com/launch/) を選択し、 **タグ**.

これは、以前に表示したAdobe Experience Platformデータ収集プロパティページです。

![プロパティページ](./images/launch1.png)

モジュール 0 では、Demo System によって次の 2 つのクライアントプロパティが作成されました。1 つは web サイト用、もう 1 つはモバイルアプリ用です。 次を検索して検索 `--demoProfileLdap--` 内 **[!UICONTROL 検索]** ボックス

![検索ボックス](./images/property6.png)

を開きます。 **Web** プロパティ。

次に、プロパティの概要ページが表示されます。 クリック **[!UICONTROL 拡張機能]** をクリックします。 次をクリック： **[!UICONTROL 設定]** ボタンをクリックします。

![プロパティの概要ページ](./images/property7.png)

Adobe Experience Platform Web SDK にようこそ。 ここで、で作成したデータストリームを使用して拡張機能を設定できます。 [演習 0.2](./../module0/ex2.md) さらに高度な設定も含まれています。 この演習では、2 つの設定のみを構成します。

デフォルトの Edge ドメインは常にです **edge.adobedc.net**. Adobe Experience CloudまたはAdobe Experience Platform環境で CNAME 設定を実装している場合は、 **[!UICONTROL Edge ドメイン]**. Adobe Experience Platformインスタンスは、次の Edge ドメインを使用しています： `--webSdkEdgeDomain--`.

インスタンスの Edge ドメインがデフォルトのドメインと異なる場合は、Edge ドメインを更新してください。 エッジドメインを使用すれば、ファーストパーティのトラッキングサーバーを設定でき、その後、バックエンドの CNAME 設定を使用して、データが確実にAdobeに収集されるようになります。

![拡張機能ホーム](./images/property9edgedomain.png)

次に、 **[!UICONTROL リストから選択]** ラジオボタンが **[!UICONTROL データストリーム]** 見出しを開き、次の名前のデータストリームを選択します。 `--demoProfileLdap-- - Demo System Datastream`( **[!UICONTROL Datastream]** ボックス

![拡張機能ホーム](./images/property9edge.png)

クリック **[!UICONTROL 保存]** をクリックして、拡張機能ビューに戻ります。

![Adobe Experience Platform Web SDK のホームページ](./images/save.png)

## 1.3.2 データ要素

データ要素は、データディクショナリ（またはデータマップ）の構築ブロックです。データ要素を使用して、マーケティングおよび広告テクノロジー全体でデータを収集、整理、配信します。

単一のデータ要素は、クエリ文字列、URL、cookie 値、JavaScript 変数などに値をマッピングできる変数です。Adobe Experience Platformデータ収集全体で、変数名によって値を参照できます。 このデータ要素コレクションは、ルール（イベント、条件、アクション）の作成に使用する、定義済みデータの辞書になります。このデータディクショナリは、プロパティに追加した拡張機能で使用するために、すべてのAdobe Experience Platformデータ収集で共有されます。

既に存在するデータ要素を Web SDK 形式で編集します。

左側のパネルの「データ要素」をクリックして、データ要素ページに移動します。

![データ要素の Homepage](./images/dataelement1.png)

>[!NOTE]
>
>この演習では、データ要素の編集のみを行っていますが、「 **[!UICONTROL データ要素を追加]** 」ボタンをクリックします。このボタンは、新しい変数をデータディクショナリに追加する際に使用されます。 その後、これはAdobe Experience Platformのデータ収集全体で使用できます。 他の既存のデータ要素（主にローカルストレージをデータソースとして使用）を自由に確認できます。

検索バーに、「 **XDM — 製品表示** をクリックし、返すデータ要素をクリックします。

![ruleArticlePages を検索します。](./images/dataelement2.png)

この画面には、編集する XDM オブジェクトが表示されます。 エクスペリエンスデータモデル (XDM) は、この技術チュートリアル全体でさらに詳しく説明する概念ですが、現時点では、Adobe Experience Platform Web SDK で必要な形式として理解するのに十分です。 デモ Web サイトの記事ページで収集されたデータに、さらに情報を追加します。

の横のプラスボタンをクリックします。 **web** 木の一番下に。

の横のプラスボタンをクリックします。 **webPageDetails**.

クリック **siteSection**. これで分かりました **siteSection** は、まだデータ要素にリンクされていません。 私たちはそれを変えましょう。

![サイトセクションに移動します。](./images/dataelement3.png)

上にスクロールし、テキストを入力します。 `%Product Category%`. 「**[!UICONTROL 保存]**」をクリックします。

![保存します。](./images/dataelement4.png)

この時点で、Adobe Experience Platform Web SDK 拡張機能がインストールされ、XDM 構造に対してデータを収集するためのデータ要素を更新しました。 次に、適切な時刻にデータを送信するルールを確認します。

## 1.3.3 ルール

Adobe Experience Platform Data Collection は、ルールベースのシステムです。 ユーザーの操作に関する各種データを参照します。ルールで設定された条件が満たされると、ルールは、特定した拡張機能、スクリプトまたはクライアント側コードをトリガーします。

異なる製品を 1 つのソリューションに統合するマーケティングおよび広告テクノロジーのデータと機能を統合するためのルールを構築します。

記事ページでデータを送信するルールを分類します。

クリック **[!UICONTROL ルール]** をクリックします。

**[!UICONTROL 検索]** 対象 `Product View`.

返されるルールをクリックします。

![メディア — 記事ページのルール検索](./images/rule1.png)

このルールを構成する個々の要素について説明します。 すべてのルールに対して、指定した場合 **[!UICONTROL イベント]** が発生し、 **[!UICONTROL 条件]** が評価され、 **[!UICONTROL アクション]** 必要に応じて実行します。

![メディア — 記事ページルール](./images/rule2.png)

イベントをクリックします。 **カスタムイベント — 製品表示**. これは、読み込まれるビューです。

をクリックします。 **イベントタイプ** ドロップダウンします。

条件が true の場合、Adobe Experience Platformデータ収集にアクションを実行するようにシグナルする際に使用できる標準的なインタラクションの一部を以下に示します。

![イベント](./images/rule3.png)

クリック **[!UICONTROL キャンセル]** をクリックして、ルールに戻ります。

アクションをクリックします。 **「製品表示」イベントを AEP に送信**.

ここには、Adobe Experience Platform Web SDK によってAdobe Edgeに送信されるデータが表示されます。 具体的には、 **合金** **[!UICONTROL インスタンス]** Web SDK の 別の設定 **[!UICONTROL インスタンス]** では、様々なデータストリームを使用できます。 イベントを指定しました **[!UICONTROL タイプ]** as a **commerce.productViews** 送信する XDM データは、 **XDM — 製品表示** 前に変更したデータ要素。

![イベント送信アクション](./images/rule5.png)

ルールを確認したら、Adobe Experience Platformデータ収集ですべての変更を公開できます。

## 1.3.4 ライブラリでの公開

最後に、先ほど更新したルールとデータ要素を検証するには、プロパティ内の編集済みの項目を含むライブラリを公開する必要があります。 次の手順を実行する必要があります。 **[!UICONTROL 公開]** Adobe Experience Platform Data Collection のセクションに含まれている必要があります。

クリック **[!UICONTROL 公開フロー]** 左のナビゲーション

既存のライブラリ ( ) をクリックします。 **メイン**.

![ライブラリアクセス](./images/publish1.png)

次をクリック： **変更されたリソースをすべて追加** 」ボタンをクリックします。

![ライブラリアクセス](./images/publish1a.png)

下にスクロールして、ほとんどのリソースが **リビジョン 1（最新）**&#x200B;でも、2 つは変わった — **データ要素：ruleArticlePages** および **拡張：Adobe Experience Platform Web SDK** 単に **最新**.

次をクリック： **開発用に保存およびビルド** 」ボタンをクリックします。

![コンテンツライブラリ](./images/publish2.png)

ライブラリのビルドには数分かかる場合があり、完了すると、ライブラリ名の左側に緑の点が表示されます。

公開フロー画面で確認できるように、Adobe Experience Platformデータ収集の公開プロセスには、このチュートリアルの範囲外の多くの点があります。 開発環境で 1 つのライブラリを使用するだけです。

次のステップ： [1.4 クライアント側の Web データ収集](./ex4.md)

[モジュール 1 に戻る](./data-ingestion-launch-web-sdk.md)

[すべてのモジュールに戻る](./../../overview.md)
