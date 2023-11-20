---
title: Debugger を使用した Web SDK の実装のExperience Platform
description: Adobe Experience Platform Debuggerを使用して Platform Web SDK の実装を検証する方法について説明します。 このレッスンは、「 Adobe Experience Cloudと Web SDK の実装」チュートリアルの一部です。
feature: Web SDK,Tags,Debugger
exl-id: 150bb1b1-4523-4b44-bd4e-6cabc468fc04
source-git-commit: e2594d3b30897001ce6cb2f6908d75d0154015eb
workflow-type: tm+mt
source-wordcount: '1071'
ht-degree: 6%

---

# Debugger を使用した Web SDK の実装のExperience Platform

Adobe Experience Platform Debuggerを使用して Platform Web SDK の実装を検証する方法について説明します。

Experience Platformデバッガーは、Web ページに実装されているAdobeテクノロジーを確認するのに役立つ、Chrome および Firefox ブラウザーで使用できる拡張機能です。 使用するブラウザーのバージョンをダウンロードします。

* [Firefox 拡張機能](https://addons.mozilla.org/ja/firefox/addon/adobe-experience-platform-dbg/)
* [Chrome 拡張機能](https://chrome.google.com/webstore/detail/adobe-experience-platform/bfnnokhpnncpkdmbokanobigaccjkpob)

以前のAdobe Experience Cloud Debugger とは異なるデバッガーを使用したことがない場合は、次の 5 分間の概要ビデオを視聴できます。

>[!VIDEO](https://video.tv.adobe.com/v/32156?learn=on)

このレッスンでは、 [Adobe Experience Platform Debugger拡張](https://chromewebstore.google.com/detail/adobe-experience-platform/bfnnokhpnncpkdmbokanobigaccjkpob) タグプロパティを [Luma デモサイト](https://luma.enablementadobe.com/content/luma/us/en.html) を独自のプロパティに追加します。

この手法は環境の切り替えと呼ばれ、後で独自の Web サイトでタグを使用する際に役立ちます。 実稼働用 Web サイトをブラウザーに読み込むには、 *開発* タグ環境 この機能を使用すると、通常のコードリリースとは独立し、自信を持ってタグを変更し、検証できます。 結局、マーケティングタグリリースを通常のコードリリースから分離できることは、顧客がタグを最初に使用する主な理由の 1 つです。

## 学習内容

このレッスンを終了すると、デバッガーを使用して次のことをおこなえるようになります。

* 代替タグライブラリの読み込み
* XDM オブジェクトが期待どおりにデータを取得して送信していることを検証します。

## 前提条件

データ収集タグと [Luma デモサイト](https://luma.enablementadobe.com/content/luma/us/en.html){target="_blank"} とは、このチュートリアルの以前のレッスンを完了していること。

* [権限の設定](configure-permissions.md)
* [XDM スキーマの設定](configure-schemas.md)
* [ID 名前空間の設定](configure-identities.md)
* [データストリームの設定](configure-datastream.md)
* [タグプロパティにインストールされる Web SDK 拡張機能](install-web-sdk.md)
* [データ要素の作成](create-data-elements.md)
* [タグルールの作成](create-tag-rule.md)


## Debugger を使用した代替タグライブラリの読み込み

このチュートリアルでは、公開ホストバージョンの [Luma デモ Web サイト](https://luma.enablementadobe.com/content/luma/us/en.html). ホームページを開き、ブックマークします。

![Luma のホームページ](assets/validate-luma-site.png)

Experience Platformデバッガーには、既存のタグライブラリを別のタグライブラリに置き換えることができるクールな機能があります。 この手法は検証に役立ち、このチュートリアルで多くの実装手順をスキップできます。

1. Luma サイトが開いていることを確認し、「デバッガー拡張機能」Experience Platformを選択します。
1. デバッガーが開き、ハードコードされた実装の詳細が表示されます。これは、このチュートリアルとは無関係です（デバッガーを開いた後に Luma サイトをリロードする必要が生じる場合があります）。
1. デバッガーが「**[!UICONTROL Luma に接続済み]**」をクリックし、「**[!UICONTROL ロック]**「 」アイコンを使用して、デバッガーを Luma サイトにロックします。
1. を選択します。 **[!UICONTROL ログイン]** ボタンをクリックし、AdobeID を使用してAdobe Experience Cloudにログインします。
1. 次に移動： **[!UICONTROL Experience Platformタグ]** 左のナビゲーションで

   ![Debugger タグ画面](assets/validate-launch-screen.png)

1. を選択します。 **[!UICONTROL 設定]** タブ
1. の右側に表示されます。 **[!UICONTROL ページ埋め込みコード]**&#x200B;をクリックし、 **[!UICONTROL アクション]** ドロップダウンと選択 **[!UICONTROL 置換]**

   ![アクション/置換を選択します。](assets/validate-switch-environment.png)

1. 認証されたので、Debugger は使用可能なタグのプロパティと環境を取り込みます。 を選択します。 `Web SDK Course` プロパティ
1. を選択します。 `Development` 環境
1. を選択します。 **[!UICONTROL 適用]** ボタン

   ![代替タグのプロパティを選択](assets/validate-switch-selection.png)

1. Luma Web サイトがリロードされます。 _をタグプロパティと共に使用_.

   ![タグプロパティが置き換えられました](assets/validate-switch-success.png)

チュートリアルを続ける際は、この方法を使用して、Luma サイトを独自のタグプロパティにマッピングし、Platform Web SDK 実装を検証します。 実稼動用 Web サイトでタグの使用を開始する場合、同じ方法を使用して変更を検証できます。

## Debugger での実装の検証Experience Platform

デバッガーを使用すると、Platform Web SDK の実装を検証し、Platform Edge Network に送信されるデータを表示することができます。

1. に移動します。 **[!UICONTROL 概要]** 左側のナビゲーションで、タグプロパティの詳細を表示します。

   ![「概要」タブ](assets/validate-summary.png)

1. 次に移動： **[!UICONTROL Experience PlatformWeb SDK]** 左側のナビゲーションで、 **[!UICONTROL ネットワークリクエスト]**
1. を開きます。 **[!UICONTROL イベント]** 行（このスクリーンショットに表示されるリクエストの数が自分より多い場合は、今後のレッスンからのリクエストも含まれ、現時点では無視できます）

   ![Adobe Experience Platform Web SDK リクエスト](assets/validate-aep-screen.png)

1. 表示方法 `web.webpagedetails.pageView` イベントタイプを指定した [!UICONTROL イベントの送信] アクション、および `AEP Web SDK ExperienceEvent Mixin` 形式

   ![イベントの詳細](assets/validate-event-pageViews.png)

1. 下にスクロールして、 `web` オブジェクトを選択し、開いて検査します。 `webPageDetails.name`, `webPageDetails.server`、および `webPageDetails.siteSection`. ホームページ上の対応する digitalData データレイヤー変数に一致する必要があります。

   ![「ネットワーク」タブ](assets/validate-xdm-content.png)

また、ID マップの詳細を検証することもできます。

1. 資格情報（`test@adobe.com`／`test`）を使用して Luma サイトにログインします。

1. [Luma のホームページ](https://luma.enablementadobe.com/content/luma/us/en.html)に戻ります。

1. を開きます。 **[!UICONTROL Experience PlatformWeb SDK]** セクション（左側のナビゲーション）

   ![Debugger での Web SDK](assets/identity-debugger-websdk-dark.png)

1. を選択します。 **[!UICONTROL イベント]** 行を使用して詳細をポップアップで開く

   ![Debugger での Web SDK](assets/identity-deugger-websdk-event-dark.png)

1. を検索します。 **identityMap** をクリックします。 ここで、 `lumaCrmId` 認証済み状態、id、プライマリの 3 つのキーを持つ
   ![Debugger での Web SDK](assets/identity-deugger-websdk-event-lumaCrmId-dark.png)


## ブラウザー開発ツールを使用した検証

これらのタイプのリクエストの詳細は、ブラウザーの Web 開発者ツールにも表示されます **ネットワーク** 」タブ（Web サイトがタグライブラリを読み込むと仮定）に表示されます。

1. ブラウザーの Web 開発者ツールを開きます。 **ネットワーク** 「 」タブをタブに移動して、ページをリロードします。 次を含む呼び出しのフィルター `/ee` 呼び出しを見つけるには、呼び出しを選択し、 **ヘッダー** タブ、および **ペイロード** タブ

   ![「ネットワーク」タブ](assets/validate-dev-console.png)

1. 次に移動： **応答** 」タブに移動し、ECID 値が応答にどのように含まれるかを確認します。 この値をコピーします。次の演習では、この値を使用して縦断情報を検証します。

   ![「ネットワーク」タブ](assets/validate-dev-console-ecid.png)

   >[!NOTE]
   >
   >    上のスクリーンショットと同じ量のペイロードリクエストが表示されない場合があります。 この格差は、今後の教訓によるものです。 [Target の設定](setup-target.md) は、スクリーンショットの撮影時に完了しました。 現時点では、この違いは無視できます。

ページで XDM オブジェクトが実行されるようになりました。また、データ収集の検証方法を知っていれば、Platform Web SDK を使用して個々のAdobeアプリケーションを設定する準備が整いました。

[次へ： ](setup-experience-platform.md)

>[!NOTE]
>
>Adobe Experience Platform Web SDK の学習に時間を割いていただき、ありがとうございます。 ご質問がある場合、一般的なフィードバックを共有する場合、または今後のコンテンツに関する提案がある場合は、このドキュメントで共有します [Experience Leagueコミュニティディスカッション投稿](https://experienceleaguecommunities.adobe.com/t5/adobe-experience-platform-launch/tutorial-discussion-implement-adobe-experience-cloud-with-web/td-p/444996)
