---
title: Experience Platform Assuranceを使用した web SDK実装の検証
description: Adobe Experience Platform アシュランスを使用して Platform Web SDK の実装を検証する方法について説明します。このレッスンは、「Web SDK を使用した Adobe Experience Cloud 実装のチュートリアル」の一部です。
feature: Web SDK,Tags,Assurance
jira: KT-15406
exl-id: 31e381ea-fbaf-495f-a6e9-2ff6c0d36939
source-git-commit: 7ccbaaf4db43921f07c971c485e1460a1a7f0334
workflow-type: tm+mt
source-wordcount: '605'
ht-degree: 7%

---

# Experience Platform Assuranceを使用した web SDK実装の検証

Adobe Experience Platform Assuranceは、データの収集方法やエクスペリエンスの提供方法を検査、配達確認、シミュレートおよび検証するのに役立つ機能です。 詳しくは、[Adobe Assurance](https://experienceleague.adobe.com/ja/docs/experience-platform/assurance/home) を参照してください。


## 学習目標

このレッスンを最後まで学習すると、以下の内容を習得できます。

* Assurance セッションの開始
* Platform Edge Networkとの間で送信されたリクエストの表示

## 前提条件

データ収集タグと [Luma デモサイト ](https://luma.enablementadobe.com/content/luma/us/en.html){target="_blank"} に精通し、チュートリアルの前のレッスンを完了しました。

* [XDM スキーマの設定](configure-schemas.md)
* [ID 名前空間の設定](configure-identities.md)
* [データストリームの設定](configure-datastream.md)
* [タグプロパティにインストールされている web SDK拡張機能](install-web-sdk.md)
* [データ要素の作成](create-data-elements.md)
* [ID の作成](create-identities.md)
* [タグルールの作成](create-tag-rule.md)
* [デバッガーでの検証](validate-with-debugger.md)


## Assurance セッションの開始と表示

Assurance セッションを開始する方法はいくつかあります。

### デバッガーでのAssurance セッションの開始

Adobe Experience Platform DebuggerでEdge Trace を有効にするたびに、バックグラウンドでAssurance セッションが開始されます。

デバッガーのレッスンで、この方法を確認します。

1. [Luma デモサイト ](https://luma.enablementadobe.com/content/luma/us/en.html) に移動し、デバッガーを使用して [ サイトのタグプロパティを独自の開発プロパティに切り替える ](validate-with-debugger.md#use-the-experience-platform-debugger-to-map-to-your-tags-property)
1. **[!UICONTROL Experience Platform Debugger の左側のナビゲーションで]** 「**[!UICONTROL ログ]**」を選択します
1. 「**[!UICONTROL Edge]**」タブを選択し、「**[!UICONTROL 接続]**」を選択します

   ![Connect Edge Trace](assets/analytics-debugger-edgeTrace.png)
1. Edge Trace を有効にすると、上部に送信リンクアイコンが表示されます。 アイコンを選択して、Assuranceを開きます。

   ![Assurance セッションの開始 ](assets/validate-debugger-start-assurnance.png)

1. Assurance インターフェイスが表示された新しいブラウザータブが開きます。

### Assurance インターフェイスからのAssurance セッションの開始

1. [ データ収集インターフェイス ](https://experience.adobe.com/#/data-collection/home){target="_blank"} を開きます。
1. 左側のナビゲーションの「Assurance」を選択します
1. Create Session を選択します。
   ![Assurance セッションの作成 ](assets/assurance-create-session.png)
1. 開始を選択
1. セッションに名前を付けます（例：`Luma Web SDK validation`）。
1. **[!UICONTROL ベース URL]** として、`https://luma.enablementadobe.com/` と入力します
   ![Assurance セッションに名前を付ける ](assets/assurance-name-session.png)
1. 次の画面で、「**[!UICONTROL リンクをコピー]**」を選択します
1. アイコンを選択して、クリップボードにリンクをコピーします
1. URL をブラウザーに貼り付けます。これにより、特別な URL パラメーター `adb_validation_sessionid` を持つ Luma web サイトが開き、セッションが開始されます
1. Assurance インターフェイスには、セッションに正常に接続したことを示すメッセージが表示され、Assurance インターフェイスにキャプチャされたイベントが表示されます。
   ![Assurance セッションが接続されました ](assets/assurance-success.png)

## Web SDK実装の現在の状態の検証

実装のこの段階では、表示できる情報は限られています。 表示される値の 1 つは、Platform Edge Networkで生成されるExperience Cloud ID （ECID）です。

1. `Alloy Response Handle` というイベントを持つ行を選択します。
1. メニューが右側に表示されます。 「`+`」の横にある `[!UICONTROL ACPExtensionEventData]` 記号を選択します
1. `[!UICONTROL payload > 0 > payload > 0 > namespace]` を選択してドリルダウンします。 最後の `0` の下に表示される ID は、`ECID` に対応しています。 一致する `namespace` の下に表示される値によって `ECID` わかります

   ![Assuranceによる ECID の検証 ](assets/validate-assurance-ecid.png)

   >[!CAUTION]
   >
   >ウィンドウの幅が原因で、ECID 値が切り捨てられる場合があります。 インターフェイスのハンドルバーを選択し、左にドラッグするだけで、ECID 全体を表示できます。

今後のレッスンでは、Assuranceを使用して、データストリームで有効になっているAdobe アプリケーションに到達する完全に処理されたペイロードを検証します。

XDM オブジェクトをページで実行し、データ収集の検証方法を理解したので、Platform Web SDKを使用してExperience Platformと個々のAdobe アプリケーションのセットアップを行う準備が整いました。

>[!NOTE]
>
>Adobe Experience Platform Web SDKの学習にご協力いただき、ありがとうございます。 ご不明な点がある場合や、一般的なフィードバックを共有したい場合、または今後のコンテンツに関するご提案がある場合は、この [Experience League Community Discussion の投稿でお知らせください ](https://experienceleaguecommunities.adobe.com/t5/adobe-experience-platform-data/tutorial-discussion-implement-adobe-experience-cloud-with-web/td-p/444996)
