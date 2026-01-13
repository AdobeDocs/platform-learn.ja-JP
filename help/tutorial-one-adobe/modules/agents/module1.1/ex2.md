---
title: ChatGPT のAdobe Marketing Agent
description: ChatGPT のAdobe Marketing Agent
kt: 5342
doc-type: tutorial
source-git-commit: 9663ef2838024e293acc72c203b1e3578911d57f
workflow-type: tm+mt
source-wordcount: '894'
ht-degree: 0%

---

# 1.1.2 ChatGPT のAdobe Marketing Agent

>[!IMPORTANT]
>
>このラボでは、まだリリースされていない機能を使用します。 この機能は開発中のため、まだ一般公開されていません。

## ビデオ

このビデオでは、この演習に関係するすべての手順の説明とデモを行います。

>[!VIDEO](https://video.tv.adobe.com/v/3478410?quality=12&learn=on)

## Adobe Marketing Agent1.1.2.1ChatGPT でカスタムアプリを作成するには

>[!NOTE]
>
>ChatGPT でAdobe Marketing Agentを使用するには、次が必要です。
>- openai の ChatGPT の有料版
>- chatGPT web クライアントの使用

https://chatgpt.com/に移動し、アカウントの詳細を使用してログインします。 ログインすると、このが表示されます。 ユーザー名をクリックします。

![ChatGPT](./images/chatgpt1.png)

**設定** を選択します。

![ChatGPT](./images/chatgpt2.png)

**アプリ** に移動し、**詳細設定** を選択します。

![ChatGPT](./images/chatgpt3.png)

**開発者モード** をオンにしてから、[ 戻る **をクリック** します。

![ChatGPT](./images/chatgpt4.png)

**アプリを作成** をクリックします。

![ChatGPT](./images/chatgpt5.png)

次のようにフィールドに入力します。

- **名前**: `Adobe Marketing Agent`
- **MCP サーバー URL**: Adobe担当者にお問い合わせください
- **認証**: `OAuth`

**理解して続行する** のチェックボックスをオンにします。

「**作成**」をクリックします。

![ChatGPT](./images/chatgpt6.png)

ChatGPT はAdobe アカウントへの接続を試みます。 **アクセスを許可** を選択すると、Adobe アカウントでログインする必要があります。

![ChatGPT](./images/chatgpt7.png)

正常にログインすると、Adobe Marketing Agentが正常に接続されたことがわかります。

![ChatGPT](./images/chatgpt8.png)

## Adobe Marketing Agentでのコンテキストの 1.1.2.2 定

このウィンドウを閉じます。

![Agent Orchestrator](./images/chatgpt9.png)

この画像が表示されます。 「**+**」アイコンをクリックし、「**詳細**」に移動して「**Adobe Marketing Agent**」を選択します。

![Agent Orchestrator](./images/chatgpt10.png)

ChatGPT を通じてAdobe Marketing Agentとさらに対話する前に、コンテキストを設定する必要があります。

この演習では、以下を使用するようにコンテキストを設定する必要があります。

- **サンドボックス**: **実稼動 – 高速化（VA7）**

サンドボックス設定は、質問をする際に AI Assistant が参照するサンドボックスを識別するのに役立ちます。

- **Dataview**:**2026 B2C の高速化**

データビュー設定は、質問をする際に AI Assistant が調べるデータビューを識別するのに役立ちます。

次の **プロンプト** を入力し、「**送信**」ボタンをクリックします。

```javascript
list sandboxes
```

![Agent Orchestrator](./images/chatgpt11.png)

使用可能なサンドボックスの同様のリストが表示されます。 この例では、現在のサンドボックスが **prod** に設定されています。

これを使用する必要があるサンドボックスに変更するには、次の **プロンプト** を入力し、「**送信**」ボタンをクリックします。

```javascript
switch to sandbox accelerate
```

![Agent Orchestrator](./images/chatgpt12.png)

この画像が表示されます。 **コンテキストを設定** をクリックします。

![Agent Orchestrator](./images/chatgpt13.png)

この画像が表示されます。 次の **プロンプト** と入力し、「**送信**」ボタンをクリックして、使用するデータビューを設定します。

```javascript
list dataviews
```

![Agent Orchestrator](./images/chatgpt14.png)

使用可能なサンドボックスの同様のリストが表示されます。 この例では、現在のサンドボックスが **prod** に設定されています。

これを使用する必要があるサンドボックスに変更するには、次の **プロンプト** を入力し、「**送信**」ボタンをクリックします。

```javascript
switch to Accelerate 2026 B2C
```

![Agent Orchestrator](./images/chatgpt15.png)

この画像が表示されます。 **コンテキストを設定** をクリックします。

![Agent Orchestrator](./images/chatgpt16.png)

この画像が表示されます。

![Agent Orchestrator](./images/chatgpt17.png)

これでコンテキストが適切に設定され、次に特定のプロンプトの送信を開始できます。

## 1.1.2.3 購入トレンド全体から始めて、コンテキストを固定し、ファイバーにズームインする

**インテント**

特に最新の 60 日間は、モバイル、固定電話、インターネット、テレビ、ファイバーなどのカテゴリニーズに応じてトップレベルのパルスを入手できます。 これにより、ニューヨークのロールアウト後の季節性、プロモ効果、地域差のベースラインが設定されます。

次の **プロンプト** を入力し、「**送信**」ボタンをクリックします。

```javascript
Show me purchases by mainCategory over the last 2 months.
```

![Agent Orchestrator](./images/chatgpt18.png)

次の情報が表示されます。

![Agent Orchestrator](./images/chatgpt19.png)

次の **プロンプト** を入力し、「**送信**」ボタンをクリックします。

```javascript
Show me purchases by mainCategory = Fiber over the last 2 months per week
```

![Agent Orchestrator](./images/chatgpt20.png)

これを確認すると、ファイバ固有のトレンドにドリル・ダウンされます。

![Agent Orchestrator](./images/chatgpt21.png)

## 注文 1.1.2.4 コンテンツの環境設定に関連付けるには

**インテント**

特定のジャンル（SF、スポーツ、ドラマなど）の好みが、特に高帯域幅のニーズに対して、ブロードバンドのアップグレード動作を予測するという仮説をテストします。

まず、ジャンルの環境設定を保存するために使用されているフィールドを見つける必要があります。

次の **プロンプト** を入力し、「**送信**」ボタンをクリックします。

```javascript
Which field is used to store the preferred genre in the sandbox accelerate?
```

![Agent Orchestrator](./images/chatgpt22.png)

これにより、genre に使用されるフィールドが **_experienceplatform.individualCharacteristics.preferences.preferredGenre** であることが示されます。

![Agent Orchestrator](./images/chatgpt23.png)

この情報を使用して、購入データのドリルダウンを開始できます。

次の **プロンプト** を入力し、「**送信**」ボタンをクリックします。

```javascript
Show me ordersYTD by preferredGenre for the last 2 months
```

![Agent Orchestrator](./images/chatgpt24.png)

この画像が表示されます。 **リサーチ** をクリックします。

![Agent Orchestrator](./images/chatgpt25.png)

この画像が表示されます。

![Agent Orchestrator](./images/chatgpt26.png)

下にスクロールすると、詳細情報が表示されます。

![Agent Orchestrator](./images/chatgpt27.png)

## 既存のファイバジャーニーを特定 1.1.2.5 る

**インテント**

タイトルに「Fibre」が含まれる、アクティブなジャーニーまたは最近終了したジャーニーを確認します（例：「Fibre Upgrade NYC - Sept」、「Fibre Trial - Streaming Bundle」）。

次の **プロンプト** を入力し、「**送信**」ボタンをクリックします。

```javascript
What journeys exist? 
```

![Agent Orchestrator](./images/chatgpt28.png)

この画像が表示されます。 **リサーチ** をクリックします。

![Agent Orchestrator](./images/chatgpt29.png)

ジャーニーのリストが表示されます。

![Agent Orchestrator](./images/chatgpt30.png)

次の **プロンプト** を入力し、「**送信**」ボタンをクリックします。

```javascript
Which of these journeys has 'Fiber' in its name?
```

![Agent Orchestrator](./images/chatgpt31.png)

この画像が表示されます。 **リサーチ** をクリックします。

![Agent Orchestrator](./images/chatgpt32.png)

この画像が表示されます。

![Agent Orchestrator](./images/chatgpt33.png)

下にスクロールすると、詳細が表示されます。

![Agent Orchestrator](./images/chatgpt34.png)

次の **プロンプト** を入力し、「**送信**」ボタンをクリックします。

```javascript
show me the details of the journey 'CitiSignal - Fiber Max Launch Promotion'
```

![Agent Orchestrator](./images/chatgpt35.png)

この画像が表示されます。

![Agent Orchestrator](./images/chatgpt36.png)

## 1.1.2.6 フォールアウト分析によるジャーニーのパフォーマンスの検証

**インテント**

ジャーニーのパフォーマンスのフォールアウトを理解し、ジャーニー内にドロップされたプロファイルの割合が高いノードや条件がジャーニー内にあるかどうかを把握します。 これは、ジャーニーでさらに調整が必要かどうかを把握する際に役立ちます。

次の **プロンプト** を入力し、「**送信**」ボタンをクリックします。

```javascript
Create a fall-out report on the "CitiSignal - Fiber Max Launch Promotion" journey
```

![Agent Orchestrator](./images/chatgpt37.png)

この画像が表示されます。

![Agent Orchestrator](./images/chatgpt38.png)

少し下にスクロールします。 これで、各ノードとそれぞれのエントリ番号、フォールアウト番号、フォールアウト率を調べることで、テーブルを確認できます。

![Agent Orchestrator](./images/chatgpt39.png)

もう少し下にスクロールして、観察と推奨事項を確認します。

![Agent Orchestrator](./images/chatgpt40.png)

これで、このラボが完了しました。

[Agent Orchestrator](./agentorchestrator.md){target="_blank"} に戻る

[ すべてのモジュールに戻る ](./../../../overview.md){target="_blank"}