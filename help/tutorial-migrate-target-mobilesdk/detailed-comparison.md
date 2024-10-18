---
title: Target 拡張機能と Decisioning 拡張機能の比較
description: at.js 2.x と Platform Web SDK の違い（機能、関数、設定、データフローなど）について説明します。
source-git-commit: afbc8248ad81a5d9080a4fdba1167e09bbf3b33d
workflow-type: tm+mt
source-wordcount: '499'
ht-degree: 5%

---

# Target 拡張機能と Decisioning 拡張機能の比較

スタンドアロンのAdobe Target at.js ライブラリは、Platform Web SDK とは大きく異なります。 次の表は、移行プロセスの間に注意が必要になる実装領域を評価する際に役立つリファレンスです。

以下の情報を確認し、現在の at.js の技術的実装を評価すると、次のことを理解できるようになります。

- Platform Web SDK でサポートされている Target 機能
- Platform Web SDK と同等の機能を持つ at.js 関数
- Platform Web SDK での Target 設定の適用方法
- at.js と Platform Web SDK のデータフローの違い

Platform Web SDK を初めて使用する場合は、心配はいりません。以下の項目については、このチュートリアル全体でより詳しく説明します。

## 機能の比較

| | ターゲット拡張機能 | Decisioning 拡張機能（Edgeを介した Target） | AJO コードベースのエクスペリエンス（Messaging SDK） |
|---|---|---|---|
| プリフェッチ モード | サポートあり | サポートあり | サポートあり |
| 実行モード | サポートあり | サポートなし | サポートなし |
| カスタムパラメーター | サポートあり | mbox ごとのパラメーターはサポートされていません | サポートなし |
| 入口オーディエンス | サポートあり | サポートあり | キャンペーンのオーディエンスと実験の除外の設定でサポートされます |
| モバイルライフサイクル指標を使用したオーディエンスのセグメント化 | サポートあり | データ収集ルールを使用したサポート | エクスペリエンスのターゲット設定は、現在サポートされていません |
| thirdPartyId （mbox3rdPartyId） | データストリームの ID マップおよび名前空間設定を介してサポートされます | サポートなし |
| 通知（表示、クリック） | サポートあり | サポートあり | サポートあり |
| レスポンストークン | サポートあり | サポートあり | コンテンツ外で Campaign 固有のメタデータを返す場合に相当するものはありません |
| ダイナミックオファー | サポートあり | サポートあり | コンテンツ内のプロファイルおよび決定項目関連のトークンレンダリングがサポートされています |
| Analytics for Target（A4T） | クライアント側のみ | クライアントサイドとサーバーサイド | サポートなし |
| モバイルプレビュー（QA モード） | サポートあり | 限定的なサポート | 処理中 |



## 注目のコールアウト

>[!NOTE]
>
>特定のページに既存の Platform Web SDK 実装を保持したままAppMeasurementをAdobe Analyticsに移行することは、サポートされていません。
>
> at.js （および platform.js）実装を 1 ページずつAppMeasurement Web SDK に移行することが可能です。 この方法を使用する場合は、`configure` のコマンドで、[`idMigrationEnabled`](https://experienceleague.adobe.com/docs/experience-platform/edge/fundamentals/configuring-the-sdk.html#id-migration-enabled) および [`targetMigrationEnabled`](https://experienceleague.adobe.com/docs/experience-platform/edge/fundamentals/configuring-the-sdk.html#targetMigrationEnabled) オプションを `true` に設定することをお勧めします。

## Target 拡張機能と意思決定拡張機能の同等の機能

多くの Target 拡張機能は、以下の表に示す意思決定拡張機能を使用して、同等のアプローチを持っています。 [functions](https://developer.adobe.com/target/implement/client-side/atjs/atjs-functions/atjs-functions/) について詳しくは、『Adobe Target開発者ガイド』を参照してください。

| ターゲット拡張機能 | Decisioning 拡張機能 |
| --- | --- | 
| |  |

## Target 拡張機能の設定と Decisioning 拡張機能の同等の機能

Target 拡張機能は、で様々な設定を指定してダウンロードできます。

| ターゲット拡張機能 | Decisioning 拡張機能 |
| --- | --- | 
| |  |


## システム図の比較

次の図は、at.js を使用した Target 実装と、Platform Web SDK を使用した実装のデータフローの違いを理解するのに役立ちます。

### ターゲット拡張機能のシステム図



### 決定の拡張システム図




>[!NOTE]
>
>アドビは、Target 拡張機能から Decisioning 拡張機能への Mobile Target の移行を成功させるために取り組んでいます。 移行の際に問題が発生した場合、またはこのガイドに重要な情報が欠落していると感じる場合は、[ このコミュニティのディスカッション ](https://experienceleaguecommunities.adobe.com/t5/adobe-experience-platform-data/tutorial-discussion-migrate-target-from-at-js-to-web-sdk/m-p/575587#M463) に投稿してお知らせください。
