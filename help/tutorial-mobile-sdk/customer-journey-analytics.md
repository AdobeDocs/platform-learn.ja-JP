---
title: Customer Journey Analyticsを使用したモバイルアプリデータのレポートと分析
description: Customer Journey Analyticsを使用してモバイルアプリとのインタラクションをレポートおよび分析する方法について説明します。
solution: Data Collection,Experience Platform,Analytics
exl-id: c41b76eb-2ed7-4a82-80c1-b67476c464ad
source-git-commit: 5a797a464322225708208298d21d6b6a2ad223b6
workflow-type: tm+mt
source-wordcount: '3281'
ht-degree: 2%

---

# Customer Journey Analyticsを使用したレポートと分析

Customer Journey Analyticsとのモバイルアプリのやり取りをレポートおよび分析する方法について説明します。

以前のレッスンで Platform Edge Networkに収集して送信したモバイルアプリのイベントデータは、データストリームで設定されたサービスに転送されます。 [Experience Platformへのデータの送信 ](platform.md) のレッスンに従うと、そのデータはExperience Platform データセットに保存され、Customer Journey Analyticsでレポートや分析に使用できるようになります。

Adobe Analyticsとは異なり、Customer Journey AnalyticsはExperience Platformで作成されたデータセットのデータを *使用* します。 Adobe Experience Platform Mobile SDKを使用してCustomer Journey Analyticsに直接データが送信されるのではなく、データセットにデータが送信されます。 その後、接続はCustomer Journey Analyticsで設定され、Reporting and Analysis プロジェクトで使用するデータセットを選択します。

