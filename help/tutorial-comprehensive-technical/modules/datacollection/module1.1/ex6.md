---
title: 基盤 – Adobe Experience Platform Data Collection と Web SDK拡張機能の設定 – Adobe Targetの実装
description: 基盤 – Adobe Experience Platform Data Collection と Web SDK拡張機能の設定 – Adobe Targetの実装
kt: 5342
doc-type: tutorial
exl-id: 475e9a34-c80e-41e4-9660-61c79f26922d
source-git-commit: 1526661a80b4d551627dfca42a7e97c9498dd1f2
workflow-type: tm+mt
source-wordcount: '168'
ht-degree: 1%

---

# 1.1.6 Adobe Targetの実装

## Adobe Targetを使用するようにデータストリームを更新する

Web SDKで収集したデータをAdobe Targetに送信し、すべてのお客様にパーソナライズされたエクスペリエンスを提供してAdobe Targetから応答を受け取りたい場合は、次の手順に従います。

[https://experience.adobe.com/launch/](https://experience.adobe.com/launch/) に移動し、**データストリーム** に移動します。

画面の右上隅にあるサンドボックス名を選択します（`--aepSandboxName--` にする必要があります）。 特定のデータストリーム（`--aepUserLdap-- - Demo System Datastream` という名前）を開きます。

![&#x200B; 左側のナビゲーションで「Edge設定」アイコンをクリック &#x200B;](./images/edgeconfig1b.png)

その後、これが表示されます。 Adobe Targetを有効にするには、「**サービスを追加**」をクリックします。

![AEP デバッガー &#x200B;](./images/aa2.png)

その後、これが表示されます。 サービス **Adobe Target** を選択します。オプションで、追加情報を指定できます。 「**保存**」をクリックします。

![AEP デバッガー &#x200B;](./images/at1.png)

次の手順：Adobe Experience Platformにおける [1.1.7 XDM スキーマの要件 &#x200B;](./ex7.md)

[モジュール 1.1 に戻る](./data-ingestion-launch-web-sdk.md)

[すべてのモジュールに戻る](./../../../overview.md)
