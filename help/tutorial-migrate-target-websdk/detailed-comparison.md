---
title: at.js 2.x と Web SDK の比較 | Target を at.js 2.x から Web SDK に移行
description: at.js 2.x と Platform Web SDK の違い（機能、関数、設定、データフローなど）について説明します。
exl-id: b6f0ac2b-0d8e-46ce-8e9f-7bbc61eb20ec
source-git-commit: 299b9586fb5c8e9c9ef3427e08035806af1d9a6b
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
| カスタムイベント | サポートあり | サポート対象外 を参照してください。 [公開ロードマップ](https://github.com/orgs/adobe/projects/18/views/1?pane=item&amp;itemId=17372355{target="_blank"}) （現在のステータス）。 |
| レスポンストークン | サポートあり | サポート。 を参照してください。 [専用レスポンストークンのドキュメント](https://experienceleague.adobe.com/docs/target/using/administer/response-tokens.html) コード例と at.js と Platform Web SDK の違い |
| データプロバイダー | サポートあり | サポート対象外 カスタムコードを使用して、Platform Web SDK をトリガーできます `sendEvent` 別のプロバイダーからデータを取得した後のコマンド。 |


## 注目のコールアウト

| | Target at.js 2.x | Platform Web SDK |
|---|---|---|
| ちらつき軽減 | 非同期実装の事前非表示スニペットでは、のスタイル ID を使用します。 `at-body-style`. at.js は、応答を受信したらスタイルを削除するためにこの要素 ID を探します。 | デフォルトの事前非表示スニペットでは、のスタイル ID を使用します。 `alloy-prehiding`. Web SDK は at.js 事前非表示スニペットと互換性がないので、移行プロセスの一環として変更する必要があります。 |
| ページ読み込み時にコンテンツを自動的にレンダリング | Target グローバル設定で制御します。 有効な条件 `pageLoadEnabled` はに設定されています。 `true`. | Platform Web SDK で指定 `sendEvent` コマンド。 有効にするには、 `renderDecisions` 対するオプション `true`. |
| コンテンツの手動レンダリング | この `applyOffer()` および `applyOffers()` 関数は、HTMLの設定のみをサポートします | この `applyPropositions` コマンドは、HTMLの設定、置換、追加をサポートし、柔軟性を高めます |
| カスタムイベントの追跡 | サポート対象 `trackEvent()` および `sendNotifications()` 関数。 これらの関数は、Target に固有で、Adobe Analyticsの指標には影響しません。 | Platform Web SDK からのすべてのデータ `sendEvent` 呼び出しは Target に転送されます。 Target に特別に必要な追加データは、 `sendEvent` eventType がのコマンド `decisioning.propositionDisplay` または `decisioning.propositionInteract` を使用して、Adobe Analytics指標が影響を受けないようにします。 |
| ターゲット CNAME | サポート。 これは、Analytics で使用される CNAME やExperience CloudID サービスとは別のものです。 | 関係がなくなりました。 1 つの CNAME をすべての Platform Web SDK 呼び出しに使用できます。 |
| デバッグ | この `mboxDisable`, `mboxDebug`、および `mboxTrace` URL パラメーターは、ブラウザーの開発者ツールでデバッグに使用できます。<br><br>Adobe Experience Platform Debuggerは、サポートされているデバッグツールでもあります。 | この `mboxDisable`, `mboxDebug`、および `mboxTrace` URL パラメーターはサポートされていません。<br><br>Web SDK のデバッグを有効にするには、次を追加します。 `alloy_debug=true` クエリ文字列またはを実行する `alloy("setDebug", { "enabled": true });` 開発者コンソールで、次の操作を行います。<br><br>Adobe Experience Platform Debuggerブラウザー拡張機能を使用して、デバッグ用のエッジトレースを開始できます。<br><br>を参照してください。 [platform Web SDK のデバッグ](debugging.md) 詳しくは、ドキュメントを参照してください。 |
| Analytics for Target（A4T） | SDID 値を使用して、Target と Analytics の呼び出しをステッチします | ステッチを必要とせずにネイティブにサポートされる |

>[!NOTE]
>
>特定のページに既存の Platform Web SDK 実装を保持したままAppMeasurementをAdobe Analyticsに移行することは、サポートされていません。
>
> at.js （および platform.js）実装を 1 ページずつAppMeasurement Web SDK に移行することが可能です。 この方法を使用する場合は、 [`idMigrationEnabled`](https://experienceleague.adobe.com/docs/experience-platform/edge/fundamentals/configuring-the-sdk.html#id-migration-enabled) および [`targetMigrationEnabled`](https://experienceleague.adobe.com/docs/experience-platform/edge/fundamentals/configuring-the-sdk.html#targetMigrationEnabled) オプション先 `true` （を使用） `configure` コマンド。

## at.js 関数と Platform Web SDK の同等機能

多くの at.js 関数は、次の表に示す Platform Web SDK を使用した同等のアプローチを備えています。 の詳細 [at.js 関数](https://developer.adobe.com/target/implement/client-side/atjs/atjs-functions/atjs-functions/)詳しくは、Adobe Target開発者ガイドを参照してください。

| at.js 2.x 関数 | Platform Web SDK の同等機能 |
| --- | --- | 
| `getOffer()` および `getOffers()` | とをリクエストするには [自動レンダリング](https://experienceleague.adobe.com/docs/experience-platform/edge/personalization/rendering-personalization-content.html#automatically-rendering-content) Target VEC ベースのエクスペリエンスでは、を使用します。 `sendEvent` コマンドおよび設定 `renderDecisions` オプションを true に設定します。<br><br>フォームベースのエクスペリエンスをリクエストするには、または次の手順を実行します [手動でレンダリング](https://experienceleague.adobe.com/docs/experience-platform/edge/personalization/rendering-personalization-content.html#manually-rendering-content) コンテンツ、の配列を指定 `decisionScopes` （mbox）と `sendEvent` コマンド。 |
| `applyOffer()` および `applyOffers()` | の使用 [`applyPropositions`](https://experienceleague.adobe.com/docs/experience-platform/edge/personalization/rendering-personalization-content.html#applypropositions) コンテンツを適用するコマンド。 特定のセレクターに対して、HTMLの設定、置換、追加を行うことができます。 |
| `triggerView()` | Platform Web SDK は、を自動的にトリガーします [変更を表示](https://experienceleague.adobe.com/docs/experience-platform/edge/personalization/adobe-target/web-sdk-atjs-comparison.html#how-to-trigger-a-view-change-in-a-single-page-application) SPA VEC の目的上、次の場合 `web.webPageDetails.viewName` プロパティは `xdm` オプション `sendEvent` コマンド。 |
| `trackEvent()` および `sendNotifications()` | の使用 `sendEvent` を使用したコマンド [特定 `eventType`](https://experienceleague.adobe.com/docs/experience-platform/edge/personalization/adobe-target/web-sdk-atjs-comparison.html#how-to-track-events) set:<br><br>`decisioning.propositionDisplay` アクティビティのレンダリングを示します<br><br>`decisioning.propositionInteract` マウスクリックなど、アクティビティに対するユーザーのインタラクションを示します。 |
| `targetGlobalSettings()` | 直接同等の手段はありません。 を参照してください。 [ターゲット設定の比較](detailed-comparison.md) （詳細情報）。 |
| `targetPageParams()` および `targetPageParamsAll()` | で渡されるすべてのデータ `xdm` オプション `sendEvent` コマンドは、Target mbox パラメーターにマッピングされます。 mbox パラメーターにはシリアル化されたドット表記を使用して名前を付けるので、Platform Web SDK に移行する場合は、新しい mbox パラメーター名を使用するように既存のオーディエンスとアクティビティを更新する必要が生じる場合があります。 <br><br>の一部として渡されたデータ `data.__adobe.target` の `sendEvent` コマンドのマッピング先 [Target プロファイルとRecommendations固有のパラメーター](https://experienceleague.adobe.com/docs/experience-platform/edge/personalization/adobe-target/target-overview.html#single-profile-update). |
| at.js カスタムイベント | サポート対象外 を参照してください。 [公開ロードマップ](https://github.com/orgs/adobe/projects/18/views/1?pane=item&amp;itemId=17372355{target="_blank"}) （現在のステータス）。 [レスポンストークン](https://experienceleague.adobe.com/docs/experience-platform/edge/personalization/adobe-target/accessing-response-tokens.html?lang=ja) 次の一部として公開されている `propositions` の応答で `sendEvent` を呼び出します。 |

## at.js の設定および Platform Web SDK の同等の機能

at.js ライブラリは、Target UI の様々な設定を使用して設定およびダウンロードできます。 これらの設定は、 [`targetGlobalSettings()`](https://developer.adobe.com/target/implement/client-side/atjs/atjs-functions/targetglobalsettings/) 関数。 以下の表は、これらの設定と Platform Web SDK で使用できる設定を比較しています。

| at.js の設定 | Platform Web SDK の同等機能 |
| --- | --- |
| `bodyHiddenStyle` | を [`prehidingStyle`](https://experienceleague.adobe.com/docs/experience-platform/edge/fundamentals/configuring-the-sdk.html#prehidingStyle) （を使用） `configure` コマンド |
| `bodyHidingEnabled` | If a `prehidingStyle` はで定義されます。 `configure` この機能は有効になります。 スタイルが定義されていない場合、Platform Web SDK はコンテンツの非表示を試みません。 |
| `clientCode` | 自動的に構成 |
| `cookieDomain` | 該当なし |
| `crossDomain` | を `thirdPartyCookiesEnabled` 対するオプション `true` （を使用） `configure` クロスドメインの使用例に対してファーストパーティおよびサードパーティ cookie を有効にするコマンド |
| `cspScriptNonce` および `cspStyleNonce` | のドキュメントを参照してください。 [csp の設定](https://experienceleague.adobe.com/docs/experience-platform/edge/fundamentals/configuring-a-csp.html) |
| `dataProviders` | サポートなし |
| `decisioningMethod` | すべての Platform Web SDK `sendEvent` コマンドは、サーバー側判定を使用します。 ハイブリッド判定とオンデバイス判定はサポートされていません。 |
| `defaultContentHiddenStyle` および `defaultContentVisibleStyle` | at.js 1.x でのみ使用可能です。at.js 2.x と同様に、フォームベースのエクスペリエンスのフリッカーの軽減は、カスタムコードを使用して実現できます。 |
| `deviceIdLifetime` | サポート対象外 次の場合 `targetMigrationEnabled` はに設定されています。 `true` （を使用） `configure` コマンド、 `mbox` cookie は、デバイスの有効期間を 2 年に設定しています。 この値は変更できません。 |
| `enabled` | データストリーム設定で Target 機能を有効または無効にする |
| `globalMboxAutoCreate` | を `renderDecisions` 対するオプション `true` （を使用） `sendEvent` VEC ベースのエクスペリエンスを自動的に取得してレンダリングするコマンド。<br><br>をリクエスト `decisionScope` （用） `__view__` vec ベースのエクスペリエンスを手動でレンダリングする場合は、 |
| `imsOrgId` | を `orgId` （を使用） `configure` コマンド |
| `optinEnabled` および `optoutEnabled` | Platform Web SDK を参照してください [プライバシーオプション](https://experienceleague.adobe.com/docs/experience-platform/edge/consent/supporting-consent.html). この `defaultConsent` オプションは、Platform Web SDK がサポートするすべてのAdobeソリューションに適用されます。 |
| `overrideMboxEdgeServer` および `overrideMboxEdgeServerTimeout` | 適用できません。 すべての Platform Web SDK リクエストは、Adobe Experience Platform Edge ネットワークを使用します。 |
| `pageLoadEnabled` | を `renderDecisions` 対するオプション `true` （を使用） `sendEvent` コマンド |
| `secureOnly` | サポート対象外 Platform Web SDK は、すべての Cookie をで設定します。 `secure` および `sameSite="none"` 属性。 |
| `selectorsPollingTimeout` | サポート対象外 Platform Web SDK は 5 秒の値を使用します。 必要に応じて、カスタムコードを使用してコンテンツを手動でレンダリングできます。 |
| `serverDomain` | の使用 `edgeDomain` での設定 `configure` コマンド |
| `telemetryEnabled` | 該当なし |
| `timeout` | サポート対象外 ちらつき軽減コードに適切なタイムアウトが含まれていることを確認することをお勧めします。 |
| `viewsEnabled` | サポート対象外 Target ビューのコンテンツは、常に最初に取得されます `sendEvent()` 次の場合に電話 `renderDecisions` はに設定されています。 `true` または `__view__` decisionScope がリクエストに含まれています。 |
| `visitorApiTimeout` | 該当なし |


## システム図の比較

次の図は、at.js を使用した Target 実装と、Platform Web SDK を使用した実装のデータフローの違いを理解するのに役立ちます。

### at.js 2.x のシステム図

![ページ読み込み時の at.js 2.0 の動作](assets/target-at-js-2x-diagram.png){zoomable="yes"}

| 通話 | 詳細 |
| --- | --- |
| 1 | 呼び出しによってExperience CloudID （ECID）が返されます。 ユーザーが認証されると、別の呼び出しでその顧客 ID が同期されます。 |
| 2 | at.js ライブラリは同期して読み込まれ、ドキュメントの本文を非表示にします（ページに実装されたオプションの事前非表示スニペットを使用して、at.js を非同期で読み込むこともできます）。 |
| 3 | すべての設定済みパラメーター、ECID、SDID および顧客 ID を含むページ読み込みリクエストが行われます。 |
| 4 | プロファイルスクリプトは、を実行してプロファイルストアに入力します。 ストアは、対象オーディエンスをオーディエンスライブラリからリクエストします（例えば、Analytics やAudience Managerなどから共有されたオーディエンス）。 顧客属性は、バッチプロセスでプロファイルストアに送信されます。 |
| 5 | URL、リクエストパラメーター、プロファイルデータに基づいて、Target は、現在のページと今後の表示で訪問者に返すアクティビティとエクスペリエンスを決定します。 |
| 6 | ターゲットコンテンツがページに送り返されます（オプションで、パーソナライゼーションを追加するためのプロファイル値も含む）。<br><br>現在のページ上のターゲットコンテンツは、デフォルトコンテンツのちらつきなしでできるだけ早く表示されます。<br><br>単一ページアプリケーションの今後のビュー用のターゲットコンテンツは、ブラウザーにキャッシュされます。そのため、ビューがトリガーされたときに追加のサーバー呼び出しをおこなわずに即座にターゲットコンテンツを適用できます。 |
| 7 | ページからデータ収集サーバーに送信された Analytics データ。 |
| 8 | ターゲットデータは、SDID を介して Analytics データと照合され、Analytics レポートストレージ内で処理されます。 A4T レポートを使用して、Analytics データが Analytics と Target の両方に表示できるようになります。 |

方法について詳しくは、開発者ガイドを参照してください。 [単一ページアプリケーション用の at.js を使用した Target の実装](https://developer.adobe.com/target/implement/client-side/atjs/how-to-deployatjs/target-atjs-single-page-application/).

### Platform Web SDK のシステム図

![Platform Web SDK を使用したAdobe Target Edge Decisioning の図](assets/target-platform-web-sdk.png)

| 通話 | 詳細 |
| --- | --- |
| 1 | デバイスが Platform Web SDK を読み込みます。 Platform Web SDK は、XDM データ、データストリーム環境 ID、渡されたパラメーター、顧客 ID （オプション）を使用して、Edge ネットワークにリクエストを送信します。 ページ（またはコンテナ）は事前非表示になっています。 |
| 2 | Edge network は、訪問者 ID、同意、その他の訪問者コンテキスト情報（位置情報やデバイスにわかりやすい名前など）を使用して、リクエストを強化するために edge サービスにリクエストを送信します。 |
| 3 | エッジネットワークは、訪問者 ID と渡されたパラメーターを使用して、エンリッチメントされたパーソナライゼーションリクエストを Target エッジに送信します。 |
| 4 | プロファイルスクリプトは、を実行して、Target プロファイルストレージにフィードします。 プロファイルストレージは、オーディエンスライブラリからセグメントを取得します（例えば、Adobe Analytics、Adobe Audience Manager、Adobe Experience Platformで共有されているセグメント）。 |
| 5 | Target は、URL リクエストパラメーターとプロファイルデータに基づいて、現在のページビューと将来の事前読み込みビューで、訪問者に表示するアクティビティとエクスペリエンスを決定します。 次に、Target はこれをエッジネットワークに送り返します。 |
| 6 | 回答：Edge Network は、パーソナライゼーション応答をページに送り返します（オプションで、追加のパーソナライゼーションのプロファイル値も含みます）。 現在のページ上のパーソナライズされたコンテンツは、デフォルトコンテンツのちらつきなしでできるだけ早く表示されます。<br><br>b. シングルページアプリケーション（SPA）でユーザーアクションの結果として表示されるビューのパーソナライズされたコンテンツは、追加のサーバーコールなしにインスタントレンダリング用にキャッシュされます。<br><br>c. Edge Network が訪問者 ID と Cookie のその他の値（同意、セッション ID、ID、Cookie チェック、パーソナライゼーションなど）を送信する。 |
| 7 | エッジネットワークは、Analytics for Target （A4T）の詳細（アクティビティ、エクスペリエンスおよびコンバージョンメタデータ）を Analytics エッジに転送します。 |

方法について詳しくは、開発者ガイドを参照してください。 [単一ページアプリケーション用の Platform Web SDK を使用した Target の実装](https://experienceleague.adobe.com/docs/experience-platform/edge/personalization/adobe-target/spa-implementation.html).

現在の Target 実装と使用する機能について技術的に理解したら、次の手順として以下を実行します [初期設定](initial-setup.md).

>[!NOTE]
>
>アドビは、at.js から Web SDK への Target の移行を成功させるために取り組んでいます。 移行の際に問題が発生した場合、またはこのガイドに重要な情報が記載されていない可能性がある場合は、に投稿してお知らせください。 [このコミュニティ ディスカッション](https://experienceleaguecommunities.adobe.com/t5/adobe-experience-platform-data/tutorial-discussion-migrate-target-from-at-js-to-web-sdk/m-p/575587#M463).
