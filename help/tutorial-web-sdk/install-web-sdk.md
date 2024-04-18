---
title: Adobe Experience Platform Web SDK タグ拡張機能のインストールと設定
description: データ収集インターフェイスで Platform Web SDK タグ拡張機能をインストールして設定する方法を説明します。 このレッスンは、Web SDK を使用したAdobe Experience Cloudの実装チュートリアルの一部です。
feature: Web SDK
exl-id: f30a44bb-99d7-476e-873a-b7802a0fe6aa
source-git-commit: 15bc08bdbdcb19f5b086267a6d94615cbfe1bac7
workflow-type: tm+mt
source-wordcount: '644'
ht-degree: 13%

---

# Adobe Experience Platform Web SDK タグ拡張機能のインストール


>[!CAUTION]
>
>このチュートリアルの大きな変更は、2024 年 4 月 23 日火曜日（PT）に公開される予定です。 その後、多くの演習が変更され、すべてのレッスンを完了するには、最初からチュートリアルを再開する必要が生じる場合があります。

データ収集インターフェイスで Platform Web SDK タグ拡張機能をインストールして設定する方法を説明します。 このタグ拡張機能は _唯一のタグ拡張機能_ データをに送信するために必要です _すべてのAdobe Experience Cloud アプリケーション_&#x200B;を含む [Analytics](setup-analytics.md), [ターゲット](setup-target.md), [Audience Manager](setup-audience-manager.md)Real-time Customer Data PlatformとJourney Optimizerだ！

## 学習目標

このレッスンを最後まで学習すると、以下の内容を習得できます。

* データ収集インターフェイスでのタグプロパティの作成
* Platform Web SDK タグ拡張機能のインストール
* 以前に作成したデータストリームの拡張機能へのマッピング

## 前提条件

このチュートリアルの前のレッスンを完了している必要があります。

* [権限の設定](configure-permissions.md)
* [XDM スキーマの設定](configure-schemas.md)
* [ID 名前空間の設定](configure-identities.md)
* [データストリームの設定](configure-datastream.md)

## Experience Platform Web SDK 拡張機能のインストール

### プロパティを追加

まず、タグプロパティが必要です。 プロパティは、web ページから詳細を収集して様々な場所に送信するために必要なすべての JavaScript、ルール、その他の機能のコンテナです。

チュートリアル用に新しいタグプロパティを作成します。

1. を開きます [データ収集インターフェイス](https://launch.adobe.com/){target="_blank"}
1. を選択 **[!UICONTROL タグ]** 左側のナビゲーションで
1. 「」を選択します **[!UICONTROL 新しいプロパティ]** ボタン
   ![新しいプロパティを追加](assets/websdk-property-addNewProperty.png)
1. として **[!UICONTROL 名前]**、と入力します `Web SDK Course` （会社の複数のユーザーがこのチュートリアルを受ける場合は、最後に名前を追加します）
1. として **[!UICONTROL ドメイン]**、と入力します `enablementadobe.com` （後述）
1. 「**[!UICONTROL 保存]**」を選択します
   ![プロパティの詳細](assets/websdk-property-propertyDetails.png)

## Web SDK 拡張機能の追加

これで、XDM スキーマ、データストリーム、タグプロパティが作成されたので、Platform Web SDK 拡張機能をインストールする準備が整いました。

1. 新しいタグプロパティを開きます
1. **[!UICONTROL 拡張機能]**／**[!UICONTROL カタログ]**&#x200B;に移動します。
1. `Adobe Experience Platform Web SDK` を検索します
1. を選択 **[!UICONTROL インストール]**

   ![Web SDK 拡張機能のインストール](assets/extension-platform-web-sdk.jpg)


## Platform Web SDK をデータストリームにリンクする

ほとんどの設定はデフォルトのままにし、必要に応じて後で更新します。 ここで行う必要があるのは、拡張機能をデータストリームにリンクすることです。

1. 次の下 **[!UICONTROL データストリーム]**&#x200B;を選択し、 **[!UICONTROL リストから選択]** 入力方法
1. 前に作成したデータストリームを選択します。 `Luma Web SDK`
1. 「**[!UICONTROL 保存]**」を選択します
   >[!NOTE]
   >
   > データストリームが見つからない場合は、 [データストリームの設定](configure-datastream.md) レッスンと手順に従って作成します

   ![データストリームの選択](assets/extension-luma-web-sdk-datastream-extension.png)

Platform Web SDK をインストールし、データストリームに関連付けたら、作成したスキーマを使用して、データ要素から XDM オブジェクトへのマッピングを開始します。

>[!NOTE]
>
>このチュートリアルでは、1 つのデータストリームのみを設定し、すべてのタグ環境（開発、ステージ、実稼動）に関連付けます。 Platform Web SDK を独自の web サイトに実装する場合は、環境ごとに個別のデータストリームを設定し、を使用してタグ環境にマッピングする必要があります **[!UICONTROL 入力方法]** > **[!UICONTROL 値を入力]**
>
>![データストリームの選択](assets/extension-luma-web-sdk-datastream-extension-enterValues.png)

>[!NOTE]
>
>で CNAME を設定していませんが [!UICONTROL Edge ドメイン] 設定このレッスンでは、Adobeの web サイトに Platform Web SDK を実装する際に CNAME を使用することをお勧めします。 CNAME 実装には Cookie の有効期間に関するメリットはありませんが、他にもメリットがある場合があります。これらのメリットには、広告ブロッカーや、データがトラッカーとして分類するドメインに送信されるのを防ぐ一般的でないブラウザーなどが含まれます。このような場合、CNAME を使用すると、これらのツールを使用しているユーザーのデータ収集が中断されるのを防ぐことができます。

拡張機能の各セクションについて詳しくは、を参照してください [Adobe Experience Platform Web SDK 拡張機能の設定](https://experienceleague.adobe.com/docs/experience-platform/edge/extension/web-sdk-extension-configuration.html?lang=ja)



[次へ： ](create-data-elements.md)

>[!NOTE]
>
>Adobe Experience Platform Web SDK の学習に時間を費やしていただき、ありがとうございます。 ご質問がある場合、一般的なフィードバックを共有する場合、将来のコンテンツに関する提案がある場合は、このページで共有します [Experience League コミュニティ ディスカッションの投稿](https://experienceleaguecommunities.adobe.com/t5/adobe-experience-platform-launch/tutorial-discussion-implement-adobe-experience-cloud-with-web/td-p/444996)
