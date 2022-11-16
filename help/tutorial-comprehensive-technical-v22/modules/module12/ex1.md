---
title: BigQuery ソースコネクタを使用したAdobe Experience PlatformでのGoogle Analyticsデータの取り込みと分析 — Google Cloud Platform アカウントの作成
description: BigQuery ソースコネクタを使用したAdobe Experience PlatformでのGoogle Analyticsデータの取り込みと分析 — Google Cloud Platform アカウントの作成
kt: 5342
audience: Data Engineer, Data Architect, Data Analyst
doc-type: tutorial
activity: develop
exl-id: 632ff2fe-ae56-4481-b281-c11224b18639
source-git-commit: cc7a77c4dd380ae1bc23dc75608e8e2224dfe78c
workflow-type: tm+mt
source-wordcount: '654'
ht-degree: 2%

---

# 12.1 Google Cloud Platform アカウントの作成

## 目標

- Google Cloud Platform アカウントの作成
- Google Cloud Platform コンソールについて
- BigQuery プロジェクトを作成し、準備します

## 12.1.1 Google BigQuery をAdobe Experience Platformに接続してGoogle Analyticsデータを取得する理由

Google Cloud Platform(GCP) は、Googleが提供するパブリッククラウドコンピューティングサービスのスイートです。 Google Cloud Platform には、Googleハードウェア上で実行されるコンピューティング、ストレージ、アプリケーション開発のための様々なホストサービスが含まれています。

BigQuery はこれらのサービスの 1 つで、常にGoogle Analytics360 に含まれます。 Google Analyticsデータは、データを直接取得しようとすると（API など）頻繁にサンプリングされます。 そのため、Googleには BigQuery が含まれていて、未サンプリングのデータを取得できるので、ブランドは SQL を使用して高度な分析を行い、GCP の機能を活用できます。

Google Analyticsデータは、バッチメカニズムを使用して BigQuery に毎日読み込まれます。 したがって、リアルタイムのパーソナライゼーションおよびアクティベーションの使用例にこの GCP/BigQuery 統合を使用しても意味がありません。

Google Analyticsデータに基づいてリアルタイムのパーソナライゼーションのユースケースを配信したい場合は、Google Tag Manager を使用して Web サイトでそのデータを収集し、リアルタイムでAdobe Experience Platformにストリーミングできます。

GCP/BigQuery ソースコネクタは、次の目的で使用する必要があります…

- web サイト上のすべての顧客行動を追跡し、リアルタイムのアクティベーションを必要としない分析、データサイエンス、パーソナライゼーションのユースケースのために、Adobe Experience Platformに読み込みます。
- Google Analyticsの履歴データをAdobe Experience Platformに読み込み、分析およびデータサイエンスの使用例に再び使用します。

## 12.1.2 Googleアカウントの作成

Google Cloud Platform アカウントを取得するには、Googleアカウントが必要です。

## 12.1.3 Google Cloud Platform アカウントのアクティベート

これで、Googleアカウントが作成されたので、Google Cloud Platform 環境を作成できます。 それには、に移動します。 [https://console.cloud.google.com/](https://console.cloud.google.com/).

次のページで、利用条件に同意します。

![デモ](./images/ex1/1.png)

次に、 **プロジェクトを選択**.

![デモ](./images/ex1/2.png)

クリック **新規プロジェクト**.

![デモ](./images/ex1/createproject.png)

この命名規則に従って、プロジェクトに名前を付けます。

| 規則 | 例 |
| ----------------- |-------------| 
| `--demoProfileLdap---googlecloud` | 大声で |

![デモ](./images/ex1/3.png)

「**作成**」をクリックします。

![デモ](./images/ex1/3-1.png)

作成が完了したことが画面の右上に通知されるまで待ちます。 次に、 **プロジェクトを表示**.

![デモ](./images/ex1/4.png)

次に、画面上部の検索バーに移動して、「 」と入力します。 **BigQuery**. 最初の結果を選択します。

![デモ](./images/ex1/7.png)

その後、BigQuery コンソールにリダイレクトされ、ポップアップメッセージが表示されます。

**「完了**」をクリックします。

![デモ](./images/ex1/5.png)

このモジュールの目的は、Google AnalyticsデータをAdobe Experience Platformに取り込むことです。 そのためには、まずGoogle Analyticsデータセットにダミーデータが必要です。

クリック **データを追加** 左側のメニューで、をクリックします。 **パブリックデータセットの調査**.

![デモ](./images/ex1/18.png)

次に、このウィンドウが表示されます。

![デモ](./images/ex1/19.png)

検索語句を入力 **Google Analytics例** 検索バーで、最初の結果を選択します。

![デモ](./images/ex1/20.png)

次の画面に、データセットの説明が表示されます。 クリック **データセットを表示**.

![デモ](./images/ex1/21.png)

次に、BigQuery にリダイレクトされ、次の情報が表示されます **bigquery-public-data** のデータセット **エクスプローラ**.

![デモ](./images/ex1/22a.png)

In **エクスプローラ**&#x200B;に値を入力すると、複数のテーブルが表示されます。 自由に探索してみてください。 `google_analytics_sample` にアクセスします。

![デモ](./images/ex1/22.png)

クリックしてテーブルを開きます。 `ga_sessions`.

![デモ](./images/ex1/23.png)

次の演習を続行する前に、次の内容をコンピュータ上の別のテキストファイルに書き留めてください。

| 認証情報 | 命名 | 例 |
| ----------------- |-------------| -------------|
| プロジェクト名 | `--demoProfileLdap---googlecloud` | バンゲルーグルーの |
| プロジェクト ID | random | composed-task-306413 |

プロジェクト名とプロジェクト ID は、 **プロジェクト名** 上部のメニューバーで、次の操作をおこないます。

![デモ](./images/ex1/projectMenu.png)

その後、右側にプロジェクト ID が表示されます。

![デモ](./images/ex1/projetcselection.png)

次に、Exersize 12.2 に進み、Google Analytics・データに問い合わせて手を汚すことができます。

次のステップ： [12.2 BigQuery で最初のクエリを作成する](./ex2.md)

[モジュール 12 に戻る](./customer-journey-analytics-bigquery-gcp.md)

[すべてのモジュールに戻る](./../../overview.md)
