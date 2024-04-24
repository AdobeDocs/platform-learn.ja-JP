---
title: ID 名前空間の設定
description: Adobe Experience Platform Web SDK で使用する ID 名前空間を設定する方法について説明します。 このレッスンは、Web SDK を使用したAdobe Experience Cloudの実装チュートリアルの一部です。
feature: Web SDK,Identities
exl-id: 7719dff4-6b30-4fa0-acae-7491c3208f15
source-git-commit: aeff30f808fd65370b58eba69d24e658474a92d7
workflow-type: tm+mt
source-wordcount: '640'
ht-degree: 7%

---

# ID 名前空間の設定

Adobe Experience Platform Web SDK で使用する ID 名前空間を設定する方法について説明します。

この [Adobe Experience Cloud ID サービス](https://experienceleague.adobe.com/en/docs/id-service/using/home) は、SDK ベースのAdobeアプリケーション間で共通の訪問者 ID （ECID）を設定して、アプリケーション間のオーディエンス共有などのExperience Cloud機能を強化します。 また、独自の顧客 ID をサービスに送信して、クロスデバイスターゲティングや、顧客関係管理（CRM）システムなどの他のシステムとの統合を有効にすることもできます。

この [Adobe Experience Platform ID サービス](https://experienceleague.adobe.com/en/docs/experience-platform/identity/home) （はい、2 つあります。） では、ECID と顧客 ID を使用して ID グラフを生成し、属性と行動をリアルタイム顧客プロファイルに結合できるようにします。

>[!NOTE]
>
> デモ目的で、このレッスンの演習では、にログインした架空の顧客の ID の詳細を取得します [Luma デモサイト](https://luma.enablementadobe.com/content/luma/us/en.html) 資格情報を使用して、 **ユーザー： `test@adobe.com` / パスワード：テスト**.

## 学習目標

このレッスンを最後まで学習すると、以下の内容を習得できます。

* ID 名前空間について
* カスタム ID 名前空間を作成して内部 CRM ID をキャプチャします


## 前提条件

前のレッスンを完了している必要があります。

* [スキーマの設定](configure-schemas.md)

>[!IMPORTANT]
>
>この [Experience CloudID 拡張機能](https://exchange.adobe.com/experiencecloud.details.100160.adobe-experience-cloud-id-launch-extension.html) Web SDK JavaScript ライブラリには訪問者 ID サービス機能が含まれているので、Adobe Experience Platform Web SDK を実装する場合は必要ありません。
>
> Web サイトで、訪問者 API またはExperience CloudID サービスタグ拡張機能を通じて既にExperience CloudID サービスを使用している場合、Adobe Experience Platform Web SDK への移行中も引き続き使用するには、最新版の訪問者 API またはExperience CloudID サービスタグ拡張機能を使用する必要があります。 参照： [ID の移行](https://experienceleague.adobe.com/en/docs/experience-platform/edge/identity/overview) を参照してください。

## ID 名前空間の作成

この演習では、Luma のカスタム ID フィールドの ID 名前空間を作成します。 `lumaCrmId`. ID 名前空間は、同じ名前空間内の 2 つの一致する値により、2 つのデータソースで ID グラフを構成できるので、リアルタイム顧客プロファイルを作成するうえで重要な役割を果たします。

演習を開始する前に、この短いビデオを視聴して、Adobe Experience Platformでの ID について詳しく確認してください。

>[!VIDEO](https://video.tv.adobe.com/v/27841?learn=on)

次に、Luma CRM ID の名前空間を作成します。

1. を開きます [データ収集インターフェイス](https://launch.adobe.com/){target="_blank"}
1. チュートリアルに使用するサンドボックスを選択します

   >[!NOTE]
   >
   >Real-Time CDPやJourney Optimizerなどの Platform ベースのアプリケーションを使用している場合は、このチュートリアルで開発用サンドボックスを使用することをお勧めします。 そうでない場合は、 **[!UICONTROL Prod]** サンドボックス。

1. を選択 **[!UICONTROL ID]** 左側のナビゲーションで
1. を選択 **[!UICONTROL 参照]**

   ID 名前空間のリストがページのメインインターフェイスに表示され、名前、ID 記号、最終更新日および標準名前空間かカスタム名前空間かが示されます。 右側のパネルには、に関する情報が表示されます。 [!UICONTROL ID グラフの強度].

1. を選択 **[!UICONTROL ID 名前空間を作成]**

   ![ID の表示](assets/configure-identities-screen.png)

1. 以下のように詳細を入力して、選択します **[!UICONTROL 作成]**.

   | フィールド | 値 |
   |---------------|-----------|
   | 表示名 | Luma CRM ID |
   | ID シンボル | lumaCrmId |
   | タイプ | 個々のクロスデバイス ID |


   ![名前空間の作成](assets/identities-create-namespace.png)


   ID 名前空間はに入力されます **[!UICONTROL ID]** 画面。

   ![名前空間の作成](assets/configure-identities-namespace-lumaCrmId.png)


>[!NOTE]
>
> が含まれる [Id の作成](create-identities.md) レッスンでは、Platform Edge Networkに ID を送信する際にこの名前空間を使用する方法を学びます。

## 実稼動サンドボックスでの ID 名前空間の作成

Web SDK 拡張機能の現在の制限により、名前空間を使用してデータを開発用サンドボックスに送信するには、ID 名前空間も実稼動サンドボックスで作成する必要があります。 したがって、このチュートリアルで開発用サンドボックスを使用している場合は、も作成してください。 `Luma CRM ID` 実稼動サンドボックスの名前空間。

ID が配置されたので、データストリームを設定できます。

[次へ： ](configure-datastream.md)

>[!NOTE]
>
>Adobe Experience Platform Web SDK の学習に時間を費やしていただき、ありがとうございます。 ご質問がある場合、一般的なフィードバックを共有したい場合、または将来のコンテンツに関するご提案がある場合は、このページでお知らせください [Experience League コミュニティ ディスカッションの投稿](https://experienceleaguecommunities.adobe.com/t5/adobe-experience-platform-launch/tutorial-discussion-implement-adobe-experience-cloud-with-web/td-p/444996)
