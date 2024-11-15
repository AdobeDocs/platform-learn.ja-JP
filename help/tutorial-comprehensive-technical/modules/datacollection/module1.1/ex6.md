---
title: 基盤 – Adobe Experience Platform Data Collection と Web SDK 拡張機能の設定 – Adobe Targetの実装
description: 基盤 – Adobe Experience Platform Data Collection と Web SDK 拡張機能の設定 – Adobe Targetの実装
kt: 5342
doc-type: tutorial
exl-id: 475e9a34-c80e-41e4-9660-61c79f26922d
source-git-commit: 0dbcda0cfc9f199a44c845c1b5caf00a8d740251
workflow-type: tm+mt
source-wordcount: '169'
ht-degree: 1%

---

# 1.1.6 Adobe Targetの実装

## 1.1.6.1 Adobe Targetを使用するようにデータストリームを更新する

Web SDK で収集したデータをAdobe Targetに送信し、すべてのお客様にパーソナライズされたエクスペリエンスを提供してAdobe Targetから応答を受け取りたい場合は、次の手順に従います。

[https://experience.adobe.com/launch/](https://experience.adobe.com/launch/) に移動し、**データストリーム** に移動します。

画面の右上隅にあるサンドボックス名を選択します（`--aepSandboxName--` にする必要があります）。 特定のデータストリーム（`--aepUserLdap-- - Demo System Datastream` という名前）を開きます。

![ 左側のナビゲーションで「Edge設定」アイコンをクリック ](./images/edgeconfig1b.png)

その後、これが表示されます。 Adobe Targetを有効にするには、「**+サービスを追加**」をクリックします。

![AEP デバッガー ](./images/aa2.png)

その後、これが表示されます。 サービス **Adobe Target** を選択します。オプションで、追加情報を指定できます。 「**保存**」をクリックします。

![AEP デバッガー ](./images/at1.png)

次の手順：Adobe Experience Platformにおける [1.1.7 XDM スキーマの要件 ](./ex7.md)

[モジュール 1.1 に戻る](./data-ingestion-launch-web-sdk.md)

[すべてのモジュールに戻る](./../../../overview.md)
