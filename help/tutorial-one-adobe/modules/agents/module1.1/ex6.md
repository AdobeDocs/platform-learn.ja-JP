---
title: Agent Orchestrator v2
description: Agent Orchestrator v2
kt: 5342
doc-type: tutorial
source-git-commit: a1578a5205fd17a6aaf362145c78e19343255d93
workflow-type: tm+mt
source-wordcount: '1428'
ht-degree: 3%

---

# 1.1.6 Agent Orchestrator v2

[!BADGE Beta]

+++Betaの詳細
Agent Orchestrator v2 Betaを使用することにより、お客様は、Betaが何らの保証も受けることなく「現状のまま」提供されることを了承するものとします。 Adobeは、Betaを維持、修正、更新、変更、その他の方法でサポートする義務を負いません。 このようなBetaおよび/または付随資料の正しい機能や性能に依存しないように、慎重に使用することをお勧めします。 BetaはAdobeの機密情報と見なされます。  お客様がアドビに提供するあらゆる「フィードバック」（ベータ版の使用中に発生した問題や欠陥、提案、改善、レコメンデーションを含むがこれに限定されないベータ版に関する情報）は、このようなフィードバックに含まれる、およびフィードバックに対するすべての権利、所有権、利益を含め、アドビに帰属します。

+++

## 前提条件

このラボの手順に従うには、次のアクセスが必要です。

- Real-Time CDP、Journey Optimizer、Customer Journey Analyticsへのアクセス
- Adobe Experience CloudのAI アシスタントを利用すれば
- AEP Agent Orchestrator v2へのアクセス
- Node.js 18以降をシステムにインストールする必要があります

## 1.1.6.1 Agent Orchestrator v2の設定

### IAM

IAMを使用して以下のグループに自分自身を追加し、LLM資格情報にアクセスします。

>[!NOTE]
>
>以下の手順の一部は、Adobeに固有のものです。 使用するGRPについて、Adobeの担当者にお問い合わせください。

```
GRP-XXX
```

### Agent Orchestrator v2のインストール

コンピューターで新しいターミナルウィンドウを開きます。

![AOV2](./images/aov2lab1.png)

>[!NOTE]
>
>以下のコマンドでは、特定のURLを使用する必要があります。 使用するURLについては、Adobe担当者にお問い合わせください。

次のコマンドを実行します。

```
npm login --registry=https://XXX/ --auth-type=web
```

![AOV2](./images/aov2lab2.png)

そうすると、これが表示されます。 「**Enter**」をクリックします。

![AOV2](./images/aov2lab3.png)

**SAML SSO**&#x200B;を選択します。

![AOV2](./images/aov2lab4.png)

**はい**&#x200B;をクリックします。

![AOV2](./images/aov2lab5.png)

そうすると、これが表示されます。

![AOV2](./images/aov2lab6.png)

次のコマンドを実行します。

```
npm install -g ao --no-fund --registry=https://XXX/
```

![AOV2](./images/aov2lab7.png)

そうすると、これが表示されます。 次のコマンドを実行します。

```
ao --help
```

![AOV2](./images/aov2lab8.png)

Agent Orchestrator v2がインストールされました。 次のコマンドを実行して、**Agent Orchestrator v2**&#x200B;を起動します。

```
ao web
```

そうすると、これが表示されます。 「**Enter**」をクリックして、Agent Orchestrator v2 Web UIを開きます。

![AOV2](./images/aov2lab9.png)

## 1.1.6.2 Agent Orchestrator v2の設定

「**AO LLMを使用**」をクリックします。

![AOV2](./images/aov2lab11.png)

「**本番環境にログイン**」をクリックします。

![AOV2](./images/aov2lab12.png)

**layers** アイコンをクリックします。

![AOV2](./images/aov2lab13.png)

**AEP AI アシスタント （Code Execution - BashKit）**&#x200B;を選択します。

![AOV2](./images/aov2lab14.png)

**プロファイル** アイコンをクリックし、**設定**&#x200B;を選択します。

![AOV2](./images/aov2lab15.png)

**Plugins**&#x200B;に移動し、**cja**&#x200B;をクリックします。

![AOV2](./images/aov2lab16.png)

「**インストール**」をクリックします。

![AOV2](./images/aov2lab17.png)

## 1.1.6.3 コンテキストを設定

**新規チャット**&#x200B;をクリックします。

インスタンス **Experience Platform International**&#x200B;とサンドボックス **Accelerate**&#x200B;を使用するようにインスタンスが設定されていることを確認します。

次のコマンドを入力し、**送信**&#x200B;をクリックします。

```
list dataviews
```

![AOV2](./images/aov2lab18.png)

次のコマンドを入力し、**送信**&#x200B;をクリックします。

```
switch to dataview Accelerate 2026 B2C
```

![AOV2](./images/aov2lab20.png)

そうすると、これが表示されます。

![AOV2](./images/aov2lab19.png)

## 1.1.6.4最初に全体的な購入傾向を把握して、コンテキストを固定し、ファイバーにズームインします

**インテント**

モバイル、固定電話、インターネット、テレビ、ファイバーなど、過去60日間のカテゴリー別需要を詳細に把握できます。 これにより、ニューヨークのロールアウト後の季節性、プロモ – ション効果、地域のバリエーションのベースラインを設定できます。

次の&#x200B;**プロンプト**&#x200B;を入力し、**送信** ボタンをクリックします。

```javascript
Show me purchases by mainCategory over the last 7 months.
```

![Agent Orchestrator](./images/aotechlab4.png)

次の画面が表示されます。

