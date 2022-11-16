---
title: Microsoft Azure Event Hub に対するセグメントのアクティベーション — 概要とメリット
description: Microsoft Azure Event Hub に対するセグメントのアクティベーション — 概要とメリット
kt: 5342
audience: Data Engineer, Data Architect, Data Analyst
doc-type: tutorial
activity: develop
exl-id: 2174ac52-b5dd-4bc8-ab5f-4d84ae9ef19b
source-git-commit: cc7a77c4dd380ae1bc23dc75608e8e2224dfe78c
workflow-type: tm+mt
source-wordcount: '290'
ht-degree: 1%

---

# 概要とメリット

Microsoft Azure Event Hub とAdobe Experience Platformに関する学習に時間を割いていただき、ありがとうございます。
このモジュールでは、Azure Event Hub インスタンスの設定方法とAdobe Experience Platformへの接続方法を学びました。

## メリット

Adobe Experience PlatformとMicrosoft Azure Event Hub の統合のメリットについて説明します。

- Microsoft Azure Event Hubs as a Adobe Experience Platform Destination を使用すると、セグメントの選定をリアルタイムで取り込み、Azure Event Hub 機能を使用して処理できます。 このような Azure Event Hub 機能を使用すると、あらゆる種類のカスタムセグメントアクティベーションハンドラーを構築し、あらゆる種類のサードパーティの宛先を統合できます。

- 宛先は指定したセグメントによってのみトリガーされますが、アクティベーションペイロードには、特定のプロファイルが適合するすべてのセグメントが含まれます。

- セグメントは、トリガーのステータスが変更された場合にのみ、アクティベーションをステータスとして変更します。 例えば、3 ヶ月の期間でセグメントの 4 回認定されるプロファイルは、最初の 2 つのみがアクティブ化されます。 1 つ目は、ステータスがからに変わることです。 **実現**&#x200B;次に、2 つ目のイベントは、 **実現** から **既存**.

- 既知のプロファイルのセグメントをアクティブ化する場合、完全な ID マップがアクティベーションペイロードに含まれます。 Azure 関数は、使用可能な ID のいずれかを使用して、アプリケーションの顧客 ID を使用しながら、サードパーティのアプリケーションで管理されるプロファイルにセグメントをマッピングできます。

- このモジュールでは、イベントハブ関数がローカルにデプロイされ（Visual Studio コードのデバッグモード）、多くのトラブルシューティングおよびデバッグオプションが提供されました。

## 確認する

- N/A

[モジュール 13 に戻る](./segment-activation-microsoft-azure-eventhub.md)

[すべてのモジュールに戻る](./../../overview.md)
