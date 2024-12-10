---
title: Adobe TargetからAdobe Journey Optimizer - Decisioning Mobile 拡張機能への移行
description: Adobe TargetからAdobe Journey Optimizer - Decisioning 拡張機能にモバイルアプリの実装を移行する方法を説明します
last-substantial-update: 2023-02-23T00:00:00Z
exl-id: 32363b95-b6ad-44af-a3b0-e1fbbbf5a8f1
source-git-commit: 485e79e3569052184475fbc49ab5f43cebcac9a6
workflow-type: tm+mt
source-wordcount: '393'
ht-degree: 3%

---

# Adobe TargetからAdobe Journey Optimizer - Decisioning Mobile 拡張機能への移行

このガイドは、Adobe Targetの経験豊富な実装者向けに、既存のAdobeExperience Platform を Mobile SDK の実装からAdobe Target拡張機能からAdobe Journey Optimizer - Decisioning 拡張機能に移行する方法を説明します。

Adobe Experience Platform Mobile SDK は、モバイルアプリケーションにおけるエンドツーエンドのエンゲージメントを強化します。 Target 拡張機能は、Mobile SDK に基づいて構築されており、Adobe Targetでアプリエクスペリエンスをパーソナライズするのに役立ちます。 Decisioning 拡張機能は、Target をReal-Time CDPやJourney OptimizerなどのAdobe Target ベースのアプリとEdge Networkするのに役立つAdobe Experience Platform統合機能を使用する、モバイルアプリに Platform を実装する新しいアプローチです。

## 主なメリット

意思決定拡張機能のメリットには、次のようなものがあります。

* [Real-time Customer Data Platform](https://experienceleague.adobe.com/docs/platform-learn/tutorials/experience-cloud/next-hit-personalization.html?lang=ja) からのオーディエンスの共有を高速化
* [Offer decisioning配信をサポートするための Target とJourney Optimizerの統合 ](https://experienceleague.adobe.com/docs/target/using/integrate/ajo/offer-decision.html)
* Adobe Analyticsとの緊密な統合：個別のネットワーク呼び出しからの情報のステッチに依存しない
* 開発者向けの実装の柔軟性の向上

Target をご利用のお客様が移行する最大のメリットは、おそらくReal-time Customer Data Platformとの統合です。 Real-Time CDPは、Experience Platformに取り込まれるすべてのデータ範囲とリアルタイム顧客プロファイル機能に基づいて、オーディエンスを構築する途方もない機能を提供します。 ビルトインのデータガバナンスフレームワークにより、そのデータの責任ある使用が自動化されます。 顧客 AI を使用すると、機械学習モデルを簡単に使用して、傾向モデルとチャーンモデルを作成し、その出力をAdobe Targetに戻すことができます。 最後に、オプションのヘルスケアおよびプライバシーおよびセキュリティシールド アドオンのお客様は、同意強制機能を使用して、個々のお客様の同意設定を簡単に適用できます。 Platform Web SDK は、web チャネルでこれらのReal-Time CDP機能を使用するための要件です。

## 学習目標

このチュートリアルを最後まで学習すると、以下の内容を習得できます。

* 箇条書き 1
* 箇条書き 2


## 前提条件

このチュートリアルを完了するには、まず次の操作を行う必要があります。

* 箇条書き 1
* 箇条書き 2


>[!NOTE]
>
>アドビは、Target 拡張機能から Decisioning 拡張機能への Mobile Target の移行を成功させるために取り組んでいます。 移行の際に問題が発生した場合、またはこのガイドに重要な情報が欠落していると感じる場合は、[ このコミュニティのディスカッション ](https://experienceleaguecommunities.adobe.com/t5/adobe-experience-platform-data/tutorial-discussion-migrate-target-from-at-js-to-web-sdk/m-p/575587#M463) に投稿してお知らせください。
