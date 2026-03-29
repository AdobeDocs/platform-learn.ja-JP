---
title: Agent Orchestratorの導入方法
description: Agent Orchestratorの導入方法
kt: 5342
doc-type: tutorial
exl-id: a5000a5d-5540-49bb-b737-aaca1ab0ddd7
source-git-commit: f752b65c9187af8a3a64b09d9cf0a60a108cbde4
workflow-type: tm+mt
source-wordcount: '1403'
ht-degree: 0%

---

# 1.1.1 Agent Orchestratorの概要

## ビデオ

このビデオでは、この演習に関連するすべての手順の説明とデモを行います。

>[!VIDEO](https://video.tv.adobe.com/v/3477257?quality=12&learn=on)

## Agent Orchestratorの1.1.1.1 Set Context

[https://experience.adobe.com/#/@experienceplatform/ai-assistant/chat](https://experience.adobe.com/#/@experienceplatform/ai-assistant/chat)に移動します。

そうすると、これが表示されます。 組織&#x200B;**Experience Platform インターナショナル**&#x200B;にいることを確認してください。

![Agent Orchestrator](./images/ao1.png)

**context** ウィンドウをクリックします。

![Agent Orchestrator](./images/ao2.png)

コンテキストを次のように設定します。

- **ドキュメント Source**: **Journey Optimizer**

Documentation Source設定を使用すると、製品情報/Experience Leagueに関連する質問を確認するExperience League ドキュメントのセットを優先できます。

- **サンドボックス**: **製品 – 高速化（VA7）**

サンドボックス設定は、質問を行う際にAI アシスタントがどのサンドボックスを確認すべきかを特定するのに役立ちます。

- **データビュー**: **Accelerate 2026 B2C**

データビュー設定は、質問を行う際にAI アシスタントが参照するデータビューを特定するのに役立ちます。

「**コンテキストを設定**」をクリックします。

![Agent Orchestrator](./images/ao3.png)

## 1.1.1.2最初に全体的な購入傾向を把握して、コンテキストを固定し、ファイバーにズームインします

**インテント**

モバイル、固定電話、インターネット、テレビ、ファイバーなど、過去60日間のカテゴリー別需要を詳細に把握できます。 これにより、ニューヨークのロールアウト後の季節性、プロモ – ション効果、地域のバリエーションのベースラインを設定できます。

次の&#x200B;**プロンプト**&#x200B;を入力し、**送信** ボタンをクリックします。

```javascript
Show me purchases by mainCategory over the last 2 months.
```

![Agent Orchestrator](./images/ao4.png)

次の画面が表示されます。

![Agent Orchestrator](./images/ao5.png)

次の&#x200B;**プロンプト**&#x200B;を入力し、**送信** ボタンをクリックします。

```javascript
Show me purchases by mainCategory = Fiber over the last 2 months per week
```

![Agent Orchestrator](./images/ao6.png)

次に、これが表示され、ファイバー固有の傾向をドリルダウンします。

![Agent Orchestrator](./images/ao7.png)

## 1.1.1.3注文をコンテンツ設定と関連付ける

**インテント**

特定のジャンル（SciFi、スポーツ、ドラマなど）に対する嗜好が、ブロードバンドのアップグレード行動、特に高帯域幅のニーズを予測するという仮説をテストします。

まず、ジャンルの環境設定を保存するために使用されるフィールドを見つける必要があります。

次の&#x200B;**プロンプト**&#x200B;を入力し、**送信** ボタンをクリックします。

```javascript
Which field is used to store the preferred genre?
```

![Agent Orchestrator](./images/ao7a.png)

次に、このフィールドが表示されます。これは、ジャンルに使用されるフィールドが&#x200B;**_experienceplatform.individualCharacteristics.preferences.preferredGenre**&#x200B;であることを示しています。

![Agent Orchestrator](./images/ao7b.png)

この情報があれば、購入データをドリルダウンできます。

次の&#x200B;**プロンプト**&#x200B;を入力し、**送信** ボタンをクリックします。

```javascript
Show me ordersYTD by preferredGenre for the last 2 months
```

![Agent Orchestrator](./images/ao8.png)

そうすると、これが表示されます。 「**推論完了**」ブロックのアイコンをクリックして、Agent Orchestratorの舞台裏で何が起こっているのかを把握します。

![Agent Orchestrator](./images/ao9.png)

同様の説明が表示されます。

![Agent Orchestrator](./images/ao10.png)

## 1.1.1.4既存のファイバージャーニーの特定

**インテント**

アクティブなジャーニーまたは最近完了したジャーニーのタイトルに「Fiber」が含まれていることを確認します（例：「Fiber Upgrade NYC - Sept」、「Fiber Trial - Streaming Bundle」）。

次の&#x200B;**プロンプト**&#x200B;を入力し、**送信** ボタンをクリックします。

```javascript
What journeys exist? 
```

![Agent Orchestrator](./images/ao12.png)

そうすると、これが表示されます。 **詳細を表示**&#x200B;をクリックします。

![Agent Orchestrator](./images/ao13.png)

アクティブなジャーニーまたは過去のジャーニーのリストが表示されます。 これらのジャーニーのリストをダウンロードするには、**ダウンロード** アイコンをクリックします。

![Agent Orchestrator](./images/ao13a.png)

これにより、AI アシスタントからのすべての出力を含むCSV ファイルが生成されます。

![Agent Orchestrator](./images/ao13b.png)

クリックして右側のペインを閉じます。 次の&#x200B;**プロンプト**&#x200B;を入力し、**送信** ボタンをクリックします。

```javascript
Which of these journeys has 'Fiber' in its name?
```

![Agent Orchestrator](./images/ao14.png)

そうすると、これが表示されます。 ジャーニーの1つのリンクをクリックし、**ジャーニーの詳細**&#x200B;を選択します。

![Agent Orchestrator](./images/ao15.png)

新しいウィンドウが開き、すぐにジャーニーの詳細ページが表示されます。

![Agent Orchestrator](./images/ao15a.png)

## 1.1.1.5使用されているオーディエンスを確認してください

**インテント**:

「CitiSignal - Fiber Max Launch Promotion」ジャーニーのシード定義を理解します。どのような特性がターゲティングを促進したのか（「SciFi Genre Preference」、「4+ デバイス」、「stream ≥ 300 GB/month」など）。

次の&#x200B;**プロンプト**&#x200B;を入力します。

```javascript
What was the initial audience in the journey named 
```

次に、`+CitiSignal fib`を手動で入力して、オートコンプリートを有効にします。 ジャーニー&#x200B;**CitiSignal - Fiber Max Launch Promotion**&#x200B;を選択します。

![Agent Orchestrator](./images/ao16.png)

そうすると、これが表示されます。 「**送信**」ボタンをクリックします。

![Agent Orchestrator](./images/ao17.png)

そうすると、これが表示されます。

![Agent Orchestrator](./images/ao18.png)

## 1.1.1.6 フォールアウト分析によるジャーニーのパフォーマンスの検証

**インテント**

ジャーニーのパフォーマンスのフォールアウトを把握して、ジャーニー内で多数のプロファイルがドロップされているノードや条件があるかどうかを確認します。 これは、ジャーニーで追加の調整が必要かどうかを把握するのに役立ちます。

次の&#x200B;**プロンプト**&#x200B;を入力し、**送信** ボタンをクリックします。

```javascript
Create a fall-out report on the "CitiSignal - Fiber Max Launch Promotion" journey
```

![Agent Orchestrator](./images/ao19.png)

そうすると、これが表示されます。

![Agent Orchestrator](./images/ao20.png)

少し下にスクロールします。 各ノードとそれぞれの入力ノードの数値、フォールアウト数、フォールアウト率を調べることで、テーブルを確認できるようになりました。

AI アシスタントが観察とレコメンデーションを提供します。

文章「**」をクリックすると、結果が表示されます**。

![Agent Orchestrator](./images/ao21.png)

そして、その後に続くステップと、AI アシスタントが表示されて結果が得られます。

![Agent Orchestrator](./images/ao22.png)

## 1.1.1.7新しいオーディエンスを作成

**インテント**

以上の調査結果と調査を踏まえると、データを多く消費する顧客と、SFやファンタジーの好みのジャンルを持つ顧客との間には相関関係があります。 これらの属性をオーディエンスで組み合わせます。

次の&#x200B;**プロンプト**&#x200B;を入力し、**送信** ボタンをクリックします。

```javascript
Create an audience that combines people with an average download usage per month of over 2000 GB and a preferred genre of sci-fi or fantasy.
```

![Agent Orchestrator](./images/ao32.png)

計画の見直し： `yes`と入力し、**send**&#x200B;をクリックします。

>[!NOTE]
>
>このプランは、システム内のリファレンスガイドに基づいて生成されます。 顧客は最終的にはプランをカスタマイズし、独自のプランを追加することができますが、今のところは静的です。

![Agent Orchestrator](./images/ao33.png)

セグメントクエリ式を確認します。 `yes`と入力し、**送信** ボタンをクリックします。

![Agent Orchestrator](./images/ao34.png)

セグメントサイズの見積もりを確認しましょう。 `yes`と入力し、**送信** ボタンをクリックします。

![Agent Orchestrator](./images/ao35.png)

「**レビュー**」をクリックします。

![Agent Orchestrator](./images/ao36.png)

セグメント定義の見直し： 「**作成**」をクリックします。

![Agent Orchestrator](./images/ao37.png)

オーディエンスが作成されました。

![Agent Orchestrator](./images/ao38.png)

>[!NOTE]
>
>新しいオーディエンスを作成する場合、オーディエンスをさらに活用するためにAI アシスタントが利用できるようになるまでに24時間かかります。

## 1.1.1.8使用率の高い既存オーディエンスを検索し、使用率が高いかどうかを確認します

**インテント**:

毎月のデータ使用しきい値で定義される「ヘビーダウンローダー」という名前のオーディエンスを探します。

>[!NOTE]
>
>新しいオーディエンスを作成した前の手順では、オーディエンスをさらに使用するためにAI アシスタントがオーディエンスを使用できるようになるまでに24時間かかることを覚えておいてください。 既存の別のオーディエンスを代わりに使用してください。

次の&#x200B;**プロンプト**&#x200B;を入力し、**送信** ボタンをクリックします。

```javascript
Is there an audience that has "heavy downloaders" in the title?
```

![Agent Orchestrator](./images/ao30.png)

そうすると、これが表示されます。 これで、すべてのオーディエンスと、過去数日間でどれくらい変化したかを確認できます。

次の&#x200B;**プロンプト**&#x200B;を入力し、**送信** ボタンをクリックします。

```javascript
List how much these audiences changed over the last few days.
```

![Agent Orchestrator](./images/ao31.png)

そうすると、これが表示されます。 **詳細を表示**&#x200B;をクリックします。

![Agent Orchestrator](./images/ao31a.png)

そうすると、これが表示されます。 クリックして右側のペインを閉じます。

![Agent Orchestrator](./images/ao31b.png)

少し下にスクロールして、AI アシスタントが実行したステップを確認します。

![Agent Orchestrator](./images/ao31c.png)

「ヘビーダウンローダー」には、すでに既存のオーディエンスがいくつかあります。 既に使っているかどうか見てみましょう。

次の&#x200B;**プロンプト**&#x200B;を入力し、**送信** ボタンをクリックします。

```javascript
Which of the above are used in a journey? 
```

![Agent Orchestrator](./images/ao50.png)

次に、同様のものが表示されます。

![Agent Orchestrator](./images/ao51.png)

ここで、そのジャーニーがアクティブかどうかを確認する必要があります。 次の&#x200B;**プロンプト**&#x200B;を入力し、**送信** ボタンをクリックします。

```javascript
Are these journeys active? 
```

![Agent Orchestrator](./images/ao52.png)

次に、同様のものが表示されます。 これらのジャーニーは現在実行中ではありません。

![Agent Orchestrator](./images/ao53.png)

Fiber Maxの今後のローンチでは、新しいジャーニーを作成する必要があります。

## 1.1.1.9 Fiber Max Launchの新しいジャーニーを作成

**インテント**:

複合オーディエンスをターゲットとする新しいジャーニーを作成します。

ヘビーダウンローダー∩SciFi環境設定。

次の&#x200B;**プロンプト**&#x200B;を入力し、**送信** ボタンをクリックします。

```javascript
Create a  journey towards the audience Heavy Downloaders - Sci-Fi Preference_kbaa_5207bf. The journey is for the rollout of fiber broadband. There will 2 versions of an email  based on  a split of the audience based on who is in the "Eligble for Fiber upgrade" audience.  After 3 days, profiles from both email treatments who have not purchased fibre max will be sent a follow up email. 
```

![Agent Orchestrator](./images/aocj1.png)

そうすると、これが表示されます。 `yes`と入力し、「生成」をクリックします。

![Agent Orchestrator](./images/aocj2.png)

そうすると、これが表示されます。 `yes`と入力し、「生成」をクリックします。

![Agent Orchestrator](./images/aocj3.png)

そうすると、これが表示されます。 `The first one`と入力し、「送信」をクリックします。

![Agent Orchestrator](./images/aocj4.png)

そうすると、これが表示されます。 `yes`と入力し、「送信」をクリックします。

![Agent Orchestrator](./images/aocj5.png)

応答を確認します。 `yes`と入力し、「送信」をクリックします。

![Agent Orchestrator](./images/aocj6.png)

「**レビュー**」をクリックします。

![Agent Orchestrator](./images/aocj7.png)

ジャーニー名をLDAPで更新して、一意にします。 「**保存**」をクリックします。

![Agent Orchestrator](./images/aocj8.png)

これで、ジャーニーがドラフトモードで作成されました。

![Agent Orchestrator](./images/aocj9.png)

## 1.1.1.10件のジャーニーの競合管理

次の&#x200B;**プロンプト**&#x200B;を入力し、**送信** ボタンをクリックします。

```javascript
How can I manage journey conflicts?
```

![Agent Orchestrator](./images/aocj80.png)

情報の確認：

![Agent Orchestrator](./images/aocj81.png)

下にスクロールして「**ソース**」を選択し、Experience Leagueから取得されていることを確認します。

![Agent Orchestrator](./images/aocj82.png)

次の&#x200B;**プロンプト**&#x200B;を入力し、**送信** ボタンをクリックします。

```javascript
List any conflicts for the journey +CitiSignal Fiber Max
```

次に、リストからジャーニー&#x200B;**CitiSignal - Fiber Max Launch Promotion**&#x200B;を手動で選択します。

![Agent Orchestrator](./images/aocj70.png)

そうすると、これが表示されます。 **send**&#x200B;をクリックします。

![Agent Orchestrator](./images/aocj70a.png)

ジャーニーの競合情報を確認します。

![Agent Orchestrator](./images/aocj71.png)

下にスクロールして、ジャーニーの競合の詳細を確認します。

![Agent Orchestrator](./images/aocj72.png)

## 1.1.1.11件の実験

次の&#x200B;**プロンプト**&#x200B;を入力し、**送信** ボタンをクリックします。

```javascript
How are the experiments performing for the journey named 'CitiSignal - Fiber Max Launch Promotion'?
```

![Agent Orchestrator](./images/aoea0.png)

次の画面が表示されます。

![Agent Orchestrator](./images/aoea1.png)

下にスクロールして、候補の1つをクリックします。 **send**&#x200B;をクリックします。

>[!NOTE]
>
>提案は動的であるため、応答が生成されるたびに異なる提案が表示されることを想定しておく必要があります。 あなたの提案は、このスクリーンショットに示されている提案とは異なる可能性があります。

![Agent Orchestrator](./images/aoea2.png)

選択した提案に関連する詳細な回答が表示されます。

![Agent Orchestrator](./images/aoea4.png)

これで、このラボは完了しました。

## 次の手順

[ChatGPT Enterprise向けAdobe Marketing Agent](./ex2.md){target="_blank"}に移動

[Agent Orchestrator](./agentorchestrator.md){target="_blank"}に戻る

[すべてのモジュールに戻る](./../../../overview.md){target="_blank"}
