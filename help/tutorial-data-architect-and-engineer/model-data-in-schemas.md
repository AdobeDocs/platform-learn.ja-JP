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
source-git-commit: 286c85aa88d44574f00ded67f0de8e0c945a153e
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

**データアーキテクト** はこのチュートリアル以外でスキーマを作成する必要がありますが、**データエンジニア** は、データアーキテクトが作成したスキーマと緊密に連携します。

演習を開始する前に、この短いビデオを視聴して、スキーマと Experience Data Model （XDM）について詳しく学びます。
>[!VIDEO](https://video.tv.adobe.com/v/38507?learn=on&enablevpops&captions=jpn)

>[!TIP]
>
> Experience Platformのデータモデリングについて詳しくは、Experience Leagueで無償で利用できるプレイリスト [XDM を使用したカスタマーエクスペリエンスデータのモデル化 &#x200B;](https://experienceleague.adobe.com/ja/playlists/experience-platform-model-your-customer-experience-data-with-xdm) を視聴することをお勧めします。

## 必要な権限

[&#x200B; 権限の設定 &#x200B;](configure-permissions.md) レッスンでは、このレッスンを完了するために必要なすべてのアクセス制御を設定します。

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
1. 左側のナビゲーションの **[!UICONTROL スキーマ]** に移動します。
1. 右上の **[!UICONTROL スキーマを作成]** ボタンを選択します。
   ![OOTB フィールドグループを持つスキーマ &#x200B;](assets/schemas-loyaltyCreateSchema.png)

1. 個々の顧客の属性（ポイント、ステータスなど）をモデリングするので、スキーマの作成ワークフローで、スキーマの基本クラスとして **[!UICONTROL 個人プロファイル]** を選択します。
1. 「**[!UICONTROL 次へ]**」を選択します。
   ![&#x200B; 基本クラスを選択 &#x200B;](assets/schemas-loyaltySelectBaseClass.png)

1. **[!UICONTROL スキーマ表示名]** テキストフィールドに「`Luma Loyalty Schema`」と入力します。 以下のキャンバスでは、選択したクラスによって提供されるベーススキーマ構造を確認および検証することもできます。
1. 「**[!UICONTROL 完了]**」を選択して、スキーマを作成します。
   ![&#x200B; ロイヤルティスキーマの作成の完了 &#x200B;](assets/schemas-loyaltyFinishSchemaCreation.png)

### 標準フィールドグループの追加

スキーマが作成されると、スキーマエディターにリダイレクトされ、スキーマにフィールドを追加できるようになります。 個々のフィールドをスキーマに直接追加したり、フィールドグループを使用したりできます。 個々のフィールドはすべて、引き続きクラスまたはフィールドグループに関連付けられています。 Adobeが提供する業界標準のフィールドグループの大規模なセットから選択することも、独自のフィールドグループを作成することもできます。 Adobeで独自のデータのモデリングを開始する際には、Experience Platformが提供する業界標準のフィールドグループについて理解しておくと役に立ちます。 これらは顧客 AI、アトリビューション AI、Adobe Analyticsなどのダウンストリームサービスを強化する場合があるので、可能な限り使用することをお勧めします。

独自のデータを操作する際に重要な手順は、Platform で取得する独自のデータはどれか、およびそのデータをどのようにモデル化するかを決定することです。 この大きなトピックについては、プレイリスト [XDM を使用したカスタマーエクスペリエンスデータのモデル化 &#x200B;](https://experienceleague.adobe.com/ja/playlists/experience-platform-model-your-customer-experience-data-with-xdm) で詳しく説明します。 このチュートリアルでは、事前に決定されたスキーマの実装について説明します。

フィールドグループを追加するには：

1. **[!UICONTROL フィールドグループ]** 見出しの下にある **[!UICONTROL 追加]** を選択します。
   ![&#x200B; 新しいフィールドグループを追加 &#x200B;](assets/schemas-loyalty-addFieldGroup.png)
1. **[!UICONTROL フィールドグループを追加]** モーダルで、次のフィールドグループを選択します。
   1. **[!UICONTROL デモグラフィックの詳細]**：名前や生年月日などの基本的な顧客データ
   1. **[!UICONTROL 個人の連絡先の詳細]**：メールアドレスや電話番号などの基本的な連絡先詳細
1. 行の右側にあるアイコンを選択すると、フィールドグループに追加されたフィールドをプレビューできます。
   ![標準フィールドグループの選択](assets/schemas-loyalty-addFirstTwoFieldGroups.png)

1. **[!UICONTROL 業界]**/**[!UICONTROL 小売]** ボックスをオンにして、業界固有のフィールドグループを表示します。
1. **[!UICONTROL ロイヤルティの詳細]** を選択して、ロイヤルティプログラムフィールドを追加します。
1. 「**[!UICONTROL フィールドグループを追加]**」を選択して、3 つのフィールドグループをすべてスキーマに追加します。
   ![&#x200B; ロイヤルティスキーマへの標準フィールドグループの追加 &#x200B;](assets/schemas-loyalty-saveOotbMixins.png)


ここで、スキーマの現在の状態を確認するのに時間がかかります。 フィールドグループには、人物、連絡先の詳細、ロイヤルティプログラムのステータスに関連する標準フィールドが追加されています。 これら 2 つのフィールドグループは、自社データのスキーマを作成する際に役立つ場合があります。 特定のフィールドグループの行を選択するか、フィールドグループ名の横にあるチェックボックスをオンにして、ビジュアライゼーションの変化を確認します。

スキーマを保存するには、「**[!UICONTROL 保存]**」を選択します。
![スキーマの保存](assets/schemas-loyalty-saveSchema.png)

>[!NOTE]
>
>フィールドグループが、収集しないデータポイントのフィールドを追加しても問題ありません。 例えば、「faxPhone」は、Luma がデータを収集しないフィールドである可能性があります。 それでいいよ。 スキーマでフィールドが定義されているからといって、そのフィールドのデータが後で取り込まれる *必要がある* とは限りません。 また、スキーマからフィールドを削除することもできます。

### カスタムフィールドグループの追加

次に、カスタムフィールドグループを作成します。

ロイヤルティフィールドグループには `loyaltyID` フィールドが含まれていましたが、Luma は、スキーマ間の一貫性を確保するために、すべてのシステム識別子を 1 つのグループで管理したいと考えています。

フィールドグループは、スキーマワークフローで作成する必要があります。 以下のいずれかを実行できます。

* 最初にスキーマに新しいカスタムフィールドを追加してから、カスタムフィールドグループを作成するか
* まずカスタムフィールドグループを作成してから、そこにフィールドを追加します。

このチュートリアルでは、まずカスタムフィールドグループの作成を開始します。

フィールドグループを作成するには：

1. **[!UICONTROL スキーマフィールドグループ]** 見出しの下にある **[!UICONTROL 追加]** を選択します
   ![&#x200B; 新しいフィールドグループを追加 &#x200B;](assets/schemas-loyalty-addFieldGroup.png)
1. **[!UICONTROL 新しいフィールドグループを作成]** を選択します
1. **[!UICONTROL 表示名]** として `Luma Identity profile field group` を使用します
1. `system identifiers for XDM Individual Profile class` を **[!UICONTROL 説明]** として使用します
1. 「**[!UICONTROL フィールドグループを追加]**」を選択します
   ![&#x200B; 新しいフィールドグループを追加 &#x200B;](assets/schemas-loyalty-nameFieldGroup.png)

新しい空のフィールドグループがスキーマに追加されます。 **[!UICONTROL +]** ボタンを使用して、階層内の任意の場所に新しいフィールドを追加できます。 この例では、ルートレベルにフィールドを追加します。

1. スキーマ名の横にある「**[!UICONTROL +]**」を選択します。 これにより、テナント ID 名前空間の下に新しいフィールドが追加され、カスタムフィールドと標準フィールド間の競合が管理されます。
1. **[!UICONTROL フィールドプロパティ]** サイドバーに、新しいフィールドの詳細を追加します。
   1. **[!UICONTROL フィールド名]**: `systemIdentifier`
   1. **[!UICONTROL 表示名]**: `System Identifier`
   1. **[!UICONTROL 型]**: **[!UICONTROL Object]**
   1. **[!UICONTROL フィールドグループ]** ドロップダウンで、作成した **Luma ID プロファイルフィールドグループ** を選択します。

      ![&#x200B; 新しいフィールドグループを追加 &#x200B;](assets/schemas-loyalty-addSystemIdentifier.png)
   1. 「**[!UICONTROL 適用]**」を選択します

      ![&#x200B; 新しいフィールドプロパティを適用 &#x200B;](assets/schemas-loyalty-applySystemIdentifier.png)

次に、`systemIdentifier` オブジェクトの下に 2 つのフィールドを追加します。

1. 最初のフィールド
   1. **[!UICONTROL フィールド名]**: `loyaltyId`
   1. **[!UICONTROL 表示名：]** `Loyalty Id`
   1. **[!UICONTROL 型]**: **[!UICONTROL String]**
1. 2 番目のフィールド
   1. **[!UICONTROL フィールド名]**: `crmId`
   1. **[!UICONTROL 表示名]**: `CRM Id`
   1. **[!UICONTROL 型]**: **[!UICONTROL String]**

新しいフィールドグループは次のようになります。 「**[!UICONTROL 保存]**」ボタンを選択してスキーマを保存しますが、次の演習のためにスキーマを開いたままにします。
![&#x200B; ロイヤルティフィールドグループの完了 &#x200B;](assets/schemas-loyalty-identityFieldGroupComplete.png)

## データタイプの作成

新しい `Luma Identity profile field group` などのフィールドグループは他のスキーマで再利用でき、複数のシステムにわたって標準のデータ定義を適用できます。 ただし、再利用できるのは _クラスを共有するスキーマ内_、この場合は XDM 個人プロファイルクラスのみです。

データタイプは、スキーマ _複数のクラス全体_ で再利用できる別の複数フィールド構成体です。 新しい `systemIdentifier` オブジェクトをデータタイプに変換しましょう。

`Luma Loyalty Schema` が開いたままの状態で、`systemIdentifier` オブジェクトを選択して **[!UICONTROL 新しいデータタイプに変換]** を選択します。

![&#x200B; ロイヤルティフィールドグループの完了 &#x200B;](assets/schemas-loyalty-convertToDataType.png)

スキーマから **[!UICONTROL キャンセル]** して「**[!UICONTROL データタイプ]**」タブに移動すると、新しく作成したデータタイプが表示されます。 このデータタイプは、レッスンの後半で使用します。

![&#x200B; ロイヤルティフィールドグループの完了 &#x200B;](assets/schemas-loyalty-confirmDataType.png)


## API を使用した CRM スキーマの作成

次に、API を使用してスキーマを作成します。

>[!TIP]
>
> API の演習をスキップする場合は、ユーザーインターフェイスメソッドを使用して、次のスキーマを作成できます。
>
> 1. [!UICONTROL Individual Profile] クラスの使用
> 1. `Luma CRM Schema` という名前を付けます
> 1. デモグラフィックの詳細、個人の連絡先の詳細、Luma ID プロファイルフィールドグループのフィールドグループを使用します

まず、空のスキーマを作成します。

1. Open [!DNL Postman]
1. アクセストークンがない場合は、リクエストフ **[!DNL OAuth: Request Access Token]** ールドを開いて「**送信**」を選択し、新しいアクセストークンをリクエストします。
1. 環境変数を開き、**CONTAINER_ID** の値を `global` から `tenant` に変更します。 Platform で独自のカスタム要素を操作する場合（スキーマの作成など）は、`tenant` を使用する必要があります。
1. 「**保存**」を選択します
   ![CONTAINER_ID をテナントに変更 &#x200B;](assets/schemas-crm-changeContainerId.png)
1. リクエスト **[!DNL Schema Registry API > Schemas > Create a new custom schema.]** を開きます。
1. 「**本文**」タブを開き、次のコードを貼り付けて「**送信**」を選択し、API 呼び出しを行います。 この呼び出しにより、同じ `XDM Individual Profile` 基本クラスを使用して新しいスキーマが作成されます。

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
   >このコードサンプルおよび後続のコードサンプルでの名前空間リファレンス（例：`https://ns.adobe.com/xdm/context/profile`）は、**[!DNL CONTAINER_ID]** および accept ヘッダーを正しい値に設定したリスト API 呼び出しを使用して取得できます。 また、ユーザーインターフェイスから簡単にアクセスできるものもあります。

1. `201 Created` しい応答が返されます
1. 応答本文から `meta:altId` をコピーします 後で別の演習で使用します。
   ![CRM スキーマの作成 &#x200B;](assets/schemas-crm-createSchemaCall.png)

1. 新しいスキーマは、フィールドグループを除いてユーザーインターフェイスに表示されます
   ![CRM スキーマの作成 &#x200B;](assets/schemas-loyalty-emptySchemaInTheUI.png)

>[!NOTE]
>
> `meta:altId` またはスキーマ ID は、**[!UICONTROL CONTAINER_ID]** を `tenant` に設定し、accept ヘッダー `application/vnd.adobe.xdm+json` を指定して API リクエスト **[!DNL Schema Registry API > Schemas > Retrieve a list of schemas within the specified container.]** を実行することによっても取得できます。

>[!TIP]
>
> この呼び出しに関する一般的な問題と、考えられる修正点は次のとおりです。
>
> * 認証トークンがありません：**OAuth: リクエストアクセストークン** リクエストを実行して、新しいトークンを生成します
> * `401: Not Authorized to PUT/POST/PATCH/DELETE for this path : /global/schemas/`: **CONTAINER_ID** 環境変数を `global` から `tenant` に更新します
> * `403: PALM Access Denied. POST access is denied for this resource from access control`:Admin Consoleでのユーザー権限の確認

### 標準フィールドグループの追加

次に、フィールドグループをスキーマに追加します。

1. [!DNL Postman] で、リクエストフ **[!DNL Schema Registry API > Schemas > Update one or more attributes of a custom schema specified by ID.]** ールドを開きます。
1. 「**パラメーター**」タブで、前の応答から `meta:altId` 値を `SCHEMA_ID` として貼り付けます
1. 「本文」タブを開き、次のコードを貼り付けて「**送信**」を選択し、API 呼び出しを行います。 この呼び出しによって、標準フィールドグループが `Luma CRM Schema` に追加されます。

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

   ![&#x200B; 追加された標準フィールドグループ &#x200B;](assets/schemas-crm-addMixins.png)


### カスタムフィールドグループを追加

次に、スキーマに `Luma Identity profile field group` を追加します。 まず、list API を使用して、新しいフィールドグループの ID を見つける必要があります。

1. リクエスト **[!DNL Schema Registry API > Field groups > Retrieve a list of field groups within the specified container.]** を開きます。
1. 「**送信**」ボタンを選択して、アカウント内のすべてのカスタムフィールドグループのリストを取得します
1. `Luma Identity profile field group` の `$id` 値を取得します（このスクリーンショットの値とは異なります）
   ![&#x200B; フィールドグループのリストを取得 &#x200B;](assets/schemas-crm-getListOfMixins.png)
1. リクエスト **[!DNL Schema Registry API > Schemas > Update one or more attributes of a custom schema specified by ID.]** ージを再度開きます
1. 「**パラメーター**」タブには、スキーマの `$id` が引き続き表示されます
1. 「**本文**」タブを開き、次のコードを貼り付けて、`$ref` の値を独自の `Luma Identity profile field group` の `$id` に置き換えます。

   ```json
   [{
     "op": "add",
     "path": "/allOf/-",
     "value": {
       "$ref": "REPLACE_WITH_YOUR_OWN_FIELD_GROUP_ID"
     }
   }]
   ```

1. 「**送信**」を選択します。
   ![ID フィールドグループの追加 &#x200B;](assets/schemas-crm-addIdentityMixin.png)

API 応答とインターフェイスの両方をチェックして、フィールドグループがスキーマに追加されていることを確認します。

## オフライン購入イベントスキーマの作成

次に、Luma のオフライン購入データ用の **[!UICONTROL エクスペリエンスイベント]** クラスに基づいてスキーマを作成します。 スキーマエディターのユーザーインターフェイスに慣れ親しんだので、手順のスクリーンショットの数を減らします。

1. **[!UICONTROL Experience Event]** クラスを持つスキーマを作成します。
1. スキーマに `Luma Offline Purchase Events Schema` という名前を付けます。
1. 標準フィールドグループ **[!UICONTROL Commerceの詳細]** を追加して、一般的な注文の詳細を取り込みます。 内部のオブジェクトを探索して数分お過ごしください。
1. `Luma Identity profile field group` を検索します。 利用できません。 フィールドグループはクラスに関連付けられており、このスキーマには別のクラスを使用しているので、使用できないことに注意してください。 ID フィールドを含む XDM ExperienceEvent クラスに新しいフィールドグループを追加する必要があります。 私たちのデータタイプは、それを本当に簡単にします！
1. **[!UICONTROL 新しいフィールドグループを作成]** ラジオボタンを選択します
1. **[!UICONTROL 表示名]** を `Luma Identity ExperienceEvent field group` のように入力し、「**[!UICONTROL フィールドグループを追加]**」ボタンを選択します
1. スキーマ名の横にある「**[!UICONTROL +]**」を選択します。
1. **[!UICONTROL フィールド名]** として、「`systemIdentifier`」と入力します。
1. **[!UICONTROL 表示名]** として、`System Identifier` と入力します。
1. **[!UICONTROL タイプ]** として、**システム識別子** を選択します。これは、以前に作成したカスタムデータタイプです。
1. **[!UICONTROL フィールドグループ]** として **Luma Identity ExperienceEvent フィールドグループ** を選択します。
1. 「**[!UICONTROL 適用]** ボタンを選択します。
1. 「**[!UICONTROL 保存]** ボタンを選択します。

データタイプがすべてのフィールドをどのように追加したかに注意してください。

![&#x200B; フィールドグループへのデータタイプの追加 &#x200B;](assets/schemas-offlinePurchases-addDatatype.png)

また、**[!UICONTROL クラス]** 見出しの下の **[!UICONTROL XDM ExperienceEvent]** を選択し、このクラスによって提供されたフィールドの一部を調べます。 XDM ExperienceEvent クラスを使用する場合、_id フィールドと timestamp フィールドが必要です。これらのフィールドは、このスキーマを使用して取り込むすべてのレコードに対して入力する必要があります。

![&#x200B; エクスペリエンスイベントのベース構造 &#x200B;](assets/schemas-offlinePurchase-experienceEventbase.png)

## Web イベントスキーマの作成

次に、Luma の web サイトデータ用にもう 1 つのスキーマを作成します。 この時点で、スキーマの作成に関するエキスパートになる必要があります。 これらのプロパティを使用して次のスキーマを構築します

| プロパティ | 値 |
|---------------|-----------------|
| クラス | エクスペリエンスイベント |
| スキーマ名 | Luma Web イベントスキーマ |
| フィールドグループ | AEP Web SDK ExperienceEvent |
| フィールドグループ | コンシューマーエクスペリエンスイベント |

「**[!UICONTROL 消費者エクスペリエンスイベント]**」フィールドグループを選択します。 このフィールドグループには、[!UICONTROL Commerceの詳細 &#x200B;] にも含まれていた commerce および productListItems オブジェクトが含まれます。 Indeed [!UICONTROL &#x200B; コンシューマーエクスペリエンスイベント &#x200B;] は、他の標準フィールドグループをいくつか組み合わせたものであり、個別にも使用できます。 [!UICONTROL AEP Web SDK ExperienceEvent] フィールドグループには、他のフィールドグループも含まれています（[!UICONTROL &#x200B; コンシューマーエクスペリエンスイベント &#x200B;] の同じフィールドグループの一部を含む）。 幸い、シームレスに溶け合っています。

このスキーマには `Luma Identity ExperienceEvent field group` を追加していないことに注意してください。 これは、web SDKでは ID を収集する方法が異なるからです。 スキーマエディターの **[!UICONTROL 構成]** セクションで **[!UICONTROL XDM ExperienceEvent]** クラスを選択すると、デフォルトで追加されるフィールドの 1 つが **[!UICONTROL IdentityMap]** という名前であることがわかります。 [!DNL IdentityMap] は、様々なAdobe アプリケーションで Platform にリンクするために使用されます。 identityMap を使用して ID が Platform にどのように送信されるかについては、ストリーミング取り込みのレッスンを参照してください。


## 製品カタログスキーマの作成

Luma は、[!UICONTROL Commerceの詳細 &#x200B;] および [!UICONTROL &#x200B; コンシューマーエクスペリエンスイベント &#x200B;] フィールドグループを使用して、標準の productListItems データタイプを介して商品関連イベントの詳細をレポートします。 ただし、Platform に送信したい追加の製品詳細フィールドもあります。 Luma では、これらのフィールドをすべて POS （販売時点管理システム）や e コマースシステムで取り込む代わりに、製品カタログシステムから直接これらのフィールドを取り込むことをお勧めします。 「スキーマ関係」を使用すると、分類または検索のために 2 つのスキーマ間の関係を定義できます。 Luma は、関係を使用して製品の詳細を分類します。 今から始めて、次のレッスンの最後に完成させます。

>[!NOTE]
>
>既存の Analytics または Target の顧客の場合、スキーマ関係を持つエンティティの分類は、SAINTの分類や Recommendations の商品カタログのアップロードと類似しています

まず、カスタムクラスを使用して Luma の製品カタログのスキーマを作成する必要があります。

1. 「**[!UICONTROL スキーマを作成]**」ボタンを選択します。
1. スキーマを作成ワークフローで、「**[!UICONTROL その他]**」オプションを選択します。
   ![&#x200B; 新しいスキーマの作成 &#x200B;](assets/schemas-newSchema-browseClasses.png)
1. 「**[!UICONTROL クラスを作成]**」ボタンを選択します
1. `Luma Product Catalog Class` という名前を付けます
1. **[!UICONTROL 動作]** は **[!UICONTROL レコード]** のままにします
1. 「**[!UICONTROL 作成]** ボタンを選択します。
   ![&#x200B; 新しいクラスの作成 &#x200B;](assets/schemas-productClass.png)
1. 作成した **Luma 製品カタログクラス** が、以下のクラス表に表示されます。 クラスが選択されていることを確認し、「**[!UICONTROL 次へ]**」を選択します。
   ![&#x200B; 新しいクラスが追加されました &#x200B;](assets/schemas-productClassSelected.png)
1. スキーマに `Luma Product Catalog Schema` という名前を付けます。
1. 次のフィールドを持つ `Luma Product Catalog field group` という新しい [!UICONTROL &#x200B; フィールドグループ &#x200B;] を作成します。
   1. productName：製品名：文字列
   1. productCategory：製品カテゴリ：文字列
   1. productColor：製品カラー：文字列
   1. productSku：製品 SKU：文字列 |必須
   1. productSize：製品サイズ：文字列
   1. productPrice：製品価格：Double
1. スキーマ **&#x200B;**&#x200B;保存）

新しいスキーマは次のようになります。 「[!UICONTROL &#x200B; 必須フィールド &#x200B;]」セクションに `productSku` のフィールドがどのように表示されるかを確認します。
![&#x200B; 製品スキーマ &#x200B;](assets/schemas-productSchema.png)

次の手順では、2 つの ExperienceEvent スキーマと `Luma Product Catalog Schema` の間の関係を定義しますが、それを行う前に、次のレッスンで取り組む必要がある追加の手順がいくつかあります。


## その他のリソース

* [&#x200B; エクスペリエンスデータモデル（XDM）システムのドキュメント &#x200B;](https://experienceleague.adobe.com/docs/experience-platform/xdm/home.html?lang=ja)
* [スキーマレジストリ API](https://www.adobe.io/experience-platform-apis/references/schema-registry/)


スキーマが用意できたので、次は [ID をマッピング &#x200B;](map-identities.md) できます。
