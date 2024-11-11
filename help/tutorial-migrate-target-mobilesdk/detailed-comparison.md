---
title: Target 拡張機能と Decisioning 拡張機能の比較
description: 機能、機能、設定、データフローなど、Target 拡張機能と Decisioning 拡張機能の違いについて説明します。
exl-id: 6c854049-4126-45cf-8b2b-683cf29549f3
source-git-commit: 05b0146256c6f8644e42f851498a0f49ff44bf68
workflow-type: tm+mt
source-wordcount: '829'
ht-degree: 4%

---

# Target 拡張機能と Decisioning 拡張機能の比較

Adobe Journey Optimizer - Decisioning 拡張機能は、モバイルアプリ用のAdobe Target拡張機能とは異なります。 次の表は、移行プロセスの間に注意が必要になる実装領域を評価する際に役立つリファレンスです。

以下の情報を確認し、現在の Target 拡張機能の実装状況を評価すると、次のことを理解できます。

- Adobe Journey Optimizerでサポートされている Target 機能 – Decisioning
- Adobe Journey Optimizerを持つAdobe Target拡張機能はどれか – 決定の同等の機能
- Adobe Journey Optimizerでの Target 設定の適用方法 – Decisioning
- Adobe Target拡張機能とAdobe Journey Optimizer - Decisioning 拡張機能のデータフローの違い

Platform Web SDK を初めて使用する場合は、心配はいりません。以下の項目については、このチュートリアル全体でより詳しく説明します。

## 機能の比較

| 機能 | ターゲット拡張機能 | Decisioning 拡張機能（Edgeを介した Target） |
|---|---|---|
| プリフェッチ モード | サポートあり | サポートあり |
| 実行モード | サポートあり | サポートなし |
| カスタムパラメーター | サポートあり | サポート* |
| プロファイルパラメーター | サポートあり | サポート* |
| エンティティパラメーター | サポートあり | サポート* |
| ターゲットオーディエンス | サポートあり | サポートあり |
| Real-Time CDP オーディエンス | ??? | サポートあり |
| Real-Time CDP属性 | ??? | サポートあり |
| ライフサイクル指標 | サポートあり | データ収集ルールを使用したサポート |
| thirdPartyId （mbox3rdPartyId） | サポートあり | データストリームの ID マップおよび名前空間設定を介してサポートされます |
| 通知（表示、クリック） | サポートあり | サポートあり |
| レスポンストークン | サポートあり | サポートあり |
| Analytics for Target（A4T） | クライアント側のみ | クライアントサイドとサーバーサイド |
| モバイルプレビュー（QA モード） | サポートあり | Assuranceでの限定的なサポート |

>[!IMPORTANT]
>
> \* リクエストで送信されるパラメーターは、リクエスト内のすべてのスコープに適用されます。 異なるスコープに異なるパラメーターを設定する必要がある場合は、追加のリクエストを行う必要があります。



## 注目のコールアウト

