---
title: 基盤 — データ取り込み — 概要
description: 基盤 — データ取り込み — 概要
kt: 5342
audience: Data Engineer, Data Architect
doc-type: tutorial
activity: develop
exl-id: 041f098d-6518-4db9-9d7f-a914907d7bc4
source-git-commit: cc7a77c4dd380ae1bc23dc75608e8e2224dfe78c
workflow-type: tm+mt
source-wordcount: '289'
ht-degree: 0%

---

# 概要とメリット

おめでとうございます。Adobe Experience Platformの学習に時間を割いてくれてありがとうございます。
このモジュールでは、スキーマ、mixin およびデータセットの作成方法を学びました。 Launch を使用してデータをストリーミングで取り込む方法と、CSV ファイルをAdobe Experience Platformに読み込み、XDM スキーマに対して CSV 列をマッピングする方法を学びました。

## メリット

Adobe Experience Platformのデータ取り込み機能のメリットについて説明します。

- XDM を単一の言語として使用してエクスペリエンスを記述すると、データモデリングは取得時とそこから一度おこなわれ、Adobe Experience Platformと統合されている任意のアプリケーションで、すべての XDM モデル化データを簡単に再利用および使用できます。
- XDM には、できる限り再利用する必要がある mixin の形式で、すぐに使用できる定義が多数用意されています。 また、XDM は、ブランドが独自の Mixin を作成できる柔軟性も備えており、特定のブランドやデータのニーズに合わせて XDM をカスタマイズすることを目的としています。
- Adobe Experience Platformで作成したデータセットは、リアルタイムの顧客プロファイルをハイドレートするように設定できます。
- CSV、JSON、Parquet の各ファイル形式のデータは、ワークフローを使用して、Adobe Experience Platformに簡単に取り込むことができます
- データセットレベルでデータガバナンスコントロールを使用すると、Adobe Experience Platformでデータに 1 回だけラベル付けできます。 その後、このラベルは、Adobe Experience Platform全体でのデータの使用方法と、Adobe Experience Platformに接続されている他のアプリケーションでのデータの使用方法に影響します。

## 確認する

- テクニカルブログ： [Adobe Experience PlatformのPrivacy Serviceとビヨンド](https://medium.com/adobetech/privacy-services-and-beyond-in-adobe-experience-platform-31b8d7e9292)

[モジュール 2 に戻る](./data-ingestion.md)

[すべてのモジュールに戻る](../../overview.md)
