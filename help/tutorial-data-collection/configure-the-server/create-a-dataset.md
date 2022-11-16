---
title: データセットの作成
description: データセットの作成
exl-id: 19a60087-2f78-4510-b127-b1007a6b7a56
source-git-commit: cc7a77c4dd380ae1bc23dc75608e8e2224dfe78c
workflow-type: tm+mt
source-wordcount: '308'
ht-degree: 2%

---

# データセットの作成

Adobe Experience Platformに送信するデータについて説明するだけでなく、データを保持する場所も必要です。 Adobe Experience Platformでは、データを配置できるこれらのバケットをデータセットと呼びます。

>[!NOTE]
>
>Platform Web SDK を使用してAdobe Analytics、Adobe Target、Adobe Audience Managerにデータを送信する場合、またはイベント転送を使用する場合は、データセットは不要です。 Web SDK を使用する場合は、このチュートリアルのこのページをスキップできます。

1. 選択 **[!UICONTROL データセット]** under [!UICONTROL データ管理] Adobe Experience Platformの左側のメニューから
1. 次に、 **[!UICONTROL データセットを作成]** 」コマンドを使用して、
   ![データセット表示](../assets/datasets-view.png)

## スキーマからのデータセットの作成

1. 次の [!UICONTROL ワークフロー] インターフェイスで、最初のタイルを選択します。 **[!UICONTROL スキーマからデータセットを作成]**.
1. を検索します。 [以前に作成したスキーマ](create-a-schema.md) をクリックし、選択します。
   ![スキーマの選択](../assets/schema-selection.png)
1. 選択 **[!UICONTROL 次へ]** 名前と説明を入力します。
   ![データセット名と説明](../assets/dataset-name-description.png)
1. 選択 **[!UICONTROL 完了]**. データセットが作成され、データを受け取る準備が整いました。

データセットにデータを送信し始めると、データセットに挿入しようとしているデータが、適用されたスキーマに適合しているかどうかがAdobe Experience Platformによって検証されます。 データがスキーマに準拠していない場合、そのデータは拒否され、データセットには配置されません。 この検証手順の結果、データセットの利用者 (Adobe製品、サードパーティ、または自社の会社 ) は、データセットのデータの構造と清潔さに関して、ある程度の確実性を持つことがあります。

データセットの作成について詳しくは、 [データセットの作成とデータの取り込み](/help/platform/data-ingestion/create-datasets-and-ingest-data.md).

[次へ： ](create-a-datastream.md)

>[!NOTE]
>
>データ収集に関する学習に時間を割いていただき、ありがとうございます。 ご質問がある場合、一般的なフィードバックを共有したい場合、または今後のコンテンツに関する提案がある場合は、こちらで共有してください [Experience Leagueコミュニティディスカッション投稿](https://experienceleaguecommunities.adobe.com/t5/adobe-experience-platform-launch/tutorial-discussion-use-adobe-experience-platform-data/m-p/543877)

