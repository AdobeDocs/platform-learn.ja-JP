---
title: Adobe Marketing Agent for Microsoft 365 Copilot
description: Microsoft 365 CopilotCopilot のAdobe Marketing Agent
kt: 5342
doc-type: tutorial
source-git-commit: 44d0e98ae4c7568411cb0e01ed8eff38b4a34137
workflow-type: tm+mt
source-wordcount: '995'
ht-degree: 5%

---

# 1.1.3 Adobe Marketing Agent for Microsoft 365 Copilot

>[!IMPORTANT]
>
>このラボでは、まだリリースされていない機能を使用します。 この機能は開発中のため、まだ一般公開されていません。

[!BADGE Beta]

+++Betaの詳細
Adobe Marketing AgentをMicrosoft 365 Copilot Betaと併用することにより、お客様は、Betaが「現状のまま」でいかなる保証もなく提供されていることを承諾します。 Adobeは、Betaを維持、修正、更新、変更、修正、またはその他の方法でサポートする義務を負いません。 このようなBetaおよび付属の資料の正しい機能やパフォーマンスに対して、注意を払い、いかなる形でも依存しないことをお勧めします。 BetaはAdobeの機密情報と見なされます。  お客様がアドビに提供するあらゆる「フィードバック」（ベータ版の使用中に発生した問題や欠陥、提案、改善、レコメンデーションを含むがこれに限定されないベータ版に関する情報）は、このようなフィードバックに含まれる、およびフィードバックに対するすべての権利、所有権、利益を含め、アドビに帰属します。

+++

## 前提条件

このラボで後述する手順に従うには、次のアクセス権が必要です。

- Real-Time CDP、Journey OptimizerおよびCustomer Journey Analyticsへのアクセス
- Adobe Experience Cloudの AI アシスタントへのアクセス
- AEP Agent Orchestratorへのアクセス
- Microsoft 365 コパイロットへのアクセス

## ビデオ

このビデオでは、この演習に関係するすべての手順の説明とデモを行います。

