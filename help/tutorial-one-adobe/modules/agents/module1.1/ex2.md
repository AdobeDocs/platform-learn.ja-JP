---
title: ChatGPT エンタープライズ版Adobe Marketing Agent
description: ChatGPT エンタープライズ版Adobe Marketing Agent
kt: 5342
doc-type: tutorial
exl-id: 0aa0cef5-bc1d-4cb6-be09-a5964686c963
source-git-commit: 312af1518edd28b4eee577e4ab6b97943a56538d
workflow-type: tm+mt
source-wordcount: '739'
ht-degree: 0%

---

# 1.1.2 ChatGPT Enterprise用Adobe Marketing Agent

## ビデオ

このビデオでは、この演習に関連するすべての手順の説明とデモを行います。

>[!VIDEO](https://video.tv.adobe.com/v/3478410?quality=12&learn=on)

## 1.1.2.1 ChatGPT Enterprise for Adobe Marketing Agentでカスタムアプリを作成

>[!NOTE]
>
>ChatGPTでAdobe Marketing Agentを使用するには、次の操作が必要です。
>- openAIのChatGPT Enterpriseの有料版
>- ChatGPT Enterprise web クライアントの使用

[https://chatgpt.com/](https://chatgpt.com/){target="_blank"}に移動し、アカウントの詳細を使用してログインします。 ログインしたら、これを確認してください。 ユーザー名をクリックします。

![ChatGPT](./images/chatgpt1.png)

**設定**&#x200B;を選択します。

![ChatGPT](./images/chatgpt2.png)

**アプリ**&#x200B;に移動し、**詳細設定**&#x200B;を選択します。

![ChatGPT](./images/chatgpt3.png)

**開発者モード**&#x200B;をオンにして、**戻る**&#x200B;をクリックします。

![ChatGPT](./images/chatgpt4.png)

「**アプリを作成**」をクリックします。

![ChatGPT](./images/chatgpt5.png)

次のようにフィールドに入力します。

- **名前**: `Adobe Marketing Agent`
- **MCP サーバーURL**: `https://aep-ai-ama.adobe.io/mcp`
- **認証**: `OAuth`

「**理解して続行したい**」のチェックボックスをオンにします。

「**作成**」をクリックします。

![ChatGPT](./images/chatgpt6.png)

ChatGPTがAdobe アカウントへの接続を試みます。 「**アクセスを許可**」を選択すると、Adobe アカウントでログインする必要があります。

![ChatGPT](./images/chatgpt7.png)

正常にログインすると、Adobe Marketing Agentが正常に接続されたことを確認できます。

![ChatGPT](./images/chatgpt8.png)

## 1.1.2.2 Adobe Marketing Agentでコンテキストを設定

このウィンドウを閉じます。

![Agent Orchestrator](./images/chatgpt9.png)

そうすると、これが表示されます。 **+** アイコンをクリックし、**詳細**&#x200B;に移動して、**Adobe Marketing Agent**&#x200B;を選択します。

![Agent Orchestrator](./images/chatgpt10.png)

ChatGPTを通じてAdobe Adobe Marketing Agentをさらに活用する前に、必要なコンテキストを設定します。

この演習では、コンテキストを次のように設定する必要があります。

- **IMS組織**: `--aepImsOrgName--`。

- **サンドボックス**: **製品 – 1つのAdobe**

サンドボックス設定は、質問を行う際にChatGPTがどのサンドボックスを参照すべきかを特定するのに役立ちます。

- **データビュー**: **AdobeOne – 統合顧客データビュー**

データビュー設定は、質問を行う際にChatGPTがどのデータビューを参照すべきかを特定するのに役立ちます。

次の&#x200B;**プロンプト**&#x200B;を入力し、**送信** ボタンをクリックします。

```
change context
```

![Agent Orchestrator](./images/chatgpt11.png)

その後、同様のウィンドウが表示され、現在の組織、サンドボックス、データビューの選択が表示されます。 上記の情報に基づいて、これらのフィールドを正しい組織、サンドボックス、データビューに変更します。

![Agent Orchestrator](./images/chatgpt12.png)

これでコンテキストが正しく設定されたので、次に特定のプロンプトの送信を開始できます。

## 1.1.2.3最初に全体的な購入傾向を把握して、コンテキストを固定し、ファイバーにズームインします

**インテント**

モバイル、固定電話、インターネット、テレビ、ファイバーなど、過去60日間のカテゴリー別需要を詳細に把握できます。 これにより、ニューヨークのロールアウト後の季節性、プロモ – ション効果、地域のバリエーションのベースラインを設定できます。

次の&#x200B;**プロンプト**&#x200B;を入力し、**送信** ボタンをクリックします。

```
Show me purchases by mainCategory over the last 2 months.
```

![Agent Orchestrator](./images/chatgpt18.png)

次の画面が表示されます。

![Agent Orchestrator](./images/chatgpt19.png)

次の&#x200B;**プロンプト**&#x200B;を入力し、**送信** ボタンをクリックします。

```
Show me purchases by mainCategory = Fiber over the last 2 months per week
```

![Agent Orchestrator](./images/chatgpt20.png)

次に、これが表示され、ファイバー固有の傾向をドリルダウンします。

![Agent Orchestrator](./images/chatgpt21.png)

## 1.1.2.4注文をコンテンツ設定と関連付ける

**インテント**

特定のジャンル（SciFi、スポーツ、ドラマなど）に対する嗜好が、ブロードバンドのアップグレード行動、特に高帯域幅のニーズを予測するという仮説をテストします。

まず、ジャンルの環境設定を保存するために使用されるフィールドを見つける必要があります。

次の&#x200B;**プロンプト**&#x200B;を入力し、**送信** ボタンをクリックします。

```
Which field is used to store the preferred genre?
```

![Agent Orchestrator](./images/chatgpt22.png)

これで、ジャンルに使用されるフィールドが&#x200B;**`--aepTenantId--.individualCharacteristics.telco.mediaPreferences.favouriteGenre`**&#x200B;であることがわかります。

![Agent Orchestrator](./images/chatgpt23.png)

この情報があれば、購入データをドリルダウンできます。

次の&#x200B;**プロンプト**&#x200B;を入力し、**送信** ボタンをクリックします。

```
Show me purchases by favouriteGenre for the last 2 months
```

![Agent Orchestrator](./images/chatgpt24.png)

そうすると、これが表示されます。

![Agent Orchestrator](./images/chatgpt25.png)

## 1.1.2.5既存のファイバージャーニーの特定

**インテント**

アクティブなジャーニーまたは最近完了したジャーニーのタイトルに「Fiber」が含まれていることを確認します（例：「Fiber Upgrade NYC - Sept」、「Fiber Trial - Streaming Bundle」）。

次の&#x200B;**プロンプト**&#x200B;を入力し、**送信** ボタンをクリックします。

```
What journeys exist? 
```

![Agent Orchestrator](./images/chatgpt28.png)

そうすると、これが表示されます。

![Agent Orchestrator](./images/chatgpt29.png)

次の&#x200B;**プロンプト**&#x200B;を入力し、**送信** ボタンをクリックします。

```
Which of these journeys has 'Fiber' in its name?
```

![Agent Orchestrator](./images/chatgpt31.png)

そうすると、これが表示されます。

![Agent Orchestrator](./images/chatgpt32.png)

次の&#x200B;**プロンプト**&#x200B;を入力し、**送信** ボタンをクリックします。

```
show me the details of the journey 'CitiSignal - Fiber Max Launch Promotion'
```

![Agent Orchestrator](./images/chatgpt35.png)

そうすると、これが表示されます。

![Agent Orchestrator](./images/chatgpt36.png)

## 1.1.2.6 フォールアウト分析によるジャーニーのパフォーマンスの検証

**インテント**

ジャーニーのパフォーマンスのフォールアウトを把握して、ジャーニー内で多数のプロファイルがドロップされているノードや条件があるかどうかを確認します。 これは、ジャーニーで追加の調整が必要かどうかを把握するのに役立ちます。

次の&#x200B;**プロンプト**&#x200B;を入力し、**送信** ボタンをクリックします。

```
Create a fall-out report on the "CitiSignal - Fiber Max Launch Promotion" journey
```

![Agent Orchestrator](./images/chatgpt37.png)

そうすると、これが表示されます。

![Agent Orchestrator](./images/chatgpt38.png)

少し下にスクロールします。 各ノードとそれぞれの入力ノードの数値、フォールアウト数、フォールアウト率を調べることで、テーブルを確認できるようになりました。

![Agent Orchestrator](./images/chatgpt39.png)

もう少し下にスクロールして、観察と推奨事項を確認します。

![Agent Orchestrator](./images/chatgpt40.png)

これで、このラボは完了しました。

## 次の手順

[Adobe Marketing Agent for Microsoft 365 Copilot](./ex3.md){target="_blank"}に移動

[Agent Orchestrator](./agentorchestrator.md){target="_blank"}に戻る

[すべてのモジュールに戻る](./../../../overview.md){target="_blank"}
