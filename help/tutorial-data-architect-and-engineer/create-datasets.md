---
title: データセットの作成
seo-title: Create datasets | Getting Started with Adobe Experience Platform for Data Architects and Data Engineers
breadcrumb-title: データセットの作成
description: このレッスンでは、データを受け取るデータセットを作成します。
role: Data Architect, Data Engineer
feature: Data Management
jira: KT-4348
thumbnail: 4348-create-datasets.jpg
exl-id: 80227af7-4976-4fd2-b1d4-b26bc4626fa0
source-git-commit: 00ef0f40fb3d82f0c06428a35c0e402f46ab6774
workflow-type: tm+mt
source-wordcount: '547'
ht-degree: 9%

---

# データセットの作成

<!--15min-->

このレッスンでは、データを受け取るデータセットを作成します。 これがチュートリアルの最短のレッスンであることを知って、ワクワクするでしょう。

Adobe Experience Platformに正常に取り込まれたすべてのデータは、データレイクにデータセットとして保持されます。 データセットは、通常、スキーマ（列）とフィールド（行）を含むテーブルであるデータコレクションのストレージと管理をおこなう構成体です。データセットには、保存するデータの様々な側面を記述したメタデータも含まれます。

**データアーキテクト** は、このチュートリアル以外でデータセットを作成する必要があります。

演習を開始する前に、この短いビデオを視聴して、データセットの詳細を確認してください。
>[!VIDEO](https://video.tv.adobe.com/v/27269?learn=on)

## 必要な権限

[ 権限の設定 ](configure-permissions.md) レッスンでは、このレッスンを完了するために必要なすべてのアクセス制御を設定します。

<!--
* Permission items **[!UICONTROL Data Management]** > **[!UICONTROL View Datasets]** and **[!UICONTROL Manage Datasets]**
* Permission item **[!UICONTROL Sandboxes]** > `Luma Tutorial`
* User-role access to the `Luma Tutorial Platform` product profile
* Developer-role access to the `Luma Tutorial Platform` product profile (for API)
-->

## UI でのデータセットの作成

この演習では、UI でデータセットを作成します。 ロイヤルティデータから始めましょう。

1. Platform ユーザーインターフェイスの左ナビゲーションで **[!UICONTROL データセット]** に移動します
1. 「**[!UICONTROL データセットを作成]**」ボタンを選択します
   ![データセットの作成](assets/datasets-createDataset.png)

1. 次の画面で、「**スキーマからデータセットを作成**」を選択します
1. 次の画面で、`Luma Loyalty Schema` を選択し、「**[!UICONTROL 次へ]** ボタンを選択します
   ![ データセットの選択 ](assets/datasets-selectSchema.png)

1. データセットに「`Luma Loyalty Dataset`」という名前を付け、「**[!UICONTROL 完了]**」ボタンを選択します
   ![ データセットに名前を付ける ](assets/datasets-nameDataset.png)
1. データセットを保存すると、次のような画面が表示されます。
   ![ 作成されたデータセット ](assets/datasets-created.png)

これで作業は完了です。早いって言ったじゃん。 同じ手順を使用して、他のこれらのデータセットを作成します。

1. `Luma Offline Purchase Events Schema` の `Luma Offline Purchase Events Dataset`
1. `Luma Web Events Schema` の `Luma Web Events Dataset`
1. `Luma Product Catalog Schema` の `Luma Product Catalog Dataset`


## API を使用したデータセットの作成

次に、API を使用して `Luma CRM Dataset` を作成します。

>[!NOTE]
>
>API の演習をスキップし、ユーザーインターフェイスで `Luma CRM Dataset` を作成する場合は、問題ありません。 `Luma CRM Dataset` という名前を付け、`Luma CRM Schema` を使用します。

### データセットで使用されるスキーマの ID を取得します

まず、`Luma CRM Schema` の `$id` を取得する必要があります。

1. Open [!DNL Postman]
1. アクセストークンがない場合は、[!DNL Postman] のレッスンと同様に、リクエスト **[!DNL OAuth: Request Access Token]** を開き、「**送信**」を選択して新しいアクセストークンをリクエストします。
1. リクエスト **[!DNL Schema Registry API > Schemas > Retrieve a list of schemas within the specified container.]** を開きます。
1. 「**送信** ボタンを選択します
1. 200 の応答が返されます。
1. `Luma CRM Schema` 項目の応答を探し、`$id` の値をコピーします
   ![$id をコピーします ](assets/dataset-crm-getSchemaId.png)

### データセットの作成

これで、データセットを作成できます。

1. [ カタログサービス API.postman_collection.json](https://raw.githubusercontent.com/adobe/experience-platform-postman-samples/master/apis/experience-platform/Catalog%20Service%20API.postman_collection.json) を `Luma Tutorial Assets` フォルダーにダウンロードします。
1. コレクションの [!DNL Postman] への読み込み
1. リクエスト **[!DNL Catalog Service API > Datasets > Create a new dataset.]** を選択
1. 次をリクエストの **本文** として貼り付けます。***id 値を独自の値に置き換えます***。

   ```json
   {
       "name": "Luma CRM Dataset",
   
       "schemaRef": {
           "id": "REPLACE_WITH_YOUR_OWN_ID",
           "contentType": "application/vnd.adobe.xed-full+json;version=1"
       },
       "fileDescription": {
           "persisted": true,
           "containerFormat": "parquet",
           "format": "parquet"
       }
   }
   ```

1. 「**送信** ボタンを選択します
1. 新しいデータセットの ID を含んだ、201 Created レスポンスが得られます。
   ![API で作成されたデータセット。本文で使用するカスタム $id](assets/datasets-crm-created.png)

>[!TIP]
>
> このリクエストを行う際に発生する一般的な問題と、考えられる修正点は次のとおりです。
>
> * `400: There was a problem retrieving xdm schema`。上記のサンプルの ID を自分の `Luma CRM Schema` の ID に置き換えてください
> * 認証トークンがありません：**OAuth: リクエストアクセストークン** リクエストを実行して、新しいトークンを生成します
> * `401: Not Authorized to PUT/POST/PATCH/DELETE for this path : /global/schemas/`: **CONTAINER_ID** 環境変数を `global` から `tenant` に更新します
> * `403: PALM Access Denied. POST access is denied for this resource from access control`: Admin Consoleのユーザー権限を確認してください


Platform ユーザーインターフェイスの **[!UICONTROL データセット]** 画面に戻ると、5 つのデータセットすべてが正常に作成されたことを確認できます。
![5 つのデータセットが完了しました ](assets/datasets-allComplete.png)


## その他のリソース

* [ データセットドキュメント ](https://experienceleague.adobe.com/docs/experience-platform/catalog/datasets/overview.html?lang=ja)
* [ データセット API （カタログサービスの一部）リファレンス ](https://www.adobe.io/experience-platform-apis/references/catalog/#tag/Datasets)

これで、すべてのスキーマ、ID およびデータセットが用意されたので、[ リアルタイム顧客プロファイル用に有効にする ](enable-profiles.md) ことができます。