チュートリアルのこのレッスンでは、Luma チュートリアルアプリから取得したデータのレポートと分析に焦点を当てています。 Customer Journey Analyticsのユニークな機能の 1 つは、複数のソース（CRM、POS、ロイヤルティアプリケーション、コールセンター）とチャネル（web、モバイル、オフライン）のデータを組み合わせて、カスタマージャーニーに関する深いインサイトを得ることです。 この機能はこのレッスンの範囲外です。 詳しくは、[Customer Journey Analytics](https://experienceleague.adobe.com/en/docs/analytics-platform/using/cja-overview/cja-overview) 概要を参照してください。


## 前提条件

組織は、Customer Journey Analyticsのプロビジョニングと権限の付与を行う必要があります。 Customer Journey Analyticsへの管理者アクセス権が必要です。


## 学習目標

このレッスンでは、次の操作を行います。

- 接続を作成して、Customer Journey Analyticsで使用するExperience Platformのデータセットを定義します。
- データビューを作成して、レポートおよび分析用にデータセットからデータを準備します
- プロジェクトを作成してレポートとビジュアライゼーションを作成し、モバイルアプリからデータを分析できるようにします。

この順序は意図的に行われます。 接続ではデータセットを使用し、データビューでは接続を使用します。


## 接続の作成

Customer Journey Analyticsの接続は、レポートおよび分析に使用するデータセット（およびこれらのデータセット内のデータ）をExperience Platformから定義します。

1. 右上のアプリ ![ アプリ ](https://spectrum.adobe.com/static/icons/workflow_18/Smock_Apps_18_N.svg) メニューを使用して、Customer Journey Analytics インターフェイスに移動します。

1. 上部メニューバーから「**[!UICONTROL 接続]**」を選択します。

1. 接続インターフェイスで「**[!UICONTROL リスト]**」タブを選択していることを確認します。 既存の接続のリストが表示されます。

1. **[!UICONTROL 新しい接続を作成]** を選択します。

1. **[!UICONTROL 接続]**/**[!UICONTROL 名称未設定の接続]** 画面の **[!UICONTROL 接続設定]**

   1. **[!UICONTROL 接続名]** を入力します（例：`Luma App - AEP Mobile SDK Tutorial Connection`）。
   2. **[!UICONTROL 接続の説明]** を入力します（例：`Connection for the Luma app used in the AEP Mobile SDK tutorial`）。

      **[!UICONTROL データ設定]** で：

   3. モバイルアプリデータの収集に使用したサンドボックス（例：**[!UICONTROL モバイルおよび web SDK コース]** を選択します。
   4. **[!UICONTROL 毎日のイベントの平均数]** から **[!UICONTROL 100 万未満]** を選択します。

   5. 「**[!UICONTROL データセットを追加]**」を選択して、Customer Journey Analyticsで使用するデータセットをExperience Platformから選択します。

      ![CJA接続 1](assets/cja-connections-1.png){zoomable="yes"}

   6. **[!UICONTROL データセットを追加]** ウィザードの **[!UICONTROL データセットを選択]** 手順で、

      1. 次のデータセットを選択します。

         - **[!UICONTROL Luma モバイルアプリイベントデータセット]**:Experience Platformのレッスンの [ データセットを作成 ](platform.md#create-a-dataset) の節の一部として作成したデータセット。
         - **[!UICONTROL ODE DecisionEvents - *サンドボックス名*] decisioning**
         - **[!UICONTROL AJO プッシュトラッキングイベントデータセット]**

      1. 「**[!UICONTROL 次へ]**」を選択します。

         ![CJA Connections 2](assets/cja-connections-2.png){zoomable="yes"}

   7. **[!UICONTROL データセットを追加]** ウィザード、**[!UICONTROL データセット設定]** 手順では、各イベントデータセットの詳細を定義する必要があります。
      1. 適切な設定については、次の表を参照してください。

         | データセット | 人物 ID<br/>① | Timestamp<br>② | データソースタイプ ③ | すべての新しいデータ④ースをインポート | 既存のすべてのデータ⑤ースをバックフィル |
         |---|---|---|---|---|---|
         | Luma モバイルアプリイベントデータセット | identityMap | タイムスタンプ | モバイルアプリデータ | 有効にする | 有効にする |
         | ODE DecisionEvents - *サンドボックス名* decisioning | identityMap | タイムスタンプ | モバイルアプリデータ | 有効にする | 有効にする |
         | AJO プッシュトラッキングエクスペリエンスイベントデータセット | identityMap | タイムスタンプ | モバイルアプリデータ | 有効にする | 有効にする |

      1. 「**[!UICONTROL データセットを追加]**」を選択します。

         ![CJA接続 3](assets/cja-connections-3.png){zoomable="yes"}

1. **[!UICONTROL 接続]**/**[!UICONTROL Luma アプリ - AEP Mobile SDK チュートリアルの接続]** に戻り、「**[!UICONTROL 保存]**」を選択して接続を保存します。

   ![CJA接続 4](assets/cja-connections-4.png){zoomable="yes"}

これで接続を定義し、Customer Journey Analyticsがデータセットから独自の内部データベースにデータを追加します。 このデータ収集は、データ量によっては時間がかかる場合があります。 チュートリアルアプリでは、データがCustomer Journey Analyticsに表示されるまで 2、3 時間待ちます。

接続のステータスを表示するには：

1. Customer Journey Analyticsのメインインターフェイスで「**[!UICONTROL 接続]**」を選択します。
1. 接続の名前（例：**[!UICONTROL Luma アプリ - AEP Mobile SDK チュートリアル接続]**）を選択します。

**[!UICONTROL 接続]**/**[!UICONTROL Luma アプリ - AEP Mobile SDK チュートリアルの接続]** には、次の情報が表示されます。

1. 追加された合計レコード数、スキップされたレコード数および削除されたレコード数に関する情報。 必ず **[!UICONTROL すべてのデータセット]** を選択し、適切な期間を選択して接続に関する詳細を表示します。 ![ カレンダー ](https://spectrum.adobe.com/static/icons/workflow_18/Smock_Calendar_18_N.svg) を使用して、期間を選択するダイアログを開くことができます。
1. 追加されたレコード、スキップされたレコード、削除されたレコードなどに関する個々のデータセットの情報。

   ![CJA Connections 6](assets/cja-connections-6.png){zoomable="yes"}


## データビューの作成

データセットからCustomer Journey Analyticsにレコードを追加したら、データビューを作成して、レポートするデータのコンポーネントを定義できます。

データビューはCustomer Journey Analyticsに特有のコンテナで、接続からデータを解釈する方法を決定できます。 Analysis Workspaceで、接続でコンポーネント（ディメンション、指標）として定義した任意のデータセットから、標準フィールドとスキーマフィールドを設定できます。

Customer Journey Analyticsのデータビューは、接続からのデータを適切に設定および定義する際に、非常に柔軟です。 このチュートリアルでは、レポートおよび分析に必要な機能のみを使用します。 詳しくは、[ データビュー ](https://experienceleague.adobe.com/ja/docs/analytics-platform/using/cja-dataviews/data-views) を参照してください。


データビューを作成するには：

1. 右上のアプリ ![ アプリ ](https://spectrum.adobe.com/static/icons/workflow_18/Smock_Apps_18_N.svg) メニューを使用して、Customer Journey Analytics インターフェイスに移動します。

1. 上部メニューバーから **[!UICONTROL データビュー]** を選択します。
1. **[!UICONTROL 新しいデータビューを作成]** を選択します。
1. **[!UICONTROL データビュー >]** で、「**[!UICONTROL 設定]**」タブが選択されていることを確認します。

   1. 「設定」接続ドロップダウンリストから接続を選択します（例：**[!UICONTROL Luma アプリ - AEP モバイルSDK チュートリアル接続]**。
   1. データビューの名前（例：`Luma App - AEP Mobile SDK Tutorial Data view`）を入力します。
   1. **[!UICONTROL 保存して続行]** を選択します。

      ![CJAのデータビュー 1](assets/cja-dataview-1.png){zoomable="yes"}

1. **[!UICONTROL Luma アプリ - AEP Mobile SDK チュートリアルのデータビュー]** の **[!UICONTROL コンポーネント]** タブでは、モバイルアプリでレポートを作成する際に使用する指標とディメンションを定義できます。 デフォルトでは、多数の標準指標およびディメンション（コンポーネントと総称）がデータビューに既に設定されています。 ただし、データビューには、より多くのコンポーネントが必要です。 <br/> 以前に定義したスキーマまたは標準スキーマからスキーマフィールドをコンポーネント（ディメンションまたは指標）として追加するには（[ スキーマの作成 ](create-schema.md) レッスンを参照）、

   1. スキーマフィールドを見つけます。

      - ![ 検索 ](https://spectrum.adobe.com/static/icons/workflow_18/Smock_Search_18_N.svg)***[!UICONTROL 検索スキーマフィールド]*** 検索フィールドを使用してコンポーネントを検索します。 例えば、`productListAdd` や

        ![CJAのデータビュー 2a](assets/cja-dataview-2a.png){zoomable="yes"}

      - ![ フォルダー ](https://spectrum.adobe.com/static/icons/workflow_18/Smock_Folder_18_N.svg) **[!UICONTROL イベントデータセット]** ![ 山形 ](https://spectrum.adobe.com/static/icons/ui_18/ChevronSize100.svg) 内のスキーマフィールドまで移動します。 <br/> 例：![ フォルダー ](https://spectrum.adobe.com/static/icons/workflow_18/Smock_Folder_18_N.svg) **[!UICONTROL イベントデータセット]** ![ 山形 ](https://spectrum.adobe.com/static/icons/ui_18/ChevronSize100.svg) ![ フォルダー ](https://spectrum.adobe.com/static/icons/workflow_18/Smock_Folder_18_N.svg) **[!UICONTROL コマース]** ![ 山形 ](https://spectrum.adobe.com/static/icons/ui_18/ChevronSize100.svg) ![ フォルダー ](https://spectrum.adobe.com/static/icons/workflow_18/Smock_Folder_18_N.svg) **[!UICONTROL productListAdds]** ![ 山形 ](https://spectrum.adobe.com/static/icons/ui_18/ChevronSize100.svg)

        ![CJAのデータビュー 2a](assets/cja-dataview-2b.png){zoomable="yes"}

   1. 「スキーマフィールド」ペインから特定のスキーマフィールドをドラッグし、「**[!UICONTROL 含まれるコンポーネント]**」ペインの **[!UICONTROL 指標]** または [!UICONTROL  ディメンション ] リストにドロップします。

      ![CJAのデータビュー 2a](assets/cja-dataview-3.png){zoomable="yes"}

   1. コンポーネントの設定を指定できます。 コンポーネントを選択し、右側のパネルで設定を指定します。 <br/> 例えば、右側のペインの **[!UICONTROL コンポーネント設定]**/`Product Add To Lists` コンポーネント名 **[!UICONTROL フィールドを使用して、]** commerce.productListAdds **[!UICONTROL の名前を]** に変更できます。

      ![CJA データビュー 3b](assets/cja-dataview-3b.png){zoomable="yes"}

      または、**[!UICONTROL 除外値を含める]** を設定します。

      ![CJA データビューコンポーネントの設定 ](assets/cja-dataview-component-settings.png){zoomable="yes"}

   1. これで、データビューにフィールドを追加し、結果のコンポーネントを設定する方法を理解できたので、以下の表を使用してスキーマフィールドのリストを追加し、指標またはディメンションとして追加します。 以下のテーブルの **スキーマパス** 列の値を使用して、特定のスキーマフィールドを検索またはトラバースします。 指標とディメンションを追加したら、コンポーネントに特定の設定が必要かどうかを表の **コンポーネント設定** 列の値を確認します。例えば、コンポーネント名 **[!UICONTROL や、]** INCLUDE EXCLUDE VALUES **[!UICONTROL の定義な]** です。

      **指標**

      | コンポーネント名 | データセット | スキーマデータタイプ | スキーマパス | コンポーネント設定 |
      |---|---|---|---|---|
      | 閉じる | AJO プッシュトラッキングエクスペリエンスイベントデータセット、Luma モバイルアプリイベントデータセット | 整数 | _experience.decisioning.<br/>propositionEventType.dismiss | コンポーネント名：`Dismiss` |
      | 登録解除 | AJO プッシュトラッキングエクスペリエンスイベントデータセット、Luma モバイルアプリイベントデータセット | 整数 | _experience.decisioning.<br/>propositionEventType.unsubscribe | コンポーネント名：`Unsubscribe` |
      | トリガー | AJO プッシュトラッキングエクスペリエンスイベントデータセット、Luma モバイルアプリイベントデータセット | 整数 | _experience.decisioning.<br/>propositionEventType.トリガー | コンポーネント名：`Trigger` |
      | 表示 | AJO プッシュトラッキングエクスペリエンスイベントデータセット、Luma モバイルアプリイベントデータセット | 整数 | _experience.decisioning.<br/>propositionEventType.display | コンポーネント名：`Display` |
      | 送信 | AJO プッシュトラッキングエクスペリエンスイベントデータセット、Luma モバイルアプリイベントデータセット | 整数 | _experience.decisioning.<br/>propositionEventType.send | コンポーネント名：`Send` |
      | 操作 | AJO プッシュトラッキングエクスペリエンスイベントデータセット、Luma モバイルアプリイベントデータセット | 整数 | _experience.decisioning.<br/>propositionEventType.interact | コンポーネント名：`Interact` |
      | 場所のイベント | AJO プッシュトラッキングエクスペリエンスイベントデータセット、Luma モバイルアプリイベントデータセット、ODE DecisionEvents - mobile-and-web-sdk-courses decisioning | 文字列 | イベントタイプ | コンポーネント名：`Location Events`<br/><br/>![ 含める/除外 ](assets/cja-dataview-include-exclude.png){zoomable="yes"} |
      | 製品表示 | Luma モバイルアプリイベントデータセット | Double | commerce.productViews.value | コンポーネント名：`Product Views` |
      | リストへの製品追加 | Luma モバイルアプリイベントデータセット | Double | commerce.productListAdds.value | コンポーネント名：`Product Add To Lists` |
      | 購入 | Luma モバイルアプリイベントデータセット | Double | commerce.purchases.value | コンポーネント名：`Purchases` |
      | 後で使用するために保存 | Luma モバイルアプリイベントデータセット | Double | commerce.saveForLaters.value | コンポーネント名：`Save For Laters` |
      | アプリのインタラクション | Luma モバイルアプリイベントデータセット | Double | _techmarketingdemos.appInformation.<br/>appInteraction.appAction.value | コンポーネント名：`App Interactions` |
      | 画面ビュー | Luma モバイルアプリイベントデータセット | Double | _techmarketingdemos.appInformation.<br/>appStateDetails.screenView.value | コンポーネント名：`Screen Views` |

      {style="table-layout:auto"}

      >[!NOTE]
      >
      >場所イベント指標のスキーマフィールドが **[!UICONTROL INCLUDE EXCLUDE VALUES]** を使用して、`location` を含むイベントタイプをカウントする仕組みに注意してください。


      **[!UICONTROL 指標]** のデータビュー設定は、上記のテーブルからすべてのスキーマフィールドを指標コンポーネントとして追加した後、以下と一致する必要があります。

      ![CJA データビュー 4](assets/cja-dataview-4.png){zoomable="yes"}

      **寸法**

      | コンポーネント名 | データセット | スキーマデータタイプ | スキーマパス | コンポーネント設定 |
      |---|---|---|---|---|
      | 市区町村 | AJO プッシュトラッキングエクスペリエンスイベントデータセット、Luma モバイルアプリイベントデータセット | 文字列 | placeContext.geo.city | コンポーネント名：`City` |
      | イベントタイプ | AJO プッシュトラッキングエクスペリエンスイベントデータセット、Luma モバイルアプリイベントデータセット、ODE DecisionEvents - mobile-and-web-sdk-courses decisioning | 文字列 | eventType | コンポーネント名：`Event Types` |
      | 決定オプション名 | AJO プッシュトラッキングエクスペリエンスイベントデータセット、Luma モバイルアプリイベントデータセット、ODE DecisionEvents - mobile-and-web-sdk-courses decisioning | 文字列 | _experience.decisioning.<br/>propositions.items.name | コンポーネント名：`Decision Option Name` |
      | アプリインタラクション名 | Luma モバイルアプリイベントデータセット | 文字列 | _techmarketingdemos.appInformation.<br/>appInteraction.name | コンポーネント名：`App Interaction Name` |
      | 画面名 | Luma モバイルアプリイベントデータセット | 文字列 | _techmarketingdemos.appInformation.<br/>appStateDetails.screenName | コンポーネント名：`Screen Name` |
      | アクティビティ名 | ODE DecisionEvents - mobile-and-web-sdk-courses decisioning | 文字列 | _experience.decisioning.<br/>propositionDetails.activity.name | コンポーネント名：`Activity Name` |
      | オファー名 | ODE DecisionEvents - mobile-and-web-sdk-courses decisioning | 文字列 | _experience.decisioning.<br/>propositionDetails.selections.name | コンポーネント名：`Offer Name` |

      {style="table-layout:auto"}

      上記のテーブルからすべてのスキーマフィールドをディメンションコンポーネントとして追加したら、**[!UICONTROL DIMENSIONS]** のデータビュー設定は、以下と一致する必要があります。

      ![CJA データビュー 4](assets/cja-dataview-5.png){zoomable="yes"}

   1. **[!UICONTROL 保存して続行]** を選択します。

1. **[!UICONTROL Luma アプリ - AEP モバイルSDK チュートリアルデータ ビューの]** 設定 **[!UICONTROL タブでは]** フィルターとセッションの設定を行うことができます。 このチュートリアルでは、追加の設定は必要ありません。

   - **[!UICONTROL 保存して終了]** を選択します。

データビューを定義し、レポートとビジュアライゼーションの作成を開始するためのすべてが整いました。

## プロジェクトの作成

Workspace プロジェクトは、Customer Journey Analyticsでレポートとビジュアライゼーションを作成するために使用されます。 包括的なレポートと魅力的なビジュアライゼーションを作成する方法は多数ありますが、これはこのチュートリアルの範囲外です。 詳しくは、[Workspaceの概要 ](https://experienceleague.adobe.com/en/docs/customer-journey-analytics-learn/tutorials/analysis-workspace/workspace-projects/analysis-workspace-overview) および [ 新規プロジェクトのビルド ](https://experienceleague.adobe.com/en/docs/customer-journey-analytics-learn/tutorials/analysis-workspace/workspace-projects/build-a-new-project) を参照してください。

レッスンのこのセクションでは、次の場所でレポートとビジュアライゼーションを表示するプロジェクトを作成します。

- アプリ使用状況：画面とアプリのインタラクションに関する情報の使用。
- Commerce：商品表示などのコマースイベントを使用して、買い物かごに追加して購入します。
- オファー：アプリで表示されたイベントのオファーを使用します。
- ストア訪問：アプリからの（シミュレートされた）ジオフェンスイベントを使用。

プロジェクトを作成するには：

1. 右上のアプリ ![ アプリ ](https://spectrum.adobe.com/static/icons/workflow_18/Smock_Apps_18_N.svg) メニューを使用して、Customer Journey Analytics インターフェイスに移動します。

1. 上部メニューバーから **[!UICONTROL 0}Workspace} を選択します。]**

1. **[!UICONTROL プロジェクトを作成]** を選択します。

   1. ポップアップダイアログから **[!UICONTROL 空のWorkspace プロジェクト]** を選択します。

   1. 「**[!UICONTROL 作成]**」を選択します。

      ![CJA プロジェクト - 1](assets/cja-projects-1.png){zoomable="yes"}

1. **[!UICONTROL 新規プロジェクト]** インターフェイスが表示されます。 このインターフェイスでは、レポートとビジュアライゼーションを作成します。

1. プロジェクトの名前（**[!UICONTROL 新規プロジェクト]**）を選択し、プロジェクトの独自の名前を指定します。 例：`Luma App - AEP Mobile SDK Tutorial Project`。
   ![CJA プロジェクト 2](assets/cja-projects-2.png){zoomable="yes"}

1. プロジェクトを保存するには、**[!UICONTROL プロジェクト]**/**[!UICONTROL 保存]** を選択します。
   ![CJA プロジェクト 3](assets/cja-projects-3.png){zoomable="yes"}

1. **[!UICONTROL 保存]** ダイアログで、他のすべてのフィールドを無視して **[!UICONTROL 保存]** を選択します。
   ![CJA プロジェクト 4](assets/cja-projects-4.png){zoomable="yes"}


>[!IMPORTANT]
>
>   必ずプロジェクトを定期的に保存してください。そうしないと、変更内容が失われます。 **[!UICONTROL ctrl + s]** （Windows）または **[!UICONTROL ⌘（cmd） + s]** （macOS）を使用して、プロジェクトをすばやく保存できます。

これで、プロジェクトの設定が完了しました。 デフォルトでは、フリーフォームテーブルが提供されます。 コンポーネントを追加する前に、フリーフォームパネルで正しいデータビューと期間が使用されていることを確認します。

1. ドロップダウンリストからデータ表示を選択します。 例：**[!UICONTROL Luma アプリ - AEP モバイルSDK チュートリアルデータビュー]**。 リストにデータビューが表示されない場合は、ドロップダウンリストの下部にある「**[!UICONTROL すべて表示]** を選択します。
   ![CJA プロジェクト 5](assets/cja-projects-5.png){zoomable="yes"}

1. パネルに適した期間を定義するには、デフォルトのプリセット **[!UICONTROL 今月]** を選択するか、カスタムの開始日と終了日を入力するか、**[!UICONTROL プリセット]** （**[!UICONTROL 過去 6 か月]**）を使用して、「**[!UICONTROL 適用]**」を選択します。
   ![CJA プロジェクト 6](assets/cja-projects-6.png){zoomable="yes"}


### アプリの使用状況

アプリの使用状況をレポートする準備が整いました。 アプリのインタラクションとアプリで使用される画面を登録するために必要なコードをアプリに追加したので（[ イベントの追跡 ](events.md) のレッスンを参照）、このデータについてレポートする必要があります。

#### 画面名

アプリで表示された画面に関するレポートを作成するには：

1. **[!UICONTROL フリーフォーム]** パネルの名前を `App Usage` に変更します。

1. **[!UICONTROL フリーフォームテーブル]** の名前を `Screen Names` に変更します。

1. **[!UICONTROL 指標]** リストの下の **[!UICONTROL すべて表示]** を選択します。

1. **[!UICONTROL スクリーンビュー]** コンポーネントを [!UICONTROL _**指標**をここに（または他のコンポーネント_） ] にドラッグ&amp;ドロップします。
   ![CJA プロジェクト 7](assets/cja-projects-7.png){zoomable="yes"}
フリーフォームテーブルに、選択した期間の各日の画面ビューが表示されるようになりました。 ただし、アプリで使用される様々な画面ごとの画面ビュー数を表示する必要があります。

1. コンポーネントの **[!UICONTROL ディメンション]** リストを表示するには、「![ クロス ](https://spectrum.adobe.com/static/icons/ui_18/CrossSize100.svg)」を選択して、コンポーネントパネルから ![ イベント ](https://spectrum.adobe.com/static/icons/workflow_18/Smock_Event_18_N.svg)**[!UICONTROL 指標]** フィルターを削除します。
   ![CJA プロジェクト 8](assets/cja-projects-8.png){zoomable="yes"}

1. **[!UICONTROL DIMENSIONS]** リストの下の **[!UICONTROL すべて表示]** を選択します。

1. **[!UICONTROL 画面名]** コンポーネントを **[!UICONTROL 日]** ヘッダーにドラッグ&amp;ドロップします。 操作には、寸法の置き換えを示す ![ 切り替え ](https://spectrum.adobe.com/static/icons/workflow_18/Smock_Switch_18_N.svg) **[!UICONTROL 置換]** と表示されます。
   ![CJA プロジェクト 9](assets/cja-projects-9.png){zoomable="yes"}

レポート内の最初のフリーフォームテーブルが完成します。

![CJA プロジェクト 10](assets/cja-projects-10.png){zoomable="yes"}

>[!NOTE]
>
>続行する前にプロジェクトを保存してください。


#### アプリのインタラクション

次に、フリーフォームテーブルを作成して、ユーザーによるアプリの操作をレポートします。

1. ![ 追加 ](https://spectrum.adobe.com/static/icons/workflow_18/Smock_AddCircle_18_N.svg) を選択し、ポップアップ ![ フリーフォームテーブル ](https://spectrum.adobe.com/static/icons/workflow_18/Smock_Table_18_N.svg) から新しいフリーフォームテーブルを追加します。
   ![CJA プロジェクト 11](assets/cja-projects-11.png){zoomable="yes"}

1. **[!UICONTROL フリーフォームテーブル （2）]** の名前を `App Interactions` に変更します。

1. **[!UICONTROL アプリインタラクション]** 指標を [!UICONTROL _ここに&#x200B;**指標**（または他のコンポーネント_）にドラッグ&amp;ドロップ ] ます。

1. **[!UICONTROL アプリインタラクション名]** ディメンションを **[!UICONTROL 日]** ヘッダーにドラッグ&amp;ドロップして、このディメンションを置き換えます。

これで 2 つ目のレポートの準備が整い、アプリのインタラクションが表示されます。
![CJA プロジェクト 12](assets/cja-projects-12.png){zoomable="yes"}

情報が制限される主な理由は、ログイン画面でのみ `MobileSDK.shared.sendAppInteractionEvent(actionName: "<actionName>")` API 呼び出しを実装したためです。 この API 呼び出しをアプリのより多くの画面に追加すると、このレポートはより多くの情報を提供します。

>[!NOTE]
>
>続行する前にプロジェクトを保存してください。


### Commerce

次に、アプリで発生するコマースイベントを、別のパネルでレポートします。

#### Commerce イベント

1. 現在の ![ アプリの使用状況 ](https://spectrum.adobe.com/static/icons/workflow_18/Smock_AddCircle_18_N.svg) パネルの外部にある [!UICONTROL  追加 ] を選択して、新しいパネルを作成します。
   ![CJA プロジェクト 13](assets/cja-projects-13.png){zoomable="yes"}

1. 適切な期間を選択してください。

1. ![ フリーフォームテーブル ](https://spectrum.adobe.com/static/icons/workflow_18/Smock_Table_18_N.svg)**[!UICONTROL フリーフォームテーブル]** を選択して、新しいフリーフォームテーブルを作成します。
   ![CJA プロジェクト 14](assets/cja-projects-14.png){zoomable="yes"}

1. **[!UICONTROL Panel]** の名前を `Commerce` に変更します。

1. **[!UICONTROL フリーフォームテーブル]** の名前を `Commerce Events` に変更します。

1. **[!UICONTROL 製品表示]** 指標を [!UICONTROL _ここに&#x200B;**指標**（または他のコンポーネント_） ] にドラッグ&amp;ドロップします。

1. 「**[!UICONTROL 製品表示]**」列の右側の「**[!UICONTROL リストに製品追加]**」指標をドラッグ&amp;ドロップして、フリーフォームテーブルにこの列を挿入します。 列を挿入する際に、「**[!UICONTROL +追加]**」（青色）が表示されていることを確認します。
   ![CJA プロジェクト 15](assets/cja-projects-15.png){zoomable="yes"}

1. 前の手順を繰り返して、**[!UICONTROL 後で購入するために保存]** 指標および **[!UICONTROL 購入]** 指標をフリーフォームテーブルに追加します。

1. **[!UICONTROL 月]** ディメンションを **[!UICONTROL 日]** ディメンションの上にドラッグ&amp;ドロップして、レポートを日別から月別に変更します。

Commerceのイベントレポートが完成しました。

![CJA プロジェクト 16](assets/cja-projects-16.png){zoomable="yes"}

>[!NOTE]
>
>続行する前にプロジェクトを保存してください。

#### フォールアウト

次に、コマースファネルのフォールアウトビジュアライゼーションを作成します。このビジュアライゼーションでは、商品を閲覧したユーザーのうち何人が買い物かごに商品を追加したかを表示し、そこから後で購入するために商品を保存したユーザーの数を表示します。

1. ![2}Commerce](https://spectrum.adobe.com/static/icons/workflow_18/Smock_AddCircle_18_N.svg) パネル内の「追加 **[!UICONTROL を選択し、ポップアップから]** フォールアウト ![ （フォールアウトビジュアライゼーションを表す）を選択します。](https://spectrum.adobe.com/static/icons/workflow_18/Smock_ConversionFunnel_18_N.svg)

1. **[!UICONTROL タッチポイントを追加]** ドロップダウンリストから [!UICONTROL *製品表示*] を選択します。
   ![CJA プロジェクト 18](assets/cja-projects-18.png){zoomable="yes"}
または、**[!UICONTROL フォールアウト]** ビジュアライゼーションの **[!UICONTROL すべての人物]** ディメンションの下に **[!UICONTROL 製品表示]** ディメンションをドラッグ&amp;ドロップすることもできます。

1. **[!UICONTROL リストへの製品追加]** および **[!UICONTROL 購入]** ディメンションに対して、上記の手順を繰り返します。

フォールアウトビジュアライゼーションレポートが完成しました。
![CJA プロジェクト 19](assets/cja-projects-19.png){zoomable="yes"}

>[!NOTE]
>
>続行する前にプロジェクトを保存してください。


### オファー

アプリのユーザーに表示されるオファーの数と内容をレポートします。

#### 毎月の概要

1. 現在のCommerce パネルの外部にある「![ 追加 ](https://spectrum.adobe.com/static/icons/workflow_18/Smock_AddCircle_18_N.svg)」を選択して、新しいパネルを作成します。

1. **[!UICONTROL Panel]** の名前を `Offers` に変更します。

1. 適切な期間を選択してください。

1. ![ フリーフォームテーブル ](https://spectrum.adobe.com/static/icons/workflow_18/Smock_Table_18_N.svg) フリーフォームテーブルを選択して、新しいフリーフォームテーブルを作成します。

1. **[!UICONTROL フリーフォームテーブル]** の名前を `Monthly Overview` に変更します。

1. **[!UICONTROL 表示]** 指標を [!UICONTROL _ここに&#x200B;**指標**（または他のコンポーネント_） ] にドラッグ&amp;ドロップします。

1. **[!UICONTROL 月]** ディメンションを **[!UICONTROL 日]** 列にドラッグ&amp;ドロップして、ディメンションを置き換えます。

オファーの毎月の概要が完了しました。

![CJA プロジェクト 20](assets/cja-projects-20.png){zoomable="yes"}

>[!NOTE]
>
>続行する前にプロジェクトを保存してください。


#### 人物に対するオファー

また、アプリのユーザーに表示されたオファーの数を示すレポートも必要です。

1. ![ オファー ](https://spectrum.adobe.com/static/icons/workflow_18/Smock_AddCircle_18_N.svg) パネル内の **[!UICONTROL 追加]** を選択し、ポップアップから ![ フリーフォームテーブル ](https://spectrum.adobe.com/static/icons/workflow_18/Smock_Table_18_N.svg) を選択して、新しいフリーフォームテーブルを追加します。

1. **[!UICONTROL フリーフォームテーブル （2）]** の名前を `People` に変更します。

1. **[!UICONTROL 人物]** 指標をこちら（または他のコンポーネント [!UICONTROL _）にドラッグ&amp;ドロップ&#x200B;****指標_ ドロップ ] ます。

1. **[!UICONTROL アクティビティ名]** を **[!UICONTROL 日]** 列にドラッグ&amp;ドロップして、ディメンションを置き換えます。

1. 行を右クリックし、[ 意思決定管理によるオファーの作成および表示 ](journey-optimizer-offers.md) レッスンで定義した 1 つ以上のオファー決定を識別します。 例えば、**[!UICONTROL Luma - モバイルアプリの決定]** などです。

1. コンテキストメニューから、**[!UICONTROL 分類]**/**[!UICONTROL ディメンション]**/**[!UICONTROL オファー名]** を選択します。 これを選択すると、アクティビティ名ディメンションがオファー名に分類されます。
   ![CJA プロジェクト 20b](assets/cja-projects-20b.png){zoomable="yes"}

オファーから人物へのレポートが完了しました。

![CJA プロジェクト 21](assets/cja-projects-21.png){zoomable="yes"}

>[!NOTE]
>
>続行する前にプロジェクトを保存してください。


### ストアの訪問回数

最後に、ストアへの訪問に関するレポートを作成します。

1. 現在のオファーパネルの外部にある「![ 追加 ](https://spectrum.adobe.com/static/icons/workflow_18/Smock_AddCircle_18_N.svg)」を選択して、新しいパネルを作成します。

1. **[!UICONTROL Panel]** の名前を `Store Visits` に変更します。

1. 適切な期間を選択してください。

1. ![ フリーフォームテーブル ](https://spectrum.adobe.com/static/icons/workflow_18/Smock_Table_18_N.svg) フリーフォームテーブルを選択して、新しいフリーフォームテーブルを作成します。

1. **[!UICONTROL フリーフォームテーブル]** の名前を `Store Entries / Exits Across Cities` に変更します。

1. **[!UICONTROL 場所イベント]** 指標を [!UICONTROL _ここに&#x200B;**指標**（または他のコンポーネント_） ] にドラッグ&amp;ドロップします。 レポートには、アプリで発生したすべての場所イベントの日別概要が表示されるようになりました。 [ データビュー ](#create-a-data-view) の一部として、このディメンションを具体的に設定した方法に注意してください。

1. **[!UICONTROL 市区町村]** ディメンションを **[!UICONTROL 日]** 列ヘッダーにドラッグ&amp;ドロップして、ディメンションを置き換えます。 このレポートには、場所イベントの市区町村が表示されます。

1. 都市が関連付けられていないジオロケーションイベントを削除するには、「![ フィルター ](https://spectrum.adobe.com/static/icons/workflow_18/Smock_Filter_18_N.svg) を選択し、「**[!UICONTROL 検索]** ポップアップで **[!UICONTROL 「値を含めない」]** をオフにしてから、**[!UICONTROL 適用]** を選択します。

   ![CJA プロジェクト 22](assets/cja-projects-22.png){zoomable="yes"}

   このアクションは、レポートから **[!UICONTROL 値なし]** 行を削除します。

1. テーブル内のすべての行を選択して右クリックし、コンテキストメニューから分類/ Dimension / イベントタイプを選択します。

ストア訪問レポートが完了しました。 これで、（[ 場所 ](places.md) レッスンでこれらの場所を定義したように）ユーザーが店舗の場所の近く内外にいることを示すレポートが作成されました。

![CJA プロジェクト 23](assets/cja-projects-23.png){zoomable="yes"}

実際にお店を訪れた人について報告したい場合は、ビーコンを使用できます。 しかし、うまくいけば、位置情報データに関するレポートの概念を捉えることができます。

## 次の手順

これで、Customer Journey Analyticsを使用して、モバイルアプリの使用状況、インタラクションなどに関するレポートおよび視覚化の方法を基本的に理解できました。

>[!SUCCESS]
>
>
>Adobe Experience Platform Mobile SDKの学習にご協力いただき、ありがとうございます。 ご不明な点がある場合や、一般的なフィードバックをお寄せになる場合、または今後のコンテンツに関するご提案がある場合は、この [Experience League Community Discussion の投稿 ](https://experienceleaguecommunities.adobe.com/t5/adobe-experience-platform-data/tutorial-discussion-implement-adobe-experience-cloud-in-mobile/td-p/443796) でお知らせください。

次のトピック：**[結論と次のステップ](conclusion.md)**
