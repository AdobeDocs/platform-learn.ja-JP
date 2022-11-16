---
title: 実装のテスト
description: 実装のテスト
exl-id: 66eb1d4e-32eb-45fc-8da4-8d3c04dc3c7a
source-git-commit: cc7a77c4dd380ae1bc23dc75608e8e2224dfe78c
workflow-type: tm+mt
source-wordcount: '599'
ht-degree: 2%

---

# 実装のテスト

Web ページが設定され、Adobe Experience Platformタグライブラリがデプロイされたので、実装をテストする番です。

1. ブラウザーで製品ページを開きます。 これをおこなうには、 _ファイル_ その後 _ファイルを開く…_ ブラウザーで、または web サーバー上でページをホストし、適切な URL を入力できます。

ページが読み込まれると、次のように表示されます。
![Web ページ](assets/webpage.png)

きれいじゃないけど仕事はやる。

## Inspectのページビューイベントと製品ビューイベント

1. ブラウザーで開発者ツールを開き、ネットワークパネルをクリックします。 ページを更新します。
この時点で、次の 4 つのリクエストが表示されます。
* product.html - Web ページ。
* launch-#############-development.js - Launch ライブラリ。
* interact — サーバーに送信されるページビューイベント。
* インタラクション — サーバーに送信される製品表示イベント。
Inspectの各リクエストのペイロード：
1. 最初の `interact` リクエストの場合、 `eventType` / `web.webpagedetails.pageViews`.
   ![ページビューリクエストの検査](assets/webpage-page-viewed-inspection.png)
1. 2 番目の `interact` リクエストの場合、 `eventType` / `commerce.productViews`.
   ![製品表示要求の検査](assets/webpage-product-view-inspection.png)
1. 製品情報など、送信される残りのデータを確認します。

## Inspectを開いた買い物かごに追加し、買い物かごイベントに追加

1. 次に、**_買い物かごに追加_**ボタン。

2 つの追加のリクエストが表示され、最初に `eventType` / `commerce.productListOpens` （新しい買い物かごを開くために）、2 つ目は `eventType` / `commerce.productListAdds` （製品を買い物かごに追加する場合）。

## Inspectアプリのダウンロードリンククリックイベント

ブラウザーによっては、現在のページから移動するリンクをクリックすると、ネットワークパネルがクリアされる場合があります。 ページから移動する直前に発生したリンククリックイベントのネットワークリクエストを調べたいので、ページ間のネットワークログを保持するようにブラウザーを設定する必要があります。

1. ネットワークログを保持するには、 **_ログを保持_** 」チェックボックスをオンにするか、歯車アイコンをクリックして **_ログを保持_** 表示されたメニューの項目 (Firefox)
1. 次をクリック： **_アプリをダウンロード_** リンク。 もう 1 つ表示されます `interact` リクエストがネットワークパネルに表示されます。
1. を使用してリクエストを見つけます。 `eventType` / `web.webinteraction.linkClicks`をクリックし、クリックされたリンクの詳細を確認します。

## データがAdobe Experience Platformデータセットに届くことを確認します

リクエストが送信されたので、作成したAdobe Experience Platformデータセットにデータが安全に到着しているかどうかを確認します。

1. 次に移動： **[!UICONTROL データセット]** Adobe Experience Platform内で表示
1. を選択します。 [データセット](configure-the-server/create-a-dataset.md) このチュートリアルで作成した
数分待つ必要が生じる場合がありますが、すぐに、データが処理され、データセットに挿入されていることを示す表示が表示されます。 また、処理が成功したか失敗したかも確認する必要があります。 失敗した場合は、失敗の理由がわかります。 通常、送信するデータがスキーマと一致せず、それに応じてデータまたはスキーマを調整する必要があるので、エラーが発生します。
   ![データセットの取り込み](assets/dataset-ingestion.png)

## Adobe Experience Platform Debugger 拡張機能の使用

ブラウザーとAdobeーサーバーの両方での実装の動作に関する詳細については、 Adobe Experience Platform Debugger ブラウザー拡張機能を参照してください。

[Chrome 用Adobe Experience Platform Debugger 拡張機能](https://chrome.google.com/webstore/detail/adobe-experience-platform/bfnnokhpnncpkdmbokanobigaccjkpob)

[Firefox 用Adobe Experience Platform Debugger 拡張機能](https://addons.mozilla.org/ja/firefox/addon/adobe-experience-platform-dbg/)

[次へ： ](summary.md)

>[!NOTE]
>
>データ収集に関する学習に時間を割いていただき、ありがとうございます。 ご質問がある場合、一般的なフィードバックを共有したい場合、または今後のコンテンツに関する提案がある場合は、こちらで共有してください [Experience Leagueコミュニティディスカッション投稿](https://experienceleaguecommunities.adobe.com/t5/adobe-experience-platform-launch/tutorial-discussion-use-adobe-experience-platform-data/m-p/543877)