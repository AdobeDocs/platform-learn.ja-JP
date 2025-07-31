---
title: Platform Web SDKのデータストリームの設定
description: データストリームを有効にし、Experience Cloud ソリューションを設定する方法について説明します。 このレッスンは、「Web SDK を使用した Adobe Experience Cloud 実装のチュートリアル」の一部です。
feature: Web SDK,Datastreams
jira: KT-15399
exl-id: 20f770d1-eb0f-41a9-b451-4069a0a91fc4
source-git-commit: 7ccbaaf4db43921f07c971c485e1460a1a7f0334
workflow-type: tm+mt
source-wordcount: '535'
ht-degree: 8%

---

# データストリームの設定

Adobe Experience Platform Web SDK 用データストリームの設定方法について説明します。

[ データストリーム ](https://experienceleague.adobe.com/ja/docs/experience-platform/datastreams/overview)Platform Web SDKで収集されたデータの送信先をAdobe Experience Platform Edge Networkに指示します。 データストリーム設定では、Experience Cloud アプリケーション、Experience Platform アカウント、イベント転送を有効にします。

![Web SDK、データストリーム、Edge Networkの図 ](assets/dc-websdk-datastreams.png)

## 学習目標

このレッスンを最後まで学習すると、以下の内容を習得できます。

* データストリームの作成
* データストリームの上書きの基本を学ぶ

## 前提条件

データストリームを設定する前に、次のレッスンを完了している必要があります。

* [スキーマの設定](configure-schemas.md)
* [ID 名前空間の設定](configure-identities.md)

## データストリームの作成

これでデータストリームを作成して、Web SDKで収集されたデータの送信先を Platform Edge Networkに指示できるようになりました。

**データストリームを作成するには：**

1. [ データ収集インターフェイス ](https://experience.adobe.com/data-collection/){target="_blank"} を開きます。
1. 正しいサンドボックスにいることを確認します

   >[!NOTE]
   >
   >Real-Time CDPやJourney Optimizerなどの Platform ベースのアプリケーションを使用している場合は、このチュートリアルで開発用サンドボックスを使用することをお勧めします。 そうでない場合は、**[!UICONTROL Prod]** サンドボックスを使用します。

1. 左側のナビゲーションの **[!UICONTROL データストリーム]** に移動します
1. **[!UICONTROL 新規データストリーム]** を選択します。
1. `Luma Web SDK: Development Environment` 名前 **[!UICONTROL として]** と入力します。 この名前は、後でタグプロパティに web SDK拡張機能を設定する際に参照されます。
1. 「**[!UICONTROL 保存]**」を選択します

   ![ データストリームの作成 ](assets/datastream-create-new-datastream.png)

   >[!NOTE]
   >
   >スキーマを選択する必要はありません。 スキーマの選択は、[ データ収集のためのデータ準備 ](/help/data-collection/edge/data-prep.md) 機能を使用する場合にのみ必要です。

次の画面では、Adobe アプリケーションなどのサービスをデータストリームに追加できますが、この時点ではサービスを追加しません。 これは、レッスン [Analytics の設定 ](setup-experience-platform.md)、[Experience Platformの設定 ](setup-analytics.md)、[Audience Managerの設定 ](setup-audience-manager.md)、[Target の設定 ](setup-target.md) または [ イベント転送 ](setup-event-forwarding.md) の後半で行います。

>[!NOTE]
>
>Platform Web SDKを独自の web サイトに実装する場合、3 つのタグ環境（開発、ステージ、実稼動）にマッピングするために、3 つのデータストリームを作成する必要があります。 Adobe Real-Time Customer Data PlatformやAdobe Journey Optimizerなどの Platform ベースのアプリケーションで Platform Web SDKを使用している場合は、適切な Platform サンドボックスにそれらのデータストリームを作成する必要があります。

## データストリームの上書き

[ データストリームの上書き ](https://experienceleague.adobe.com/ja/docs/experience-platform/datastreams/overrides) を使用すると、データストリームの追加設定を定義し、特定の条件下でデフォルトの設定を上書きできます。

データストリーム設定の上書きは、次の 2 つの手順で行います。

1. 最初に、データストリームサービス設定でデータストリームの上書きを定義します。 例えば、上書きとして使用する代替の Analytics レポートスイート、Target ワークスペースまたは Platform データセットを定義できます。
1. 次に、Web SDK送信イベントを使用して、または Web SDK タグ拡張機能の設定で、上書きをEdge Networkに送信します。

[Adobe Analyticsの設定 ](setup-analytics.md) レッスンでは、Platform Web SDKのイベント送信アクションを使用して、ページのレポートスイートを上書きします。

これで、タグプロパティに Platform Web SDK拡張機能をインストールする準備が整いました。

>[!NOTE]
>
>Adobe Experience Platform Web SDKの学習にご協力いただき、ありがとうございます。 ご不明な点がある場合や、一般的なフィードバックを共有したい場合、または今後のコンテンツに関するご提案がある場合は、この [Experience League Community Discussion の投稿でお知らせください ](https://experienceleaguecommunities.adobe.com/t5/adobe-experience-platform-data/tutorial-discussion-implement-adobe-experience-cloud-with-web/td-p/444996?profile.language=ja)
