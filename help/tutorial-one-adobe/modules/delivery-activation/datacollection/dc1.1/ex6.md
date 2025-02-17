---
title: 基盤 – Adobe Experience Platform Data Collection と Web SDK拡張機能の設定 – Adobe Targetの実装
description: 基盤 – Adobe Experience Platform Data Collection と Web SDK拡張機能の設定 – Adobe Targetの実装
kt: 5342
doc-type: tutorial
exl-id: 31cdde2f-011d-442d-8e47-15a318a6c89d
source-git-commit: 3d61d91111d8693ab031fbd7b26706c02818108c
workflow-type: tm+mt
source-wordcount: '181'
ht-degree: 2%

---

# 1.1.6 Adobe Targetの実装

## Adobe Targetを使用するようにデータストリームを更新する

Web SDKで収集したデータをAdobe Targetに送信し、すべてのお客様にパーソナライズされたエクスペリエンスを提供してAdobe Targetから応答を受け取りたい場合は、次の手順に従います。

[https://experience.adobe.com/launch/](https://experience.adobe.com/launch/) に移動し、**データストリーム** に移動します。

画面の右上隅にあるサンドボックス名を選択します（`--aepSandboxName--` にする必要があります）。 特定のデータストリーム（`--aepUserLdap-- - Demo System Datastream` という名前）を開きます。

![ 左側のナビゲーションで「Edge設定」アイコンをクリック ](./images/edgeconfig1b.png)

その後、これが表示されます。 Adobe Targetを有効にするには、「**サービスを追加**」をクリックします。

![AEP デバッガー ](./images/aa2.png)

その後、これが表示されます。 サービス **Adobe Target** を選択します。オプションで、追加情報を指定できます。 「**保存**」をクリックします。

![AEP デバッガー ](./images/at1.png)

## 次の手順

Adobe Experience Platformの [1.1.7 XDM スキーマの要件 ](./ex7.md){target="_blank"} 参照してください。

[Adobe Experience Platform データ収集の設定と web SDK タグ拡張機能 ](./data-ingestion-launch-web-sdk.md){target="_blank"} に戻ります

[ すべてのモジュール ](./../../../../overview.md){target="_blank"} に戻る
