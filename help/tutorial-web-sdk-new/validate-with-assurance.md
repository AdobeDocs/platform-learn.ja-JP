---
title: Experience Platform保証を使用した Web SDK の実装の検証
description: Adobe Experience Platform Assurance を使用して Platform Web SDK の実装を検証する方法について説明します。 このレッスンは、「 Adobe Experience Cloudと Web SDK の実装」チュートリアルの一部です。
feature: Web SDK,Tags,Assurance
source-git-commit: fd366a4848c2dd9e01b727782e2f26005a440725
workflow-type: tm+mt
source-wordcount: '594'
ht-degree: 3%

---

# Experience Platform保証を使用した Web SDK の実装の検証

Adobe Experience Platform Assurance は、Adobe Experience Cloudがデータを収集したりエクスペリエンスを提供する方法を調査、配達確認、シミュレーションおよび検証する際に役立つ製品です。 詳細を表示： [Adobe保証](https://experienceleague.adobe.com/docs/experience-platform/assurance/home.html?lang=en).


## 学習内容

このレッスンを最後まで学習すると、以下の内容を習得できます。

* アシュランスセッションを開始する
* Platform Edge ネットワークに送信されたリクエストと Platform Edge ネットワークから送信されたリクエストの表示

## 前提条件

データ収集タグと [Luma デモサイト](https://luma.enablementadobe.com/content/luma/us/en.html){target="_blank"} チュートリアルの前のレッスンを完了していること。

* [XDM スキーマの設定](configure-schemas.md)
* [ID 名前空間の設定](configure-identities.md)
* [データストリームの設定](configure-datastream.md)
* [タグプロパティにインストールされる Web SDK 拡張機能](install-web-sdk.md)
* [データ要素の作成](create-data-elements.md)
* [ID の作成](create-identities.md)
* [タグルールの作成](create-tag-rule.md)
* [Debugger を使用した検証](validate-with-debugger.md)


## アシュランスセッションを開始して表示する

アシュランスセッションを開始する方法はいくつかあります。

### デバッガーでのアシュランスセッションの開始

Adobe Experience Platform Debuggerで Edge Trace を有効にするたびに、アシュランスセッションがバックグラウンドで開始されます。

Debugger のレッスンでこれをおこなう方法を確認します。

1. 次に移動： [Luma デモサイト](https://luma.enablementadobe.com/content/luma/us/en.html) デバッガーを使用して、 [サイトのタグプロパティを独自の開発プロパティに切り替える](validate-with-debugger.md#use-the-experience-platform-debugger-to-map-to-your-tags-property)
1. の左側のナビゲーション **[!UICONTROL Experience Platformデバッガー]** 選択 **[!UICONTROL ログ]**
1. を選択します。 **[!UICONTROL Edge]** 「 」タブで「 」を選択します。 **[!UICONTROL 接続]**

   ![エッジトレースを接続](assets/analytics-debugger-edgeTrace.png)
1. Edge Trace を有効にすると、上部に発信リンクアイコンが表示されます。 アイコンを選択してアシュランスを開きます。 ブラウザーに新しいタブが開きます。

   ![アシュランスセッションを開始](assets/validate-debugger-start-assurnance.png)


### アシュランスインターフェイスからアシュランスセッションを開始する

1. を開きます。 [データ収集インターフェイス](https://experience.adobe.com/#/data-collection/home){target="_blank"}
1. 左側のナビゲーションで「アシュランス」を選択します。
1. 「セッションを作成」を選択します。
1. 開始を選択
1. セッションに名前を付けます（例： ）。 `Luma Web SDK validation`
1. を **[!UICONTROL ベース URL]** 入力 `https://luma.enablementadobe.com/`
1. 次の画面で、「 」を選択します。 **[!UICONTROL リンクをコピー]**
1. アイコンを選択してリンクをクリップボードにコピーします。
1. ブラウザーに URL を貼り付けます。これにより、Luma Web サイトが開き、特別な URL パラメーターが表示されます。 `adb_validation_sessionid` をクリックし、セッションを開始します。
1. アシュランスインターフェイスに、セッションに正常に接続したことを示すメッセージが表示され、アシュランスインターフェイスにイベントがキャプチャされて表示されます。

## Web SDK 実装の現在の状態の検証

実装のこの段階で表示できる情報は限られています。 表示される値の 1 つは、Platform Edge ネットワーク上で生成されるExperience CloudID(ECID) です。

1. イベント応答ハンドルというイベントを含むAdobeを選択します。
1. 右側にメニューが表示されます。 を選択します。 `+` ～の隣に署名する `[!UICONTROL ACPExtensionEvent]`
1. 選択によるドリルダウン `[!UICONTROL payload > 0 > payload > 0 > namespace]`. 最後の `0` は、 `ECID`. は、の下に表示される値によってわかります。 `namespace` 一致 `ECID`

   ![アシュランス検証 ECID](assets/validate-assurance-ecid.png)

   >[!CAUTION]
   >
   >ウィンドウの幅が原因で、ECID 値が切り捨てられている場合があります。 インターフェイスのハンドルバーを選択し、左にドラッグして ECID 全体を表示します。

今後のレッスンでは、アシュランスを使用して、データストリームで有効なAdobeアプリケーションに到達する、完全に処理されたペイロードを検証します。

ページで XDM オブジェクトが実行されるようになりました。また、データ収集の検証方法を知っていれば、Platform Web SDK を使用して個々のAdobeアプリケーションを設定する準備が整いました。

[次へ： ](setup-experience-platform.md)

>[!NOTE]
>
>Adobe Experience Platform Web SDK の学習に時間を割いていただき、ありがとうございます。 ご質問がある場合、一般的なフィードバックを共有したい場合、または今後のコンテンツに関する提案がある場合は、こちらで共有してください [Experience Leagueコミュニティディスカッション投稿](https://experienceleaguecommunities.adobe.com/t5/adobe-experience-platform-launch/tutorial-discussion-implement-adobe-experience-cloud-with-web/td-p/444996)