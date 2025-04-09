---
title: Adobe TargetからAdobe Journey Optimizer - Decisioning 拡張機能へのモバイルアプリの移行
description: Adobe TargetからAdobe Journey Optimizer - Decisioning 拡張機能にモバイルアプリの実装を移行する方法を説明します
last-substantial-update: 2023-02-23T00:00:00Z
exl-id: 32363b95-b6ad-44af-a3b0-e1fbbbf5a8f1
source-git-commit: 2ebad2014d4c29a50af82328735258958893b42c
workflow-type: tm+mt
source-wordcount: '650'
ht-degree: 1%

---

# Adobe TargetからAdobe Journey Optimizer - Decisioning 拡張機能へのモバイルアプリの移行

このガイドは、Adobe Targetの経験豊富な実装者向けに、既存のAdobe Experience Platform を Mobile SDKの実装からAdobe Target拡張機能からAdobe Journey Optimizer - Decisioning 拡張機能に移行する方法を説明します。

Adobe Experience Platform Mobile SDKは、モバイルアプリケーションにおけるエンドツーエンドのエンゲージメントを強化します。 Target 拡張機能は、Mobile SDKに基づいて構築されており、Adobe Targetでアプリのエクスペリエンスをパーソナライズするのに役立ちます。 Decisioning 拡張機能は、Target をReal-Time CDPやJourney OptimizerなどのAdobe Target ベースのアプリと統合するのに役立つAdobe Experience Platform Edge Network機能を使用する、モバイルアプリに Platform を実装する新しいアプローチです。

![Decisioning 拡張機能を使用してEdge Networkを介して Target に接続する Mobile SDKを示す図 ](assets/datacollection.png)

## 主なメリット

Target 拡張機能と比較したAdobe Journey Optimizer Decisioning 拡張機能のメリットには、次のようなものがあります。

* [Real-Time Customer Data Platform](https://experienceleague.adobe.com/en/docs/platform-learn/tutorials/experience-cloud/next-hit-personalization) からのオーディエンスの共有を高速化
* [Offer Decisioning配信をサポートするための Target とJourney Optimizerの統合 ](https://experienceleague.adobe.com/en/docs/target/using/integrate/ajo/offer-decision)
* Adobe Analyticsとの緊密な統合：個別のネットワーク呼び出しからの情報のステッチに依存しない
* 開発者向けの実装の柔軟性の向上

Target をご利用のお客様が移行する最大のメリットは、おそらくReal-Time Customer Data Platformとの統合です。 Real-Time CDPは、Experience Platformに取り込まれるすべてのデータとリアルタイム顧客プロファイル機能に基づいて、オーディエンスを構築する非常に優れた機能を提供します。 ビルトインのデータガバナンスフレームワークは、そのデータの責任ある使用を自動化します。 顧客 AI を使用すると、機械学習モデルを簡単に使用して、傾向モデルとチャーンモデルを作成し、その出力をAdobe Targetに戻すことができます。 最後に、オプションのヘルスケアおよびプライバシーおよびセキュリティシールド アドオンのお客様は、同意強制機能を使用して、個々のお客様の同意設定を適用できます。 Platform Mobile SDKと Decisioning 拡張機能は、モバイルチャネルでこれらのReal-Time CDP機能を使用するための要件です。

## 移行手順

Target 拡張機能から Decisioning 拡張機能への移行に要する労力のレベルは、現在の実装と使用されている Target 機能の複雑さに応じて異なります。

実装がどんなに単純でも、複雑でも、移行前に現在の状態を完全に理解することが重要です。 このガイドを使用すると、現在の実装のコンポーネントを分類し、各コンポーネントを移行する管理可能な計画を作成できます。

移行プロセスには、次の主な手順が含まれます。

1. 以下を含め、現在の実装を評価します。
   1. 使用されるすべての Target SDK API
   1. Target のグローバル設定の変更
   1. Adobe Analytics との統合
   1. mbox、profile、entity パラメーターの使用
   1. プロファイルスクリプトとオーディエンスの使用
   1. 実装に固有のカスタムコード
1. Adobe Experience Platform Edge Networkに接続するための初期コンポーネントの設定
1. Target 拡張機能を Decisioning 拡張機能に置き換えるために、基本的な実装を更新します
1. 特定の使用例に合わせてSDKの最適化の実装を強化します。 これには、追加のパラメーターを渡したり、応答トークンを使用したりすることが含まれる場合があります。
1. プロファイルスクリプト、アクティビティ、オーディエンス定義など、Target インターフェイスのオブジェクトを更新します
1. 実稼動アプリに切り替える前に、最終的な実装を検証します


>[!INFO]
>
>Adobe Experience Platform Mobile SDK エコシステム内では、拡張機能は、アプリケーションに読み込まれた、名前が異なる可能性のある SDK によって実装されます。
>
> * **Target SDK** は、**Adobe Target拡張機能を実装しています**
> * **SDKの最適化** は、**Adobe Journey Optimizer - Decisioning 拡張機能を実装しています**

次に、詳細な [Target 拡張機能と Decisioning 拡張機能の比較 ](comparison.md) を確認して、技術的な違いをより深く理解し、さらに焦点を当てる必要がある領域を特定します。

>[!NOTE]
>
>アドビは、Target 拡張機能から Decisioning 拡張機能への Mobile Target の移行を成功させるために取り組んでいます。 移行の際に問題が発生した場合、またはこのガイドに重要な情報が欠落していると感じる場合は、[ このコミュニティのディスカッション ](https://experienceleaguecommunities.adobe.com/t5/adobe-experience-platform-data/tutorial-discussion-migrate-adobe-target-to-mobile-sdk-on-edge/m-p/747484#M625) に投稿してお知らせください。
