---
title: データセットの作成
description: データセットの作成
role: Developer
level: Intermediate
recommendations: noDisplay,noCatalog
kt: 10447
hide: true
hidefromtoc: true
exl-id: 7705d292-a29c-4977-bcc6-f088a51713ea
source-git-commit: cc7a77c4dd380ae1bc23dc75608e8e2224dfe78c
workflow-type: tm+mt
source-wordcount: '211'
ht-degree: 8%

---

# データセットの作成

Adobe Experience Platformに送信するデータについて説明するだけでなく、データを保持する場所も必要です。 Adobe Experience Platformでは、データを配置できるこれらのバケットをデータセットと呼びます。

データセットを作成するには、 [!UICONTROL データセット] Adobe Experience Platform内で表示

![データセット表示](../../../assets/implementation-strategy/datasets-view.png)

クリック [!UICONTROL データセットを作成] をクリックします。

データセット作成プロセスで、 [!UICONTROL スキーマからデータセットを作成] を選択し、 [以前に作成したスキーマ](create-a-schema.md).

![スキーマの選択](../../../assets/implementation-strategy/schema-selection.png)

クリック [!UICONTROL 次へ] 名前と説明を入力します。

![データセット名と説明](../../../assets/implementation-strategy/dataset-name-description.png)

「[!UICONTROL 完了]」をクリックします。データセットが作成され、データを受け取る準備が整いました。

データセットにデータを送信し始めると、Adobe Experience Platformは、データセットに配置しようとしているデータが、適用されたスキーマに適合していることを検証します。 データがスキーマに準拠していない場合、そのデータは拒否され、データセットには配置されません。 この検証手順の結果、データセットの利用者 (Adobe製品、サードパーティ、または自社の会社 ) は、データセットのデータの構造と清潔さに関して、ある程度の確実性を持つことがあります。

データセットの作成について詳しくは、 [データセット UI ガイド](https://experienceleague.adobe.com/docs/experience-platform/catalog/datasets/user-guide.html?lang=ja).
