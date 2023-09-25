---
title: リアルタイム顧客プロファイルの有効化
seo-title: Enable Real-Time Customer Profiles | Getting Started with Adobe Experience Platform for Data Architects and Data Engineers
breadcrumb-title: リアルタイム顧客プロファイルの有効化
description: このレッスンでは、リアルタイム顧客プロファイルのスキーマとデータセットを有効にします。
role: Data Architect
feature: Profiles
jira: KT-4348
thumbnail: 4348-enable-profiles.jpg
exl-id: b05f1af1-a599-42f2-8546-77453a578b92
source-git-commit: 00ef0f40fb3d82f0c06428a35c0e402f46ab6774
workflow-type: tm+mt
source-wordcount: '1103'
ht-degree: 3%

---

# リアルタイム顧客プロファイルの有効化

<!-- 15min-->
このレッスンでは、リアルタイム顧客プロファイルのスキーマとデータセットを有効にします。

さて、データセットのレッスンはこのチュートリアルで最も短いレッスンだと言った時に嘘をつきました。これはより短い時間で済むはずです。 文字通りトグルを大きく変えるだけです しかし、これらのトグルを反転させると何が起こるかは、 _本当に_ 重要なので、1 ページ全体をそれに捧げたかったのです。

リアルタイム顧客プロファイルを使用すると、オンライン、オフライン、CRM、サードパーティデータなど、複数のチャネルのデータを組み合わせた、各顧客の全体像を確認できます。 プロファイルを使用すると、個別の顧客データを統合ビューに統合し、顧客のやり取りごとに実用的なタイムスタンプ付きの説明を提供できます。

他のすべての音と同様に、アクティブ化する必要はありません *すべてのデータ* （プロファイル用） 実際、アクティブ化の使用例に必要なデータのみを有効にする必要があります。 堅牢な顧客プロファイルへの迅速なアクセスが必要なマーケティングの使用例、コールセンター統合などに使用するデータを有効にします。 データを分析用にのみアップロードする場合は、プロファイルに対して有効にしないでください。

