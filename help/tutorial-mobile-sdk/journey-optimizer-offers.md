---
title: Platform Mobile SDK を使用したオファーの作成と表示
description: Platform Mobile SDK とAdobe Journey Optimizer Decision Management を使用してオファーを作成および表示する方法について説明します。
solution: Data Collection,Journey Optimizer
feature-set: Journey Optimizer
feature: Offers
jira: KT-14640
exl-id: c08a53cb-683e-4487-afab-fd8828c3d830
source-git-commit: 25f0df2ea09bb7383f45a698e75bd31be7541754
workflow-type: tm+mt
source-wordcount: '2470'
ht-degree: 2%

---

# 決定管理を使用したオファーの作成と表示

Experience PlatformMobile SDK を使用して、モバイルアプリでJourney Optimizer Decision Management のオファーを表示する方法について説明します。

Journey Optimizer Decision Management は、すべてのタッチポイントにわたって最適なオファーとエクスペリエンスを、適切なタイミングで顧客に提供できるようにします。 設計が完了したら、パーソナライズされたオファーを使用してオーディエンスのターゲティングをおこないます。

![アーキテクチャ](assets/architecture-ajo.png)

決定管理を使用すると、Adobe Experience Platformで作成されたリッチなリアルタイムプロファイルにルールと制約を適用するマーケティングオファーの一元化されたライブラリと決定エンジンで、パーソナライゼーションを容易におこなえます。 その結果、顧客に適切なオファーを適切なタイミングで送信できます。 詳しくは、 [決定管理について](https://experienceleague.adobe.com/docs/journey-optimizer/using/offer-decisioning/get-started-decision/starting-offer-decisioning.html?lang=en) を参照してください。




>[!NOTE]
>
>このレッスンはオプションで、決定管理機能を使用してモバイルアプリでオファーを表示したいJourney Optimizerユーザーにのみ適用されます。


## 前提条件

* SDK が正常に構築され、インストールされ、設定された状態でアプリが実行されました。
* アプリをAdobe Experience Platform用に設定します。
* Journey Optimizerへのアクセス — オファーと決定を管理する適切な権限を持つ、説明に従った決定管理 [ここ](https://experienceleague.adobe.com/docs/journey-optimizer/using/access-control/privacy/high-low-permissions.html?lang=en#decisions-permissions).


## 学習内容

このレッスンでは、次の操作を行います

* 決定管理のための Edge 設定を更新します。
* Journey Optimizer - Decisioning 拡張機能でタグプロパティを更新します。
* 提案イベントをキャプチャするためにスキーマを更新します。
* アシュランスで設定を検証します。
* Journey Optimizer — 決定管理でのオファーに基づいて、オファーの決定を作成します。
* Optimizer 拡張機能を登録するには、アプリを更新します。
* アプリに、決定管理からオファーを実装します。


## セットアップ

>[!TIP]
>
>環境を既に [Target での A/B テストの設定](target.md) レッスンでは、このセットアップセクションの手順の一部を既に実行している可能性があります。

### データストリーム設定を更新

モバイルアプリから Platform Edge ネットワークに送信されたデータをJourney Optimizer — 決定管理に確実に転送するには、データストリームを更新します。

1. データ収集 UI で、「 」を選択します。 **[!UICONTROL データストリーム]**&#x200B;を選択し、例えば、データストリームを選択します。 **[!DNL Luma Mobile App]**.
1. 選択 ![その他](https://spectrum.adobe.com/static/icons/workflow_18/Smock_MoreSmallList_18_N.svg) 対象： **[!UICONTROL Experience Platform]** を選択し、 ![編集](https://spectrum.adobe.com/static/icons/workflow_18/Smock_Edit_18_N.svg) **[!UICONTROL 編集]** を選択します。
1. Adobe Analytics の **[!UICONTROL データストリーム]** > ![フォルダー](https://spectrum.adobe.com/static/icons/workflow_18/Smock_Folder_18_N.svg) >  **[!UICONTROL Adobe Experience Platform]** スクリーン、確認する **[!UICONTROL Offer decisioning]**, **[!UICONTROL エッジのセグメント化]**、および **[!UICONTROL Adobe Journey Optimizer]** が選択されている。 Target のレッスンを実行する場合は、 **[!UICONTROL パーソナライズ機能の宛先]**、も参照してください。 詳しくは、 [Adobe Experience Platform設定](https://experienceleague.adobe.com/docs/experience-platform/datastreams/configure.html?lang=en#aep) を参照してください。
1. データストリーム設定を保存するには、 **[!UICONTROL 保存]** .

   ![AEP データストリーム設定](assets/datastream-aep-configuration-offers.png)




### Journey Optimizer - Decisioning タグ拡張機能のインストール

1. に移動します。 **[!UICONTROL タグ]** モバイルタグプロパティを見つけて、プロパティを開きます。
1. 選択 **[!UICONTROL 拡張機能]**.
1. 選択 **[!UICONTROL カタログ]**.
1. を検索します。 **[!UICONTROL Adobe Journey Optimizer — 判定]** 拡張子。
1. 拡張機能をインストールします。 拡張機能に追加の設定は必要ありません。

   ![判定拡張機能の追加](assets/tag-add-decisioning-extension.png)


### スキーマを更新

1. データ収集インターフェイスに移動して、「 」を選択します。 **[!UICONTROL スキーマ]** をクリックします。
1. 選択 **[!UICONTROL 参照]** 上部のバーから。
1. スキーマを選択して開きます。
1. スキーマエディターで、「 」を選択します。 ![追加](https://spectrum.adobe.com/static/icons/workflow_18/Smock_AddCircle_18_N.svg) **[!UICONTROL 追加]** をクリックします。
1. Adobe Analytics の **[!UICONTROL フィールドグループを追加]** ダイアログ ![検索](https://spectrum.adobe.com/static/icons/workflow_18/Smock_Search_18_N.svg) を検索 `proposition`を選択します。 **[!UICONTROL エクスペリエンスイベント — 提案インタラクション]** を選択し、 **[!UICONTROL フィールドグループを追加]**. このフィールドグループは、オファーに関連するエクスペリエンスイベントデータ、つまり提示されるオファーを、そのコレクション、決定、その他のパラメーターの一部として収集します（このレッスンの後半を参照）。 しかし、オファーに関しても何が起こっているのでしょうか？ 表示されるか、操作されるか、閉じられるかなど。
   ![提案](assets/schema-fieldgroup-proposition.png)
1. 選択 **[!UICONTROL 保存]** をクリックして、スキーマに対する変更を保存します。


## アシュランスでの設定の検証

アシュランスで設定を検証するには、次の手順に従います。

1. Assurance UI に移動します。
1. 選択 **[!UICONTROL 設定]** 左側のパネルで、「 」を選択します。 ![追加](https://spectrum.adobe.com/static/icons/workflow_18/Smock_AddCircle_18_N.svg) 次の **[!UICONTROL 設定の検証]** underthen **[!UICONTROL ADOBE JOURNEY OPTIMIZER DECISIONING]**.
1. 「**[!UICONTROL 保存]**」を選択します。
1. 選択 **[!UICONTROL 設定の検証]** をクリックします。 アプリケーションのデータストリーム設定と SDK 設定の両方が検証されます。
   ![AJO 判定の検証](assets/ajo-decisioning-validation.png)


## 配置を作成

実際にオファーを作成する前に、モバイルアプリでこれらのオファーを配置する方法と場所を定義する必要があります。 決定管理では、この目的の配置を定義し、JSON ペイロードをサポートするモバイルチャネルの配置を定義します。

1. Journey Optimizer UI で、 ![コンポーネント](https://spectrum.adobe.com/static/icons/workflow_18/Smock_OfferActivities_18_N.svg)  **[!UICONTROL コンポーネント]** から **[!UICONTROL 決定管理]** をクリックします。

1. 選択 **[!UICONTROL 配置]** 上部のバーから。

1. 名前の配置がない場合 **[!UICONTROL モバイル JSON]**,  **[!UICONTROL モバイル]** as **[!UICONTROL チャネルタイプ]** および **[!UICONTROL JSON]** as **[!UICONTROL コンテンツタイプ]** が表示されたら、配置を作成する必要があります。 それ以外の場合は、 [オファーの作成](#create-offers).

Mobile JSON 配置を作成するには：

1. 選択 ![追加](https://spectrum.adobe.com/static/icons/workflow_18/Smock_AddCircle_18_N.svg) 配置を作成します。

   1. （内） **[!UICONTROL 詳細]** セクションに入力 `Mobile JSON` として **[!UICONTROL 名前]**&#x200B;を選択します。 **[!UICONTROL モバイル]** から **[!UICONTROL チャネルタイプ]** および **[!UICONTROL JSON]** から **[!UICONTROL コンテンツタイプ]**.
   1. 選択 **[!UICONTROL 保存]** をクリックして配置を保存します。

   ![配置を作成](assets/ajo-create-placement.png)



## オファーの作成

1. Journey Optimizer UI で、 ![オファー](https://spectrum.adobe.com/static/icons/workflow_18/Smock_Offers_18_N.svg)  **[!UICONTROL オファー]** から **[!UICONTROL 決定管理]** をクリックします。
1. Adobe Analytics の **[!UICONTROL オファー]** 画面、選択 **[!UICONTROL 参照]** をクリックして、オファーのリストを表示します。
1. 選択 **[!UICONTROL オファーを作成]**.
1. Adobe Analytics の **[!UICONTROL 新しいオファー]** ダイアログ、選択 **[!UICONTROL パーソナライズされたオファー]** をクリックします。 **[!UICONTROL 次へ]**.
1. Adobe Analytics の **[!UICONTROL 詳細]** 一歩 **[!UICONTROL 新しくパーソナライズされたオファーを作成]**:
   1. を入力します。 **[!UICONTROL 名前]** （例：オファー） `Luma - Juno Jacket`をクリックし、 **[!UICONTROL 開始日時]** および **[!UICONTROL 終了日時]**. これらの日付以外では、オファーは Offer Decisioning エンジンによって選択されません。
   1. 「**[!UICONTROL 次へ]**」を選択します。
      ![オファー — 詳細](assets/ajo-offers-details.png)

1. Adobe Analytics の **[!UICONTROL 表示域を追加]** 一歩 **[!UICONTROL 新しくパーソナライズされたオファーを作成]**:
   1. 選択 ![モバイル](https://spectrum.adobe.com/static/icons/workflow_18/Smock_DevicePhone_18_N.svg) **[!UICONTROL モバイル]** から **[!UICONTROL チャネル]** リストと選択 **[!UICONTROL モバイル JSON]** から **[!UICONTROL 配置]** リスト。
   1. 選択 **[!UICONTROL カスタム]** 対象： **[!UICONTROL コンテンツ]**.
   1. 選択 **[!UICONTROL コンテンツを追加]**. Adobe Analytics の **[!UICONTROL パーソナライゼーションを追加]** ダイアログ：
      1. 例： [!UICONTROL モード] セレクターが使用可能な場合は、 **[!UICONTROL JSON]**.
      1. 次の JSON を入力します。

         ```json
         { 
             "title": "Juno Jacket",
             "text": "On colder-than-comfortable mornings, you'll love warming up in the Juno All-Ways Performance Jacket, designed to compete with wind and chill. Built-in Cocona&trade; technology aids evaporation, while a special zip placket and stand-up collar keep your neck protected.", 
             "image": "https://luma.enablementadobe.com/content/dam/luma/en/products/women/tops/jackets/wj06-purple_main.jpg" 
         }  
         ```

      1. 「**[!UICONTROL 保存]**」を選択します。
         ![オファー — カスタムコンテンツ](assets/ajo-offers-customcontent.png)
   1. 「**[!UICONTROL 次へ]**」を選択します。
      ![オファー表示域](assets/ajo-offers-representations.png)

1. Adobe Analytics の **[!UICONTROL 制約を追加]** の手順 **[!UICONTROL 新しくパーソナライズされたオファーを作成]**:
   1. 設定 **[!UICONTROL 優先度]** から `10`.
   1. 切り替え **[!UICONTROL 制限を含める]** オフ。
   1. 「**[!UICONTROL 次へ]**」を選択します。
      ![オファー — 制約](assets/ajo-offers-constraints.png)

1. Adobe Analytics の **[!UICONTROL レビュー]** 一歩 **[!UICONTROL 新しくパーソナライズされたを作成]** オファー：
   1. オファーを確認し、「 」を選択します。 **[!UICONTROL 完了]**.
   1. Adobe Analytics の **[!UICONTROL オファーを保存]** ダイアログ、選択 **[!UICONTROL 保存して承認]**.

1. 手順 3 ～ 8 を繰り返して、異なる名前とコンテンツを持つ 4 つのオファーをさらに作成します。 その他すべての設定値（開始日時や優先度など）は、最初に作成したオファーに似ています。 重複するオファーをすばやく作成して編集できます。

   1. Journey Optimizer UI で、「 ![オファー](https://spectrum.adobe.com/static/icons/workflow_18/Smock_Offers_18_N.svg) **[!UICONTROL オファー]** 左側のレールから、上部のバーの「オファー」を選択します。
   1. 作成したオファーの行を選択します。
   1. 右側のウィンドウで、「 」を選択します。 ![その他](https://spectrum.adobe.com/static/icons/workflow_18/Smock_MoreSmall_18_N.svg) **[!UICONTROL その他のアクション]** コンテキストメニューから、 ![複製](https://spectrum.adobe.com/static/icons/workflow_18/Smock_Duplicate_18_N.svg) **[!UICONTROL 複製]**.

      次の表を使用して、その他の 4 つのオファーを定義します。

      | オファー名 | JSON 形式のオファーコンテンツ |
      |---|---|
      | Luma - Affirm Water Bottle | `{ "title": "Affirm Water Bottle", "text": "You'll stay hydrated with ease with the Affirm Water Bottle by your side or in hand. Measurements on the outside help you keep track of how much you're drinking, while the screw-top lid prevents spills. A metal carabiner clip allows you to attach it to the outside of a backpack or bag for easy access.", "image": "https://luma.enablementadobe.com/content/dam/luma/en/products/gear/fitness-equipment/ug06-lb-0.jpg" }` |
      | Luma - Desire Fitness Tee | `{ "title": "Desiree Fitness Tee", "text": "When you're too far to turn back, thank yourself for choosing the Desiree Fitness Tee. Its ultra-lightweight, ultra-breathable fabric wicks sweat away from your body and helps keeps you cool for the distance.", "image": "https://luma.enablementadobe.com/content/dam/luma/en/products/women/tops/tees/ws05-yellow_main.jpg" }` |
      | Luma - Adrienne Trek Jacket | `{ "title": "Adrienne Trek Jacket", "text": "You're ready for a cross-country jog or a coffee on the patio in the Adrienne Trek Jacket. Its style is unique with stand collar and drawstrings, and it fits like a jacket should.", "image": "https://luma.enablementadobe.com/content/dam/luma/en/products/women/tops/jackets/wj08-gray_main.jpg" }` |
      | Luma - Aero Daily Fitness Tee | `{ "title": "Aero Daily Fitness Tee", "text": "Need an everyday action tee that helps keep you dry? The Aero Daily Fitness Tee is made of 100% polyester wicking knit that funnels moisture away from your skin. Don't be fooled by its classic style; this tee hides premium performance technology beneath its unassuming look.", "image": "https://luma.enablementadobe.com/content/dam/luma/en/products/men/tops/tees/ms01-black_main.jpg" }` |

      {style="table-layout:fixed"}

1. 最後の手順では、フォールバックオファーを作成する必要があります。これは、他のオファーを受ける資格がない場合に顧客に送信されるオファーです。
   1. 選択 **[!UICONTROL オファーを作成]**.
   1. Adobe Analytics の **[!UICONTROL 新しいオファー]** ダイアログ、選択 **[!UICONTROL パーソナライズされたオファー]** を選択し、 **[!UICONTROL 次へ]**.
   1. Adobe Analytics の **[!UICONTROL 詳細]** 一歩 **[!UICONTROL 新しいフォールバックオファーを作成]**、 **[!UICONTROL 名前]** （例：オファー） `Luma - Fallback Offer`をクリックし、次を選択します。 **[!UICONTROL 次へ]**.

   1. Adobe Analytics の **[!UICONTROL 表示域を追加]** 一歩  **[!UICONTROL 新しいフォールバックオファーを作成]**:
      1. 選択 ![モバイル](https://spectrum.adobe.com/static/icons/workflow_18/Smock_DevicePhone_18_N.svg) **[!UICONTROL モバイル]** から **[!UICONTROL チャネル]** リストと選択 **[!UICONTROL モバイル JSON]** から **[!UICONTROL 配置]** リスト。
      1. 選択 **[!UICONTROL カスタム]** 対象： **[!UICONTROL コンテンツ]**.
      1. 選択 **[!UICONTROL コンテンツを追加]**.
      1. Adobe Analytics の **[!UICONTROL パーソナライゼーションを追加]** ダイアログで、次の JSON を入力して、 **[!UICONTROL 保存]**:

         ```json
         {  
            "title": "Luma",
            "text": "Your store for sports wear and equipment.", 
            "image": "https://luma.enablementadobe.com/content/dam/luma/en/logos/Luma_Logo.png" 
         }  
         ```

      1. 「**[!UICONTROL 次へ]**」を選択します。


1. Adobe Analytics の **[!UICONTROL レビュー]** 一歩 **[!UICONTROL 新しいフォールバックを作成]** オファー：
   1. オファーを確認し、「 」を選択します。 **[!UICONTROL 完了]**.
   1. Adobe Analytics の **[!UICONTROL オファーを保存]** ダイアログ、選択 **[!UICONTROL 保存して承認]**.

これで、次のオファーのリストが表示されます。
![オファーリスト](assets/ajo-offers-list.png)


## コレクションの作成

モバイルアプリユーザーにオファーを提示するには、作成した 1 つ以上のオファーで構成されるオファーコレクションを定義する必要があります。

1. Journey Optimizer UI で、 **[!UICONTROL オファー]** をクリックします。
1. 選択 **[!UICONTROL コレクション]** 上部のバーから。
1. 選択 ![追加](https://spectrum.adobe.com/static/icons/workflow_18/Smock_AddCircle_18_N.svg) **[!UICONTROL コレクションを作成]**.
1. Adobe Analytics の **[!UICONTROL 新しいコレクション]** ダイアログで、 **[!UICONTROL 名前]** コレクションの例： `Luma - Mobile App Collection`を選択します。 **[!UICONTROL 静的コレクションを作成]**&#x200B;をクリックし、 **[!UICONTROL 次へ]**.
1. In **[!DNL Luma - Mobile App Collection]**」で、コレクションに含めるオファーを選択します。 このチュートリアルでは、作成した 5 つのオファーを選択します。 検索フィールドを使用して、例えば次のように入力することで、リストを簡単にフィルタリングできます。 **[!DNL Luma]**.
1. 「**[!UICONTROL 保存]**」を選択します。

   ![オファー — コレクション](assets/ajo-collection-offersselected.png)


## 決定の作成

最後の手順は、1 つ以上の決定範囲とフォールバックオファーを組み合わせた決定を定義することです。

決定範囲は、特定の配置 ( 電子メールのHTML、モバイルアプリの JSON など ) と 1 つ以上の評価条件の組み合わせです。

評価条件は、

* オファーコレクション
* 実施要件ルール：例えば、は特定のオーディエンスに対してのみ利用できるオファーです。
* ランキング方法：複数のオファーを選択できる場合、どの方法を使用してランク付けするか（例：オファーの優先度、数式または AI モデルを使用する方法）。

詳しくは、 [オファーを作成および管理するための主な手順](https://experienceleague.adobe.com/docs/journey-optimizer/using/offer-decisioning/get-started-decision/key-steps.html?lang=en) 配置、ルール、ランキング、オファー、表示域、コレクション、決定などの方法をより深く理解したい場合は、相互にやり取りし、関係を持ち合わせます。 このレッスンでは、Journey Optimizer — 決定管理内で決定を柔軟に定義するのではなく、決定の出力の使用にのみ焦点を当てています。

1. Journey Optimizer UI で、 **[!UICONTROL オファー]** をクリックします。
1. 選択 **[!UICONTROL 決定]** 上部のバーから。
1. 選択 ![追加](https://spectrum.adobe.com/static/icons/workflow_18/Smock_AddCircle_18_N.svg) **[!UICONTROL 決定を作成]**.
1. Adobe Analytics の **[!UICONTROL 詳細]** 一歩 **[!UICONTROL 新しいオファーの決定を作成]**:
   1. を入力します。 **[!UICONTROL 名前]** （例：決定） `Luma - Mobile App Decision`，と入力します。 **[!UICONTROL 開始日時]** および **[!UICONTROL 終了日時]**.
   1. 「**[!UICONTROL 次へ]**」を選択します。

1. Adobe Analytics の **[!UICONTROL 決定範囲を追加]** 一歩 **[!UICONTROL 新しいオファーの決定を作成]**:
   1. 選択 **[!UICONTROL モバイル JSON]** から **[!UICONTROL 配置]** リスト。
   1. Adobe Analytics の **[!UICONTROL 評価条件]** タイル、選択 ![追加](https://spectrum.adobe.com/static/icons/workflow_18/Smock_AddCircle_18_N.svg) **[!UICONTROL 追加]**.
      1. Adobe Analytics の **[!UICONTROL オファーコレクションを追加]** ダイアログで、オファーコレクションを選択します。 例：**[!DNL Luma - Mobile App Collection]**。
      1. 「**[!UICONTROL 追加]**」を選択します。
         ![決定 — コレクションを選択](assets/ajo-decision-selectcollection.png)
   1. 以下を確認します。 **[!UICONTROL なし]** 次の項目が選択されています： **[!UICONTROL 適格要件]**、および **[!UICONTROL オファーの優先度]** が **[!UICONTROL ランキングメソッド]**.
   1. 「**[!UICONTROL 次へ]**」を選択します。
      ![決定範囲](assets/ajo-decision-scopes.png).
1. Adobe Analytics の **[!UICONTROL フォールバックオファーを追加]** 一歩 **[!UICONTROL 新しいオファーの決定を作成]**:
   1. フォールバックオファー ( 例えば、 **[!DNL Luma - Fallback offer]**.
   1. 「**[!UICONTROL 次へ]**」を選択します。
1. Adobe Analytics の **[!UICONTROL 概要]** 一歩 **[!UICONTROL 新しいオファーの決定を作成]**:
   1. 「**[!UICONTROL 完了]**」を選択します。
   1. Adobe Analytics の **[!UICONTROL オファーの決定を保存]** ダイアログ、選択 **[!UICONTROL 保存してアクティブ化]**.
   1. Adobe Analytics の **[!UICONTROL 決定]** タブに、決定がステータスと共に表示されます。 **[!UICONTROL ライブ]**.

これで、一連のオファーで構成されるオファーの決定を使用する準備が整いました。 アプリで決定を使用するには、コード内で決定範囲を参照する必要があります。

1. Journey Optimizer UI で、 **[!UICONTROL オファー]**.
1. 選択 **[!UICONTROL 決定]** 上部のバーから。
1. 決定を選択します（例： ）。 **[!DNL Luma - Mobile App Decision]**.
1. Adobe Analytics の **[!UICONTROL 決定範囲]** タイル、選択 ![コピー](https://spectrum.adobe.com/static/icons/workflow_18/Smock_Copy_18_N.svg) **[!UICONTROL コピー]**.
1. コンテキストメニューで、「 」を選択します。 **[!UICONTROL 決定範囲]**.
   ![決定範囲をコピー](assets/ajo-copy-decisionscope.png)
1. 任意のテキストエディターを使用して、後で使用するために決定範囲を貼り付けます。 決定範囲は、次の JSON 形式になります。

   ```json
   {
       "xdm:activityId":"xcore:offer-activity:xxxxxxxxxxxxxxx",
       "xdm:placementId":"xcore:offer-placement:xxxxxxxxxxxxxxx"
   }
   ```

## アプリにオファーを実装する

前のレッスンで説明したように、モバイルタグ拡張機能のインストールでは設定のみが提供されます。 次に、Optimize SDK をインストールして登録する必要があります。 これらの手順が明確でない場合は、 [SDK のインストール](install-sdks.md) 」セクションに入力します。

>[!NOTE]
>
>以下を完了した場合、 [SDK のインストール](install-sdks.md) 」セクションに移動した場合は、SDK が既にインストールされているので、この手順をスキップできます。
>

1. Xcode で、 [AEP 最適化](https://github.com/adobe/aepsdk-messaging-ios) は、パッケージの依存関係にパッケージのリストに追加されます。 詳しくは、 [Swift Package Manager](install-sdks.md#swift-package-manager).
1. に移動します。 **[!DNL Luma]** > **[!DNL Luma]** > **[!UICONTROL AppDelegate]** 」をクリックします。
1. 確認 `AEPOptimize` は、インポートのリストの一部です。

   ```swift
   import AEPOptimize
   ```

1. 確認 `Optimize.self` は、登録する拡張機能の配列の一部です。

   ```swift
   let extensions = [
       AEPIdentity.Identity.self,
       Lifecycle.self,
       Signal.self,
       Edge.self,
       AEPEdgeIdentity.Identity.self,
       Consent.self,
       UserProfile.self,
       Places.self,
       Messaging.self,
       Optimize.self,
       Assurance.self
   ]
   ```

1. に移動します。 **[!DNL Luma]** > **[!DNL Luma]** > **[!DNL Model]** > **[!DNL Data]** > **[!UICONTROL 決定]** 」をクリックします。 を更新します。 `activityId` および `placementId` 値と、Journey Optimizerインターフェイスからコピーした決定範囲の詳細。

1. に移動します。 **[!DNL Luma]** > **[!DNL Luma]** > **[!DNL Utils]** > **[!UICONTROL MobileSDK]** 」をクリックします。 次を検索： `func updatePropositionOD(ecid: String, activityId: String, placementId: String, itemCount: Int) async` 関数に置き換えます。 次のコードを追加します。

   ```swift
   // set up the XDM dictionary, define decision scope and call update proposition API
   Task {  
      let ecid = ["ECID" : ["id" : ecid, "primary" : true] as [String : Any]]
      let identityMap = ["identityMap" : ecid]
      let xdmData = ["xdm" : identityMap]
      let decisionScope = DecisionScope(activityId: activityId, placementId: placementId, itemCount: UInt(itemCount))
      Optimize.clearCachedPropositions()
      Optimize.updatePropositions(for: [decisionScope], withXdm: xdmData)
   }
   ```

   この関数：

   * XDM 辞書の設定 `xdmData`：オファーを提示する必要があるプロファイルを識別する ECID が含まれます。
   * 定義 `decisionScope`: Journey Optimizer - Decision Management インターフェイスで定義した決定に基づくオブジェクトで、次の場所からコピーした決定スコープを使用して定義されます。 [決定の作成](#create-a-decision).  Luma アプリは設定ファイル (`decisions.json`) を呼び出し、次の JSON 形式に基づいてスコープパラメーターを取得します。

     ```swift
     "scopes": [
         {
             "name": "name of the scope",
             "activityId": "xcore:offer-activity:xxxxxxxxxxxxxxx",
             "placementId": "xcore:offer-placement:xxxxxxxxxxxxxxx",
             "itemCount": 2
         }
     ]
     ```

     ただし、あらゆる種類の実装を使用して、Optimize API が適切なパラメーター (`activityId`, `placementId` そして `itemCount`) を呼び出し、有効な [`DecisionScope`](https://developer.adobe.com/client-sdks/documentation/adobe-journey-optimizer-decisioning/api-reference/#decisionscope) オブジェクトを設定します。 <br/>使用する情報： `decisions.json` ファイルは将来の使用のためのもので、このレッスンでは現在、チュートリアルの一部として使用されています。

   * は、2 つの API を呼び出します。 [`Optimize.clearCachePropositions`](https://support.apple.com/en-ie/guide/mac-help/mchlp1015/mac)  および [`Optimize.updatePropositions`](https://developer.adobe.com/client-sdks/documentation/adobe-journey-optimizer-decisioning/api-reference/#updatepropositions).  これらの関数は、キャッシュされた提案をすべて消去し、このプロファイルの提案を更新します。

1. に移動します。 **[!DNL Luma]** > **[!DNL Luma]** > **[!DNL Views]** > **[!UICONTROL パーソナライズ]** > **[!UICONTROL EdgeOffersView]** 」をクリックします。 次を検索： `func onPropositionsUpdateOD(activityId: String, placementId: String, itemCount: Int) async` 関数を参照し、この関数のコードを調べます。 この関数の最も重要な部分は、 [`Optimize.onPropositionsUpdate`](https://developer.adobe.com/client-sdks/documentation/adobe-journey-optimizer-decisioning/api-reference/#onpropositionsupdate) API 呼び出し (

   * は、(Journey Optimizer — 決定管理で定義した ) 決定範囲に基づいて、現在のプロファイルの提案を取得します。
   * 提案からオファーを取得します。
   * オファーのコンテンツをアプリに正しく表示できるようにアンラップし、
   * トリガー `displayed()` オファーが表示されたことを通知するイベントを Edge ネットワークに送り返す、オファーに対するアクション。

1. まだ **[!DNL EdgeOffersView]**&#x200B;を使用して、次のコードを `.onFirstAppear` 修飾子 このコードにより、オファーを更新するためのコールバックが 1 回だけ登録されるようになります。

   ```swift
   // Invoke callback for offer updates
   Task {
       await self.onPropositionsUpdateOD(activityId: decision.activityId, placementId: decision.placementId, itemCount: decision.itemCount)
   }
   ```

1. まだ **[!UICONTROL EdgeOffersView]**&#x200B;を使用して、次のコードを `.task` 修飾子 このコードは、ビューが更新されるとオファーを更新します。

   ```swift
   // Clear and update offers
   await self.updatePropositionsOD(ecid: currentEcid, activityId: decision.activityId, placementId: decision.placementId, itemCount: decision.itemCount)
   ```



## アプリを使用した検証

1. を使用して、シミュレーターまたは Xcode の物理デバイスでアプリを再構築し、実行します。 ![再生](https://spectrum.adobe.com/static/icons/workflow_18/Smock_Play_18_N.svg).

1. 「**[!DNL Personalisation]**」タブに移動します。

1. **[!DNL Edge Personalisation]** を選択します。

1. 上部にスクロールすると、 **[!DNL DECISION LUMA - MOBILE APP DECISION]** タイル。

   <img src="assets/ajo-app-offers.png" width="300">

   すべてのオファーに同じ優先順位を付け、判定のランクは優先度に基づいているので、オファーはランダムです。


## アシュランスでの実装の検証

アシュランスでオファーの実装を検証するには、次の手順に従います。

1. 以下を確認します。 [設定手順](assurance.md#connecting-to-a-session) シミュレーターまたはデバイスを Assurance に接続するには、「 」セクションを参照してください。
1. 選択 **[!UICONTROL 設定]** 左側のパネルで、「 」を選択します。 ![追加](https://spectrum.adobe.com/static/icons/workflow_18/Smock_AddCircle_18_N.svg) 次の **[!UICONTROL レビューとシミュレーション]** underthen **[!UICONTROL ADOBE JOURNEY OPTIMIZER DECISIONING]**.
1. 「**[!UICONTROL 保存]**」を選択します。
1. 選択 **[!UICONTROL レビューとシミュレーション]** をクリックします。 データストリームの設定と、アプリケーションでの SDK の設定の両方が検証されます。
1. 選択 **[!UICONTROL リクエスト]** 上部のバーに 表示される **[!UICONTROL オファー]** リクエスト。
   ![AJO 判定の検証](assets/assurance-decisioning-requests.png)

1. 参照可能 **[!UICONTROL シミュレート]** および **[!UICONTROL イベントリスト]** タブをクリックして機能を追加します。Journey Optimizer Decision Management の設定を確認します。

## 次の手順

これで、Journey Optimizer — 決定管理実装に機能を追加するためのすべてのツールが揃いました。 以下に例を示します。

* オファーに異なるパラメーター（優先度、キャッピングなど）を適用する
* アプリでのプロファイル属性の収集 ( [プロファイル](profile.md)) をクリックし、これらのプロファイル属性を使用してオーディエンスを構築します。 その後、これらのオーディエンスを、決定の実施要件ルールの一部として使用します。
* 複数の決定範囲を組み合わせます。

>[!SUCCESS]
>
>Experience PlatformMobile SDK のJourney Optimizer - Decisioning 拡張機能を使用して、アプリにオファーを表示できるようにしました。
>
>Adobe Experience Platform Mobile SDK の学習に時間を割いていただき、ありがとうございます。 ご質問がある場合、一般的なフィードバックを共有する場合、または今後のコンテンツに関する提案がある場合は、このドキュメントで共有します [Experience Leagueコミュニティディスカッション投稿](https://experienceleaguecommunities.adobe.com/t5/adobe-experience-platform-data/tutorial-discussion-implement-adobe-experience-cloud-in-mobile/td-p/443796).

次へ： **[A/B テストの実行](target.md)**
