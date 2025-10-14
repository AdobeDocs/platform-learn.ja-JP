---
title: Platform Mobile SDKで収集されたデータをAdobe Analyticsにマッピングする
description: モバイルアプリでAdobe Analyticsのデータを収集し、マッピングする方法を説明します。
solution: Data Collection,Experience Platform,Analytics
jira: KT-14636
exl-id: 406dc687-643f-4f7b-a8e7-9aad1d0d481d
source-git-commit: 008d3ee066861ea9101fe9fe99ccd0a088b63f23
workflow-type: tm+mt
source-wordcount: '1033'
ht-degree: 0%

---

# Analytics データの収集とマッピング

モバイルデータをAdobe Analyticsにマッピングする方法について説明します。

以前のレッスンで収集して Platform Edge Networkに送信した [&#x200B; イベント &#x200B;](events.md) データは、Adobe Analyticsを含むデータストリームで設定されたサービスに転送されます。 データをレポートスイートの正しい変数にマッピングします。

![アーキテクチャ](assets/architecture-aa.png){zoomable="yes"}

## 前提条件

* ExperienceEvent トラッキングの理解。
* サンプルアプリで XDM データを正常に送信しました。
* このレッスンで使用できるAdobe Analytics レポートスイート。

## 学習目標

このレッスンでは、次の操作を行います。

* Adobe Analytics サービスを使用してデータストリームを設定します。
* Analytics 変数の自動マッピングについて説明します。
* XDM データを Analytics 変数にマッピングする処理ルールを設定します。

## Adobe Analytics データストリームサービスを追加

XDM データをEdge NetworkからAdobe Analyticsに送信するには、[&#x200B; データストリームの作成 &#x200B;](create-datastream.md) の一部として設定したデータストリームに対して、Adobe Analytics サービスを設定します。

1. データ収集 UI で、「**[!UICONTROL データストリーム]** とデータストリームを選択します。

1. 次に、「![&#x200B; 追加 &#x200B;](https://spectrum.adobe.com/static/icons/workflow_18/Smock_AddCircle_18_N.svg)**[!UICONTROL サービスを追加]**」を選択します。

1. **[!UICONTROL サービス]** リストから [!UICONTROL Adobe Analytics] を追加します。

1. **[!UICONTROL レポートスイート ID]** で使用する、Adobe Analyticsのレポートスイートの名前を入力します。

1. **[!UICONTROL 有効]** をオンにしてサービスを有効にします。

1. 「**[!UICONTROL 保存]**」を選択します。

   ![Adobe Analyticsをデータストリームサービスとして追加 &#x200B;](assets/datastream-service-aa.png){zoomable="yes"}


## 自動マッピング

標準 XDM フィールドの多くは、Analytics 変数に自動的にマッピングされます。 [&#x200B; 完全なリスト &#x200B;](https://experienceleague.adobe.com/ja/docs/analytics/implementation/aep-edge/xdm-var-mapping) を参照してください。

### 例#1 - s.products

良い例は、処理ルールを使用して入力できない [products 変数 &#x200B;](https://experienceleague.adobe.com/ja/docs/analytics/implementation/vars/page-vars/products) です。 XDM 実装を使用すると、必要なデータをすべて `productListItems` に渡し、Analytics マッピング `s.products` よってデータが自動的に入力されます。

このオブジェクトは、

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
s.products = ";5829;1;49.99,9841;3;30.00"
```

>[!NOTE]
>
>`productListItems[].SKU` と `productListItems[].name` の両方にデータが含まれている場合、`productListItems[].SKU` の値が使用されます。 詳しくは、[Adobe Experience Edgeの Analytics 変数のマッピング &#x200B;](https://experienceleague.adobe.com/ja/docs/analytics/implementation/aep-edge/xdm-var-mapping) を参照してください。


### 例#2 - scAdd

詳しく見ると、すべてのイベントには `value` （必須）と `id` （オプション）の 2 つのフィールドがあります。 `value` フィールドは、イベント数を増分するために使用されます。 シリアル化には `id` フィールドを使用します。

このオブジェクトは、

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

このオブジェクトは、

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

## Assurance での検証

[Assuranceを使用すると &#x200B;](assurance.md) エクスペリエンスイベントを送信しており、XDM データが正しく、Analytics マッピングが期待どおりに行われていることを確認できます。

1. [&#x200B; 設定手順 &#x200B;](assurance.md#connecting-to-a-session) の節を参照して、シミュレーターまたはデバイスをAssuranceに接続します。

1. **[!UICONTROL productListAdds]** イベントを送信します（バスケットに製品を追加します）。

1. ExperienceEvent ヒットを表示します。

   ![analytics xdm ヒット &#x200B;](assets/analytics-assurance-experiencevent.png){zoomable="yes"}

1. JSON の XDM 部分を確認します。

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
       "value" : 1
     }
   }
   // ...
   ```

1. **[!UICONTROL analytics.mapping]** イベントを確認します。

   ![analytics xdm ヒット &#x200B;](assets/analytics-assurance-mapping.png){zoomable="yes"}

Analytics マッピングには、以下のことに注意してください。

* **[!UICONTROL イベント]** には、`scAdd` に基づく `commerce.productListAdds` が入力されます。
* **[!UICONTROL pl]** （products 変数）には、`productListItems` に基づいて連結された値が入力されます。
* このイベントには、すべてのコンテキストデータを含む他の興味深い情報があります。


## コンテキストデータを使用したマッピング

Analytics に転送された XDM データは、標準フィールドとカスタムフィールドの両方を含む [&#x200B; コンテキストデータ &#x200B;](https://github.com/Adobe-Marketing-Cloud/mobile-services/blob/master/docs/ios/getting-started/proc-rules.md?lang=en) に変換されます。

コンテキストデータキーは、次の構文に従って作成されます。

```
a.x.[xdm path]
```

例：

```
// Standard Field
a.x.commerce.saveforlaters.value

// Custom Field
a.x._techmarketingdemos.appinformation.appstatedetails.screenname
```

>[!NOTE]
>
>カスタムフィールドは、Experience Cloud組織識別子の下に配置されます。
>
>テナント名 `_techmarketingdemos` は組織の一意の値に置き換えられます。



この XDM コンテキストデータをレポートスイートの Analytics データにマッピングするには、次の操作を実行します。

### フィールドグループの使用

* **[!UICONTROL Adobe Analytics ExperienceEvent Full Extension]** フィールドグループをスキーマに追加します。

  ![Analytics ExperienceEvent FullExtension フィールドグループ &#x200B;](assets/schema-analytics-extension.png){zoomable="yes"}

* [&#x200B; イベントデータを追跡 &#x200B;](events.md) レッスン、またはで行ったのと同様に、Adobe Analytics ExperienceEvent フル拡張機能フィールドグループに従って、アプリに XDM ペイロードを作成します
* ルールアクションを使用してAdobe Analytics ExperienceEvent 完全拡張フィールドグループにデータを添付または変更するルールを、タグプロパティ内に作成します。 詳しくは、[SDK イベントへのデータの添付 &#x200B;](https://developer.adobe.com/client-sdks/documentation/user-guides/attach-data/) または [SDK イベントのデータの変更 &#x200B;](https://developer.adobe.com/client-sdks/documentation/user-guides/attach-data/) を参照してください。


### マーチャンダイジング eVar

Analytics の設定で [&#x200B; マーチャンダイジング eVar](https://experienceleague.adobe.com/ja/docs/analytics/admin/admin-tools/manage-report-suites/edit-report-suite/conversion-variables/merchandising-evars) を使用している場合、そのマーチャンダイジング情報を取得するために、[&#x200B; イベントデータの追跡 &#x200B;](events.md) で定義した XDM ペイロードを拡張する必要があります。 マーチャンダイジング var の例として、商品の色を取得するタイミング（`evar1` など）を `&&products = ...;evar1=red;event10=50,...;evar1=blue;event10=60` します

* JSON の場合：

  ```json
  {
    "productListItems": [
        {
            "SKU": "LLWS05.1-XS",
            "name": "Desiree Fitness Tee",
            "priceTotal": 24,
            "_experience": {
                "analytics": {
                    "events1to100": {
                        "event10": {
                            "value": 50
                        }
                    },
                    "customDimensions": {
                        "eVars": {
                            "eVar1": "red",
                        }
                    }
                }
            }
        }
    ],
    "eventType": "commerce.productListAdds",
    "commerce": {
        "productListAdds": {
            "value": 1
        }
    }
  }
  ```

* コード内：

  ```swift
  var xdmData: [String: Any] = [
    "productListItems": [
      [
        "name":  productName,
        "SKU": sku,
        "priceTotal": priceString,
        "_experience" : [
          "analytics": [
            "events1to100": [
              "event10": [
                "value:": value
              ]
            ],
            "customDimensions": [
              "eVars": [
                "eVar1": color
              ]
            ]
          ]
        ]
      ]
    ],
    "eventType": "commerce.productViews",
    "commerce": [
      "productViews": [
        "value": 1
      ]
    ]
  ]
  ```


### 処理ルールの使用

このデータを使用した処理ルールは、次のようになります。

* **[!UICONTROL a.x._techmarketingdemo.appinformation.appstatedetails.screenname]** （4） **[!UICONTROL が設定されている場合は、（1）]** アプリ画面名（eVar2） **[!UICONTROL （2）を]** a.x._techmarketingdemo.appinformation.appstatedetails.screenname **&#x200B;**&#x200B;a.x._techmarketingdemo.appinformation.appstatedetails.screenname **[!UICONTROL の値に上書き]** （5）します。

* **[!UICONTROL a.x.commerce.saveForLaters.value （コンテキスト）]** （9） **[!UICONTROL が設定されている場合は、（イベント]** （6） **[!UICONTROL ウィッシュリストに追加（イベント 3）]** （7）を **[!UICONTROL a.x.commerce.saveForLaters.value （コンテキスト）]** （8）に **[!UICONTROL 追加]** （10）します。

![analytics 処理ルール &#x200B;](assets/analytics-processing-rules.png){zoomable="yes"}

>[!IMPORTANT]
>
>
>自動的にマッピングされた変数の一部は、処理ルールで使用できない場合があります。
>
>
>処理ルールに初めてマッピングする場合、インターフェイスには XDM オブジェクトからのコンテキストデータ変数は表示されません。 この問題を修正するには、任意の値を選択し、保存してから、編集に戻ります。 すべての XDM 変数が表示されます。


[&#x200B; 処理ルールを使用した contextData 変数の prop および eVar へのマッピング &#x200B;](https://experienceleague.adobe.com/ja/docs/analytics-learn/tutorials/implementation/implementation-basics/map-contextdata-variables-into-props-and-evars-with-processing-rules) を参照してください。

>[!TIP]
>
>以前のモバイルアプリ実装とは異なり、ページ/画面ビューと他のイベントの区別はありません。 代わりに、処理ルールで **[!UICONTROL ページ名]** ディメンションを設定して、**[!UICONTROL ページビュー]** 指標を増分できます。 このチュートリアルではカスタム `screenName` フィールドを収集しているので、処理ルールで画面名を **[!UICONTROL ページ名]** にマッピングすることを強くお勧めします。

## Analytics モバイル拡張機能からの移行

[Adobe Analytics モバイル拡張機能 &#x200B;](https://developer.adobe.com/client-sdks/solution/adobe-analytics/#add-analytics-to-your-application) を使用してモバイルアプリケーションを開発した場合は、[`MobileCore.trackAction`](https://developer.adobe.com/client-sdks/home/base/mobile-core/api-reference/#trackaction) および [`MobileCore.trackState`](https://developer.adobe.com/client-sdks/home/base/mobile-core/api-reference/#trackstate) の API 呼び出しを使用している可能性が高くなります。

推奨されるEdge Networkを使用して移行する場合は、次の選択肢があります。

* [&#x200B; イベントデータのトラッキング &#x200B;](configure-tags.md#extension-configuration) 方法のレッスンで示すように [`Edge.sendEvent`](https://developer.adobe.com/client-sdks/edge/edge-network/api-reference/#sendevent)Edge Network拡張機能を実装し、[&#128279;](events.md) API を使用します。 このチュートリアルでは、この実装に焦点を当てています。
* [Edge Bridge拡張機能 &#x200B;](https://developer.adobe.com/client-sdks/solution/adobe-analytics/migrate-to-edge-network/#implement-the-edge-bridge-extension) を実装し、[`MobileCore.trackAction`](https://developer.adobe.com/client-sdks/home/base/mobile-core/api-reference/#trackaction) および [`MobileCore.trackState`](https://developer.adobe.com/client-sdks/home/base/mobile-core/api-reference/#trackstate) API 呼び出しを引き続き使用します。 詳細と別のチュートリアルについては、[Edge Bridge拡張機能の実装 &#x200B;](https://developer.adobe.com/client-sdks/solution/adobe-analytics/migrate-to-edge-network/#implement-the-edge-bridge-extension) を参照してください。




>[!SUCCESS]
>
>データストリームでAdobe Analytics サービスを有効にして、Experience Edge XDM オブジェクトをAdobe Analytics変数にマッピングするようにアプリを設定しました。 該当する場合は、処理ルールを使用します。<br/> Adobe Experience Platform Mobile SDKの学習にご協力いただき、ありがとうございます。 ご不明な点がある場合や、一般的なフィードバックをお寄せになる場合、または今後のコンテンツに関するご提案がある場合は、この [Experience League Community Discussion の投稿 &#x200B;](https://experienceleaguecommunities.adobe.com:443/t5/adobe-experience-platform-data/tutorial-discussion-implement-adobe-experience-cloud-in-mobile/td-p/443796) でお知らせください。

次のトピック：**[Experience Platformへのデータの送信](platform.md)**
