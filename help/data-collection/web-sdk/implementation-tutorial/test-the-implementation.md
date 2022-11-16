---
title: 実装のテスト
description: 実装のテスト
role: Developer
level: Intermediate
recommendations: noDisplay,noCatalog
kt: 10447
hide: true
hidefromtoc: true
exl-id: e2213c23-d395-4c57-8c6c-0319cd0fb0ac
source-git-commit: cc7a77c4dd380ae1bc23dc75608e8e2224dfe78c
workflow-type: tm+mt
source-wordcount: '575'
ht-degree: 2%

---

# 実装のテスト

Web ページが設定され、Adobe Experience Platformタグライブラリがデプロイされたので、実装をテストする番です。

ブラウザーで製品ページを開きます。 これをおこなうには、 _ファイル_ その後 _ファイルを開く…_ ブラウザーで、または web サーバー上でページをホストし、適切な URL を入力できます。

ページが読み込まれると、次のように表示されます。

![Web ページ](../../assets/implementation-strategy/webpage.png)

きれいじゃないけど仕事はやる。

## Inspectのページビューイベントと製品ビューイベント

ブラウザーで開発者ツールを開き、ネットワークパネルをクリックします。 ページを更新します。

この時点で、次の 4 つのリクエストが表示されます。

1. product.html - Web ページ。
2. launch-#############-development.js - Launch ライブラリ。
3. interact — サーバーに送信されるページビューイベント。
4. インタラクション — サーバーに送信される製品表示イベント。

各リクエストのペイロードを自由に調べます。 最初の `interact` リクエストの場合、 `eventType` / `web.webpagedetails.pageViews`.

![ページビューリクエストの検査](../../assets/implementation-strategy/webpage-page-viewed-inspection.png)

2 番目の `interact` リクエストの場合、 `eventType` / `commerce.productViews`.

![製品表示要求の検査](../../assets/implementation-strategy/webpage-product-view-inspection.png)

製品情報を含め、送信される残りのデータを自由にポークできます。

## Inspectを開いた買い物かごに追加し、買い物かごイベントに追加

次に、 _買い物かごに追加_ 」ボタンをクリックします。

2 つの追加のリクエストが表示され、最初に `eventType` / `commerce.productListOpens` （新しい買い物かごを開くために）、2 つ目は `eventType` / `commerce.productListAdds` （製品を買い物かごに追加する場合）。

## Inspectアプリのダウンロードリンククリックイベント

ブラウザーによっては、現在のページから移動するリンクをクリックすると、ネットワークパネルがクリアされる場合があります。 ページから移動する直前に発生したリンククリックイベントのネットワークリクエストを調べたいので、ページ間のネットワークログを保持するようにブラウザーを設定する必要があります。 これは、 _ログを保持_ 」チェックボックスをオンにするか、歯車アイコンをクリックして _ログを保持_ 表示されたメニューの項目 (Firefox)

次に、 _アプリをダウンロード_ リンク。

もう 1 つ表示されます `interact` リクエストがネットワークパネルに表示されます。 リクエストを調べると、 `eventType` / `web.webinteraction.linkClicks` と、クリックされたリンクに関する詳細。

## データがAdobe Experience Platformデータセットに届くことを確認します

リクエストが送信されたので、作成したAdobe Experience Platformデータセットにデータが安全に到着したかどうかも確認する必要があります。 最初に、 [!UICONTROL データセット] Adobe Experience Platform内で表示

以前に作成したデータセットを選択します。

数分待つ必要が生じる場合がありますが、すぐに、データが処理され、データセットに挿入されていることを示す表示が表示されます。 また、処理が成功したか失敗したかも確認する必要があります。 失敗した場合は、失敗の理由を確認できます。 通常、送信するデータがスキーマと一致しないので、エラーが発生します。その理由は、データまたはスキーマを適宜調整する必要があるからです。

![データセットの取り込み](../../assets/implementation-strategy/dataset-ingestion.png)

## Adobe Experience Platform Debugger 拡張機能の使用

ブラウザーとAdobeーサーバーの両方での実装の動作に関する詳細については、 Adobe Experience Platform Debugger ブラウザー拡張機能を参照してください。

[Chrome 用Adobe Experience Platform Debugger 拡張機能](https://chrome.google.com/webstore/detail/adobe-experience-platform/bfnnokhpnncpkdmbokanobigaccjkpob)

[Firefox 用Adobe Experience Platform Debugger 拡張機能](https://addons.mozilla.org/ja/firefox/addon/adobe-experience-platform-dbg/)
