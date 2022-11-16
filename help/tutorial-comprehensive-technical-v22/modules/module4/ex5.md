---
title: クエリサービス —Power BIを使用したデータセットの調査
description: クエリサービス —Power BIを使用したデータセットの調査
kt: 5342
audience: Data Engineer, Data Architect, Data Analyst, BI Expert
doc-type: tutorial
activity: develop
exl-id: 0f9e6719-056b-4858-8c86-04b3beaa950e
source-git-commit: cc7a77c4dd380ae1bc23dc75608e8e2224dfe78c
workflow-type: tm+mt
source-wordcount: '296'
ht-degree: 0%

---

# 4.5 クエリサービスとPower BI

Microsoft DesktopPower BIを開きます。

![start-power-bi.png](./images/start-power-bi.png)

クリック **データの取得**.

![power-bi-get-data.png](./images/power-bi-get-data.png)

を検索 **postgres** (1) を選択します。 **Postgres** (2) リストから、および **接続** (3)

![power-bi-connect-progress.png](./images/power-bi-connect-progress.png)

Adobe Experience Platformに移動し、 **クエリ** および **資格情報**.

![query-service-credentials.png](./images/query-service-credentials.png)

次の **資格情報** Adobe Experience Platformのページで、 **ホスト** をクリックし、 **サーバー** フィールドに値を入力し、 **データベース** をクリックし、 **データベース** フィールドに PowerBI を入力し、「 OK 」(2) をクリックします。

>[!IMPORTANT]
>
>ポートを必ず含める **:80** クエリサービスは現在 5432 のデフォルト PostgreSQL ポートを使用していないので、Server 値の終わりにを追加します。

![power-bi-connect-server.png](./images/power-bi-connect-server.png)

次のダイアログで、ユーザー名とパスワードに、 **資格情報** Adobe Experience Platformのクエリ数。

![query-service-credentials.png](./images/query-service-credentials.png)

ナビゲータダイアログで、 **LDAP** 検索フィールド (1) で CTAS データセットを探し、各 (2) の横のボックスをオンにします。 次に、[ ロード ] (3) をクリックします。

![power-bi-load-churn-data.png](./images/power-bi-load-churn-data.png)

次を確認します。 **レポート** タブ (1) が選択されます。

![power-bi-report-tab.png](./images/power-bi-report-tab.png)

マップ (1) を選択し、レポートキャンバスに追加した後、マップを拡大します (2)。

![power-bi-select-map.png](./images/power-bi-select-map.png)

次に、測定とディメンションを定義する必要があります。それには、 **フィールド** セクションを対応するプレースホルダー ( **ビジュアライゼーション**) を以下に示します。

![power-bi-drag-lat-lon.png](./images/power-bi-drag-lat-lon.png)

測定として、 **customerId**. 次をドラッグ： **crmid** フィールド **フィールド** セクションを **サイズ** プレースホルダー：

![power-bi-drag-crmid.png](./images/power-bi-drag-crmid.png)

最後に、 **callTopic** 分析、 **callTopic** フィールドを **ページレベルフィルター** プレースホルダー ( **ビジュアライゼーション** （セクション）

![power-bi-drag-calltopic.png](./images/power-bi-drag-calltopic.png)

選択/選択解除 **callTopics** 調査する手順は次のとおりです。

![power-bi-report-select-calltopic.png](./images/power-bi-report-select-calltopic.png)

これで、この練習が完了しました。

次のステップ： [4.7 クエリサービス API](./ex7.md)

[モジュール 4 に戻る](./query-service.md)

[すべてのモジュールに戻る](../../overview.md)
