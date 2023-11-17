---
title: データストリームの設定
description: データストリームを作成する方法については、Experience Platformを参照してください。
feature: Mobile SDK,Datastreams
exl-id: 7b83f834-d1fb-45d1-8bcf-bc621f94725c
source-git-commit: 94ca4a238c241518219fb2e8d73f775836f86d86
workflow-type: tm+mt
source-wordcount: '426'
ht-degree: 8%

---

# データストリームの作成

データストリームを作成する方法については、Experience Platformを参照してください。

>[!INFO]
>
> このチュートリアルは、2023 年 11 月後半に新しいサンプルモバイルアプリを使用した新しいチュートリアルに置き換えられます

データストリームは、Platform Edge ネットワーク上のサーバー側の設定です。  データストリームは、Platform Edge ネットワークへの受信データが、Adobe Experience Cloudのアプリケーションおよびサービスに適切にルーティングされるようにします。 詳しくは、 [ドキュメント](https://experienceleague.adobe.com/docs/experience-platform/edge/fundamentals/datastreams.html?lang=ja) またはこの [ビデオ](https://experienceleague.adobe.com/docs/platform-learn/data-collection/edge-network/configure-datastreams.html?lang=ja).

## 前提条件

データストリームを作成するには、データ収集インターフェイス ( 旧称： [!UICONTROL Launch]) を使用し、 [!UICONTROL Experience Platform] > [!UICONTROL データ収集] > **[!UICONTROL データストリームの管理]** および **[!UICONTROL データストリームの表示]**.

## 学習内容

このレッスンでは、次の操作を実行します。

* データストリームをいつ使用すればよいかを把握します。
* データストリームの作成.
* データストリームの設定.

## データストリームの作成

データストリームは [!UICONTROL データ収集] を使用するインターフェイス [!UICONTROL Datastream] 設定ツールを使用します。 データストリームを作成する手順は、次のとおりです。

1. 正しい Platform サンドボックス内にあることを確認します。
1. **[!UICONTROL 新しいデータストリーム]**&#x200B;を選択します。

   ![datastreams ホーム](assets/mobile-datastream-new.png)

1. 名前を指定します（例： ）。 `Luma App`.
1. 前のレッスンで作成したスキーマを選択します。
1. 「**[!UICONTROL 保存]**」を選択します。

   ![新しいデータストリーム](assets/mobile-datastream-name.png)


## サービスを追加

次に、データストリームにExperience Cloudサービスを接続できます。 Platform Mobile SDK が Edge ネットワークにデータを送信すると、データストリームは次のサービスにデータを送信します。

1. 追加 **[!UICONTROL Adobe Analytics]** およびは、レポートスイートを提供します。

1. 有効にする **[!UICONTROL Adobe Audience Manager]** （オプション）。

1. 有効にする **[!UICONTROL Adobe Experience Platform]** および **[!UICONTROL データセット]** （オプション）。
   * データセットがまだ作成されていない場合は、の手順に従ってください。 [ここ](platform.md).

1. 最終的な設定は次のようになります。
   ![datastream の設定](assets/mobile-datastream-settings.png)


>[!NOTE]
>
>組織が使用する各サービスを有効にすると、モバイルアプリで収集されたデータをどこでも使用できるようになります。 データストリーム設定の詳細については、ドキュメントを参照してください。 [ここ](https://experienceleague.adobe.com/docs/experience-platform/edge/fundamentals/datastreams.html#adobe-experience-platform-settings).

お客様の Web サイトに Platform Mobile SDK を実装する場合、3 つのデータストリームを作成して、3 つのタグ環境（開発、ステージング、実稼動）にマッピングする必要があります。 Adobe Real-time Customer Data PlatformやAdobe Journey Optimizerなどのプラットフォームベースのアプリケーションで Platform Mobile SDK を使用している場合は、適切な Platform サンドボックスにこれらのデータストリームを作成する必要があります。

次へ： **[タグの設定](configure-tags.md)**

>[!NOTE]
>
>Adobe Experience Platform Mobile SDK の学習に時間を割いていただき、ありがとうございます。 ご質問がある場合、一般的なフィードバックを共有したい場合、または今後のコンテンツに関する提案がある場合は、こちらで共有してください [Experience Leagueコミュニティディスカッション投稿](https://experienceleaguecommunities.adobe.com/t5/adobe-experience-platform-launch/tutorial-discussion-implement-adobe-experience-cloud-in-mobile/td-p/443796)