![Agent Orchestrator](./images/aotechlab5.png)

次の&#x200B;**プロンプト**&#x200B;を入力し、**送信** ボタンをクリックします。

```javascript
Show me purchases by mainCategory = Fiber over the last 7 months per week
```

![Agent Orchestrator](./images/aotechlab6.png)

次に、これが表示され、ファイバー固有の傾向をドリルダウンします。

![Agent Orchestrator](./images/aotechlab7.png)

## 1.1.6.5注文をコンテンツ設定と関連付ける

**インテント**

特定のジャンル（SciFi、スポーツ、ドラマなど）に対する嗜好が、ブロードバンドのアップグレード行動、特に高帯域幅のニーズを予測するという仮説をテストします。

まず、ジャンルの環境設定を保存するために使用されるフィールドを見つける必要があります。

次の&#x200B;**プロンプト**&#x200B;を入力し、**送信** ボタンをクリックします。

```javascript
Which field is used to store the preferred genre?
```

![Agent Orchestrator](./images/aotechlab7a.png)

次に、このフィールドが表示されます。これは、ジャンルに使用されるフィールドが&#x200B;**_experienceplatform.individualCharacteristics.preferences.preferredGenre**&#x200B;であることを示しています。

![Agent Orchestrator](./images/aotechlab7b.png)

この情報があれば、購入データをドリルダウンできます。

次の&#x200B;**プロンプト**&#x200B;を入力し、**送信** ボタンをクリックします。

```javascript
Show me ordersYTD by preferredGenre for the last 7 months
```

![Agent Orchestrator](./images/aotechlab8.png)

そうすると、これが表示されます。

![Agent Orchestrator](./images/aotechlab9.png)


## 1.1.6.6既存のファイバージャーニーの特定

**インテント**

アクティブなジャーニーまたは最近完了したジャーニーのタイトルに「Fiber」が含まれていることを確認します（例：「Fiber Upgrade NYC - Sept」、「Fiber Trial - Streaming Bundle」）。

次の&#x200B;**プロンプト**&#x200B;を入力し、**送信** ボタンをクリックします。

```javascript
What journeys exist? 
```

![Agent Orchestrator](./images/aotechlab12.png)

そうすると、これが表示されます。

![Agent Orchestrator](./images/aotechlab13.png)

次の&#x200B;**プロンプト**&#x200B;を入力し、**送信** ボタンをクリックします。

```javascript
Which of these journeys has 'Fiber' in its name?
```

![Agent Orchestrator](./images/aotechlab14.png)

そうすると、これが表示されます。 ジャーニーの1つのリンクをクリックします。

![Agent Orchestrator](./images/aotechlab15.png)

新しいウィンドウが開き、すぐにジャーニーの詳細ページが表示されます。

![Agent Orchestrator](./images/aotechlab15a.png)

## 1.1.6.7使用されているオーディエンスを確認してください

**インテント**:

「CitiSignal - Fiber Max Launch Promotion」ジャーニーのシード定義を理解します。どのような特性がターゲティングを促進したのか（「SciFi Genre Preference」、「4+ デバイス」、「stream ≥ 300 GB/month」など）。

次の&#x200B;**プロンプト**&#x200B;を入力し、**送信** ボタンをクリックします。

```javascript
What was the initial audience in the journey named CitiSignal - Fiber Max Launch Promotion Winter 2026?
```

![Agent Orchestrator](./images/aotechlab16.png)

そうすると、これが表示されます。

![Agent Orchestrator](./images/aotechlab18.png)

## 1.1.6.8 フォールアウト分析によるジャーニーのパフォーマンスの検証

**インテント**

ジャーニーのパフォーマンスのフォールアウトを把握して、ジャーニー内で多数のプロファイルがドロップされているノードや条件があるかどうかを確認します。 これは、ジャーニーで追加の調整が必要かどうかを把握するのに役立ちます。

次の&#x200B;**プロンプト**&#x200B;を入力し、**送信** ボタンをクリックします。

```javascript
Create a fall-out report on the "CitiSignal - Fiber Max Launch Promotion" journey
```

![Agent Orchestrator](./images/aotechlab19.png)

そうすると、これが表示されます。

![Agent Orchestrator](./images/aotechlab20.png)

## 1.1.6.9新しいオーディエンスを作成

**インテント**

以上の調査結果と調査を踏まえると、データを多く消費する顧客と、SFやファンタジーの好みのジャンルを持つ顧客との間には相関関係があります。 これらの属性をオーディエンスで組み合わせます。

次の&#x200B;**プロンプト**&#x200B;を入力し、**送信** ボタンをクリックします。

```javascript
Create an audience that combines people with an average download usage per month of over 2000 GB and a preferred genre of sci-fi or fantasy.
```

![Agent Orchestrator](./images/aotechlab32.png)

計画の見直し： 「**計画を承諾**」をクリックします。

![Agent Orchestrator](./images/aotechlab33.png)

オーディエンスが作成されました。

![Agent Orchestrator](./images/aotechlab38.png)

>[!NOTE]
>
>新しいオーディエンスを作成する場合、オーディエンスをさらに活用するためにAI アシスタントが利用できるようになるまでに24時間かかります。

## 1.1.6.10使用率の高い既存オーディエンスを検索し、使用率が高いかどうかを確認します

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

## 1.1.6.11 Fiber Max Launchの新しいジャーニーを作成

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

## 1.1.6.12件のジャーニーの競合管理

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

## 1.1.6.13件の実験

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

[すべてのモジュールに戻る](./../../../overview.md){target="_blank"}
