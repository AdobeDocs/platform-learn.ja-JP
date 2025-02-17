---
title: 基盤 – Adobe Experience Platform Data Collection と Web SDK Extension の設定 – Adobe Experience Platformでの XDM スキーマ要件
description: 基盤 – Adobe Experience Platform Data Collection と Web SDK Extension の設定 – Adobe Experience Platformでの XDM スキーマ要件
kt: 5342
doc-type: tutorial
exl-id: 124c9c54-27f1-4784-9a5c-2c9d8ba620d5
source-git-commit: 3d61d91111d8693ab031fbd7b26706c02818108c
workflow-type: tm+mt
source-wordcount: '258'
ht-degree: 0%

---

# 1.1.7 Adobe Experience Platformにおける XDM スキーマの要件

Web SDKでAdobe Experience Platformにデータを確実に取り込めるようにするには、特定の XDM mixin がAdobe Experience Platformの XDM スキーマに含まれる必要があります。

[https://experience.adobe.com/platform](https://experience.adobe.com/platform) に移動し、ログインします。

![AEP デバッガー ](./images/exp1.png)

ログイン後、画面上部の青い線のテキスト **Production Prod** をクリックして、適切なサンドボックスを選択します。 サンドボックス `--aepSandboxName--` を選択します。

サンドボックスを選択すると、画面が変更され、サンドボックスに移動します。

![AEP デバッガー ](./images/exp2.png)

左側のメニューで **スキーマ** に移動し、**デモシステム - Web サイトのイベントスキーマ（グローバル v1.1）** スキーマを開きます。

![AEP デバッガー ](./images/exp3.png)

このスキーマで、フィールドグループ **AEP Web SDK ExperienceEvent** が追加されていることがわかります。 このフィールドグループは、最低限必要なフィールドをすべてスキーマに追加します。 Web SDKで使用されるAdobe Experience Platformのすべてのエクスペリエンスイベントスキーマは、常にそのフィールドグループがスキーマの一部である必要があります。

![AEP デバッガー ](./images/exp4.png)

[ モジュール 1.2 データ取り込みでは ](./../dc1.2/data-ingestion.md) スキーマにフィールドグループを追加する方法を説明します。

次の手順：

## 次の手順

[ 概要とメリット ](./summary.md){target="_blank"} に移動します。

[Adobe Experience Platform データ収集の設定と web SDK タグ拡張機能 ](./data-ingestion-launch-web-sdk.md){target="_blank"} に戻ります

[ すべてのモジュール ](./../../../../overview.md){target="_blank"} に戻る
