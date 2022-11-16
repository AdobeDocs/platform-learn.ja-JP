---
title: アプリダウンロード数を追跡するためのデータ要素とルールの作成
description: アプリダウンロード数を追跡するためのデータ要素とルールの作成
feature: Web SDK
exl-id: 8012ba48-38ac-4fb5-9876-8f57d1c5da5d
source-git-commit: cc7a77c4dd380ae1bc23dc75608e8e2224dfe78c
workflow-type: tm+mt
source-wordcount: '812'
ht-degree: 4%

---

# アプリダウンロード数を追跡するためのデータ要素とルールの作成

ユーザーが [!UICONTROL アプリをダウンロード] リンクを使用する際、次のようにデータレイヤーにプッシュしました。

```js
window.adobeDataLayer.push({
  "event": "downloadAppClicked",
  "eventInfo": {
    "web": {
      "webInteraction": {
        "URL": "https://example.com/download",
        "name": "App Download",
        "type": "download"
      }
    }
  }
});
```

次を使用した `eventInfo` キー：データレイヤーに対し、イベントと共にこのデータを通信するように指示しますが、 _not_ データレイヤー内でデータを保持します。 リンククリックの場合、クリックされたリンクに関する情報をデータレイヤーに追加すると便利ではありません。これは、後でページ上で発生する他のイベントには適用されないからです。

この実装では、(1) データレイヤーの計算済み状態と (2) の内容の結合結果を含むエクスペリエンスイベントをAdobe Experience Platformに送信します。 `eventInfo`.

これをおこなうには、これら 2 つの情報のチャンクを結合するデータ要素を作成する必要があります。

## データ要素の作成

適切なデータ要素を作成するには、次の手順に従います。

1. クリック [!UICONTROL データ要素] をクリックします。
1. 次に、 [!UICONTROL 新規データ要素の作成] リンク。
1. データ要素名を入力します。 `computedStateAndEventInfo`.
1. の [!UICONTROL 拡張] フィールド、選択 [!UICONTROL コア] （まだ選択されていない場合）。
1. の [!UICONTROL データ要素タイプ] フィールド、選択 **[!UICONTROL マージされたオブジェクト]**. このデータ要素を使用すると、複数のオブジェクトを結合できます。 結合された結果は、データ要素によって返されます。
1. 結合に含める最初のオブジェクトを追加します。 入力 `%event.fullState%` 内 [!UICONTROL オブジェクト（必須）] フィールドに入力します。 が [!UICONTROL プッシュされたデータ] ルールイベントの場合、このイベントは、ルールのトリガー時に計算されたAdobeクライアントデータレイヤーの状態を参照します。
1. 次をクリック：  **[!UICONTROL 別を追加]** コマンドを使用します。
1. 2 つ目のオブジェクトを追加します。 入力 `%event.eventInfo%` 内 [!UICONTROL オブジェクト（必須）] フィールドに入力します。 が [!UICONTROL プッシュされたデータ] ルールイベントの場合は、 `eventInfo` Adobe・クライアント・データ・レイヤーにプッシュされた部分。
1. データ要素を保存するには、 [!UICONTROL 保存] 」ボタンをクリックします。
   ![computedStateAndEventInfo データ要素](../assets/computed-state-and-event-info-data-element.png)

データ要素が完了します。

## ルールの作成

次の項目でのクリック数を追跡するためのルールを作成するには、以下を実行します。 [!UICONTROL アプリをダウンロード] リンク：

1. クリック **[!UICONTROL ルール]** をクリックします。
1. 「**[!UICONTROL Add Rule]**」をクリックします。
1. 入力 **_アプリのリンクをクリックしたダウンロード_** 内 [!UICONTROL 名前] フィールドに入力します。

## イベントの追加

