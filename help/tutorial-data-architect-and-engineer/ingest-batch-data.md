---
title: バッチデータの取得
seo-title: Ingest batch data | Getting Started with Adobe Experience Platform for Data Architects and Data Engineers
breadcrumb-title: バッチデータの取得
description: このレッスンでは、様々な方法を使用して、バッチデータをExperience Platformに取り込みます。
role: Data Engineer
feature: Data Ingestion
jira: KT-4348
thumbnail: 4348-ingest-batch-data.jpg
exl-id: fc7db637-e191-4cc7-9eec-29f4922ae127
source-git-commit: d73f9b3eafb327783d6bfacaf4d57cf8881479f7
workflow-type: tm+mt
source-wordcount: '2446'
ht-degree: 0%

---

# バッチデータの取得

<!-- 1hr-->
このレッスンでは、様々な方法を使用して、バッチデータをExperience Platformに取り込みます。

バッチデータ取り込みでは、大量のデータを一度にAdobe Experience Platformに取り込むことができます。 Platform のインターフェイス内または API を使用して、1 回だけアップロードでバッチデータを取り込むことができます。 Source コネクタを使用して、クラウドストレージサービスなどのサードパーティサービスから、定期的にスケジュールされたバッチアップロードを設定することもできます。

**データエンジニア** は、このチュートリアル以外でバッチデータを取り込む必要があります。

演習を開始する前に、この短いビデオを視聴してデータ取り込みの詳細を確認してください。

