---
title: AI ハーネス
description: AI ハーネス
kt: 5342
doc-type: tutorial
exl-id: ce845231-17d1-40ab-96f7-bd386753e625
source-git-commit: 11ce179c0a94113dba391790ee6a86d70a7e9241
workflow-type: tm+mt
source-wordcount: '1180'
ht-degree: 0%

---

# 1.1.6 AI ハーネス

## 前提条件

このラボの手順に従うには、次のアクセスが必要です。

- Real-Time CDP、Journey Optimizer、Customer Journey Analyticsへのアクセス
- Adobe Experience CloudのAI アシスタントを利用すれば
- AEP Agent Orchestratorへのアクセス
- Node.js 18以降をシステムにインストールする必要があります

## 1.1.6.1 Agent Orchestratorへのアクセス

[https://ao.adobe.io/](https://ao.adobe.io/)に移動します。 Adobe アカウントでログインします。 ログイン後、以下に示すように、正しいインスタンスとサンドボックスを選択していることを確認してください。

![AO](./images/aov2lab1.png)

## 1.1.6.2 コンテキストを設定

次のコマンドを入力し、**送信**&#x200B;をクリックします。

```
list dataviews
```

![AO](./images/aov2lab18.png)

このリクエストを受け取ることができます。 必要な権限を指定します。

![AO](./images/aov2lab19.png)

このリクエストを受け取ることができます。 必要な権限を指定します。

![AO](./images/aov2lab19a.png)

そうすると、これが表示されます。 次のコマンドを入力し、**送信**&#x200B;をクリックします。

```
switch to dataview AdobeOne - Unified Customer Data View
```

![AO](./images/aov2lab20.png)

そうすると、これが表示されます。

![AO](./images/aov2lab21.png)

## 1.1.6.3最初に全体的な購入傾向を把握して、コンテキストを固定し、ファイバーにズームインします

**インテント**

モバイル、固定電話、インターネット、テレビ、ファイバーなど、過去60日間のカテゴリー別需要を詳細に把握できます。 これにより、ニューヨークのロールアウト後の季節性、プロモ – ション効果、地域のバリエーションのベースラインを設定できます。

次の&#x200B;**プロンプト**&#x200B;を入力し、**送信** ボタンをクリックします。

```javascript
Show me purchases by mainCategory over the last 2 months.
```

![Agent Orchestrator](./images/aotechlab4.png)

次の画面が表示されます。

![Agent Orchestrator](./images/aotechlab5.png)

次の&#x200B;**プロンプト**&#x200B;を入力し、**送信** ボタンをクリックします。

```javascript
Show me purchases by mainCategory = Fiber over the last 2 months per week
```

![Agent Orchestrator](./images/aotechlab6.png)

次に、これが表示され、ファイバー固有の傾向をドリルダウンします。

![Agent Orchestrator](./images/aotechlab7.png)

## 1.1.6.4注文をコンテンツ設定と関連付ける

**インテント**

特定のジャンル（SciFi、スポーツ、ドラマなど）に対する嗜好が、ブロードバンドのアップグレード行動、特に高帯域幅のニーズを予測するという仮説をテストします。

まず、ジャンルの環境設定を保存するために使用されるフィールドを見つける必要があります。

次の&#x200B;**プロンプト**&#x200B;を入力し、**送信** ボタンをクリックします。

```javascript
Which field is used to store the favourite genre?
```

![Agent Orchestrator](./images/aotechlab7a.png)

これで、ジャンルに使用されるフィールドが&#x200B;**`--aepTenantId--.individualCharacteristics.telco.mediaPreferences.favouriteGenre`**&#x200B;であることがわかります。

![Agent Orchestrator](./images/aotechlab7b.png)

この情報があれば、購入データをドリルダウンできます。

次の&#x200B;**プロンプト**&#x200B;を入力し、**送信** ボタンをクリックします。

```javascript
Show me purchases by favourite genre for the last 2 months
```

![Agent Orchestrator](./images/aotechlab8.png)

そうすると、これが表示されます。

![Agent Orchestrator](./images/aotechlab9.png)

## 1.1.6.5既存のファイバージャーニーの特定

**インテント**

アクティブなジャーニーまたは最近完了したジャーニーのタイトルに「Fiber」が含まれていることを確認します（例：「Fiber Upgrade NYC - Sept」、「Fiber Trial - Streaming Bundle」）。

次の&#x200B;**プロンプト**&#x200B;を入力し、**送信** ボタンをクリックします。

```javascript
What journeys exist? 
```

![Agent Orchestrator](./images/aotechlab12.png)

このような表示になります。

![Agent Orchestrator](./images/aotechlab13.png)

次の&#x200B;**プロンプト**&#x200B;を入力し、**送信** ボタンをクリックします。

```javascript
Which of these journeys has 'Fiber' in its name?
```

![Agent Orchestrator](./images/aotechlab14.png)

そうすると、これが表示されます。 ジャーニーの1つのリンクをクリックします。

![Agent Orchestrator](./images/aotechlab15.png)

新しいウィンドウが開き、すぐにジャーニーの詳細の概要が表示されます。

![Agent Orchestrator](./images/aotechlab15a.png)

## 1.1.6.6使用されているオーディエンスを確認してください

**インテント**:

「CitiSignal - Fiber Max Launch Promotion」ジャーニーのシード定義を理解します。どのような特性がターゲティングを促進したのか（「SciFi Genre Preference」、「4+ デバイス」、「stream ≥ 300 GB/month」など）。

次の&#x200B;**プロンプト**&#x200B;を入力し、**送信** ボタンをクリックします。

```javascript
What was the initial audience in the journey named CitiSignal - Fiber Max Launch Promotion?
```

![Agent Orchestrator](./images/aotechlab16.png)

そうすると、これが表示されます。

![Agent Orchestrator](./images/aotechlab18.png)

## 1.1.6.7 フォールアウト分析によるジャーニーのパフォーマンスの検証

**インテント**

ジャーニーのパフォーマンスのフォールアウトを把握して、ジャーニー内で多数のプロファイルがドロップされているノードや条件があるかどうかを確認します。 これは、ジャーニーで追加の調整が必要かどうかを把握するのに役立ちます。

次の&#x200B;**プロンプト**&#x200B;を入力し、**送信** ボタンをクリックします。

```javascript
Create a fall-out report on the "CitiSignal - Fiber Max Launch Promotion" journey
```

![Agent Orchestrator](./images/aotechlab19.png)

そうすると、これが表示されます。

![Agent Orchestrator](./images/aotechlab20.png)

## 1.1.6.8新しいオーディエンスを作成

**インテント**

以上の調査結果と調査を踏まえると、データを多く消費する顧客と、SFやファンタジーの好みのジャンルを持つ顧客との間には相関関係があります。 これらの属性をオーディエンスで組み合わせます。

次の&#x200B;**プロンプト**&#x200B;を入力し、**送信** ボタンをクリックします。

```javascript
Create an audience that combines people with an average download usage per month of over 2000 GB and a preferred genre of sci-fi or fantasy.
```

![Agent Orchestrator](./images/aotechlab32.png)

類似した、既存のオーディエンスが既に利用可能な場合は、同様のメッセージが表示されます。

![Agent Orchestrator](./images/aotechlab32a.png)

計画の見直し： 「**プランを承認**」をクリックします。

![Agent Orchestrator](./images/aotechlab33.png)

オーディエンスが作成されました。

![Agent Orchestrator](./images/aotechlab38.png)

>[!NOTE]
>
>新しいオーディエンスを作成する場合、オーディエンスをさらに活用するためにAI アシスタントが利用できるようになるまでに24時間かかります。

## 1.1.6.9使用率の高い既存オーディエンスを検索し、使用率が高いかどうかを確認します

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

## 1.1.6.10 Fiber Max Launchの新しいジャーニーを作成

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

## 1.1.6.11件のジャーニーの競合管理

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

## 1.1.6.12件の実験

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

[Agent Orchestrator](./agentorchestrator.md){target="_blank"}に戻る

[すべてのモジュールへ戻る](./../../../overview.md){target="_blank"}

