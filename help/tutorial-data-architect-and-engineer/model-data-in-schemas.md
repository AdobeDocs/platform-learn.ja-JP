---
title: スキーマのモデルデータ
seo-title: Model data in schemas | Getting Started with Adobe Experience Platform for Data Architects and Data Engineers
breadcrumb-title: スキーマのモデルデータ
description: このレッスンでは、Luma のデータをスキーマにモデル化します。 これはチュートリアルで最も長いレッスンの 1 つなので、水を飲んでバックルを締めてください。
role: Data Architect
feature: Schemas
jira: KT-4348
thumbnail: 4348-model-data-in-schemas.jpg
exl-id: 317f1c39-7f76-4074-a246-ef19f044cb85
source-git-commit: 8e470d8a0c9fee7389ac60a743431fe81012fa0f
workflow-type: tm+mt
source-wordcount: '2619'
ht-degree: 7%

---

# スキーマのモデルデータ

<!-- 60min -->
このレッスンでは、Luma のデータをスキーマにモデル化します。 これはチュートリアルで最も長いレッスンの 1 つなので、水を飲んでバックルを締めてください。

標準化と相互運用性は、Adobe Experience Platform の背後にある重要な概念です。エクスペリエンスデータモデル（XDM）は、顧客体験データを標準化し、顧客体験管理のスキーマを定義する取り組みです。

XDM は、デジタルエクスペリエンスを強化するために設計され、公式に文書化された仕様です。Platform サービスとの通信に使用するあらゆるアプリケーションに共通の構造と定義を提供します。XDM 標準に準拠することで、すべての顧客体験データを共通の表現に組み込み、より迅速かつ統合的な方法でインサイトを得ることができます。顧客のアクションから貴重なインサイトを得たり、セグメントを使用して顧客のオーディエンスを定義したり、パーソナライゼーションを目的として顧客属性を表すことができます。

XDM は、Experience Platform が提供する Adobe Experience Cloud が、適切なタイミングに、適切なチャネル経由で、適切な相手へと適切なメッセージを届けることを可能にする、基本的なフレームワークです。Experience Platform の基礎となる **XDM システム**&#x200B;は、エクスペリエンスデータモデルスキーマを Platform サービスで操作できるようにします。

<!--
This seems too lengthy. The video should suffice

Key terms:

* **Schema**: a representation of your data. A schema is comprised of a class and optional field groups and is used to create datasets. A schema includes behavioral attributes, timestamp, identity, attribute definitions, and relationships.
* **XDM Profile Class**: a common schema class used to represent record data
* **XDM ExperienceEvent Class**: a common schema class used to represent time-series data
* **Field group**: allows users to extend reusable fields that contain variables defining one or more attribute intended to be included in a schema or added to a class.
* **Standard Field group**: an open-source Field group built to conform to common industry standards, used to accelerate implementation and support repeatable services operating on the data
* **Data type**: a reusable object with properties in a hierarchical representation. These can be standard types or custom-defined defined types to describe your own data in your own way (for example, a collection of fields that you use to describe your products). Unlike Field groups, data types can be used in schemas regardless of the class.
* **Field**: a field is the lowest level element of a schema. Each field has a name for referencing and a type to identify the type of data that it contains. Field types can include, integer, number, string, Boolean and schema.
-->

**データアーキテクト** このチュートリアル以外でスキーマを作成する必要がありますが、 **データエンジニア** は、データアーキテクトが作成したスキーマと緊密に連携します。

