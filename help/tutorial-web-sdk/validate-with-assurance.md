---
title: Experience Platformアシュランスを使用した Web SDK 実装の検証
description: Adobe Experience Platform Assurance を使用して Platform Web SDK 実装を検証する方法を説明します。 このレッスンは、Web SDK を使用したAdobe Experience Cloudの実装チュートリアルの一部です。
feature: Web SDK,Tags,Assurance
exl-id: 31e381ea-fbaf-495f-a6e9-2ff6c0d36939
source-git-commit: 78df0fb4e2f2b56b829c54c08a16f860192592d1
workflow-type: tm+mt
source-wordcount: '609'
ht-degree: 3%

---

# Experience Platformアシュランスを使用した Web SDK 実装の検証

Adobe Experience Platform Assurance は、データの収集方法やエクスペリエンスの提供方法を検査、配達確認、シミュレートおよび検証するのに役立つ機能です。 詳細を読む： [Adobe保証](https://experienceleague.adobe.com/en/docs/experience-platform/assurance/home).


## 学習目標

このレッスンを最後まで学習すると、以下の内容を習得できます。

* Assurance セッションの開始
* Platform Edge Networkとの間で送信されたリクエストの表示

## 前提条件

データ収集タグと [Luma デモサイト](https://luma.enablementadobe.com/content/luma/us/en.html){target="_blank"} そして、チュートリアルの前のレッスンを完了している。

* [XDM スキーマの設定](configure-schemas.md)
* [ID 名前空間の設定](configure-identities.md)
* [データストリームの設定](configure-datastream.md)
* [タグプロパティにインストールされている Web SDK 拡張機能](install-web-sdk.md)
* [データ要素の作成](create-data-elements.md)
* [ID の作成](create-identities.md)
* [タグルールの作成](create-tag-rule.md)
* [デバッガーでの検証](validate-with-debugger.md)


## Assurance セッションの開始と表示

アシュランスセッションを開始する方法はいくつかあります。

### デバッガーでの Assurance セッションの開始

Adobe Experience Platform Debuggerで Edge Trace を有効にするたびに、バックグラウンドでアシュランスセッションが開始されます。

デバッガーのレッスンで、この方法を確認します。

1. に移動します [Luma デモサイト](https://luma.enablementadobe.com/content/luma/us/en.html) デバッガーを使用して次の操作を行います [サイトのタグプロパティを独自の開発プロパティに切り替える](validate-with-debugger.md#use-the-experience-platform-debugger-to-map-to-your-tags-property)
1. の左側のナビゲーションで **[!UICONTROL Experience Platformデバッガー]** 選択 **[!UICONTROL ログ]**
1. 「」を選択します **[!UICONTROL Edge]** tab キーを押して、 **[!UICONTROL 接続]**

   ![Edge Trace の接続](assets/analytics-debugger-edgeTrace.png)
1. Edge Trace を有効にすると、上部に送信リンクアイコンが表示されます。 アイコンを選択して、Assurance を開きます。

   ![Assurance セッションの開始](assets/validate-debugger-start-assurnance.png)

1. Assurance インターフェイスを含む新しいブラウザータブが開きます。

### Assurance インターフェイスからの Assurance セッションの開始

1. を開きます [データ収集インターフェイス](https://experience.adobe.com/#/data-collection/home){target="_blank"}
1. 左側のナビゲーションの「Assurance」を選択します
1. Create Session を選択します。
   ![Assurance セッションの作成](assets/assurance-create-session.png)
1. 開始を選択
1. セッションに名前を付けます。例： `Luma Web SDK validation`
1. として **[!UICONTROL ベース URL]** enter `https://luma.enablementadobe.com/`
   ![Assurance セッションに名前を付ける](assets/assurance-name-session.png)
1. 次の画面で、を選択します。 **[!UICONTROL リンクをコピー]**
1. アイコンを選択して、クリップボードにリンクをコピーします
1. URL をブラウザーに貼り付けます。これにより、特別な URL パラメーターを使用して Luma web サイトが開きます `adb_validation_sessionid` セッションを開始します
1. Assurance インターフェイスには、セッションに正常に接続されたことを示すメッセージが表示され、Assurance インターフェイスで取得されたイベントが表示されます。
   ![Assurance セッションが接続されました](assets/assurance-success.png)

## Web SDK 実装の現在の状態の検証

実装のこの段階では、表示できる情報は限られています。 表示される値の 1 つは、Platform Edge Networkで生成されるExperience CloudID （ECID）です。

1. 「Adobeレスポンス・ハンドル」というイベントを持つ行を選択します。
1. メニューが右側に表示されます。 「」を選択します `+` 次の隣に署名 `[!UICONTROL ACPExtensionEvent]`
1. 次を選択してドリルダウン `[!UICONTROL payload > 0 > payload > 0 > namespace]`. 最後の下に表示される ID `0` 次に対応 `ECID`. 下に表示される値によってわかります `namespace` 一致 `ECID`

   ![Assurance 検証 ECID](assets/validate-assurance-ecid.png)

   >[!CAUTION]
   >
   >ウィンドウの幅が原因で、ECID 値が切り捨てられる場合があります。 インターフェイスのハンドルバーを選択し、左にドラッグするだけで、ECID 全体を表示できます。

今後のレッスンでは、Assurance を使用して、データストリームで有効になっているAdobeアプリケーションに到達する完全に処理されたペイロードを検証します。

XDM オブジェクトがページで実行され、データ収集の検証方法がわかったので、Platform Web SDK を使用してExperience Platformと個々のAdobeアプリケーションを設定する準備が整いました。

[次へ： ](setup-experience-platform.md)

>[!NOTE]
>
>Adobe Experience Platform Web SDK の学習に時間を費やしていただき、ありがとうございます。 ご質問がある場合、一般的なフィードバックを共有したい場合、または将来のコンテンツに関するご提案がある場合は、このページでお知らせください [Experience League コミュニティ ディスカッションの投稿](https://experienceleaguecommunities.adobe.com/t5/adobe-experience-platform-launch/tutorial-discussion-implement-adobe-experience-cloud-with-web/td-p/444996)
