---
title: at.js 2.x と Web SDK の比較 | at.js 2.x から Web SDK への Target の移行
description: 機能、関数、設定、データフローなど、at.js 2.x と Platform Web SDK の違いについて説明します。
source-git-commit: f690664b187c5b09f1243ce46877da6fad38efa3
workflow-type: tm+mt
source-wordcount: '2164'
ht-degree: 8%

---

# at.js と Platform Web SDK の比較

スタンドアロンのAdobe Target at.js ライブラリは、Platform Web SDK とは大きく異なります。 以下の表は、移行プロセス中に重点を置く必要がある、実装の領域を評価する際に役立つリファレンスです。

以下の情報を確認し、現在の技術的な at.js 実装を評価した後、以下を理解できるようになります。

- Platform Web SDK でサポートされる Target 機能
- 対応する Platform Web SDK を持つ at.js 関数
- Platform Web SDK での Target 設定の適用方法
- at.js と Platform Web SDK のデータフローの違い

Platform Web SDK を初めて使用する場合は、心配する必要はありません。以下の項目については、このチュートリアル全体で詳しく説明します。

## 機能の比較

|  | Target at.js 2.x | Platform Web SDK |
|---|---|---|
| Target プロファイルを更新 | サポートあり | サポートあり |
| SPAのトリガー表示 | サポートあり | サポートあり |
| Target Recommendations | サポートあり | サポートあり |
| フォームベースのオファーを取得 | サポートあり | サポートあり |
| トラックイベント | サポートあり | サポートあり |
| A4T:単一ページアプリケーション | サポートあり | サポート |
| A4T:クリックの追跡 | サポートあり | サポート |
| A4T:クライアント側ログ | サポートあり | サポート |
| A4T:サーバー側ログ | サポートあり | サポート |
| オファーを適用 | サポートあり | サポートあり |
| 通知なしでSPAでビューを再レンダリング | サポートあり | サポートあり |
| ハイブリッドアプリケーション | サポートあり | サポートあり |
| QA URL | サポートあり | サポートあり |
| mbox サードパーティ ID | サポートあり | サポートあり |
| カスタマー属性 | サポートあり | サポート対象 |
| リモートオファー | サポートあり | サポートあり |
| リダイレクトオファー | サポートあり | サポートあり. ただし、Platform Web SDK を使用したページから at.js を使用した（かつ反対の方向の）ページへのリダイレクトはサポートされていません。 |
| オンデバイス判定 | サポートあり | 現在はサポートされていません |
| Mbox のプリフェッチ | サポートあり | 部分的にサポートされています。 アクティビティのプリフェッチ動作が変更されたので、この機能を有効にするには、カスタマーサポートにお問い合わせください。 |
| カスタムイベント | サポートあり | サポートなし. 詳しくは、 [公共ロードマップ](https://github.com/orgs/adobe/projects/18/views/1?pane=item&amp;itemId=17372355{target=&quot;_blank&quot;}) （現在のステータス）。 |
| レスポンストークン | サポートあり | サポートあり. 詳しくは、 [専用のレスポンストークンに関するドキュメント](https://experienceleague.adobe.com/docs/target/using/administer/response-tokens.html) at.js と Platform Web SDK のコード例と違いについては、を参照してください。 |
| データプロバイダー | サポートあり | サポートなし. カスタムコードを使用して、Platform Web SDK をトリガー化できます `sendEvent` コマンドを使用して、別のプロバイダーからデータを取得できます。 |


## 注目すべき引き出し線

|  | Target at.js 2.x | Platform Web SDK |
|---|---|---|
| ちらつきの緩和 | 非同期実装用の事前非表示スニペットでは、次のスタイル ID を使用します。 `at-body-style`. at.js は、応答を受け取った後にスタイルを削除するこの要素 ID を探します。 | デフォルトの事前非表示スニペットでは、次のスタイル ID が使用されます。 `alloy-prehiding`. Web SDK は、at.js の事前非表示スニペットと互換性がないので、移行プロセスの一環として変更する必要があります。 |
| ページ読み込み時にコンテンツを自動的にレンダリング | Target のグローバル設定で制御します。 有効： `pageLoadEnabled` が `true`. | Platform Web SDK で指定 `sendEvent` コマンドを使用します。 有効にするには、 `renderDecisions` 選択肢 `true`. |
| コンテンツの手動レンダリング | この `applyOffer()` および `applyOffers()` 関数は設定HTMLのみをサポート | この `applyPropositions` コマンドは、柔軟性を高めるために、HTMLの設定、置換、追加をサポートします。 |
| カスタムイベントの追跡 | サポート対象 `trackEvent()` および `sendNotifications()` 関数 これらの関数は Target に固有で、Adobe Analytics指標には影響しません。 | Platform Web SDK のすべてのデータ `sendEvent` の呼び出しが Target に転送されます。 Target に特に必要な追加データは、 `sendEvent` コマンドを `decisioning.propositionDisplay` または `decisioning.propositionInteract` Adobe Analytics指標に影響を与えないようにするため。 |
| Target CNAME | サポートあり. これは、Analytics およびExperience CloudID サービスで使用される CNAME とは別のものです。 | 関連性がなくなりました。 1 つの CNAME をすべての Platform Web SDK 呼び出しで使用できます。 |
| デバッグ | この `mboxDisable`, `mboxDebug`、および `mboxTrace` URL パラメーターは、ブラウザーの開発者ツールでのデバッグに使用できます。<br><br>また、Adobe Experience Platform Debugger は、サポートされるデバッグツールです。 | この `mboxDisable`, `mboxDebug`、および `mboxTrace` URL パラメーターはサポートされていません。<br><br>Web SDK のデバッグを有効にするには、 `alloy_debug=true` をクエリ文字列に追加するか、実行します。 `alloy("setDebug", { "enabled": true });` を開発者コンソールに追加します。<br><br>Adobe Experience Platform Debugger ブラウザー拡張機能を使用して、デバッグ用のエッジトレースを開始できます。<br><br>詳しくは、 [Platform Web SDK のデバッグ](debugging.md) ドキュメントを参照してください。 |
| Analytics for Target（A4T） | SDID 値を使用して、Target と Analytics の呼び出しを結び付けます | ステッチを必要とせずにネイティブにサポート |

>[!NOTE]
>
>特定のページに対する既存の AppMeasurement Adobe Analytics実装を維持したまま、Target から Platform Web SDK への移行はサポートされていません。
>
> at.js（および AppMeasurement.js）実装を Platform Web SDK に 1 ページずつ移行できます。 この方法を使用する場合は、 [`idMigrationEnabled`](https://experienceleague.adobe.com/docs/experience-platform/edge/fundamentals/configuring-the-sdk.html#id-migration-enabled) および [`targetMigrationEnabled`](https://experienceleague.adobe.com/docs/experience-platform/edge/fundamentals/configuring-the-sdk.html#targetMigrationEnabled) オプション `true` と `configure` コマンドを使用します。

## at.js 関数と Platform Web SDK の同等の機能

多くの at.js 関数は、次の表に示す Platform Web SDK を使用する場合と同等のアプローチを持ちます。 詳しくは、 [at.js 関数](https://developer.adobe.com/target/implement/client-side/atjs/atjs-functions/atjs-functions/)詳しくは、 Adobe Target Developer Guide を参照してください。

| at.js 2.x 関数 | Platform Web SDK：対応する SDK |
| --- | --- | 
| `getOffer()` および `getOffers()` | を要求し、を要求します。 [自動的にレンダリング](https://experienceleague.adobe.com/docs/experience-platform/edge/personalization/rendering-personalization-content.html#automatically-rendering-content) Target VEC ベースのエクスペリエンスの場合は、 `sendEvent` コマンドを実行し、 `renderDecisions` オプションを true に設定します。<br><br>フォームベースのエクスペリエンスをリクエストするには、または [手動レンダリング](https://experienceleague.adobe.com/docs/experience-platform/edge/personalization/rendering-personalization-content.html#manually-rendering-content) コンテンツ、配列を指定 `decisionScopes` (mbox) を `sendEvent` コマンドを使用します。 |
| `applyOffer()` および `applyOffers()` | 以下を使用： [`applyPropositions`](https://experienceleague.adobe.com/docs/experience-platform/edge/personalization/rendering-personalization-content.html#applypropositions) 」コマンドを使用してコンテンツを適用します。 特定のセレクターにHTMLを設定、置換、または追加できます。 |
| `triggerView()` | Platform Web SDK は、自動的にトリガーを [変更を表示](https://experienceleague.adobe.com/docs/experience-platform/edge/personalization/adobe-target/web-sdk-atjs-comparison.html#how-to-trigger-a-view-change-in-a-single-page-application) (SPA VEC の目的で ) `web.webPageDetails.viewName` プロパティが `xdm` オプション `sendEvent` コマンドを使用します。 |
| `trackEvent()` および `sendNotifications()` | 以下を使用： `sendEvent` 命令 [特定の `eventType`](https://experienceleague.adobe.com/docs/experience-platform/edge/personalization/adobe-target/web-sdk-atjs-comparison.html#how-to-track-events) 設定：<br><br>`decisioning.propositionDisplay` は、アクティビティのレンダリングを示します。<br><br>`decisioning.propositionInteract` は、マウスのクリックと同様に、ユーザーがアクティビティを操作することを示します。 |
| `targetGlobalSettings()` | 直接同等のものはありません。 詳しくは、 [ターゲット設定の比較](detailed-comparison.md) を参照してください。 |
| `targetPageParams()` および `targetPageParamsAll()` | に渡されたすべてのデータ `xdm` オプション `sendEvent` コマンドが Target の mbox パラメーターにマッピングされる。 mbox パラメーターはシリアル化されたドット表記を使用して命名されるので、Platform Web SDK への移行時には、新しい mbox パラメーター名を使用するために、既存のオーディエンスおよびアクティビティを更新する必要が生じる場合があります。 <br><br>の一部として渡されたデータ `data.__adobe.target` の `sendEvent` コマンドが [Target プロファイルとRecommendations固有のパラメーター](https://experienceleague.adobe.com/docs/experience-platform/edge/personalization/adobe-target/target-overview.html#single-profile-update). |
| at.js カスタムイベント | サポートなし. 詳しくは、 [公共ロードマップ](https://github.com/orgs/adobe/projects/18/views/1?pane=item&amp;itemId=17372355{target=&quot;_blank&quot;}) （現在のステータス）。 [レスポンストークン](https://experienceleague.adobe.com/docs/experience-platform/edge/personalization/adobe-target/accessing-response-tokens.html) は、 `propositions` ～に応じて `sendEvent` 呼び出し。 |

## at.js の設定と Platform Web SDK の同等の機能

at.js ライブラリは、Target UI の様々な設定を使用して設定およびダウンロードできます。 これらの設定は、 [`targetGlobalSettings()`](https://developer.adobe.com/target/implement/client-side/atjs/atjs-functions/targetglobalsettings/) 関数に置き換えます。 次の表では、これらの設定を Platform Web SDK で使用できる設定と比較します。

| at.js の設定 | Platform Web SDK：対応する SDK |
| --- | --- |
| `bodyHiddenStyle` | を [`prehidingStyle`](https://experienceleague.adobe.com/docs/experience-platform/edge/fundamentals/configuring-the-sdk.html#prehidingStyle) と `configure` command |
| `bodyHidingEnabled` | 次の場合、 `prehidingStyle` が `configure` 」コマンドを入力すると、この機能が有効になります。 スタイルが定義されていない場合、Platform Web SDK はコンテンツを非表示にしようとしません。 |
| `clientCode` | 自動設定 |
| `cookieDomain` | 適用なし |
| `crossDomain` | を `thirdPartyCookiesEnabled` 選択肢 `true` と `configure` コマンドを使用して、クロスドメインの使用例に対してファーストパーティ Cookie とサードパーティ Cookie を有効にする |
| `cspScriptNonce` および `cspStyleNonce` | 詳しくは、 [CSP の設定](https://experienceleague.adobe.com/docs/experience-platform/edge/fundamentals/configuring-a-csp.html) |
| `dataProviders` | サポートなし |
| `decisioningMethod` | すべての Platform Web SDK `sendEvent` コマンドは、サーバー側判定を使用します。 ハイブリッドとオンデバイスの判定はサポートされていません。 |
| `defaultContentHiddenStyle` および `defaultContentVisibleStyle` | at.js 1.x でのみ適用できます。at.js 2.x と同様に、フォームベースのエクスペリエンスのちらつきの緩和は、カスタムコードを使用して実行できます。 |
| `deviceIdLifetime` | サポートなし. If `targetMigrationEnabled` が `true` と `configure` コマンド、 `mbox` cookie は、デバイスの有効期間を 2 年に設定します。 この値は設定できません。 |
| `enabled` | データストリーム設定で Target 機能が有効または無効になっています |
| `globalMboxAutoCreate` | を `renderDecisions` 選択肢 `true` と `sendEvent` コマンドを使用して VEC ベースのエクスペリエンスを自動的に取得し、レンダリングすることができます。<br><br>リクエスト a `decisionScope` 対象 `__view__` VEC ベースのエクスペリエンスを手動でレンダリングする場合。 |
| `imsOrgId` | を `orgId` と `configure` command |
| `optinEnabled` および `optoutEnabled` | Platform Web SDK を参照してください。 [プライバシーオプション](https://experienceleague.adobe.com/docs/experience-platform/edge/consent/supporting-consent.html). この `defaultConsent` オプションは、Platform Web SDK がサポートするすべてのAdobeソリューションに適用されます。 |
| `overrideMboxEdgeServer` および `overrideMboxEdgeServerTimeout` | 適用なし. すべての Platform Web SDK リクエストで、Adobe Experience Platform Edge ネットワークが使用されます。 |
| `pageLoadEnabled` | を `renderDecisions` 選択肢 `true` と `sendEvent` command |
| `secureOnly` | サポートなし. Platform Web SDK は、 `secure` および `sameSite="none"` 属性。 |
| `selectorsPollingTimeout` | サポートなし. Platform Web SDK では、5 秒の値を使用します。 必要に応じて、カスタムコードを使用してコンテンツを手動でレンダリングできます。 |
| `serverDomain` | 以下を使用： `edgeDomain` 設定 `configure` command |
| `telemetryEnabled` | 適用なし |
| `timeout` | サポートなし. ちらつきを緩和するコードに適切なタイムアウトが含まれていることを確認することをお勧めします。 |
| `viewsEnabled` | サポートなし. Target ビューのコンテンツは、最初の `sendEvent()` を呼び出す `renderDecisions` が `true` または `__view__` decisionScope がリクエストに含まれます。 |
| `visitorApiTimeout` | 適用なし |


## システム図の比較

次の図は、at.js を使用した Target の実装と、Platform Web SDK を使用した実装のデータフローの違いを理解するのに役立ちます。

### at.js 2.x のシステム図

![ページ読み込み時の at.js 2.0 の動作](assets/target-at-js-2x-diagram.png)

| を呼び出します | 詳細 |
| --- | --- |
| 1 | 呼び出しによってExperience CloudID(ECID) が返されます。 ユーザーが認証されると、別の呼び出しが顧客 ID を同期します。 |
| 2 | at.js ライブラリはドキュメント本文を同期的に読み込み、非表示にします（at.js は、ページに実装されているオプションの非表示スニペットを使用して非同期で読み込むこともできます）。 |
| 3 | ページ読み込みリクエストは、設定済みのすべてのパラメーター、ECID、SDID および顧客 ID を含めておこなわれます。 |
| 4 | プロファイルスクリプトが実行され、プロファイルストアに送られます。 ストアは、オーディエンスライブラリから正規のオーディエンスをリクエストします ( 例えば、Analytics やAudience Managerなどから共有されたオーディエンス )。 顧客属性がバッチ処理でプロファイルストアに送信されます。 |
| 5 | Target は、URL、リクエストパラメーターおよびプロファイルデータに基づいて、現在のページおよび将来のビューで、どのアクティビティおよびエクスペリエンスを訪問者に返すかを決定します。 |
| 6 | ターゲットコンテンツが（オプションで、追加のパーソナライゼーションに関するプロファイル値を含めて）ページに送り返されました。<br><br>デフォルトコンテンツがちらつくことなく、可能な限り迅速に現在のページ上のターゲットコンテンツが表示されます。<br><br>将来の単一ページアプリケーションのビュー用のターゲットコンテンツはブラウザーにキャッシュされるので、ビューがトリガーされる際に追加のサーバー呼び出しを必要とせずに、即座に適用できます。 ( 次の triggerView() の動作図を参照 )。 |
| 7 | ページからデータ収集サーバーに送信される Analytics データ。 |
| 8 | Target データは、SDID を使用して Analytics データに適合され、Analytics レポートストレージへと処理されます。A4T レポートを使用して、Analytics データが Analytics for Target の両方に表示できるようになります。 |

次の方法について詳しくは、開発者ガイドを参照してください。 [at.js を使用したシングルページアプリケーションへの Target の実装](https://developer.adobe.com/target/implement/client-side/atjs/how-to-deployatjs/target-atjs-single-page-application/).

### Platform web SDK のシステム図

![Platform Web SDK を使用したAdobe Target Edge Decisioning の図](assets/target-platform-web-sdk.png)

| を呼び出します | 詳細 |
| --- | --- |
| 1 | デバイスが Platform Web SDK を読み込みます。 Platform Web SDK は、XDM データ、Datastreams 環境 ID、渡されたパラメーターおよび顧客 ID（オプション）を使用して、エッジネットワークにリクエストを送信します。 ページ（またはコンテナ）は事前に非表示になっています。 |
| 2 | エッジネットワークは、エッジサービスにリクエストを送信し、訪問者 ID、同意、その他の訪問者のコンテキスト情報（位置情報やデバイスにわかりやすい名前など）でエンリッチメントします。 |
| 3 | Edge ネットワークは、訪問者 ID と渡されたパラメーターを使用して、エンリッチメントされたパーソナライゼーションリクエストを Target Edge に送信します。 |
| 4 | プロファイルスクリプトが実行され、Target プロファイルストレージにフィードされます。 プロファイルストレージは、オーディエンスライブラリからセグメント ( 例えば、Adobe Analytics、Adobe Audience Manager、Adobe Experience Platformから共有されたセグメント ) を取得します。 |
| 5 | Target は、URL リクエストパラメーターとプロファイルデータに基づいて、現在のページビューと今後のプリフェッチされたビューで、訪問者に対して表示するアクティビティとエクスペリエンスを決定します。 次に、Target は、これを Edge ネットワークに送り返します。 |
| 6 | a.Edge ネットワークは、パーソナライゼーション応答を（オプションで、追加のパーソナライゼーションに関するプロファイル値を含めて）ページに送り返します。 デフォルトコンテンツがちらつくことなく、可能な限り迅速に現在のページ上のパーソナライズされたコンテンツが表示されます。<br><br>b.シングルページアプリケーション (SPA) でのユーザー操作の結果として表示されるビュー用にパーソナライズされたコンテンツは、追加のサーバー呼び出しなしで即座にレンダリングできるようにキャッシュされます。<br><br>c.エッジネットワークが訪問者 ID およびその他の値を Cookie（同意、セッション ID、ID、Cookie チェック、パーソナライゼーションなど）で送信します。 |
| 7 | エッジネットワークは、Analytics for Target(A4T) の詳細（アクティビティ、エクスペリエンス、コンバージョンのメタデータ）を Analytics Edge に転送します。 |

次の方法について詳しくは、開発者ガイドを参照してください。 [シングルページアプリケーション用の Platform Web SDK を使用した Target の実装](https://experienceleague.adobe.com/docs/experience-platform/edge/personalization/adobe-target/spa-implementation.html).

現在の Target の実装と使用する機能に関する十分な技術的知識を得たら、次の手順は [初期設定](initial-setup.md).

>[!NOTE]
>
>at.js から Web SDK への Target の移行を成功に導くための支援に努めています。 移行時に障害が発生した場合や、このガイドに重要な情報が欠落していると思われる場合は、 [このコミュニティディスカッション](https://experienceleaguecommunities.adobe.com/t5/adobe-experience-platform-launch/tutorial-discussion-implement-adobe-experience-cloud-with-web/td-p/444996).
