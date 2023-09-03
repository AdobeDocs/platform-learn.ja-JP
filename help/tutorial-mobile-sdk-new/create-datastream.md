---
title: データストリームの設定
description: データストリームを作成する方法については、Experience Platformを参照してください。
feature: Mobile SDK,Datastreams
hide: true
source-git-commit: 1b09f81b364fe8cfa9d5d1ac801d7781d1786259
workflow-type: tm+mt
source-wordcount: '546'
ht-degree: 9%

---


# データストリームの作成

データストリームを作成する方法については、Experience Platformを参照してください。

データストリームは、Platform Edge ネットワーク上のサーバー側の設定です。 データストリームは、Platform Edge ネットワークへの受信データが、Adobe Experience Cloudのアプリケーションおよびサービスに適切にルーティングされるようにします。 詳しくは、 [ドキュメント](https://experienceleague.adobe.com/docs/experience-platform/edge/fundamentals/datastreams.html?lang=ja) またはこの [ビデオ](https://experienceleague.adobe.com/docs/platform-learn/data-collection/edge-network/configure-datastreams.html?lang=ja).

## 前提条件

データストリームを作成するには、データ収集インターフェイス ( 旧称： [!UICONTROL Launch]) をクリックし、データストリームの管理と表示を行うユーザー権限が必要です。

## 学習内容

このレッスンでは、次の操作を実行します。

* データストリームをいつ使用すればよいかを把握します。
* データストリームの作成.
* データストリームの設定.

## データストリームの作成

データストリームは [!UICONTROL データ収集] を使用するインターフェイス [!UICONTROL Datastream] 設定ツールを使用します。 データストリームを作成する手順は、次のとおりです。

1. データストリームはサンドボックスレベルで定義されるので、正しいExperience Platformサンドボックスにいることを確認してください。
1. 選択 **[!UICONTROL データストリーム]** をクリックします。
1. **[!UICONTROL 新しいデータストリーム]**&#x200B;を選択します。

   ![datastreams ホーム](assets/datastream-new.png)

1. 次を提供： **[!UICONTROL 名前]**&#x200B;例： `Luma Mobile App` および **[!UICONTROL 説明]**&#x200B;例： `Datastream for Luma Mobile App`.
1. 前のレッスンで作成したスキーマを **イベントスキーマ**&#x200B;リスト。
1. 「**[!UICONTROL 保存]**」を選択します。

   ![新しいデータストリーム](assets/datastream-name.png)


## サービスを追加

次に、Experience Cloudサービスをデータストリームに接続します。 Platform Mobile SDK が Edge ネットワークにデータを送信する場合、データストリームは次のサービスにデータを送信します。

1. 「**[!UICONTROL サービスを追加]**」を選択します。

1. 追加 **[!UICONTROL Adobe Analytics]** から [!UICONTROL サービス] リスト

1. 使用するレポートサイトの名前を入力します。 **[!UICONTROL レポートスイート ID]**.

1. 切り替えてサービスを有効にする **[!UICONTROL 有効]** オン。

1. 「**[!UICONTROL 保存]**」を選択します。

   ![Adobe Analytics as Datastream サービスの追加](assets/datastream-service-aa.png)

また、Adobe Experience Platformサービスを有効にすることもできます。

>[!IMPORTANT]
>
>Adobe Experience Platformサービスは、イベントデータセットを作成した場合にのみ有効にできます。 イベントデータセットをまだ作成していない場合は、の手順に従ってください。 [ここ](platform.md).

1. クリック ![追加](https://spectrum.adobe.com/static/icons/workflow_18/Smock_AddCircle_18_N.svg) **[!UICONTROL サービスを追加]** をクリックして別のサービスを追加します。

1. [!UICONTROL サービス]リストから&#x200B;**[!UICONTROL Adobe Experience Platform]** を選択します。

1. 切り替えてサービスを有効にする **[!UICONTROL 有効]** オン。

1. を選択します。 **[!UICONTROL イベントデータセット]** を [データセットの作成](platform.md#create-a-dataset) 手順、例： **Luma モバイルアプリイベントデータセット**

1. 「**[!UICONTROL 保存]**」を選択します。

   ![Adobe Experience Platform as a Datastream サービスの追加](assets/datastream-service-aep.png)
1. 最終的な設定は次のようになります。

   ![datastream の設定](assets/datastream-settings.png)


>[!NOTE]
>
>組織が使用する各サービスを有効にすると、モバイルアプリで収集されたデータをどこでも使用できるようになります。 データストリームの設定について詳しくは、ドキュメントを参照してください [ここ](https://experienceleague.adobe.com/docs/experience-platform/edge/fundamentals/datastreams.html#adobe-experience-platform-settings).

独自のアプリに Platform Mobile SDK を実装する場合、最終的に 3 つのデータストリームを作成して、3 つのタグ環境（開発、ステージング、実稼動）にマッピングする必要があります。 Adobe Real-time Customer Data PlatformやAdobe Journey Optimizerなどのプラットフォームベースのアプリケーションで Platform Mobile SDK を使用している場合は、適切なサンドボックスにこれらのデータストリームを作成する必要があります。

>[!SUCCESS]
>
>これで、このチュートリアルの残りの部分で使用するデータストリームが作成されました。<br/>Adobe Experience Platform Mobile SDK の学習に時間を割いていただき、ありがとうございます。 ご質問がある場合、一般的なフィードバックを共有する場合、または今後のコンテンツに関する提案がある場合は、このドキュメントで共有します [Experience Leagueコミュニティディスカッション投稿](https://experienceleaguecommunities.adobe.com/t5/adobe-experience-platform-launch/tutorial-discussion-implement-adobe-experience-cloud-in-mobile/td-p/443796)

次へ： **[タグの設定](configure-tags.md)**
