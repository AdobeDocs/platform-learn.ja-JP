---
title: Bootcamp - Customer Journey Analytics - Customer Journey Analytics 101
description: Bootcamp - Customer Journey Analytics - Customer Journey Analytics 101
jira: KT-5342
audience: Data Engineer, Data Architect, Data Analyst
doc-type: tutorial
activity: develop
solution: Customer Journey Analytics
exl-id: 587be8bc-8ebe-4f30-99d8-ba88ce40caf7
source-git-commit: 901b90ca165a74bbc4f871469222064b70d0a20a
workflow-type: tm+mt
source-wordcount: '875'
ht-degree: 0%

---

# 4.1 Customer Journey Analytics 101

## 目標

- CJA アプリケーションについて
- CJA のポジショニング方法を学ぶ
- データ接続からインサイトまで、CJA のワークフローを理解します

## 4.1.1 Customer Journey Analyticsとは何ですか？

Customer Journey Analytics（CJA）は、クロスチャネルデータ（オンラインとオフライン）のステッチと分析のために、ビジネスインテリジェンスおよびデータサイエンスチーム向けのツールキットを提供します。 CJA の機能は、複雑なマルチチャネルカスタマージャーニーにコンテキストと明確さを提供します。 提供されるコンテキストにより、顧客コンバージョンプロセスの問題点を取り除き、最も重要な瞬間に優れたエクスペリエンスを設計し提供するための実用的なインサイトが得られます。

CJA はAnalysis WorkspaceをAdobe Experience Platformに追加します。 Adobe Experience Platformは、コミュニケーションとオーケストレーションの頭脳です。CJA を使用すると、企業はすべてのデータをコンテキスト化し、視覚化できるので、ビジネスチームやインサイトチームは、オンラインからオフラインへの完全なカスタマージャーニーを分析することで、そこから学ぶことができます。

ビジネスチームやインサイトチームは、Analysis Workspaceのドラッグアンドドロップ、ポイントアンドクリック、使いやすい UI を使用して、CJA と話し、質問し、その場で回答を得ることができます。

![デモ](./images/cja-adv-analysis1.png)

## 4.1.2 主なメリット

お客様にとっての主なメリットは次の 3 つです。

- 誰でもインサイトを利用可能にする機能（データアクセスの民主化など）
- 顧客をコンテキストジャーニーで表示する機能（オンラインとオフラインの両方の複数のチャネルにまたがるデータを順番に視覚化できます）
- を必要とせずにデータの力を活用する機能（つまり、通常の人間がデータを使用して、マーケティングアクティベーションのための深いインサイトと分析を解き放つ）

## 4.1.3 Customer Journey Analyticsを選ぶ理由

CJA は、Power BI、マイクロストラテジー、Locker、Tableau などの現在の BI アプリケーションの代わりとなるつもりはありません。 これらの BI アプリケーションは、データを視覚化して企業ダッシュボードを作成し、組織内の全員が重要な指標をすばやく確認できるようにします。\
CJA の目標は、マーケティングチームとビジネスチームに分析力をもたらし、それらのペルソナにとって「必須」の分析ツールにすることです。

従来、BI アプリケーションは真の顧客インテリジェンスを実現することはできませんでした。

- アトリビューションを行うことも、カスタマージャーニー分析を行うこともできません。
- BI アプリケーションは、事前に質問を把握する必要があります
- インタラクティブクエリは、データベースの構造によって制限されます
- SQL スキルが必要です。
- BI アプリケーションには、何が起こったのかを尋ねる機能はありません。
- BI アプリケーションには、顧客タッチポイントへの直接接続はありません。

上記の理由から、ビジネスユーザーやアナリストはほぼ即座に行き詰まり、分析が高価で、遅く、柔軟性に欠け、行動システムから切り離されています。

CJA を使用すると、適切なツールを使用してオフラインとオンラインのデータを使用し、カスタマージャーニーを 360 度にわたって把握し、インサイトを得るまでの時間を短縮し、発生した理由と対応方法をビジネスユーザーが把握するのを独立させることができます。

![デモ](./images/cja-use-case.png)

## 4.1.4 Customer Journey Analyticsワークフローについて

次の演習を始める前に、Adobe Experience Platformから CJA にデータを取り込んで視覚化し、深いインサイトを得るために必要な手順を理解することが重要です。 これを CJA ワークフローと呼びます。 見てみましょう。

![デモ](./images/cja-work-flow.jpg)

上記の手順を始める前に、手順 0 を忘れないでください。手順 0 は、Adobe Experience Platformで使用可能なデータを理解することです。

**ゴミを入れて、ゴミを出しなさい。** 思い出した？ 使用可能なデータとAdobe Experience Platformのスキーマの設定方法について、明確に理解している必要があります。 Adobe Experience Platform内のデータを理解することで、データ接続の部分だけでなく、ビジュアライゼーションを作成したり分析を行ったりする際にも作業が容易になります。

## 4.1.5 手順 0:Adobe Experience Platform スキーマとデータセットについて

次の URL に移動して、Adobe Experience Platformにログインします。 [https://experience.adobe.com/platform](https://experience.adobe.com/platform).

ログインすると、Adobe Experience Platformのホームページが表示されます。

![データ取得](../uc1/images/home.png)

続行する前に、を選択する必要があります **sandbox**. 選択するサンドボックスの名前はです ``Bootcamp``. それには、テキストをクリックします **[!UICONTROL Prod]** 画面の右上隅に表示されます。 適切なサンドボックスを選択すると、画面が変更され、専用のサンドボックスが表示されます。

![データ取得](../uc1/images/sb1.png)

Adobe Experience Platformのこれらのスキーマとデータセットを確認してください。

| データセット | スキーマ |
| ----------------- |-------------| 
| デモシステム - Web サイトのイベントデータセット（グローバル v1.1） | デモシステム - Web サイトのイベントスキーマ（グローバル v1.1） |
| デモシステム – コールセンターのイベントデータセット（グローバル v1.1） | デモシステム – コールセンターのイベントスキーマ（グローバル v1.1） |
| デモシステム – 音声アシスタントのイベントデータセット（グローバル v1.1） | デモシステム – 音声アシスタントのイベントスキーマ（グローバル v1.1） |

次の項目を少なくともオンにしていることを確認します。

- ID:CRMID、phoneNumber、ECID、メール。 プライマリ識別子は ID、セカンダリ識別子は ID
スキーマを開き、オブジェクトを確認することで、識別子を見つけることができます `_experienceplatform.identification.core`. スキーマを確認します [デモシステム - Web サイトのイベントスキーマ（グローバル v1.1）](https://experience.adobe.com/platform/schema).

![デモ](./images/identity.png)

- スキーマ内のコマースオブジェクトの参照 [デモシステム - Web サイトのイベントスキーマ（グローバル v1.1）](https://experience.adobe.com/platform/schema).

![デモ](./images/commerce.png)

- すべての [データセット](https://experience.adobe.com/platform/dataset/browse?limit=50&amp;page=1&amp;sortDescending=1&amp;sortField=created) データを確認する

これで、Customer Journey AnalyticsUI の使用を開始する準備が整いました。

次の手順： [4.2 Customer Journey AnalyticsでのAdobe Experience Platform データセットの接続](./ex2.md)

[ユーザーフロー 4 に戻る](./uc4.md)

[すべてのモジュールに戻る](../../overview.md)
