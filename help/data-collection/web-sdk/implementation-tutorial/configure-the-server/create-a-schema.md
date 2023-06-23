---
title: スキーマの作成
description: スキーマの作成
role: Developer
level: Intermediate
recommendations: noDisplay,noCatalog
jira: KT-10447
hide: true
hidefromtoc: true
exl-id: 25d77367-046d-46bd-9640-60fbcea263da
source-git-commit: 90f7621536573f60ac6585404b1ac0e49cb08496
workflow-type: tm+mt
source-wordcount: '451'
ht-degree: 3%

---

# スキーマの作成

詳しくは、 [データの構造化](../structuring-your-data.md)に設定する場合、Adobe Experience Platformに送信するデータは XDM に存在する必要があります。 具体的には、データは _スキーマ_. スキーマとは、基本的に、データがどのように表示されるかを示すものです。 フィールドの名前と、データ内のどこに配置するかについて説明します。 また、各フィールドに必要な値のタイプ（例えば、ブール値、長さが 12 文字の文字列、数値の配列）についても説明します。

Adobe Experience Platformには、業界で共通のフィールドグループと呼ばれる、標準の構築ブロックがいくつか用意されています。 例えば、金融サービス業界では、残高移動や融資申し込みのためのフィールドグループが存在します。 旅行・接客業では、フライトや宿泊施設の予約を行うフィールドグループがあります。

スキーマを作成する際は、可能な限り組み込みのフィールドグループを使用することをお勧めします。 また、お客様自身の会社に固有のフィールドが必要な場合もあります。 このため、独自のカスタムフィールドグループを作成して、作成するスキーマ内で使用できます。

典型的な e コマース Web サイトのスキーマを作成します。

まず、 [!UICONTROL スキーマ] Adobe Experience Platform内で表示

![スキーマビュー](../../../assets/implementation-strategy/schemas-view.png)

選択 [!UICONTROL スキーマを作成] をクリックします。 メニューが表示されます。 選択 [!UICONTROL XDM ExperienceEvent].

この時点で、スキーマに追加するフィールドグループを尋ねるダイアログが表示されます。 最初に選択する必要があるフィールドグループは、 [!UICONTROL AEP Web SDK ExperienceEvent]. このフィールドグループは、Adobe Experience Platform Web SDK が自動的に収集するデータに対応する一連のフィールドを追加します。

![AEP Web SDK mixin](../../../assets/implementation-strategy/aep-web-sdk-mixin.png)

このチュートリアルの Web サイトは e コマース Web サイトなので、 [!UICONTROL コマースの詳細] フィールドグループを使用します。 このグループを使用すると、どの製品が表示され、買い物かごに追加され、購入されたなど、標準的なコマースデータを送信できます。

![コマースの詳細の Mixin](../../../assets/implementation-strategy/commerce-details-mixin.png)

次をクリック： [!UICONTROL フィールドグループを追加] ボタンをクリックします。 この時点で、スキーマの構造が表示されます。

![Mixin を含むスキーマ](../../../assets/implementation-strategy/schema-with-mixins.png)

追加したフィールドグループが左側に表示されます。 フィールドグループを選択すると、右側のフィールドがそのフィールドグループによって提供されます。 利用可能なフィールドを確認してください。

最後に、 [!UICONTROL 名称未設定のスキーマ] 画面の左側にある、画面の右側に名前と説明を入力し、 [!UICONTROL 保存].

![名前と説明を含むスキーマ](../../../assets/implementation-strategy/schema-name-description.png)

スキーマが作成されました。 次に、データを保持するデータセットを作成する方法を説明します。

スキーマの作成について詳しくは、 [スキーマの作成 (UI)](https://experienceleague.adobe.com/docs/experience-platform/xdm/tutorials/create-schema-ui.html?lang=ja).
