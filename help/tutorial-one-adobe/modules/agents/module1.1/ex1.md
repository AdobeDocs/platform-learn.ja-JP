---
title: Agent Orchestratorの概要
description: Agent Orchestratorの概要
kt: 5342
doc-type: tutorial
source-git-commit: dee5b0855eeeb455bf22f511d11cd13f7e904889
workflow-type: tm+mt
source-wordcount: '1112'
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

`Show me purchases by mainCategory = Fiber over the last 2 months per week`

![Agent Orchestrator](./images/ao6.png)

これを確認すると、ファイバ固有のトレンドにドリル・ダウンされます。

**アクション**：成長曲線と地域のスパイクに注意してください。

![Agent Orchestrator](./images/ao7.png)

## 注文 1.1.1.3 コンテンツの環境設定に関連付けるには

**インテント**

コンテンツの環境設定（SciFi、スポーツ、ドラマなど）で、特に高帯域幅のニーズに対して、ブロードバンドのアップグレード動作が予測されるという仮説をテストします。

次の **プロンプト** を入力し、「**送信**」ボタンをクリックします。

```javascript
Show me ordersYTD by preferredGenre for the last 2 months
```

![Agent Orchestrator](./images/ao8.png)

次の情報が表示されます。

![Agent Orchestrator](./images/ao9.png)

## 既存のファイバジャーニーを特定 1.1.1.4 る

**インテント**

タイトルに「Fibre」が含まれる、アクティブなジャーニーまたは最近終了したジャーニーを確認します（例：「Fibre Upgrade NYC - Sept」、「Fibre Trial - Streaming Bundle」）。

次の **プロンプト** を入力し、「**送信**」ボタンをクリックします。

```javascript
What journeys exist? 
```

![Agent Orchestrator](./images/ao12.png)

次の情報が表示されます。

![Agent Orchestrator](./images/ao13.png)

ファイバーメッセージを使用して、アクティブなジャーニーや過去のジャーニーをリストします。

アクション：複製する高パフォーマンスのジャーニーを絞り込みます。

次の **プロンプト** を入力し、「**送信**」ボタンをクリックします。

```javascript
Which of these journeys has 'Fiber' in its name?
```

![Agent Orchestrator](./images/ao14.png)

次の情報が表示されます。

![Agent Orchestrator](./images/ao15.png)

## 1.1.1.5 シードを確認

**目的**:

「CitiSignal - Fiber Max Launch Promotion」ジャーニーのシード定義を理解します。ターゲット設定を促した特性は何ですか（例：「SciFi Genre Preference」、「4+ devices」、「stream ≥ 300GB/month」）。

次の **プロンプト** を入力し、**+CitiSignal fib** と入力してオートコンプリートを有効にします。 ジャーニー **CitiSignal - Fibre Max Launch Promotion** を選択します。

```javascript
What was the initial audience in the journey named 
```

![Agent Orchestrator](./images/ao16.png)

この画像が表示されます。 「**送信** ボタンをクリックします。

![Agent Orchestrator](./images/ao17.png)

この画像が表示されます。

![Agent Orchestrator](./images/ao18.png)

## 1.1.1.6 フォールアウト分析によるジャーニーのパフォーマンスの検証

**インテント**

Customer Journey Analyticsでの段階的なfunnelの構築

配信済み→開→済み→ クリック済み→製品表示→買い物かごに追加→ チェックアウト →注文完了

ファイバー関連の SKU ビューを分岐として含めます。

次の **プロンプト** を入力し、「**送信**」ボタンをクリックします。

```javascript
Create a fall-out report on the "CitiSignal - Fiber Max Launch Promotion" journey
```

![Agent Orchestrator](./images/ao19.png)

## 新 1.1.1.7 いオーディエンスを作成するには

**インテント**

以上の結果から、大量のデータを消費する顧客と、SF やファンタジーのジャンルが好ましい顧客との間には相関関係があります。 次に、オーディエンスでこれらの属性を組み合わせます。

