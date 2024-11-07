---
title: クエリサービス – データを使用したPower BIセットの調査
description: クエリサービス – データを使用したPower BIセットの調査
kt: 5342
doc-type: tutorial
source-git-commit: 2cdc145d7f3933ec593db4e6f67b60961a674405
workflow-type: tm+mt
source-wordcount: '313'
ht-degree: 0%

---

# 5.1.5 クエリサービスとPower BI

Microsoft Power BIデスクトップを開きます。

![start-power-bi.png](./images/start-power-bi.png)

**データを取得** をクリックします。

![power-bi-get-data.png](./images/power-bi-get-data.png)

**postgres** （1）を検索し、リストから **Postgres** （2）を選択し、**接続** （3）を選択します。

![power-bi-connect-progress.png](./images/power-bi-connect-progress.png)

Adobe Experience Platform、**クエリ**、**資格情報** に移動します。

![query-service-credentials.png](./images/query-service-credentials.png)

Adobe Experience Platformの **資格情報** ページから **ホスト** をコピーし、「**サーバー**」フィールドに貼り付け、**データベース** をコピーして、PowerBI の「**データベース**」フィールドに貼り付け、「OK」（2）をクリックします。

>[!IMPORTANT]
>
>クエリサービスでは現在、デフォルトの PostgreSQL ポート 5432 を使用していないので、サーバー値の末尾にポート **:80** を含めてください。

![power-bi-connect-server.png](./images/power-bi-connect-server.png)

次のダイアログで、Adobe Experience Platformのクエリの **資格情報** にあるユーザー名とパスワードを、ユーザー名とパスワードに入力します。

![query-service-credentials.png](./images/query-service-credentials.png)

Navigator ダイアログで、検索フィールドに **LDAP** を入力して（1）、CTAS データセットを検索し、それぞれの横にあるチェックボックスをオンにします（2）。 次に、Load （3）をクリックします。

![power-bi-load-churn-data.png](./images/power-bi-load-churn-data.png)

**レポート** タブ（1）が選択されていることを確認します。

![power-bi-report-tab.png](./images/power-bi-report-tab.png)

マップ（1）を選択し、レポートキャンバスに追加したら、マップを拡大します（2）。

![power-bi-select-map.png](./images/power-bi-select-map.png)

次に、測定とディメンションを定義する必要があります。それには、次に示すように、「**フィールド**」セクションから対応するプレースホルダー（「**ビジュアライゼーション**」の下）にフィールドをドラッグします。

![power-bi-drag-lat-lon.png](./images/power-bi-drag-lat-lon.png)

測定として、**customerId** のカウントを使用します。 「**フィールド**」セクションの「**crmid**」フィールドを「**サイズ**」プレースホルダーにドラッグします。

![power-bi-drag-crmid.png](./images/power-bi-drag-crmid.png)

最後に、**callTopic** 分析を行うには、「**callTopic**」フィールドを「**ページレベルフィルター**」プレースホルダーにドラッグします（「**ビジュアライゼーション**」セクションでスクロールする必要がある場合があります）。

![power-bi-drag-calltopic.png](./images/power-bi-drag-calltopic.png)

**callTopics** を選択/選択解除して調査します：

![power-bi-report-select-calltopic.png](./images/power-bi-report-select-calltopic.png)

これで、この演習が完了しました。

次の手順：[5.1.7 クエリサービス API](./ex7.md)

[モジュール 5.1 に戻る](./query-service.md)

[すべてのモジュールに戻る](../../../overview.md)
