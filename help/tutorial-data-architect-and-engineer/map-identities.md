---
title: ID のマッピング
seo-title: Map identities | Getting Started with Adobe Experience Platform for Data Architects and Data Engineers
breadcrumb-title: ID のマッピング
description: このレッスンでは、ID 名前空間を作成し、スキーマに ID フィールドを追加します。
role: Data Architect
feature: Profiles
jira: KT-4348
thumbnail: 4348-map-identities.jpg
exl-id: e17ffabc-049c-42ff-bf0a-8cc31d665dfa
source-git-commit: 73645b8b088cfdfe6f256c187b3c510dcc2386fc
workflow-type: tm+mt
source-wordcount: '937'
ht-degree: 6%

---

# ID のマッピング

<!-- 30 min-->

このレッスンでは、ID 名前空間を作成し、スキーマに ID フィールドを追加します。 その後、前のレッスンからのスキーマ関係を完了することもできます。

Adobe Experience Platform ID サービスを利用すると、デバイスやシステム間で ID を橋渡しすることで、顧客とその行動をよりよく把握できます。これによって、インパクトのある個人的なデジタル体験をリアルタイムで提供できます。 ID フィールドと名前空間は、異なるデータソースを結合して 360 度リアルタイム顧客プロファイルを作成する接着剤です。

**データアーキテクト** は、このチュートリアル外で ID をマップする必要があります。

