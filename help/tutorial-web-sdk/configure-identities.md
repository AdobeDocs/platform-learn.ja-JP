---
title: ID 名前空間の設定
description: Adobe Experience Platform Web SDK で使用する ID 名前空間を設定する方法について説明します。 このレッスンは、Web SDK を使用したAdobe Experience Cloudの実装チュートリアルの一部です。
feature: Web SDK,Tags,Identities
exl-id: 7719dff4-6b30-4fa0-acae-7491c3208f15
source-git-commit: 15bc08bdbdcb19f5b086267a6d94615cbfe1bac7
workflow-type: tm+mt
source-wordcount: '694'
ht-degree: 8%

---

# ID 名前空間の設定


>[!CAUTION]
>
>このチュートリアルの大きな変更は、2024 年 4 月 23 日火曜日（PT）に公開される予定です。 その後、多くの演習が変更され、すべてのレッスンを完了するには、最初からチュートリアルを再開する必要が生じる場合があります。

Adobe Experience Platform Web SDK で使用する ID 名前空間を設定する方法について説明します。

この [Adobe Experience Platform ID サービス](https://experienceleague.adobe.com/docs/id-service/using/home.html?lang=ja) は、すべてのAdobeソリューションにわたって共通の訪問者 ID を設定し、ソリューション間のオーディエンス共有などのExperience Cloud機能を強化します。 また、独自の顧客 ID をサービスに送信して、クロスデバイスターゲティングや、顧客関係管理（CRM）システムなどの他のシステムとの統合を有効にすることもできます。

Web サイトで、訪問者 API またはExperience CloudID サービスタグ拡張機能を通じて既にExperience CloudID サービスを使用している場合、Adobe Experience Platform Web SDK への移行中も引き続き使用するには、最新版の訪問者 API またはExperience CloudID サービスタグ拡張機能を使用する必要があります。 参照： [ID の移行](https://experienceleague.adobe.com/docs/experience-platform/edge/identity/overview.html?lang=en) を参照してください。

>[!NOTE]
>
> デモ目的で、このレッスンの演習では、にログインした架空の顧客の ID の詳細を取得します [Luma デモサイト](https://luma.enablementadobe.com/content/luma/us/en.html) 資格情報を使用して、 **ユーザー：test@adobe.com/パスワード：テスト**. これらの手順を使用して、異なる ID を独自の目的で作成できますが、データ収集インターフェイスの ID マップの機能を理解するには、最初に例の ID を取り込む手順に従うことをお勧めします。

## 学習目標

このレッスンを最後まで学習すると、以下の内容を習得できます。

* ID 名前空間について
* カスタム ID 名前空間を作成して内部 CRM ID をキャプチャします


## 前提条件

前のレッスンを完了している必要があります。

* [権限の設定](configure-permissions.md)
* [スキーマの設定](configure-schemas.md)

>[!IMPORTANT]
>
>この [Experience CloudID 拡張機能](https://exchange.adobe.com/experiencecloud.details.100160.adobe-experience-cloud-id-launch-extension.html) Web SDK JavaScript ライブラリには訪問者 ID サービス機能が含まれているので、Adobe Experience Platform Web SDK を実装する場合は必要ありません。

## ID 名前空間の作成

この演習では、Luma のカスタム ID フィールドの ID 名前空間を作成します。 `lumaCrmId`. ID 名前空間は、同じ名前空間内の 2 つの一致する値により、2 つのデータソースで ID グラフを構成できるので、リアルタイム顧客プロファイルを作成するうえで重要な役割を果たします。

演習を開始する前に、この短いビデオを視聴して、Adobe Experience Platformでの ID について詳しく確認してください。
>[!VIDEO](https://video.tv.adobe.com/v/27841?learn=on)

次に、Luma CRM ID の名前空間を作成します。

1. を開きます [データ収集インターフェイス](https://launch.adobe.com/){target="_blank"}
1. チュートリアルに使用するサンドボックスを選択します

   >[!NOTE]
   >
   >Real-Time CDPなどの Platform ベースのアプリケーションを使用している場合は、このチュートリアルで開発用サンドボックスを使用することをお勧めします。 そうでない場合は、 **[!UICONTROL Prod]** サンドボックス。

1. を選択 **[!UICONTROL ID]** 左側のナビゲーションで
1. を選択 **[!UICONTROL 参照]**

   ID 名前空間のリストがページのメインインターフェイスに表示され、名前、ID 記号、最終更新日および標準名前空間かカスタム名前空間かが示されます。 右側のパネルには、ID グラフの強度に関する情報が表示されます。

1. を選択 **[!UICONTROL ID 名前空間を作成]**

   ![ID の表示](assets/configure-identities-screen.png)

1. 以下のように詳細を入力して、選択します **[!UICONTROL 作成]**.

   | フィールド | 値 |
   |---------------|-----------|
   | 表示名 | Luma CRM ID |
   | ID シンボル | lumaCrmId |
   | タイプ | クロスデバイス ID |


   ![名前空間の作成](assets/identities-create-namespace.png)


   ID 名前空間はに入力されます **[!UICONTROL ID]** 画面。

   ![名前空間の作成](assets/configure-identities-namespace-lumaCrmId.png)


>[!INFO]
>
> が含まれる [データ要素の作成](create-data-elements.md) レッスンでは、Platform Edge Networkに ID を送信する際にこの名前空間を使用する方法を学びます。

## 実稼動サンドボックスでの ID 名前空間の作成

Web SDK 拡張機能の現在の制限により、名前空間を使用してデータを開発用サンドボックスに送信するには、ID 名前空間も実稼動サンドボックスで作成する必要があります。 したがって、このチュートリアルで開発用サンドボックスを使用している場合は、も作成してください。 `Luma CRM ID` 実稼動サンドボックスの名前空間。

## その他のリソース

* [ID サービスドキュメント](https://experienceleague.adobe.com/docs/experience-platform/identity/home.html?lang=ja)
* [ID サービス API](https://www.adobe.io/experience-platform-apis/references/identity-service/)

ID が配置されたので、データストリームを設定できます。

[次へ： ](configure-datastream.md)

>[!NOTE]
>
>Adobe Experience Platform Web SDK の学習に時間を費やしていただき、ありがとうございます。 ご質問がある場合、一般的なフィードバックを共有する場合、将来のコンテンツに関する提案がある場合は、このページで共有します [Experience League コミュニティ ディスカッションの投稿](https://experienceleaguecommunities.adobe.com/t5/adobe-experience-platform-launch/tutorial-discussion-implement-adobe-experience-cloud-with-web/td-p/444996)
