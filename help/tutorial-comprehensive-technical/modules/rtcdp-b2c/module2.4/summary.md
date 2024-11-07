---
title: Microsoft Azure Event Hub へのセグメントアクティベーション – 概要とメリット
description: Microsoft Azure Event Hub へのセグメントアクティベーション – 概要とメリット
kt: 5342
doc-type: tutorial
source-git-commit: 2cdc145d7f3933ec593db4e6f67b60961a674405
workflow-type: tm+mt
source-wordcount: '291'
ht-degree: 1%

---

# 概要とメリット

おめでとうございます。Microsoft Azure Event Hub とAdobe Experience Platformの学習に時間を費やしていただき、ありがとうございます。
このモジュールでは、Azure Event Hub インスタンスを設定する方法と、それをAdobe Experience Platformに接続する方法について説明しました。

## メリット

次に、Adobe Experience PlatformをMicrosoft Azure Event Hub と統合するメリットを強調します。

- Microsoft Azure Event Hubs as a Adobe Experience Platformの宛先を使用すると、セグメントの選定をリアルタイムで取得し、Azure Event Hub 機能を使用して処理できます。 このような Azure Event Hub 関数を使用すると、あらゆる種類のカスタムセグメントアクティベーションハンドラーを作成でき、あらゆる種類のサードパーティの宛先を統合できます。

- 宛先は指定したセグメントによってのみトリガーされますが、アクティベーションペイロードには、特定のプロファイルが該当するすべてのセグメントが含まれます。

- セグメントは、ステータスが変更された場合にのみアクティブ化をトリガーします。 例えば、3 か月間に 4 回セグメントに選定されたプロファイルの場合、最初の 2 つのみがアクティブ化されます。 1 つ目はステータスがから **実現済み** に変更され、2 つ目はステータスが **実現済み** から **既存** に変更されたことをトリガーします。

- 既知のプロファイルのセグメントをアクティブ化する場合、完全な ID マップがアクティベーションペイロードに含まれます。 Azure 関数では、使用可能な任意の ID を使用して、アプリケーションの顧客識別子を使用しながら、セグメントをサードパーティアプリケーションで管理されるプロファイルにマッピングできます。

- このモジュールでは、イベントハブ関数がローカルにデプロイされ（Visual Studio Code のデバッグモード）、多くのトラブルシューティングおよびデバッグオプションが提供されています。

## これを確認する

- なし

[モジュール 2.4 に戻る](./segment-activation-microsoft-azure-eventhub.md)

[すべてのモジュールに戻る](./../../../overview.md)
