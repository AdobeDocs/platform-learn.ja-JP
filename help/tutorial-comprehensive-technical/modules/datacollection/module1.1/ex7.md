---
title: 基盤 – Adobe Experience Platform Data Collection と Web SDK extension のセットアップ - Adobe Experience Platformでの XDM スキーマ要件
description: 基盤 – Adobe Experience Platform Data Collection と Web SDK extension のセットアップ - Adobe Experience Platformでの XDM スキーマ要件
kt: 5342
doc-type: tutorial
source-git-commit: 6962a0d37d375e751a05ae99b4f433b0283835d0
workflow-type: tm+mt
source-wordcount: '241'
ht-degree: 0%

---

# 1.1.7 Adobe Experience Platformにおける XDM スキーマの要件

Web SDK と alloy.js でデータをAdobe Experience Platformに取り込めるようにするには、特定の XDM Mixin をAdobe Experience Platformの XDM スキーマに含める必要があります。

[https://experience.adobe.com/platform](https://experience.adobe.com/platform) に移動し、ログインします。

![AEP デバッガー ](./images/exp1.png)

ログイン後、画面上部の青い線のテキスト **Production Prod** をクリックして、適切なサンドボックスを選択します。 サンドボックス `--aepSandboxName--` を選択します。

サンドボックスを選択すると、画面が変更され、サンドボックスに移動します。

![AEP デバッガー ](./images/exp2.png)

左側のメニューで **スキーマ** に移動し、**デモシステム - Web サイトのイベントスキーマ（グローバル v1.1）** スキーマを開きます。

![AEP デバッガー ](./images/exp3.png)

そのスキーマに、フィールドグループ **AEP Web SDK ExperienceEvent Mixin** が追加されていることがわかります。 このフィールドグループは、最低限必要なフィールドをすべてスキーマに追加します。 Web SDK で使用されるAdobe Experience Platformのすべてのエクスペリエンスイベントスキーマは、常にそのフィールドグループがスキーマの一部である必要があります。

![AEP デバッガー ](./images/exp4.png)

[ モジュール 1.2](./../module1.2/data-ingestion.md) では、スキーマにフィールドグループを追加する方法を説明します。

次の手順：[ 概要とメリット ](./summary.md)

[モジュール 1.1 に戻る](./data-ingestion-launch-web-sdk.md)

[すべてのモジュールに戻る](./../../../overview.md)
