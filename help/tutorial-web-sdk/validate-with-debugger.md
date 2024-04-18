---
title: Experience Platformデバッガーを使用した Web SDK 実装の検証
description: Adobe Experience Platform Debuggerを使用して Platform Web SDK 実装を検証する方法を説明します。 このレッスンは、Web SDK を使用したAdobe Experience Cloudの実装チュートリアルの一部です。
feature: Web SDK,Tags,Debugger
exl-id: 150bb1b1-4523-4b44-bd4e-6cabc468fc04
source-git-commit: 15bc08bdbdcb19f5b086267a6d94615cbfe1bac7
workflow-type: tm+mt
source-wordcount: '1070'
ht-degree: 2%

---

# Experience Platformデバッガーを使用した Web SDK 実装の検証


>[!CAUTION]
>
>このチュートリアルの大きな変更は、2024 年 4 月 23 日火曜日（PT）に公開される予定です。 その後、多くの演習が変更され、すべてのレッスンを完了するには、最初からチュートリアルを再開する必要が生じる場合があります。

Adobe Experience Platform Debuggerを使用して Platform Web SDK 実装を検証する方法を説明します。

Experience Platformーデバッガーは、Chrome および Firefox ブラウザーで使用できる拡張機能で、web ページに実装されたAdobeーテクノロジーを確認するのに役立ちます。 使用するブラウザーのバージョンをダウンロードします。

