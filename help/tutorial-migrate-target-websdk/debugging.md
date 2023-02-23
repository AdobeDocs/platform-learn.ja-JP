---
title: デバッグ | at.js 2.x から Web SDK への Target の移行
description: Adobe Experience Platform Web SDK を使用したAdobe Target実装のデバッグ方法について説明します。 トピックには、デバッグオプション、ブラウザー拡張機能、at.js と Platform Web SDK の違いが含まれます。
source-git-commit: 287ebcb275c4fca574dbd6cdf7e07ba4268bddb5
workflow-type: tm+mt
source-wordcount: '1535'
ht-degree: 3%

---

# Platform Web SDK での Target のデバッグ

Target アクティビティを検証し、Web SDK をデバッグして、実装、コンテンツ配信、オーディエンス資格認定に関する問題のトラブルシューティングをおこないます。 この移行ガイドのページでは、at.js によるデバッグと Platform Web SDK によるデバッグの違いについて説明します。

次の表に、テストおよびデバッグアプローチの機能とサポートの概要を示します。

| 機能またはツール | at.js のサポート | Platform Web SDK のサポート |
| --- | --- | --- |
| アクティビティ QA URL | ○ | ○ |
| `mboxDisable` URL パラメーター | ○ | 以下の情報を参照してください： [Target 機能の無効化](#disable-target-functionality) |
| `mboxDebug` URL パラメーター | ○ | 用途 `alloy_debug` 類似のデバッグ情報のパラメーター |
| `mboxTrace` URL パラメーター | ○ | Debugger ブラウザー拡張機能のExperience Platform |
| Adobe Experience Platform Debugger 拡張機能 | ○ | ○ |
| `alloy_debug` URL パラメーター | 適用なし | ○ |
| Adobe Experience Platform Assurance | 適用なし | ○ |

## Adobe Experience Platform Debugger ブラウザー拡張機能

Chrome および Firefox 用Adobe Experience Platform Debugger 拡張機能は Web ページを調べ、Adobe Experience Cloud実装の検証を支援します。

Web ページ上で Platform Debugger を実行できます。拡張機能は公開データにアクセスできます。 Target トレース情報などの拡張機能を使用して非公開データにアクセスするには、 **[!UICONTROL ログイン]** リンク。

### Adobe Experience Platform Debugger の取得とインストール

Adobe Experience Platform Debugger は、Google Chrome または Mozilla Firefox ブラウザーにインストールできます。 次の適切なリンクに従って、目的のブラウザーに拡張機能をインストールします。

- [Chrome](https://chrome.google.com/webstore/detail/adobe-experience-platform/bfnnokhpnncpkdmbokanobigaccjkpob)
- [Firefox](https://addons.mozilla.org/ja/firefox/addon/adobe-experience-platform-dbg/)

Chrome 拡張機能または Firefox アドオンをインストールすると、アイコン (![](assets/start-icon.jpg)) が拡張機能バーに追加されます。 このアイコンを選択して、拡張機能を開きます。

詳しくは、該当するガイドを参照してください。 [Adobe Experience Platform Debugger 拡張機能](https://experienceleague.adobe.com/docs/experience-platform/debugger/home.html) およびすべてのAdobeWeb アプリケーションのデバッグ方法。

## QA URL を使用した Target アクティビティのプレビュー

at.js と Platform Web SDK の両方で、Target QA URL を使用して Target アクティビティをプレビューできます。また、両方の実装方法で同じ QA 機能がサポートされています。

at.js または Platform Web SDK に対して、という名前のブラウザーに特定の Cookie を書き込むよう指示することで、Target QA URL が機能します。 `at_qa_mode`. この cookie は、特定のアクティビティおよびエクスペリエンスの認定を強制するために使用されます。

>[!CAUTION]
>
>Target QA モード機能は、Platform Web SDK バージョン2.13.0以降でサポートされます。 Target QA モードは、 `xdm.web.webPageDetails.URL` 渡された値 `sendEvent` 呼び出し。 この値に対してすべての文字の小文字を変更した場合、Target QA モードが正しく動作しない可能性があります。

詳しくは、該当するガイドを参照してください。 [Target アクティビティ QA](https://experienceleague.adobe.com/docs/target/using/activities/activity-qa/activity-qa.html).

## Target の実装のデバッグ

次の表に、at.js と Platform Web SDK のデバッグ戦術の違いを示します。

| at.js の機能 | Platform Web SDK：対応する SDK |
| --- | --- |
| **Mbox 無効化** - Target の取得およびレンダリングを無効にして、Target とのやり取りなしでページが壊れているかどうかを確認します<br><br>次の URL パラメーターを含むページを読み込みます。 `mboxDisable=true` | 直接同等のものはありません。 ブラウザーの開発者ツールを使用して、すべての Platform Web SDK リクエストをブロックできます。 |
| **Mbox のデバッグ**  — ブラウザーのコンソールにすべての at.js アクションを記録して、レンダリングの問題のトラブルシューティングに役立てます。<br><br>次の URL パラメーターを含むページを読み込みます。 `mboxDebug=true` | **Alloy デバッグ** :Target のパーソナライゼーションアクションなど、SDK の詳細なアクションを記録します。<br><br>次の URL パラメーターを含むページを読み込みます。 `alloy_debug=true`  <br /><br />または、 `alloy("setDebug", { "enabled": true });` （デベロッパーコンソール内） |
| **ターゲットトレース** - Target UI で生成された mbox トレーストークンを使用すると、判定プロセスに関係する詳細を含むトレースオブジェクトを、以下で使用できます。 `window.___target_trace` オブジェクト。<br><br>次の URL パラメーターを含むページを読み込みます。 `mboxTrace=window&authorization={TOKEN}` | Adobe Experience Platform Debugger 拡張機能または Platform Assurance を使用します。 |

>[!NOTE]
>
>上記の at.js のデバッグ機能はすべて、Adobe Experience Platform Debugger の機能強化で使用できます。

### Target 機能の無効化

Platform Web SDK には、現在、Target 応答を選択的に抑制する機能はありません。 ただし、ブラウザーの開発者ツール、様々なブラウザー拡張機能、またはサードパーティアプリケーションを使用して、Platform Web SDK リクエストを抑制することができます。 例えば、Google Chrome で Platform Web SDK をブロックするには、次のようにします。

1. ページ上の任意の場所を右クリックし、「 」を選択します。 **Inspect**
1. を選択します。 **ネットワーク** タブ
1. 文字列でフィルター `//ee//` :Platform Web SDK 呼び出しのみを表示します
1. ページを再読み込み
1. フィルターを適用したネットワークリクエストの 1 つを右クリックし、「 」を選択します。 **要求ドメインをブロック**
1. ページを再読み込みし、ネットワーク要求がブロックされていることを確認します。
1. デバッグが終了したら、ブロックされたネットワークリクエストを右クリックし、「 」を選択します。 **ブロック解除**&#x200B;または、デベロッパーツールパネルを閉じます。

### デバッグログを表示

を使用した at.js のデバッグログ `mboxDebug=true` URL パラメーターは、各 Target リクエスト、応答、およびページへのコンテンツのレンダリング試行に関する詳細情報を表示します。 Platform Web SDK は、 `alloy_debug=true` URL パラメーター。

| 記録された情報 | at.js (`mboxDebug=true`) | Platform Web SDK (`alloy_debug=true`) |
| --- | --- | --- |
| フィルタリング用のログプレフィックス | `AT:` | `[alloy]` |
| ページ読み込み要求の詳細 | ○ | ○ |
| mbox またはスコープのリクエストの詳細 | ○ | ○ |
| リクエストステータス | ○ | ○ |
| 応答の詳細 | ○ | ○ |
| レンダリングステータス | 成功とエラー | エラーのみ |
| レンダリングの詳細 | ○ | ○ |

>[!NOTE]
>
>at.js および Platform Web SDK のデバッグログは、同様の詳細レベルを提供しますが、Web SDK は無効なセレクターによるレンダリングエラーのみを通知する点が大きな例外です。 現在、デバッグログは、レンダリングが成功したことを確認しません。

### Target トレースを表示

Target トレースは、アクティビティの選定と訪問者の Target プロファイルに関する詳細情報を提供します。 Target トレースには公開されていない情報が含まれているので、トレースを表示するには、Adobe Experience Platform Debugger ブラウザー拡張ウィンドウ内で認証をおこなう必要があります。

| Target トレースメソッド | at.js | Platform Web SDK |
| --- | --- | --- |
| `mboxTrace` URL パラメーター | ○ | × |
| Adobe Experience Platform Debugger ブラウザー拡張機能 | ○ | ○ |
| Adobe Experience Platform Assurance | × | ○ |


Adobe Experience Platform Debugger で Platform Web SDK Target トレースを表示するには、以下の手順を実行します。

1. Platform Web SDK で Target が実装されているサイトのページに移動します。
1. アイコン (![](assets/start-icon.jpg)) をブラウザーナビゲーションバーに表示します。
1. を選択します。 **[!UICONTROL ログイン]** リンク
1. Adobe Experience Cloudログインを使用した認証
1. を選択します。 **[!UICONTROL ログ]** 左側のタブ
1. を選択します。 **[!UICONTROL Edge]** 上部のタブ
1. オプションで、デバッグセッションに名前を付け、 **[!UICONTROL 接続]** ボタン
1. ページを再読み込みし、エッジネットワークでのやり取りに関する詳細情報がログに記録されます
1. 説明の「Target Traces」で始まるログエントリにフォーカスし、を選択します。 **[!UICONTROL 表示]** Target のトレースの詳細を表示するには

![Adobe Experience Platform Debugger を使用して Target トレースを表示する方法](assets/target-trace-debugger.png){zoomable=&quot;yes&quot;}

選択後 **[!UICONTROL 表示]**&#x200B;に値を指定すると、オーバーレイが表示され、リクエストに関連する次の情報を確認できます。

- 一致したアクティビティ
- 不一致のアクティビティ
- リクエストの詳細
- プロファイルスナップショット

該当する [Target コンテンツ配信のデバッグ](https://experienceleague.adobe.com/docs/target/using/activities/troubleshoot-activities/content-trouble.html) を参照してください。

### アシュランスを使用したトラブルシューティング

Target のトレース情報は、Adobe Experience Platform Debugger ブラウザー拡張機能と、Assurance アプリケーション（旧称 Project Griffon）の両方で表示できます。 アシュランス内で Target トレースを表示するには、以下の手順を実行します。

1. Adobe Experience Platform Debugger ブラウザー拡張機能を開き、前述のようにリモートデバッグセッションに接続します。
1. デバッグログの上にあるセッション名を含むリンクを選択します
1. Platform Assurance は、実装のデータストリームで設定されたすべてのAdobeアプリケーションの詳細なログを読み込んで表示します
1. 次の条件でログをフィルター `adobe.target`
1. タイプのログエントリを選択 `com.adobe.target.trace`
1. ペイロードの詳細を展開し、以下の情報を表示します。 `context > targetTrace`

![アシュランスを使用して Target トレースを表示する方法](assets/target-trace-assurance.png){zoomable=&quot;yes&quot;}

## ネットワークリクエストと応答の検証

Platform Web SDK のリクエストペイロードと応答 `sendEvent` 呼び出しは at.js とは異なります。 以下の概要は、ブラウザーの開発者ツールを使用してネットワーク呼び出しを調べる際に、リクエストと応答の構造を理解するのに役立ちます。

### コンテンツリクエストペイロード

![Platform Web SDK ペイロードの Target 固有の要素](assets/target-payload.png){zoomable=&quot;yes&quot;}

- プロファイル、エンティティ、およびその他の非 mbox パラメーターは、 `data.__adobe.target`
- 決定範囲は、 `query.personalization.decisionScopes`
- ダウンストリームの mbox パラメーターにマッピングされる XDM データは、以下のイベント配列に配置されます。 `xdm`

### コンテンツ応答本文

![Platform Web SDK の応答本文の Target 固有の要素](assets/target-response.png){zoomable=&quot;yes&quot;}

- Platform Web SDK は、 `handle` object
- この `personalization:decisions` アクションは、Target またはoffer decisioningからの応答を示します
- ターゲットの提案は配列として表され、それぞれにはプレフィックスが付いた一意の提案 ID が付きます。 `AT:`
- 決定範囲とアクティビティの詳細は、提案配列内に配置されます
- オファーの詳細は、 `items` 配列の下 `data`
- レスポンストークンは、 `items` 配列の下 `meta`

### 提案イベントのペイロード

![ターゲットの提案イベントの例](assets/target-proposition-event.png){zoomable=&quot;yes&quot;}

- Target 固有の SDK イベントは、 `decisioning.propositionDisplay` 印象や `decisioning.propositionInteract` クリックなどのインタラクションの場合
- 提案イベントの詳細は、のイベント配列にあります。 `xdm._experience.decisioning`
- 表示またはインタラクションイベントの提案 ID は、Target から返されるコンテンツの提案 ID と一致する必要があります


おめでとうございます。チュートリアルの最後に達しました。 Adobe Target実装を Web SDK に移行していただき、誠にありがとうございます。

>[!NOTE]
>
>at.js から Web SDK への Target の移行を成功に導くための支援に努めています。 移行時に障害が発生した場合や、このガイドに重要な情報が欠落していると思われる場合は、 [このコミュニティディスカッション](https://experienceleaguecommunities.adobe.com/t5/adobe-experience-platform-data/tutorial-discussion-migrate-target-from-at-js-to-web-sdk/m-p/575587#M463).