重要な点があります [リアルタイム顧客プロファイルデータのガードレール](https://experienceleague.adobe.com/docs/experience-platform/profile/guardrails.html?lang=en) プロファイルに対して有効にするデータを決定する際に確認する必要がある情報です。

<!--is this accurate. Are there other considerations to point out? -->

**データアーキテクト** このチュートリアル以外で、リアルタイム顧客プロファイルを有効にする必要があります。

演習を始める前に、次の短いビデオを見てリアルタイム顧客プロファイルの詳細を確認してください。
>[!VIDEO](https://video.tv.adobe.com/v/27251?learn=on)

## 必要な権限

Adobe Analytics の [権限の設定](configure-permissions.md) レッスンでは、このレッスンを完了するために必要なすべてのアクセス制御を設定します。


<!--* Permission items **[!UICONTROL Data Modeling]** > **[!UICONTROL View Schemas]** and **[!UICONTROL Manage Schemas]**
* Permission items **[!UICONTROL Data Management]** > **[!UICONTROL View Datasets]** and **[!UICONTROL Manage Datasets]**
* Permission item **[!UICONTROL Sandboxes]** > `Luma Tutorial`
* User-role access to the `Luma Tutorial Platform` product profile
* Developer-role access to the `Luma Tutorial Platform` product profile (for API)
-->

## Platform ユーザーインターフェイスを使用したリアルタイム顧客プロファイルのスキーマの有効化

まず、スキーマを有効にする簡単なタスクを見てみましょう。

1. Platform ユーザーインターフェイスで、 **Luma ロイヤリティスキーマ**
1. In **[!UICONTROL スキーマのプロパティ]**、切り替え **プロファイル** スイッチ
1. 確認モーダルで、 **[!UICONTROL 有効にする]** ボタンをクリック
1. を選択します。 **[!UICONTROL 保存]** ボタンをクリックして変更を保存します。

   >[!IMPORTANT]
   >
   >プロファイルに対してスキーマを有効にすると、無効にしたり削除したりすることはできません。 また、この時点以降は、フィールドをスキーマから削除できません。 実稼動環境で独自のデータを使用する際には、後で注意する必要があります。 このチュートリアルでは、開発用サンドボックスを使用する必要があります。開発用サンドボックスは、いつでも削除できます。
   >
   >このチュートリアルの制御環境で、プロファイルのスキーマとデータセットを有効にします。 _データを取り込む前に_. 独自のデータを使用する場合は、次の順序でおこなうことをお勧めします。
   >
   > 1. まず、データをデータセットに取り込みます。
   > 1. データ取り込みプロセス中に発生した問題（データ検証やマッピングの問題など）に対処します。
   > 1. プロファイルのデータセットとスキーマの有効化
   > 1. データの再取り込み


   ![プロファイル切り替え](assets/profile-loyalty-enableSchema.png)

簡単でしょ？ 上記の手順を、他のスキーマに対して繰り返します。

1. Luma 製品カタログスキーマ
1. Luma オフライン購入イベントスキーマ
1. Luma Web Events スキーマ（確認モーダルで、「このスキーマのデータは、identityMap フィールドにプライマリ ID を含みます」チェックボックスをオンにします）。

## Platform API を使用したリアルタイム顧客プロファイルのスキーマの有効化

次に、 `Luma CRM Schema` と API が同時に使用されます。 この演習をスキップし、ユーザーインターフェイスで有効にする場合は、先に進んでください。

### スキーマの meta:altId を取得します。

まず、 `meta:altId` の `Luma CRM Schema`:

1. オープン [!DNL Postman]
1. アクセストークンがない場合は、リクエストを開きます。 **[!DNL OAuth: Request Access Token]** を選択し、 **送信** をクリックして、 [!DNL Postman] レッスン。
1. リクエストを開く **[!DNL Schema Registry API > Schemas > Retrieve a list of schemas within the specified container.]**
1. を選択します。 **送信** ボタン
1. 200 件の応答が返されます
1. レスポンスで `Luma CRM Schema` 項目を選択し、 `meta:altId` 値
   ![meta:altId をコピーします。](assets/profile-crm-getMetaAltId.png)

### スキーマを有効にする

これで、スキーマの meta:altId が取得されたので、プロファイルに対して有効にできます。

1. リクエストを開く **[!DNL Schema Registry API > Schemas > Update one or more attributes of a custom schema specified by ID.]**
1. Adobe Analytics の **パラメーター** 貼り付け `meta:altId` の値を `SCHEMA_ID` パラメーター値
1. Adobe Analytics の **本文** 」タブに、次のコードを貼り付けます。

   ```json
   [{
       "op": "add",
       "path": "/meta:immutableTags",
       "value": ["union"]
   }]
   ```

1. を選択します。 **送信** ボタン
1. 200 件の応答が返されます

   ![SCHEMA_ID パラメーターとして使用するカスタム meta:altId を使用して、プロファイルの CRM スキーマを有効にします。](assets/profile-crm-enableProfile.png)

ユーザーインターフェイスで、5 つのスキーマすべてがプロファイルに対して有効になっていることを確認できます（確認するには、Shift キーを押しながらリロードする必要がある場合があります）。 `Luma CRM Schema` は有効です。
![すべてのスキーマが有効です](assets/profile-allSchemasEnabled.png)


## Platform ユーザーインターフェイスを使用したリアルタイム顧客プロファイルのデータセットの有効化

データセットはプロファイルに対しても有効にする必要があり、プロセスはさらに簡単です。

1. Platform ユーザーインターフェイスで、 `Luma Loyalty Dataset`
1. 切り替え **[!UICONTROL プロファイル]** スイッチ
1. 確認モーダルで、 **[!UICONTROL 有効にする]** ボタンをクリック

   ![ プロファイル切り替え](assets/profile-loyalty-enableDataset.png)

これらの他のデータセットに対して、上記の手順を繰り返します。

1. Luma 製品カタログデータセット
1. Luma オフライン購入イベントデータセット
1. Luma Web イベントデータセット

>[!NOTE]
>
>スキーマとは異なり、プロファイルからデータセットを無効にできますが、以前に取り込まれたデータはすべてプロファイルに残ります。

## Platform API を使用したリアルタイム顧客プロファイルのデータセットの有効化

次に、API を使用して、プロファイルのデータセットを有効にします。 上記の方法を使用してユーザーインターフェイスで有効にしたい場合も、それは問題ありません。

### データセットの ID を取得する

まず、 `id` の `Luma CRM Dataset`:

1. オープン [!DNL Postman]
1. アクセストークンがない場合は、リクエストを開きます。 **[!DNL OAuth: Request Access Token]** を選択し、 **送信** をクリックして、 [!DNL Postman] レッスン。
1. リクエストを開く **[!DNL Catalog Service API > Datasets > Retrieve a list of datasets.]**
1. を選択します。 **送信** ボタン
1. 200 件の応答が返されます
1. レスポンスで `Luma CRM Dataset` 項目を選択し、id をコピーします。
   ![ID をコピーする](assets/profile-crm-copyDatasetId.png)

### データセットの有効化

データセットの ID が揃ったので、プロファイルに対して有効にできます。

1. リクエストを開く **[!DNL Catalog Service API > Datasets > Update one or more attributes of a dataset specified by ID.]**
1. Adobe Analytics の **パラメーター** を更新します。 `DATASET_ID` 自分自身の価値
1. Adobe Analytics の **本文** 「 」タブに、次のコードを貼り付けます。 最初の 2 つの値は、前の応答で表示される既存のタグです。 追加する 2 つの新しいタグに加えて、本文に含める必要があります。

   ```json
   {
       "tags":{
           "adobe/pqs/table":["luma_crm_dataset"],
           "adobe/siphon/table/format":["parquet"],
           "unifiedProfile":["enabled:true"],
           "unifiedIdentity":["enabled:true"]
           }
   }
   ```

1. を選択します。 **送信** ボタン
1. 200 件の応答が返されます

   ![プロファイルの CRM データセットを有効にし、カスタムデータセット ID を DATASET_ID パラメーターとして使用するようにします。](assets/profile-crm-enableDataset.png)

また、ユーザーインターフェイスに有効なデータセットが表示されていることを確認することもできます。
![確認](assets/profile-crm-confirmEnabled.png)

>[!IMPORTANT]
>
> データを取り込んでからプロファイルのスキーマとデータセットを有効にした場合は、後でそのデータを再度取り込む必要があります。

## その他のリソース

* [リアルタイム顧客プロファイルドキュメント](https://experienceleague.adobe.com/docs/experience-platform/profile/home.html?lang=ja)
* [リアルタイム顧客プロファイル API リファレンス](https://www.adobe.io/experience-platform-apis/references/profile/)


**データエンジニア** は、 [データ取り込みイベントへのサブスクライブ](subscribe-to-data-ingestion-events.md) レッスン。
**データアーキテクト** _先に進む_ そして、 [バッチ取得レッスン](ingest-batch-data.md).
