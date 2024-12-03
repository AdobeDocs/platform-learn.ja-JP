---
title: クエリサービス - Tableau でのデータセットの調査
description: クエリサービス - Tableau でのデータセットの調査
kt: 5342
doc-type: tutorial
exl-id: 29525740-fe1f-4770-bcc9-f2ad499a2cb5
source-git-commit: b53ee64ae8438b8f48f842ed1f44ee7ef3e813fc
workflow-type: tm+mt
source-wordcount: '336'
ht-degree: 0%

---

# 5.1.7 クエリサービスと Tableau

Tableau を開きます。

![start-tableau.png](./images/start-tableau.png)

**サーバーへの接続** で **PostgreSQL** を選択します。

![tableau-connect-postgress.png](./images/tableau-connect-postgress.png)

Adobe Experience Platform、**クエリ**、**資格情報** に移動します。

![query-service-credentials.png](./images/query-service-credentials.png)

Adobe Experience Platformの **資格情報** ページから **Host** をコピーし、**Server** フィールドに貼り付け、**Database** をコピーして、Tableau の **Database** フィールドに貼り付け、**Port** をコピーして、Tableau の **Port** フィールドに貼り付けます。**Username** と **Password** に対しても同じ操作を行います。 次に、「**ログイン**」をクリックします。

ログイン：

![tableau-connection-dialog.png](./images/tableau-connection-dialog.png)

検索（1）をクリックして **ldap** を検索フィールドに入力し、結果セットからテーブルを特定して（3）そのテーブルを **ここにテーブルをドラッグ** という名前の場所にドラッグします。 終了したら、**シート 1** （3）をクリックします。

![tableau-drag-table.png](./images/tableau-drag-table.png)

地図上でデータを視覚化するには、経度と緯度を寸法に変換する必要があります。 **測定** で「**緯度** （1）」を選択し、フィールドのドロップダウンを開いて、「**Dimensionに変換** （2）」を選択します。 「経度 **の測定に対しても同じ操作を行** ます。

![tableau-convert-dimension.png](./images/tableau-convert-dimension.png)

**経度** メジャーを **列** にドラッグし、**緯度** メジャーを **行** にドラッグします。 自動的に **ベルギー** の地図が表示され、データセット内の都市を表す小さなドットが表示されます。

![tableau-drag-lon-lat.png](./images/tableau-drag-lon-lat.png)

**メジャー名** （1）を選択し、ドロップダウンを開いて **シートに追加** （2）を選択します。

![tableau-select-measure-names.png](./images/tableau-select-measure-names.png)

さまざまなサイズのドットを含むマップが表示されます。 このサイズは、その特定の都市のコールセンターインタラクションの数を示します。 ドットのサイズを変更するには、右側のパネルに移動して **値を測定** を開きます（ドロップダウンアイコンを使用）。 ドロップダウンリストから **サイズを編集** を選択します。 さまざまなサイズで遊び回ります。

![tableau-vary-size-dots.png](./images/tableau-vary-size-dots.png)

**通話トピック** ごとのデータをさらに表示するには、（1） **通話トピック** ディメンションを **ページ** にドラッグします。 画面の右側にある **通話トピック** （2）を使用して、様々な **通話トピック** を移動します。

![tableau-call-topic-navigation.png](./images/tableau-call-topic-navigation.png)

これで、この演習が完了しました。

次の手順：[5.1.8 クエリサービス API](./ex8.md)

[モジュール 5.1 に戻る](./query-service.md)

[すべてのモジュールに戻る](../../../overview.md)
