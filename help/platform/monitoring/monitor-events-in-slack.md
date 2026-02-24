---
title: Slackでのイベントの監視
description: Adobe App Builder Webhook プロキシと統合して、SlackでExperience Platform通知を受け取る方法を説明します。
feature: Monitoring
role: Developer, Admin
level: Intermediate
doc-type: Tutorial
duration: 0
last-substantial-update: 2026-02-24T00:00:00Z
jira: KT-20339
thumbnail: KT-20339.jpeg
source-git-commit: 268df348b1151394acde869ba4814b658a27e8ff
workflow-type: tm+mt
source-wordcount: '1532'
ht-degree: 0%

---


# SlackでのExperience Platform イベントの監視

Adobe App Builder Webhook プロキシと統合して、SlackでExperience Platform通知を受け取る方法を説明します。 データエンジニアと管理者は、Platform 実装の正常性を監視するために、Adobe Experience PlatformからSlackでプロアクティブな通知を受け取る必要が生じる場合があります。 このチュートリアルでは、Adobe App Builderを使用してAdobe I/O EventsをSlackに接続するためのアーキテクチャと実装手順の概要を説明します。


>[!VIDEO](https://video.tv.adobe.com/v/3480183?learn=on)

## Webhook プロキシを使用する理由

検証プロセスのプロトコルの不一致が原因で、Adobe I/O EventsをSlack Incoming Webhook に直接接続できません。

* **チャレンジ**:Webhook をAdobe I/O Eventsに登録すると、Adobeは「チャレンジ」リクエスト（`GET` または `POST`）をエンドポイントに送信します。 エンドポイントは、この課題を正常に処理し、所有権を確認するために特定の値を返す必要があります。

* **制限事項**:Slackの受信 Webhook は、メッセージング用の JSON ペイロードを取り込むためにのみ設計されています。 Adobeの検証チャレンジハンドシェイクを認識または応答するロジックがありません。

* **解決策**:Adobe App Builderを使用して、仲介としての Webhook プロキシをデプロイします。 このプロキシは、AdobeとSlackの間に位置し、次の機能を果たします。
   1. Adobeからのリクエストをインターセプトし、検証チャレンジに応答します。
   1. ペイロードをSlack互換メッセージにフォーマットし、Slackに転送します。

* **配信方法**：実行時のアクション。  実行時のアクションは、Adobe App Builderにパッケージ化されています。 ランタイムアクション（web 以外のアクション）をイベントハンドラーとして使用する場合、Adobe I/O Eventsはシグネチャの検証とチャレンジ応答を自動的に処理します。 ランタイムアクションは、必要なコードが少なく、セキュリティが組み込まれているので、推奨されるアプローチです。

## アーキテクチャの概要

### Adobe Developer Consoleとは

Adobe Developer Consoleは、Adobe プロジェクト、API および資格情報を管理するための中央ポータルです。 ここで、プロジェクトを作成し、認証を設定し、Webhook を登録します。

### App Builderとは

Adobe App Builderは、大規模法人デベロッパーがクラウドネイティブなアプリケーションを構築できるようにする完全なフレームワークです。

* **プロビジョニング**:App Builderはデフォルトでは有効になっていません。機能として組織にプロビジョニングする必要があります。 組織に **[!DNL App Builder]** の使用権限があることを確認します。

* **プロジェクトテンプレート**:App Builder プロジェクトは、**[!UICONTROL の]** App Builder[!DNL Developer Console] テンプレートを使用して（[!UICONTROL &#x200B; テンプレートからのプロジェクト &#x200B;] > [!UICONTROL App Builder]）作成されます。 テンプレートによって、必要なワークスペースとランタイム環境が自動的に設定されます。

* **App Builder入門ガイド**: ドキュメント [&#x200B; テンプレートから最初のプロジェクトをプロビジョニングして作成するには &#x200B;](https://developer.adobe.com/app-builder/docs/get_started/app_builder_get_started/first-app){target=_blank} を参照してください。

### Adobe I/O Runtimeとは

Adobe I/O Runtimeは、App Builderを強化するサーバーレスのプラットフォームです。 これにより、開発者は、サーバーインフラストラクチャを管理することなく、HTTP リクエストに応答して実行されるコード（サービスとしての関数）をデプロイできます。

この実装では、**Action** を使用します。 アクションは、Adobe I/O Runtime上で実行される（Node.js で記述された）ステートレス関数です。 アドビのアクションは、Adobe I/O Eventsが通信するパブリック HTTP エンドポイントとして機能します。

詳しくは、[Adobe I/O Runtime ドキュメント &#x200B;](https://developer.adobe.com/runtime/){target=_blank} を参照してください。

## 実装ガイド

### 前提条件

開始する前に、次の点を確認してください。

* **Adobe Developer Console アクセス**: App Builderが有効になっている組織内のシステム管理者または [&#x200B; デベロッパーロール &#x200B;](../admin/add-developers.md) へのアクセス権が必要です。

  >[!TIP]
  > App Builderのプロビジョニングを確認するには、[Adobe Developer Console](https://developer.adobe.com/console/){target=_blank} にログインし、目的の組織に属していることを確認し、「**[!UICONTROL テンプレートからプロジェクトを作成]**」を選択して、App Builder テンプレートが使用可能であることを確認します。 そうでない場合は、App Builderの FAQ の節「[App Builderの取得方法」を参照してください &#x200B;](https://developer.adobe.com/app-builder/docs/intro_and_overview/faq#how-to-get-app-builder){target=_blank}


* **Node.js および npm**：このプロジェクトには NPM （ノードパッケージマネージャー）を含む Node.js が必要です。 NPM は、Adobe CLI をインストールし、プロジェクトの依存関係を管理するために使用されます。

   * [Node.js のダウンロード（LTS バージョンを推奨） &#x200B;](https://nodejs.org/){target=_blank}
   * [npm 入門ガイド &#x200B;](https://docs.npmjs.com/downloading-and-installing-node-js-and-npm){target=_blank} - インストールの検証方法に関するガイド。

* **`aio CLI`**: ターミナル経由でインストール：`npm install -g @adobe/aio-cli`
* **Slack アプリ設定**: **受信 Webhook** をアクティブにして、ワークスペースでSlack アプリを設定する必要があります。

   * [Slack アプリの作成 &#x200B;](https://api.slack.com/apps){target=_blank}
   * [Slack受信 Webhook ガイド &#x200B;](https://docs.slack.dev/messaging/sending-messages-using-incoming-webhooks/){target=_blank} – このガイドに従って、アプリを作成し、Webhook URL （`https://hooks.slack.com/` で始まる）を生成します。

### 手順 1:Adobe Developer Consoleでプロジェクトを作成する

まず、Adobe Developer ConsoleでApp Builder テンプレートを使用してプロジェクトを作成します。

1. [Adobe Developer Console](https://developer.adobe.com/console) にログインします
1. 「**[!UICONTROL テンプレートからプロジェクトを作成]**」を選択します
1. App Builder テンプレートを選択します。
1. プロジェクトタイトル（例：`Slack webhook integration`）を入力
1. 「**[!UICONTROL 保存]**」を選択します

### 手順 2：ランタイム環境の初期化

ターミナルで次のコマンドを実行して、プロジェクト構造を作成します。

#### `aio` にログインします

```
aio login
```

#### 新しいApp Builder プロジェクトの初期化

```
aio app init slack-webhook-proxy
```

1. 組織を選択し、**Enter** キーを押します
1. 前の手順で作成したプロジェクト（例：`Slack webhook integration`）を選択し、**Enter** キーを押します
1. 「**[!UICONTROL 組織でサポートされているテンプレートのみ]**」オプションを選択します
1. **Enter** キーを押して、サンプル セクションをスキップします
1. プロンプトが表示されたら、次のコンポーネントが選択されていることを確認し（円を塗り潰す必要があります）、**Enter** キーを押します。
   1. **[!UICONTROL アクション：ランタイムアクションのデプロイ]**
   1. **[!UICONTROL イベント：Adobe I/O Eventsに公開]**
   1. **[!UICONTROL Web Assets：ホストされた静的アセットにデプロイします]**
1. 「上」と「下」の矢印を使用して、受信リストに移動し、「**[!UICONTROL Adobe Experience Platform：リアルタイム顧客プロファイル]**」を選択して、**Enter** キーを押します
1. **[!UICONTROL 汎用]** アクションは自動的に生成されます
1. UI に **[!UICONTROL Pure HTML/JS]** を選択し、**Enter** キーを押します
1. 外部 API 名へのアクセス方法を示すサンプルアクションとして **[!UICONTROL generic]** を使用し、**Enter** キーを押します
1. **[!UICONTROL publish-events]** をサンプルアクション名として使用して、クラウドイベント形式でメッセージを作成し、**Enter** キーを押します。

アプリの初期化が完了します。

#### プロジェクトディレクトリに移動します

```
cd slack-webhook-proxy
```

#### Web アクションの追加

```
aio app add action
```

1. **[!UICONTROL My Org でサポートされているテンプレートのみ]** を選択し、**Enter** キーを押します
2. 表示されるテーブル内の **[!UICONTROL publish-events]** アクションを参照します。**スペース** を押してアクションを選択します。 名前の横の円がビデオチュートリアルに示すように入力されている場合は、**Enter** キーを押します
3. アクションに `webhook-proxy` という名前を付ける

### 手順 3：プロキシアクションコード

IDE またはテキストエディタで、次のコードを使用して `actions/webhook-proxy/index.js` ファイルを作成または変更します。 この実装は、イベントをSlackに転送します。 ランタイムアクションの登録を使用すると、署名の検証とチャレンジの処理が自動的に行われます。

```javascript
const fetch = require("node-fetch");
const { Core } = require("@adobe/aio-sdk");
 
/**
 * Adobe I/O Events to Slack Runtime Proxy
 *
 * Receives events from Adobe I/O Events and forwards them to Slack.
 * Signature verification and challenge handling are automatic when
 * using Runtime Action registration (non-web action).
 */
async function main(params) {
  const logger = Core.Logger("webhook-proxy", { level: params.LOG_LEVEL || "info" });
 
  try {
    logger.info(`Event received: ${JSON.stringify(params)}`);
 
    // Forward to Slack
    return forwardToSlack(params, params.SLACK_WEBHOOK_URL, logger);
 
  } catch (error) {
    logger.error(`Error: ${error.message}`);
    return { statusCode: 500, body: { error: "Internal server error" } };
  }
}
 
/**
 * Forwards the event payload to Slack
 */
async function forwardToSlack(payload, webhookUrl, logger) {
  if (!webhookUrl) {
    logger.error("SLACK_WEBHOOK_URL not configured");
    return { statusCode: 500, body: { error: "Server configuration error" } };
  }
 
  // Extract Adobe headers passed to runtime action
  const headers = {
    "x-adobe-event-code": payload["x-adobe-event-code"],
    "x-adobe-event-id": payload["x-adobe-event-id"],
    "x-adobe-provider": payload["x-adobe-provider"]
  };
 
  const slackMessage = buildSlackMessage(payload, headers);
 
  const response = await fetch(webhookUrl, {
    method: "POST",
    headers: { "Content-Type": "application/json" },
    body: JSON.stringify(slackMessage)
  });
 
  if (!response.ok) {
    const errorText = await response.text();
    logger.error(`Slack API error: ${response.status} - ${errorText}`);
    return { statusCode: response.status, body: { error: errorText } };
  }
 
  logger.info("Event forwarded to Slack");
  return { statusCode: 200, body: { success: true } };
}
 
/**
 * Builds a Slack Block Kit message from the event payload
 */
function buildSlackMessage(payload, headers) {
  // Adobe passes event code as x-adobe-event-code header (available in params for runtime actions)
  const eventType = headers["x-adobe-event-code"] ||
                    payload["x-adobe-event-code"] ||
                    payload.event_code ||
                    payload.type ||
                    payload.event_type ||
                    "Adobe Event";
  const eventId = headers["x-adobe-event-id"] || payload["x-adobe-event-id"] || payload.event_id || payload.id || "N/A";
  const eventData = payload.data || payload.event || payload;
 
  return {
    blocks: [
      {
        type: "header",
        text: { type: "plain_text", text: `Event: ${eventType}`, emoji: true }
      },
      {
        type: "section",
        fields: formatDataFields(eventData)
      },
      { type: "divider" },
      {
        type: "context",
        elements: [{
          type: "mrkdwn",
          text: `*Event ID:* ${eventId}  |  *Time:* ${new Date().toISOString()}`
        }]
      }
    ]
  };
}
 
/**
 * Formats event data as Slack mrkdwn fields
 */
function formatDataFields(data, maxFields = 10) {
  if (typeof data !== "object" || data === null) {
    return [{ type: "mrkdwn", text: `*Payload:*\n${String(data)}` }];
  }
 
  const entries = Object.entries(data);
  if (entries.length === 0) {
    return [{ type: "mrkdwn", text: "_No data provided_" }];
  }
 
  return entries.slice(0, maxFields).map(([key, value]) => ({
    type: "mrkdwn",
    text: `*${key}:*\n${typeof value === "object" ? `\`\`\`${JSON.stringify(value)}\`\`\`` : value}`
  }));
}
 
exports.main = main;
```

### 手順 4：アクションの設定

`app.config.yaml` のアクション設定は重要です。 Web を使用：no Developer Consoleにランタイムアクションとして登録できる非 web アクションを作成します。

```yaml
application:
  runtimeManifest:
    packages:
      slack-webhook-proxy:
        license: Apache-2.0
        actions:
          webhook-proxy:
            function: actions/webhook-proxy/index.js
            web: no
            runtime: nodejs:22
            inputs:
              LOG_LEVEL: info
              SLACK_WEBHOOK_URL: $SLACK_WEBHOOK_URL
            annotations:
              require-adobe-auth: false
              final: true
```

#### `web: no?` を使用する理由

Web 以外のアクションを使用し、Developer Consoleの「ランタイムアクション」オプションを使用して登録すると、Adobe I/O Eventsは自動的に以下を行います。

* チャレンジ検証（`GET` と `POST` の両方）に対応
* アクションを呼び出す前にデジタル署名を検証
* 署名バリデーターアクションをアクションの前にチェーンします

つまり、コードで処理する必要があるのは、ビジネスロジック（Slackへの転送）だけです。

### 手順 5：環境変数

資格情報を安全に管理するには、環境変数を使用します。 プロジェクトのルートに `.env` ファイルを作成または変更し、Slack Webhook の URL を追加します。 `.env` のファイルが表示されない場合は、必ずシステム上に隠しファイルを表示してください。

```
# ... other .env file content ...
 
SLACK_WEBHOOK_URL=https://hooks.slack.com/services/YOUR/WEBHOOK/URL
```

### 手順 6：デプロイ

環境変数を設定したら、アクションをデプロイします。 このコマンドをターミナルで実行する場合は、プロジェクトのルート（`slack-webhook-proxy`）に必ず配置してください。

```
aio app deploy
```

アクションはAdobe I/O Runtimeにデプロイされ、Developer Consoleで登録できます。

### 手順 7：最終登録（Adobe Developer Console）

これでアクションがデプロイされたので、これをAdobe イベントの宛先として登録します。

1. [Adobe Developer Console](https://developer.adobe.com/console){target=_blank} に移動し、App Builder プロジェクトを開きます。
1. **[!UICONTROL Workspace]** を選ぶ
1. 「**[!UICONTROL サービスを追加]**」、「**[!UICONTROL イベント]**」の順に選択します。
1. 商品として **[!UICONTROL 0&rbrace;Adobe Experience Platform&rbrace; を選択します。]**
1. イベントのタイプとして **[!UICONTROL Platform 通知]** を選択します。
1. Slackで通知を受け取りたい特定のイベント（またはすべてのイベント）を選択し、「**[!UICONTROL 次へ]**」を選択します。
1. または [OAuth 認証情報を作成 &#x200B;](https://experienceleague.adobe.com/ja/docs/platform-learn/tutorials/api/platform-api-authentication){target=_blank} を選択します。
1. 設定 **[!UICONTROL イベント登録の詳細]**:
   1. **[!UICONTROL 登録名]**：登録にわかりやすい名前を付けます。
   1. **[!UICONTROL 登録の説明]**：他のコントリビューターが内容を認識できるように、これが明示的であることを確認します。
   1. 「**[!UICONTROL 次へ]**」を選択します。
   1. **[!UICONTROL 配信方法]**:（Webhook ではなく **[!UICONTROL ランタイムアクション]** を選択します。
   1. **[!UICONTROL ランタイムアクション]**：ドロップダウンから「`webhook-proxy`」を選択します（ページが表示されない場合は更新します）。
1. 「**[!UICONTROL 設定済みのイベントを保存]**」を選択します。


### 手順 8：サンプルイベントを使用した検証

設定済みのイベントの横にある「サンプルイベントを送信」ボタンをクリックすると、フローのエンドツーエンド全体をテストできます。

サンプルイベントは、Slack アプリの作成時と Webhook の作成時に設定したチャネルに対して送信されます。次のようなメッセージが表示されます。

![Slackでのモニタリングイベントの例 &#x200B;](../assets/slack-monitor.png)

これで、SlackとExperience Platform events の統合に成功しました。

### よくある問題

次に、プロキシの設定時に発生する可能性のある問題と、それらに対処する潜在的な方法を示します。

* **IMS 組織が表示されません**：実行中に IMS 組織のリストが表示されない場合は `aio app init` 次を試してください。 ターミナルで `aio logout` を実行し、デフォルトの web ブラウザーでExperience Cloudからログアウトして、`aio login` を再度実行します。
* **アクションがドロップダウンに表示されません**:`web: no` が `app.config.yaml` で設定されていることを確認します。 Web 以外のアクションのみが「ランタイムアクション」ドロップダウンに表示されます。 デプロイ後にDeveloper Consoleページを更新します。
* **署名の検証に失敗しました**：アクティベーションログにこれが表示される場合は、Adobeの組み込みバリデーターがリクエストを拒否したことを意味します。 これは、Adobeの正当なイベントには発生しません。 イベント登録が正しく設定されていることを確認します。
* **Slackがメッセージを受信しません**:`SLACK_WEBHOOK_URL` ファイルに `.env` が正しく設定されていること、およびSlack アプリで受信 Webhook が有効になっていることを確認してください。
* **アクションタイムアウト**：実行時アクションのタイムアウトは 60 秒です。 アクションにより長い時間がかかる場合は、代わりにジャーナル処理アプローチの使用を検討します。