>[!NOTE]
>
>特定のページに既存の Platform Web SDK 実装を保持したままAppMeasurementをAdobe Analyticsに移行することは、サポートされていません。
>
> at.js （および platform.js）実装を 1 ページずつAppMeasurement Web SDK に移行することが可能です。 この方法を使用する場合は、`configure` のコマンドで、[`idMigrationEnabled`](https://experienceleague.adobe.com/docs/experience-platform/edge/fundamentals/configuring-the-sdk.html#id-migration-enabled) および [`targetMigrationEnabled`](https://experienceleague.adobe.com/docs/experience-platform/edge/fundamentals/configuring-the-sdk.html#targetMigrationEnabled) オプションを `true` に設定することをお勧めします。

## Target 拡張機能と意思決定拡張機能の同等の機能

多くの Target 拡張機能は、以下の表に示す意思決定拡張機能を使用して、同等のアプローチを持っています。 [functions](https://developer.adobe.com/target/implement/client-side/atjs/atjs-functions/atjs-functions/) について詳しくは、『Adobe Target開発者ガイド』を参照してください。

| ターゲット拡張機能 | Decisioning 拡張機能 | メモ |
| --- | --- | --- | 
| `prefetchContent` | `updatePropositions` |  |
| `retrieveLocationContent` | `getPropositions` | API を使用 `getPropositions` る場合、SDK のキャッシュされていないスコープを取得するためのリモート呼び出しは行われません。 |
| `displayedLocations` | オファー – > `displayed()` | さらに、オ `generateDisplayInteractionXdm` ァー方法を使用して、項目表示用の XDM を生成できます。 その後、Edge Network SDK の sendEvent API を使用して、追加の XDM、自由形式データを添付し、エクスペリエンスイベントをリモートに送信できます。 |
| `clickedLocation` | オファー – > `tapped()` | さらに、オ `generateTapInteractionXdm` ァー方法を使用して、項目タップ用の XDM を生成できます。 その後、Edge Network SDK の sendEvent API を使用して、追加の XDM、自由形式データを添付し、エクスペリエンスイベントをリモートに送信できます。 |
| `clearPrefetchCache` | `clearCachedPropositions` |  |
| `resetExperience` |  | SDK`removeIdentity`Edge Network拡張機能の ID の API を使用して、訪問者 ID をEdge ネットワークに送信するのを停止します。 詳しくは、[removeIdentity API ドキュメント ](https://developer.adobe.com/client-sdks/edge/identity-for-edge-network/api-reference/#removeidentity) を参照してください。 <br><br> メモ：Mobile Core の `resetIdentities` API は、Experience CloudID （ECID）を含む、SDK に保存されているすべての ID をクリアするので、慎重に使用する必要があります。 |
| `getSessionId` |  | 応答ハンドル `state:store`、セッション関連の情報を保持します。 Edge network extension は、期限切れでないステートストア項目を後続のリクエストに添付することで、この機能を管理するのに役立ちます。 |
| `setSessionId` |  | 応答ハンドル `state:store`、セッション関連の情報を保持します。 Edge network extension は、期限切れでないステートストア項目を後続のリクエストに添付することで、この機能を管理するのに役立ちます。 |
| `getThirdPartyId` | 該当なし | Edge Network拡張機能の ID から updateIdentities API を使用して、サードパーティ ID の値を指定します。 次に、データストリームでサードパーティ ID 名前空間を設定します。 詳しくは、[Target サードパーティ ID モバイルのドキュメント ](https://developer.adobe.com/client-sdks/edge/adobe-journey-optimizer-decisioning/#target-third-party-id) を参照してください。 |
| `setThirdPartyId` | 該当なし | Edge Network拡張機能の ID から updateIdentities API を使用して、サードパーティ ID の値を指定します。 次に、データストリームでサードパーティ ID 名前空間を設定します。 詳しくは、[Target サードパーティ ID モバイルのドキュメント ](https://developer.adobe.com/client-sdks/edge/adobe-journey-optimizer-decisioning/#target-third-party-id) を参照してください。 |
| `getTntId` |  | 応答ハンドル `locationHint:result`、Target の場所のヒント情報を保持します。 Target Edge が Experience Edgeと共存することを前提としています。<br> <br>Edge ネットワーク拡張機能は、EdgeNetwork の場所のヒントを使用して、要求の送信先となるEdge ネットワーク クラスターを判断します。 SDK （ハイブリッドアプリ）全体でEdgeのネットワーク場所のヒントを共有するには、Edge Network拡張機能の `getLocationHint` および `setLocationHint` API を使用します。 詳しくは、[`getLocationHint` API ドキュメント ](https://developer.adobe.com/client-sdks/edge/edge-network/api-reference/#getlocationhint) を参照してください。 |
| `setTntId` |  |  |
|  |  |  |
|  |  |  |
|  |  |  |
|  |  |  |

## Target 拡張機能の設定と Decisioning 拡張機能の同等の機能

Target 拡張機能は、で様々な設定を指定してダウンロードできます。

| ターゲット拡張機能 | Decisioning 拡張機能 |
| --- | --- | 
| |  |


## システム図の比較

次の図は、Adobe Journey Optimizer - Decisioning 拡張機能を使用した Target 実装とAdobe Target拡張機能を使用した実装の間のデータフローの違いを理解するのに役立ちます。

### ターゲット拡張機能のシステム図



### 意思決定拡張機能のシステム図




>[!NOTE]
>
>アドビは、Target 拡張機能から Decisioning 拡張機能への Mobile Target の移行を成功させるために取り組んでいます。 移行の際に問題が発生した場合、またはこのガイドに重要な情報が欠落していると感じる場合は、[ このコミュニティのディスカッション ](https://experienceleaguecommunities.adobe.com/t5/adobe-experience-platform-data/tutorial-discussion-migrate-target-from-at-js-to-web-sdk/m-p/575587#M463) に投稿してお知らせください。
