---
title: 基盤 – Adobe Experience Platform Data Collection と Web SDK Extension の設定 – Adobe Experience Platformでの XDM スキーマ要件
description: 基盤 – Adobe Experience Platform Data Collection と Web SDK Extension の設定 – Adobe Experience Platformでの XDM スキーマ要件
kt: 5342
doc-type: tutorial
exl-id: 3fc4a1d6-4130-464e-98c0-5b9cac8051a0
source-git-commit: 1526661a80b4d551627dfca42a7e97c9498dd1f2
workflow-type: tm+mt
source-wordcount: '241'
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

[ モジュール 1.2](./../module1.2/data-ingestion.md) では、スキーマにフィールドグループを追加する方法を説明します。

次の手順：[ 概要とメリット ](./summary.md)

[モジュール 1.1 に戻る](./data-ingestion-launch-web-sdk.md)

[すべてのモジュールに戻る](./../../../overview.md)
