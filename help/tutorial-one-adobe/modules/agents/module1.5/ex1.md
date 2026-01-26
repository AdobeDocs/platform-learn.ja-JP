---
title: MCP サーバーを使用したCJAと ChatGPT
description: MCP サーバーを使用したCJAと ChatGPT
kt: 5342
doc-type: tutorial
source-git-commit: ca2812e14a22b80b7f00066f9cc482e708b4ac6a
workflow-type: tm+mt
source-wordcount: '697'
ht-degree: 0%

---

# 1.5.1 MCP サーバとCJAおよび ChatGPT

>[!IMPORTANT]
>
>このラボでは、まだリリースされていない機能を使用します。 この機能は開発中のため、まだ一般公開されていません。


>[!NOTE]
>
>ChatGPT と MCP サーバーを設定して使用しCJAに接続する方法に関するこの演習は、この演習 [1.1 Customer Journey Analytics:Adobe Experience Platform上でAnalysis Workspaceを使用してダッシュボードを作成する &#x200B;](./../../../modules/reporting-insights/cja-b2c/cjab2c-1/customer-journey-analytics-build-a-dashboard.md) に関連しています。 以下の演習で使用しているCJA データビューと接続は、その演習で設定したデータビューと接続です。 以下の結果をレプリケートする場合は、最初にその手順に従う必要があります。

## ビデオ

このビデオでは、この演習に関係するすべての手順の説明とデモを行います。

>[!VIDEO](https://video.tv.adobe.com/v/3479159?quality=12&learn=on)

## CJA1.5.1.1ChatGPT でカスタムアプリを作成するには

>[!NOTE]
>
>ChatGPT でCJAを使用するには、次が必要です。
>- openai の ChatGPT の有料版
>- chatGPT web クライアントの使用

[https://chatgpt.com/](https://chatgpt.com/){target="_blank"} に移動し、アカウントの詳細を使用してログインします。 ログインすると、このが表示されます。 ユーザー名をクリックします。

![ChatGPT](./images/chatgpt1.png)

**設定** を選択します。

![ChatGPT](./images/chatgpt2.png)

**アプリ** に移動し、**詳細設定** を選択します。

![ChatGPT](./images/chatgpt3.png)

**開発者モード** をオンにしてから、&lbrack; 戻る **をクリック** します。

![ChatGPT](./images/chatgpt4.png)

**アプリを作成** をクリックします。

![ChatGPT](./images/chatgpt5.png)

次のようにフィールドに入力します。

- **名前**: `CJA`
- **MCP サーバー URL**: Adobe担当者にお問い合わせください
- **認証**: `OAuth`

**理解して続行する** のチェックボックスをオンにします。

「**作成**」をクリックします。

![ChatGPT](./images/chatgpt6.png)

正常にログインすると、CJA アプリが正常に接続されたことを確認できます。

![ChatGPT](./images/chatgpt8.png)

## CJAでのコンテキストの 1.5.1.2 定

このウィンドウを閉じます。

![ChatGPT とCJA](./images/chatgpt9.png)

この画像が表示されます。 「**+**」アイコンをクリックし、「**詳細**」に移動して「**CJA**」を選択します。

![ChatGPT とCJA](./images/chatgpt10.png)

ChatGPT を通じてCJAとさらに対話する前に、コンテキストを設定する必要があります。

この演習では、以下を使用するようにコンテキストを設定する必要があります。

- **Dataview**: **—aepUserLdap— - オムニチャネルデータビュー**

データビュー設定は、ChatGPT が質問をする際に参照するデータビューを特定するのに役立ちます。

次の **プロンプト** を入力し、「**送信**」ボタンをクリックします。

```javascript
list dataviews
```

![ChatGPT とCJA](./images/chatgpt11.png)

使用可能なデータビューの同様のリストが表示されます。

![ChatGPT とCJA](./images/chatgpt11a.png)

これを使用する必要があるデータビューに変更するには、次の **プロンプト** を入力し、「**送信**」ボタンをクリックします。

```javascript
switch to dataview --aepUserLdap-- - Omnichannel Data View
```

![ChatGPT とCJA](./images/chatgpt12.png)

この画像が表示されます。

![ChatGPT とCJA](./images/chatgpt16.png)

これでコンテキストが正しく設定され、次に特定のプロンプトの送信を開始できます。

## 1.5.1.3 データビューの調査

>[!NOTE]
>
>ここで使用するデータビューは、演習 [&#x200B; データビューの作成 &#x200B;](./../../../modules/reporting-insights/cja-b2c/cjab2c-1/ex3.md) の一部として設定されています。

次の **プロンプト** を入力し、「**送信**」ボタンをクリックして、使用可能な指標とディメンションを調べます。

```javascript
list the available metrics and dimensions
```

![ChatGPT とCJA](./images/chatgpt101.png)

次に、この応答が表示されます。この応答には、演習 [&#x200B; データビューの作成 &#x200B;](./../../../modules/reporting-insights/cja-b2c/cjab2c-1/ex3.md) の一部として設定された指標とディメンションが含まれています。

![ChatGPT とCJA](./images/chatgpt102.png)

## 1.5.1.4 フリーフォームテーブル – 製品表示

これで、データの調査を開始できます。 以下のプロンプトを入力して開始し、「**送信**」をクリックして報告書要求を送信します。

```javascript
how many product views happened on January 21?
```

![ChatGPT とCJA](./images/chatgpt103.png)

**RunReport** を選択します。

![ChatGPT とCJA](./images/chatgpt104.png)

すると、次のような応答が表示されます。

![ChatGPT とCJA](./images/chatgpt105.png)

ディメンションを追加することで、応答を分類できるようになりました。 次の **プロンプト** を入力し、「**送信**」ボタンをクリックします。

```javascript
break down product views by product name
```

![ChatGPT とCJA](./images/chatgpt106.png)

すると、次のような応答が表示されます。

![ChatGPT とCJA](./images/chatgpt107.png)

また、ビジュアライゼーションを作成できるようになりました。 次の **プロンプト** を入力し、「**送信**」ボタンをクリックします。

```javascript
create a line visualization by hour for product views on January 21
```

![ChatGPT とCJA](./images/chatgpt108.png)

**UpsertProject** を選択します。

![ChatGPT とCJA](./images/chatgpt109.png)

**RunReport** を選択します。

![ChatGPT とCJA](./images/chatgpt110.png)

この画像が表示されます。

![ChatGPT とCJA](./images/chatgpt111.png)

下にスクロールします。

![ChatGPT とCJA](./images/chatgpt112.png)

この折れ線グラフもダウンロードできるようになりました。 次の **プロンプト** を入力し、「**送信**」ボタンをクリックします。

```javascript
export this chart to PNG
```

![ChatGPT とCJA](./images/chatgpt113.png)

この画像が表示されます。 **PNG をダウンロード** をクリックします。

![ChatGPT とCJA](./images/chatgpt114.png)

次の **プロンプト** を入力し、「**送信**」ボタンをクリックします。

```javascript
can you breakdown product views by user agent?
```

![ChatGPT とCJA](./images/chatgpt115.png)

**RunReport** を選択します。

![ChatGPT とCJA](./images/chatgpt116.png)

この画像が表示されます。

![ChatGPT とCJA](./images/chatgpt117.png)

## 1.5.1.5 フォールアウトビジュアライゼーション

次の **プロンプト** を入力し、「**送信**」ボタンをクリックします。

```javascript
can you create a fallout visualization for the product interaction funnel, starting with all traffic and then in the next steps add Product Views, Add to Cart and purchases?
```

![ChatGPT とCJA](./images/chatgpt118.png)

**UpsertProject** を選択します。

![ChatGPT とCJA](./images/chatgpt119.png)

**RunReport** を選択します。

![ChatGPT とCJA](./images/chatgpt120.png)

次のようなメッセージが表示されます。 次の **プロンプト** を入力し、「**送信**」ボタンをクリックします。

```javascript
can you show me a visualization of the above fallout analysis?
```

![ChatGPT とCJA](./images/chatgpt120a.png)

**PNG をダウンロード** をクリックします。

![ChatGPT とCJA](./images/chatgpt121.png)

これで、フォールアウト分析のビジュアライゼーションが表示されます。

![ChatGPT とCJA](./images/chatgpt122.png)

次の **プロンプト** を入力し、「**送信**」ボタンをクリックします。

```javascript
break down the fallout analysis at the touchpoint of the add to carts
```

![ChatGPT とCJA](./images/chatgpt123.png)

**RunReport** を選択します。

![ChatGPT とCJA](./images/chatgpt124.png)

[Analytics とエージェント &#x200B;](./analyticsagents.md){target="_blank"} に戻る

[&#x200B; すべてのモジュールに戻る &#x200B;](./../../../overview.md){target="_blank"}