* [Firefox 拡張機能](https://addons.mozilla.org/ja/firefox/addon/adobe-experience-platform-dbg/)
* [Chrome 拡張機能](https://chrome.google.com/webstore/detail/adobe-experience-platform/bfnnokhpnncpkdmbokanobigaccjkpob)

デバッガーを使用したことがない（これが古いAdobe Experience Cloud Debugger とは異なる）場合は、次の 5 分間の概要ビデオをご覧ください。

>[!VIDEO](https://video.tv.adobe.com/v/32156?learn=on)

このレッスンでは、を使用します [Adobe Experience Platform Debugger拡張機能](https://chromewebstore.google.com/detail/adobe-experience-platform/bfnnokhpnncpkdmbokanobigaccjkpob) でハードコードされたタグプロパティを [Luma デモサイト](https://luma.enablementadobe.com/content/luma/us/en.html) 自分のプロパティを持つ。

この手法は環境の切り替えと呼ばれるもので、後で自分の web サイトでタグを使用する際に役立ちます。 実稼動 web サイトをブラウザーに読み込むことができますが、その際には *開発* タグ環境。 この機能を使用すると、通常のコードリリースとは別に、タグの変更を自信を持って行い、検証できます。 結局のところ、マーケティングタグリリースと通常のコードリリースの分離は、顧客がそもそもタグを使用する主な理由の 1 つです。

## 学習目標

このレッスンを終了すると、デバッガを使用して次の操作を実行できるようになります。

* 代替タグライブラリの読み込み
* XDM オブジェクトがデータを取得し、期待されるEdge Networkとして送信していることを検証

## 前提条件

データ収集タグと [Luma デモサイト](https://luma.enablementadobe.com/content/luma/us/en.html){target="_blank"} およびは、このチュートリアルの次の前のレッスンを完了しています。

* [権限の設定](configure-permissions.md)
* [XDM スキーマの設定](configure-schemas.md)
* [ID 名前空間の設定](configure-identities.md)
* [データストリームの設定](configure-datastream.md)
* [タグプロパティにインストールされている Web SDK 拡張機能](install-web-sdk.md)
* [データ要素の作成](create-data-elements.md)
* [タグルールの作成](create-tag-rule.md)


## Debugger での代替タグライブラリの読み込み

このチュートリアルでは、の公開バージョンを使用します [Luma デモ web サイト](https://luma.enablementadobe.com/content/luma/us/en.html). ホームページを開き、ブックマークします。

![Luma ホームページ](assets/validate-luma-site.png)

Experience Platformデバッガーには、既存のタグライブラリを別のライブラリで置き換えることができる優れた機能があります。 この手法は、検証に役立ち、このチュートリアルの多くの実装手順をスキップできます。

1. Luma サイトが開いていることを確認し、「Experience Platformデバッガー」拡張機能アイコンを選択します
1. デバッガーが開き、ハードコーディングされた実装の詳細が表示されます。これは、このチュートリアルとは無関係です（デバッガーを開いた後に Luma サイトをリロードする必要がある場合があります）
1. デバッガーが「」であることを確認します。**[!UICONTROL Luma に接続]**&#x200B;次の図のように「」を選択してから、「」を選択します&#x200B;**[!UICONTROL ロック]**「アイコンでデバッガーを Luma サイトにロックします。
1. 「」を選択します **[!UICONTROL ログイン]** ボタンを押し、AdobeID を使用してAdobe Experience Cloudにログインします。
1. 次に進む **[!UICONTROL Experience Platformタグ]** 左側のナビゲーションで

   ![Debugger タグ画面](assets/validate-launch-screen.png)

1. 「」を選択します **[!UICONTROL 設定]** タブ
1. 表示される場所の右側 **[!UICONTROL ページ埋め込みコード]**&#x200B;を開きます。 **[!UICONTROL アクション]** ドロップダウンから選択 **[!UICONTROL 置換]**

   ![アクション/置換を選択します](assets/validate-switch-environment.png)

1. 認証されたので、Debugger は使用可能なタグプロパティと環境を取り込みます。 を選択 `Web SDK Course` プロパティ
1. を選択 `Development` 0.9511122
1. 「」を選択します **[!UICONTROL 適用]** ボタン

   ![代替タグプロパティを選択します](assets/validate-switch-selection.png)

1. Luma web サイトがリロードされます _タグプロパティを使用_.

   ![タグプロパティが置き換えられました](assets/validate-switch-success.png)

チュートリアルを続ける際は、この手法を使用して Luma サイトを独自のタグプロパティにマッピングし、Platform Web SDK 実装を検証します。 実稼動 web サイトでタグの使用を開始する場合は、これと同じ方法を使用して変更を検証できます。

## Experience Platformデバッガーでの実装の検証

Debugger を使用すると、Platform Web SDK 実装を検証し、Platform Edge Networkに送信されたデータを表示できます。

1. に移動 **[!UICONTROL 概要]** 左側のナビゲーションで、タグプロパティの詳細を表示します。

   ![「概要」タブ](assets/validate-summary.png)

1. 次に進む **[!UICONTROL Web SDK のExperience Platform]** 左側のナビゲーションでを表示します **[!UICONTROL ネットワークリクエスト]**
1. を開きます **[!UICONTROL イベント]** 行（このスクリーンショットに、自分のスクリーンショットよりも多くのリクエストが表示されている場合は心配ありません。将来のレッスンからのリクエストが含まれており、今は無視できます）

   ![Adobe Experience Platform Web SDK リクエスト](assets/validate-aep-screen.png)

1. 次のように表示されます `web.webpagedetails.pageView` で指定したイベントタイプ [!UICONTROL イベントを送信] アクション、およびに準拠しているその他の標準変数 `AEP Web SDK ExperienceEvent Mixin` 形式

   ![イベントの詳細](assets/validate-event-pageViews.png)

1. にスクロール ダウンします。 `web` オブジェクトを選択して開き、 `webPageDetails.name`, `webPageDetails.server`、および `webPageDetails.siteSection`. ホームページの対応する digitalData データレイヤー変数と一致する必要があります

   ![「ネットワーク」タブ](assets/validate-xdm-content.png)

ID マップの詳細を検証することもできます。

1. 資格情報（`test@adobe.com`／`test`）を使用して Luma サイトにログインします。

1. [Luma のホームページ](https://luma.enablementadobe.com/content/luma/us/en.html)に戻ります。

1. を開きます **[!UICONTROL Web SDK のExperience Platform]** 左側のナビゲーションの「」セクション

   ![デバッガーの Web SDK](assets/identity-debugger-websdk-dark.png)

1. 「」を選択します **[!UICONTROL イベント]** ポップアップで詳細を開く行

   ![デバッガーの Web SDK](assets/identity-deugger-websdk-event-dark.png)

1. を検索 **identityMap** ポップアップ内。 ここに以下が表示されます `lumaCrmId` authenticatedState、id、および primary の 3 つのキーを持つ：
   ![デバッガーの Web SDK](assets/identity-deugger-websdk-event-lumaCrmId-dark.png)


## ブラウザー開発ツールを使用した検証

これらのタイプのリクエストの詳細は、ブラウザーの web デベロッパーツールにも表示されます **ネットワーク** タブ（web サイトがタグライブラリを読み込んでいると仮定）。

1. ブラウザーの web デベロッパーツールを開きます。 **ネットワーク** タブをクリックして、ページをリロードします。 での呼び出しのフィルタリング `/ee` 呼び出しを探すには、呼び出しを選択してから、 **ヘッダー** タブ、 **ペイロード** タブ

   ![「ネットワーク」タブ](assets/validate-dev-console.png)

1. に移動します **応答** タブをクリックし、ECID 値が応答にどのように含まれるかを確認します。 この値をコピーします。次の演習では、この値を使用してプロファイル情報を検証します

   ![「ネットワーク」タブ](assets/validate-dev-console-ecid.png)

   >[!NOTE]
   >
   >    上のスクリーンショットに示すように、ペイロードリクエストの量は同じにならない場合があります。 この格差は、今後の教訓が [target のセットアップ](setup-target.md) は、スクリーンショットの撮影時に完了しました。 今のところこの違いは無視してよろしい。

XDM オブジェクトがページで実行され、データ収集の検証方法がわかったので、Platform Web SDK を使用して個々のAdobeアプリケーションを設定する準備が整いました。

[次へ： ](setup-experience-platform.md)

>[!NOTE]
>
>Adobe Experience Platform Web SDK の学習に時間を費やしていただき、ありがとうございます。 ご質問がある場合、一般的なフィードバックを共有する場合、将来のコンテンツに関する提案がある場合は、このページで共有します [Experience League コミュニティ ディスカッションの投稿](https://experienceleaguecommunities.adobe.com/t5/adobe-experience-platform-launch/tutorial-discussion-implement-adobe-experience-cloud-with-web/td-p/444996)