>[!VIDEO](https://video.tv.adobe.com/v/3479158?quality=12&learn=on)

## 1.1.3.1 Microsoft 365 Teams &amp; Copilot へのAdobe Marketing Agentの追加

Microsoft Teamsを開き、アカウントの詳細を使用してログインします。 ログインすると、このが表示されます。

**アプリ** をクリックします。

![ChatGPT](./images/copilot1.png)

**アプリを管理** を選択します。

![ChatGPT](./images/copilot2.png)

**アプリをアップロード** を選択します。

![ChatGPT](./images/copilot3.png)

**カスタムアプリをアップロード** を選択します。

![ChatGPT](./images/copilot4.png)

インストラクターから提供されたマニフェストファイルを選択し、「**開く**」をクリックします。

![ChatGPT](./images/copilot5.png)

「**追加**」をクリックします。

![ChatGPT](./images/copilot6.png)

**コパイロットで開く** をクリックします。

![ChatGPT](./images/copilot7.png)

Adobe Marketing Agentが正常に読み込まれました。

![ChatGPT](./images/copilot8.png)

プロンプト `login` を入力し、「**送信**」ボタンをクリックします。

![ChatGPT](./images/copilotlogin1.png)

**Adobe Marketing Agentにログイン** をクリックします。

![ChatGPT](./images/copilotlogin2.png)

新しいウィンドウが開き、Adobe アカウントの資格情報を使用してログインするように求められます。

![ChatGPT](./images/copilotlogin3.png)

認証に成功したら、使用する特定のインスタンスを選択する必要がある場合があります。 この画面が表示された場合は、「インスタンス —aepImsOrgName –」を選択してください。

![ChatGPT](./images/copilotlogin4.png)

その後、同様のコードが生成されていることがわかります。 「**コピー**」をクリックして、コードをコピーします。

![ChatGPT](./images/copilotlogin5.png)

コパイロットのAdobe Marketing Agent ウィンドウにコードをペーストし、「**send**」ボタンをクリックします。

![ChatGPT](./images/copilotlogin6.png)

これに似た情報が表示されます。 これで、Microsoft 365 Copilot のAdobe Marketing Agentに正常にログインしました。

![ChatGPT](./images/copilotlogin7.png)

## Adobe Marketing Agentでのコンテキストの 1.1.3.2 定

Copilot を通じてAdobe Marketing Agentをさらに操作する前に、コンテキストを設定する必要があります。

この演習では、以下を使用するようにコンテキストを設定する必要があります。

- **サンドボックス**: **実稼動 – 高速化（VA7）**

  サンドボックス設定は、質問をする際に AI Assistant が参照するサンドボックスを識別するのに役立ちます。

- **Dataview**:**2026 B2C の高速化**

  データビュー設定は、質問をする際に AI Assistant が調べるデータビューを識別するのに役立ちます。

![Agent Orchestrator](./images/copilotlogin7.png)

サンドボックスを変更するには、次のコマンドを入力して「**送信**」ボタンをクリックします。

```javascript
change sandbox
```

![Agent Orchestrator](./images/copilot9.png)

これに似た情報が表示されます。 使用するサンドボックスを選択し、「**選択**」をクリックします。

![Agent Orchestrator](./images/copilot10.png)

この画像が表示されます。 データビューを変更するには、次のコマンドを入力して「**送信**」ボタンをクリックします。

```javascript
change dataview
```

![Agent Orchestrator](./images/copilot11.png)

これに似た情報が表示されます。 使用するデータビューを選択し、「**選択**」をクリックします。

![Agent Orchestrator](./images/copilot12.png)

この画像が表示されます。 コンテキストが正しく設定され、次に特定のプロンプトの送信を開始できるようになりました。

![Agent Orchestrator](./images/copilot13.png)

## 1.1.3.3 購入トレンド全体から始めて、コンテキストを固定し、ファイバーにズームインする

**インテント**

特に最新の 60 日間は、モバイル、固定電話、インターネット、テレビ、ファイバーなどのカテゴリニーズに応じてトップレベルのパルスを入手できます。 これにより、ニューヨークのロールアウト後の季節性、プロモ効果、地域差のベースラインが設定されます。

次の **プロンプト** を入力し、「**送信**」ボタンをクリックします。

```javascript
Show me purchases by mainCategory over the last 4 months.
```

![Agent Orchestrator](./images/copilot18.png)

次の情報が表示されます。

![Agent Orchestrator](./images/copilot19.png)

次の **プロンプト** を入力し、「**送信**」ボタンをクリックします。

```javascript
Show me purchases by mainCategory = Fiber over the last 4 months broken down by week
```

![Agent Orchestrator](./images/copilot20.png)

これを確認すると、ファイバ固有のトレンドにドリル・ダウンされます。

![Agent Orchestrator](./images/copilot21.png)

## 注文 1.1.3.4 コンテンツの環境設定に関連付けるには

**インテント**

特定のジャンル（SF、スポーツ、ドラマなど）の好みが、特に高帯域幅のニーズに対して、ブロードバンドのアップグレード動作を予測するという仮説をテストします。

まず、ジャンルの環境設定を保存するために使用されているフィールドを見つける必要があります。

次の **プロンプト** を入力し、「**送信**」ボタンをクリックします。

```javascript
Which field is used to store the preferred genre
```

![Agent Orchestrator](./images/copilot22.png)

これにより、genre に使用されるフィールドが **_experienceplatform.individualCharacteristics.preferences.preferredGenre** であることが示されます。

![Agent Orchestrator](./images/copilot23.png)

この情報を使用して、購入データのドリルダウンを開始できます。

次の **プロンプト** を入力し、「**送信**」ボタンをクリックします。

```javascript
Show me ordersYTD by preferredGenre for the last 4 months
```

![Agent Orchestrator](./images/copilot24.png)

この画像が表示されます。 **データを表示** をクリックします。

![Agent Orchestrator](./images/copilot25.png)

この画像が表示されます。

![Agent Orchestrator](./images/copilot26.png)

## 既存のファイバジャーニーを特定 1.1.3.5 る

**インテント**

タイトルに「Fibre」が含まれる、アクティブなジャーニーまたは最近終了したジャーニーを確認します（例：「Fibre Upgrade NYC - Sept」、「Fibre Trial - Streaming Bundle」）。

次の **プロンプト** を入力し、「**送信**」ボタンをクリックします。

```javascript
What journeys exist? 
```

![Agent Orchestrator](./images/copilot28.png)

ジャーニーのリストが表示されます。

![Agent Orchestrator](./images/copilot29.png)

次の **プロンプト** を入力し、「**送信**」ボタンをクリックします。

```javascript
Which of these journeys has 'Fiber' in its name?
```

![Agent Orchestrator](./images/copilot31.png)

この画像が表示されます。

![Agent Orchestrator](./images/copilot33.png)

次の **プロンプト** を入力し、「**送信**」ボタンをクリックします。

```javascript
Show me the details of the journey 'CitiSignal - Fiber Max Launch Promotion'
```

![Agent Orchestrator](./images/copilot35.png)

この画像が表示されます。

![Agent Orchestrator](./images/copilot36.png)

## 1.1.3.6 フォールアウト分析によるジャーニーのパフォーマンスの検証

**インテント**

ジャーニーのパフォーマンスのフォールアウトを理解し、ジャーニー内にドロップされたプロファイルの割合が高いノードや条件がジャーニー内にあるかどうかを把握します。 これは、ジャーニーでさらに調整が必要かどうかを把握する際に役立ちます。

次の **プロンプト** を入力し、「**送信**」ボタンをクリックします。

```javascript
Create a fall-out report on the "CitiSignal - Fiber Max Launch Promotion" journey
```

![Agent Orchestrator](./images/copilot37.png)

この画像が表示されます。

![Agent Orchestrator](./images/copilot38.png)

もう少し下にスクロールして、観察と推奨事項を確認します。 3 つのドット「**...**」をクリックし、「**ジャーニーの詳細**」を選択して、特定のジャーニーをAdobe Journey Optimizerで開きます。

![Agent Orchestrator](./images/copilot40.png)

この画像が表示されます。

![Agent Orchestrator](./images/copilot41.png)

これで、このラボが完了しました。

[Agent Orchestrator](./agentorchestrator.md){target="_blank"} に戻る

[ すべてのモジュールに戻る ](./../../../overview.md){target="_blank"}