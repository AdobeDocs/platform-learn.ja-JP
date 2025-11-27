---
title: Agent Orchestratorの概要
description: Agent Orchestratorの概要
kt: 5342
doc-type: tutorial
source-git-commit: 121cbb5ea8f8b713c6ebae008f7f0d9b3a79e476
workflow-type: tm+mt
source-wordcount: '1393'
ht-degree: 0%

---

# 1.1.1 Agent Orchestratorの概要

## ビデオ

このビデオでは、この演習に関係するすべての手順の説明とデモを行います。

>[!VIDEO](https://video.tv.adobe.com/v/3477257?quality=12&learn=on)

## Agent Orchestratorでのコンテキストの 1.1.1.1 定

[https://experience.adobe.com/#/@experienceplatform/ai-assistant/chat](https://experience.adobe.com/#/@experienceplatform/ai-assistant/chat) に移動します。

この画像が表示されます。 **Experience Platform インターナショナル** に所属していることを確認してください。

![Agent Orchestrator](./images/ao1.png)

**context** ウィンドウをクリックします。

![Agent Orchestrator](./images/ao2.png)

コンテキストをに設定します。

- **ドキュメントSource**:**Journey Optimizer**

ドキュメントのSource設定は、製品のナレッジ/Experience Leagueに関連する質問を確認するための experience league ドキュメントのセットを好みに設定するのに役立ちます。

- **サンドボックス**: **実稼動 – 高速化（VA7）**

サンドボックス設定は、質問をする際に AI Assistant が参照するサンドボックスを識別するのに役立ちます。

- **Dataview**:**2026 B2C の高速化**

データビュー設定は、質問をする際に AI Assistant が調べるデータビューを識別するのに役立ちます。

**コンテキストを設定** をクリックします。

![Agent Orchestrator](./images/ao3.png)

## 1.1.1.2 購入トレンド全体から始めて、コンテキストを固定し、ファイバーにズームインする

**インテント**

特に最新の 60 日間は、モバイル、固定電話、インターネット、テレビ、ファイバーなどのカテゴリニーズに応じてトップレベルのパルスを入手できます。 これにより、ニューヨークのロールアウト後の季節性、プロモ効果、地域差のベースラインが設定されます。

次の **プロンプト** を入力し、「**送信**」ボタンをクリックします。

```javascript
Show me purchases by mainCategory over the last 2 months.
```

![Agent Orchestrator](./images/ao4.png)

次の情報が表示されます。

![Agent Orchestrator](./images/ao5.png)

次の **プロンプト** を入力し、「**送信**」ボタンをクリックします。

```javascript
Show me purchases by mainCategory = Fiber over the last 2 months per week
```

![Agent Orchestrator](./images/ao6.png)

これを確認すると、ファイバ固有のトレンドにドリル・ダウンされます。

![Agent Orchestrator](./images/ao7.png)

## 注文 1.1.1.3 コンテンツの環境設定に関連付けるには

**インテント**

特定のジャンル（SF、スポーツ、ドラマなど）の好みが、特に高帯域幅のニーズに対して、ブロードバンドのアップグレード動作を予測するという仮説をテストします。

まず、ジャンルの環境設定を保存するために使用されているフィールドを見つける必要があります。

次の **プロンプト** を入力し、「**送信**」ボタンをクリックします。

```javascript
Which field is used to store the preferred genre?
```

![Agent Orchestrator](./images/ao7a.png)

これにより、genre に使用されるフィールドが **_experienceplatform.individualCharacteristics.preferences.preferredGenre** であることが示されます。

![Agent Orchestrator](./images/ao7b.png)

この情報を使用して、購入データのドリルダウンを開始できます。

次の **プロンプト** を入力し、「**送信**」ボタンをクリックします。

```javascript
Show me ordersYTD by preferredGenre for the last 2 months
```

![Agent Orchestrator](./images/ao8.png)

この画像が表示されます。 **推論完了** ブロックのアイコンをクリックすると、Agent Orchestratorでバックグラウンドで何が起きているかを把握できます。

![Agent Orchestrator](./images/ao9.png)

その後、同様の説明が表示されます。

![Agent Orchestrator](./images/ao10.png)

## 既存のファイバジャーニーを特定 1.1.1.4 る

**インテント**

タイトルに「Fibre」が含まれる、アクティブなジャーニーまたは最近終了したジャーニーを確認します（例：「Fibre Upgrade NYC - Sept」、「Fibre Trial - Streaming Bundle」）。

次の **プロンプト** を入力し、「**送信**」ボタンをクリックします。

```javascript
What journeys exist? 
```

![Agent Orchestrator](./images/ao12.png)

この画像が表示されます。 **詳細を表示** をクリックします。

![Agent Orchestrator](./images/ao13.png)

その後、アクティブなジャーニーまたは過去のジャーニーのリストが増えます。 **ダウンロード** アイコンをクリックして、これらのジャーニーのリストをダウンロードします。

![Agent Orchestrator](./images/ao13a.png)

AI アシスタントからのすべての出力を含む CSV ファイルが生成されます。

![Agent Orchestrator](./images/ao13b.png)

クリックして右側のウィンドウを閉じます。 次の **プロンプト** を入力し、「**送信**」ボタンをクリックします。

```javascript
Which of these journeys has 'Fiber' in its name?
```

![Agent Orchestrator](./images/ao14.png)

この画像が表示されます。 ジャーニーの 1 つのリンクをクリックし、「**ジャーニーの詳細**」を選択します。

![Agent Orchestrator](./images/ao15.png)

新しいウィンドウが開き、すぐにジャーニーの詳細の概要に移動します。

![Agent Orchestrator](./images/ao15a.png)

## 1.1.1.5 使用されているオーディエンスの確認

**目的**:

「CitiSignal - Fiber Max Launch Promotion」ジャーニーのシード定義を理解します。ターゲット設定を促した特性は何ですか（例：「SciFi Genre Preference」、「4+ devices」、「stream ≥ 300GB/month」）。

次の **プロンプト** を入力します。

```javascript
What was the initial audience in the journey named 
```

次に、オートコンプリートを有効にするには、`+CitiSignal fib` を手動で入力します。 ジャーニー **CitiSignal - Fibre Max Launch Promotion** を選択します。

![Agent Orchestrator](./images/ao16.png)

この画像が表示されます。 「**送信** ボタンをクリックします。

![Agent Orchestrator](./images/ao17.png)

この画像が表示されます。

![Agent Orchestrator](./images/ao18.png)

## 1.1.1.6 フォールアウト分析によるジャーニーのパフォーマンスの検証

**インテント**

ジャーニーのパフォーマンスのフォールアウトを理解し、ジャーニー内にドロップされたプロファイルの割合が高いノードや条件がジャーニー内にあるかどうかを把握します。 これは、ジャーニーでさらに調整が必要かどうかを把握する際に役立ちます。

次の **プロンプト** を入力し、「**送信**」ボタンをクリックします。

```javascript
Create a fall-out report on the "CitiSignal - Fiber Max Launch Promotion" journey
```

![Agent Orchestrator](./images/ao19.png)

この画像が表示されます。

![Agent Orchestrator](./images/ao20.png)

少し下にスクロールします。 これで、各ノードとそれぞれのエントリ番号、フォールアウト番号、フォールアウト率を調べることで、テーブルを確認できます。

AI アシスタントは、観察と推奨事項を提供します。

**結果は次の手順で取得しました** という文をクリックしてください。

![Agent Orchestrator](./images/ao21.png)

手順を確認した後、AI アシスタントで結果を確認できます。

![Agent Orchestrator](./images/ao22.png)

## 新 1.1.1.7 いオーディエンスを作成するには

**インテント**

以上の結果と研究から、大量のデータを消費する SF やファンタジーのジャンルが好ましいお客様には相関関係があります。 次に、オーディエンスでこれらの属性を組み合わせます。

次の **プロンプト** を入力し、「**送信**」ボタンをクリックします。

```javascript
Create an audience that combines people with an average download usage per month of over 2000 GB and a preferred genre of sci-fi or fantasy.
```

![Agent Orchestrator](./images/ao32.png)

計画をレビューします。 `yes` と入力し、「**送信**」をクリックします。

>[!NOTE]
>
>このプランは、システムのリファレンスガイドに基づいて生成されます。 最終的に、顧客はプランをカスタマイズして独自のプランを追加できるようになりますが、現時点では静的です。

![Agent Orchestrator](./images/ao33.png)

セグメントクエリ式を確認します。 `yes` と入力し、「**送信** ボタンをクリックします。

![Agent Orchestrator](./images/ao34.png)

セグメントサイズの概算を確認します。 `yes` と入力し、「**送信** ボタンをクリックします。

![Agent Orchestrator](./images/ao35.png)

**レビュー** をクリックします。

![Agent Orchestrator](./images/ao36.png)

セグメント定義を確認します。 「**作成**」をクリックします。

![Agent Orchestrator](./images/ao37.png)

オーディエンスが作成されました。

![Agent Orchestrator](./images/ao38.png)

>[!NOTE]
>
>新しいオーディエンスを作成する場合、オーディエンスが AI アシスタントで使用できるようになるまで 24 時間かかります。

## 1.1.1.8 高い使用率に合わせた既存のオーディエンスを見つけて、使用中かどうかを確認する

**目的**:

毎月のデータ使用しきい値で定義された、「大量のダウンローダー」を含むという名前のオーディエンスを見つけます。

>[!NOTE]
>
>前の手順で新しいオーディエンスを作成しました。オーディエンスを AI アシスタントで使用できるようになるまで、さらに時間がかかることに注意してください。 代わりに、別の既存のオーディエンスを使用するようにしてください。

次の **プロンプト** を入力し、「**送信**」ボタンをクリックします。

```javascript
Is there an audience that has "heavy downloaders" in the title?
```

![Agent Orchestrator](./images/ao30.png)

この画像が表示されます。 すべてのオーディエンスと、過去数日間に変化したオーディエンスの量を確認するとします。

次の **プロンプト** を入力し、「**送信**」ボタンをクリックします。

```javascript
List how much these audiences changed over the last few days.
```

![Agent Orchestrator](./images/ao31.png)

この画像が表示されます。 **詳細を表示** をクリックします。

![Agent Orchestrator](./images/ao31a.png)

この画像が表示されます。 クリックして右側のウィンドウを閉じます。

![Agent Orchestrator](./images/ao31b.png)

少し下にスクロールして、AI アシスタントが実行した手順を確認します。

![Agent Orchestrator](./images/ao31c.png)

既に「ヘビーダウンローダー」向けのオーディエンスが存在します。 既に使用されているかどうかを確認しましょう。

次の **プロンプト** を入力し、「**送信**」ボタンをクリックします。

```javascript
Which of the above are used in a journey? 
```

![Agent Orchestrator](./images/ao50.png)

これに似た情報が表示されます。

![Agent Orchestrator](./images/ao51.png)

これで、そのジャーニーがアクティブかどうかを確認できます。 次の **プロンプト** を入力し、「**送信**」ボタンをクリックします。

```javascript
Are these journeys active? 
```

![Agent Orchestrator](./images/ao52.png)

これに似た情報が表示されます。 これらのジャーニーは現在実行されていません。

![Agent Orchestrator](./images/ao53.png)

今後の Fibre Max のローンチでは、新しいジャーニーを作成する必要があります。

## 1.1.1.9 Fibre Max Launch の新しいジャーニーを作成

**目的**:

複合オーディエンスをターゲットにした新しいジャーニーを作成します。

重いダウンローダ∩SciFi の好みです。

次の **プロンプト** を入力し、「**送信**」ボタンをクリックします。

```javascript
Create a  journey towards the audience Heavy Downloaders - Sci-Fi Preference_kbaa_5207bf. The journey is for the rollout of fiber broadband. There will 2 versions of an email  based on  a split of the audience based on who is in the "Eligble for Fiber upgrade" audience.  After 3 days, profiles from both email treatments who have not purchased fibre max will be sent a follow up email. 
```

![Agent Orchestrator](./images/aocj1.png)

この画像が表示されます。 `yes` と入力し、「生成」をクリックします。

![Agent Orchestrator](./images/aocj2.png)

この画像が表示されます。 `yes` と入力し、「生成」をクリックします。

![Agent Orchestrator](./images/aocj3.png)

この画像が表示されます。 `The first one` と入力し、「送信」をクリックします。

![Agent Orchestrator](./images/aocj4.png)

この画像が表示されます。 `yes` と入力し、「送信」をクリックします。

![Agent Orchestrator](./images/aocj5.png)

応答を確認します。 `yes` と入力し、「送信」をクリックします。

![Agent Orchestrator](./images/aocj6.png)

**レビュー** をクリックします。

![Agent Orchestrator](./images/aocj7.png)

ジャーニー名を LDAP で更新して、一意にします。 「**保存**」をクリックします。

![Agent Orchestrator](./images/aocj8.png)

これで、ジャーニーがドラフトモードで作成されました。

![Agent Orchestrator](./images/aocj9.png)

## 1.1.1.10 ジャーニーの競合の管理

次の **プロンプト** を入力し、「**送信**」ボタンをクリックします。

```javascript
How can I manage journey conflicts?
```

![Agent Orchestrator](./images/aocj80.png)

情報を確認します。

![Agent Orchestrator](./images/aocj81.png)

下にスクロールして、「**ソース**」を選択し、情報がExperience Leagueから取得されていることを確認します。

![Agent Orchestrator](./images/aocj82.png)

次の **プロンプト** を入力し、「**送信**」ボタンをクリックします。

```javascript
List any conflicts for the journey +CitiSignal Fiber Max
```

次に、ジャーニー **CitiSignal - Fibre Max Launch Promotion** をリストから手動で選択します。

![Agent Orchestrator](./images/aocj70.png)

この画像が表示されます。 **送信** をクリックします。

![Agent Orchestrator](./images/aocj70a.png)

ジャーニーの競合情報を確認します。

![Agent Orchestrator](./images/aocj71.png)

下にスクロールして、ジャーニーの競合の詳細を検索します。

![Agent Orchestrator](./images/aocj72.png)

## 1.1.1.11 実験

次の **プロンプト** を入力し、「**送信**」ボタンをクリックします。

```javascript
How are the experiments performing for the journey named 'CitiSignal - Fiber Max Launch Promotion'?
```

![Agent Orchestrator](./images/aoea0.png)

次の情報が表示されます。

![Agent Orchestrator](./images/aoea1.png)

下にスクロールして、候補の 1 つをクリックします。 **送信** をクリックします。

>[!NOTE]
>
>候補は動的なので、応答が生成されるたびに異なる候補が表示されることを期待する必要があります。 提案は、このスクリーンショットに表示される提案とは異なる可能性があります。

![Agent Orchestrator](./images/aoea2.png)

選択された提案に関連する詳細な回答が表示されます。

![Agent Orchestrator](./images/aoea4.png)

これで、このラボが完了しました。

[Agent Orchestrator](./agentorchestrator.md){target="_blank"} に戻る

[ すべてのモジュールに戻る ](./../../../overview.md){target="_blank"}