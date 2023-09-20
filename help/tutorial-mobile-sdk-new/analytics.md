---
title: Analytics データの収集とマッピング
description: モバイルアプリでAdobe Analyticsのデータを収集し、マッピングする方法を説明します。
solution: Data Collection,Experience Platform,Analytics
hide: true
source-git-commit: cd1efbfaa335c08cbcc22603fe349b4594cc1056
workflow-type: tm+mt
source-wordcount: '629'
ht-degree: 2%

---

# Analytics データの収集とマッピング

モバイルデータをAdobe Analyticsにマッピングする方法を説明します。

The [イベント](events.md) 以前のレッスンで収集し、Platform Edge Network に送信したデータは、Adobe Analyticsを含む、データストリームで設定されたサービスに転送されます。 データをレポートスイート内の正しい変数にマッピングします。

![アーキテクチャ](assets/architecture-aa.png)

## 前提条件

* ExperienceEvent 追跡について理解します。
* サンプルアプリに XDM データが正常に送信されました。
* Adobe Analyticsに設定されたデータストリーム

## 学習内容

このレッスンでは、次の操作を実行します。

* データストリームをAdobe Analyticsサービスで設定します。
* Analytics 変数の自動マッピングについて説明します。
* XDM データを Analytics 変数にマッピングする処理ルールを設定します。

## Adobe Analytics Datastream サービスの追加

XDM データを Edge ネットワークからAdobe Analyticsに送信するには、Adobe Analyticsサービスを、 [データストリームの作成](create-datastream.md).

1. データ収集 UI で、「 」を選択します。 **[!UICONTROL データストリーム]** お使いのデータストリーム。

