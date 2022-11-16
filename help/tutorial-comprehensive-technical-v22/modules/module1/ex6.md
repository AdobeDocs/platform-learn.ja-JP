---
title: Foundation - Adobe Experience Platformデータ収集と Web SDK 拡張機能の設定 — Adobe Targetの実装
description: Foundation - Adobe Experience Platformデータ収集と Web SDK 拡張機能の設定 — Adobe Targetの実装
kt: 5342
audience: Data Engineer, Data Architect
doc-type: tutorial
activity: develop
exl-id: 4aee8ae2-38ca-49a3-8f1b-57713d16f5b5
source-git-commit: cc7a77c4dd380ae1bc23dc75608e8e2224dfe78c
workflow-type: tm+mt
source-wordcount: '177'
ht-degree: 0%

---

# 1.6 Adobe Targetの実装

## 1.6. Adobe Targetを使用するためのデータストリームの更新

Web SDK で収集されたデータをAdobe Targetに送信し、すべての顧客に対してパーソナライズされたエクスペリエンスをAdobe Targetから返す場合は、次の手順に従います。

に移動します。 [https://experience.adobe.com/launch/](https://experience.adobe.com/launch/) そして、 **データストリーム**.

画面の右上隅で、サンドボックス名を選択します。この名前は、 `--aepSandboxId--`. 特定のデータストリームを開きます。このデータストリームの名前は、 `--demoProfileLdap-- - Demo System Datastream`.

![左側のナビゲーションで Edge 設定アイコンをクリックします。](./images/edgeconfig1b.png)

これが見えます Adobe Targetを有効にするには、 **+サービスを追加**.

![AEP デバッガー](./images/aa2.png)

これが見えます サービスを選択 **Adobe Target**（オプションで追加情報を入力できます） 現時点では、保存する必要はありません。クリックしてください **キャンセル**.

![AEP デバッガー](./images/at1.png)

次のステップ： [1.7 Adobe Experience Platformでの XDM スキーマ要件](./ex7.md)

[モジュール 1 に戻る](./data-ingestion-launch-web-sdk.md)

[すべてのモジュールに戻る](./../../overview.md)
