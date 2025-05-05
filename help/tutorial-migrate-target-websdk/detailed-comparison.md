---
title: at.js 2.x と Web SDK の比較 – Target を at.js 2.x から Web SDK に移行します
description: at.js 2.x と Platform Web SDK の違い（機能、関数、設定、データフローなど）について説明します。
exl-id: b6f0ac2b-0d8e-46ce-8e9f-7bbc61eb20ec
source-git-commit: d4308b68d6974fe47eca668dd16555d15a8247c9
workflow-type: tm+mt
source-wordcount: '2007'
ht-degree: 4%

---

# at.js と Platform Web SDK の比較

スタンドアロンのAdobe Target at.js ライブラリは、Platform Web SDK とは大きく異なります。 次の表は、移行プロセスの間に注意が必要になる実装領域を評価する際に役立つリファレンスです。

以下の情報を確認し、現在の at.js の技術的実装を評価すると、次のことを理解できるようになります。

- Platform Web SDK でサポートされている Target 機能
- Platform Web SDK と同等の機能を持つ at.js 関数
- Platform Web SDK での Target 設定の適用方法
- at.js と Platform Web SDK のデータフローの違い

Platform Web SDK を初めて使用する場合は、心配はいりません。以下の項目については、このチュートリアル全体でより詳しく説明します。

## 機能の比較

