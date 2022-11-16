---
title: クエリサービス — はじめに
description: クエリサービス — はじめに
kt: 5342
audience: Data Engineer, Data Architect, Data Analyst, BI Expert
doc-type: tutorial
activity: develop
exl-id: dae257d2-8c94-4558-b9ce-eca38a88667b
source-git-commit: cc7a77c4dd380ae1bc23dc75608e8e2224dfe78c
workflow-type: tm+mt
source-wordcount: '657'
ht-degree: 1%

---

# 4.1 はじめに

## 4.1.1 Adobe Experience Platform UI の理解

に移動します。 [Adobe Experience Platform](https://experience.adobe.com/platform). ログイン後、Adobe Experience Platformのホームページに移動します。

![データ取得](../module2/images/home.png)

続行する前に、 **サンドボックス**. 選択するサンドボックスの名前はです ``--module7sandbox--``. これを行うには、 **[!UICONTROL 実稼動版]** 画面の上の青い線で表示されます。 適切な [!UICONTROL サンドボックス]画面が変更され、専用の [!UICONTROL サンドボックス].

![データ取得](../module2/images/sb1.png)


## 4.1.2 プラットフォームでのデータの調査

様々なチャネルからデータを取り込むことは、どのブランドにとっても大変な作業です。 この練習では、Citi Signal の顧客は Web サイト上の Citi Signal とエンゲージし、モバイルアプリ上で、購入データは Citi Signal の Point of Sale システムによって収集され、CRM と Loyalty のデータを持っています。 Citi Signal はAdobe AnalyticsとAdobeLaunch を使用して、Web サイト、モバイルアプリ、POS システム全体のデータをキャプチャしているので、このデータは既にAdobe Experience Platformに送られています。 まず、Adobe Experience Platformに既に存在する Citi Signal のすべてのデータを調べてみましょう。

左側のメニューで、に移動します。 **データセット**.

![emea-website-interaction-dataset.png](./images/emea-website-interaction-dataset.png)

Citi Signal は、Adobe Experience Platformにデータをストリーミングしています。このデータは、 `Demo System - Event Dataset for Website (Global v1.1)` データセット。 `Demo System - Event Dataset for Website` を検索します。

![emea-callcenter-interaction-dataset.png](./images/emea-website-interaction-dataset1.png)

Citi Signal の Callcenter インタラクションデータは、 `Demo System - Event Dataset for Call Center (Global v1.1)` データセット。 を検索 `Demo System - Event Dataset for Call Center` 検索ボックスのデータ。 データセットの名前をクリックして開きます。

![emea-callcenter-interaction-dataset.png](./images/emea-callcenter-interaction-dataset.png)

データセットをクリックすると、取り込まれたバッチや失敗したバッチなど、データセットのアクティビティの概要が表示されます。

![preview-interaction-dataset.png](./images/preview-interaction-dataset.png)

クリック **データセットをプレビュー** に保存されているデータのサンプルを確認するには、以下の手順に従ってください。 `Demo System - Event Dataset for Call Center (Global v1.1)` データセット。 左側のパネルには、このデータセットのスキーマ構造が表示されます。

![explore-interaction-dataset.png](./images/explore-interaction-dataset.png)

次をクリック： **閉じる** ボタンをクリックして閉じます。 **データセットをプレビュー** ウィンドウ

## 4.1.3 クエリサービスの概要

Adobe Experience Platformクエリサービスには、 **クエリ** をクリックします。

![select-querys.png](./images/select-queries.png)

次に移動して、 **ログ** 「クエリリスト」ページが表示され、この組織で実行したすべてのクエリのリストと、最新のクエリが上部に表示されます。

![query-list.png](./images/query-list.png)

リストで任意の SQL クエリをクリックし、右側のパネルに表示される詳細を確認します。

![click-sql-query.png](./images/click-sql-query.png)

ウィンドウをスクロールしてクエリ全体を表示するか、下のハイライト表示されたアイコンをクリックしてクエリ全体をメモ帳にコピーします。 現時点では、クエリをコピーする必要はありません。

![click-copy-query.png](./images/click-copy-query.png)

実行されたクエリだけを表示することはできません。このユーザーインターフェイスを使用すると、クエリから新しいデータセットを作成できます。 これらのデータセットは、Adobe Experience Platformを使用するリアルタイム顧客プロファイルにリンクすることも、Adobe Experience Platform Data Science Workspace の入力として使用することもできます。

## 4.1.4 PSQL クライアントをクエリサービスに接続する

クエリサービスは、PostgreSQL 用のドライバーを持つクライアントをサポートします。 ここでは、PSQL、コマンドラインインターフェイス、Power BI、Tableau を使用します。 PSQL に接続しましょう。

クリック **資格情報**.

![querys-select-configuration.png](./images/queries-select-configuration.png)

次の画面が表示されます。 設定画面には、クエリサービスを認証するためのサーバー情報と資格情報が表示されます。 ここでは、PSQL 用の connect コマンドを含む画面の右側に焦点を当てます。 「コピー」ボタンをクリックして、コマンドをクリップボードにコピーします。

![copy-psql-connection.png](./images/copy-psql-connection.png)

Windows の場合：Windows キーを押して cmd と入力し、コマンドプロンプトの結果をクリックして、コマンドラインを開きます。

![open-command-prompt.png](./images/open-command-prompt.png)

macOSの場合：スポットライト検索で terminal.app を開きます。

![open-terminal-osx.png](./images/open-terminal-osx.png)

クエリサービス UI からコピーした接続コマンドを貼り付け、コマンドプロンプトウィンドウで Enter キーを押します。

Windows:

![command-prompt-connected.png](./images/command-prompt-connected.png)

MacOS:

![command-prompt-paste-osx.png](./images/command-prompt-paste-osx.png)

これで、PSQL を使用してクエリサービスに接続しました。

次の演習では、このウィンドウとのかなりの相互作用があります。 私たちは、それをあなたのとして参照します **PSQL コマンドラインインターフェイス**.

これで、クエリの送信を開始する準備が整いました。

次のステップ： [4.2 クエリサービスの使用](./ex2.md)

[モジュール 4 に戻る](./query-service.md)

[すべてのモジュールに戻る](../../overview.md)
