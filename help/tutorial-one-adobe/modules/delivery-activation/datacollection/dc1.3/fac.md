---
title: データ収集 – Federated Audience Composition
description: データ収集 – Federated Audience Composition
kt: 5342
doc-type: tutorial
exl-id: a2449e72-794a-4ff0-a208-28303fd574d1
source-git-commit: 3d61d91111d8693ab031fbd7b26706c02818108c
workflow-type: tm+mt
source-wordcount: '625'
ht-degree: 0%

---

# 1.3 Federated Audience の構成

このモジュールの目標は、Federated Audience Composition を使用したオーディエンスの作成についてすべてを学習することです。

Experience Platformの Federated Audience Composition （FAC）を使用すると、エンタープライズデータウェアハウスの対応する高価値の属性を使用して、オーディエンスにアクセスしたり、オーディエンスを作成したりできます。これにより、Experience Platformのリアルタイム顧客プロファイルおよびオーディエンスが強化され、効果的なカスタマーエクスペリエンス（顧客体験）のセグメント化、ターゲティング、アクティブ化および配信が向上します。 Federated Audience Composition を使用すると、メタデータを介してリモートデータベースをリンクすることで、仮想データベースが作成されます。 このアプローチにより、アクセスが合理化され、重複が減少し、エンド・ユーザーの操作性が向上します。 チームには、データセットをExperience Platformに直接取り込む柔軟性や、エンゲージメントワークフローのためにオーディエンスを組み立てる際にデータウェアハウスに存在するデータセットにアクセスする柔軟性が付与されます。 このアプローチでは、Data Warehouse への投資とアセットを活用して、Real-Time CDPとJourney Optimizerを補完します。 Federated Audience Composition を使用すると、お客様は、重要な新しいユースケースパターンをまたいで、バッチ機能とリアルタイム機能を利用および組み合わせることができます。

- フェデレーションされたオーディエンスのセグメント化：Real-Time CDPとJourney Optimizerのマーケターに適したドラッグ&amp;ドロップオーディエンス構成 UI を使用してオーディエンスを作成できますが、クエリをデータウェアハウスにプッシュすると、機密の基になるデータが重複することなくウェアハウスに残り、重要なデータセットへの柔軟なアクセスが可能になります。
- オーディエンスのエンリッチメント：Real-Time CDPおよびJourney Optimizerで作成されたオーディエンスを、企業データで強化して、Adobe Experience Platformに保持されないプロファイルベースのデータセットとプロファイルベース以外のデータセットでターゲティングとパーソナライゼーションを向上させることができます。 例えば、小売ブランドは、最近のオンライン購入者のオーディエンスを、実店舗のトップロケーションのリストで補完して、クロスチャネルのオンラインおよび店舗内プロモーションのオーディエンスを構築できます。
- プロファイルのエンリッチメント：チームは、その時点でのエクスペリエンスに不可欠なプロファイル属性をデータウェアハウスから選択し、Real-Time CDPにあり、Journey Optimizer経由でアクセスできる、実用的な顧客プロファイル内に保持することができます。 これらの追加データポイントは、ユーザーのアクションと顧客のユースケースに応じて、イベント動作によってトリガーされるダウンストリームのセグメント化とパーソナライゼーションに使用できます。 これにより、フェデレーティッドオーディエンスと共に持ち込まれた属性を、顧客プロファイルに保持された他の属性や行動信号と共に、その時点のセグメント化およびパーソナライゼーションに使用できるようになります。

Federated Audience Composition を使用すると、Real-Time CDPおよびJourney Optimizerのお客様は、使用するデータを（および不要な重複データセットや統合パターンを回避するために）柔軟に決定できます。 これは、エンタープライズデータを使用してオーディエンスと高価値属性をキュレーションする連合アプローチと、その時点でのクロスチャネルエンゲージメント用に最適化されたシステムを組み合わせた、独自の組み合わせを表します。 その結果、データ移動が少なくなるだけでなく、価値の高いオーディエンスと属性を利用して、チャネル間で一貫した低レイテンシのアクティベーションを行う新しい機会も生まれます。

## 学習内容

- SnowflakeをAdobe Experience Platformと接続する方法を学ぶ
- Adobe Experience Platformで連合データのデータモデルを作成する方法を説明します
- Adobe Experience Platformでフェデレーティッドオーディエンスコンポジションを作成する方法を説明します

## 前提条件

- Adobe Experience Platformへのアクセス：[https://experience.adobe.com/platform](https://experience.adobe.com/platform)
- Snowflake Data Warehouse へのアクセス

## 演習

[1.3.1 Snowflake環境のセットアップ](./ex1.md)

この演習では、Snowflake体験版アカウントを設定し、Adobe Experience Platformに接続します

[1.3.2 スキーマ、データモデル、リンクの作成](./ex2.md)

この演習では、AEP で統合データのデータモデルを設定します。

[1.3.3 フェデレーション構成の作成](./ex3.md)

この演習では、AEP で統合データのデータモデルを設定します。

[概要と利点](./summary.md)

このモジュールの概要とメリットの概要

![ 技術インサイダー ](./../../../../assets/images/techinsiders.png){width="50px" align="left"}

>[!NOTE]
>
>Adobe Experience Platformとそのアプリケーションについて知るのに時間を費やしていただき、ありがとうございます。 ご不明な点がある場合は、have suggestions on future content の一般的なフィードバックをお知らせください。**techinsiders@adobe.com** に電子メールを送信して、技術インサイダーに直接問い合わせてください。

[すべてのモジュールに戻る](./../../../../overview.md)
