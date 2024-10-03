---
title: 移行の概要 – Target を at.js 2.x から Web SDK に移行する
description: at.js と Platform Web SDK の主な違いと、移行作業の計画方法について説明します。
exl-id: a8ed78e4-c8c2-4505-b4b5-e5d508f5ed87
source-git-commit: d4308b68d6974fe47eca668dd16555d15a8247c9
workflow-type: tm+mt
source-wordcount: '796'
ht-degree: 1%

---

# Target at.js から Platform Web SDK への移行の概要

at.js から Platform Web SDK への移行の取り組みレベルは、現在の実装と使用している製品機能の複雑さに応じて異なります。

実装がどんなに単純でも、複雑でも、移行前に現在の状態を完全に理解することが重要です。 このガイドを使用すると、現在の実装のコンポーネントを分類し、各コンポーネントを移行する管理可能な計画を作成できます。

移行プロセスには、次の主な手順が含まれます。

1. 現在の実装を評価し、移行アプローチを決定
1. Adobe Experience Platform Edge Networkに接続するための初期コンポーネントの設定
1. at.js を Platform Web SDK に置き換えるための基本実装の更新
1. 特定のユースケースに対応するように Platform Web SDK の実装を強化します。 これには、追加のパラメーターの受け渡し、シングルページアプリ（SPA）ビューの変更の課金、レスポンストークンの使用などが含まれる場合があります。
1. プロファイルスクリプト、アクティビティ、オーディエンス定義など、Target インターフェイスのオブジェクトを更新します
1. 実稼動環境に切り替える前に、最終的な実装を検証します

## at.js と Platform Web SDK の主な違い

移行プロセスを開始する前に、at.js と Platform Web SDK の違いを理解することが重要です。

### 運用の違い

Platform Web SDK は、複数のAdobeアプリケーションの機能を 1 つのライブラリに組み合わせます。 この統一されたアプローチにより、健全な実装を確保するために、チーム間の責任とプロセスを考慮する必要があります。

| | Target at.js 2.x | Platform Web SDK |
|---|---|---|
| 所有権 | at.js ライブラリは、他のアプリケーションライブラリとは独立しています。 これらの異なるライブラリのカスタマイズと所有権は、組織内の異なるチームに一致する場合があります。 | Platform Web SDK ライブラリと渡されるデータは、すべてのAdobeアプリケーション用に統合されます。 Platform Web SDK 実装の所有権は、すべてのダウンストリームアプリケーションの関係者を表す必要があります。 |
| メンテナンス | Target や Analytics など、Adobeアプリケーションごとに個別のチームが実装機能強化に取り組むこともあります。 | Platform Web SDK の実装に影響を与える機能強化については、1 つのチームが担当するのが理想的です。 |
| プロセス | Target 実装に対する変更は、Analytics などの他のアプリケーションとは異なるケイデンスや QA 要件を持つプロセスに従う場合があります。 | Platform Web SDK 実装を変更する場合は、すべてのダウンストリームアプリケーションを考慮し、それに応じて QA および公開プロセスを調整する必要があります。 |
| コラボレーション | Target に固有のデータは、Target 呼び出しで直接渡すことができます。 実装によっては、追加の Target 呼び出しが存在する場合があります。 これは、Adobe Analyticsのデータに直接影響せず、分析チームとの調整はそれほど重要ではありません。 | Platform Web SDK 呼び出しで渡されるデータは、Target と Analytics の両方に転送できます。 変更が特定のアプリケーションに悪影響を与えないようにするには、チーム間の調整が必要です。 |

### 技術的違い

Platform Web SDK は、Target at.js ライブラリを進化させたものではありません。 これは、Web チャネル用のすべてのAdobeアプリケーションを実装するための新しい統一されたアプローチです。 注意すべき技術的な違いがいくつかあります。

| | Target at.js 2.x | Platform Web SDK |
|---|---|---|
| ライブラリ機能 | at.js が提供する Target 機能。 Visitor.js および Application.js が提供するその他のAppMeasurementとの統合 | 1 つの Platform Web SDK ライブラリで提供されるすべてのAdobeアプリケーションの機能：alloy.js |
| パフォーマンス | at.js は、アプリケーション間で適切に統合するために読み込む必要がある複数のライブラリの 1 つです。 その結果、最適な読み込み時間に満たない。 | Platform Web SDK は、複数のアプリケーション固有のライブラリを不要にする単一の軽量ライブラリであり、ページ読み込みのパフォーマンスを向上させます。 |
| リクエスト | Adobeアプリケーションごとに個別の呼び出し。 Target 呼び出しは、他のネットワーク呼び出しとは大きく独立しています。 | すべてのAdobeアプリケーションに対して 1 回の呼び出し。 これらの呼び出しで渡されるデータに変更を加えると、複数のダウンストリームアプリケーションに影響を与える可能性があります。 |
| 読み込み順序 | 他のAdobeアプリケーションと適切に統合するには、ライブラリとネットワーク呼び出しの特定の読み込み順序が必要です。 | 適切な統合は、異なるアプリケーション固有のネットワークコールからのデータのステッチに依存しないので、読み込み順序は問題になりません。 |
| Edge Network | オプションで、Target 固有の CNAME を使用して、Adobe Experience Cloud Edge Network（tt.omtrdc.net）を使用します。 | オプションで、1 つの CNAME でAdobe Experience Platform Edge Network（edge.adobedc.net）を使用します。 |
| 基本用語 | at.js の名前：<br> - `mbox` <br> - `pageLoad` イベント（グローバル mbox） <br> - `offer` | Platform Web SDK と同等の機能：<br> - `decisionScope` <br> - `__view__` decisionScope <br> - `proposition` |

### ビデオの概要

次のビデオでは、Adobe Experience Platform Web SDK とAdobe Experience PlatformのEdge Networkの概要を説明します。

>[!VIDEO](https://video.tv.adobe.com/v/34141/?learn=on)

at.js と Platform Web SDK の大きな違いを理解したら、[ 移行を計画 ](plan-migration.md) できます。

>[!NOTE]
>
>アドビは、at.js から Web SDK への Target の移行を成功させるために取り組んでいます。 移行の際に問題が発生した場合、またはこのガイドに重要な情報が欠落していると感じる場合は、[ このコミュニティのディスカッション ](https://experienceleaguecommunities.adobe.com/t5/adobe-experience-platform-data/tutorial-discussion-migrate-target-from-at-js-to-web-sdk/m-p/575587#M463) に投稿してお知らせください。
