---
title: Foundation - Adobe Experience Platformデータ収集と Web SDK 拡張機能の設定 — Adobe Experience Platformでの XDM スキーマ要件
description: Foundation - Adobe Experience Platformデータ収集と Web SDK 拡張機能の設定 — Adobe Experience Platformでの XDM スキーマ要件
kt: 5342
audience: Data Engineer, Data Architect
doc-type: tutorial
activity: develop
exl-id: 8e17129c-633d-45bd-aa70-78cc3d3a2108
source-git-commit: cc7a77c4dd380ae1bc23dc75608e8e2224dfe78c
workflow-type: tm+mt
source-wordcount: '241'
ht-degree: 1%

---

# 1.7 Adobe Experience Platformでの XDM スキーマ要件

Web SDK と alloy.js でデータをAdobe Experience Platformに取り込めるようにするには、特定の XDM Mixin をAdobe Experience Platformの XDM スキーマの一部にする必要があります。

に移動します。 [https://experience.adobe.com/platform](https://experience.adobe.com/platform) をクリックし、ログインします。

![AEP デバッガー](./images/exp1.png)

ログイン後、テキストをクリックして適切なサンドボックスを選択します **実稼動版** 画面の上の青い線で表示されます。 サンドボックスを選択 `--aepSandboxId--`.

サンドボックスを選択すると、画面が変更され、サンドボックスに表示されます。

![AEP デバッガー](./images/exp2.png)

左側のメニューで、に移動します。 **スキーマ** をクリックし、 **デモシステム — Web サイトのイベントスキーマ (Global v1.1)** スキーマ。

![AEP デバッガー](./images/exp3.png)

そのスキーマで、フィールドグループが表示されます **AEP Web SDK ExperienceEvent Mixin** が追加されました。 このフィールドグループは、最低限必要なフィールドをすべてスキーマに追加します。 Web SDK で使用されるAdobe Experience Platformのすべてのエクスペリエンスイベントスキーマでは、常に、そのフィールドグループがスキーマの一部である必要があります。

![AEP デバッガー](./images/exp4.png)

In [モジュール 2](./../module2/data-ingestion.md) スキーマにフィールドグループを追加する方法を学びます。

次のステップ： [概要とメリット](./summary.md)

[モジュール 1 に戻る](./data-ingestion-launch-web-sdk.md)

[すべてのモジュールに戻る](./../../overview.md)
