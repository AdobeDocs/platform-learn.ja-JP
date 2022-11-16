---
title: ページビューとコマースイベントを追跡するためのルールの作成
description: ページビューとコマースイベントを追跡するためのルールの作成
role: Developer
level: Intermediate
recommendations: noDisplay,noCatalog
kt: 10447
hide: true
hidefromtoc: true
exl-id: 2dd02462-ddb5-4f67-8b0f-4a5bf5f7d655
source-git-commit: cc7a77c4dd380ae1bc23dc75608e8e2224dfe78c
workflow-type: tm+mt
source-wordcount: '510'
ht-degree: 2%

---

# ページビューとコマースイベントを追跡するためのルールの作成

ユーザーが製品ページを表示したことを追跡するには、Adobe Experience Platformタグ内にルールを作成します。 これをおこなうには、 [!UICONTROL ルール] 左側のメニューで、 [!UICONTROL ルールを追加].

ルール名に、と入力します。 _閲覧されたページ_.

## イベントの追加

次をクリック： [!UICONTROL 追加] 下のボタン [!UICONTROL イベント]. これで、がイベントビューに表示されます。 の [!UICONTROL 拡張] フィールド、選択 [!UICONTROL Adobeクライアントデータレイヤー]. の [!UICONTROL イベントタイプ] フィールド、選択 [!UICONTROL プッシュされたデータ].

これは、このルールをトリガーするのは、 `pageViewed` イベントがデータレイヤーにプッシュされた場合は、「 [!UICONTROL 特定のイベント] under [!UICONTROL リッスン先] と入力します。 _pageViewed_ に [!UICONTROL 登録するイベント/キー] テキストフィールド。

![ページ表示イベント](../../../assets/implementation-strategy/page-viewed-event.png)

「[!UICONTROL 変更を保存]」をクリックします。

## アクションの追加

ルールビューに戻ったら、 [!UICONTROL 追加] 下のボタン [!UICONTROL アクション]. これで、アクションビューに移動します。 の [!UICONTROL 拡張] フィールド、選択 [!UICONTROL Adobe Experience Platform Web SDK]. の [!UICONTROL アクションタイプ] フィールド、選択 [!UICONTROL イベントを送信]. このアクションを使用すると、エクスペリエンスイベントをAdobe Experience Platform Edge Network に送信できます。

画面の右側で、を探します。 [!UICONTROL タイプ] フィールドと選択 `web.webpagedetails.pageViews`. これは、Adobe Experience Platformで標準で提供されるエクスペリエンスイベントタイプの 1 つです。 ページビューを表します。

の [!UICONTROL XDM データ] フィールドに入力 `%event.fullState%`. これは、ルールのトリガー時に取り込まれる、データレイヤーの計算済みの状態（フル状態とも呼ばれます）を、エクスペリエンスイベントの一部として送信する必要があることを示しています。

![表示されたページアクション](../../../assets/implementation-strategy/page-viewed-action.png)

Web サイトからデータレイヤーにプッシュしたデータが XDM スキーマに適合していない場合、またはデータレイヤーの計算済み状態の一部のみを送信する場合は、 [!UICONTROL XDM オブジェクト] (Adobe Experience Platform Web SDK 拡張機能によって提供される ) データ要素のタイプで、スキーマに適した適切なオブジェクトを作成します。

次をクリック： [!UICONTROL 変更を保持] 」ボタンをクリックします。

## ルールの保存

これでルールが完了しました。

![ページ表示ルール](../../../assets/implementation-strategy/page-viewed-rule.png)

「 [!UICONTROL 保存].

## プロセスを繰り返します。

上記の手順を繰り返して、製品が表示され、買い物かごが開かれ、製品が買い物かごに追加される際のルールを作成します。 ルール間の唯一の違いは、ルール名 ( [!UICONTROL 登録するイベント/キー] フィールド [!UICONTROL プッシュされたデータ] イベント、および [!UICONTROL タイプ] フィールド [!UICONTROL イベントを送信] アクション。 各ルールの値を次に示します。

製品表示済みルール：

* **ルール名**: _表示された製品_
* **登録するイベント/キー** 範囲 [!UICONTROL プッシュされたデータ] イベント： `productViewed`
* **タイプ** 範囲 [!UICONTROL イベントを送信] アクション： `commerce.productViews`

買い物かごの開封ルール：

* **ルール名**: _買い物かごを開いた_
* **登録するイベント/キー** 範囲 [!UICONTROL プッシュされたデータ] イベント： `cartOpened`
* **タイプ** 範囲 [!UICONTROL イベントを送信] アクション： `commerce.productListOpens`

買い物かごに追加された製品のルール：

* **ルール名**: _買い物かごに追加された製品_
* **登録するイベント/キー** 範囲 [!UICONTROL プッシュされたデータ] イベント： `productAddedToCart`
* **タイプ** 範囲 [!UICONTROL イベントを送信] アクション： `commerce.productListAdds`

次に、 [!UICONTROL アプリをダウンロード] リンク。
