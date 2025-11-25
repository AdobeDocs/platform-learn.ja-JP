---
title: Agent Orchestratorの概要
description: Agent Orchestratorの概要
kt: 5342
doc-type: tutorial
source-git-commit: ffdc6b34a82c945c142f433f65a4f2f8d5cdcd18
workflow-type: tm+mt
source-wordcount: '1514'
ht-degree: 0%

---

# 1.1.1 Agent Orchestratorの概要

## Agent Orchestratorでのコンテキストの 1.1.1.1 定

[https://experience.adobe.com/#/@experienceplatform/ai-assistant/chat](https://experience.adobe.com/#/@experienceplatform/ai-assistant/chat) に移動します。

この画像が表示されます。 **Experience Platform インターナショナル** に所属していることを確認してください。

![Agent Orchestrator](./images/ao1.png)

**context** ウィンドウをクリックします。

![Agent Orchestrator](./images/ao2.png)

コンテキストをに設定します。

- **ドキュメントSource**:**Customer Journey Analytics**
- **サンドボックス**: **高速化**
- **Dataview**:**2026 B2C の高速化**

**コンテキストを設定** をクリックします。

![Agent Orchestrator](./images/ao3.png)

>[!NOTE]
>
>このラボでは、分析とオーケストレーションの間を移動する際に、コンテキストを切り替えます。

## 1.1.1.2 購入トレンド全体から始めて、コンテキストを固定し、ファイバーにズームインする

**目的**：特に最新 60 日間、カテゴリの需要（モバイル、固定電話、インターネット、テレビ、ファイバー）に応じてトップレベルのパルスを取得します。 これにより、NY ロールアウト後の季節性、プロモ効果、地域差のベースラインが設定されます。

**考え**:

「Fiber は postNY でシェアを獲得していますか？ 銅線/DSL インターネットの競合は発生していますか。 ミックスシフトとテレビバンドルの違いは何ですか？」

「これは、私がウィーンのアドレス可能なオーディエンスのサイズを決め、現実的な目標を設定するのに役立ちます。」

**マーケターが想定する、実用的な読み上げ**:

mainCategory 別の購入の積み重ね棒/折れ線グラフ（日次/週次グレイン）。

カテゴリ別購入シェアと前期の割合。

プロモーションの日付と関連する注目すべきスパイク。

次の **プロンプト** を入力し、「**生成**」ボタンをクリックします。

```javascript
Show me purchases by mainCategory over the last 2 months.
```

![Agent Orchestrator](./images/ao4.png)

次の情報が表示されます。

>[!NOTE]
>
>属性のラグに注目してください。一部のレガシースキーマでは、ファイバー注文が「インターネット」でキャプチャされる場合があります。 その場合は、決定の前に分類を調整します。

![Agent Orchestrator](./images/ao5.png)

次の **プロンプト** を入力し、「**生成**」ボタンをクリックします。

`Show me purchases by mainCategory = Fiber over the last 2 months per week`

![Agent Orchestrator](./images/ao6.png)

これを確認すると、ファイバ固有のトレンドにドリル・ダウンされます。

**アクション**：成長曲線と地域のスパイクに注意してください。

![Agent Orchestrator](./images/ao7.png)

## 注文 1.1.1.3 コンテンツの環境設定に関連付けるには

**目的**：コンテンツの環境設定（SciFi、スポーツ、ドラマなど）で、特に広帯域幅のニーズに対してブロードバンドのアップグレード動作が予測されるという仮説をテストします。

**考え中**

「SciFi ファンは 4K を見て複数のデバイスからストリーミングすることが多く、低遅延を評価する可能性が高い。」

「SciFi （そして多分スポーツ）が最近の注文と相関関係があるかどうかを定量化しましょう。」

**期待される出力**

過去 2 か月に限定された、優先ジャンル別に分類された注文のピボット （YTD フィルター適用済み）。

ジャンルは受注コンバージョン率および AOV （平均受注額）でランク付けされます。

決定：SciFi が強いシグナルを示した場合、これはウィーンの Fiber Max の打ち上げの主要なクリエイティブの柱になります（例えば、「再びバッファーしない」メッセージ、プレミアムバンドル）。

**故意**

ジャンル（SF、スポーツなど）別にコンバージョンを分析します。

**目標** ファイバ・アップグレードに関する SF ファンのインデックスが過剰であるかどうかを検証します。

次の **プロンプト** を入力し、「**生成**」ボタンをクリックします。

```javascript
Show me ordersYTD by preferredGenre for the last 2 months
```

![Agent Orchestrator](./images/ao8.png)

次の情報が表示されます。

![Agent Orchestrator](./images/ao9.png)

## 既存のファイバジャーニーを特定 1.1.1.4 る

**context** ウィンドウをクリックします。

![Agent Orchestrator](./images/ao10.png)

コンテキストをに設定します。

- **ドキュメントSource**:**Adobe Journey Optimizer**
- **サンドボックス**: **高速化**
- **Dataview**:**2026 B2C の高速化**

![Agent Orchestrator](./images/ao11.png)

**目的** タイトルに「ファイバ」が含まれているアクティブなジャーニーまたは最近締結されたジャーニーを特定します（例：「ファイバアップグレード NYC - 9 月」、「ファイバ体験版 – ストリーミングバンドル」）。

**考え中**

「これらのジャーニーのうち、どのジャーニーが適切に機能し、どのようなトリガーを持っていたか？」

「ウィーンの勝者オーケストレーションロジックを再利用できますか？」

**期待される出力**

ステータス（アクティブ、一時停止、終了）、日付範囲、ターゲットセグメント、KPI （開封率、CTR、コンバージョン）を含むジャーニーのリスト。

次のステップ：クローン作成/適合化のために、成功したファイバジャーニーを 1 つか 2 つ絞り込みます。

次の **プロンプト** を入力し、「**生成**」ボタンをクリックします。

```javascript
What journeys exist? 
```

![Agent Orchestrator](./images/ao12.png)

次の情報が表示されます。

![Agent Orchestrator](./images/ao13.png)

ファイバーメッセージを使用して、アクティブなジャーニーや過去のジャーニーをリストします。

アクション：複製する高パフォーマンスのジャーニーを絞り込みます。

次の **プロンプト** を入力し、「**生成**」ボタンをクリックします。

```javascript
Which of these journeys has 'Fiber' in its name?
```

![Agent Orchestrator](./images/ao14.png)

次の情報が表示されます。

![Agent Orchestrator](./images/ao15.png)

## 1.1.1.5 シードを確認

**目的**:

「CitiSignal - Fiber Max Launch Promotion」ジャーニーのシード定義を理解します。ターゲット設定を促した特性は何ですか（例：「SciFi Genre Preference」、「4+ devices」、「stream ≥ 300GB/month」）。

**考え中**

「実績のある SciFi クリエイティブと Fibre Max パフォーマンス・メッセージを組み合わせたい。」

「オーディエンスが大量のダウンローダーと重なっていると、傾向を積み重ねることができます。」

**期待される出力**

オーディエンス条件（包含/除外）、オーディエンスサイズ、地域フィルター、最新性、頻度しきい値。

>[!NOTE]
>
>コンテキストをCJAに変更

これ以降、マーケターは適切なレポートを確実に作成するために、分析モードに切り替えます。

次の **プロンプト** を入力し、「**生成**」ボタンをクリックします。

```javascript
What was the initial audience in the journey named 'CitiSignal - Fiber Max Launch Promotion'?
```

![Agent Orchestrator](./images/ao16.png)
オーディエンス条件（ストリーミング習慣、デバイス数）を確認します。

**目標**：広帯域幅のニーズに対する特性を理解する。

## 1.1.1.6 フォールアウト分析によるジャーニーのパフォーマンスの検証

次の **プロンプト** を入力し、「**生成**」ボタンをクリックします。

```javascript
Create a fall-out report on the "CitiSignal - Fiber Max Launch Promotion" journey
```

>[!NOTE]
>
>コンテキストをCJAに変更）

**目的**:

Customer Journey Analyticsでの段階的なfunnelの構築

配信済み→開→済み→ クリック済み→製品表示→買い物かごに追加→ チェックアウト →注文完了

ファイバー関連の SKU ビューを分岐として含めます。

**考え**:

「メールの開封、ランディングページの読み込み、PDP、チェックアウトの問題など、ユーザーが失われる状況はどこにありますか？」

「SciFi ユーザーはファイバー PDP で平均よりも多く、または少なくバウンスしますか？」

**期待される出力**:

各ステップでのドロップオフ率を備えたフォールアウトビジュアライゼーション。

セグメントオーバーレイ（Sf vs スポーツ vs その他）。

技術的な摩擦に対するデバイス/ブラウザーの分類。

**決定**:

チェックアウトのドロップオフが大きい場合は、製品/UX と調整して支払いフローを修正します。

PDP の出口が大きい場合は、クレームの明確さ（速度、インストール時間、バンドル値）を修正します。

>[!NOTE]
>
>コンテキストを JO に変更

これで、マーケターはオーケストレーションとオーディエンス運用のためにAdobe Journey Optimizerに移動します。

次の **プロンプト** を入力し、「**生成**」ボタンをクリックします。

```javascript
Create a fall-out report on the "CitiSignal - Fiber Max Launch Promotion" journey 
```

funnelを作成ビジュアライゼーション：配信され→注文のチェックアウト→開→またはクリック→ます。

**アクション**：ドロップオフポイントを特定し、メッセージングまたは UX を最適化します。

## 1.1.1.7 高使用率に合わせた既存オーディエンスの検索

次の **プロンプト** を入力し、「**生成**」ボタンをクリックします。

```javascript
Is there an audience that has "heavy downloaders" in the title?
```

>[!NOTE]
>
>コンテキストをAdobe Journey Optimizerに変更

**目的**:

「大量のダウンローダー」という名前の JO オーディエンスを見つけます。これは、毎月のデータ使用しきい値、ストリーミング時間、デバイスの同時実行性によって定義される可能性が高いです。

**考え**:

「Heavy Downloaders のようなオーディエンスが存在する場合は、Fiber Max の位置づけに最適です。スピード、信頼性、無制限の階層。」

**期待される出力**:

オーディエンスメタデータ：定義条件、サイズ、最終更新、ガバナンスタグ、地域の可用性。

データ使用量が多いオーディエンスを見つけます。

**目標**:Fiber Max ターゲティングの SF 環境設定と組み合わせます。

## 1.1.1.8 これらのオーディエンスが既に使用されているかどうかを判断します

**目的**:

オーディエンスとジャーニーの連携を確認 – 重複や現在のプログラムとの競合を避けます。

**考え**:

「ヘビーダウンローダーがすでにリテンションのジャーニーに入っている場合、疲労を避けるために抑制ロジックまたはフリークエンシーキャップが必要です。」

**期待される出力**:

マッピング：オーディエンス → ジャーニー名、ステータス、連絡先ポリシー、最終送信、パフォーマンス。

**決定**:

使用している場合は、ウィーンでのローンチ用に除外または共有抑制を作成します。

使用されていない場合は、新しいジャーニー用の greenlight。

次の **プロンプト** を入力し、「**生成**」ボタンをクリックします。

```javascript
Which of the above are used in a journey? 
```

アクティブなキャンペーンと重複しないようにします。

**アクション**：必要に応じて抑制を適用します。

## 1.1.1.9 Fibre Max Launch の新しいジャーニーを作成

**目的**:

複合オーディエンスをターゲットにした新しいジャーニーを作成します。

重いダウンローダー∩SciFi 環境設定（kbaa_5207bf オーディエンスキー）。

**考え**:

「これは Fiber Max のスイートスポットです：高い傾向+創造的な関連性。」

「私たちは、ウィーンの可用性に関連したマルチタッチエクスペリエンスを調整します。」

**ジャーニーデザイン （JO）**:

エントリ条件：

観客：重いダウンローダー – サイエンスフィクション_BBAA_5207bf

地域：ウィーン地下鉄（郵便番号リストまたは地域ポリゴン）

実施要件：アクティブな「ファイバアップグレード NYC - 9 月」キャンペーンではなく、現在のファイバ加入者ではありません。

トリガーとタイミング：

ウィーンのローンチ 14 日前（2026 年 1 月）:「Fiber Max が登場します。」のプレビューメール。

Launch week:プライマリメール + アプリ内バナー+ ペイドメディア同期（CDP 宛先経由）。

T+3 日：動作の分割：クリックがない場合は、SMS ナッジ。クリックされたが注文しなかった場合は、インストーラーの可用性をCTAでリターゲットします。

T+10 日間：オファーテスト – 無料インストールと 1 か月目の割引（A/B）の比較。

Personalization:

SF 愛好家のための動的コピー（待ち時間/4K ストリーミングフック）。

デバイスの組み合わせ（ゲームコンソール、ストリーミングボックス）に合わせて調整された速度/待ち時間の請求。

バンドルの推奨：Fibre Max + プレミアム TV SCIFI コンテンツパック。

ガバナンス：

フリークエンシーキャップ：10 日あたり最大 3 回のタッチ。

現在のファイバ サブスクライバの場合、またはインストール用のチケットが存在する場合は抑制します。

オプトアウト環境設定に従います。

**計量計画（CJA）**:

追跡：配信、オープン、クリック、PDP 表示、チェックアウト開始、注文完了。

KPI：ファイバの最大使用量へのコンバージョン率、アップライトとコントロール、インストール時間。

診断：デバイス/ジャンルセグメントごとのフォールアウトレポート。

これをすべて統合する方法（マーケターのメンタルモデル）

需要を診断する（全体的なカテゴリ→特にファイバ）。

コンテンツをコンバージョン信号（ジャンル別の順序）に対して証明します。

成功したジャーニーを探す（Fibernamed ジャーニーと SciFi プロモーションオーディエンスを見つける）。

摩擦ポイントを検証します（SciFi ジャーニーでのCJA フォールアウト）。

傾向が高いセグメント（大量のダウンローダー∩SciFi）に対してアクティブ化します。

[https://experience.adobe.com/#/@experienceplatform/ai-assistant/chat](https://experience.adobe.com/#/@experienceplatform/ai-assistant/chat) に移動します。

この画像が表示されます。 **Experience Platform インターナショナル** に所属していることを確認してください。

**context** ウィンドウをクリックします。

![Agent Orchestrator](./images/ao2.png)

コンテキストをに設定します。

- **ドキュメントSource**:**Journey Optimizer**
- **サンドボックス**: **高速化**
- **Dataview**:**2026 B2C の高速化**

**コンテキストを設定** をクリックします。

![Agent Orchestrator](./images/aoea3.png)

次の **プロンプト** を入力し、「**生成**」ボタンをクリックします。

```javascript
Create a  journey towards the audience Heavy Downloaders - Sci-Fi Preference_kbaa_5207bf. The journey is for the rollout of fiber broadband. There will 2 versions of an email  based on  a split of the audience based on who is in the "Eligble for Fiber upgrade" audience.  After 3 days, profiles from both email treatments who have not purchased fibre max will be sent a follow up email. 
```

![Agent Orchestrator](./images/aocj1.png)

この画像が表示されます。 `yes` と入力し、「生成」をクリックします。

![Agent Orchestrator](./images/aocj2.png)

この画像が表示されます。 `yes` と入力し、「生成」をクリックします。

![Agent Orchestrator](./images/aocj3.png)

この画像が表示されます。 `The first one` と入力し、「生成」をクリックします。

![Agent Orchestrator](./images/aocj4.png)

この画像が表示されます。 `yes` と入力し、「生成」をクリックします。

![Agent Orchestrator](./images/aocj5.png)

応答を確認します。 `yes` と入力し、「生成」をクリックします。

![Agent Orchestrator](./images/aocj6.png)

**レビュー** をクリックします。

![Agent Orchestrator](./images/aocj7.png)

ジャーニー名を LDAP で更新して、一意にします。 「**保存**」をクリックします。

![Agent Orchestrator](./images/aocj8.png)

これで、ジャーニーがドラフトモードで作成されました。

![Agent Orchestrator](./images/aocj9.png)

## 1.1.1.10 実験

[https://experience.adobe.com/#/@experienceplatform/ai-assistant/chat](https://experience.adobe.com/#/@experienceplatform/ai-assistant/chat) に移動します。

この画像が表示されます。 **Experience Platform インターナショナル** に所属していることを確認してください。

**context** ウィンドウをクリックします。

![Agent Orchestrator](./images/ao2.png)

コンテキストをに設定します。

- **ドキュメントSource**:**Journey Optimizer**
- **サンドボックス**: **高速化**
- **Dataview**:**2026 B2C の高速化**

**コンテキストを設定** をクリックします。

![Agent Orchestrator](./images/aoea3.png)

次の **プロンプト** を入力し、「**生成**」ボタンをクリックします。

```javascript
How are the experiments performing for the journey named 'CitiSignal - Fiber Max Launch Promotion'?
```

![Agent Orchestrator](./images/aoea0.png)

次の情報が表示されます。

![Agent Orchestrator](./images/aoea1.png)

提案をクリックして各処理のコンバージョン率を比較し、「**生成**」をクリックします。

![Agent Orchestrator](./images/aoea2.png)

次のような詳細な比較が表示されます。

![Agent Orchestrator](./images/aoea4.png)

[Agent Orchestrator](./agentorchestrator.md){target="_blank"} に戻る

[&#x200B; すべてのモジュールに戻る &#x200B;](./../../../overview.md){target="_blank"}