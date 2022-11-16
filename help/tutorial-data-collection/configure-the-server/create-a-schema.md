---
title: スキーマの作成
description: スキーマの作成
exl-id: 0256b358-0c2c-4c59-ab23-5fe0d38880d6
source-git-commit: cc7a77c4dd380ae1bc23dc75608e8e2224dfe78c
workflow-type: tm+mt
source-wordcount: '467'
ht-degree: 3%

---

# スキーマの作成

詳しくは、 [データの構造化](../structuring-your-data.md)に設定する場合、Adobe Experience Platformに送信するデータは XDM に存在する必要があります。 具体的には、データは _スキーマ_. スキーマとは、基本的に、データがどのように表示されるかを示すものです。 フィールドの名前と、データ内のどこに配置するかについて説明します。 また、各フィールドに必要な値のタイプ（例えば、ブール値、長さが 12 文字の文字列、数値の配列）についても説明します。

Adobe Experience Platformには、業界で共通のフィールドグループと呼ばれる、標準の構築ブロックがいくつか用意されています。 例えば、金融サービス業界では、残高移動や融資申し込みのためのフィールドグループが存在します。 旅行・接客業では、フライトや宿泊施設の予約を行うフィールドグループがあります。

スキーマを作成する際は、可能な限り組み込みのフィールドグループを使用することをお勧めします。 また、お客様自身の会社に固有のフィールドが必要な場合もあります。 このため、独自のカスタムフィールドグループを作成して、作成するスキーマ内で使用できます。

典型的な e コマース Web サイトのスキーマを作成します。

1. 選択 **[!UICONTROL スキーマ]** under [!UICONTROL データ管理] Adobe Experience Platformインターフェイスの左側のメニューから
1. 選択 **[!UICONTROL スキーマを作成]** 右上隅に、 **[!UICONTROL XDM ExperienceEvent]** をクリックします。

これで、スキーマビルダーキャンバスに移動しました。
![スキーマビュー](../assets/schemas-view.png)

## フィールドグループの追加

1. 内 **[!UICONTROL フィールドグループ]** の左側のセクション **[!UICONTROL 構造]** 領域で、 **[!UICONTROL +追加]** リンク。 この時点で、スキーマに追加するフィールドグループを選択するためのモーダルが表示されます。
1. まず、次の名前のフィールドグループを選択します。 **[!UICONTROL AEP Web SDK ExperienceEvent]**. このフィールドグループは、Adobe Experience Platform Web SDK が自動的に収集するデータに対応する一連のフィールドを追加します。
   ![AEP Web SDK mixin](../assets/aep-web-sdk-mixin.png)
1. 次に、このチュートリアルの Web サイトは e コマース Web サイトなので、 **[!UICONTROL コマースの詳細]** フィールドグループを使用します。 このフィールドグループを使用すると、表示されている製品、買い物かごに追加されている製品、購入などの標準的なコマースデータを送信できます。
1. を選択します。 **[!UICONTROL フィールドグループを追加]** ボタンをクリックします。
   ![コマースの詳細の Mixin](../assets/commerce-details-mixin.png)
1. この時点で、スキーマの構造が表示されます。
   ![Mixin を含むスキーマ](../assets/schema-with-mixins.png)

## スキーマの保存

1. 最後に、画面の右側に名前と説明を入力し、「 」を選択します。 **[!UICONTROL 保存]**.
   ![名前と説明を含むスキーマ](../assets/schema-name-description.png)

スキーマが作成されました。 次に、データを保存するデータセットの作成方法を説明します。

スキーマの作成について詳しくは、 [スキーマを作成](/help/platform/schemas/create-schemas.md).

[次へ： ](create-a-dataset.md)

>[!NOTE]
>
>データ収集に関する学習に時間を割いていただき、ありがとうございます。 ご質問がある場合、一般的なフィードバックを共有したい場合、または今後のコンテンツに関する提案がある場合は、こちらで共有してください [Experience Leagueコミュニティディスカッション投稿](https://experienceleaguecommunities.adobe.com/t5/adobe-experience-platform-launch/tutorial-discussion-use-adobe-experience-platform-data/m-p/543877)
