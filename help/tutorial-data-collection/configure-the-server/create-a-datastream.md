---
title: データストリームの作成
description: データストリームの作成
exl-id: 4a33a7f3-8bd8-4d28-9ae4-a0609444485f
source-git-commit: cc7a77c4dd380ae1bc23dc75608e8e2224dfe78c
workflow-type: tm+mt
source-wordcount: '467'
ht-degree: 1%

---

# データストリームの作成

Platform Web SDK を使用して Web サイトから送信したデータは、と呼ばれる一連のAdobeサーバーに到達します。 [Adobe Experience Platform Edge Network](https://business.adobe.com/products/experience-platform/experience-platform-edge-network.html). このネットワークは、 [以前に作成したAdobe Experience Platformデータセット](create-a-schema.md) Adobe Experience Cloudのその他の製品 これらのAdobe製品は、Web ページにデータを返す場合もあります。 例えば、Edge Network は、Adobe Targetからパーソナライゼーションコンテンツを返す場合があります。

Edge Network がデータをシャトルするAdobe製品を設定するには、データストリームを作成する必要があります。 Edge Network は、Web ページからデータを受け取ると、作成したデータストリームを調べ、その設定を読み取り、適切なAdobe製品にデータを転送します。

![Datastream 製品設定](../assets/datastream-diagram.png)

1. データストリームを作成するには、まずデータ収集ユーザーインターフェイスに移動する必要があります。 Platform の右上隅で、 **[!UICONTROL アプリケーションピッカー]** を選択し、 **[!UICONTROL データ収集]** を選択します。
   ![データ収集メニュー](../assets/data-collection-menu.png)
1. データ収集インターフェイスが表示されたら、「 」を選択します。 **[!UICONTROL データストリーム]** をクリックし、 **[!UICONTROL 新規データストリーム]** 」ボタンを使用して設定できます。
1. データストリームの名前を入力し、 [以前に作成したスキーマ](create-a-schema.md) を **[!UICONTROL イベントデータセット]**&#x200B;を選択し、 **[!UICONTROL 保存]** （マッピングについては後述）。
   ![データストリーム名と説明](../assets/datastream-name-description.png)

## データストリームにサービスを追加

次の画面では、Web サイトから送信したデータを受け取るAdobe製品およびサービスを追加できます。

1. を選択します。 **[!UICONTROL サービスを追加]** コマンドを使用します。 このチュートリアルの目的では、Adobe Experience Platformのみを有効にし、 [以前に作成したデータセット](create-a-dataset.md) を選択し、 **[!UICONTROL 保存]** をクリックします。 データストリームが作成されました。
   ![Datastream 製品設定](../assets/datastream-product-configuration.png)

## データストリーム環境

通常、会社には、Web サイトの更新に関するプロモーションパスがあります。 会社の担当者（変更に応じて、マーケターまたはエンジニア）は、通常、そのユーザーのみが使用している開発環境で変更をテストします。 変更が快適に行われると、変更はステージング環境に昇格され、さらにテストが実施されます。 最後に、変更はユーザーに表示される実稼動用 Web サイトに公開されます。 データストリームは、このプロモーションパターンをサポートします。

リアルタイム CDP、Journey Optimizer、Customer Journey Analyticsなどのプラットフォームベースのアプリケーションをサポートしている場合は、これらの環境に対応する個別の Platform サンドボックスに、追加のデータストリームを作成する必要があります。

Platform のユーザーでない場合は、1 つのサンドボックスで複数のデータストリームを作成し、データストリームコピー機能を使用して設定を複製できます。

これで、サーバーは Web ページからデータを受け取るように完全に設定されました。

[次へ： ](../configure-the-client/whats-a-data-layer.md)

>[!NOTE]
>
>データ収集に関する学習に時間を割いていただき、ありがとうございます。 ご質問がある場合、一般的なフィードバックを共有したい場合、または今後のコンテンツに関する提案がある場合は、こちらで共有してください [Experience Leagueコミュニティディスカッション投稿](https://experienceleaguecommunities.adobe.com/t5/adobe-experience-platform-launch/tutorial-discussion-use-adobe-experience-platform-data/m-p/543877)
