---
title: ID 名前空間の設定
description: Adobe Experience Platform Web SDK で使用する ID 名前空間の設定方法について説明します。 このレッスンは、「 Adobe Experience Cloudと Web SDK の実装」チュートリアルの一部です。
feature: Web SDK,Identities
source-git-commit: ef3d374f800905c49cefba539c1ac16ee88c688b
workflow-type: tm+mt
source-wordcount: '640'
ht-degree: 7%

---

# ID 名前空間の設定

Adobe Experience Platform Web SDK で使用する ID 名前空間の設定方法について説明します。

The [Adobe Experience Cloud Identity Service](https://experienceleague.adobe.com/docs/id-service/using/home.html?lang=ja) は、アプリケーション間でのオーディエンス共有などのExperience Cloud機能を強化するために、SDK ベースのAdobeアプリケーション間で共通の訪問者 ID(ECID) を設定します。 また、クロスデバイスでのターゲティングを可能にし、顧客関係管理 (CRM) システムなど他のシステムとの統合を可能にするために、独自の顧客 ID をサービスに送信することもできます。

The [Adobe Experience Platform Identity Service](https://experienceleague.adobe.com/docs/experience-platform/identity/home.html?lang=ja) （はい、2 人です！） は、ECID と顧客 ID を使用して ID グラフを生成し、属性と行動をリアルタイム顧客プロファイルに結合できます。



>[!NOTE]
>
> デモ目的で、このレッスンでは、架空の顧客が [Luma デモサイト](https://luma.enablementadobe.com/content/luma/us/en.html) 資格情報を使用して、 **ユーザー： `test@adobe.com` / password: test**.

## 学習内容

このレッスンを最後まで学習すると、以下の内容を習得できます。

* ID 名前空間について
* 内部 CRM ID を取り込むためのカスタム ID 名前空間の作成


## 前提条件

前のレッスンを既に完了していること。

* [スキーマを設定](configure-schemas.md)

>[!IMPORTANT]
>
>The [Experience CloudID 拡張](https://exchange.adobe.com/experiencecloud.details.100160.adobe-experience-cloud-id-launch-extension.html) は、Adobe Experience Platform Web SDK を実装する際には必要ありません。Web SDK JavaScript ライブラリには訪問者 ID サービス機能が含まれているからです。
>
> Web サイトで、Experience CloudAPI またはExperience CloudID サービスタグ拡張機能を通じて、既に Web サイト上で訪問者 ID サービスを使用していて、Adobe Experience Platform Web SDK への移行中に引き続き使用する場合は、訪問者 API の最新バージョンまたはExperience CloudID サービスタグ拡張を使用する必要があります。 詳しくは、 [ID の移行](https://experienceleague.adobe.com/docs/experience-platform/edge/identity/overview.html?lang=en) を参照してください。

## ID 名前空間の作成

この演習では、Luma のカスタム ID フィールドの ID 名前空間を作成します。 `lumaCrmId`. ID 名前空間は、同じ名前空間内の 2 つの一致する値により、2 つのデータソースで ID グラフを構成できるので、リアルタイム顧客プロファイルを作成するうえで重要な役割を果たします。

演習を始める前に、Adobe Experience Platformの ID の詳細については、以下の短いビデオをご覧ください。

>[!VIDEO](https://video.tv.adobe.com/v/27841?learn=on)

次に、Luma CRM ID 用の名前空間を作成します。

1. を開きます。 [データ収集インターフェイス](https://launch.adobe.com/){target="_blank"}
1. チュートリアルに使用するサンドボックスを選択します

   >[!NOTE]
   >
   >Real-Time CDPやJourney Optimizerなどの Platform ベースのアプリケーションをご利用の場合は、このチュートリアルで開発用サンドボックスを使用することをお勧めします。 そうでない場合は、 **[!UICONTROL Prod]** サンドボックス。

1. 選択 **[!UICONTROL ID]** 左のナビゲーションで
1. 選択 **[!UICONTROL 参照]**

   ID 名前空間のリストがページのメインインターフェイスに表示され、名前、ID 記号、最終更新日、および標準名前空間とカスタム名前空間のどちらであるかが示されます。 右側のレールには、 [!UICONTROL ID グラフの強さ].

1. 選択 **[!UICONTROL ID 名前空間を作成]**

   ![ID を表示](assets/configure-identities-screen.png)

1. 次のように詳細を入力し、「 」を選択します。 **[!UICONTROL 作成]**.

   | フィールド | 値 |
   |---------------|-----------|
   | 表示名 | Luma CRM ID |
   | ID シンボル | lumaCrmId |
   | タイプ | 個々のクロスデバイス ID |


   ![名前空間の作成](assets/identities-create-namespace.png)


   ID 名前空間が **[!UICONTROL ID]** 画面。

   ![名前空間の作成](assets/configure-identities-namespace-lumaCrmId.png)


>[!NOTE]
>
> Adobe Analytics の [ID を作成](create-identities.md) レッスンでは、ID を Platform Edge ネットワークに送信する際に、この名前空間を使用する方法を学びます。

## 実稼働用サンドボックスで ID 名前空間を作成する

Web SDK 拡張機能の現在の制限により、名前空間を使用して開発サンドボックスにデータを送信するには、ID 名前空間を実稼動サンドボックスでも作成する必要があります。 そのため、このチュートリアルで開発用サンドボックスを使用している場合は、 `Luma CRM ID` 名前空間を実稼動サンドボックスに追加します。

ID が設定されたので、データストリームを設定できます。

[次へ： ](configure-datastream.md)

>[!NOTE]
>
>Adobe Experience Platform Web SDK の学習に時間を割いていただき、ありがとうございます。 ご質問がある場合、一般的なフィードバックを共有したい場合、または今後のコンテンツに関する提案がある場合は、こちらで共有してください [Experience Leagueコミュニティディスカッション投稿](https://experienceleaguecommunities.adobe.com/t5/adobe-experience-platform-launch/tutorial-discussion-implement-adobe-experience-cloud-with-web/td-p/444996)
