---
title: デバッグ – ターゲットの移行元
description: Adobe Experience Platform Mobile SDK を使用してAdobe Target実装をデバッグする方法について説明します。
source-git-commit: 009548969b88d1bfa6eac23f65b1ca2144f27c34
workflow-type: tm+mt
source-wordcount: '1227'
ht-degree: 3%

---

# Platform Mobile SDK を使用した Target のデバッグ

Target アクティビティの検証と Mobile SDK のデバッグによる、実装、コンテンツ配信、オーディエンスの選定の問題のトラブルシューティング。 移行ガイドのこのページでは、at.js を使用したデバッグと Platform Web SDK のデバッグの違いについて説明します。

次の表に、テストとデバッグのアプローチの機能とサポートの概要を示します。

| 機能またはツール | at.js のサポート | Platform Web SDK サポート |
| --- | --- | --- |
| アクティビティ QA URL | ○ | ○ |
| `mboxDisable` URL パラメーター | ○ | 詳しくは、以下の情報を参照してください [Target 機能の無効化 ](#disable-target-functionality) |
| `mboxDebug` URL パラメーター | ○ | 同様 `alloy_debug` デバッグ情報にはパラメーターを使用してください |
| `mboxTrace` URL パラメーター | ○ | Experience Platformデバッガーブラウザー拡張機能の使用 |
| Adobe Experience Platform Debugger拡張機能 | ○ | ○ |
| `alloy_debug` URL パラメーター | 該当なし | ○ |
| Adobe Experience Platform Assurance | 該当なし | ○ |

## Adobe Experience Platform Debuggerブラウザー拡張機能

Chromeおよび Firefox 用のAdobe Experience Platform Debugger拡張機能は web ページを調べ、Adobe Experience Cloud実装の検証に役立ちます。

任意の web ページで Platform Debugger を実行できます。拡張機能は公開データにアクセスできます。 Target トレース情報などの拡張機能を使用して非公開データにアクセスするには、「**[!UICONTROL ログイン]**」リンクを介してExperience Cloudの認証を受ける必要があります。


## QA URL で Target アクティビティをプレビューする

at.js と Platform Web SDK の両方で、Target QA URL を使用して Target アクティビティをプレビューできます。また、両方の実装方法で同じ QA 機能をサポートしています。

at.js または Platform Web SDK に対し、`at_qa_mode` という名前のブラウザーに特定の Cookie を書き込むよう指示することで、Target QA URL が機能する。 この cookie は、特定のアクティビティおよびエクスペリエンスの選定を強制するために使用されます。

>[!CAUTION]
>
>Target の QA モード機能は、Platform Web SDK バージョン 2.13.0 以降でサポートされています。 ターゲット QA モードは、`sendEvent` 呼び出しで渡された `xdm.web.webPageDetails.URL` 値に基づいて有効になります。 この値を変更（すべての文字を小文字にするなど）すると、Target QA モードが正しく動作しなくなる可能性があります。

[ ターゲットアクティビティ QA](https://experienceleague.adobe.com/docs/target/using/activities/activity-qa/activity-qa.html) について詳しくは、専用ガイドを参照してください。

## Target 実装のデバッグ

次の表に、at.js と Platform Web SDK デバッグ戦術の違いの概要を示します。

| at.js の機能 | Platform Web SDK の同等機能 |
| --- | --- |
| **mbox 無効化** - Target は取得とレンダリングから無効にし、Target のインタラクション <br><br>URL パラメーター `mboxDisable=true` を含むページの読み込みを行わずにページが壊れているかどうかを確認します | 直接同等の手段はありません。 ブラウザーの開発者ツールを使用して、すべての Platform Web SDK リクエストをブロックできます。 |
| **mbox デバッグ** - ブラウザーのコンソールにすべての at.js アクションを記録して、レンダリングの問題のトラブルシューティングに役立てます <br><br>URL パラメーターを含むページを読み込み：`mboxDebug=true` | **Alloy のデバッグ** - Target のパーソナライゼーションアクションを含むがこれに限定されない、SDK の詳細なアクションをログに記録します。<br><br>URL パラメーターを使用してページを読み込む：`alloy_debug=true` <br /><br /> または、開発者コンソールで `alloy("setDebug", { "enabled": true });` を実行します |
| **Target トレース** - Target UI で生成された mbox トレーストークンを使用すると、決定プロセスに関与した詳細を含むトレースオブジェクトをオブジェクトの下で使用でき `window.___target_trace` す。<br><br>URL パラメーターを持つページを読み込む：`mboxTrace=window&authorization={TOKEN}` | Adobe Experience Platform Debugger 拡張機能または Platform Assurance を使用します。 |

>[!NOTE]
>
>上記のすべての at.js デバッグ機能は、Adobe Experience Platform Debuggerの拡張機能で利用できます。

### Target 機能の無効化

Platform Web SDK には、現在、Target 応答を選択的に抑制する機能がありません。 ただし、ブラウザーの開発者ツール、様々なブラウザー拡張機能、サードパーティアプリケーションを使用して、Platform Web SDK リクエストを抑制することは可能です。 例えば、Google Chromeで Platform Web SDK をブロックするには、次の手順を実行します。

1. ページ上を右クリックして、「**Inspect**」を選択します
1. 「**ネットワーク**」タブを選択します。
1. 文字列 `//ee//` でフィルタリングして、Platform Web SDK 呼び出しのみを表示します
1. ページをリロードします。
1. フィルタリングされたネットワークリクエストの 1 つを右クリックし、「**リクエストドメインをブロック**」を選択します。
1. ページをリロードし、ネットワークリクエストがブロックされていることを確認します
1. デバッグが完了したら、ブロックされたネットワークリクエストを右クリックして「**ブロック解除**」を選択するか、開発者ツールパネルを閉じます

### デバッグログの表示

`mboxDebug=true` URL パラメーターを使用した at.js のデバッグログには、各 Target リクエスト、応答、およびコンテンツをページにレンダリングしようとする試みに関する詳細情報が表示されます。 Platform Web SDK には、`alloy_debug=true` URL パラメーターを使用した同様のデバッグログがあります。

| ログ情報 | at.js （`mboxDebug=true`） | Platform Web SDK （`alloy_debug=true`） |
| --- | --- | --- |
| フィルタリング用のログプレフィックス | `AT:` | `[alloy]` |
| ページ読み込みリクエストの詳細 | ○ | ○ |
| mbox またはスコープリクエストの詳細 | ○ | ○ |
| リクエストのステータス | ○ | ○ |
| 応答の詳細 | ○ | ○ |
| レンダリングステータス | 成功とエラー | エラーのみ |
| レンダリングの詳細 | ○ | ○ |

>[!NOTE]
>
>at.js および Platform Web SDK のデバッグログは、同様の詳細レベルを提供しますが、注目すべき例外は、Web SDK が無効なセレクターに起因するレンダリングエラーのみを通知することです。 デバッグログは、現在のところ、レンダリングが成功したことを確認するものではありません。

### ターゲットトレースの表示

Target トレースは、アクティビティ選定および訪問者の Target プロファイルに関する詳細情報を提供します。 Target トレースには、公開されていない情報が含まれているので、それらを表示するには、認証トークンまたはAdobe Experience Platform Debuggerブラウザー拡張機能ウィンドウ内での認証が必要です。

| ターゲットトレース方法 | at.js | Platform Web SDK |
| --- | --- | --- |
| `mboxTrace` URL パラメーター | ○ | × |
| Adobe Experience Platform Debuggerブラウザー拡張機能 | ○ | ○ |
| Adobe Experience Platform Assurance | × | ○ |



<!--![How to view Target traces with Adobe Experience Platform Debugger](assets/target-trace-debugger.png){zoomable="yes"}-->

「**[!UICONTROL 表示]**」を選択すると、オーバーレイが表示され、リクエストに関連する次の情報を確認できます。

- 一致したアクティビティ
- 比類のないアクティビティ
- リクエストの詳細
- プロファイルスナップショット

Target のトレースについて詳しくは、[Target コンテンツ配信のデバッグ ](https://experienceleague.adobe.com/docs/target/using/activities/troubleshoot-activities/content-trouble.html) に関する専用ガイドを参照してください。

### Assurance を使用したトラブルシューティング

Target Trace 情報は、Adobe Experience Platform Debuggerブラウザー拡張機能と Assurance アプリケーション（旧称 Project Griffon）内の両方で表示できます。 Assurance 内のターゲット・トレースを表示するには、次の手順を実行します。

1. Adobe Experience Platform Debuggerブラウザー拡張機能を開き、前述のようにリモートデバッグセッションを接続します
1. デバッグログの上にある、セッション名を持つリンクを選択します
1. Platform Assurance は、データストリームで設定されたすべてのAdobeアプリケーションに関する詳細なログを読み込んで表示します
1. `adobe.target` でログをフィルタリングします
1. タイプが「`com.adobe.target.trace`」のログエントリを選択します
1. ペイロードの詳細を展開し、`context > targetTrace` の下の情報を表示します

<!--![How to view Target traces with Assurance](assets/target-trace-assurance.png){zoomable="yes"}-->

## ネットワーク要求と応答を調べる

Platform Web SDK `sendEvent` 呼び出しのリクエストペイロードと応答は、at.js とは異なります。 以下の概要は、ブラウザーの開発者ツールを使用してネットワーク呼び出しを調べる際に、リクエストと応答の構造を理解するのに役立ちます。

### コンテンツリクエストペイロード

<!--![Target specific elements of the Platform Web SDK payload](assets/target-payload.png){zoomable="yes"}-->

- プロファイル、エンティティ、その他の mbox 以外のパラメーターは、`data.__adobe.target` のイベント配列で渡されます
- 決定範囲は、`query.personalization.decisionScopes` の下のイベント配列にあります
- mbox パラメーターのダウンストリームにマッピングされる XDM データは、`xdm` の下のイベント配列にあります

### コンテンツ応答本文

<!--![Target specific elements of the Platform Web SDK response body](assets/target-response.png){zoomable="yes"}-->

- Platform Web SDK は、`handle` オブジェクト下のすべてのAdobeアプリケーションに対するアクションを返します
- `personalization:decisions` アクションは、ターゲットまたはoffer decisioningからの応答を示します
- ターゲットの提案は配列として提示され、それぞれに `AT:` というプレフィックスが付いた一意の提案 ID が割り当てられます
- 決定範囲とアクティビティの詳細は、提案の配列内にあります
- オファーの詳細は、`data` の下の `items` 配列にあります
- 応答トークンは、`meta` の下の `items` 配列にあります

### 提案イベントペイロード

<!--![Target proposition event example](assets/target-proposition-event.png){zoomable="yes"}-->

- Target 固有の SDK イベントは、インプレッションの場合は `decisioning.propositionDisplay`、クリックなどのインタラクションの場合は `decisioning.propositionInteract` です
- 提案イベントの詳細は、`xdm._experience.decisioning` の下のイベント配列にあります
- ディスプレイまたはインタラクションイベントの提案 ID は、Target から返されるコンテンツの提案 ID と一致する必要があります


チュートリアルが終了しました。 Adobe Target実装の Web SDK への移行にご協力ください。

>[!NOTE]
>
>アドビは、Target 拡張機能から Optimize 拡張機能へのモバイルターゲットの移行を成功させるために取り組んでいます。 移行の際に問題が発生した場合、またはこのガイドに重要な情報が欠落していると感じる場合は、[ このコミュニティのディスカッション ](https://experienceleaguecommunities.adobe.com/t5/adobe-experience-platform-data/tutorial-discussion-migrate-target-from-at-js-to-web-sdk/m-p/575587#M463) に投稿してお知らせください。
