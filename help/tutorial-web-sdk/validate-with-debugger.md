---
title: Experience Platform Debugger を使用した web SDK実装の検証
description: Adobe Experience Platform Debuggerを使用して Platform web SDK実装を検証する方法を説明します。 このレッスンは、「Web SDK を使用した Adobe Experience Cloud 実装のチュートリアル」の一部です。
feature: Web SDK,Tags,Debugger
jira: KT-15405
exl-id: 150bb1b1-4523-4b44-bd4e-6cabc468fc04
source-git-commit: d70d5df8b11c8500dbe4764b08e2627893f436f0
workflow-type: tm+mt
source-wordcount: '1158'
ht-degree: 7%

---

# Experience Platform Debugger を使用した web SDK実装の検証

Adobe Experience Platform デバッガ―を使用して Adobe Experience Platform Web SDK 実装を検証する方法について説明します。

Experience Platform Debugger は、Chromeで使用できる拡張機能で、web ページに実装されたAdobe テクノロジーを確認するのに役立ちます。

* [Chrome拡張機能 &#x200B;](https://chromewebstore.google.com/detail/adobe-experience-platform/bfnnokhpnncpkdmbokanobigaccjkpob)

デバッガーをまだ使用したことがない場合は、次の 5 分間の概要ビデオをご覧ください。

>[!VIDEO](https://video.tv.adobe.com/v/32156?learn=on&enablevpops)

このレッスンでは、[Adobe Experience Platform Debugger拡張機能 &#x200B;](https://chromewebstore.google.com/detail/adobe-experience-platform/bfnnokhpnncpkdmbokanobigaccjkpob) を使用して、[Luma デモサイト &#x200B;](https://luma.enablementadobe.com/content/luma/us/en.html) にハードコードされたタグプロパティを独自のプロパティに置き換えます。

この手法は環境の切り替えと呼ばれ、後で自分の web サイトでタグを操作する際に役立ちます。 これにより、ブラウザーに実稼動 web サイトを読み込み、*開発* タグライブラリを使用できます。 この機能を使用すると、通常のコードリリースとは別に、タグの変更を自信を持って行い、検証できます。 結局、マーケティングタグリリースを通常のコードリリースから分離することが、顧客がタグを最初に使用する主な理由の 1 つです。

## 学習目標

このレッスンを終了すると、デバッガを使用して次の操作を実行できるようになります。

* 代替タグライブラリの読み込み
* クライアントサイド XDM イベントが、Platform Edge Networkに対して期待どおりにデータを取得して送信していることを検証します
* Edge Trace を有効にして、Platform Edge Networkから送信されたサーバーサイドリクエストを表示します

## 前提条件

データ収集タグと [Luma デモサイト &#x200B;](https://luma.enablementadobe.com/content/luma/us/en.html){target="_blank"} に精通し、チュートリアルの前のレッスンを完了しました。

* [XDM スキーマの設定](configure-schemas.md)
* [ID 名前空間の設定](configure-identities.md)
* [データストリームの設定](configure-datastream.md)
* [タグプロパティにインストールされている web SDK拡張機能](install-web-sdk.md)
* [データ要素の作成](create-data-elements.md)
* [ID の作成](create-identities.md)
* [タグルールの作成](create-tag-rule.md)

## Debugger での代替タグライブラリの読み込み

Experience Platform Debugger には、既存のタグライブラリを別のライブラリで置き換えることができる優れた機能があります。 この手法は、検証に役立ち、このチュートリアルの多くの実装手順をスキップできます。

1. [Luma デモ web サイト &#x200B;](https://luma.enablementadobe.com/content/luma/us/en.html){target="_blank"} が開いていることを確認し、Experience Platform Debugger 拡張機能アイコンを選択します
1. デバッガーが開き、ハードコーディングされた実装の詳細が表示されます（デバッガーを開いた後に Luma サイトをリロードする必要が生じる場合があります）
1. 次の図に示すように、デバッガーが「**[!UICONTROL Luma に接続]**」されていることを確認し、「**[!UICONTROL lock]**」アイコンを選択して、デバッガーを Luma サイトにロックします。
1. 「**[!UICONTROL ログイン]**」ボタンを選択し、Adobe ID を使用してAdobe Experience Cloudにログインします。
1. 左側のナビゲーションの **[!UICONTROL Experience Platform タグ]** に移動します

   ![Debugger タグ画面 &#x200B;](assets/validate-launch-screen.png)

1. 「**[!UICONTROL 設定]**」タブを選択します。
1. **[!UICONTROL ページ埋め込みコード]** が表示されている場所の右側で、「**[!UICONTROL アクション]**」ドロップダウンを開き、「**[!UICONTROL 置換]**」を選択します

   ![&#x200B; アクション/置換を選択 &#x200B;](assets/validate-switch-environment.png)

1. 認証されたので、Debugger は使用可能なタグプロパティと環境を取り込みます。 プロパティを選択
1. `Development` 環境を選択します
1. 「**[!UICONTROL 適用]** ボタンを選択します

   ![&#x200B; 代替タグプロパティの選択 &#x200B;](assets/validate-switch-selection.png)

1. Luma web サイトが _独自のタグプロパティを使用して_ 再読み込みされるようになりました。

   ![&#x200B; タグプロパティが置き換えられました &#x200B;](assets/validate-switch-success.png)

チュートリアルを続ける際は、この手法を使用して、Luma サイトを独自のタグプロパティにマッピングし、Platform Web SDK実装を検証します。 独自の web サイトでタグを使用する場合、これと同じ手法を使用して、実稼動 web サイトで開発タグライブラリを検証できます。

## Experience Platform Debugger を使用したクライアントサイドのネットワークリクエストの検証

Debugger を使用して、Platform Web Edge Network実装からトリガーされたクライアントサイドビーコンを検証し、Platform SDKに送信されたデータを確認することができます。

1. 左側のナビゲーションの **[!UICONTROL 概要]** に移動して、タグプロパティの詳細を確認します

   ![&#x200B; 「概要」タブ &#x200B;](assets/validate-summary.png)

1. 左側のナビゲーションで **[!UICONTROL Experience Platform Web SDK]** に移動して、**[!UICONTROL ネットワークリクエスト]** を確認します
1. **[!UICONTROL events]** 行を開きます

   ![Adobe Experience Platform Web SDK リクエスト &#x200B;](assets/validate-aep-screen.png)

1. `web.webpagedetails.pageView` 変数を更新 [!UICONTROL &#x200B; アクション、および &#x200B;] フィールドグループに準拠するその他の標準変数で指定した `AEP Web SDK ExperienceEvent` イベントタイプを確認する方法をメモします

   ![&#x200B; イベントの詳細 &#x200B;](assets/validate-event-pageViews.png)

1. `web` オブジェクトまで下にスクロールし、選択して開き、`webPageDetails.name`、`webPageDetails.server`、`webPageDetails.siteSection` を調べます。 ホームページの対応する `digitalData` データレイヤーの変数と一致する必要があります

>[!TIP]
>
> ホームページ上で `digitalData` のデータレイヤーを表示して比較するには：
>
> 1. Luma ホームページで、ブラウザー開発者ツールを開きます。 Chromeの場合は、キーボードの `F12` ボタンを選択します
> 1. 「**[!UICONTROL コンソール]**」タブを選択します。
> 1. `digitalData` と入力し、キーボードで `Enter` を選択してデータレイヤーの値を表示します

![&#x200B; 「ネットワーク」タブ &#x200B;](assets/validate-xdm-content.png)

ID マップの詳細を検証することもできます。

1. 資格情報 `test@test.com`/`test` を使用して Luma サイトにログインします。

1. [Luma のホームページ](https://luma.enablementadobe.com/content/luma/us/en.html)に戻ります。

1. 左側のナビゲーションで「**[!UICONTROL Experience Platform Web SDK]**」セクションを開きます

   ![Debugger での Web SDK](assets/identity-debugger-websdk-dark.png)

1. **[!UICONTROL events]** 行を選択して、ポップアップで詳細を開きます

   ![Debugger での Web SDK](assets/identity-deugger-websdk-event-dark.png)

1. ポップアップ内で **identityMap** を検索します。 ここでは、authenticatedState、id、および primary の 3 つのキーを持つ `lumaCrmId` が表示されます。
   ![Debugger での Web SDK](assets/identity-deugger-websdk-event-lumaCrmId-dark.png)

### ブラウザー開発ツールを使用したクライアントサイドリクエストの検証

これらのタイプのリクエストの詳細は、ブラウザーの web デベロッパーツールの **ネットワーク** タブにも表示されます（web サイトがタグライブラリを読み込んでいると仮定）。

1. ブラウザーの web 開発者ツールの「**ネットワーク**」タブを開き、ページをリロードします。 `/ee` を使用して呼び出しをフィルターし、呼び出しを見つけて選択し、「**ヘッダー**」タブと「**ペイロード**」タブを探します

   ![&#x200B; 「ネットワーク」タブ &#x200B;](assets/validate-dev-console.png)

1. 「**応答**」タブに移動し、ECID 値が応答にどのように含まれるかを確認します。

   ![&#x200B; 「ネットワーク」タブ &#x200B;](assets/validate-dev-console-ecid.png)

   >[!NOTE]
   >
   > ECID 値は、ネットワーク応答に表示されます。 これは、ネットワークリクエストの `identityMap` の部分には含まれず、この形式で cookie に格納されることもありません。

## Experience Platform Debugger を使用したサーバーサイドのネットワークリクエストの検証

[&#x200B; データストリームの設定 &#x200B;](configure-datastream.md) のレッスンで学んだように、Platform Web SDKは、最初にデジタルプロパティから Platform Edge Networkにデータを送信します。 次に、Platform Edge Networkは、データストリームで有効になっている対応するサービスに対して、サーバーサイドのリクエストを追加します。 Platform Edge Networkによって行われたサーバーサイドリクエストを Debugger のEdge Trace を使用して検証できます。

<!--Furthermore, you can also validate the fully processed payload after it reaches an Adobe application by using [Adobe Experience Platform Assurance](https://experienceleague.adobe.com/ja/docs/experience-platform/assurance/home). -->


### Edge Trace の有効化

Edge Trace を有効にする手順は次のとおりです。

1. **[!UICONTROL Experience Platform Debugger の左側のナビゲーションで]** 「**[!UICONTROL ログ]**」を選択します
1. 「**[!UICONTROL Edge]**」タブを選択し、「**[!UICONTROL 接続]**」を選択します

   ![Connect Edge Trace](assets/analytics-debugger-edgeTrace.png)

1. 今のところ空です

   ![Connected Edge Trace](assets/analytics-debugger-edge-connected.png)

1. [Luma ホームページ &#x200B;](https://luma.enablementadobe.com/) を更新し、**[!UICONTROL Experience Platform Debugger]** を再度確認して、データが取り込まれていることを確認します。

   ![Analytics ビーコンEdgeトレース &#x200B;](assets/validate-edge-trace.png)

この時点では、データストリームでを有効にしていないため、Adobe アプリケーションに送信される Platform Edge Network リクエストを表示できません。 今後のレッスンでは、Edge Trace を使用して、Adobe アプリケーションおよびイベント転送への送信サーバーサイドリクエストを表示します。 ただし、最初に、Platform Edge Networkが行うサーバーサイドリクエストを検証する別のツールであるAdobe Experience Platform Assuranceについて説明します。

>[!NOTE]
>
>Adobe Experience Platform Web SDKの学習にご協力いただき、ありがとうございます。 ご不明な点がある場合や、一般的なフィードバックを共有したい場合、または今後のコンテンツに関するご提案がある場合は、この [Experience League Community Discussion の投稿でお知らせください &#x200B;](https://experienceleaguecommunities.adobe.com/t5/adobe-experience-platform-data/tutorial-discussion-implement-adobe-experience-cloud-with-web/td-p/444996?profile.language=ja)
