---
title: アプリダウンロード数を追跡するためのデータ要素とルールの作成
description: アプリダウンロード数を追跡するためのデータ要素とルールの作成
feature: Web SDK
role: Developer
level: Intermediate
recommendations: noDisplay,noCatalog
kt: 10447
hide: true
hidefromtoc: true
exl-id: cb322540-e8ef-4226-b537-a67c7ca273f5
source-git-commit: cc7a77c4dd380ae1bc23dc75608e8e2224dfe78c
workflow-type: tm+mt
source-wordcount: '764'
ht-degree: 3%

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

この実装では、(1) データレイヤーの計算済み状態、(2) の内容を含むエクスペリエンスイベントをAdobe Experience Platformに送信します。 `eventInfo`.

これをおこなうには、まず、これら 2 つの情報のチャンクを結合するデータ要素を作成する必要があります。

## データ要素の作成

適切なデータ要素を作成するには、 [!UICONTROL データ要素] をクリックします。 次に、 [!UICONTROL データ要素を追加] リンク。

データ要素名に、と入力します。 `computedStateAndEventInfo`. の [!UICONTROL 拡張] フィールド、選択 [!UICONTROL コア] （まだ選択されていない場合）。 の [!UICONTROL データ要素タイプ] フィールド、選択 [!UICONTROL マージされたオブジェクト]. このデータ要素を使用すると、複数のオブジェクトを深く結合できます。 結合された結果は、データ要素によって返されます。

結合に含める最初のオブジェクトに対して、と入力します。 `%event.fullState%`. が [!UICONTROL プッシュされたデータ] ルールイベントの場合、このイベントは、ルールのトリガー時に計算されたAdobeクライアントデータレイヤーの状態を参照します。

クリック [!UICONTROL 別を追加].

2 つ目のオブジェクトに対して、と入力します。 `%event.eventInfo%`. が [!UICONTROL プッシュされたデータ] ルールイベントの場合は、 `eventInfo` Adobe・クライアント・データ・レイヤーにプッシュされた部分。

![computedStateAndEventInfo データ要素](../../../assets/implementation-strategy/computed-state-and-event-info-data-element.png)

データ要素が完了します。 データ要素を保存するには、 [!UICONTROL 保存] 」ボタンをクリックします。

## ルールの作成

次の項目でのクリック数を追跡するためのルールを作成するには、以下を実行します。 [!UICONTROL アプリをダウンロード] リンク、最初のクリック [!UICONTROL ルール] をクリックします。

「[!UICONTROL Add Rule]」をクリックします。

ルール名に、と入力します。 _アプリのリンクをクリックしたダウンロード_.

## イベントの追加

次をクリック： [!UICONTROL 追加] 下のボタン [!UICONTROL イベント]. これで、がイベントビューに表示されます。 の [!UICONTROL 拡張] フィールド、選択 [!UICONTROL Adobeクライアントデータレイヤー]. の [!UICONTROL イベントタイプ] フィールド、選択 [!UICONTROL プッシュされたデータ].

これは、このルールをトリガーするのは、 `downloadAppClicked` イベントがデータレイヤーにプッシュされた場合は、 [!UICONTROL 特定のイベント] ～のラジオ [!UICONTROL リッスン先] と入力します。 _downloadAppClicked_ に [!UICONTROL 登録するイベント/キー]  表示されるテキストフィールド。

![アプリのクリックイベントをダウンロード](../../../assets/implementation-strategy/download-app-clicked-event.png)

「[!UICONTROL 変更を保存]」をクリックします。

## アクションの追加

ルールビューに戻ったら、 [!UICONTROL 追加] 下のボタン [!UICONTROL アクション]. これで、アクションビューに移動します。 の [!UICONTROL 拡張] フィールド、選択 [!UICONTROL Adobe Experience Platform Web SDK]. の [!UICONTROL アクションタイプ] フィールド、選択 [!UICONTROL イベントを送信].

画面の右側で、を探します。 [!UICONTROL タイプ] フィールドと選択 `web.webinteraction.linkClicks`.

の [!UICONTROL XDM データ] フィールドで、データ要素セレクターボタンをクリックし、 [!UICONTROL computedStateAndEventInfo]. これは先ほど作成したデータ要素です。

（作成した他のルールとは異なり）このルールの場合、 [!UICONTROL ドキュメントはアンロードされます] チェックボックス。 これは、基本的に、ユーザーがリンクをクリックしたときにページから移動することを SDK に通知します。 これは重要です。ユーザーがページから離れても、リクエストはバックグラウンドで実行され続け、サーバーに到達するという方法で SDK がリクエストを実行できるからです。 このチェックボックスをオフにした場合、リクエストはこの方法では実行されず、現在のドキュメントがアンロードされるとキャンセルされる可能性があります。

「いいね このオプションが常に有効になっていないのはなぜですか？」

これは少し複雑ですが、この機能を使用する場合、SDK は、と呼ばれるブラウザーメソッドを使用します。 [`sendBeacon`](https://developer.mozilla.org/ja-JP/docs/Web/API/Navigator/sendBeacon) をクリックしてリクエストを送信します。 を使用してリクエストを送信する場合 `sendBeacon`に値を指定しない場合、ブラウザーは SDK（またはその他）がサーバーから返されたデータにアクセスすることを許可しません。 SDK がリクエストごとにこの機能を使用すると、SDK はサーバーからデータを受け取ることができなくなります。 このため、 [!UICONTROL ドキュメントはアンロードされます] チェックボックスは、現在のドキュメントがアンロードされる場合にのみ有効です。その場合、応答データは破棄できます。

![ドキュメントはチェックボックスをアンロードします](../../../assets/implementation-strategy/document-will-unload.png)

「 [!UICONTROL 変更を保持] 」ボタンをクリックします。

## ルールの保存

これでルールが完了しました。

![アプリリンクのクリック済みルールをダウンロード](../../../assets/implementation-strategy/download-app-link-clicked-rule.png)

「 [!UICONTROL 保存].
