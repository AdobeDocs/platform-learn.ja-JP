---
title: Adobe Experience PlatformでのGoogle Analyticsデータの取り込みと分析（BigQuery Source Connector を使用） — 概要
description: Adobe Experience PlatformでのGoogle Analyticsデータの取り込みと分析（BigQuery Source Connector を使用） — 概要
kt: 5342
audience: Data Engineer, Data Architect, Data Analyst
doc-type: tutorial
activity: develop
exl-id: 229a4ac6-acb6-4047-9fa4-d1b213fcf745
source-git-commit: cc7a77c4dd380ae1bc23dc75608e8e2224dfe78c
workflow-type: tm+mt
source-wordcount: '512'
ht-degree: 1%

---

# 概要とメリット

おめでとうございます。Customer Journey AnalyticsとAdobe Experience Platformの学習に時間を割いていただきありがとうございます。
このモジュールでは、Google Cloud Platform、Google Analytics、Google BigQuery からAdobe Experience Platformにデータを取り込み、Customer Journey Analyticsを通じてそのデータを分析する方法を学びました。

Adobe Experience Platformには、すぐに利用可能な自動統合がいくつか用意されており、既存のテクノロジースタックと簡単かつ迅速に統合できます。 BigQuery Source Connector は、主要な分析プラットフォームと統合し、既存の顧客プロファイルを直ちに強化して、現在のプロセスを中断することなく、より包括的な顧客ビューを作成できる、プラットフォームに依存しないツールです。

## メリット

Adobe Experience Platformと共にCustomer Journey Analyticsを使用するメリットについて説明します。

- Customer Journey Analyticsを使用すると、任意のソースのデータをリアルタイムで結合できるようになりました。 カスタマージャーニーの分析が、Web およびモバイルアプリケーションに限定されなくなり、Google Cloud Platform やGoogle BigQuery などのAdobe以外の環境からデータを取り込めるようになりました。
- Customer Journey Analyticsを使用すると、様々なソースのデータセットを同じデータビューに追加する際に、柔軟にデータを結合できます。 これにより、アナリストとして、様々な方法でデータを見るための多くの柔軟性とオプションが提供されます。
- Customer Journey Analyticsでは、データソースを個別に実装する必要はなくなりました。 Adobe Experience Platformに存在するすべてのデータを、初期設定の状態で使用できます。 Adobe Experience Platformで取り込まれたGoogle Analyticsデータは、ビジュアライゼーションに使用できるだけでなく、Real-time CDP アプリケーションサービスを通じたアクティベーションや、Data Science Workspace を使用したデータサイエンスにも使用できます。
- すべてのオンラインソースにわたって、1 つのデータ収集実装のみを使用する方法がメリットとなりました。 Web SDK およびAdobe Experience Platformでは、データは XDM 形式で取り込まれます。つまり、アナリストは、独自のトラッキングを実装する代わりに、データからインサイトを得ることに専念できます。

次が可能になりました。

- 現在のテクノロジースタックとの間で、混乱を招くことなく迅速に統合できます。 独自のデータやサードパーティのデータを一元化することで、複数のアプリケーションをまたいで繰り返し作業や手動作業を行う必要がなくなります。
- Google Cloud Platform や他の外部データソースなどの主要な分析プラットフォームとの自動統合を使用して、価値を高める時間を短縮できます。
- データの収集を早く開始し、これらのインサイトを使用して新しいエクスペリエンスを提案し、迅速にマーケティングに移行できます。 このデータの民主化により、迅速なインサイトと市場投入時間を短縮できます。
- 顧客の遍歴をより完全に把握し、問題点を把握し、コンバージョン、チャーンの緩和、パーソナライズされたフォローアップに最適化します。

## 確認する

- ヘルプセンター： [ソースコネクタ — Google BigQuery コネクタ](https://experienceleague.adobe.com/docs/experience-platform/sources/connectors/databases/bigquery.html)
- Experience Platformドキュメント： [Customer Journey Analytics — 製品ドキュメント](https://experienceleague.adobe.com/docs/analytics-platform/using/cja-landing.html?lang=ja)

[モジュール 12 に戻る](./customer-journey-analytics-bigquery-gcp.md)

[すべてのモジュールに戻る](./../../overview.md)
