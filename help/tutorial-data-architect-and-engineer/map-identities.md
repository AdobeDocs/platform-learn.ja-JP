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
source-git-commit: 286c85aa88d44574f00ded67f0de8e0c945a153e
workflow-type: tm+mt
source-wordcount: '926'
ht-degree: 6%

---

# ID のマッピング

<!-- 30 min-->

このレッスンでは、ID 名前空間を作成し、スキーマに ID フィールドを追加します。 その後、前のレッスンからのスキーマ関係を完了することもできます。

Adobe Experience Platform ID サービスを利用すると、デバイスやシステム間で ID を橋渡しすることで、顧客とその行動をよりよく把握できます。これによって、インパクトのある個人的なデジタル体験をリアルタイムで提供できます。 ID フィールドと名前空間は、異なるデータソースを結合して 360 度リアルタイム顧客プロファイルを作成する接着剤です。

**データアーキテクト** は、このチュートリアル以外で ID をマッピングする必要があります。

演習を開始する前に、この短いビデオを視聴して、Adobe Experience Platformでの ID について詳しく確認してください。
>[!VIDEO](https://video.tv.adobe.com/v/27841?learn=on&enablevpops)

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

この演習では、Luma のカスタム ID フィールド、`loyaltyId`、`crmId`、`productSku` の ID 名前空間を作成します。 ID 名前空間は、同じ名前空間内の 2 つの一致する値により、2 つのデータソースで ID グラフを構成できるので、リアルタイム顧客プロファイルを作成するうえで重要な役割を果たします。


### UI での名前空間の作成

まず、Luma ロイヤルティスキーマの名前空間を作成します。

1. Platform ユーザーインターフェイスの左側のナビゲーションで、**[!UICONTROL ID]** に移動します
1. 標準提供の ID 名前空間がいくつか用意されています。 「**[!UICONTROL ID 名前空間を作成]**」ボタンを選択します
1. 次のように詳細を入力します

   | フィールド | 値 |
   |---------------|-----------|
   | 表示名 | Luma ロイヤルティ Id |
   | ID シンボル | lumaLoyaltyId |
   | タイプ | クロスデバイス |

1. 「**[!UICONTROL 作成]**」を選択します。

   ![名前空間の作成](assets/identity-createNamespace.png)

次に、次の詳細を使用して、Luma 製品カタログスキーマ用に別の名前空間を設定します。

| フィールド | 値 |
|---------------|-----------|
| 表示名 | Luma 製品 SKU |
| ID シンボル | lumaProductSKU |
| タイプ | 人物以外の識別子 |



## Api を使用した Id 名前空間の作成

API を使用して CRM 名前空間を作成します。

>[!NOTE]
>
>API の演習をスキップする場合は、以下の詳細と共に使用したユーザーインターフェイス方法を使用して、自由に CRM 名前空間を作成できます。
>
> 1. **[!UICONTROL 表示名]** として、`Luma CRM Id` を使用します
> 1. **[!UICONTROL ID シンボル]** として、`lumaCrmId` を使用します
> 1. **[!UICONTROL Type]** として、クロスデバイスを使用します

ID 名前空間 `Luma CRM Id` を作成しましょう。

1. [Identity Service.postman_collection.json](https://raw.githubusercontent.com/adobe/experience-platform-postman-samples/master/apis/experience-platform/Identity%20Service.postman_collection.json) を `Luma Tutorial Assets` フォルダーにダウンロードします
1. コレクションの [!DNL Postman] への読み込み
1. アクセストークンがない場合は、リクエストフ **[!DNL OAuth: Request Access Token]** ールドを開いて「**送信**」を選択し、新しいアクセストークンをリクエストします。
1. リクエスト **[!UICONTROL ID サービス ]/[!UICONTROL ID 名前空間 ]/[!UICONTROL  新しい ID 名前空間の作成 ] を選択します**。
1. 次をリクエストの [!DNL Body] として貼り付けます。

   ```json
   {
       "name": "Luma CRM Id",
       "code": "lumaCrmId",
       "idType": "Cross_device"
   }
   ```

1. **送信** ボタンを押すと、**200 OK** の応答が表示されます。

   ![ID 名前空間](assets/identity-createUsingApi.png)

ユーザーインターフェイスに戻ると、次の 3 つの新しいカスタム名前空間が表示されます。
![ID 名前空間 ](assets/identity-newIdentities.png)


## スキーマのラベル ID フィールド

これで名前空間が用意できたので、次の手順はスキーマを更新して ID フィールドにラベルを付けることです。


### プライマリ Id のラベル XDM フィールド

リアルタイム顧客プロファイルで使用する各スキーマには、プライマリ ID が指定されている必要があります。 取り込んだ各レコードには、そのフィールドの値が必要です。

`Luma Loyalty Schema` にプライマリ ID を追加しましょう。

1. `Luma Loyalty Schema` を開きます
1. `Luma Identity profile field group` を選択
1. `loyaltyId` フィールドを選択します
1. 「**[!UICONTROL ID]**」チェックボックスをオンにします
1. 「**[!UICONTROL プライマリ ID]**」ボックスもオンにします
1. **[!UICONTROL ID 名前空間]** ドロップダウンから `Luma Loyalty Id` 名前空間を選択します
1. 「**[!UICONTROL 適用]**」を選択します
1. 「**[!UICONTROL 保存]**」を選択します

   ![プライマリ ID ](assets/identity-loyalty-primary.png)

他のスキーマの一部に対して、このプロセスを繰り返します。

1. `Luma CRM Schema` で、`Luma CRM Id` 名前空間を使用して、`crmId` フィールドにプライマリ ID のラベルを付けます
1. `Luma Offline Purchase Events Schema` で、`Luma Loyalty Id` 名前空間を使用して、`loyaltyId` フィールドにプライマリ ID のラベルを付けます
1. `Luma Product Catalog Schema` で、`Luma Product SKU` 名前空間を使用して、`productSku` フィールドにプライマリ ID のラベルを付けます

>[!NOTE]
>
>Web SDKで収集されるデータは、スキーマ内の ID フィールドにラベルを付ける一般的な方法の例外です。 Web SDKは、ID マップを使用して *実装側* の ID にラベルを付けます。そのため、Luma web サイトに web SDKを実装する際に、`Luma Web Events Schema` の ID を決定します。 この後のレッスンでは、Experience Cloud訪問者 ID （ECID）をプライマリ ID として収集し、crmId をセカンダリ ID として収集します。

プライマリ ID を選択すると、両方とも `loyaltyId` を識別子として使用するの `Luma CRM Schema`、`Luma Offline Purchase Events Schema` にどのように接続できるかがわかります。 しかし、オフラインでの購入をオンライン行動と結び付けるにはどうすればよいでしょうか？ 製品カタログで購入した製品を分類するにはどうすればよいですか？ 追加の ID フィールドとスキーマ関係を使用します。

<!--use a visual-->

### セカンダリの Id のラベル XDM フィールド

1 つのスキーマに複数の ID フィールドを追加できます。 非プライマリ ID は、多くの場合、セカンダリ ID と呼ばれます。 オフラインでの購入をオンライン行動と結び付けるために、crmId を `Luma Loyalty Schema` ージのセカンダリ識別子として追加し、後で web イベントデータに追加します。 `Luma Loyalty Schema` を更新しましょう。

1. `Luma Loyalty Schema` を開きます
1. Select `Luma Identity Profile Field group`
1. フィールド `crmId` 選択
1. 「**[!UICONTROL ID]**」チェックボックスをオンにします
1. **[!UICONTROL ID 名前空間]** ドロップダウンから `Luma CRM Id` 名前空間を選択します
1. 「**[!UICONTROL 適用]**」を選択したあと、「**[!UICONTROL 保存]**」ボタンを選択して変更を保存します

   ![セカンダリID](assets/identity-loyalty-secondaryId.png)

## スキーマの関係の完了

これで、ID フィールドにラベルが付いたので、Luma の製品カタログとイベントスキーマの間のスキーマ関係の設定を完了できます。

1. `Luma Offline Purchase Events Schema` を開きます
1. 「**[!UICONTROL Commerceの詳細]**」フィールドグループを選択します
1. **[!UICONTROL productListItems]**/**[!UICONTROL SKU]** フィールドを選択します
1. 「**[!UICONTROL 関係]**」ボックスにチェックを入れます
1. **[!UICONTROL 参照スキーマ]** として「`Luma Product Catalog Schema`」を選択します
1. `Luma Product SKU` は、自動的に **[!UICONTROL 参照 ID 名前空間]** として入力されます
1. 「**[!UICONTROL 適用]**」を選択します
1. 「**[!UICONTROL 保存]**」を選択します

   ![ 参照フィールド ](assets/identity-offlinePurchase-relationship.png)

このプロセスを繰り返して、`Luma Web Events Schema` と `Luma Product Catalog Schema` の間に関係を作成します。

関係を定義すると、スキーマエディターの **[!UICONTROL 構成]** セクションと **[!UICONTROL 構造]** セクションの両方に示されます。

![ スキーマエディターでの関係ビジュアライゼーション ](assets/identity-webEvents-relationship.png)

<!--need to verify that the relationship schema works-->

## その他のリソース

* [ID サービスドキュメント ](https://experienceleague.adobe.com/docs/experience-platform/identity/home.html?lang=ja)
* [ID サービス API](https://www.adobe.io/experience-platform-apis/references/identity-service/)

ID が用意されたので、「データセットを作成 [ できます ](create-datasets.md)。
