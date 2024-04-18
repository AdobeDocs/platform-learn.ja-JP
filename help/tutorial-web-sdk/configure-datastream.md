---
title: データストリームの設定
description: データストリームを有効にし、Experience Cloudソリューションを設定する方法について説明します。 このレッスンは、Web SDK を使用したAdobe Experience Cloudの実装チュートリアルの一部です。
feature: Web SDK,Tags,Datastreams
exl-id: ca28374a-9fe0-44de-a7ac-0aa046712515
source-git-commit: 15bc08bdbdcb19f5b086267a6d94615cbfe1bac7
workflow-type: tm+mt
source-wordcount: '471'
ht-degree: 6%

---

# データストリームの設定


>[!CAUTION]
>
>このチュートリアルの大きな変更は、2024 年 4 月 23 日火曜日（PT）に公開される予定です。 その後、多くの演習が変更され、すべてのレッスンを完了するには、最初からチュートリアルを再開する必要が生じる場合があります。

データストリームを有効にし、Experience Cloudソリューションを設定する方法について説明します。

データストリームは、Platform Web SDK で収集されたデータの送信先をAdobe Experience Platform Edge Networkに伝えます。 データストリーム設定では、Experience Cloudアプリケーション、Experience Platformアカウント、イベント転送を有効にします。 を参照してください。 [データストリームの設定の基本](https://experienceleague.adobe.com/docs/experience-platform/edge/fundamentals/datastreams.html?lang=ja) を参照してください。

## 学習目標

このレッスンを最後まで学習すると、以下の内容を習得できます。

* データストリームの作成
* Experience Cloudアプリケーションの有効化
* Experience Platformを有効にする

## 前提条件

データストリームを設定する前に、次のレッスンを完了している必要があります。

* [権限の設定](configure-permissions.md)
* [スキーマの設定](configure-schemas.md)
* [ID 名前空間の設定](configure-identities.md)

## データストリームの作成

これでデータストリームを作成して、Web SDK で収集されたデータの送信先を Platform Edge Networkに指示できるようになりました。

**データストリームを作成するには：**

1. を開きます [データ収集インターフェイス](https://launch.adobe.com/){target="_blank"}
1. 正しいサンドボックスにいることを確認します

   >[!NOTE]
   >
   >Real-Time CDPなどの Platform ベースのアプリケーションを使用している場合は、このチュートリアルで開発用サンドボックスを使用することをお勧めします。 そうでない場合は、 **[!UICONTROL Prod]** サンドボックス。

1. に移動 **[!UICONTROL データストリーム]** 左側のナビゲーションで
1. を選択 **[!UICONTROL 新規データストリーム]** 画面の右側
1. Enter `Luma Web SDK` as the **[!UICONTROL 名前]**. この名前は、後でタグプロパティに Web SDK 拡張機能を設定するときに参照されます。
1. を選択 `Luma Web Event Data` as the **[!UICONTROL イベントスキーマ]**
1. 「**[!UICONTROL 保存]**」を選択します

   ![データストリームの作成](assets/datastream-create-datastream.png)

   >[!AVAILABILITY]
   >
   >マッピング機能は、後日このチュートリアルに組み込まれます。




次の画面では、Adobeアプリケーションなどのサービスをデータストリームに追加できますが、チュートリアルのこの時点ではサービスを追加しません。 それは後の授業で行います [Experience Platformの設定](setup-experience-platform.md), [Analytics の設定](setup-analytics.md), [Audience Managerの設定](setup-audience-manager.md), [ターゲットを設定](setup-target.md)、または [イベントの転送](setup-event-forwarding.md).

>[!NOTE]
>
>Platform Web SDK を独自の web サイトに実装する場合は、3 つのタグ環境（開発、ステージ、実稼動）にマッピングするために、3 つのデータストリームを作成する必要があります。 Adobe Real-time Customer Data PlatformやAdobe Journey Optimizerなどの Platform ベースのアプリケーションで Platform Web SDK を使用している場合は、適切な Platform サンドボックスにそれらのデータストリームを作成する必要があります。

これで、タグプロパティに Platform Web SDK 拡張機能をインストールする準備が整いました。

[次へ： ](install-web-sdk.md)

>[!NOTE]
>
>Adobe Experience Platform Web SDK の学習に時間を費やしていただき、ありがとうございます。 ご質問がある場合、一般的なフィードバックを共有する場合、将来のコンテンツに関する提案がある場合は、このページで共有します [Experience League コミュニティ ディスカッションの投稿](https://experienceleaguecommunities.adobe.com/t5/adobe-experience-platform-launch/tutorial-discussion-implement-adobe-experience-cloud-with-web/td-p/444996)