>[!VIDEO](https://video.tv.adobe.com/v/27106?learn=on&enablevpops)


## 必要な権限

[ 権限の設定 ](configure-permissions.md) レッスンでは、このレッスンを完了するために必要なすべてのアクセス制御を設定します。

<!--
* Permission item **[!UICONTROL Data Management]** > **[!UICONTROL View Datasets]**, **[!UICONTROL Manage Datasets]** and **[!UICONTROL Data Monitoring]**
* Permission items **[!UICONTROL Data Ingestion]** > **[!UICONTROL View Sources]** and **[!UICONTROL Manage Sources]**
* Permission item **[!UICONTROL Profile Management]** > **[!UICONTROL View Profiles]**
* Permission item **[!UICONTROL Sandboxes]** > `Luma Tutorial`
* User-role access to the `Luma Tutorial Platform` product profile
* Developer-role access to the `Luma Tutorial Platform` product profile (for API)
-->

ソースの演習では、（S） FTP サーバーまたはクラウドストレージソリューションにアクセスする必要があります。 対応策がない場合は、次の手順に従います。

## Platform ユーザーインターフェイスを使用したデータのバッチ取り込み

データは、JSON および parquet 形式で、データセット画面のデータセットに直接アップロードできます。 これは、を作成した後に、一部のデータの取り込みをテストする優れた方法です。

### データのダウンロードと準備

最初に、サンプルデータを取得して、テナントに合わせてカスタマイズします。

>[!NOTE]
>
>[luma-data.zip](assets/luma-data.zip) ファイルに含まれるデータは架空のもので、デモ目的でのみ使用されます。

1. [luma-data.zip](assets/luma-data.zip) を **Luma チュートリアルAssets** フォルダーにダウンロードします。
1. ファイルを解凍し、`luma-data` というフォルダーを作成します。このフォルダーには、このレッスンで使用する 4 つのデータファイルが含まれています
1. テキストエディターで `luma-loyalty.json` を開き、`_techmarketingdemos` のすべてのインスタンスを、独自のスキーマのように、独自のアンダースコア – テナント ID に置き換えます。
   ![ アンダースコアのテナント ID](assets/ingestion-underscoreTenant.png)

1. 更新したファイルを保存します

### データの取り込み

1. Platform ユーザーインターフェイスの左側のナビゲーションで **[!UICONTROL データセット]** を選択します
1. `Luma Loyalty Dataset` を開きます
1. 下にスクロールして、右側の列に **[!UICONTROL データの追加]** セクションを表示します
1. `luma-loyalty.json` ファイルをアップロードします。
1. ファイルがアップロードされると、バッチの行が表示されます
1. 数分後にページを再読み込みすると、1,000 件のレコードと 1,000 件のプロファイルフラグメントを含むバッチが正常にアップロードされたことがわかります。

   ![ インジェスト ](assets/ingestion-loyalty-uploadJson.png)
   <!--do i need to explain error diagnostics and partial ingestion-->

>[!NOTE]
>
>このレッスンでは、様々な画面に表示される **[!UICONTROL エラー診断]** オプションと **[!UICONTROL 部分取り込み]** オプションがいくつかあります。 これらのオプションについては、このチュートリアルでは説明しません。 次に、いくつかのクイック情報を示します。
>
>* エラー診断を有効にすると、データの取り込みに関するデータが生成され、Data Access API を使用して確認できます。 詳しくは、[ ドキュメント ](https://experienceleague.adobe.com/docs/experience-platform/data-access/home.html) を参照してください。
>* 部分取り込みでは、エラーを含むデータを、指定できる特定のしきい値まで取り込むことができます。 詳しくは、ドキュメントを参照 [ てください ](https://experienceleague.adobe.com/docs/experience-platform/ingestion/batch/partial.html)

### データの検証

データが正常に取り込まれたことを確認する方法はいくつかあります。

#### Platform ユーザーインターフェイスでの検証

データがデータセットに取り込まれたことを確認するには、次の手順を実行します。

1. データを取り込んだのと同じページで、右上の「**[!UICONTROL データセットをプレビュー]**」ボタンを選択します
1. 「**プレビュー**」ボタンを選択すると、取り込んだデータの一部が表示されます。

   ![ 成功したデータセットのプレビュー ](assets/ingestion-loyalty-preview.png)


データがプロファイルに格納されたことを確認するには、次の手順を実行します（データが格納されるまで数分かかる場合があります）。

1. 左側のナビゲーションの **[!UICONTROL プロファイル]** に移動します
1. **[!UICONTROL ID 名前空間を選択]** フィールドの横にあるアイコンを選択して、モーダルを開きます
1. `Luma Loyalty Id` 名前空間を選択
1. 次に、データセットから `loyaltyId` のいずれかの値を入力します `5625458`
1. **[!UICONTROL 表示]** を選択します。
   ![ データセットからのプロファイルを確認 ](assets/ingestion-loyalty-profile.png)

#### データ取り込みイベントを使用した検証

前のレッスンでデータ取り込みイベントを購読している場合は、一意の webhook.site URL を確認します。 3 つのリクエストが次の順序で表示され、その間に時間が置かれ、次の `eventCode` 値が表示されます。

1. `ing_load_success` – 取り込まれたバッチ
1. `ig_load_success` - バッチが ID グラフに取り込まれました
1. `ps_load_success` - バッチがプロファイルサービスに取り込まれました

![ データ取得 Webhook](assets/ingestion-loyalty-webhook.png)

通知について詳しくは、[ ドキュメント ](https://experienceleague.adobe.com/docs/experience-platform/ingestion/quality/subscribe-events.html#available-status-notification-events) を参照してください。

## Platform API を使用したデータのバッチ取り込み

次に、API を使用してデータをアップロードします。

>[!NOTE]
>
>データアーキテクトは、ユーザーインターフェイスを使用して CRM データを自由にアップロードできます。

### データのダウンロードと準備

1. [luma-data.zip](assets/luma-data.zip) を既にダウンロードして、`Luma Tutorial Assets` フォルダーに解凍している必要があります。
2. テキストエディターで `luma-crm.json` を開き、`_techmarketingdemos` のすべてのインスタンスを、スキーマに表示される独自のアンダースコア – テナント id に置き換えます
3. 更新したファイルを保存します

### データセット ID の取得

まず、データを取り込むデータセットのデータセット ID を取得します。

1. Open [!DNL Postman]
1. アクセストークンがない場合は、[!DNL Postman] のレッスンと同様に、リクエスト **[!DNL OAuth: Request Access Token]** を開き、「**送信**」を選択して新しいアクセストークンをリクエストします。
1. 環境変数を開き、**CONTAINER_ID** の値がまだ `tenant` であることを確認します
1. リクエスト **[!DNL Catalog Service API > Datasets > Retrieve a list of datasets.]** を開き、「**送信**」を選択します。
1. `200 OK` しい応答が返されます
1. 応答本文から `Luma CRM Dataset` の ID をコピーします
   ![ データセット ID の取得 ](assets/ingestion-crm-getDatasetId.png)

### バッチの作成

これで、データセットにバッチを作成できます。

1. [ データ取得 API.postman_collection.json](https://raw.githubusercontent.com/adobe/experience-platform-postman-samples/master/apis/experience-platform/Data%20Ingestion%20API.postman_collection.json) を `Luma Tutorial Assets` フォルダーにダウンロードします
1. コレクションの [!DNL Postman] への読み込み
1. リクエスト **[!DNL Data Ingestion API > Batch Ingestion > Create a new batch in Catalog Service.]** を選択
1. 次をリクエストの **本文** として貼り付けます。***datasetId の値を独自の値に置き換えます***。

   ```json
   {
       "datasetId":"REPLACE_WITH_YOUR_OWN_DATASETID",
       "inputFormat": {
           "format": "json"
       }
   }
   ```

1. 「**送信** ボタンを選択します
1. 新しいバッチの ID を含んだ、201 Created レスポンスが得られます。
1. 新しいバッチの `id` をコピー
   ![ バッチが作成されました ](assets/ingestion-crm-createBatch.png)

### データの取り込み

データをバッチにアップロードできるようになりました。

1. リクエスト **[!DNL Data Ingestion API > Batch Ingestion > Upload a file to a dataset in a batch.]** を選択
1. 「**パラメーター**」タブで、データセット ID とバッチ ID をそれぞれのフィールドに入力します
1. 「**Params**」タブで、**filePath** として `luma-crm.json` と入力します
1. 「**本文**」タブで「**binary**」オプションを選択します。
1. ダウンロードした `luma-crm.json` をローカルの `Luma Tutorial Assets` フォルダーから選択します
1. **送信** を選択すると、応答本文に「1」が含まれる 200 OK の応答が返されます

   ![ データがアップロードされました ](assets/ingestion-crm-uploadFile.png)

この時点で、Platform ユーザーインターフェイスでバッチを見ると、「[!UICONTROL &#x200B; 読み込み中 &#x200B;]」ステータスであることがわかります。
![ バッチ読み込み ](assets/ingestion-crm-loading.png)

Batch API は複数のファイルをアップロードするためによく使用されるので、バッチが完了したら Platform に通知する必要があります。次の手順でこれを行います。

### バッチの完了

バッチを完了する手順は、次のとおりです。

1. リクエスト **[!DNL Data Ingestion API > Batch Ingestion > Finish uploading a file to a dataset in a batch.]** を選択
1. 「**パラメーター**」タブで、**アクション** として `COMPLETE` と入力します
1. 「**パラメーター**」タブで、バッチ ID を入力します。 データセット ID や filePath （存在する場合）について心配する必要はありません。
1. POST の URL が `https://platform.adobe.io/data/foundation/import/batches/:batchId?action=COMPLETE` であり、`datasetId` または `filePath` への不要な参照がないことを確認します
1. **送信** を選択すると、応答本文に「1」が含まれる 200 OK の応答が返されます

   ![ バッチ完了 ](assets/ingestion-crm-complete.png)

### データの検証

#### Platform ユーザーインターフェイスでの検証

ロイヤルティデータセットの場合と同様に、データが Platform ユーザーインターフェイスに表示されたことを検証します。

まず、バッチが、1,000 件のレコードが取り込まれたことを示していることを確認します。

![ バッチ成功 ](assets/ingestion-crm-success.png)

次に、データセットをプレビューを使用してバッチを確認します。

![ バッチプレビュー ](assets/ingestion-crm-preview.png)

最後に、`Luma CRM Id` 名前空間でプロファイルの 1 つを検索して（例：`b642b4217b34b1e8d3bd915fc65c4452`）、いずれかのプロファイルが作成されたことを確認します。

![ 取り込まれたプロファイル ](assets/ingestion-crm-profile.png)

ちょうど今起こったことに関して、一つ興味深い点を指摘したい。 その `Danny Wright` プロファイルを開きます。 プロファイルには、`Lumacrmid` と `Lumaloyaltyid` の両方があります。 `Luma Loyalty Schema` には、Luma ロイヤルティ ID と CRM ID の 2 つの ID フィールドが含まれていることに注意してください。 両方のデータセットをアップロードしたので、単一のプロファイルに結合しました。 ロイヤルティデータには `Daniel` が名で、自宅住所には「ニューヨーク市」が設定されているのに対して、CRM データには `Danny` が名、`Portland` が同じロイヤルティ ID を持つ顧客の自宅住所として設定されています。 最初の名前が結合ポリシーのレッスンで `Danny` と表示される理由に戻ります。

プロファイルが結合されました。

![ プロファイル結合 ](assets/ingestion-crm-profileLinkedIdentities.png)

#### データ取り込みイベントを使用した検証

前のレッスンでデータ取り込みイベントを購読している場合は、一意の webhook.site URL を確認します。 ロイヤルティデータと同様に、次の 3 つのリクエストが送信されます。

![ データ取得 Webhook](assets/ingestion-crm-webhook.png)

通知について詳しくは、[ ドキュメント ](https://experienceleague.adobe.com/docs/experience-platform/ingestion/quality/subscribe-events.html#available-status-notification-events) を参照してください。

## ワークフローでのデータの取り込み

データをアップロードする別の方法を見てみましょう。 ワークフロー機能を使用すると、XDM でまだモデル化されていない CSV データを取り込むことができます。

### データのダウンロードと準備

1. [luma-data.zip](assets/luma-data.zip) を既にダウンロードして、`Luma Tutorial Assets` フォルダーに解凍している必要があります。
1. 次の確認を行います `luma-products.csv`

### ワークフローの作成

次に、ワークフローを設定します。

1. 左側のナビゲーションで **[!UICONTROL ワークフロー]** に移動します
1. 「**[!UICONTROL CSV を XDM スキーマにマッピング]**」を選択し、「**[!UICONTROL 起動]**」ボタンを選択します
   ![ ワークフローの起動 ](assets/ingestion-products-launchWorkflow.png)
1. `Luma Product Catalog Dataset` を選択し、「**[!UICONTROL 次へ]** ボタンを選択します
   ![ データセットを選択 ](assets/ingestion-products-selectDataset.png)
1. ダウンロードした `luma-products.csv` ファイルを追加し、「**[!UICONTROL 次へ]**」ボタンを選択します
   ![ データセットを選択 ](assets/ingestion-products-selectData.png)
1. マッパーインターフェイスが表示され、ソースデータ（`luma-products.csv` ファイル内の列名の 1 つ）からターゲットスキーマの XDM フィールドにフィールドをマッピングできます。 この例では、列名はスキーマフィールド名に十分に近く、マッパーは適切なマッピングを自動検出できます。 マッパーが適切なフィールドを自動検出できなかった場合は、ターゲットフィールドの右側にあるアイコンを選択して、正しい XDM フィールドを選択します。 また、CSV から列の 1 つを取り込まない場合は、マッパーから行を削除できます。 マッパーの仕組みを理解するために、`luma-products.csv` の列見出しを変更したり、自由に再生したりできます。
1. 「**[!UICONTROL 終了]**」ボタンを選択します
   ![ データセットを選択 ](assets/ingestion-products-mapper.png)

### データの検証

バッチがアップロードされたら、データセットをプレビューして、アップロードを確認します。

`Luma Product SKU` は非人物の名前空間なので、製品 SKU のプロファイルは表示されません。

Webhook に 3 つのヒットが表示されます。

## ソースを含むデータの取り込み

まあ、君は物事を難しい方法でやった。 次に、約束された _自動バッチ取り込み_ の国に進みましょう。 私が「設定」と言うとき、 あなたは「忘れなさい」と言うでしょう。 「始めて！」 「忘れろ！」 「始めて！」 「忘れろ！」 冗談よ、そんなこと、絶対にしないわよ。 はい、仕事に戻りなさい。 もうすぐ終わりです。

左側のナビゲーションで **[!UICONTROL ソース]** に移動し、ソースカタログを開きます。 ここでは、業界をリードするデータおよびストレージプロバイダーとの様々な標準搭載の統合を確認できます。

![Source カタログ ](assets/ingestion-offline-sourceCatalog.png)

では、ソースコネクタを使用してデータを取り込みましょう。

この演習は、自分の冒険スタイルを選択します。 FTP ソースコネクタを使用したワークフローを表示します。 会社で使用している別のクラウドストレージソースコネクタを使用するか、ロイヤルティデータと同様に、データセット ユーザーインターフェイスを使用して json ファイルをアップロードできます。

多くのソースには同様の設定ワークフローがあり、次のような特徴があります。

1. 認証詳細を入力
1. 取得するデータを選択します
1. 取り込み先の Platform データセットを選択します
1. フィールドを XDM スキーマにマッピングします
1. その場所からデータを取得する頻度を選択します

>[!NOTE]
>
>この演習で使用するオフライン購入データには、日時データが含まれています。 日時データは、[ISO 8061 形式の文字列 ](https://www.iso.org/iso-8601-date-and-time-format.html) （&quot;2018-07-10T15:05:59.000-08:00&quot;）またはミリ秒単位の Unix 時間（1531263959000）で指定する必要があり、取り込み時にターゲット XDM タイプに変換されます。 データ変換およびその他の制約について詳しくは、[ バッチ取り込み API ドキュメント ](https://experienceleague.adobe.com/docs/experience-platform/ingestion/batch/api-overview.html#types) を参照してください。

### データをダウンロード、準備、目的のクラウドストレージベンダーにアップロードします。

1. [luma-data.zip](assets/luma-data.zip) を既にダウンロードして、`Luma Tutorial Assets` フォルダーに解凍している必要があります。
1. テキストエディターで `luma-offline-purchases.json` を開き、`_techmarketingdemos` のすべてのインスタンスを、スキーマに表示される独自のアンダースコア – テナント id に置き換えます
1. 先月にイベントが発生するようにすべてのタイムスタンプを更新します（例えば、`"timestamp":"2022-06` を検索して年と月を置き換える）
1. [!UICONTROL &#x200B; ソース &#x200B;] カタログで使用できることを確認して、希望するクラウドストレージプロバイダーを選択します
1. `luma-offline-purchases.json` を希望のクラウドストレージプロバイダーの場所にアップロードします

### 目的のクラウドストレージの場所にデータを取り込みます

1. Platform ユーザーインターフェイスで、[!UICONTROL Sources] カタログを **[!UICONTROL Cloud Storage]** にフィルタリングします
1. `...` の下にはドキュメントへの便利なリンクがあります
1. 目的のクラウドストレージベンダーのボックスで、「**[!UICONTROL 設定]**」ボタンを選択します
   ![ 設定を選択 ](assets/ingestion-offline-selectFTP.png)
1. **[!UICONTROL 認証]** は最初の手順です。 アカウントの名前（`Luma's FTP Account` や認証の詳細など）を入力します。 この手順は、すべてのクラウドストレージソースでほぼ同じですが、フィールドが若干異なる場合があります。 アカウントの認証の詳細を入力したら、同じアカウント内の他のファイルから異なるスケジュールで異なるデータを送信している可能性のある他のソース接続に対して、その詳細を再利用できます
1. 「**[!UICONTROL ソースに接続]**」ボタンを選択します。
1. Platform がSourceに正常に接続されたら、「**[!UICONTROL 次へ]**」ボタンを選択します
   ![ ソースに対する認証 ](assets/ingestion-offline-authentication.png)

1. **[!UICONTROL データを選択]** 手順で、ユーザーインターフェイスは資格情報を使用してクラウドストレージソリューション上のフォルダーを開きます
1. 取り込むファイルを選択します（例：`luma-offline-purchases.json`）。
1. **[!UICONTROL データ形式]** として、「`XDM JSON`」を選択します
1. その後、ファイルで JSON 構造とサンプルデータをプレビューできます
1. 「**[!UICONTROL 次へ]**」ボタンを選択します
   ![ データファイルを選択 ](assets/ingestion-offline-selectData.png)

1. **[!UICONTROL マッピング]** ステップで、`Luma Offline Purchase Events Dataset` を選択して「**[!UICONTROL 次へ]**」ボタンを選択します。 のメッセージでは、取り込むデータは JSON ファイルなので、ソースフィールドをターゲットフィールドにマッピングするマッピング手順はありません。 JSON データは、既に XDM 内にある必要があります。 CSV を取り込む場合、この手順の完全なマッピングユーザーインターフェイスが表示されます。
   ![ データセットを選択 ](assets/ingestion-offline-mapping.png)
1. **[!UICONTROL スケジュール]** ステップでは、Sourceからデータを取り込む頻度を選択します。 オプションを確認してください。 1 回限りの取り込みを行うので、**[!UICONTROL Frequency]** を **[!UICONTROL Once]** のままにして、「**[!UICONTROL 次へ]**」ボタンを選択します。
   ![ データフローのスケジュール設定 ](assets/ingestion-offline-scheduling.png)
1. **[!UICONTROL データフローの詳細]** ステップでは、データフローの名前の選択、オプションの説明の入力、エラー診断のオン、部分取り込みを行うことができます。 設定をそのままにし、「**[!UICONTROL 次へ]** ボタンを選択します。
   ![ データフローの詳細の編集 ](assets/ingestion-offline-detail.png)
1. **[!UICONTROL レビュー]** ステップでは、すべての設定をまとめて確認し、編集するか、「**[!UICONTROL 完了]**」ボタンを選択できます
1. 保存後、次のような画面が表示されます。
   ![ 完了 ](assets/ingestion-offline-complete.png)

### データの検証

バッチがアップロードされたら、データセットをプレビューして、アップロードを確認します。

Webhook に 3 つのヒットが表示されます。

`loyaltyId` 名前空間で値 `5625458` のプロファイルを再度検索して、プロファイルに購入イベントがあるかどうかを確認します。 1 つの購入が表示されます。 **[!UICONTROL JSON を表示]** を選択して、購入の詳細を調べることができます。

![ プロファイル内の購入イベント ](assets/ingestion-offline-eventInProfile.png)

## ETL ツール

Adobeは、複数の ETL ベンダーと提携して、Experience Platformへのデータ取り込みをサポートしています。 このチュートリアルでは、様々なサードパーティ・ベンダーにより ETL が取り上げられていますが、これらのリソースの一部を確認することは可能です。

* [Adobe Experience Platform用 ETL 統合の開発 ](https://experienceleague.adobe.com/docs/experience-platform/etl/home.html)
* [[!DNL Snaplogic] Adobe Experience Platformスナップパック ](https://www.snaplogic.com/resources/videos/august-2020-aep)

## その他のリソース

* [ バッチ取り込みのドキュメント ](https://experienceleague.adobe.com/docs/experience-platform/ingestion/batch/overview.html)
* [バッチ取り込み API リファレンス](https://developer.adobe.com/experience-platform-apis/references/batch-ingestion/)

次に、Web SDKを使用してデータを [ ストリーミングしましょう ](ingest-streaming-data.md)