| | Target at.js 2.x | Platform Web SDK |
|---|---|---|
| ターゲットプロファイルを更新 | サポートあり | サポートあり |
| SPAのトリガービュー | サポートあり | サポートあり |
| Target Recommendations | サポートあり | サポートあり |
| フォームベースのオファーの取得 | サポートあり | サポートあり |
| トラックイベント | サポートあり | サポートあり |
| A4T：単一ページアプリケーション | サポートあり | サポートあり |
| A4T：クリックの追跡 | サポートあり | サポートあり |
| A4T：クライアントサイドログ | サポートあり | サポートあり |
| A4T：サーバーサイドログ | サポートあり | サポートあり |
| オファーの適用 | サポートあり | サポートあり |
| 通知を使用しないSPAでのビューの再レンダリング | サポートあり | サポートあり |
| ハイブリッドアプリケーション | サポートあり | サポートあり |
| QA の URL | サポートあり | サポートあり |
| Mbox サードパーティ ID | サポートあり | サポートあり |
| 顧客属性 | サポートあり | サポートあり |
| リモートオファー | サポートあり | サポートあり |
| リダイレクトオファー | サポートあり | サポート。 ただし、Platform Web SDK を含むページから at.js を含むページ（およびその逆方向）へのリダイレクトはサポートされていません。 |
| オンデバイス判定 | サポートあり | 現在サポートされていません |
| Mbox をプリフェッチ | カスタムスコープおよびSPA VEC でサポート | プリフェッチは、Web SDK のデフォルトのモードです |
| カスタムイベント | サポートあり | サポート対象外 現在のステータスについては、[ パブリックロードマップ ](https://github.com/orgs/adobe/projects/18/views/1?pane=item&amp;itemId=17372355{target="_blank"}) を参照してください。 |
| レスポンストークン | サポートあり | サポート。 コード例と at.js と Platform Web SDK の違いについては、[ 専用の応答トークンドキュメント ](https://experienceleague.adobe.com/docs/target/using/administer/response-tokens.html?lang=ja) を参照してください |
| データプロバイダー | サポートあり | サポート対象外 カスタムコードを使用すると、別のプロバイダーからデータを取得した後に、Platform Web SDK `sendEvent` コマンドをトリガーできます。 |


## 注目のコールアウト

| | Target at.js 2.x | Platform Web SDK |
|---|---|---|
| ちらつき軽減 | 非同期実装の事前非表示スニペットでは、`at-body-style` のスタイル ID を使用します。 at.js は、応答を受信したらスタイルを削除するためにこの要素 ID を探します。 | デフォルトの事前非表示スニペットでは、`alloy-prehiding` のスタイル ID を使用します。 Web SDK は at.js 事前非表示スニペットと互換性がないので、移行プロセスの一環として変更する必要があります。 |
| ページ読み込み時にコンテンツを自動的にレンダリング | Target グローバル設定で制御します。 `pageLoadEnabled` が `true` に設定されている場合に有効になります。 | Platform Web SDK `sendEvent` コマンドで指定されます。 有効にするには、`renderDecisions` オプションを `true` に設定します。 |
| コンテンツの手動レンダリング | `applyOffer()` 関数と `applyOffers()` 関数は、設定HTMLのみをサポートしています | `applyPropositions` コマンドでは、HTMLの設定、置換、追加をサポートしているので、柔軟性が向上しています |
| カスタムイベントの追跡 | `trackEvent()` 関数と `sendNotifications()` 関数でサポートされます。 これらの関数は、Target に固有で、Adobe Analyticsの指標には影響しません。 | Platform Web SDK `sendEvent` 呼び出しからのすべてのデータは、Target に転送されます。 Adobe Analytics指標が影響を受けないように、Target に特別に必要な追加データを、eventType を `decisioning.propositionDisplay` または `decisioning.propositionInteract` に指定して `sendEvent` コマンドに含める必要があります。 |
| ターゲット CNAME | サポート。 これは、Analytics で使用される CNAME やExperience CloudID サービスとは別のものです。 | 関係がなくなりました。 1 つの CNAME をすべての Platform Web SDK 呼び出しに使用できます。 |
| デバッグ | `mboxDisable`、`mboxDebug`、`mboxTrace` の URL パラメーターは、ブラウザーの開発者ツールでのデバッグに使用できます。<br><br>Adobe Experience Platform Debuggerはサポートされているデバッグツールでもあります。 | `mboxDisable`、`mboxDebug`、`mboxTrace` の URL パラメーターはサポートされていません。<br><br>Web SDK のデバッグを有効にするには、クエリ文字列に `alloy_debug=true` を追加するか、開発者コンソールで `alloy("setDebug", { "enabled": true });` を実行します。<br><br>Adobe Experience Platform Debuggerブラウザー拡張機能を使用して、デバッグ用のエッジトレースを開始できます。<br><br> 詳しくは、[Platform Web SDK のデバッグ ](debugging.md) ドキュメントを参照してください。 |
| Analytics for Target（A4T） | SDID 値を使用して、Target と Analytics の呼び出しをステッチします | ステッチを必要とせずにネイティブにサポートされる |

>[!NOTE]
>
>特定のページに既存の Platform Web SDK 実装を保持したままAppMeasurementをAdobe Analyticsに移行することは、サポートされていません。
>
> at.js （および platform.js）実装を 1 ページずつAppMeasurement Web SDK に移行することが可能です。 この方法を使用する場合は、`configure` のコマンドで、[`idMigrationEnabled`](https://experienceleague.adobe.com/docs/experience-platform/edge/fundamentals/configuring-the-sdk.html?lang=ja#id-migration-enabled) および [`targetMigrationEnabled`](https://experienceleague.adobe.com/docs/experience-platform/edge/fundamentals/configuring-the-sdk.html?lang=ja#targetMigrationEnabled) オプションを `true` に設定することをお勧めします。

## at.js 関数と Platform Web SDK の同等機能

多くの at.js 関数は、次の表に示す Platform Web SDK を使用した同等のアプローチを備えています。 [at.js 関数 ](https://developer.adobe.com/target/implement/client-side/atjs/atjs-functions/atjs-functions/) について詳しくは、Adobe Target開発者ガイドを参照してください。

| at.js 2.x 関数 | Platform Web SDK の同等機能 |
| --- | --- | 
| `getOffer()` および `getOffers()` | Target VEC ベースのエクスペリエンスをリクエストし [ 自動的にレンダリング ](https://experienceleague.adobe.com/docs/experience-platform/edge/personalization/rendering-personalization-content.html?lang=ja#automatically-rendering-content) するには、`sendEvent` コマンドを使用して、`renderDecisions` オプションを true に設定します。<br><br> フォームベースのエクスペリエンスをリクエストしたり、コンテンツを [ 手動でレンダリング ](https://experienceleague.adobe.com/docs/experience-platform/edge/personalization/rendering-personalization-content.html?lang=ja#manually-rendering-content) したりするには、`sendEvent` コマンドで `decisionScopes` （mbox）の配列を指定します。 |
| `applyOffer()` および `applyOffers()` | [`applyPropositions`](https://experienceleague.adobe.com/docs/experience-platform/edge/personalization/rendering-personalization-content.html?lang=ja#applypropositions) コマンドを使用してコンテンツを適用します。 特定のセレクターに対して、HTMLの設定、置換、追加を行うことができます。 |
| `triggerView()` | `sendEvent` コマンドの `xdm` オプションで `web.webPageDetails.viewName` プロパティがトリガーされている場合、Platform Web SDK はSPA VEC 用に [ ビューの変更 ](https://experienceleague.adobe.com/docs/experience-platform/edge/personalization/adobe-target/web-sdk-atjs-comparison.html?lang=ja#how-to-trigger-a-view-change-in-a-single-page-application) を自動的に設定します。 |
| `trackEvent()` および `sendNotifications()` | `sendEvent` コマンドを [ 特定の `eventType`](https://experienceleague.adobe.com/docs/experience-platform/edge/personalization/adobe-target/web-sdk-atjs-comparison.html?lang=ja#how-to-track-events) set:<br><br>`decisioning.propositionDisplay` と共に使用すると、アクティビティのレンダリングを示し <br><br>`decisioning.propositionInteract` マウスクリックなどのアクティビティに対するユーザー操作を示します。 |
| `targetGlobalSettings()` | 直接同等の手段はありません。 詳しくは、[ ターゲット設定の比較 ](detailed-comparison.md) を参照してください。 |
| `targetPageParams()` および `targetPageParamsAll()` | `sendEvent` コマンドの `xdm` オプションで渡されたすべてのデータは、Target mbox パラメーターにマッピングされます。 mbox パラメーターにはシリアル化されたドット表記を使用して名前を付けるので、Platform Web SDK に移行する場合は、新しい mbox パラメーター名を使用するように既存のオーディエンスとアクティビティを更新する必要が生じる場合があります。 <br><br>`sendEvent` コマンドの `data.__adobe.target` の一部として渡されたデータは、[Target プロファイルおよびRecommendations固有のパラメーター ](https://experienceleague.adobe.com/docs/experience-platform/edge/personalization/adobe-target/target-overview.html?lang=ja#single-profile-update) にマッピングされます。 |
| at.js カスタムイベント | サポート対象外 現在のステータスについては、[ パブリックロードマップ ](https://github.com/orgs/adobe/projects/18/views/1?pane=item&amp;itemId=17372355{target="_blank"}) を参照してください。 [ レスポンストークン ](https://experienceleague.adobe.com/docs/experience-platform/edge/personalization/adobe-target/accessing-response-tokens.html?lang=ja) は、`sendEvent` 呼び出しの応答で `propositions` の一部として公開されます。 |

## at.js の設定および Platform Web SDK の同等の機能

at.js ライブラリは、Target UI の様々な設定を使用して設定およびダウンロードできます。 これらの設定は、[`targetGlobalSettings()`](https://developer.adobe.com/target/implement/client-side/atjs/atjs-functions/targetglobalsettings/) 関数で更新することもできます。 以下の表は、これらの設定と Platform Web SDK で使用できる設定を比較しています。

| at.js の設定 | Platform Web SDK の同等機能 |
| --- | --- |
| `bodyHiddenStyle` | `configure` コマンドで [`prehidingStyle`](https://experienceleague.adobe.com/docs/experience-platform/edge/fundamentals/configuring-the-sdk.html?lang=ja#prehidingStyle) を設定します |
| `bodyHidingEnabled` | `configure` コマンドで `prehidingStyle` が定義されている場合、この機能は有効になります。 スタイルが定義されていない場合、Platform Web SDK はコンテンツの非表示を試みません。 |
| `clientCode` | 自動的に構成 |
| `cookieDomain` | 該当なし |
| `crossDomain` | `thirdPartyCookiesEnabled` オプションを `true` に設定し、`configure` コマンドを使用して、クロスドメインの使用例に対してファーストパーティおよびサードパーティ Cookie を有効にします |
| `cspScriptNonce` および `cspStyleNonce` | [CSP の設定 ](https://experienceleague.adobe.com/docs/experience-platform/edge/fundamentals/configuring-a-csp.html?lang=ja) については、ドキュメントを参照してください。 |
| `dataProviders` | サポートなし |
| `decisioningMethod` | すべての Platform Web SDK `sendEvent` コマンドは、サーバーサイド判定を使用します。 ハイブリッド判定とオンデバイス判定はサポートされていません。 |
| `defaultContentHiddenStyle` および `defaultContentVisibleStyle` | at.js 1.x でのみ使用可能です。at.js 2.x と同様に、フォームベースのエクスペリエンスのフリッカーの軽減は、カスタムコードを使用して実現できます。 |
| `deviceIdLifetime` | サポート対象外 `targetMigrationEnabled` が `configure` コマンドで `true` に設定されている場合、`mbox` Cookie はデバイスの有効期間が 2 年に設定されます。 この値は変更できません。 |
| `enabled` | データストリーム設定で Target 機能を有効または無効にする |
| `globalMboxAutoCreate` | `renderDecisions` オプションを `sendEvent` コマンドで `true` に設定して、VEC ベースのエクスペリエンスを自動的に取得し、レンダリングします。<br><br>VEC ベースのエクスペリエンスを手動でレンダリングする場合は、`__view__` の `decisionScope` をリクエストします。 |
| `imsOrgId` | `configure` コマンドで `orgId` を設定します |
| `optinEnabled` および `optoutEnabled` | Platform Web SDK [ プライバシーオプション ](https://experienceleague.adobe.com/docs/experience-platform/edge/consent/supporting-consent.html?lang=ja) を参照してください。 `defaultConsent` オプションは、Platform Web SDK がサポートするすべてのAdobeソリューションに適用されます。 |
| `overrideMboxEdgeServer` および `overrideMboxEdgeServerTimeout` | 適用できません。 すべての Platform Web SDK リクエストは、Adobe Experience Platform Edge ネットワークを使用します。 |
| `pageLoadEnabled` | `sendEvent` コマンドを使用して、`renderDecisions` オプションを `true` に設定します |
| `secureOnly` | サポート対象外 Platform Web SDK は、`secure` 属性と `sameSite="none"` 属性を持つすべての cookie を設定します。 |
| `selectorsPollingTimeout` | サポート対象外 Platform Web SDK は 5 秒の値を使用します。 必要に応じて、カスタムコードを使用してコンテンツを手動でレンダリングできます。 |
| `serverDomain` | `configure` コマンドで `edgeDomain` 設定を使用します |
| `telemetryEnabled` | 該当なし |
| `timeout` | サポート対象外 ちらつき軽減コードに適切なタイムアウトが含まれていることを確認することをお勧めします。 |
| `viewsEnabled` | サポート対象外 Target ビューのコンテンツは、`renderDecisions` が `true` に設定されている場合、または `__view__` decisionScope がリクエストに含まれている場合、常に最初の `sendEvent()` 呼び出し時に取得されます。 |
| `visitorApiTimeout` | 該当なし |


## システム図の比較

次の図は、at.js を使用した Target 実装と、Platform Web SDK を使用した実装のデータフローの違いを理解するのに役立ちます。

### at.js 2.x のシステム図

![ ページ読み込み時の at.js 2.0 の動作 ](assets/target-at-js-2x-diagram.png){zoomable="yes"}

| 通話 | 詳細 |
| --- | --- |
| 1 | 呼び出しによってExperience CloudID （ECID）が返されます。 ユーザーが認証されると、別の呼び出しでその顧客 ID が同期されます。 |
| 2 | at.js ライブラリは同期して読み込まれ、ドキュメントの本文を非表示にします（ページに実装されたオプションの事前非表示スニペットを使用して、at.js を非同期で読み込むこともできます）。 |
| 3 | すべての設定済みパラメーター、ECID、SDID および顧客 ID を含むページ読み込みリクエストが行われます。 |
| 4 | プロファイルスクリプトは、を実行してプロファイルストアに入力します。 ストアは、対象オーディエンスをオーディエンスライブラリからリクエストします（例えば、Analytics やAudience Managerなどから共有されたオーディエンス）。 顧客属性は、バッチプロセスでプロファイルストアに送信されます。 |
| 5 | URL、リクエストパラメーター、プロファイルデータに基づいて、Target は、現在のページと今後の表示で訪問者に返すアクティビティとエクスペリエンスを決定します。 |
| 6 | ターゲットコンテンツがページに送り返されます（オプションで、パーソナライゼーションを追加するためのプロファイル値も含む）。<br><br> 現在のページ上のターゲットコンテンツは、デフォルトコンテンツのちらつきなしでできるだけ早く表示されます。<br><br> 単一ページアプリケーションの将来のビューのターゲットコンテンツは、ブラウザーにキャッシュされるので、ビューがトリガーされたときに追加のサーバー呼び出しをおこなわずに即座にターゲットコンテンツを適用できます。 |
| 7 | ページからデータ収集サーバーに送信された Analytics データ。 |
| 8 | ターゲットデータは、SDID を介して Analytics データと照合され、Analytics レポートストレージ内で処理されます。 A4T レポートを使用して、Analytics データが Analytics と Target の両方に表示できるようになります。 |

詳しくは、開発者ガイドを参照してください [ 単一ページアプリケーション用に at.js を使用して Target を実装する ](https://developer.adobe.com/target/implement/client-side/atjs/how-to-deployatjs/target-atjs-single-page-application/)。

### Platform Web SDK のシステム図

![Platform Web SDK を使用したAdobe Target edge Decisioning の図 ](assets/target-platform-web-sdk.png)

| 通話 | 詳細 |
| --- | --- |
| 1 | デバイスが Platform Web SDK を読み込みます。 Platform Web SDK は、XDM データ、データストリーム環境 ID、渡されたパラメーター、顧客 ID （オプション）を使用して、Edge ネットワークにリクエストを送信します。 ページ（またはコンテナ）は事前非表示になっています。 |
| 2 | Edge network は、訪問者 ID、同意、その他の訪問者コンテキスト情報（位置情報やデバイスにわかりやすい名前など）を使用して、リクエストを強化するために edge サービスにリクエストを送信します。 |
| 3 | エッジネットワークは、訪問者 ID と渡されたパラメーターを使用して、エンリッチメントされたパーソナライゼーションリクエストを Target エッジに送信します。 |
| 4 | プロファイルスクリプトは、を実行して、Target プロファイルストレージにフィードします。 プロファイルストレージは、オーディエンスライブラリからセグメントを取得します（例えば、Adobe Analytics、Adobe Audience Manager、Adobe Experience Platformで共有されているセグメント）。 |
| 5 | Target は、URL リクエストパラメーターとプロファイルデータに基づいて、現在のページビューと将来の事前読み込みビューで、訪問者に表示するアクティビティとエクスペリエンスを決定します。 次に、Target はこれをエッジネットワークに送り返します。 |
| 6 | 回答：Edge Network は、パーソナライゼーション応答をページに送り返します（オプションで、追加のパーソナライゼーションのプロファイル値も含みます）。 現在のページ上のパーソナライズされたコンテンツは、デフォルトコンテンツのちらつきなしでできるだけ早く表示されます。<br><br>b.シングルページアプリケーション（SPA）でユーザーアクションの結果として表示されるビューのパーソナライズされたコンテンツは、追加のサーバーコールなしでインスタントレンダリング用にキャッシュされます。<br><br>c.Edge Network は、訪問者 ID と cookie のその他の値（同意、セッション ID、ID、Cookie チェック、パーソナライゼーションなど）を送信します。 |
| 7 | エッジネットワークは、Analytics for Target （A4T）の詳細（アクティビティ、エクスペリエンスおよびコンバージョンメタデータ）を Analytics エッジに転送します。 |

詳しくは、開発者ガイドを参照してください [ 単一ページアプリケーション用 Platform Web SDK を使用した Target の実装 ](https://experienceleague.adobe.com/docs/experience-platform/edge/personalization/adobe-target/spa-implementation.html?lang=ja)。

現在の Target 実装と使用する機能について技術的に理解したら、次の手順は [ 初期設定 ](initial-setup.md) を実行します。

>[!NOTE]
>
>アドビは、at.js から Web SDK への Target の移行を成功させるために取り組んでいます。 移行の際に問題が発生した場合、またはこのガイドに重要な情報が欠落していると感じる場合は、[ このコミュニティのディスカッション ](https://experienceleaguecommunities.adobe.com/t5/adobe-experience-platform-data/tutorial-discussion-migrate-target-from-at-js-to-web-sdk/m-p/575587?profile.language=ja#M463) に投稿してお知らせください。