1. 次をクリック： **[!UICONTROL 追加]** 下のボタン [!UICONTROL イベント]. これで、がイベントビューに表示されます。
1. の [!UICONTROL 拡張] フィールド、選択 **[!UICONTROL Adobeクライアントデータレイヤー]**.
1. の [!UICONTROL イベントタイプ] フィールド、選択 **[!UICONTROL プッシュされたデータ]**.
1. 「**[!UICONTROL 変更を保存]**」をクリックします。
   ![アプリのクリックイベントをダウンロード](../assets/download-app-clicked-event.png)
これは、このルールをトリガーするのは、 `downloadAppClicked` イベントがデータレイヤーにプッシュされた場合は、 **[!UICONTROL 特定のイベント]** ～のラジオ [!UICONTROL リッスン先] と入力します。 **_downloadAppClicked_** に [!UICONTROL 登録するイベント/キー]  表示されるテキストフィールド。

## アクションの追加

これで、ルールビューに戻りました。

1. 「**[!UICONTROL アクション]**」の下の「[!UICONTROL 追加]」ボタンをクリックします。
1. これで、アクションビューに移動します。 の [!UICONTROL 拡張] フィールド、選択 **[!UICONTROL Adobe Experience Platform Web SDK]**. の [!UICONTROL アクションタイプ] フィールド、選択 **[!UICONTROL イベントを送信]**.
1. 内 [!UICONTROL タイプ] 右側のフィールドで、「 」を選択します。 `web.webinteraction.linkClicks`.
1. の [!UICONTROL XDM データ] 「 」フィールドで、右側のデータ要素セレクターボタンをクリックし、「 」を選択します。 **[!UICONTROL computedStateAndEventInfo]**. これは最近作成したデータ要素です。
1. （作成した他のルールとは異なり）このルールの場合、 **[!UICONTROL ドキュメントはアンロードされます]** チェックボックス。
   ![ドキュメントはチェックボックスをアンロードします](../assets/document-will-unload.png)
1. 「 **[!UICONTROL 変更を保持]** 」ボタンをクリックします。

>[!TIP]
>
>この [!UICONTROL ドキュメントは機能をアンロードします] ユーザーがリンクをクリックしたときにページから移動したことを SDK に通知します。 リクエストがバックグラウンドで実行され続け、サーバーに到達するので、ユーザーがページから離れても SDK がリクエストを実行できるので、この機能が重要です。 このチェックボックスをオフにした場合、リクエストはこの方法では実行されず、現在のドキュメントがアンロードされるとキャンセルされる可能性があります。
>
>「いいね このオプションが常に有効になっていないのはなぜですか？」
>
>これは少し複雑ですが、この機能を使用する場合、SDK は、と呼ばれるブラウザーメソッドを使用します。 [`sendBeacon`](https://developer.mozilla.org/ja-JP/docs/Web/API/Navigator/sendBeacon) をクリックしてリクエストを送信します。 を使用してリクエストを送信する場合 `sendBeacon`に値を指定しない場合、ブラウザーは SDK（またはその他）がサーバーから返されたデータにアクセスすることを許可しません。 SDK がリクエストごとにこの機能を使用すると、SDK はサーバーからデータを受け取ることができなくなります。 このため、 [!UICONTROL ドキュメントはアンロードされます] チェックボックスは、現在のドキュメントがアンロードされる場合にのみ有効です。その場合、応答データは破棄できます。

## ルールの保存

これでルールが完了しました。

1. クリック **[!UICONTROL 保存]** をクリックします。
   ![アプリリンクのクリック済みルールをダウンロード](../assets/download-app-link-clicked-rule.png)

[次へ： ](publish-the-library.md)

>[!NOTE]
>
>データ収集に関する学習に時間を割いていただき、ありがとうございます。 ご質問がある場合、一般的なフィードバックを共有したい場合、または今後のコンテンツに関する提案がある場合は、こちらで共有してください [Experience Leagueコミュニティディスカッション投稿](https://experienceleaguecommunities.adobe.com/t5/adobe-experience-platform-launch/tutorial-discussion-use-adobe-experience-platform-data/m-p/543877)