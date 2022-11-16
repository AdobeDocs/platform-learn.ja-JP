---
title: ID 名前空間の設定
description: Adobe Experience Platform Web SDK で使用する ID 名前空間の設定方法について説明します。 このレッスンは、「 Adobe Experience Cloudと Web SDK の実装」チュートリアルの一部です。
feature: Identities
exl-id: 7719dff4-6b30-4fa0-acae-7491c3208f15
source-git-commit: cc7a77c4dd380ae1bc23dc75608e8e2224dfe78c
workflow-type: tm+mt
source-wordcount: '666'
ht-degree: 7%

---

# ID 名前空間の設定

Adobe Experience Platform Web SDK で使用する ID 名前空間の設定方法について説明します。

この [Adobe Experience Platform Identity Service](https://experienceleague.adobe.com/docs/id-service/using/home.html?lang=ja) は、ソリューション間でのオーディエンス共有などのExperience Cloud機能を強化するために、すべてのAdobeソリューションに共通の訪問者 ID を設定します。 また、クロスデバイスでのターゲティングを可能にし、顧客関係管理 (CRM) システムなど他のシステムとの統合を可能にするために、独自の顧客 ID をサービスに送信することもできます。

Web サイトで、Experience CloudAPI またはExperience CloudID サービスタグ拡張機能を通じて、既に Web サイト上で訪問者 ID サービスを使用していて、Adobe Experience Platform Web SDK への移行中に引き続き使用する場合は、訪問者 API の最新バージョンまたはExperience CloudID サービスタグ拡張を使用する必要があります。 詳しくは、 [ID の移行](https://experienceleague.adobe.com/docs/experience-platform/edge/identity/overview.html?lang=en) を参照してください。

>[!NOTE]
>
> デモ目的で、このレッスンでは、架空の顧客が [Luma デモサイト](https://luma.enablementadobe.com/content/luma/us/en.html) 資格情報を使用して、 **ユーザー：test@adobe.com /パスワード：テスト**. これらの手順を使用して、独自の目的で異なる ID を作成できますが、データ収集インターフェイスの ID マップの機能を学ぶには、まず ID の例を取り込むことをお勧めします。

## 学習内容

このレッスンを最後まで学習すると、以下の内容を習得できます。

* ID 名前空間について
* 内部 CRM ID を取り込むためのカスタム ID 名前空間の作成


## 前提条件

前のレッスンを既に完了していること。

* [権限の設定](configure-permissions.md)
* [スキーマを設定](configure-schemas.md)

>[!IMPORTANT]
>
>この [Experience CloudID 拡張](https://exchange.adobe.com/experiencecloud.details.100160.adobe-experience-cloud-id-launch-extension.html) は、Adobe Experience Platform Web SDK を実装する際には必要ありません。Web SDK JavaScript ライブラリには訪問者 ID サービス機能が含まれているからです。

## ID 名前空間の作成

この演習では、Luma のカスタム ID フィールドの ID 名前空間を作成します。 `lumaCrmId`. ID 名前空間は、同じ名前空間内の 2 つの一致する値によって 2 つのデータソースが ID グラフを形成できるので、リアルタイム顧客プロファイルの構築に重要な役割を果たします。

演習を始める前に、Adobe Experience Platformの ID の詳細については、以下の短いビデオをご覧ください。
>[!VIDEO](https://video.tv.adobe.com/v/27841?quality=12&learn=on)

次に、Luma CRM ID 用の名前空間を作成します。

1. を開きます。 [データ収集インターフェイス](https://launch.adobe.com/){target=&quot;_blank&quot;}
1. チュートリアルに使用するサンドボックスを選択します
1. 選択 **[!UICONTROL ID]** 左のナビゲーション
1. 選択 **[!UICONTROL 参照]**

   ID 名前空間のリストがページのメインインターフェイスに表示され、名前、ID 記号、最終更新日、および標準名前空間とカスタム名前空間のどちらであるかが示されます。 右側のレールには、ID グラフの強さに関する情報が含まれています。

1. 選択 **[!UICONTROL ID 名前空間を作成]**

   ![ID を表示](assets/configure-identities-screen.png)

1. 次のように詳細を入力し、「 」を選択します。 **[!UICONTROL 作成]**.

   | フィールド | 値 |
   |---------------|-----------|
   | 表示名 | Luma CRM ID |
   | ID シンボル | lumaCrmId |
   | タイプ | クロスデバイス ID |


   ![名前空間を作成](assets/identities-create-namespace.png)


   ID 名前空間が **[!UICONTROL ID]** 画面

   ![名前空間を作成](assets/configure-identities-namespace-lumaCrmId.png)


>[!INFO]
>
> 内 [データ要素の作成](create-data-elements.md) レッスンでは、ID を Platform Edge ネットワークに送信する際に、この名前空間を使用する方法を学びます。

## 実稼働用サンドボックスで ID 名前空間を作成する

Web SDK 拡張機能の現在の制限により、名前空間を使用して開発サンドボックスにデータを送信するには、ID 名前空間を実稼動サンドボックスでも作成する必要があります。 そのため、このチュートリアルで開発用サンドボックスを使用している場合は、 `Luma CRM ID` 名前空間を実稼動サンドボックスに追加します。

## その他のリソース

* [ID サービスドキュメント](https://experienceleague.adobe.com/docs/experience-platform/identity/home.html?lang=ja)
* [ID サービス API](https://www.adobe.io/experience-platform-apis/references/identity-service/)

ID が設定されたので、データストリームを設定できます。

[次へ： ](configure-datastream.md)

>[!NOTE]
>
>Adobe Experience Platform Web SDK の学習に時間を割いていただき、ありがとうございます。 ご質問がある場合、一般的なフィードバックを共有したい場合、または今後のコンテンツに関する提案がある場合は、こちらで共有してください [Experience Leagueコミュニティディスカッション投稿](https://experienceleaguecommunities.adobe.com/t5/adobe-experience-platform-launch/tutorial-discussion-implement-adobe-experience-cloud-with-web/td-p/444996)
