---
title: タグプロパティのPublish
description: タグプロパティを開発環境からステージング環境と実稼動環境に公開する方法について説明します。 このレッスンは、web サイトでのExperience Cloudの実装チュートリアルの一部です。
exl-id: dec70472-cecc-4630-b68e-723798f17a56
source-git-commit: e2594d3b30897001ce6cb2f6908d75d0154015eb
workflow-type: tm+mt
source-wordcount: '571'
ht-degree: 58%

---

# タグプロパティのPublish

開発環境で Adobe Experience Cloud の主要ソリューションをいくつか実装したら、パブリッシュのワークフローについて学習しましょう。

>[!NOTE]
>
>Adobe Experience Platform Launch は、データ収集テクノロジーのスイートとして Adobe Experience Platform に統合されています。 このコンテンツを使用する際に注意する必要があるインターフェイスで、いくつかの用語がロールアウトされました。
>
> * Platform launch（クライアントサイド）が **[[!DNL tags]](https://experienceleague.adobe.com/docs/experience-platform/tags/home.html?lang=ja)** になりました
> * Platform launchサーバーサイドが **[[!DNL event forwarding]](https://experienceleague.adobe.com/docs/experience-platform/tags/event-forwarding/overview.html?lang=ja)** になりました
> * Edgeの設定が **[[!DNL datastreams]](https://experienceleague.adobe.com/docs/experience-platform/edge/fundamentals/datastreams.html?lang=ja)** になりました

## 学習内容

このレッスンを最後まで学習すると、以下の内容を習得できます。

1. ステージング環境へ開発ライブラリをパブリッシュする
1. デバッガーを使用してステージングライブラリを実稼動 Web サイトにマッピングする
1. ステージングライブラリを実稼動環境にパブリッシュする

## ステージングへのパブリッシュ

開発環境でライブラリを作成して検証したら、そのライブラリをステージングにパブリッシュする番です。

1. **[!UICONTROL 公開フロー]** ページに移動

1. ライブラリの横にあるドロップダウンを開き、「**[!UICONTROL 承認用に送信]**」を選択します。

   ![承認用に送信](images/publishing-submitForApproval.png)

1. ダイアログの **[!UICONTROL 送信]** ボタンをクリックします。

   ![モーダルの「送信」をクリックする](images/publishing-submit.png)

1. ライブラリが[!UICONTROL 送信済み]列に未ビルドの状態で表示されます。

1. ドロップダウンを開き、「**[!UICONTROL ステージング用にビルド]**」を選択します。

   ![ステージング用にビルド](images/publishing-buildForStaging.png)

1. 緑のドットアイコンが表示されると、ステージング環境でライブラリをプレビューできます。

実際のシナリオでは通常、プロセスの次のステップとして、ステージングライブラリの変更を QA チームに検証してもらいます。これをおこなうには、デバッガーを使用します。

**ステージングライブラリで変更を検証するには、以下を実行します。**

1. タグプロパティで、[!UICONTROL &#x200B; 環境 &#x200B;] ページを開きます

1. [!UICONTROL ステージング]行で、インストールアイコン![インストールアイコン](images/launch-installIcon.png) をクリックして、モーダルを開きます。

   ![環境ページに移動し、クリックしてモーダルを開く](images/publishing-getStagingCode.png)

1. コピーアイコン![コピーアイコン](images/launch-copyIcon.png)をクリックして、埋め込みコードをクリップボードにコピーします。

1. 「**[!UICONTROL 閉じる]**」をクリックしてモーダルを閉じます

   ![インストールアイコン](images/publishing-copyStagingCode.png)

1. Chrome ブラウザーで [Luma デモサイト](https://luma.enablementadobe.com/content/luma/us/en.html)を開きます。

1. [&#x200B; デバッガーアイコン &#x200B;](https://chromewebstore.google.com/detail/adobe-experience-platform/bfnnokhpnncpkdmbokanobigaccjkpob) アイコンをクリックして、![Experience Platformデバッガー拡張機能を開 &#x200B;](images/icon-debugger.png) ます

   ![デバッガーアイコンをクリックする](images/switchEnvironments-openDebugger.png)

1. 「ツール」タブに移動します。

1. 「**[!UICONTROL Adobeのローンチ/ローンチの埋め込みコードの置き換え]**」セクションで、クリップボードにあるステージング埋め込みコードを貼り付けます
1. **[!UICONTROL luma.enablementadobe.com 全体に適用]** スイッチをオンにします

1. ディスクアイコンをクリックして保存します。

   ![Debugger に表示されるタグ環境 &#x200B;](images/switchEnvironments-debugger-save.png)

1. デバッガーの「概要」タブをリロードして確認します。「ローンチ」セクションに、ステージングプロパティが実装され、プロパティ名（「タグチュートリアル」など、プロパティに名前を付けたもの）が表示されます。

   ![Debugger に表示されるタグ環境 &#x200B;](images/publishing-debugger-staging.png)

実際には、QA チームがステージング環境の変更を確認してサインオフしたら、実稼動環境にパブリッシュします。

## 実稼動環境へのパブリッシュ

1. [!UICONTROL パブリッシング]ページに移動します。

1. ドロップダウンから、「**[!UICONTROL 公開の承認]**」をクリックします。

   ![パブリッシュの承認](images/publishing-approveForPublishing.png)

1. ダイアログボックスの **[!UICONTROL 承認]** ボタンをクリックします。

   ![「承認」をクリックする](images/publishing-approve.png)

1. ライブラリが[!UICONTROL 承認済み]列に未ビルド（黄色の点）として表示されます。

1. ドロップダウンを開き、「**[!UICONTROL ビルドして実稼動環境にPublish]**」を選択します。

   ![「ビルドして実稼動環境にパブリッシュ」をクリックする](images/publishing-buildAndPublishToProduction.png)

1. ダイアログボックスで **0&rbrace;Publish&rbrace; をクリックします。**

   ![「パブリッシュ」をクリックする](images/publishing-publish.png)

1. ライブラリが[!UICONTROL パブリッシュ済み]列に表示されます。

   ![パブリッシュ済み](images/publishing-published.png)

これで作業は完了です。チュートリアルを完了し、タグの最初のプロパティを公開しました。
