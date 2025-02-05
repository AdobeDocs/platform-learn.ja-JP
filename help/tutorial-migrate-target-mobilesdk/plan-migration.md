---
title: 移行の計画 – Adobe TargetからAdobe Journey Optimizer - Decisioning モバイル拡張機能への移行
description: at.js と Platform Web SDKの主な違いと、移行作業の計画方法について説明します。
exl-id: 86849319-d2ad-4338-aa1a-d307d8807d4a
source-git-commit: f3fd5f45412900dcb871bc0b346ce89108fa8913
workflow-type: tm+mt
source-wordcount: '644'
ht-degree: 0%

---

# 移行の計画

Target 拡張機能から Decisioning 拡張機能に移行する労力のレベルは、現在の実装と使用されている製品機能の複雑さに応じて異なります。

実装がどんなに単純でも、複雑でも、移行前に現在の状態を完全に理解することが重要です。 このガイドを使用すると、現在の実装のコンポーネントを分類し、各コンポーネントを移行する管理可能な計画を作成できます。

移行プロセスには、次の主な手順が含まれます。

1. 現在の実装を評価し、移行アプローチを決定
1. Adobe Experience Platform Edge Networkに接続するための初期コンポーネントの設定
1. Target 拡張機能と Decisioning 拡張機能を置き換えるために基本実装を更新します
1. 特定の使用例に合わせてSDKの最適化の実装を強化します。 これには、追加のパラメーターを渡したり、応答トークンを使用したりすることが含まれる場合があります。
1. プロファイルスクリプト、アクティビティ、オーディエンス定義など、Target インターフェイスのオブジェクトを更新します
1. 実稼動環境に切り替える前に、最終的な実装を検証します

## Target 拡張機能と Decisioning 拡張機能の主な違い

移行プロセスを開始する前に、Target 拡張機能と Decisioning 拡張機能の違いを理解することが重要です。

### 運用の違い

| | Target at.js 2.x | Platform Web SDK |
|---|---|---|
| プロセス | Target 実装に対する変更は、Analytics などの他のアプリケーションとは異なるケイデンスや QA 要件を持つプロセスに従う場合があります。 | 意思決定拡張機能の実装を変更する場合は、すべてのダウンストリームアプリケーションを考慮し、それに応じて QA および公開プロセスを調整する必要があります。 |
| コラボレーション | Target に固有のデータは、Target 呼び出しで直接渡すことができます。 Target レポートソースがAdobe Analyticsの場合、Target コンテンツの表示とインタラクションのために Target 拡張機能で適切なトラッキングメソッドが呼び出される際に、Target に固有のデータをAdobe Analyticsに渡すこともできます。 | Target レポートソースがAdobe Analyticsで、Adobe Analyticsがデータストリームで有効になっており、Target コンテンツが表示および操作される際に、Decisioning 拡張機能の適切なトラッキングメソッドが呼び出される場合、Decisioning 拡張機能の呼び出しで渡されたデータは、Target と Analytics の両方に転送できます。 |

### 技術的違い

| | ターゲット拡張機能 | Decisioning 拡張機能 |
|---|---|---|
| 依存関係 | Mobile Core SDKにのみ依存 | Mobile Core とEdge NetworkSDKに依存 |
| ライブラリ機能 | Adobe Targetからのコンテンツの取得のみをサポート | Adobe TargetおよびOffer decisioningからのコンテンツの取得をサポート |
| リクエスト | Target 呼び出しは、他のネットワーク呼び出しからほとんど独立しています | Target ネットワーク呼び出しは、Edge SDKでのメッセージングなどの他のEdge ベースのソリューションのネットワーク呼び出しと共にキューに入れられ、連続して実行されます。 |
| Edge Network | Target サーバーの値またはAdobe Experience CloudEdge Networkを、両方ともデータ収集 UI の [Target 設定 ](https://developer.adobe.com/client-sdks/solution/adobe-target/#configure-the-target-extension-in-the-data-collection-ui) で指定されたクライアントコード（clientcode.tt.omtrdc.net）で使用します | データ収集 UI のAdobe Experience Platform [Edge Network設定 ](https://developer.adobe.com/client-sdks/edge/edge-network/#configure-the-edge-network-extension-in-data-collection-ui) で指定されたEdge ネットワークドメインを使用します。 |
| 基本用語 | mbox、TargetParameters | ターゲットパラメーターの DecisionScope, Map （Android）/辞書（iOS） |
| デフォルトコンテンツ | ネットワーク呼び出しが失敗した場合やエラーが発生した場合に返される、クライアントサイドのデフォルトコンテンツを TargetRequest で渡すことを許可します。 | クライアントサイドのデフォルトコンテンツを渡すことはできません。 ネットワーク呼び出しが失敗した場合やエラーが発生した場合に、コンテンツを返さない。 |
| ターゲットパラメーター | リクエストごとにグローバル TargetParameters を渡し、mbox ごとに異なる TargetParameters を渡すことができます。 | リクエストごとにグローバル TargetParameters のみを渡すことができます |

次に、詳細な [Target 拡張機能と Decisioning 拡張機能の比較 ](detailed-comparison.md) を確認して、技術的な違いをより深く理解し、さらに焦点を当てる必要がある領域を特定します。

>[!NOTE]
>
>アドビは、Target 拡張機能から Decisioning 拡張機能への Mobile Target の移行を成功させるために取り組んでいます。 移行の際に問題が発生した場合、またはこのガイドに重要な情報が欠落していると感じる場合は、[ このコミュニティのディスカッション ](https://experienceleaguecommunities.adobe.com/t5/adobe-experience-platform-data/tutorial-discussion-migrate-target-from-at-js-to-web-sdk/m-p/575587#M463) に投稿してお知らせください。
