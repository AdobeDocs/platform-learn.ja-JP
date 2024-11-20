---
title: クエリサービス – はじめに
description: クエリサービス – はじめに
kt: 5342
doc-type: tutorial
exl-id: b8a404d1-7796-46e3-b245-553acdc753ae
source-git-commit: acb941e4ee668248ae0767bb9f4f42e067c181ba
workflow-type: tm+mt
source-wordcount: '645'
ht-degree: 0%

---

# 5.1.1 はじめに

## 5.1.1.1 Adobe Experience Platform UI の理解

[Adobe Experience Platform](https://experience.adobe.com/platform) に移動します。 ログインすると、Adobe Experience Platformのホームページが表示されます。

![データ取得](./../../../modules/datacollection/module1.2/images/home.png)

続行する前に、**サンドボックス** を選択する必要があります。 選択するサンドボックスの名前は ``--aepSandboxName--`` です。 適切な [!UICONTROL  サンドボックス ] を選択すると、画面が変更され、専用の [!UICONTROL  サンドボックス ] が表示されます。

![データ取得](./../../../modules/datacollection/module1.2/images/sb1.png)


## 5.1.1.2 プラットフォームのデータを調べる

様々なチャネルからのデータの取り込みは、どのブランドにとっても難しい作業です。 この演習では、Citi Signal のお客様は、Citi Signal の Web サイトで Citi Signal とエンゲージしています。モバイルアプリでは、Citi Signal の POS システムで購入データが収集され、CRM とロイヤルティデータが保持されます。 Citi Signal は、Adobe AnalyticsとAdobeローンチを使用して、Web サイト、モバイルアプリ、POS システム全体でデータをキャプチャしているので、このデータはすでにAdobe Experience Platformに送られています。 まず、Adobe Experience Platformに既に存在する Citi Signal のすべてのデータを調べることから始めましょう。

左側のメニューの **データセット** に移動します。

![emea-website-interaction-dataset.png](./images/emea-website-interaction-dataset.png)

Citi Signal はデータをAdobe Experience Platformにストリーミングする機能で、このデータは `Demo System - Event Dataset for Website (Global v1.1)` のデータセットで利用できます。 `Demo System - Event Dataset for Website` を検索します。

![emea-callcenter-interaction-dataset.png](./images/emea-website-interaction-dataset1.png)

Citi Signal の Callcenter インタラクションデータは、`Demo System - Event Dataset for Call Center (Global v1.1)` データセットでキャプチャされます。 検索ボックスで `Demo System - Event Dataset for Call Center` データを検索します。 データセットの名前をクリックして開きます。

![emea-callcenter-interaction-dataset.png](./images/emea-callcenter-interaction-dataset.png)

データセットをクリックすると、取り込まれたバッチや失敗したバッチなど、データセットアクティビティの概要が表示されます。

![preview-interaction-dataset.png](./images/preview-interaction-dataset.png)

「**データセットをプレビュー**」をクリックして、データセットに保存されたデータのサンプル `Demo System - Event Dataset for Call Center (Global v1.1)` 表示します。 左のパネルには、このデータセットのスキーマ構造が表示されます。

![explore-interaction-dataset.png](./images/explore-interaction-dataset.png)

**閉じる** ボタンをクリックして、**データセットをプレビュー** ウィンドウを閉じます。

## 5.1.1.3 クエリサービスの概要

Adobe Experience Platform クエリサービスにアクセスするには、左側のメニューで **クエリ** をクリックします。

![select-queries.png](./images/select-queries.png)

**ログ** に移動すると、クエリリスト ページが表示されます。このページには、この組織で実行されたすべてのクエリのリストが表示されます。最新のクエリが上部に表示されます。

![query-list.png](./images/query-list.png)

リストから任意の SQL クエリをクリックして、右側のパネルに表示される詳細を確認します。

![click-sql-query.png](./images/click-sql-query.png)

ウィンドウをスクロールしてクエリ全体を表示するか、下で強調表示されているアイコンをクリックしてクエリ全体をメモ帳にコピーできます。 現在は、クエリをコピーする必要はありません。

![click-copy-query.png](./images/click-copy-query.png)

実行されたクエリだけでなく、このユーザーインターフェイスではクエリから新しいデータセットを作成できます。 これらのデータセットは、Adobe Experience Platformのリアルタイム顧客プロファイルにリンクしたり、Adobe Experience Platform Data Science Workspaceの入力として使用したりできます。

## 5.1.1.4 PSQL クライアントのクエリサービスへの接続

クエリサービスは、PostgreSQL のドライバーを持つクライアントをサポートします。 ここでは、PSQL、コマンドラインインターフェイス、およびPower BIまたは Tableau を使用します。 PSQL に接続しましょう。

**資格情報** をクリックします。

![queries-select-configuration.png](./images/queries-select-configuration.png)

以下の画面が表示されます。 設定画面には、クエリサービスで認証するためのサーバー情報と資格情報が表示されます。 ここでは、PSQL 用の接続コマンドを含む画面の右側を見ていきます。 「コピー」ボタンをクリックして、コマンドをクリップボードにコピーします。

![copy-psql-connection.png](./images/copy-psql-connection.png)

Windows の場合：Windows キーを押して cmd と入力し、コマンドプロンプトの結果をクリックしてコマンドラインを開きます。

![open-command-prompt.png](./images/open-command-prompt.png)

macOSの場合：spotlight 検索を使用して terminal.app を開きます。

![open-terminal-osx.png](./images/open-terminal-osx.png)

クエリサービス UI からコピーした connect コマンドを貼り付け、コマンドプロンプトウィンドウで enter キーを押します。

Windows:

![command-prompt-connected.png](./images/command-prompt-connected.png)

MacOS:

![command-prompt-paste-osx.png](./images/command-prompt-paste-osx.png)

これで、PSQL を使用してクエリサービスに接続しました。

次の演習では、このウィンドウとかなりの相互作用があります。 **PSQL コマンドラインインターフェイス** と呼びます。

これで、クエリの送信を開始する準備が整いました。

次の手順：[5.1.2 クエリサービスの使用 ](./ex2.md)

[モジュール 5.1 に戻る](./query-service.md)

[すべてのモジュールに戻る](../../../overview.md)