[https://experience.adobe.com/#/@experienceplatform/ai-assistant/chat](https://experience.adobe.com/#/@experienceplatform/ai-assistant/chat) に移動します。

次の **プロンプト** を入力し、「**送信**」ボタンをクリックします。

>[!NOTE]
>
>アシスタントのコンテキストがサンドボックス **高速化** とデータビュー **高速化 2026 B2C** を指していることを確認してください

```javascript
Create an audience that combines people with an average download per month of over 2000 GB and a preferred genre of sci-fi or fantasy.
```

![Agent Orchestrator](./images/ao32.png)

計画をレビューします。 `yes` と入力し、「**送信**」をクリックします。

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
>新しいオーディエンスを作成する場合、オーディエンスがアシスタントでさらに使用できるようになるまで 24 時間かかります。

## 1.1.1.8 高い使用率に合わせた既存のオーディエンスを見つけて、使用中かどうかを確認する

**目的**:

毎月のデータ使用しきい値で定義された、「大量のダウンローダー」を含むという名前のオーディエンスを見つけます。

>[!NOTE]
>
>以前の手順で新しいオーディエンスを作成しました。オーディエンスがアシスタントでさらに使用できるようになるまで 24 時間かかることを忘れないでください。 代わりに、別の既存のオーディエンスを使用するようにしてください。

[https://experience.adobe.com/#/@experienceplatform/ai-assistant/chat](https://experience.adobe.com/#/@experienceplatform/ai-assistant/chat) に移動します。

この画像が表示されます。 **Experience Platform インターナショナル** に所属していることを確認してください。

次の **プロンプト** を入力し、「**送信**」ボタンをクリックします。

>[!NOTE]
>
>アシスタントのコンテキストがサンドボックス **高速化** とデータビュー **高速化 2026 B2C** を指していることを確認してください

```javascript
Is there an audience that has "heavy downloaders" in the title?
```

![Agent Orchestrator](./images/ao30.png)

この画像が表示されます。

![Agent Orchestrator](./images/ao31.png)

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
Which of the above are used in a journey? 
```

![Agent Orchestrator](./images/ao52.png)

これに似た情報が表示されます。 そのジャーニーは現在実行されていません。

![Agent Orchestrator](./images/ao53.png)

今後の Fibre Max のローンチでは、新しいジャーニーを作成する必要があります。

## 1.1.1.9 Fibre Max Launch の新しいジャーニーを作成

**目的**:

複合オーディエンスをターゲットにした新しいジャーニーを作成します。

重いダウンローダー∩SciFi 環境設定（kbaa_5207bf オーディエンスキー）。

[https://experience.adobe.com/#/@experienceplatform/ai-assistant/chat](https://experience.adobe.com/#/@experienceplatform/ai-assistant/chat) に移動します。

この画像が表示されます。 **Experience Platform インターナショナル** に所属していることを確認してください。

次の **プロンプト** を入力し、「**送信**」ボタンをクリックします。

>[!NOTE]
>
>アシスタントのコンテキストがサンドボックス **高速化** とデータビュー **高速化 2026 B2C** を指していることを確認してください

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

## 1.1.1.10 ジャーニーの競合の管理

[https://experience.adobe.com/#/@experienceplatform/ai-assistant/chat](https://experience.adobe.com/#/@experienceplatform/ai-assistant/chat) に移動します。

この画像が表示されます。 **Experience Platform インターナショナル** に所属していることを確認してください。

次の **プロンプト** を入力し、「**送信**」ボタンをクリックします。

>[!NOTE]
>
>アシスタントのコンテキストがドキュメントソース **Journey Optimizer**、サンドボックス **高速化**、データビュー **高速化 2026 B2C** を指していることを確認してください

```javascript
How can I manage journey conflicts?
```

![Agent Orchestrator](./images/aocj80.png)

情報を確認します。

![Agent Orchestrator](./images/aocj81.png)

下にスクロールして、「**ソース**」を選択し、Experience Leagueから取得された情報を確認します。

![Agent Orchestrator](./images/aocj82.png)

次の **プロンプト** を入力し、「**送信**」ボタンをクリックします。

```javascript
List any conflicts for "CitiSignal - Fiber Max Launch Promotion" journey
```

![Agent Orchestrator](./images/aocj70.png)

ジャーニーの競合情報を確認します。

![Agent Orchestrator](./images/aocj71.png)

下にスクロールして、ジャーニーの競合の詳細を検索します。

![Agent Orchestrator](./images/aocj72.png)

## 1.1.1.11 実験

[https://experience.adobe.com/#/@experienceplatform/ai-assistant/chat](https://experience.adobe.com/#/@experienceplatform/ai-assistant/chat) に移動します。

この画像が表示されます。 **Experience Platform インターナショナル** に所属していることを確認してください。

次の **プロンプト** を入力し、「**送信**」ボタンをクリックします。

>[!NOTE]
>
>アシスタントのコンテキストがサンドボックス **高速化** とデータビュー **高速化 2026 B2C** を指していることを確認してください

```javascript
How are the experiments performing for the journey named 'CitiSignal - Fiber Max Launch Promotion'?
```

![Agent Orchestrator](./images/aoea0.png)

次の情報が表示されます。

![Agent Orchestrator](./images/aoea1.png)

提案をクリックして各処理のコンバージョン率を比較し、「**送信**」をクリックします。

![Agent Orchestrator](./images/aoea2.png)

次のような詳細な比較が表示されます。

![Agent Orchestrator](./images/aoea4.png)

[Agent Orchestrator](./agentorchestrator.md){target="_blank"} に戻る

[&#x200B; すべてのモジュールに戻る &#x200B;](./../../../overview.md){target="_blank"}