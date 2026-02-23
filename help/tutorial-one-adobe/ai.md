---
title: 概要 Agentic AI テクニカルラボ
description: 概要 Agentic AI テクニカルラボ
doc-type: multipage-overview
exl-id: 49515d00-05f6-4a28-96e0-dbdf66d8436b
source-git-commit: 1abfd8d1f270a810dd65d9921c69834df2a9147d
workflow-type: tm+mt
source-wordcount: '606'
ht-degree: 0%

---

# 概要 – Agentic AI テクニカルラボ

![&#x200B; 技術インサイダー &#x200B;](./assets/images/techinsiders.png){width="50px" align="left"}

## 概要 – 処理中の作業

[1.1 Agent Orchestrator](./modules/agents/module1.1/agentorchestrator.md)

**目標**

Adobe Experience Platform エージェントとAgent Orchestratorを使用して以下を行う方法を説明します。

- 購入トレンドの分析
- 傾向の高いオーディエンスの特定
- ジャーニーのパフォーマンスの検証
- CitiSignal Fiber Max ロールアウトの新しいジャーニーを作成します

[1.2 エージェントと AI の基本を学ぶ](./modules/agents/module1.2/agenticai.md)

>[!NOTE]
>
>このモジュールはまだリリースされていません。

**目標**

独自のエージェントを構築します。

学習者は、LLM を使用してリクエストを分析する独自のエージェントを作成します。 その後、リクエストの分析を使用して、指示を含むプランが作成され、1 つずつ実行されます。 これを可能にするには、エージェントはどのスキルが利用可能であるかを理解する必要があります。 学習者は様々なスキルを自分で構築します。これらのスキルはそれぞれ MCP サーバーを使用して構築され、Adobe Firefly Services、Workfront Fusion などのAdobe製品 API を使用します。

- Image GenAI
- テキスト生成 AI

エージェントの背後にあるアーキテクチャはどのようなものですか？

技術的要素：

- Azure AI Foundry、LLM、共同パイロット
- n8n
- MCP サーバー、Python ノートブック
- ADOBE API

[1.4 Brand Concierge](./modules/agents/module1.4/brandconcierge.md)

**目標**

Brand Conciergeは、AI を活用して、企業と Web サイト訪問者の関わり方を変えるデジタルコンパニオンです。 一般的なチャットボットとは異なり、Brand Conciergeは各訪問者の意図に合わせてパーソナライズされた対話型エクスペリエンスを提供します。 訪問者が製品を発見し、オプションを比較し、即座に回答を得て、ガイド付きのレコメンデーションをリアルタイムで受け取るのに役立ちます。 プラットフォームは、B2C と B2B の両方に対応し、ブランドの声、コンテンツの整合性、コンプライアンスを維持しながら、あらゆるデジタルチャネルでブランドのインテリジェントな拡張として機能します。

この演習では、次の方法を学びます。

- Adobe Experience Platform サンドボックスでのBrand Concierge インスタンスの設定
- AEM CS/EDS Web サイトへのBrand Conciergeの実装

[1.5 Analytics およびエージェント](./modules/agents/module1.5/analyticsagents.md)

**目標**

データアナリスト、AI 開発者、または AI アプリケーションアーキテクトとして、外部エージェントを使用したレポート作成、スケジュール分析などのレポートタスクを自動化する方法を学びます。 新しいキャンペーンデータ、オーディエンスデータまたはパフォーマンスデータをエージェンティックワークフローに取り込む方法を説明します。

この演習では、次の方法を学びます。

- ChatGPT や Claude.ai を **Customer Journey Analytics** に接続して、データ分析タスクを実行します
- ChatGPT や Claude.ai を **Adobe Analytics** に接続して、データ分析タスクを実行します

[1.6 AEMおよびエージェント &#x200B;](./modules/agents/module1.6/aemagents.md){target="_blank"}

**目標**

Adobe Experience Managerには、今では専用のエージェントがいくつか組み込まれており、それぞれが従来は大量の手作業が必要だった作業を行うように設計されています。 これらは一般的な AI アシスタントではなく、AEMを深く理解し、コンテンツ、コード、アセット、ガバナンスおよび最適化全体を扱う、ドメイントレーニング済みエージェントです。

- **Experience Production Agent**：アップデート、コンテンツ変更、さらには完全なサイト移行を加速します。
- **ガバナンスエージェント** は、ブランド、権限、コンプライアンスルールを自動的に適用します。
- **ディスカバリーエージェント** は、AI ネイティブの検出に向けてコンテンツを準備し、インテリジェントなストラテジストとして機能します。
- **コンテンツ最適化エージェント** は、パフォーマンスに対応した、チャネル固有のアセットバリエーションを即座に作成します。
- **開発エージェント** は、AI を利用したトラブルシューティングとパフォーマンスチューニングにより、開発者を高速化します。

この演習では、カスタム MCP サーバ セットアップを通じて、AI アシスタントとカーソルの両方を使用してこれらのエージェントを使用する方法を学習します。

[1.7 Adobe Commerce用のインテリジェント開発者ツール](./modules/agents/module1.7/aiassisteddev.md)

**目標**

このモジュールでは、Cursor などのインテリジェントな開発者ツールを使用して、Adobe Commerce as a Cloud Service環境に対する拡張機能を開発します。 この拡張機能の目標は、着信注文イベントをサードパーティのエンドポイントに転送することです。 Adobe Commerce as a Cloud Serviceのイベント転送は、Adobe I/O App Builder、Adobe I/O EventsおよびAdobe I/O Runtimeに依存します。 これらすべてのサービスの設定は、Cursor によって支援されます。

![&#x200B; 技術インサイダー &#x200B;](./assets/images/techinsiders.png){width="50px" align="left"}

>[!NOTE]
>
>ご不明な点がある場合は、have suggestions on future content の一般的なフィードバックをお知らせください。**techinsiders@adobe.com** に電子メールを送信して、技術インサイダーに直接問い合わせてください。
