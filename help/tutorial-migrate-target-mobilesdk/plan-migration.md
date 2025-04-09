---
title: 移行の計画 – モバイルアプリのAdobe Target実装をAdobe Journey Optimizer - Decisioning 拡張機能に移行します
description: at.js と Platform Web SDKの主な違いと、移行作業の計画方法について説明します。
exl-id: 86849319-d2ad-4338-aa1a-d307d8807d4a
source-git-commit: 2ebad2014d4c29a50af82328735258958893b42c
workflow-type: tm+mt
source-wordcount: '315'
ht-degree: 0%

---

# 移行の計画

Target 拡張機能から Decisioning 拡張機能への移行に要する労力のレベルは、現在の実装と使用されている Target 機能の複雑さに応じて異なります。

実装がどんなに単純でも、複雑でも、移行前に現在の状態を完全に理解することが重要です。 このガイドを使用すると、現在の実装のコンポーネントを分類し、各コンポーネントを移行する管理可能な計画を作成できます。

移行プロセスには、次の主な手順が含まれます。

1. 現在の実装を評価し、移行アプローチを決定
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


次に、詳細な [Target 拡張機能と Decisioning 拡張機能の比較 ](detailed-comparison.md) を確認して、技術的な違いをより深く理解し、さらに焦点を当てる必要がある領域を特定します。

>[!NOTE]
>
>アドビは、Target 拡張機能から Decisioning 拡張機能への Mobile Target の移行を成功させるために取り組んでいます。 移行の際に問題が発生した場合、またはこのガイドに重要な情報が欠落していると感じる場合は、[ このコミュニティのディスカッション ](https://experienceleaguecommunities.adobe.com/t5/adobe-experience-platform-data/tutorial-discussion-migrate-adobe-target-to-mobile-sdk-on-edge/m-p/747484#M625) に投稿してお知らせください。