演習を開始する前に、この短いビデオを視聴して、Adobe Experience Platformでの ID について詳しく確認してください。
>[!VIDEO](https://video.tv.adobe.com/v/3422774?learn=on&enablevpops&captions=jpn)

>[!NOTE]
>
>ID フィールドは、リアルタイム顧客プロファイルを作成する場合にのみ必要です。 データをデータレイクに取り込むだけの場合、これらは必要ありません。

<!--explain identity maps-->
<!--explain the strategy behind the identity selection, how these identities will join all the data together-->

## 必要な権限

[ 権限の設定 ](configure-permissions.md) レッスンでは、このレッスンを完了するために必要なすべてのアクセス制御を設定します。

<!--
* Permission items **[!UICONTROL Identity Management]** > **[!UICONTROL View Identity Namespaces]** and **[!UICONTROL Manage Identity Namespaces]**
* Permission item **[!UICONTROL Data Modeling]** > **[!UICONTROL View Schemas]** and **[!UICONTROL Manage Schemas]**
* Permission item **[!UICONTROL Sandboxes]** > `Luma Tutorial`
* User-role access to the `Luma Tutorial Platform` product profile
* Developer-role access to the `Luma Tutorial Platform` product profile (for API)
-->

## ID 名前空間を作成

この演習では、Luma のカスタム ID 項目 ( `loyaltyId`、 `crmId`、 `productSku`) の ID 名前空間を作成します。 ID 名前空間は、同じ名前空間内の 2 つの一致する値により、2 つのデータソースで ID グラフを構成できるので、リアルタイム顧客プロファイルを作成するうえで重要な役割を果たします。


### UIでの作成名前空間

次に、Luma ロイヤリティスキーマの名前空間を作成して開始しましょう。

1. Platform ユーザー インターフェイスで、左側のナビゲーションの **[!UICONTROL ID]** に移動します。
1. すぐに使用できる ID 名前空間がいくつかあることがわかります。 「**[!UICONTROL ID 名前空間を作成]**」ボタンを選択します
1. 次のように詳細を入力します

   | フィールド | 値 |
   |---------------|-----------|
   | 表示名 | Luma ロイヤルティ Id |
   | ID シンボル | lumaLoyaltyId |
   | タイプ | クロスデバイス |

1. 「**[!UICONTROL 作成]**」を選択します。

   ![名前空間の作成](assets/identity-createNamespace.png)

次に、次の詳細を含む Luma 製品カタログスキーマ用に別の名前空間を設定します。

| フィールド | 値 |
|---------------|-----------|
| 表示名 | Luma 製品SKU |
| ID シンボル | lumaProductSKU |
| タイプ | 人物以外の識別子 |



## API を使用した IDサービス 名前空間作成

API を使用して CRM 名前空間を作成します。

>[!NOTE]
>
>APIの演習をスキップする場合は、次の詳細を使用して使用したユーザーインターフェイスメソッドを使用してCRM名前空間を作成する無償を感じてください。
>
> 1. **[!UICONTROL 表示名]** には、`Luma CRM Id`
> 1. **[!UICONTROL IDサービス記号として]**`lumaCrmId`
> 1. **[!UICONTROL 書式 ＜例外＞Photoshop のみ「テキスト」]** としては、クロスデバイス対応を使用します

ID 名前空間 `Luma CRM Id` を作成しましょう。

1. [Identity Service.postman_collection.json](https://raw.githubusercontent.com/adobe/experience-platform-postman-samples/master/apis/experience-platform/Identity%20Service.postman_collection.json) を `Luma Tutorial Assets` フォルダーにダウンロードします
1. コレクションの [!DNL Postman] への読み込み
1. アクセストークンがない場合は、リクエストフ **[!DNL OAuth: Request Access Token]** ールドを開いて「**送信**」を選択し、新しいアクセストークンをリクエストします。
1. リクエスト **[!UICONTROL ID サービス &#x200B;]/[!UICONTROL ID 名前空間 &#x200B;]/[!UICONTROL &#x200B; 新しい ID 名前空間の作成 &#x200B;] を選択します**。
1. 次をリクエストの [!DNL Body] として貼り付けます。

   ```json
   {
       "name": "Luma CRM Id",
       "code": "lumaCrmId",
       "idType": "Cross_device"
   }
   ```

1. **送信** ボタンを押すと、**200 OK**&#x200B;の応答が返されます。

   ![ID 名前空間](assets/identity-createUsingApi.png)

ユーザーインターフェイスに戻ると、次の 3 つの新しいカスタム名前空間が表示されます。
![IDサービス 名前空間 ](assets/identity-newIdentities.png)


## スキーマの ID フィールドラベル

名前空間ができたので、次のステップは、スキーマを更新して ID フィールドにラベルを付けることです。


### プライマリIDサービスのXDMフィールドラベル

Real-時間 Customer プロフィール で使用される各スキーマには、プライマリ ID を指定する必要があります。 また、取り込まれた各レコードには、そのフィールドの値が含まれている必要があります。

`Luma Loyalty Schema`にプライマリ ID を追加しましょう。

1. 開く `Luma Loyalty Schema`
1. このフィード内から投稿をモデ `Luma Identity profile field group`
1. `loyaltyId` フィールドを選択します
1. 「**[!UICONTROL ID]**」チェックボックスをオンにします
1. 「**[!UICONTROL プライマリ ID]**」ボックスもオンにします
1. **[!UICONTROL ID 名前空間]** ドロップダウンから `Luma Loyalty Id` 名前空間を選択します
1. 「**[!UICONTROL 適用]**」を選択します
1. 「**[!UICONTROL 保存]**」を選択します

   ![プライマリIDサービス ](assets/identity-loyalty-primary.png)

他のいくつかのスキーマについてもこのプロセスを繰り返します。

1. `Luma CRM Schema` で、`Luma CRM Id` 名前空間を使用して、`crmId` フィールドにプライマリ ID のラベルを付けます
1. `Luma Offline Purchase Events Schema` で、`Luma Loyalty Id` 名前空間を使用して、`loyaltyId` フィールドにプライマリ ID のラベルを付けます
1. `Luma Product Catalog Schema` で、`Luma Product SKU` 名前空間を使用して、`productSku` フィールドにプライマリ ID のラベルを付けます

>[!NOTE]
>
>Web SDK で収集されるデータ、スキーマ 内の ID フィールドにラベルを付ける一般的な方法の例外です。 SDK Web IDサービスマップを使用して *実装側* の ID にラベルを付けるため、Luma Web サイトで Web SDK 実装するときに `Luma Web Events Schema` の ID を決定します。 後のレッスンでは、Experience Cloud訪問者 ID(ECID)をプライマリ ID として収集し、crmId をセカンダリ ID として収集します。

プライマリ ID の選択により、どちらも loyaltyId を識別子として使用するため、`Luma Loyalty Schema` `Luma Offline Purchase Events Schema`に接続する方法が明確になります。しかし、CRMはどのようにしてオフライン購入イベントに接続できますか? オフライン購入をオンライン行動に関連付けるにはどうしたらよいか。 また、製品カタログで購入した製品をどのように分類できますか? 追加の ID フィールドとスキーマ関係を使用します。

<!--use a visual-->

### セカンダリIDサービスのラベルXDMフィールド

複数の ID フィールドをスキーマに追加できます。 プライマリ以外の ID は、多くの場合、セカンダリ ID と呼ばれます。 オフライン購入をオンライン行動に関連付けるために、crmIdをセカンダリ識別子として `Luma Loyalty Schema` に追加し、後でWebイベントデータに追加します。 `Luma Loyalty Schema`を更新しましょう。

1. 開く `Luma Loyalty Schema`
1. 選ぶ `Luma Identity Profile Field group`
1. `crmId`フィールドを選択
1. 「**[!UICONTROL ID]**」チェックボックスをオンにします
1. **[!UICONTROL ID 名前空間]** ドロップダウンから `Luma CRM Id` 名前空間を選択します
1. 「**[!UICONTROL 適用]**」を選択したあと、「**[!UICONTROL 保存]**」ボタンを選択して変更を保存します

   ![セカンダリID](assets/identity-loyalty-secondaryId.png)

## スキーマの関係の完了

ID フィールドにラベルが付けられたので、Luma の製品カタログと イベント スキーマ間のスキーマ関係の設定を完了できます。

1. `Luma Offline Purchase Events Schema` を開きます
1. 「**[!UICONTROL Commerceの詳細]**」フィールドグループを選択します
1. **[!UICONTROL productListItems]**/**[!UICONTROL SKU]** フィールドを選択します
1. 「**[!UICONTROL 関係]**」ボックスにチェックを入れます
1. **[!UICONTROL 参照スキーマ]** として「`Luma Product Catalog Schema`」を選択します
1. `Luma Product SKU` は、 **[!UICONTROL 参照IDサービス 名前空間]**
1. **[!UICONTROL を選択します適用]**
1. **[!UICONTROL を選択します保存]**

   ![参照フィールド](assets/identity-offlinePurchase-relationship.png)

このプロセスを繰り返して、 `Luma Web Events Schema` と `Luma Product Catalog Schema`の間に関係を作成します。

関係を定義した後は、スキーマ編集者の **[!UICONTROL 構成]** セクションと **[!UICONTROL 構造]** セクションの両方に示されることに注意してください。

![ スキーマエディターでの関係ビジュアライゼーション ](assets/identity-webEvents-relationship.png)

<!--need to verify that the relationship schema works-->

## その他のリソース

* [ID サービスドキュメント ](https://experienceleague.adobe.com/docs/experience-platform/identity/home.html?lang=ja)
* [ID サービス API](https://www.adobe.io/experience-platform-apis/references/identity-service/)

ID が用意されたので、「データセットを作成 [ できます ](create-datasets.md)。
