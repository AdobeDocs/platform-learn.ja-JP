---
title: Analytics マッピング
description: モバイルアプリでAdobe Analyticsのデータを収集する方法を説明します。
solution: Data Collection,Experience Platform,Analytics
hide: true
source-git-commit: e119e2bdce524c834cdaf43ed9eb9d26948b0ac6
workflow-type: tm+mt
source-wordcount: '653'
ht-degree: 1%

---

# Analytics マッピング

モバイルデータをAdobe Analyticsにマッピングする方法を説明します。

The [イベント](events.md) 以前のレッスンで収集し、Platform Edge Network に送信したデータは、Adobe Analyticsを含む、データストリームで設定されたサービスに転送されます。 データをレポートスイート内の正しい変数にマッピングします。

## 前提条件

* ExperienceEvent 追跡について理解します。
* サンプルアプリに XDM データが正常に送信されました。
* Adobe Analyticsに設定されたデータストリーム

## 学習内容

このレッスンでは、次の操作を実行します。

* Analytics 変数の自動マッピングについて説明します。
* XDM データを Analytics 変数にマッピングする処理ルールを設定します。

## 自動マッピング

標準 XDM フィールドの多くは、Analytics 変数に自動的にマッピングされます。 完全なリストについては、[こちら](https://experienceleague.adobe.com/docs/experience-platform/edge/data-collection/adobe-analytics/automatically-mapped-vars.html?lang=en)を参照してください。

### 例#1 - s.products

好例は [products 変数](https://experienceleague.adobe.com/docs/analytics/implementation/vars/page-vars/products.html?lang=en) 処理ルールを使用して入力できない XDM 実装では、必要なすべてのデータを productListItems に渡し、s.products は、Analytics マッピングを通じて自動的に入力されます。

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

その結果、次のようになります。

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

その結果、次のようになります。

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

その結果、次のようになります。

```
s.events = "scAdd:321435"
```

## アシュランスで検証

の使用 [アシュランス QA ツール](assurance.md) ExperienceEvent の送信中で、XDM データが正しく、Analytics のマッピングが期待どおりに実行されていることを確認できます。 以下に例を示します。

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
//Standard Field
a.x.commerce.saveforlaters.value

//Custom Field
a.x._techmarketingdemos.appinformationa.appstatedetails.screenname
```

>[!NOTE]
>
>カスタムフィールドは、Experience CloudOrg ID の下に配置されます。
>
>`_techmarketingdemos` は組織の一意の値に置き換えられます。


このデータを使用する処理ルールは次のようになります。

* あなた **[!UICONTROL の値を上書き]** 1) **[!UICONTROL アプリの画面名 (eVar2)]** (2) **[!UICONTROL a.x._techmarketingdemo.appinformation.appstatedetails.screenname]** (3) **[!UICONTROL a.x._techmarketingdemo.appinformation.appstatedetails.screenname]** 4) **[!UICONTROL 設定済み]** (5)

* あなた **[!UICONTROL イベントを設定]** (6) **[!UICONTROL ウィッシュリストに追加（イベント 3）]** (7) から **[!UICONTROL a.x.commerce.saveForLaters.value(Context)]** (8) **[!UICONTROL a.x.commerce.saveForLaters.value(Context)]** (9) **[!UICONTROL 設定済み]** (10).

![分析処理ルール](assets/analytics-processing-rules.png)

>[!IMPORTANT]
>
>
>自動的にマッピングされた変数の一部は、処理ルールで使用できない場合があります。
>
>
>初めて UI で処理ルールにマッピングしたときに、XDM オブジェクトのコンテキストデータ変数が表示されません。 任意の値を選択する場合は、「保存」をクリックし、再び編集を開始します。 これで、すべての XDM 変数が表示されます。


処理ルールとコンテキストデータに関する追加情報が見つかりました [ここ](https://experienceleague.adobe.com/docs/analytics-learn/tutorials/implementation/implementation-basics/map-contextdata-variables-into-props-and-evars-with-processing-rules.html?lang=en).

>[!TIP]
>
>以前のモバイルアプリの実装とは異なり、ページ/画面ビューと他のイベントとは区別されません。 代わりに、 **[!UICONTROL ページビュー]** 指標を設定して **[!UICONTROL ページ名]** ディメンションが含まれています。 カスタム `screenName` チュートリアルのフィールドでは、画面名を **[!UICONTROL ページ名]** 」と表示されます。

>[!SUCCESS]
>
>Experience Edge XDM オブジェクトをAdobe Analytics変数にマッピングするアプリを設定し、データストリームでAdobe Analyticsサービスを有効にし、必要に応じて処理ルールを使用します。<br/> Adobe Experience Platform Mobile SDK の学習に時間を割いていただき、ありがとうございます。 ご質問がある場合、一般的なフィードバックを共有する場合、または今後のコンテンツに関する提案がある場合は、このドキュメントで共有します [Experience Leagueコミュニティディスカッション投稿](https://experienceleaguecommunities.adobe.com/t5/adobe-experience-platform-launch/tutorial-discussion-implement-adobe-experience-cloud-in-mobile/td-p/443796).

次へ： **[Experience Platform](platform.md)**
