---
title: データストリームの設定
description: データストリームを有効にし、設定ソリューションをExperience Cloudする方法を説明します。 このレッスンは、「 Adobe Experience Cloudと Web SDK の実装」チュートリアルの一部です。
feature: Web SDK,Datastreams
source-git-commit: f08866de1bd6ede50bda1e5f8db6dbd2951aa872
workflow-type: tm+mt
source-wordcount: '550'
ht-degree: 5%

---

# データストリームの設定

データストリームを有効にし、アプリケーションアプリケーションをExperience Cloudする方法を説明します。

データストリームは、Adobe Experience Platform Edge Network に対し、Platform Web SDK が収集したデータの送信先を伝えます。 データストリーム設定で、Experience Cloudアプリケーション、Experience Platformアカウント、イベント転送を有効にします。 詳しくは、 [データストリームの設定の基本](https://experienceleague.adobe.com/docs/experience-platform/edge/fundamentals/datastreams.html?lang=ja) を参照してください。

## 学習内容

このレッスンを最後まで学習すると、以下の内容を習得できます。

* データストリームの作成
* データストリームの上書きの概要

## 前提条件

データストリームを設定する前に、次のレッスンを既に完了している必要があります。

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
1. 入力 `Luma Web SDK: Development Environment` として **[!UICONTROL 名前]**. この名前は、後でタグプロパティで Web SDK 拡張機能を設定する際に参照されます。
1. を選択します。 `Luma Web Event Data` として **[!UICONTROL イベントスキーマ]**
1. 「**[!UICONTROL 保存]**」を選択します

   ![データストリームの作成](assets/datastream-create-new-datastream.png)

   >[!AVAILABILITY]
   >
   >マッピング機能は、後日このチュートリアルに組み込まれます。




次の画面では、Adobeアプリケーションなどのサービスをデータストリームに追加できますが、この時点ではサービスを追加しません。 その場合は、レッスンの後半でおこないます。 [設定Experience Platform](setup-experience-platform.md), [Analytics の設定](setup-analytics.md), [設定Audience Manager](setup-audience-manager.md), [Target の設定](setup-target.md)または [イベント転送](setup-event-forwarding.md).

>[!NOTE]
>
>独自の Web サイトに Platform Web SDK を実装する場合は、3 つのデータストリームを作成して、3 つのタグ環境（開発、ステージング、実稼動）にマッピングする必要があります。 Adobe Real-time Customer Data PlatformやAdobe Journey Optimizerなどのプラットフォームベースのアプリケーションで Platform Web SDK を使用している場合は、適切な Platform サンドボックスにこれらのデータストリームを作成する必要があります。

## データストリームの上書き

データストリームの上書きを使用すると、データストリームの追加の設定を定義し、実装の特定の条件下でデフォルトの設定を上書きできます。


データストリーム設定の上書きは、次の 2 つの手順で構成されます。

1. まず、データストリーム設定でデータストリームの上書きを定義します。 これは、上書きするAdobeアプリケーションごとにおこなう必要があります。
1. 次に、Web SDK の「Send Event Action」または Web SDK タグ拡張の設定で、オーバーライドを Edge Network に送信します。

詳しくは、 [datastream 設定はドキュメントを上書きします](https://experienceleague.adobe.com/docs/experience-platform/datastreams/overrides.html?lang=en) データストリーム設定を上書きする方法の詳細な手順については、を参照してください。

「 Adobe Analyticsの設定」レッスンでは、次の操作をおこないます。 [Platform Web SDK Send Event Action を使用して、ページのレポートスイートを上書きします。](setup-analytics.md).

これで、タグプロパティに Platform Web SDK 拡張機能をインストールする準備が整いました。

[次へ： ](install-web-sdk.md)

>[!NOTE]
>
>Adobe Experience Platform Web SDK の学習に時間を割いていただき、ありがとうございます。 ご質問がある場合、一般的なフィードバックを共有したい場合、または今後のコンテンツに関する提案がある場合は、こちらで共有してください [Experience Leagueコミュニティディスカッション投稿](https://experienceleaguecommunities.adobe.com/t5/adobe-experience-platform-launch/tutorial-discussion-implement-adobe-experience-cloud-with-web/td-p/444996)
