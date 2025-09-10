---
title: Experience Platform Mobile SDKを使用したモバイルアプリでのイベントデータのトラッキング
description: モバイルアプリでイベントデータをトラッキングする方法を説明します。
jira: KT-14631
exl-id: 4779cf80-c143-437b-8819-1ebc11a26852
source-git-commit: a7768dcb056a57f4b170c393525e404f854be774
workflow-type: tm+mt
source-wordcount: '1678'
ht-degree: 2%

---

# イベントデータの追跡

モバイルアプリでイベントをトラッキングする方法を説明します。

Edge Network拡張機能は、エクスペリエンスイベントを Platform Edge Networkに送信する API を提供します。 エクスペリエンスイベントは、XDM ExperienceEvent スキーマ定義に準拠するデータを含むオブジェクトです。 より簡単に言えば、これらのイベントは、ユーザーがモバイルアプリで何をしているかをキャプチャします。 Platform Edge Networkがデータを受信すると、そのデータは、データストリームに設定されたアプリケーションおよびサービス（Adobe AnalyticsやExperience Platformなど）に転送できます。 [ エクスペリエンスイベント ](https://developer.adobe.com/client-sdks/documentation/getting-started/track-events/) について詳しくは、製品ドキュメントを参照してください。

## 前提条件

* すべてのパッケージの依存関係は、Xcode プロジェクトで設定されます。
* **[!UICONTROL AppDelegate]** に拡張機能が登録されました。
* 開発 `appId` を使用するように MobileCore 拡張機能を設定します。
* SDK を読み込みました。
* 上記の変更を含むアプリが正常に作成され、実行されました。

## 学習目標

このレッスンでは、次の操作を行います

* スキーマに基づいて XDM データを構造化する方法を理解します。
* 標準フィールドグループに基づいて XDM イベントを送信します。
* カスタムフィールドグループに基づいて XDM イベントを送信します。
* XDM 購入イベントを送信します。
* Assuranceでの検証。

## エクスペリエンスイベントの作成

Adobe Experience Platform Edge拡張機能は、事前に定義された XDM スキーマに従うイベントをAdobe Experience Platform Edge Networkに送信できます。

プロセスは次のようになります。

1. 追跡しようとしているモバイルアプリインタラクションを特定します。

1. スキーマをレビューし、適切なイベントを特定します。

1. スキーマをレビューし、イベントの説明に使用するその他のフィールドを特定します。

1. データオブジェクトを構築し、入力します。

1. イベントを作成して送信します。

1. 検証。


### 標準フィールドグループ

標準フィールドグループの場合、プロセスは次のようになります。

* スキーマで、収集しようとしているイベントを識別します。 この例では、商品表示（**[!UICONTROL productViews]**）イベントなど、コマースエクスペリエンスイベントを追跡します。

  ![ 製品表示スキーマ ](assets/datacollection-prodView-schema.png){zoomable="yes"}

* アプリでエクスペリエンスイベントデータを含むオブジェクトを作成するには、次のようなコードを使用します。

>[!BEGINTABS]

>[!TAB iOS]

```swift
var xdmData: [String: Any] = [
    "eventType": "commerce.productViews",
    "commerce": [
        "productViews": [
        "value": 1
        ]
    ]
]
```

このコードにおいて、

* `eventType`：発生したイベントを表し、可能な場合は [ 既知の値 ](https://github.com/adobe/xdm/blob/master/docs/reference/classes/experienceevent.schema.md#xdmeventtype-known-values) を使用します。

* `commerce.productViews.value`：イベントの数値またはブール値。 ブール値（Adobe Analyticsでは「カウンター」）の場合、値は常に 1 に設定されます。 数値イベントまたは通貨イベントの場合、値は 1 を超える場合があります。

>[!TAB Android]

```kotlin
val xdmData = mapOf(
    "eventType" to "commerce.productViews",
    "commerce" to mapOf(
        "productViews" to mapOf(
        "value": 1
        )
    )
)
```

このコードにおいて、

* `eventType`：発生したイベントを表し、可能な場合は [ 既知の値 ](https://github.com/adobe/xdm/blob/master/docs/reference/classes/experienceevent.schema.md#xdmeventtype-known-values) を使用します。

* `commerce.productViews.value`：イベントの数値またはブール値。 ブール値（Adobe Analyticsでは「カウンター」）の場合、値は常に 1 に設定されます。 数値イベントまたは通貨イベントの場合、値は 1 を超える場合があります。

>[!ENDTABS]


* スキーマで、コマース製品表示イベントに関連付けられている追加データを特定します。 この例では、**[!UICONTROL productListItems]** を含めます。これは、コマース関連のイベントで使用されるフィールドの標準セットです。

  ![ 製品リスト項目スキーマ ](assets/datacollection-prodListItems-schema.png){zoomable="yes"}
   * **[!UICONTROL productListItems]** は配列なので、複数の製品を指定できます。

* このデータを追加するには、`xdmData` オブジェクトを展開して補足データを含めます。

>[!BEGINTABS]

>[!TAB iOS]

```swift
var xdmData: [String: Any] = [
    "eventType": "commerce.productViews",
    "commerce": [
        "productViews": [
            "value": 1
        ]
    ],
    "productListItems": [
        [
            "name":  productName,
            "SKU": sku,
            "priceTotal": priceString,
            "quantity": 1
        ]
    ]
]
```

>[!TAB Android]

```kotlin
val xdmData = mapOf(
    "eventType" to "commerce.productViews",
    "commerce" to mapOf(
        "productViews" to mapOf(
        "value": 1
        )
    ),
    "productListItems" to mapOf(
        "name": productName,
        "SKU": sku,
        "priceTotal", priceString,
        "quantity", 1
    )
)
```

>[!ENDTABS]

* これで、このデータ構造を使用して `ExperienceEvent` を作成できます。

>[!BEGINTABS]

>[!TAB iOS]

```swift
let productViewEvent = ExperienceEvent(xdm: xdmData)
```

>[!TAB Android]

```kotlin
val productViewEvent = ExperienceEvent.Builder().setXdmSchema(xdmData).build()
```

>[!ENDTABS]

* `sendEvent` API を使用してイベントとデータを Platform Edge Networkに送信します。

>[!BEGINTABS]

>[!TAB iOS]

```swift
Edge.sendEvent(experienceEvent: productViewEvent)
```

>[!TAB Android]

```kotlin
Edge.sendEvent(productViewEvent, null)
```

>[!ENDTABS]


[`Edge.sendEvent`](https://developer.adobe.com/client-sdks/documentation/edge-network/api-reference/#sendevent) API は、[`MobileCore.trackAction`](https://developer.adobe.com/client-sdks/documentation/mobile-core/api-reference/#trackaction) および [`MobileCore.trackState`](https://developer.adobe.com/client-sdks/documentation/mobile-core/api-reference/#trackstate) API 呼び出しと同等のAEP Mobile SDKです。 詳しくは、[Analytics Mobile 拡張機能からAdobe Experience Platform Edge Networkへの移行 ](https://developer.adobe.com/client-sdks/documentation/adobe-analytics/migrate-to-edge-network/) を参照してください。

次に、このコードをプロジェクトに実装します。
アプリに様々なコマース製品関連のアクションがあり、ユーザーが実行したこれらのアクションに基づいてイベントを送信する場合：

* 表示：ユーザーが特定の製品を表示すると発生します。
* 買い物かごに追加：ユーザーがタップしたとき 製品の詳細画面に <img src="assets/addtocart.png" width="20"/> 示
* 後で使用するために保存：ユーザーがタップした場合 <img src="assets/saveforlater.png" width="15"/> / 製品の詳細画面に <img src="assets/heart.png" width="25"/> 示
* 購入：ユーザーがタップした場合 製品の詳細画面に <img src="assets/purchase.png" width="20"/> 示されます。

コマース関連のエクスペリエンスイベントの送信を再利用可能な方法で実装するには、専用の関数を使用します。

>[!BEGINTABS]

>[!TAB iOS]

1. Xcode プロジェクトナビゲーターで **[!DNL Luma]**/**[!DNL Luma]**/**[!DNL Utils]**/**[!UICONTROL MobileSDK]** に移動し、`func sendCommerceExperienceEvent(commerceEventType: String, product: Product)` 関数に以下を追加します。

   ```swift
   // Set up a data dictionary, create an experience event and send the event.
   let xdmData: [String: Any] = [
       "eventType": "commerce." + commerceEventType,
       "commerce": [
           commerceEventType: [
               "value": 1
           ]
       ],
       "productListItems": [
           [
               "name": product.name,
               "priceTotal": product.price,
               "SKU": product.sku
           ]
       ]
   ]
   
   let commerceExperienceEvent = ExperienceEvent(xdm: xdmData)
   Edge.sendEvent(experienceEvent: commerceExperienceEvent)
   ```

   この関数は、コマースエクスペリエンスイベントタイプと製品をパラメーターとして受け取ります。

   * 関数のパラメーターを使用して、XDM ペイロードをディクショナリとして設定します。
   * 辞書を使用してエクスペリエンスイベントを設定します。
   * [`Edge.sendEvent`](https://developer.adobe.com/client-sdks/documentation/edge-network/api-reference/#sendevent) API を使用してエクスペリエンスイベントを送信します。

1. Xcode プロジェクトナビゲーターで **[!DNL Luma]**/**[!DNL Luma]**/**[!DNL Views]**/**[!DNL Products]**/**[!UICONTROL ProductView]** に移動し、`sendCommerceExperienceEvent` 関数に様々な呼び出しを追加します。

   1. `.task` のモディファイヤで、`ATTrackingManager.trackingAuthorizationStatus` のクロージャ内に配置します。 この `.task` 修飾子は、製品ビューが初期化されて表示されたときに呼び出されるので、その特定の時点で製品ビューイベントを送信します。

      ```swift
      // Send productViews commerce experience event
      MobileSDK.shared.sendCommerceExperienceEvent(commerceEventType: "productViews", product: product)
      ```

   1. ボタンごとに（<img src="assets/saveforlater.png" width="15"/>, <img src="assets/addtocart.png" width="20"/> と <img src="assets/purchase.png" width="20"/>）ツールバーで、関連する呼び出しを `ATTrackingManager.trackingAuthorizationStatus == .authorized` クロージャ内に追加します。

      1. の場合 <img src="assets/saveforlater.png" width="15"/>：

         ```swift
         // Send saveForLater commerce experience event
         MobileSDK.shared.sendCommerceExperienceEvent(commerceEventType: "saveForLaters", product: product)
         ```

      1. の場合 <img src="assets/addtocart.png" width="20"/>：

         ```swift
         // Send productListAdds commerce experience event
         MobileSDK.shared.sendCommerceExperienceEvent(commerceEventType: "productListAdds", product: product)
         ```

      1. の場合 <img src="assets/purchase.png" width="20"/>：

         ```swift
         // Send purchase commerce experience event
         MobileSDK.shared.sendCommerceExperienceEvent(commerceEventType: "purchases", product: product)
         ```

>[!TAB Android]

1. Android Studio ナビゲーターで **[!UICONTROL Android]** ![ChevronDown](/help/assets/icons/ChevronDown.svg)/**[!UICONTROL app]**/**[!UICONTROL kotlin+java]**/**[!UICONTROL com.adobe.luma.tutorial.android]**/**[!UICONTROL models]**/**[!UICONTROL MobileSDK]** に移動し、`func sendCommerceExperienceEvent(commerceEventType: String, product: Product)` 関数に次のコードを追加します。

   ```kotlin
   // Set up a data map, create an experience event and send the event.
   val xdmData = mapOf(
       "eventType" to "commerce.$commerceEventType",
       "commerce" to mapOf(commerceEventType to mapOf("value" to 1)),
       "productListItems" to listOf(
           mapOf(
               "name" to product.name,
               "priceTotal" to product.price,
               "SKU" to product.sku
           )
       )
   )
   val commerceExperienceEvent = ExperienceEvent.Builder().setXdmSchema(xdmData).build()
   Edge.sendEvent(commerceExperienceEvent, null)
   ```

   この関数は、コマースエクスペリエンスイベントタイプと製品をパラメーターとして受け取ります。

   * 関数のパラメーターを使用して、XDM ペイロードをマップとして設定します。
   * マップを使用してエクスペリエンスイベントを設定します。
   * [`Edge.sendEvent`](https://developer.adobe.com/client-sdks/documentation/edge-network/api-reference/#sendevent) API を使用してエクスペリエンスイベントを送信します。

1. Android Studio ナビゲーターで **[!UICONTROL app]**/**[!UICONTROL kotlin+java]**/**[!UICONTROL com.adobe.luma.tutorial.android]**/**[!UICONTROL views]**/**[!UICONTROL ProductView.kt]** に移動し、`sendCommerceExperienceEvent` 関数への様々な呼び出しを追加します。

   1. `LaunchedEffect(Unit)` のコンポーザブル関数では、製品が表示された特定の瞬間に製品ビューイベントを送信します。

      ```kotlin
      // Send productViews commerce experience event
      MobileSDK.shared.sendCommerceExperienceEvent("productViews", product)
      ```

   1. ボタンごとに（<img src="assets/heart.png" width="25"/>, <img src="assets/addtocart.png" width="20"/> と <img src="assets/purchase.png" width="20"/>）をクリックします。ツールバーで、`scope.launch` の `if (MobileSDK.shared.trackingEnabled == TrackingStatus.AUTHORIZED)  statement` 内で関連する呼び出しを追加します。

      1. の場合 <img src="assets/heart.png" width="25"/>：

         ```kotlin
         // Send saveForLater commerce experience event
         MobileSDK.shared.sendCommerceExperienceEvent("saveForLaters", product)
         ```

      1. の場合 <img src="assets/addtocart.png" width="20"/>：

         ```kotlin
         // Send productListAdds commerce experience event
         MobileSDK.shared.sendCommerceExperienceEvent("productListAdds", product)
         ```

      1. の場合 <img src="assets/purchase.png" width="20"/>：

         ```kotlin
         // Send purchase commerce experience event
         MobileSDK.shared.sendCommerceExperienceEvent("purchases", product)
         ```

>[!ENDTABS]

>[!TIP]
>
>Android™ 向けに開発している場合は、基盤のインターフェイスとして Map （`java.util.Map`）を使用して、XDM ペイロードを作成します。


### カスタムフィールドグループ

画面のビュー数とインタラクションをアプリ自体で追跡するとします。 このタイプのイベントにカスタムフィールドグループを定義したことに注意してください。

* スキーマで、収集しようとしているイベントを識別します。
  ![ アプリインタラクションスキーマ ](assets/datacollection-appInteraction-schema.png){zoomable="yes"}

* オブジェクトの作成を開始します。

  >[!NOTE]
  >
  >* 標準フィールドグループは、常にオブジェクトルートから始まります。
  >
  >* カスタムフィールドグループは、常にExperience Cloud組織に固有のオブジェクトの下から始まります（この例では `_techmarketingdemos`）。

* アプリインタラクションイベントの場合は、次のようなオブジェクトを作成します。

>[!BEGINTABS]

>[!TAB iOS]

```swift
let xdmData: [String: Any] = [
    "eventType": "application.interaction",
    "_techmarketingdemos": [
    "appInformation": [
        "appInteraction": [
            "name": "login",
            "appAction": [
                "value": 1
                ]
            ]
        ]
    ]
]
```

>[!TAB Android]

```kotlin
val xdmData = mapOf(
    "eventType" to "application.interaction",
    "_techmarketingdemos" to mapOf(
        "appInformation" to mapOf(
            "appInteraction" to mapOf(
                "name" to "login",
                "appAction" to mapOf("value" to 1)
            )
        )
    )
)
```

>[!ENDTABS]

* スクリーントラッキングイベントの場合、次のようなオブジェクトを作成します。

>[!BEGINTABS]

>[!TAB iOS]

```swift
var xdmData: [String: Any] = [
    "eventType": "application.scene",
    "_techmarketingdemos": [
        "appInformation": [
            "appStateDetails": [
                "screenType": "App",
                "screenName": "luma: content: ios: us: en: login",
                "screenView": [
                    "value": 1
                ]
            ]
        ] 
    ]
]
```

>[!TAB Android]

```kotlin
val xdmData = mapOf(
    "eventType" to "application.scene",
    tenant.value to mapOf(
        "appInformation" to mapOf(
            "appStateDetails" to mapOf(
                "screenType" to "App",
                "screenName" to stateName,
                "screenView" to mapOf("value" to 1)
            )
        )
    )
)
```

>[!ENDTABS]



* これで、このデータ構造を使用して `ExperienceEvent` を作成できます。

>[!BEGINTABS]

>[!TAB iOS]

```swift
let event = ExperienceEvent(xdm: xdmData)
```

>[!TAB Android]

```kotlin
val event = ExperienceEvent(xdmData)
```

>[!ENDTABS]


* イベントとデータを Platform Edge Networkに送信します。

>[!BEGINTABS]

>[!TAB iOS]

```swift
Edge.sendEvent(experienceEvent: event)
```

>[!TAB Android]

```kotlin
Edge.sendEvent(event, null)
```

>[!ENDTABS]

ここでも、このコードをプロジェクトに実装します。

>[!BEGINTABS]

>[!TAB iOS]

1. 便宜上、**[!UICONTROL MobileSDK]** で 2 つの関数を定義します。 Xcode プロジェクトナビゲーターで **[!DNL Luma]**/**[!DNL Luma]**/**[!DNL Utils]**/**[!UICONTROL MobileSDK]** に移動します。

   * アプリのインタラクション用の 1。 次のコードを `func sendAppInteractionEvent(actionName: String)` 関数に追加します。

     ```swift
     // Set up a data dictionary, create an experience event and send the event.
     let xdmData: [String: Any] = [
         "eventType": "application.interaction",
         tenant : [
             "appInformation": [
                 "appInteraction": [
                     "name": actionName,
                     "appAction": [
                         "value": 1
                     ]
                 ]
             ]
         ]
     ]
     let appInteractionEvent = ExperienceEvent(xdm: xdmData)
     Edge.sendEvent(experienceEvent: appInteractionEvent)
     ```

     この関数は、アクション名をパラメーターとして使用します。

      * 関数のパラメーターを使用して、XDM ペイロードをディクショナリとして設定します。
      * 辞書を使用してエクスペリエンスイベントを設定します。
      * [`Edge.sendEvent`](https://developer.adobe.com/client-sdks/documentation/edge-network/api-reference/#sendevent) API を使用してエクスペリエンスイベントを送信します。


   * 1 つは画面トラッキング用です。 次のコードを `func sendTrackScreenEvent(stateName: String) ` 関数に追加します。

     ```swift
     // Set up a data dictionary, create an experience event and send the event.
     let xdmData: [String: Any] = [
         "eventType": "application.scene",
         tenant : [
             "appInformation": [
                 "appStateDetails": [
                     "screenType": "App",
                     "screenName": stateName,
                     "screenView": [
                         "value": 1
                     ]
                 ]
             ]
         ]
     ]
     let trackScreenEvent = ExperienceEvent(xdm: xdmData)
     Edge.sendEvent(experienceEvent: trackScreenEvent)
     ```

     この関数は、状態名をパラメーターとして使用します。

      * 関数のパラメーターを使用して、XDM ペイロードをディクショナリとして設定します。
      * 辞書を使用してエクスペリエンスイベントを設定します。
      * [`Edge.sendEvent`](https://developer.adobe.com/client-sdks/documentation/edge-network/api-reference/#sendevent) API を使用してエクスペリエンスイベントを送信します。

1. **[!DNL Luma]**/**[!DNL Luma]**/**[!DNL Views]**/**[!DNL General]**/**[!UICONTROL LoginSheet]** に移動します。

   1. ログインボタンのクロージャーに次のハイライトされたコードを追加します。

      ```swift
      // Send app interaction event
      MobileSDK.shared.sendAppInteractionEvent(actionName: "login")
      ```

   1. 次のハイライト表示されたコードを修飾子 `onAppear` 追加します。

      ```swift
      // Send track screen event
      MobileSDK.shared.sendTrackScreenEvent(stateName: "luma: content: ios: us: en: login")
      ```

>[!TAB Android]

1. 便宜上、**[!UICONTROL MobileSDK]** で 2 つの関数を定義します。 Android Studio ナビゲーターで **[!UICONTROL Android]** ![ChevronDown](/help/assets/icons/ChevronDown.svg) **[!DNL app]**/**[!DNL kotlin+java]**/**[!DNL com.adobe.luma.tutorial.android]**/**[!UICONTROL models]**/**[!UICONTROL MobileSDK]** に移動します。

   * アプリのインタラクション用の 1。 次のコードを `fun sendAppInteractionEvent(actionName: String)` 関数に追加します。

     ```kotlin
     // Set up a data map, create an experience event and send the event.
     val xdmData = mapOf(
         "eventType" to "application.interaction",
         tenant.value to mapOf(
             "appInformation" to mapOf(
                 "appInteraction" to mapOf(
                     "name" to actionName,
                     "appAction" to mapOf("value" to 1)
                 )
             )
         )
     )
     val appInteractionEvent = ExperienceEvent.Builder().setXdmSchema(xdmData).build()
     Edge.sendEvent(appInteractionEvent, null)
     ```

     この関数は、アクション名をパラメーターとして使用します。

      * 関数のパラメーターを使用して、XDM ペイロードをマップとして設定します。
      * マップを使用してエクスペリエンスイベントを設定します。
      * [`Edge.sendEvent`](https://developer.adobe.com/client-sdks/documentation/edge-network/api-reference/#sendevent) API を使用してエクスペリエンスイベントを送信します。


   * 1 つは画面トラッキング用です。 次のコードを `fun sendTrackScreenEvent(stateName: String)` 関数に追加します。

     ```kotlin
     // Set up a data map, create an experience event and send the event.
     val xdmData = mapOf(
         "eventType" to "application.scene",
         tenant.value to mapOf(
             "appInformation" to mapOf(
                 "appStateDetails" to mapOf(
                     "screenType" to "App",
                     "screenName" to stateName,
                     "screenView" to mapOf("value" to 1)
                 )
             )
         )
     )
     val trackScreenEvent = ExperienceEvent.Builder().setXdmSchema(xdmData).build()
     Edge.sendEvent(trackScreenEvent, null)
     ```

     この関数は、状態名をパラメーターとして使用します。

      * 関数のパラメーターを使用して、XDM ペイロードをマップとして設定します。
      * マップを使用してエクスペリエンスイベントを設定します。
      * [`Edge.sendEvent`](https://developer.adobe.com/client-sdks/documentation/edge-network/api-reference/#sendevent) API を使用してエクスペリエンスイベントを送信します。

1. **[!UICONTROL Android]** ![ChevronDown ](/help/assets/icons/ChevronDown.svg)**[!DNL app]**/**[!DNL kotlin+java]**/**[!DNL com.adobe.luma.tutorial.android]**/**[!UICONTROL  views ]**/**[!UICONTROL  LoginSheet.kt ]**に移動します

   1. **[!UICONTROL Button]****[!UICONTROL onClick]** イベントに次のハイライトされたコードを追加します。

      ```kotlin
      // Send app interaction event
      MobileSDK.shared.sendAppInteractionEvent("login")
      ```

   1. `LaunchedEffect(Unit)` のコンポーザブル関数に、次のハイライト表示されたコードを追加します。

      ```kotlin
      // Send track screen event
      MobileSDK.shared.sendTrackScreenEvent("luma: content: android: us: en: login")
      ```

>[!ENDTABS]



## 検証

1. [ 設定手順 ](assurance.md#connecting-to-a-session) の節を参照して、シミュレーターまたはデバイスをAssuranceに接続します。

   1. Assurance アイコンを左に移動します。
   1. タブバーで **[!UICONTROL ホーム]** を選択し、ホーム画面に **[!UICONTROL ECID]**、**[!UICONTROL メール]**、**[!UICONTROL CRM ID]** が表示されていることを確認します。
   1. タブバーで「**[!DNL Products]**」を選択します。
   1. 商品を選択します。
   1. 選択 <img src="assets/saveforlater.png" width="15"/> （iOS）または <img src="assets/heart.png" width="25"/> （Android）。
   1. 選択 <img src="assets/addtocart.png" width="20"/>。
   1. 選択 <img src="assets/purchase.png" width="15"/>。

>[!BEGINTABS]

>[!TAB iOS]

<img src="./assets/mobile-app-events-3.png" width="300">

>[!TAB Android]

<img src="./assets/mobile-app-events-3-android.png" width="278">

>[!ENDTABS]

1. Assurance UI で、.com.adobe.edge.konductor **[!UICONTROL ベンダーの]** hitReceived **[!UICONTROL イベントを探し]** す。
1. イベントを選択し、**[!UICONTROL messages]** オブジェクトの XDM データを確認します。 または、「![ コピー ](https://spectrum.adobe.com/static/icons/workflow_18/Smock_Copy_18_N.svg)**[!UICONTROL Raw イベントをコピー]** を使用し、好みのテキストエディターまたはコードエディターを使用してイベントを貼り付けて検査することもできます。

   ![ データ収集の検証 ](assets/datacollection-validation.png){zoomable="yes"}


## 次の手順

これで、アプリへのデータ収集の追加を開始するためのすべてのツールが用意できました。 ユーザーがアプリ内の製品とどのようにやり取りするかについて、より多くのインテリジェンスを追加でき、アプリのインタラクションおよび画面トラッキングコールをさらにアプリに追加できます。

* 注文、チェックアウト、空のバスケットなどの機能をアプリに実装し、関連するコマースエクスペリエンスイベントをこの機能に追加します。
* 適切なパラメーターを指定して `sendAppInteractionEvent` への呼び出しを繰り返し、ユーザーによる他のアプリのインタラクションを追跡します。
* `sendTrackScreenEvent` への呼び出しを適切なパラメーターで繰り返し、ユーザーがアプリで表示した画面を追跡します。

>[!TIP]
>
>その他の例については、[ 完成したアプリ ](https://github.com/Adobe-Marketing-Cloud/Luma-iOS-Mobile-App) を確認してください。


## Analytics と Platform へのイベントの送信

イベントを収集して Platform Edge Networkに送信したら、[ データストリーム ](create-datastream.md) で設定されたアプリケーションとサービスに送信されます。 後のレッスンでは、このデータを [Adobe Analytics](analytics.md)、[Adobe Experience Platform](platform.md) およびその他のAdobe Experience Cloud ソリューション（[Adobe Target](target.md) やAdobe Journey Optimizerなど）にマッピングします。

>[!SUCCESS]
>
>これで、Adobe Experience Platform Edge Networkに対するコマース、アプリのインタラクション、画面トラッキングイベントを追跡するアプリの設定が完了しました。 およびデータストリームで定義したすべてのサービスに適用されます。
>
>Adobe Experience Platform Mobile SDKの学習にご協力いただき、ありがとうございます。 ご不明な点がある場合や、一般的なフィードバックをお寄せになる場合、または今後のコンテンツに関するご提案がある場合は、この [Experience League Community Discussion の投稿 ](https://experienceleaguecommunities.adobe.com/t5/adobe-experience-platform-data/tutorial-discussion-implement-adobe-experience-cloud-in-mobile/td-p/443796) でお知らせください。

次のトピック：**[WebViews の処理](web-views.md)**
