---
title: Microsoft Azure Event Hub へのAudience Activation – 概要とメリット
description: Microsoft Azure Event Hub へのAudience Activation – 概要とメリット
kt: 5342
doc-type: tutorial
exl-id: f081af11-3ea0-47cc-ae74-24a0e0231d66
source-git-commit: 3d61d91111d8693ab031fbd7b26706c02818108c
workflow-type: tm+mt
source-wordcount: '300'
ht-degree: 1%

---

# 概要とメリット

おめでとうございます。Microsoft Azure Event Hub とAdobe Experience Platformの学習に時間を費やしていただき、ありがとうございます。
このモジュールでは、Azure Event Hub インスタンスを設定する方法と、それをAdobe Experience Platformに接続する方法について説明しました。

## メリット

次に、Adobe Experience PlatformをMicrosoft Azure Event Hub と統合するメリットを強調します。

- Microsoft Azure Event Hubs as a Adobe Experience Platformの宛先を使用すると、オーディエンスの選定をリアルタイムで取得し、Azure Event Hub 機能を使用して処理できます。 このような Azure イベントハブ機能を使用すると、あらゆる種類のカスタムオーディエンスアクティベーションハンドラーを作成でき、あらゆる種類のサードパーティの宛先を統合できます。

- 宛先は指定したオーディエンスによってのみトリガーされますが、アクティベーションペイロードには、特定のプロファイルが該当するすべてのオーディエンスが含まれます。

- オーディエンスは、ステータスが変更された場合にのみアクティベーションをトリガーします。 例えば、3 か月間に 4 回オーディエンスに該当するプロファイルの場合、最初の 2 つのみがアクティブ化されます。 1 つ目はステータスがから **実現済み** に変更され、2 つ目はステータスが **実現済み** から **既存** に変更されたことをトリガーします。

- 既知のプロファイルのオーディエンスをアクティブ化する場合、完全な ID マップがアクティベーションペイロードに含まれます。 Azure 関数では、使用可能な任意の ID を使用して、アプリケーションの顧客識別子を使用しながら、オーディエンスをサードパーティアプリケーションで管理されるプロファイルにマッピングできます。

- このモジュールでは、イベントハブ関数がローカルにデプロイされ（Visual Studio Code のデバッグモード）、多くのトラブルシューティングおよびデバッグオプションが提供されています。

## これを確認する

- なし

## 次の手順

[Real-Time CDP:Audience ActivationからMicrosoft Azure Event Hub に戻る ](./segment-activation-microsoft-azure-eventhub.md){target="_blank"}

[ すべてのモジュール ](./../../../../overview.md){target="_blank"} に戻る
