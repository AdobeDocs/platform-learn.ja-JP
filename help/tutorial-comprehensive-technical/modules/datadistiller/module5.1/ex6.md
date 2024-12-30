---
title: クエリサービス – データを使用したPower BIセットの調査
description: クエリサービス – データを使用したPower BIセットの調査
kt: 5342
doc-type: tutorial
exl-id: c27abd0e-e563-4702-a243-1aec84ce6116
source-git-commit: f843c50af04d744a7d769f320b5b55a5e6d25ffd
workflow-type: tm+mt
source-wordcount: '313'
ht-degree: 0%

---

# 5.1.6 クエリサービスとPower BI

Microsoft Power BIデスクトップを開きます。

![start-power-bi.png](./images/startpowerbi.png)

**データを取得** をクリックします。

![power-bi-get-data.png](./images/powerbigetdata.png)

**postgres** （1）を検索し、リストから **Postgres** （2）を選択し、**接続** （3）を選択します。

![power-bi-connect-progress.png](./images/powerbiconnectprogress.png)

Adobe Experience Platform、**クエリ**、**資格情報** に移動します。

![query-service-credentials.png](./images/queryservicecredentials.png)

Adobe Experience Platformの **資格情報** ページから **ホスト** をコピーし、「**サーバー**」フィールドに貼り付け、**データベース** をコピーして、PowerBI の「**データベース**」フィールドに貼り付け、「OK」（2）をクリックします。

>[!IMPORTANT]
>
>クエリサービスでは現在、デフォルトの PostgreSQL ポート 5432 を使用していないので、サーバー値の末尾にポート **:80** を含めてください。

![power-bi-connect-server.png](./images/powerbiconnectserver.png)

次のダイアログで、Adobe Experience Platformのクエリの **資格情報** にあるユーザー名とパスワードを、ユーザー名とパスワードに入力します。

![query-service-credentials.png](./images/queryservicecredentials.png)

Navigator ダイアログで、検索フィールドに **LDAP** を入力して（1）、CTAS データセットを検索し、それぞれの横にあるチェックボックスをオンにします（2）。 次に、Load （3）をクリックします。

![power-bi-load-churn-data.png](./images/powerbiloadchurndata.png)

**レポート** タブ（1）が選択されていることを確認します。

![power-bi-report-tab.png](./images/powerbireporttab.png)

マップ（1）を選択し、レポートキャンバスに追加したら、マップを拡大します（2）。

![power-bi-select-map.png](./images/powerbiselectmap.png)

次に、測定とディメンションを定義する必要があります。それには、次に示すように、「**フィールド**」セクションから対応するプレースホルダー（「**ビジュアライゼーション**」の下）にフィールドをドラッグします。

![power-bi-drag-lat-lon.png](./images/powerbidraglatlon.png)

測定として、**customerId** のカウントを使用します。 「**フィールド**」セクションの「**crmid**」フィールドを「**サイズ**」プレースホルダーにドラッグします。

![power-bi-drag-crmid.png](./images/powerbidragcrmid.png)

最後に、**callTopic** 分析を行うには、「**callTopic**」フィールドを「**ページレベルフィルター**」プレースホルダーにドラッグします（「**ビジュアライゼーション**」セクションでスクロールする必要がある場合があります）。

![power-bi-drag-calltopic.png](./images/powerbidragcalltopic.png)

**callTopics** を選択/選択解除して調査します：

![power-bi-report-select-calltopic.png](./images/powerbireportselectcalltopic.png)

これで、この演習が完了しました。

次の手順：[5.1.8 クエリサービス API](./ex8.md)

[モジュール 5.1 に戻る](./query-service.md)

[すべてのモジュールに戻る](../../../overview.md)