演習を開始する前に、この短いビデオを視聴して、スキーマと Experience Data Model （XDM）について詳しく学びます。
>[!VIDEO](https://video.tv.adobe.com/v/27105?learn=on)

>[!TIP]
>
> Experience Platformでのデータモデリングについて詳しくは、コースを受講することをお勧めします [XDM を使用したカスタマーエクスペリエンスデータのモデル化](https://experienceleague.adobe.com/?recommended=ExperiencePlatform-D-1-2021.1.xdm&amp;lang=ja)、Experience Leagueで無償で利用可能

## 必要な権限

が含まれる [権限の設定](configure-permissions.md) レッスンでは、このレッスンを完了するために必要なすべてのアクセス コントロールを設定します。

<!--, specifically:

* Permission items **[!UICONTROL Data Modeling]** > **[!UICONTROL View Schemas]** and **[!UICONTROL Manage Schemas]**
* Permission item **[!UICONTROL Sandboxes]** > `Luma Tutorial`
* User-role access to the `Luma Tutorial Platform` product profile
* Developer-role access to the `Luma Tutorial Platform` product profile (for API)-->


<!--
## Luma's goals
-->

## UI を使用したロイヤルティスキーマの作成

この演習では、Luma のロイヤルティデータのスキーマを作成します。

1. Platform ユーザーインターフェイスに移動し、サンドボックスが選択されていることを確認します。
1. に移動 **[!UICONTROL スキーマ]** 左側のナビゲーションの
1. 「」を選択します **[!UICONTROL スキーマを作成]** 右上のボタン。
   ![OOTB フィールドグループを含むスキーマ](assets/schemas-loyaltyCreateSchema.png)

1. スキーマを作成ワークフローで、を選択します。 **[!UICONTROL 個人プロファイル]** 個々の顧客の属性（ポイント、ステータスなど）をモデリングするので、スキーマの基本クラスとして使用します。
1. 「**[!UICONTROL 次へ]**」を選択します。
   ![基本クラスを選択](assets/schemas-loyaltySelectBaseClass.png)

1. Enter `Luma Loyalty Schema` が含まれる **[!UICONTROL スキーマの表示名]** テキストフィールド。 以下のキャンバスでは、選択したクラスによって提供されるベーススキーマ構造を確認および検証することもできます。
1. を選択 **[!UICONTROL 終了]** スキーマを作成します。
   ![ロイヤルティスキーマの作成を完了します](assets/schemas-loyaltyFinishSchemaCreation.png)

### 標準フィールドグループの追加

スキーマが作成されると、スキーマエディターにリダイレクトされ、スキーマにフィールドを追加できるようになります。 個々のフィールドをスキーマに直接追加したり、フィールドグループを使用したりできます。 個々のフィールドはすべて、引き続きクラスまたはフィールドグループに関連付けられています。 Adobeが提供する業界標準のフィールドグループの大規模なセットから選択するか、独自のフィールドグループを作成できます。 Adobeで独自のデータのモデリングを開始する際には、Experience Platformが提供する業界標準のフィールドグループに慣れておくとよいでしょう。 これらは顧客 AI、Attribution AI、Adobe Analyticsなどのダウンストリームサービスを強化する場合があるので、可能な限り使用することをお勧めします。

独自のデータを操作する際に重要な手順は、Platform で取得する独自のデータはどれか、およびそのデータをどのようにモデル化するかを決定することです。 この大きなトピックについては、このコースで詳しく説明します [XDM を使用したカスタマーエクスペリエンスデータのモデル化](https://experienceleague.adobe.com/?recommended=ExperiencePlatform-D-1-2021.1.xdm&amp;lang=ja). このチュートリアルでは、事前に決定されたスキーマの実装について説明します。

フィールドグループを追加するには：

1. を選択 **[!UICONTROL 追加]** の下 **[!UICONTROL フィールドグループ]** 見出し。
   ![新しいフィールドグループを追加](assets/schemas-loyalty-addFieldGroup.png)
1. が含まれる **[!UICONTROL フィールドグループの追加]** モーダルで、次のフィールドグループを選択します。
   1. **[!UICONTROL 人口統計の詳細]** 名前や生年月日などの基本的な顧客データ
   1. **[!UICONTROL 個人の連絡先の詳細]** メールアドレスや電話番号などの基本的な連絡先の詳細
1. 行の右側にあるアイコンを選択すると、フィールドグループに追加されたフィールドをプレビューできます。
   ![標準フィールドグループの選択](assets/schemas-loyalty-addFirstTwoFieldGroups.png)

1. を確認します **[!UICONTROL 業種]** > **[!UICONTROL 小売]** 業界固有のフィールドグループを公開するボックス。
1. を選択 **[!UICONTROL ロイヤルティの詳細]** に移動して、ロイヤルティプログラム フィールドを追加します。
1. を選択 **[!UICONTROL フィールドグループの追加]** 3 つのフィールドグループをすべてスキーマに追加します。
   ![標準フィールドグループをロイヤルティスキーマに追加](assets/schemas-loyalty-saveOotbMixins.png)


ここで、スキーマの現在の状態を確認するのに時間がかかります。 フィールドグループには、人物、連絡先の詳細、ロイヤルティプログラムのステータスに関連する標準フィールドが追加されています。 これら 2 つのフィールドグループは、自社データのスキーマを作成する際に役立つ場合があります。 特定のフィールドグループの行を選択するか、フィールドグループ名の横にあるチェックボックスをオンにして、ビジュアライゼーションの変化を確認します。

スキーマを保存するには、を選択します。 **[!UICONTROL 保存]**.
![スキーマの保存](assets/schemas-loyalty-saveSchema.png)

>[!NOTE]
>
>フィールドグループが、収集しないデータポイントのフィールドを追加しても問題ありません。 例えば、「faxPhone」は、Luma がデータを収集しないフィールドである可能性があります。 それでいいよ。 スキーマでフィールドが定義されているからといって、そのデータが定義されるわけではありません *が* 後で取り込まれます。 また、スキーマからフィールドを削除することもできます。

### カスタムフィールドグループの追加

次に、カスタムフィールドグループを作成します。

ロイヤルティフィールドグループにが含まれている場合 `loyaltyID` フィールド、Luma は、スキーマ間の一貫性を確保できるように、すべてのシステム識別子を 1 つのグループで管理したいと考えています。

フィールドグループは、スキーマワークフローで作成する必要があります。 以下のいずれかを実行できます。

* 最初にスキーマに新しいカスタムフィールドを追加してから、カスタムフィールドグループを作成するか
* まずカスタムフィールドグループを作成してから、そこにフィールドを追加します。

このチュートリアルでは、まずカスタムフィールドグループの作成を開始します。

フィールドグループを作成するには：

1. を選択 **[!UICONTROL 追加]** の下 **[!UICONTROL スキーマフィールドグループ]** 見出し
   ![新しいフィールドグループを追加](assets/schemas-loyalty-addFieldGroup.png)
1. を選択 **[!UICONTROL 新しいフィールドグループを作成]**
1. 使用方法 `Luma Identity profile field group` as the **[!UICONTROL 表示名]**
1. 使用方法 `system identifiers for XDM Individual Profile class` as the **[!UICONTROL 説明]**
1. を選択 **[!UICONTROL フィールドグループの追加]**
   ![新しいフィールドグループを追加](assets/schemas-loyalty-nameFieldGroup.png)

新しい空のフィールドグループがスキーマに追加されます。 この **[!UICONTROL +]** ボタンを使用すると、階層内の任意の場所に新しいフィールドを追加できます。 この例では、ルートレベルにフィールドを追加します。

1. を選択 **[!UICONTROL +]** スキーマ名の隣。 これにより、テナント ID 名前空間の下に新しいフィールドが追加され、カスタムフィールドと標準フィールド間の競合が管理されます。
1. が含まれる **[!UICONTROL フィールドプロパティ]** サイドバーに新しいフィールドの詳細を追加します。
   1. **[!UICONTROL フィールド名]**: `systemIdentifier`
   1. **[!UICONTROL 表示名]**: `System Identifier`
   1. **[!UICONTROL タイプ]**: **[!UICONTROL オブジェクト]**
   1. が含まれる **[!UICONTROL フィールドグループ]** ドロップダウンを選択 **Luma ID プロファイルフィールドグループ** 作成しました。
      ![新しいフィールドグループを追加](assets/schemas-loyalty-addSystemIdentifier.png)
   1. を選択 **[!UICONTROL 適用]**
      ![新しいフィールドプロパティの適用](assets/schemas-loyalty-applySystemIdentifier.png)

次に、以下に 2 つのフィールドを追加します `systemIdentifier` オブジェクト :

1. 最初のフィールド
   1. **[!UICONTROL フィールド名]**: `loyaltyId`
   1. **[!UICONTROL 表示名：]** `Loyalty Id`
   1. **[!UICONTROL タイプ]**: **[!UICONTROL 文字列]**
1. 2 番目のフィールド
   1. **[!UICONTROL フィールド名]**: `crmId`
   1. **[!UICONTROL 表示名]**: `CRM Id`
   1. **[!UICONTROL タイプ]**: **[!UICONTROL 文字列]**

新しいフィールドグループは次のようになります。 「」を選択します **[!UICONTROL 保存]** ボタン：スキーマを保存しますが、次の演習のためにスキーマを開いたままにします。
![ロイヤルティフィールドグループの完了](assets/schemas-loyalty-identityFieldGroupComplete.png)

## データタイプの作成

フィールドグループ（新規など） `Luma Identity profile field group`は他のスキーマで再利用でき、複数のシステムに標準のデータ定義を適用できます。 ただし、再利用のみできます _クラスを共有するスキーマ内_、この場合は XDM Individual Profile クラス。

データタイプは、スキーマで再利用できるもう 1 つの複数フィールド構成体です _複数のクラスにわたる_. 新しいのコンバージョンをしよう `systemIdentifier` オブジェクトをデータタイプに変換します。

（を使用） `Luma Loyalty Schema` を開いたまま、 `systemIdentifier` オブジェクトと選択  **[!UICONTROL 新しいデータタイプに変換]**

![ロイヤルティフィールドグループの完了](assets/schemas-loyalty-convertToDataType.png)

次の場合： **[!UICONTROL キャンセル]** スキーマからに移動します。 **[!UICONTROL データタイプ]** タブに、新しく作成したデータタイプが表示されます。 このデータタイプは、レッスンの後半で使用します。

![ロイヤルティフィールドグループの完了](assets/schemas-loyalty-confirmDataType.png)


## API を使用した CRM スキーマの作成

次に、API を使用してスキーマを作成します。

>[!TIP]
>
> API の演習をスキップする場合は、ユーザーインターフェイスメソッドを使用して、次のスキーマを作成できます。
>
> 1. の使用 [!UICONTROL 個人プロファイル] クラス
> 1. 名前をつける `Luma CRM Schema`
> 1. デモグラフィックの詳細、個人の連絡先の詳細、Luma ID プロファイルフィールドグループのフィールドグループを使用します

まず、空のスキーマを作成します。

1. 開く [!DNL Postman]
1. アクセストークンがない場合は、リクエストを開きます。 **[!DNL OAuth: Request Access Token]** を選択して、 **送信** 新しいアクセストークンをリクエストします。
1. 環境変数を開き、値を変更します。 **CONTAINER_ID** から `global` 対象： `tenant`. を使用する必要があることに注意してください `tenant` platform で独自のカスタム要素（スキーマの作成など）を操作する場合。
1. を選択 **保存**
   ![Container_ID をテナントに変更します](assets/schemas-crm-changeContainerId.png)
1. リクエストを開きます **[!DNL Schema Registry API > Schemas > Create a new custom schema.]**
1. を開きます **本文** 次のコードをタブを使用して貼り付け、を選択します **送信** API 呼び出しを行います。 この呼び出しにより、同じを使用して新しいスキーマが作成されます `XDM Individual Profile` 基本クラス：

   ```json
   {
     "type": "object",
     "title": "Luma CRM Schema",
     "description": "Schema for CRM data of Luma Retail ",
     "allOf": [{
       "$ref": "https://ns.adobe.com/xdm/context/profile"
     }]
   }
   ```

   >[!NOTE]
   >
   >このコードサンプルおよび後続のコードサンプルの名前空間の参照（例： `https://ns.adobe.com/xdm/context/profile`）、リスト API 呼び出しを使用して、 **[!DNL CONTAINER_ID]** そして、正しい値に設定されたヘッダーを受け入れます。 また、ユーザーインターフェイスから簡単にアクセスできるものもあります。

1. 以下を取得する必要があります。 `201 Created` response
1. コピー `meta:altId` 応答本文から。 後で別の演習で使用します。
   ![CRM スキーマの作成](assets/schemas-crm-createSchemaCall.png)

1. 新しいスキーマは、フィールドグループを除いてユーザーインターフェイスに表示されます
   ![CRM スキーマの作成](assets/schemas-loyalty-emptySchemaInTheUI.png)

>[!NOTE]
>
> この `meta:altId` または、API リクエストをおこなうことで、スキーマ ID を取得することもできます **[!DNL Schema Registry API > Schemas > Retrieve a list of schemas within the specified container.]** （を使用） **[!UICONTROL CONTAINER_ID]** をに設定 `tenant` および accept ヘッダー `application/vnd.adobe.xdm+json`.

>[!TIP]
>
> この呼び出しに関する一般的な問題と、考えられる修正点は次のとおりです。
>
> * 認証トークンなし：を実行します **OAuth: リクエストアクセストークン** 新しいトークンの生成リクエスト
> * `401: Not Authorized to PUT/POST/PATCH/DELETE for this path : /global/schemas/`：を更新します **CONTAINER_ID** からの環境変数 `global` 対象： `tenant`
> * `403: PALM Access Denied. POST access is denied for this resource from access control`:Admin Consoleでのユーザー権限の確認

### 標準フィールドグループの追加

次に、フィールドグループをスキーマに追加します。

1. 対象： [!DNL Postman]、リクエストを開きます **[!DNL Schema Registry API > Schemas > Update one or more attributes of a custom schema specified by ID.]**
1. が含まれる **パラメーター** タブで、を貼り付けます。 `meta:altId` 以前の応答からの値（ `SCHEMA_ID`
1. 「本文」タブを開き、次のコードを貼り付けて選択します。 **送信** API 呼び出しを行います。 この呼び出しにより、標準フィールドグループが `Luma CRM Schema`:

   ```json
   [{
       "op": "add",
       "path": "/allOf/-",
       "value": {
         "$ref": "https://ns.adobe.com/xdm/context/profile-personal-details"
       }
     },
     {
       "op": "add",
       "path": "/allOf/-",
       "value": {
         "$ref": "https://ns.adobe.com/xdm/context/profile-person-details"
       }
     }
   ]
   ```

1. 応答のステータスが 200 OK になり、フィールドグループが UI のスキーマの一部として表示されます

   ![追加された標準フィールドグループ](assets/schemas-crm-addMixins.png)


### カスタムフィールドグループを追加

次に、を追加します `Luma Identity profile field group` をスキーマに追加します。 まず、list API を使用して、新しいフィールドグループの ID を見つける必要があります。

1. リクエストを開きます **[!DNL Schema Registry API > Field groups > Retrieve a list of field groups within the specified container.]**
1. 「」を選択します **送信** ボタンをクリックして、アカウント内のすべてのカスタムフィールドグループのリストを取得
1. つかむ `$id` 値 `Luma Identity profile field group` （現在の値は、このスクリーンショットの値とは異なります）
   ![フィールドグループのリストの取得](assets/schemas-crm-getListOfMixins.png)
1. リクエストを開きます **[!DNL Schema Registry API > Schemas > Update one or more attributes of a custom schema specified by ID.]** 再び
1. この **パラメーター** タブには、引き続きが表示されます。 `$id` スキーマの
1. を開きます **本文** をタブでクリックし、以下のコードを `$ref` を使用した値 `$id` 自分の `Luma Identity profile field group`:

   ```json
   [{
     "op": "add",
     "path": "/allOf/-",
     "value": {
       "$ref": "REPLACE_WITH_YOUR_OWN_FIELD_GROUP_ID"
     }
   }]
   ```

1. を選択 **送信**
   ![ID フィールドグループの追加](assets/schemas-crm-addIdentityMixin.png)

API 応答とインターフェイスの両方をチェックして、フィールドグループがスキーマに追加されていることを確認します。

## オフライン購入イベントスキーマの作成

次に、に基づいてスキーマを作成します **[!UICONTROL エクスペリエンスイベント]** luma のオフライン購入データのクラス。 スキーマエディターのユーザーインターフェイスに慣れ親しんだので、手順のスクリーンショットの数を減らします。

1. を使用したスキーマの作成 **[!UICONTROL エクスペリエンスイベント]** クラス。
1. スキーマに名前を付ける `Luma Offline Purchase Events Schema`.
1. 標準フィールドグループの追加 **[!UICONTROL Commerceの詳細]** 共通の注文の詳細を取得する。 内部のオブジェクトを探索して数分お過ごしください。
1. を検索 `Luma Identity profile field group`. 利用できません。 フィールドグループはクラスに関連付けられており、このスキーマには別のクラスを使用しているので、使用できないことに注意してください。 ID フィールドを含む XDM ExperienceEvent クラスに新しいフィールドグループを追加する必要があります。 私たちのデータタイプは、それを本当に簡単にします！
1. 「」を選択します **[!UICONTROL 新しいフィールドグループを作成]** ラジオボタン
1. を入力 **[!UICONTROL 表示名]** as `Luma Identity ExperienceEvent field group` を選択し、 **[!UICONTROL フィールドグループの追加]** ボタン
1. スキーマ名の横にある「**[!UICONTROL +]**」を選択します。
1. として **[!UICONTROL フィールド名]**、と入力します `systemIdentifier`.
1. として **[!UICONTROL 表示名]**、と入力します `System Identifier`.
1. として **[!UICONTROL タイプ]**&#x200B;を選択 **システム識別子** （前に作成したカスタムデータタイプ）。
1. として **[!UICONTROL フィールドグループ]** 選択 **Luma Identity ExperienceEvent フィールドグループ**.
1. 「」を選択します **[!UICONTROL 適用]** ボタン。
1. 「」を選択します **[!UICONTROL 保存]** ボタン。

データタイプがすべてのフィールドをどのように追加したかに注意してください。

![フィールドグループへのデータタイプの追加](assets/schemas-offlinePurchases-addDatatype.png)

次も選択します **[!UICONTROL XDM ExperienceEvent]** の下 **[!UICONTROL クラス]** このクラスが提供するフィールドの一部を見出して調べます。 XDM ExperienceEvent クラスを使用する場合、_id フィールドと timestamp フィールドが必要です。これらのフィールドは、このスキーマを使用して取り込むすべてのレコードに対して入力する必要があります。

![エクスペリエンスイベントのベース構造](assets/schemas-offlinePurchase-experienceEventbase.png)

## Web イベントスキーマの作成

次に、Luma の web サイトデータ用にもう 1 つのスキーマを作成します。 この時点で、スキーマの作成に関するエキスパートになる必要があります。 これらのプロパティを使用して次のスキーマを構築します

| プロパティ | 値 |
|---------------|-----------------|
| クラス | エクスペリエンスイベント |
| スキーマ名 | Luma Web イベントスキーマ |
| フィールドグループ | AEP Web SDK ExperienceEvent |
| フィールドグループ | コンシューマーエクスペリエンスイベント |

「」を選択します **[!UICONTROL 消費者エクスペリエンスイベント]** フィールドグループ。 このフィールドグループには、同じ場所にある commerce オブジェクトと productListItems オブジェクトが含まれます [!UICONTROL Commerceの詳細]. 実際 [!UICONTROL 消費者エクスペリエンスイベント] は、他の標準フィールドグループをいくつか組み合わせたものであり、個別に使用することもできます。 [!UICONTROL AEP Web SDK ExperienceEvent] フィールドグループには、同じフィールドグループのを含む、他のフィールドグループも含まれます [!UICONTROL 消費者エクスペリエンスイベント]. 幸い、シームレスに溶け合っています。

は追加されませんでした `Luma Identity ExperienceEvent field group` を、このスキーマに追加します。 これは、Web SDK が ID を収集する方法が異なるからです。 を選択した場合、 **[!UICONTROL XDM ExperienceEvent]** 内のクラス **[!UICONTROL 構成]** スキーマエディターの「」セクションには、デフォルトで追加されるフィールドの 1 つが呼び出されていることがわかります **[!UICONTROL IdentityMap]**. [!DNL IdentityMap] は、様々なAdobeアプリケーションで Platform にリンクするために使用されます。 identityMap を使用して ID が Platform にどのように送信されるかについては、ストリーミング取り込みのレッスンを参照してください。


## 製品カタログスキーマの作成

を使用する  [!UICONTROL Commerceの詳細] および [!UICONTROL 消費者エクスペリエンスイベント] フィールドグループである Luma は、標準の productListItems データタイプを介して製品関連イベントの詳細をレポートします。 ただし、Platform に送信したい追加の製品詳細フィールドもあります。 Luma では、これらのフィールドをすべて POS （販売時点管理システム）や e コマースシステムで取り込む代わりに、製品カタログシステムから直接これらのフィールドを取り込むことをお勧めします。 「スキーマ関係」を使用すると、分類または検索のために 2 つのスキーマ間の関係を定義できます。 Luma は、関係を使用して製品の詳細を分類します。 今から始めて、次のレッスンの最後に完成させます。

>[!NOTE]
>
>既存の Analytics または Target の顧客の場合、スキーマ関係を持つエンティティの分類は、SAINTの分類やRecommendationsの商品カタログのアップロードと似ています

まず、カスタムクラスを使用して Luma の製品カタログのスキーマを作成する必要があります。

1. 「」を選択します **[!UICONTROL スキーマを作成]** ボタン。
1. スキーマを作成ワークフローで、を選択します。 **[!UICONTROL その他]** オプション。
   ![新しいスキーマを作成](assets/schemas-newSchema-browseClasses.png)
1. 「」を選択します **[!UICONTROL クラスを作成]** ボタン
1. 名前をつける `Luma Product Catalog Class`
1. を残す **[!UICONTROL 動作]** as **[!UICONTROL レコード]**
1. 「」を選択します **[!UICONTROL 作成]** ボタン。
   ![新しいクラスを作成](assets/schemas-productClass.png)
1. この **Luma 製品カタログクラス** 作成したクラスは、以下のクラス テーブルに表示されます。 クラスが選択されていることを確認し、 **[!UICONTROL 次]**.
   ![新しいクラスが追加されました](assets/schemas-productClassSelected.png)
1. スキーマに名前を付ける `Luma Product Catalog Schema`.
1. 新しいを作成 [!UICONTROL フィールドグループ] 呼び出し `Luma Product Catalog field group` 次のフィールドを使用します。
   1. productName：製品名：文字列
   1. productCategory：製品カテゴリ：文字列
   1. productColor：製品カラー：文字列
   1. productSku：製品 SKU：文字列 |必須
   1. productSize：製品サイズ：文字列
   1. productPrice：製品価格：Double
1. **[!UICONTROL 保存]** スキーマ

新しいスキーマは次のようになります。 次の点に注意してください `productSku` フィールドのリストは [!UICONTROL 必須フィールド] セクション：
![製品スキーマ](assets/schemas-productSchema.png)

次の手順では、2 つの ExperienceEvent スキーマとの関係を定義します `Luma Product Catalog Schema`ただし、次のレッスンでは、いくつかの追加手順を実行してから実行する必要があります。


## その他のリソース

* [Experience Data Model （XDM）システムのドキュメント](https://experienceleague.adobe.com/docs/experience-platform/xdm/home.html?lang=ja)
* [スキーマレジストリ API](https://www.adobe.io/experience-platform-apis/references/schema-registry/)


スキーマが用意されたので、次のことができます [id のマッピング](map-identities.md)!
