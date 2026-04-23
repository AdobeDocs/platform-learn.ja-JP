---
title: ChatGPT エンタープライズ版Adobe Marketing Agent
description: ChatGPT エンタープライズ版Adobe Marketing Agent
kt: 5342
doc-type: tutorial
exl-id: 0aa0cef5-bc1d-4cb6-be09-a5964686c963
source-git-commit: d732dd6abdacc0ebcfa0ab8a09a49dc4b0f2b56b
workflow-type: tm+mt
source-wordcount: '743'
ht-degree: 0%

---

# 1.1.2 Adobe Marketing Agent for ChatGPT Enterprise

## ビデオ

このビデオでは、この演習に関連するすべての手順の説明とデモを行います。

>[!VIDEO](https://video.tv.adobe.com/v/3478410?quality=12&learn=on)

## 1.1.2.1 ChatGPT Enterprise for Adobe Marketing Agentでカスタムアプリを作成

>[!NOTE]
>
>ChatGPTでAdobe Marketing Agentを使用するには、次の操作が必要です。
>- openAIのChatGPT Enterpriseの有料版
>- ChatGPT Enterprise web クライアントの使用

Go to [https://chatgpt.com/](https://chatgpt.com/){target="_blank"} and log in using your account details. ログインしたら、これを確認してください。 Click your username.

![ChatGPT](./images/chatgpt1.png)

Select **Settings**.

![ChatGPT](./images/chatgpt2.png)

Go to **Apps** and then select **Advanced settings**.

![ChatGPT](./images/chatgpt3.png)

Turn on **Developer mode** and then click **Back**.

![ChatGPT](./images/chatgpt4.png)

Click **Create app**.

![ChatGPT](./images/chatgpt5.png)

次のようにフィールドに入力します。

- **名前**: `Adobe Marketing Agent`
- **MCP Server URL**: Adobe担当者にお問い合わせください
- **認証**: `OAuth`

Check the checkbox for **I understand and want to continue**.

「**作成**」をクリックします。

![ChatGPT](./images/chatgpt6.png)

ChatGPTがAdobe アカウントへの接続を試みます。 「**アクセスを許可**」を選択すると、Adobe アカウントでログインする必要があります。

![ChatGPT](./images/chatgpt7.png)

正常にログインすると、Adobe Marketing Agentが正常に接続されたことを確認できます。

![ChatGPT](./images/chatgpt8.png)

## 1.1.2.2 Set context in Adobe Marketing Agent

Close this window.

![Agent Orchestrator](./images/chatgpt9.png)

そうすると、これが表示されます。 **+** アイコンをクリックし、**詳細**&#x200B;に移動して、**Adobe Marketing Agent**&#x200B;を選択します。

![Agent Orchestrator](./images/chatgpt10.png)

Before interacting further with Adobe Marketing Agent through ChatGPT, the context needs to be set.

For this exercise, the context needs to be set to use:

- **IMS Org**: `--aepImsOrgName--`.

- **Sandbox**: **Prod - One Adobe**

The Sandbox setting helps to identify which sandbox ChatGPT should look at when asking questions.

- **データビュー**: **AdobeOne – 統合顧客データビュー**

The Dataview setting helps to identify which dataview ChatGPT should look at when asking questions.

次の&#x200B;**プロンプト**&#x200B;を入力し、**送信** ボタンをクリックします。

```
change context
```

![Agent Orchestrator](./images/chatgpt11.png)

You should then see a similar window, showing the current Org, Sandbox and Dataview selection. Change these fields to the correct Org, Sandbox and Dataview based on the above information.

![Agent Orchestrator](./images/chatgpt12.png)

Your context is now properly set, so you can start sending specific prompts next.

## 1.1.2.3 Start with overall purchase trends to anchor context and zoom into fiber

**インテント**

Get a toplevel pulse on category demand—Mobile, Landline, Internet, TV, Fiber—specifically for the most recent 60 days. This sets baselines for seasonality, promo effects, and regional variance after the New York rollout.

次の&#x200B;**プロンプト**&#x200B;を入力し、**送信** ボタンをクリックします。

```
Show me purchases by mainCategory over the last 2 months.
```

![Agent Orchestrator](./images/chatgpt18.png)

You should then see this:

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

Test the hypothesis that a preference for a specific genre (e.g., SciFi, Sports, Drama) predicts broadband upgrade behavior—especially for high bandwidth needs.

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

## 1.1.2.5 Identify Existing Fiber Journeys

**インテント**

Discover which active or recently concluded journeys include “Fiber” in the title—e.g., “Fiber Upgrade NYC – Sept”, “Fiber Trial – Streaming Bundle”.

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

ジャーニーのパフォーマンスのフォールアウトを把握して、ジャーニー内で多数のプロファイルがドロップされているノードや条件があるかどうかを確認します。 This is helpful in understanding if additional adjustments are needed in the journey.

次の&#x200B;**プロンプト**&#x200B;を入力し、**送信** ボタンをクリックします。

```
Create a fall-out report on the "CitiSignal - Fiber Max Launch Promotion" journey
```

![Agent Orchestrator](./images/chatgpt37.png)

そうすると、これが表示されます。

![Agent Orchestrator](./images/chatgpt38.png)

少し下にスクロールします。 You can now review the table by inspecting each node and its respective enter numbers, fallout numbers, and fallout rate.

![Agent Orchestrator](./images/chatgpt39.png)

もう少し下にスクロールして、観察と推奨事項を確認します。

![Agent Orchestrator](./images/chatgpt40.png)

これで、このラボは完了しました。

## 次の手順

[Adobe Marketing Agent for Microsoft 365 Copilot](./ex3.md){target="_blank"}に移動

[Agent Orchestrator](./agentorchestrator.md){target="_blank"}に戻る

[すべてのモジュールに戻る](./../../../overview.md){target="_blank"}
