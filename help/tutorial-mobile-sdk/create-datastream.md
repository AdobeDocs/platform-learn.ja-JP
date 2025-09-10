---
title: Platform Mobile SDK実装用のデータストリームの設定
description: Experience Platform でデータストリームを作成する方法を説明します。
feature: Mobile SDK,Datastreams
jira: KT-14625
exl-id: 7b83f834-d1fb-45d1-8bcf-bc621f94725c
source-git-commit: 008d3ee066861ea9101fe9fe99ccd0a088b63f23
workflow-type: tm+mt
source-wordcount: '425'
ht-degree: 7%

---

# データストリームの作成

Experience Platform でデータストリームを作成する方法を説明します。

データストリームは、Platform Edge Network上のサーバーサイド設定です。 データストリームは、Platform Edge Networkへの受信データがAdobe Experience Cloud アプリケーションおよびサービスに適切にルーティングされるようにします。 詳しくは、[ ドキュメント ](https://experienceleague.adobe.com/ja/docs/experience-platform/datastreams/overview) またはこの [ ビデオ ](https://experienceleague.adobe.com/en/docs/platform-learn/data-collection/edge-network/configure-datastreams) を参照してください。

![アーキテクチャ](assets/architecture.png){zoomable="yes"}

## 前提条件

データストリームを作成するには、組織がデータ収集インターフェイス（旧称 [!UICONTROL Launch]）でこの機能に対してプロビジョニングされ、データストリームの管理と表示を行うためのユーザー権限が必要です。

## 学習目標

このレッスンでは、次の操作を行います。

* データストリームを使用するタイミングを把握する。
* データストリームを作成します。
* データストリームを設定します。

## データストリームの作成

データストリームは、[!UICONTROL &#x200B; データストリーム &#x200B;] 設定ツールを使用して、[!UICONTROL &#x200B; データ収集 &#x200B;] インターフェイスで作成できます。 データストリームを作成するには：

1. データストリームはサンドボックスレベルで定義されるので、正しいExperience Platform サンドボックスに属していることを確認します。
1. 左パネルで **[!UICONTROL データストリーム]** を選択します。
1. **[!UICONTROL 新規データストリーム]** を選択します。

   ![ データストリームのホーム ](assets/datastream-new.png){zoomable="yes"}

1. **[!UICONTROL 名前]** を入力（例：`Luma Mobile App`）し、**[!UICONTROL 説明]** を入力（例：`Datastream for Luma Mobile App`）します。

   >[!NOTE]
   >
   >最後に、このチュートリアルを 1 つのサンドボックスで複数のユーザーと共に行う場合や、共有アカウントを使用する場合は、命名規則の一部として ID を追加またはプレフィックスすることを検討してください。 例えば、`Luma Mobile App Event Dataset` の代わりに `Luma Mobile App Event Dataset - Joe Smith` を使用します。 [ 概要 ](overview.md) のメモも参照してください。

1. 前のレッスンで作成したスキーマを「**イベントスキーマ**」リストから選択します。
1. 「**[!UICONTROL 保存]**」を選択します。

   ![ 新しいデータストリーム ](assets/datastream-name.png){zoomable="yes"}


## サービスを追加

このチュートリアルで（オプション） [Analytics](analytics.md) と [Experience Platform](platform.md) のレッスンを完了すると、データストリームにサービスが追加され、Platform Edge Networkに送信されたデータがこれらのアプリケーションに転送されるようになります。

<!--

### Adobe Analytics

1. Select **[!UICONTROL Add Service]**.

1. Add **[!UICONTROL Adobe Analytics]** from the [!UICONTROL Service] list, 

1. Enter the name of the report site that you want to use in **[!UICONTROL Report Suite ID]**.

1. Enable the service by switching **[!UICONTROL Enabled]** on.

1. Select **[!UICONTROL Save]**.

   ![Add Adobe Analytics as datastream service](assets/datastream-service-aa.png){zoomable="yes"}


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

   ![Add Adobe Experience Platform as a datastream service](assets/datastream-service-aep.png){zoomable="yes"}
1. The final configuration should look something like this.
   
   ![datastream settings](assets/datastream-settings.png){zoomable="yes"}

-->


>[!NOTE]
>
>組織が使用する各サービスを有効にすると、モバイルアプリで収集されたデータをどこでも使用できるようになります。 詳しくは、[ データストリーム設定 ](https://experienceleague.adobe.com/ja/docs/experience-platform/datastreams/overview) を参照してください。

独自のアプリに Platform Mobile SDKを実装する場合は、3 つのタグ環境（開発、ステージ、実稼動）にマッピングするために、最終的に 3 つのデータストリームを作成する必要があります。 Adobe Real-Time Customer Data PlatformやAdobe Journey Optimizerなどの Platform ベースのアプリケーションで Platform Mobile SDKを使用している場合は、適切なサンドボックスにこれらのデータストリームを作成する必要があります。

>[!SUCCESS]
>
>これで、チュートリアルの残りの部分で使用するデータストリームが作成されました。
>
>Adobe Experience Platform Mobile SDKの学習にご協力いただき、ありがとうございます。 ご不明な点がある場合や、一般的なフィードバックをお寄せになる場合、または今後のコンテンツに関するご提案がある場合は、この [Experience League Community Discussion の投稿でお知らせください ](https://experienceleaguecommunities.adobe.com/t5/adobe-experience-platform-data/tutorial-discussion-implement-adobe-experience-cloud-in-mobile/td-p/443796)

次のトピック：**[タグプロパティの設定](configure-tags.md)**
