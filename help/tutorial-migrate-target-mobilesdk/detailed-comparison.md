---
title: Target 拡張機能と Decisioning 拡張機能の比較
description: 機能、機能、設定、データフローなど、Target 拡張機能と Decisioning 拡張機能の違いについて説明します。
source-git-commit: c907ccb9163ace8272f6881638a41362090bf3e5
workflow-type: tm+mt
source-wordcount: '470'
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
| カスタムパラメーター | サポートあり | mbox ごとのパラメーターはサポートされていません |
| 入口オーディエンス | サポートあり | サポートあり |
| モバイルライフサイクル指標を使用したオーディエンスのセグメント化 | サポートあり | データ収集ルールを使用したサポート |
| thirdPartyId （mbox3rdPartyId） | サポートあり | データストリームの ID マップおよび名前空間設定を介してサポートされます |
| 通知（表示、クリック） | サポートあり | サポートあり |
| レスポンストークン | サポートあり | サポートあり |
| ダイナミックオファー | サポートあり | サポートあり |
| Analytics for Target（A4T） | クライアント側のみ | クライアントサイドとサーバーサイド |
| モバイルプレビュー（QA モード） | サポートあり | 限定的なサポート |



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

次の図は、Adobe Journey Optimizer - Decisioning 拡張機能を使用した Target 実装とAdobe Target拡張機能を使用した実装の間のデータフローの違いを理解するのに役立ちます。

### ターゲット拡張機能のシステム図



### 意思決定拡張機能のシステム図




>[!NOTE]
>
>アドビは、Target 拡張機能から Decisioning 拡張機能への Mobile Target の移行を成功させるために取り組んでいます。 移行の際に問題が発生した場合、またはこのガイドに重要な情報が欠落していると感じる場合は、[ このコミュニティのディスカッション ](https://experienceleaguecommunities.adobe.com/t5/adobe-experience-platform-data/tutorial-discussion-migrate-target-from-at-js-to-web-sdk/m-p/575587#M463) に投稿してお知らせください。
