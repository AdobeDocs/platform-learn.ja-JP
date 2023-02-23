---
title: 移行の概要 | at.js 2.x から Web SDK への Target の移行
description: at.js と Platform Web SDK の主な違いと、移行作業の計画方法について説明します。=
source-git-commit: 287ebcb275c4fca574dbd6cdf7e07ba4268bddb5
workflow-type: tm+mt
source-wordcount: '802'
ht-degree: 1%

---

# Target の at.js から Platform Web SDK への移行の概要

at.js から Platform Web SDK に移行する際の作業レベルは、現在の実装と製品機能が複雑であるかどうかによって異なります。

実装がどれだけシンプルで複雑であっても、移行前に現在の状態を完全に理解することが重要です。 このガイドは、現在の実装のコンポーネントを分類し、各コンポーネントを移行するための管理しやすいプランを作成する場合に役立ちます。

移行プロセスには、次の主な手順が含まれます。

1. 現在の実装を評価し、移行アプローチを決定する
1. Adobe Experience Platform Edge Network に接続するための初期コンポーネントの設定
1. at.js を Platform Web SDK で置き換えるための、基本的な実装の更新
1. 特定の使用例に対して、 Platform Web SDK の実装を強化します。 これには、追加のパラメーターを渡す場合や、シングルページアプリ (SPA) ビューの変更を考慮する場合、レスポンストークンを使用する場合などが含まれます。
1. プロファイルスクリプト、アクティビティ、オーディエンス定義など、Target インターフェイスのオブジェクトの更新
1. 実稼動環境で切り替えを行う前に、最終的な実装を検証します。

## at.js と Platform Web SDK の主な違い

移行プロセスを開始する前に、at.js と Platform Web SDK の違いを理解しておくことが重要です。

### 運用上の相違点

Platform Web SDK は、複数のライブラリアプリケーションの機能を組み合わせて、1 つのAdobeにします。 この統合されたアプローチは、健全な実装を確実におこなうために、チームをまたいだ責務とプロセスを検討する必要があることを意味します。

|  | Target at.js 2.x | Platform Web SDK |
|---|---|---|
| 所有権 | at.js ライブラリは、他のアプリケーションライブラリとは独立しています。 これらの異なるライブラリのカスタマイズと所有権は、組織内の異なるチームに合わせられる場合があります。 | Platform Web SDK ライブラリと渡されたデータは、すべてのプラットフォームアプリケーションで統合Adobeされます。 Platform Web SDK 実装の所有権は、すべてのダウンストリームアプリケーションの関係者を表す必要があります。 |
| メンテナンス | Target や Analytics など、各Adobeアプリケーションの実装の強化について、個別のチームが作業する場合があります。 | Platform Web SDK の実装に影響を与える機能強化は、1 人のチームが担当するのが理想です。 |
| プロセス | Target の実装に対する変更は、Analytics などの他のアプリケーションとは異なるケイデンスや QA の要件を持つプロセスに従う場合があります。 | Platform Web SDK の実装に対する変更では、すべてのダウンストリームアプリケーションを考慮し、それに応じて QA および公開プロセスを調整する必要があります。 |
| コラボレーション | Target に固有のデータは、Target の呼び出しで直接渡すことができます。 実装によっては、追加の Target 呼び出しが存在する場合があります。 これは、Adobe Analyticsのデータに直接影響を与えず、分析チームとの調整もそれほど重要ではありません。 | Platform Web SDK 呼び出しで渡されたデータは、Target と Analytics の両方に転送できます。 チーム間の調整は、変更が特定のアプリケーションに悪影響を与えないようにするために必要です。 |

### 技術的な違い

Platform Web SDK は、Target at.js ライブラリの進化ではありません。 これは、Web チャネル用のすべてのAdobeアプリケーションを実装するための新しい統合されたアプローチです。 注意すべき技術的な違いがいくつかあります。

|  | Target at.js 2.x | Platform Web SDK |
|---|---|---|
| ライブラリ機能 | at.js が提供する Target 機能です。 Visitor.js および AppMeasurement.js によって提供される他のアプリケーションとの統合 | 単一の Platform Web SDK ライブラリが提供するすべてのAdobeアプリケーションの機能：alloy.js |
| パフォーマンス | at.js は、アプリケーション間で適切に統合するために読み込む必要がある複数のライブラリの 1 つです。 この結果、最適な読み込み時間よりも短くなります。 | Platform Web SDK は、複数のアプリケーション専用ライブラリを不要にし、ページ読み込みパフォーマンスを向上させる、単一の軽量ライブラリです。 |
| リクエスト | 各アプリケーションの呼び出しを個別にAdobeします。 Target 呼び出しは、他のネットワーク呼び出しとは大きく独立しています。 | すべてのAdobe・アプリケーションに対する 1 回の呼び出し。 これらの呼び出しで渡されるデータに対する変更は、複数のダウンストリームアプリケーションに影響を与える可能性があります。 |
| 読み込み順序 | 他のAdobeアプリケーションと適切に統合するには、ライブラリとネットワーク呼び出しの特定の読み込み順序が必要です。 | 適切な統合は、異なるアプリケーション固有のネットワーク呼び出しからのデータを結び付けることに依存しないので、読み込み順序は問題になりません。 |
| Edge Network | Adobe Experience Cloud Edge Network(tt.omtrdc.net) を使用します。オプションで、Target 固有の CNAME を使用します。 | Adobe Experience Platform Edge Network(edge.adobedc.net) を使用します。オプションで、単一の CNAME を使用します。 |
| 基本用語 | at.js の命名： <br> - `mbox` <br> - `pageLoad` イベント（グローバル mbox） <br> - `offer` | Platform Web SDK に相当するもの： <br> - `decisionScope` <br> - `__view__` decisionScope <br> - `proposition` |

### ビデオの概要

次のビデオでは、Adobe Experience Platform Web SDK とAdobe Experience Platform Edge Network の概要を説明します。

>[!VIDEO](https://video.tv.adobe.com/v/34141/?quality=12&learn=on)

これで、at.js と Platform Web SDK の大まかな違いを理解できました。 [移行の計画](plan-migration.md).

>[!NOTE]
>
>at.js から Web SDK への Target の移行を成功に導くための支援に努めています。 移行時に障害が発生した場合や、このガイドに重要な情報が欠落していると思われる場合は、 [このコミュニティディスカッション](https://experienceleaguecommunities.adobe.com/t5/adobe-experience-platform-data/tutorial-discussion-migrate-target-from-at-js-to-web-sdk/m-p/575587#M463).