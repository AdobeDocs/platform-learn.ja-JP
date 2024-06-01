---
title: Platform Web SDK のデータストリームの設定
description: データストリームを有効にし、Experience Cloudソリューションを設定する方法について説明します。 このレッスンは、「Web SDK を使用した Adobe Experience Cloud 実装のチュートリアル」の一部です。
feature: Web SDK,Datastreams
jira: KT-15399
exl-id: 20f770d1-eb0f-41a9-b451-4069a0a91fc4
source-git-commit: a8431137e0551d1135763138da3ca262cb4bc4ee
workflow-type: tm+mt
source-wordcount: '536'
ht-degree: 9%

---

# データストリームの設定

Adobe Experience Platform Web SDK 用データストリームの設定方法について説明します。

[データストリーム](https://experienceleague.adobe.com/ja/docs/experience-platform/datastreams/overview) platform Web SDK で収集されたデータの送信先をAdobe Experience Platform Edge Networkに指示します。 データストリーム設定では、Experience Cloudアプリケーション、Experience Platformアカウント、イベント転送を有効にします。

![Web SDK、データストリームおよびEdge Network図](assets/dc-websdk-datastreams.png)

## 学習目標

このレッスンを最後まで学習すると、以下の内容を習得できます。

* データストリームの作成
* データストリームの上書きの基本を学ぶ

## 前提条件

データストリームを設定する前に、次のレッスンを完了している必要があります。

* [スキーマの設定](configure-schemas.md)
* [ID 名前空間の設定](configure-identities.md)

## データストリームの作成

これでデータストリームを作成して、Web SDK で収集されたデータの送信先を Platform Edge Networkに指示できるようになりました。

**データストリームを作成するには：**

1. を開きます [データ収集インターフェイス](https://launch.adobe.com/){target="_blank"}
1. 正しいサンドボックスにいることを確認します

   >[!NOTE]
   >
   >Real-Time CDPやJourney Optimizerなどの Platform ベースのアプリケーションを使用している場合は、このチュートリアルで開発用サンドボックスを使用することをお勧めします。 そうでない場合は、 **[!UICONTROL Prod]** サンドボックス。

1. に移動 **[!UICONTROL データストリーム]** 左側のナビゲーションで
1. を選択 **[!UICONTROL 新規データストリーム]**
1. Enter `Luma Web SDK: Development Environment` as the **[!UICONTROL 名前]**. この名前は、後でタグプロパティに Web SDK 拡張機能を設定するときに参照されます。
1. を選択 **[!UICONTROL 保存]**

   ![データストリームの作成](assets/datastream-create-new-datastream.png)

   >[!NOTE]
   >
   >スキーマを選択する必要はありません。 スキーマの選択は、を使用する場合にのみ必要です [データ収集のためのデータ準備](/help/data-collection/edge/data-prep.md) 機能

次の画面では、Adobeアプリなどのサービスをデータストリームに追加できますが、現時点ではサービスを追加しません。 それは後の授業で行います [Experience Platformの設定](setup-experience-platform.md), [Analytics の設定](setup-analytics.md), [Audience Managerの設定](setup-audience-manager.md), [ターゲットを設定](setup-target.md)、または [イベントの転送](setup-event-forwarding.md).

>[!NOTE]
>
>Platform Web SDK を独自の web サイトに実装する場合は、3 つのタグ環境（開発、ステージ、実稼動）にマッピングするために、3 つのデータストリームを作成する必要があります。 Adobe Real-time Customer Data PlatformやAdobe Journey Optimizerなどの Platform ベースのアプリケーションで Platform Web SDK を使用している場合は、適切な Platform サンドボックスにそれらのデータストリームを作成する必要があります。

## データストリームの上書き

[データストリームの上書き](https://experienceleague.adobe.com/en/docs/experience-platform/datastreams/overrides) を使用すると、データストリームの追加設定を定義し、特定の条件下でデフォルトの設定を上書きできます。

データストリーム設定の上書きは、次の 2 つの手順で行います。

1. 最初に、データストリームサービス設定でデータストリームの上書きを定義します。 例えば、上書きとして使用する代替の Analytics レポートスイート、Target ワークスペースまたは Platform データセットを定義できます。
1. 次に、Web SDK send event アクションまたは Web SDK タグ拡張機能の設定によって、上書きをEdge Networkに送信します。

が含まれる [Adobe Analyticsの設定](setup-analytics.md) レッスンでは、Platform Web SDK のイベント送信アクションを使用して、ページのレポートスイートを上書きします。

これで、タグプロパティに Platform Web SDK 拡張機能をインストールする準備が整いました。

[次へ： ](install-web-sdk.md)

>[!NOTE]
>
>Adobe Experience Platform Web SDK の学習に時間を費やしていただき、ありがとうございます。 ご質問がある場合、一般的なフィードバックを共有したい場合、または将来のコンテンツに関するご提案がある場合は、このページでお知らせください [Experience League コミュニティ ディスカッションの投稿](https://experienceleaguecommunities.adobe.com/t5/adobe-experience-platform-data/tutorial-discussion-implement-adobe-experience-cloud-with-web/td-p/444996)
