---
title: データストリームの設定
description: データストリームを有効にし、設定ソリューションをExperience Cloudする方法を説明します。 このレッスンは、「 Adobe Experience Cloudと Web SDK の実装」チュートリアルの一部です。
feature: Web SDK,Tags,Datastreams
exl-id: ca28374a-9fe0-44de-a7ac-0aa046712515
source-git-commit: 4a12f8261cf1fb071bc70b6a04c34f6c16bcce64
workflow-type: tm+mt
source-wordcount: '447'
ht-degree: 8%

---

# データストリームの設定

データストリームを有効にし、設定ソリューションをExperience Cloudする方法を説明します。

データストリームは、Adobe Experience Platform Edge Network に対し、Platform Web SDK が収集したデータの送信先を伝えます。 データストリーム設定で、Experience Cloudアプリケーション、Experience Platformアカウント、イベント転送を有効にします。 詳しくは、 [データストリームの設定の基本](https://experienceleague.adobe.com/docs/experience-platform/edge/fundamentals/datastreams.html?lang=ja) を参照してください。

## 学習内容

このレッスンを最後まで学習すると、以下の内容を習得できます。

* データストリームの作成
* Experience Cloud・アプリの有効化
* 「Enable」Experience Platform

## 前提条件

データストリームを設定する前に、次のレッスンを既に完了している必要があります。

* [権限の設定](configure-permissions.md)
* [スキーマの設定](configure-schemas.md)
* [ID 名前空間の設定](configure-identities.md)

## データストリームの作成

これで、Platform Edge Network に Web SDK が収集したデータをどこに送信するかを伝えるデータストリームを作成できます。

**データストリームを作成する手順は、次のとおりです。**

1. を開きます。 [データ収集インターフェイス](https://launch.adobe.com/){target="_blank"}
1. が正しいサンドボックスにあることを確認します。

   >[!NOTE]
   >
   >Real-Time CDPなどの Platform ベースのアプリケーションを使用している場合は、このチュートリアルで開発サンドボックスを使用することをお勧めします。 そうでない場合は、 **[!UICONTROL Prod]** サンドボックス。

1. に移動します。 **[!UICONTROL データストリーム]** 左のナビゲーションで
1. 選択 **[!UICONTROL 新規データストリーム]** をクリックします。
1. 入力 `Luma Web SDK` として **[!UICONTROL 名前]**. この名前は、後でタグプロパティで Web SDK 拡張機能を設定する際に参照されます。
1. を選択します。 `Luma Web Event Data` として **[!UICONTROL イベントスキーマ]**
1. 「**[!UICONTROL 保存]**」を選択します

   ![データストリームの作成](assets/datastream-create-datastream.png)

   >[!AVAILABILITY]
   >
   >マッピング機能は、後日このチュートリアルに組み込まれます。




次の画面では、Adobeアプリケーションなどのサービスをデータストリームに追加できますが、この時点ではサービスを追加しません。 その場合は、レッスンの後半でおこないます。 [設定Experience Platform](setup-experience-platform.md), [Analytics の設定](setup-analytics.md), [設定Audience Manager](setup-audience-manager.md), [Target の設定](setup-target.md)または [イベント転送](setup-event-forwarding.md).

>[!NOTE]
>
>独自の Web サイトに Platform Web SDK を実装する場合は、3 つのデータストリームを作成して、3 つのタグ環境（開発、ステージング、実稼動）にマッピングする必要があります。 Adobe Real-time Customer Data PlatformやAdobe Journey Optimizerなどのプラットフォームベースのアプリケーションで Platform Web SDK を使用している場合は、適切な Platform サンドボックスにこれらのデータストリームを作成する必要があります。

これで、タグプロパティに Platform Web SDK 拡張機能をインストールする準備が整いました。

[次へ： ](install-web-sdk.md)

>[!NOTE]
>
>Adobe Experience Platform Web SDK の学習に時間を割いていただき、ありがとうございます。 ご質問がある場合、一般的なフィードバックを共有する場合、または今後のコンテンツに関する提案がある場合は、このドキュメントで共有します [Experience Leagueコミュニティディスカッション投稿](https://experienceleaguecommunities.adobe.com/t5/adobe-experience-platform-launch/tutorial-discussion-implement-adobe-experience-cloud-with-web/td-p/444996)
