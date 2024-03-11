---
title: Debugger を使用した Web SDK の実装のExperience Platform
description: Adobe Experience Platform Debuggerを使用して Platform Web SDK の実装を検証する方法について説明します。 このレッスンは、「 Adobe Experience Cloudと Web SDK の実装」チュートリアルの一部です。
feature: Web SDK,Tags,Debugger
source-git-commit: fd366a4848c2dd9e01b727782e2f26005a440725
workflow-type: tm+mt
source-wordcount: '1206'
ht-degree: 1%

---

# Debugger を使用した Web SDK の実装のExperience Platform

Adobe Experience Platform Debuggerを使用して Platform Web SDK の実装を検証する方法について説明します。

Experience Platformデバッガーは、Web ページに実装されているAdobeテクノロジーを確認するのに役立つ、Chrome および Firefox ブラウザーで使用できる拡張機能です。 使用するブラウザーのバージョンをダウンロードします。

* [Firefox 拡張機能](https://addons.mozilla.org/ja/firefox/addon/adobe-experience-platform-dbg/)
* [Chrome 拡張機能](https://chrome.google.com/webstore/detail/adobe-experience-platform/bfnnokhpnncpkdmbokanobigaccjkpob)

以前のAdobe Experience Cloud Debugger とは異なるデバッガーを使用したことがない場合は、次の 5 分間の概要ビデオを視聴できます。

>[!VIDEO](https://video.tv.adobe.com/v/32156?learn=on)

このレッスンでは、 [Adobe Experience Cloud Debugger 拡張機能](https://chrome.google.com/webstore/detail/adobe-experience-cloud-de/ocdmogmohccmeicdhlhhgepeaijenapj) タグプロパティを [Luma デモサイト](https://luma.enablementadobe.com/content/luma/us/en.html) を独自のプロパティに追加します。

この手法は環境の切り替えと呼ばれ、後で独自の Web サイトでタグを使用する際に役立ちます。 実稼働用 Web サイトをブラウザーに読み込むには、 *開発* タグ環境 この機能を使用すると、通常のコードリリースとは独立し、自信を持ってタグを変更し、検証できます。 結局、マーケティングタグリリースを通常のコードリリースから分離できることは、顧客がタグを最初に使用する主な理由の 1 つです。

## 学習内容

このレッスンを終了すると、デバッガーを使用して次のことをおこなえるようになります。

* 代替タグライブラリの読み込み
* クライアント側の XDM イベントがデータをキャプチャし、期待どおりに Platform Edge Network に送信していることを検証します。
* Edge Trace を有効にして、Platform Edge Network から送信されたサーバー側のリクエストを表示します

## 前提条件

データ収集タグと [Luma デモサイト](https://luma.enablementadobe.com/content/luma/us/en.html){target="_blank"} チュートリアルの前のレッスンを完了していること。

* [XDM スキーマの設定](configure-schemas.md)
* [ID 名前空間の設定](configure-identities.md)
* [データストリームの設定](configure-datastream.md)
* [タグプロパティにインストールされる Web SDK 拡張機能](install-web-sdk.md)
* [データ要素の作成](create-data-elements.md)
* [ID の作成](create-identities.md)
* [タグルールの作成](create-tag-rule.md)

## Debugger を使用した代替タグライブラリの読み込み

Experience Platformデバッガーには、既存のタグライブラリを別のタグライブラリに置き換えることができるクールな機能があります。 この手法は検証に役立ち、このチュートリアルで多くの実装手順をスキップできます。

1. 次の項目を確認します。 [Luma デモ Web サイト](https://luma.enablementadobe.com/content/luma/us/en.html){target="_blank"} を開き、「 Debugger 拡張機能」Experience Platformを選択します。
1. デバッガーが開き、ハードコードされた実装の詳細が表示されます（デバッガーを開いた後に Luma サイトを再読み込みする必要が生じる場合があります）。
1. デバッガーが「**[!UICONTROL Luma に接続済み]**」をクリックし、「**[!UICONTROL ロック]**「 」アイコンを使用して、デバッガーを Luma サイトにロックします。
1. を選択します。 **[!UICONTROL ログイン]** ボタンをクリックし、AdobeID を使用してAdobe Experience Cloudにログインします。
1. 次に移動： **[!UICONTROL Experience Platformタグ]** 左のナビゲーションで

   ![Debugger タグ画面](assets/validate-launch-screen.png)

1. を選択します。 **[!UICONTROL 設定]** タブ
1. の右側に表示されます。 **[!UICONTROL ページ埋め込みコード]**&#x200B;をクリックし、 **[!UICONTROL アクション]** ドロップダウンと選択 **[!UICONTROL 置換]**

   ![アクション/置換を選択します。](assets/validate-switch-environment.png)

1. 認証されたので、Debugger は使用可能なタグのプロパティと環境を取り込みます。 プロパティを選択します。この場合は `Web SDK Course 3`
1. を選択します。 `Development` 環境
1. を選択します。 **[!UICONTROL 適用]** ボタン

   ![代替タグのプロパティを選択](assets/validate-switch-selection.png)

1. Luma Web サイトがリロードされます。 _を独自のタグプロパティと共に使用_.

   ![タグプロパティが置き換えられました](assets/validate-switch-success.png)

チュートリアルを続ける際は、この方法を使用して、Luma サイトを独自のタグプロパティにマッピングし、Platform Web SDK 実装を検証します。 実稼動用 Web サイトでタグの使用を開始する場合、この同じ方法を使用して、タグの開発環境で変更を行う場合と同じ方法で変更を検証できます。

## Debugger を使用したクライアント側ネットワークリクエストのExperience Platform

デバッガーを使用して、Platform Web SDK 実装からトリガーされるクライアントサイドビーコンを検証し、Platform Edge Network に送信されるデータを表示できます。

1. に移動します。 **[!UICONTROL 概要]** 左側のナビゲーションで、タグプロパティの詳細を表示します。

   ![「概要」タブ](assets/validate-summary.png)

1. 次に移動： **[!UICONTROL Experience PlatformWeb SDK]** 左側のナビゲーションで、 **[!UICONTROL ネットワークリクエスト]**
1. を開きます。 **[!UICONTROL イベント]** 行

   ![Adobe Experience Platform Web SDK リクエスト](assets/validate-aep-screen.png)

1. 表示方法を確認します。 `web.webpagedetails.pageView` イベントタイプ [!UICONTROL 変数を更新] アクション、および `AEP Web SDK ExperienceEvent` フィールドグループ

   ![イベントの詳細](assets/validate-event-pageViews.png)

1. 下にスクロールして、 `web` オブジェクトを選択し、開いて検査します。 `webPageDetails.name`, `webPageDetails.server`、および `webPageDetails.siteSection`. 対応する `digitalData` ホームページ上のデータレイヤー変数

>[!TIP]
>
> を表示して比較するには、以下を実行します。 `digitalData` ホームページのデータレイヤー：
>
> 1. Luma のホームページで、ブラウザーデベロッパーツールを開きます。 Chrome の場合は、「 」ボタンを選択します。 `F12` キーボードの
> 1. を選択します。 **[!UICONTROL コンソール]** タブ
> 1. 入力 `digitalData` を選択し、 `Enter` キーボードでデータレイヤーの値を表示する

![「Network」タブ](assets/validate-xdm-content.png)

また、ID マップの詳細を検証することもできます。

1. 資格情報を使用して Luma サイトにログインします。 `test@adobe.com`/`test`

1. [Luma のホームページ](https://luma.enablementadobe.com/content/luma/us/en.html)に戻ります。

1. を開きます。 **[!UICONTROL Experience PlatformWeb SDK]** セクション（左側のナビゲーション）

   ![Debugger での Web SDK](assets/identity-debugger-websdk-dark.png)

1. を選択します。 **[!UICONTROL イベント]** 行を使用して詳細をポップアップで開く

   ![Debugger での Web SDK](assets/identity-deugger-websdk-event-dark.png)

1. を検索します。 **identityMap** をクリックします。 ここで、 `lumaCrmId` 認証済み状態、id、プライマリの 3 つのキーを持つ
   ![Debugger での Web SDK](assets/identity-deugger-websdk-event-lumaCrmId-dark.png)

### ブラウザー開発ツールを使用してクライアント側リクエストを検証する

これらのタイプのリクエストの詳細は、ブラウザーの Web 開発者ツールにも表示されます **ネットワーク** 」タブ（Web サイトがタグライブラリを読み込むと仮定）に表示されます。

1. ブラウザーの Web 開発者ツールを開きます。 **ネットワーク** 「 」タブをタブに移動して、ページをリロードします。 次を含む呼び出しのフィルター `/ee` 呼び出しを見つけるには、呼び出しを選択し、 **ヘッダー** タブ、および **ペイロード** タブ

   ![「Network」タブ](assets/validate-dev-console.png)

1. 次に移動： **応答** 」タブに移動し、ECID 値が応答にどのように含まれるかを確認します。 この値をコピーします。次の演習では、この値を使用して縦断情報を検証します。

   ![「Network」タブ](assets/validate-dev-console-ecid.png)

   >[!NOTE]
   >
   > ECID 値は、ネットワーク応答で表示されます。 これは、 `identityMap` の一部を含める必要があります。また、この形式で cookie に保存されることもありません。

## Debugger を使用したサーバー側ネットワークリクエストのExperience Platform

あなたが [データストリームの設定](configure-datastream.md) レッスンでは、Platform Web SDK は、まずデジタルプロパティから Platform Edge Network にデータを送信します。 次に、Platform Edge Network は、データストリームで有効になっている対応するサービスに対して、追加のサーバー側リクエストをおこないます。 デバッガーで Edge Trace を使用して、Platform Edge Network によっておこなわれたサーバー側リクエストを検証できます。

<!--Furthermore, you can also validate the fully processed payload after it reaches an Adobe application by using [Adobe Experience Platform Assurance](https://experienceleague.adobe.com/docs/experience-platform/assurance/home.html?lang=en). -->


### エッジトレースを有効にする

エッジトレースを有効にするには：

1. の左側のナビゲーション **[!UICONTROL Experience Platformデバッガー]** 選択 **[!UICONTROL ログ]**
1. を選択します。 **[!UICONTROL Edge]** 「 」タブで「 」を選択します。 **[!UICONTROL 接続]**

   ![エッジトレースを接続](assets/analytics-debugger-edgeTrace.png)

1. 現時点では空です

   ![接続エッジトレース](assets/analytics-debugger-edge-connected.png)

1. 次を更新： [Luma ホームページ](https://luma.enablementadobe.com/) およびチェック **[!UICONTROL Experience Platformデバッガー]** 再び、データが入ってくるのを確認します。

   ![Analytics ビーコンの Edge Trace](assets/validate-edge-trace.png)

この時点では、データストリームでを有効にしていないので、Adobeアプリケーションに送信される Platform Edge Network リクエストを表示できません。 今後のレッスンでは、Edge Trace を使用して、Adobeアプリケーションおよびイベント転送に対するサーバー側のリクエストを表示します。 まず、Platform Edge Network(Adobe Experience Platform Assurance) がおこなったサーバー側リクエストを検証する別のツールについて学びます。

[次へ： ](validate-with-assurance.md)

>[!NOTE]
>
>Adobe Experience Platform Web SDK の学習に時間を割いていただき、ありがとうございます。 ご質問がある場合、一般的なフィードバックを共有したい場合、または今後のコンテンツに関する提案がある場合は、こちらで共有してください [Experience Leagueコミュニティディスカッション投稿](https://experienceleaguecommunities.adobe.com/t5/adobe-experience-platform-launch/tutorial-discussion-implement-adobe-experience-cloud-with-web/td-p/444996)