1. 次に、 ![追加](https://spectrum.adobe.com/static/icons/workflow_18/Smock_AddCircle_18_N.svg) **[!UICONTROL サービスを追加]**.

1. 追加 **[!UICONTROL Adobe Analytics]** から [!UICONTROL サービス] リスト

1. Adobe Analyticsで使用するレポートスイートの名前を入力します。 **[!UICONTROL レポートスイート ID]**.

1. 切り替えてサービスを有効にする **[!UICONTROL 有効]** オン。

1. 「**[!UICONTROL 保存]**」を選択します。

   ![Adobe Analyticsをデータストリームサービスとして追加](assets/datastream-service-aa.png)


## 自動マッピング

標準 XDM フィールドの多くは、Analytics 変数に自動的にマッピングされます。 完全なリストについては、[こちら](https://experienceleague.adobe.com/docs/experience-platform/edge/data-collection/adobe-analytics/automatically-mapped-vars.html?lang=en)を参照してください。

### 例#1 - s.products

好例は [products 変数](https://experienceleague.adobe.com/docs/analytics/implementation/vars/page-vars/products.html?lang=en) 処理ルールを使用して入力できない XDM 実装を使用すると、必要なデータをすべてに渡すことができます `productListItems` および `s.products` は、Analytics マッピングを使用して自動的に入力されます。

このオブジェクト：

```swift
"productListItems": [
    [
      "name":  "Yoga Mat",
      "SKU": "5829",
      "priceTotal": "49.99",
      "quantity": 1
    ],
    [
      "name":  "Water Bottle",
      "SKU": "9841",
      "priceTotal": "30.00",
      "quantity": 3
    ]
]
```

結果：

```
s.products = ";Yoga Mat;1;49.99,;Water Bottle,3,30.00"
```

>[!NOTE]
>
>現在 `productListItems[N].SKU` は、自動マッピングでは無視されます。


### 例#2 - scAdd

よく見ると、すべてのイベントには 2 つのフィールドがあります `value` （必須）および `id` （オプション）。 The `value` フィールドを使用して、イベント数を増分します。 The `id` フィールドはシリアル化に使用されます。

このオブジェクト：

```swift
"commerce" : {
  "productListAdds" : {
    "value" : 1
  }
}
```

結果：

```
s.events = "scAdd"
```

このオブジェクト：

```swift
"commerce" : {
  "productListAdds" : {
    "value" : 1,
    "id": "321435"
  }
}
```

結果：

```
s.events = "scAdd:321435"
```

## アシュランスで検証

の使用 [アシュランス](assurance.md) エクスペリエンスイベントの送信中で、XDM データが正しく、Analytics のマッピングが期待どおりにおこなわれていることを確認できます。 以下に例を示します。

1. productListAdds イベントを送信します。

1. ExperienceEvent ヒットを表示します。

   ![analytics xdm ヒット](assets/analytics-assurance-experiencevent.png)

1. JSON の XDM の部分を確認します。

   ```json
   "xdm" : {
     "productListItems" : [ {
       "SKU" : "LLWS05.1-XS",
       "name" : "Desiree Fitness Tee",
       "priceTotal" : 24
     } ],
   "timestamp" : "2023-08-04T12:53:37.662Z",
   "eventType" : "commerce.productListAdds",
   "commerce" : {
     "productListAdds" : {
       "id" : "LLWS05.1-XS",
       "value" : 1
     }
   }
   // ...
   ```

1. 以下を確認します。 **[!UICONTROL analytics.mapping]** イベント。

   ![analytics xdm ヒット](assets/analytics-assurance-mapping.png)

Analytics マッピングでは、次の点に注意してください。

* **[!UICONTROL イベント]** が `scAdd` 基準： `commerce.productListAdds`.
* **[!UICONTROL pl]** （products 変数）は、 `productListItems`.
* このイベントには、すべてのコンテキストデータを含む他の興味深い情報が含まれています。


## コンテキストデータを使用したマッピング

Analytics に転送された XDM データは、 [コンテキストデータ](https://experienceleague.adobe.com/docs/mobile-services/ios/getting-started-ios/proc-rules.html?lang=en) 標準フィールドとカスタムフィールドの両方を含む。

コンテキストデータキーは、次の構文に従って生成されます。

```
a.x.[xdm path]
```

以下に例を示します。

```
// Standard Field
a.x.commerce.saveforlaters.value

// Custom Field
a.x._techmarketingdemos.appinformation.appstatedetails.screenname
```

>[!NOTE]
>
>カスタムフィールドは、Experience CloudOrg ID の下に配置されます。
>
>`_techmarketingdemos` は組織の一意の値に置き換えられます。

この XDM コンテキストデータをレポートスイートの Analytics データにマッピングするには、次の操作を実行します。

* 次を追加： **[!UICONTROL Adobe Analytics ExperienceEvent Full 拡張機能]** フィールドグループをスキーマに追加します。

  ![Analytics ExperienceEvent FullExtension フィールドグループ](assets/schema-analytics-extension.png)
* 「 Tags 」プロパティでルールを作成し、コンテキストデータを「 Adobe Analytics ExperienceEvent Full Extension 」フィールドグループのフィールドにマッピングします。 例：map `_techmarketingdemo.appinformation.appstatedetails.screenname` から `_experience.analytics.customDimensions.eVars.eVar2`.

<!-- Old processing rules section
Here is what a processing rule using this data might look like:

* You **[!UICONTROL Overwrite value of]** (1) **[!UICONTROL App Screen Name (eVar2)]** (2) with the value of **[!UICONTROL a.x._techmarketingdemo.appinformation.appstatedetails.screenname]** (3) if **[!UICONTROL a.x._techmarketingdemo.appinformation.appstatedetails.screenname]** (4) **[!UICONTROL is set]** (5).

* You **[!UICONTROL Set event]** (6) **[!UICONTROL Add to Wishlist (Event 3)]** (7) to **[!UICONTROL a.x.commerce.saveForLaters.value(Context)]** (8) if **[!UICONTROL a.x.commerce.saveForLaters.value(Context)]** (9) **[!UICONTROL is set]** (10).

![analytics processing rules](assets/analytics-processing-rules.png)

>[!IMPORTANT]
>
>
>Some of the automatically mapped variables may not be available for use in processing rules.
>
>
>The first time you map to a processing rule, the interface does not show you the context data variables from the XDM object. To fix that select any value, Save, and come back to edit. All XDM variables should now appear.


Additional information about processing rules and context data can be found [here](https://experienceleague.adobe.com/docs/analytics-learn/tutorials/implementation/implementation-basics/map-contextdata-variables-into-props-and-evars-with-processing-rules.html?lang=en).

>[!TIP]
>
>Unlike previous mobile app implementations, there is no distinction between a page / screen views and other events. Instead you can increment the **[!UICONTROL Page View]** metric by setting the **[!UICONTROL Page Name]** dimension in a processing rule. Since you are collecting the custom `screenName` field in the tutorial, it is highly recommended to map screen name to **[!UICONTROL Page Name]** in a processing rule.

-->

>[!SUCCESS]
>
>Experience Edge XDM オブジェクトをAdobe Analytics変数にマッピングするアプリを設定し、データストリームでAdobe Analyticsサービスを有効にし、必要に応じて処理ルールを使用します。<br/> Adobe Experience Platform Mobile SDK の学習に時間を割いていただき、ありがとうございます。 ご質問がある場合、一般的なフィードバックを共有する場合、または今後のコンテンツに関する提案がある場合は、このドキュメントで共有します [Experience Leagueコミュニティディスカッション投稿](https://experienceleaguecommunities.adobe.com/t5/adobe-experience-platform-launch/tutorial-discussion-implement-adobe-experience-cloud-in-mobile/td-p/443796).

次へ： **[Experience Platform](platform.md)**
