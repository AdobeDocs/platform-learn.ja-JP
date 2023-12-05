---
title: Platform Mobile SDK 実装用のデータストリームの設定
description: データストリームを作成する方法については、Experience Platformを参照してください。
feature: Mobile SDK,Datastreams
jira: KT-14625
exl-id: 7b83f834-d1fb-45d1-8bcf-bc621f94725c
source-git-commit: 25f0df2ea09bb7383f45a698e75bd31be7541754
workflow-type: tm+mt
source-wordcount: '428'
ht-degree: 3%

---

# データストリームの作成

データストリームを作成する方法については、Experience Platformを参照してください。

データストリームは、Platform Edge ネットワーク上のサーバー側の設定です。 データストリームは、Platform Edge ネットワークへの受信データが、Adobe Experience Cloudのアプリケーションおよびサービスに適切にルーティングされるようにします。 詳しくは、 [ドキュメント](https://experienceleague.adobe.com/docs/experience-platform/datastreams/overview.html?lang=ja) またはこの [ビデオ](https://experienceleague.adobe.com/docs/platform-learn/data-collection/edge-network/configure-datastreams.html?lang=ja).

![アーキテクチャ](assets/architecture.png)

## 前提条件

データストリームを作成するには、データ収集インターフェイス ( 旧称： [!UICONTROL Launch]) をクリックし、データストリームの管理と表示を行うユーザー権限が必要です。

## 学習内容

このレッスンでは、次の操作を実行します。

* データストリームをいつ使用すればよいかを把握します。
* データストリームを作成します。
* データストリームを設定します。

## データストリームの作成

データストリームは [!UICONTROL データ収集] を使用するインターフェイス [!UICONTROL Datastream] 設定ツールを使用します。 データストリームを作成する手順は、次のとおりです。

1. データストリームはサンドボックスレベルで定義されるので、正しいExperience Platformサンドボックス内にいることを確認してください。
1. 選択 **[!UICONTROL データストリーム]** をクリックします。
1. **[!UICONTROL 新しいデータストリーム]**&#x200B;を選択します。

   ![datastreams ホーム](assets/datastream-new.png)

1. 次を提供： **[!UICONTROL 名前]**&#x200B;例： `Luma Mobile App` および **[!UICONTROL 説明]**&#x200B;例： `Datastream for Luma Mobile App`.

   >[!NOTE]
   >
   >最終的な注意事項：単一のサンドボックスで複数のユーザーを使用する場合、または共有アカウントを使用する場合は、命名規則の一部として ID を追加または前付けすることを検討してください。 例えば、の代わりに `Luma Mobile App Event Dataset`，使用 `Luma Mobile App Event Dataset - Joe Smith`. 詳しくは、 [概要](overview.md).

1. 前のレッスンで作成したスキーマを **イベントスキーマ** リスト。
1. 「**[!UICONTROL 保存]**」を選択します。

   ![新しいデータストリーム](assets/datastream-name.png)


## サービスを追加

（オプション） [Analytics](analytics.md) および [Experience Platform](platform.md) このチュートリアルでは、Platform Edge Network に送信されるデータをこれらのアプリケーションに転送できるように、サービスをデータストリームに追加します。

<!--

### Adobe Analytics

1. Select **[!UICONTROL Add Service]**.

1. Add **[!UICONTROL Adobe Analytics]** from the [!UICONTROL Service] list, 

1. Enter the name of the report site that you want to use in **[!UICONTROL Report Suite ID]**.

1. Enable the service by switching **[!UICONTROL Enabled]** on.

1. Select **[!UICONTROL Save]**.

   ![Add Adobe Analytics as datastream service](assets/datastream-service-aa.png)


### Adobe Experience Platform

You might also want to enable the Adobe Experience Platform service. 

>[!IMPORTANT]
>
>You can only enable the Adobe Experience Platform service when having created an event dataset. If you don't already have an event dataset created, follow the instructions [here](platform.md).

1. Click ![Add](https://spectrum.adobe.com/static/icons/workflow_18/Smock_AddCircle_18_N.svg) **[!UICONTROL Add Service]** to add another service.

1. Select **[!UICONTROL Adobe Experience Platform]** from the [!UICONTROL Service] list.

1. Enable the service by switching **[!UICONTROL Enabled]** on.

1. Select the **[!UICONTROL Event Dataset]** that you created as part of the [Create a dataset](platform.md#create-a-dataset) instructions, for example **Luma Mobile App Event Dataset**

1. Select **[!UICONTROL Save]**.

   ![Add Adobe Experience Platform as a datastream service](assets/datastream-service-aep.png)
1. The final configuration should look something like this.
   
   ![datastream settings](assets/datastream-settings.png)

-->


>[!NOTE]
>
>組織が使用する各サービスを有効にすると、モバイルアプリで収集されたデータをどこでも使用できるようになります。 データストリームの設定について詳しくは、ドキュメントを参照してください [ここ](https://experienceleague.adobe.com/docs/experience-platform/datastreams/overview.html?lang=ja).

独自のアプリに Platform Mobile SDK を実装する場合、最終的に 3 つのデータストリームを作成して、3 つのタグ環境（開発、ステージング、実稼動）にマッピングする必要があります。 Adobe Real-time Customer Data PlatformやAdobe Journey Optimizerなどのプラットフォームベースのアプリケーションで Platform Mobile SDK を使用している場合は、適切なサンドボックスにこれらのデータストリームを作成する必要があります。

>[!SUCCESS]
>
>これで、このチュートリアルの残りの部分で使用するデータストリームが作成されました。
>
>Adobe Experience Platform Mobile SDK の学習に時間を割いていただき、ありがとうございます。 ご質問がある場合、一般的なフィードバックを共有する場合、または今後のコンテンツに関する提案がある場合は、このドキュメントで共有します [Experience Leagueコミュニティディスカッション投稿](https://experienceleaguecommunities.adobe.com/t5/adobe-experience-platform-data/tutorial-discussion-implement-adobe-experience-cloud-in-mobile/td-p/443796)

次へ： **[タグプロパティの設定](configure-tags.md)**
