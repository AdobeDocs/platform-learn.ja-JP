---
title: Bootcamp -Customer Journey Analytics-Customer Journey Analytics101
description: Bootcamp -Customer Journey Analytics-Customer Journey Analytics101
kt: 5342
audience: Data Engineer, Data Architect, Data Analyst
doc-type: tutorial
activity: develop
exl-id: 587be8bc-8ebe-4f30-99d8-ba88ce40caf7
source-git-commit: ead28f5631fc430c41e8c756b23dc69ffe19510e
workflow-type: tm+mt
source-wordcount: '876'
ht-degree: 1%

---

# 4.1Customer Journey Analytics101

## 目標

- CJA アプリケーションサービスについて
- CJA の位置付け方法を学ぶ
- CJA ワークフローについて：データ接続からインサイトへ

## 4.1.1Customer Journey Analyticsとは

Customer Journey Analytics(CJA) は、ビジネスインテリジェンスチームとデータサイエンスチームに対し、クロスチャネルデータ（オンラインとオフライン）のステッチと分析のためのツールキットを提供します。 CJA 内の機能は、複雑なマルチチャネルカスタマージャーニーにコンテキストと明確性を提供します。 提供されるコンテキストにより、顧客コンバージョンプロセスからの痛点を取り除くこと、および最も重要な瞬間に対する優れたエクスペリエンスを設計および提供することに関する実用的なインサイトが得られます。

CJA はAnalysis WorkspaceをAdobe Experience Platformの上に置きます。 Adobe Experience Platformはコミュニケーションとオーケストレーションの頭脳で、CJA との連携により、ブランドはすべてのデータをコンテキスト化し視覚化し、視覚化できるようになり、ビジネスチームと Insight チームは、オンラインからオフラインのカスタマージャーニーまでを分析できます。

ビジネスチームと Insight チームは、Analysis Workspaceのドラッグ&amp;ドロップ、ポイント&amp;クリックで操作しやすい UI を使用して、CJA と話し合い、質問をし、その場で回答を得ることができます。

![デモ](./images/cja-adv-analysis1.png)

## 4.1.2 主な利点

お客様にとっての主なメリットは次の 3 つです。

- 誰でもインサイトを利用できるようにする機能（データアクセスの民主化など）
- コンテキストジャーニーで顧客を確認する機能（つまり、データをオンラインとオフラインの両方の複数のチャネルにまたがって順番に視覚化できます）
- を必要とせずにデータの力を活用する機能（つまり、通常の人がデータを使用して、マーケティング活動のための深いインサイトと分析を解き放つことができます）

## 4.1.3 なぜCustomer Journey Analyticsを選ぶのか

CJA は、Power BI、Microstrategy、Locker、Tableau などの現在の BI アプリケーションを置き換えることを目的としていません。 これらの BI アプリケーションは、データを視覚化して会社のダッシュボードを作成し、組織の全員が重要な指標をすばやく確認できるようにすることを目的としています。\
CJA の目標は、マーケティングチームとビジネスチームに分析力をもたらし、そのペルソナにとって「必須」の分析ツールにすることです。

従来、BI アプリケーションは、真の顧客インテリジェンスを有効にすることができませんでした。

- アトリビューションもカスタマージャーニー分析も実行できません。
- BI アプリケーションは、事前に質問を知る必要がある
- インタラクティブクエリは、データベースの構造によって制限されます
- SQL スキルが必要です。
- BI アプリケーションは、なぜ何が起きたのかを尋ねる能力を与えません。
- BI アプリケーションは、顧客タッチポイントに直接接続していません。

上記のため、ビジネスユーザーやアナリストは、ほぼ即座にデッドエンドをヒットし、高価で、遅く、柔軟性がなく、行動のシステムから切り離された分析を行います。

CJA を使用すると、オフラインとオンラインのデータを使用して、カスタマージャーニーを 360 の視点で把握し、インサイトを得る時間を短縮し、何が起きたのかとそれに対する対応方法をビジネスユーザーに独立させることができます。

![デモ](./images/cja-use-case.png)

## 4.1.4Customer Journey Analyticsワークフロー

次の演習を開始する前に、データを視覚化して深いインサイトを得るために、Adobe Experience Platformから CJA にデータを取り込むために必要な手順を理解することが重要です。 これを CJA ワークフローと呼びます。 次の図を見てみましょう。

![デモ](./images/cja-work-flow.jpg)

上記の手順を開始する前に、手順 0(Adobe Experience Platformで使用できるデータを理解するため ) を忘れないでください。

**ゴミ入りゴミ出し。** 覚えてる？ 使用可能なデータと、Adobe Experience Platformのスキーマの設定方法を明確に理解する必要があります。 Adobe Experience Platformのデータを理解すると、データ接続部分だけでなく、ビジュアライゼーションの作成や分析の際にも、作業が容易になります。

## 4.1.5 手順 0:Adobe Experience Platformのスキーマとデータセットについて

次の URL に移動して、Adobe Experience Platformにログインします。 [https://experience.adobe.com/platform](https://experience.adobe.com/platform).

ログイン後、Adobe Experience Platformのホームページに移動します。

![データ取得](../uc1/images/home.png)

続行する前に、 **サンドボックス**. 選択するサンドボックスの名前はです ``Bootcamp``. これを行うには、 **[!UICONTROL Prod]** をクリックします。 適切なサンドボックスを選択すると、画面が変更され、専用のサンドボックスに移動します。

![データ取得](../uc1/images/sb1.png)

Adobe Experience Platformでこれらのスキーマとデータセットを確認してください。

| データセット | スキーマ |
| ----------------- |-------------| 
| デモシステム — Web サイトのイベントデータセット (Global v1.1) | デモシステム — Web サイトのイベントスキーマ (Global v1.1) |
| デモシステム — コールセンターのイベントデータセット（グローバル v1.1） | デモシステム — コールセンター（グローバル v1.1）のイベントスキーマ |
| デモシステム — 音声アシスタントのイベントデータセット（グローバル v1.1） | デモシステム — 音声アシスタント用のイベントスキーマ（グローバル v1.1） |

少なくとも次のような項目を確認しておく必要があります。

- ID:CRMID、phoneNumber、ECID、電子メール。 プライマリ識別子はどの ID で、セカンダリ識別子はどれですか。
識別子を見つけるには、スキーマを開き、オブジェクトを確認します `_experienceplatform.identification.core`. スキーマを見る [デモシステム — Web サイトのイベントスキーマ (Global v1.1)](https://experience.adobe.com/platform/schema).

![デモ](./images/identity.png)

- スキーマ内のコマースオブジェクトの参照 [デモシステム — Web サイトのイベントスキーマ (Global v1.1)](https://experience.adobe.com/platform/schema).

![デモ](./images/commerce.png)

- すべての [データセット](https://experience.adobe.com/platform/dataset/browse?limit=50&amp;page=1&amp;sortDescending=1&amp;sortField=created) データを見て

これで、Customer Journey AnalyticsUI の使用を開始する準備が整いました。

次のステップ： [4.2Customer Journey AnalyticsでのAdobe Experience Platformデータセットの接続](./ex2.md)

[ユーザーフローに戻る 4](./uc4.md)

[すべてのモジュールに戻る](../../overview.md)
