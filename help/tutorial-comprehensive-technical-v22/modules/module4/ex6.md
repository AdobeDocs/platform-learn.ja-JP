---
title: クエリサービス — Tableau を使用したデータセットの調査
description: クエリサービス — Tableau を使用したデータセットの調査
kt: 5342
audience: Data Engineer, Data Architect, Data Analyst, BI Expert
doc-type: tutorial
activity: develop
exl-id: 04209eb4-b054-4a2e-885e-61f601c3fc2c
source-git-commit: cc7a77c4dd380ae1bc23dc75608e8e2224dfe78c
workflow-type: tm+mt
source-wordcount: '321'
ht-degree: 0%

---

# 4.6 クエリサービスと Tableau

Tableau を開きます。

![start-tableau.png](./images/start-tableau.png)

In **サーバーに接続** 選択 **PostgreSQL**:

![tableau-connect-postgress.png](./images/tableau-connect-postgress.png)

Adobe Experience Platformに移動し、 **クエリ** および **資格情報**.

![query-service-credentials.png](./images/query-service-credentials.png)

次の **資格情報** Adobe Experience Platformのページで、 **ホスト** をクリックし、 **サーバー** フィールド、 **データベース** をクリックし、 **データベース** Tableau のフィールドで、 **ポート** 「 」フィールドに貼り付けます。 **ポート** Tableau では、 **ユーザー名** および **パスワード**. 次に、「 **ログイン**.

ログイン：

![tableau-connection-dialog.png](./images/tableau-connection-dialog.png)

検索 (1) をクリックし、 **ldap** 検索フィールドに、結果セットからテーブルを特定し、(3) という名前の場所にドラッグします。 **ここにテーブルをドラッグ**. 終了したら、 **シート 1** (3)

![tableau-drag-table.png](./images/tableau-drag-table.png)

マップ上のデータを視覚化するには、経度と緯度をディメンションに変換する必要があります。 In **測定** 選択 **緯度** (1) をクリックし、フィールドのドロップダウンを開いて、 **変換Dimension** (2) 同様に、 **経度** 測定。

![tableau-convert-dimension.png](./images/tableau-convert-dimension.png)

次をドラッグ： **経度** 対する措置 **列** そして **緯度** ～を測る **行**. 自動的に **ベルギー** は、出力データセット内の市区町村を表す小さなドットで表示されます。

![tableau-drag-lon-lat.png](./images/tableau-drag-lon-lat.png)

選択 **測定名** (1) ドロップダウンを開き、 **シートに追加** (2):

![tableau-select-measure-names.png](./images/tableau-select-measure-names.png)

様々なサイズのドットを含むマップが表示されます。 サイズは、その特定の都市でのコールセンターとのやり取りの数を示します。 ドットのサイズを変更するには、右側のパネルに移動して、 **測定値** （ドロップダウンアイコンを使用）。 ドロップダウンリストから、を選択します。 **サイズを編集**. 様々なサイズで遊びます。

![tableau-vary-size-dots.png](./images/tableau-vary-size-dots.png)

次の単位のデータをさらに表示するには： **トピックを呼び出し**、 (1) **トピックを呼び出し** 次元を～に **ページ**. 異なる **通話トピック** の使用 **トピックを呼び出し** (2) 画面の右側で、次の操作を行います。

![tableau-call-topic-navigation.png](./images/tableau-call-topic-navigation.png)

これで、この練習が完了しました。

次のステップ： [4.7 クエリサービス API](./ex7.md)

[モジュール 4 に戻る](./query-service.md)

[すべてのモジュールに戻る](../../overview.md)
