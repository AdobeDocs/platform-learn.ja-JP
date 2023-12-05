---
title: Platform Mobile SDK を使用したモバイルアプリのイベントデータの追跡
description: モバイルアプリでイベントデータを追跡する方法を説明します。
jira: KT-14631
exl-id: 4779cf80-c143-437b-8819-1ebc11a26852
source-git-commit: 25f0df2ea09bb7383f45a698e75bd31be7541754
workflow-type: tm+mt
source-wordcount: '1328'
ht-degree: 0%

---

# イベントデータの追跡

モバイルアプリでイベントを追跡する方法を説明します。

Edge Network 拡張機能は、Experience Events を Platform Edge Network に送信する API を提供します。 エクスペリエンスイベントは、XDM ExperienceEvent スキーマ定義に準拠したデータを含むオブジェクトです。 より簡単に言えば、モバイルアプリでのユーザーの行動を取り込みます。 Platform Edge Network がデータを受信すると、Adobe AnalyticsやExperience Platformなど、データストリームで設定されたアプリケーションやサービスにデータを転送できます。 詳しくは、 [エクスペリエンスイベント](https://developer.adobe.com/client-sdks/documentation/getting-started/track-events/) （製品ドキュメント内）。

## 前提条件

* パッケージの依存関係はすべて、Xcode プロジェクトに配置されます。
* の登録済み拡張機能 **[!UICONTROL AppDelegate]**.
* 開発を使用するように MobileCore 拡張機能を設定しました。 `appId`.
* SDK が読み込まれました。
* 上記の変更を含むアプリが正常にビルドされ、実行されました。

## 学習内容

このレッスンでは、次の操作を行います

* スキーマに基づいて XDM データを構造化する方法を説明します。
* 標準フィールドグループに基づいて XDM イベントを送信します。
* カスタムフィールドグループに基づいて XDM イベントを送信します。
* XDM 購入イベントを送信します。
* アシュランスを使用して検証します。

## エクスペリエンスイベントの作成

Adobe Experience Platform Edge 拡張機能は、以前に定義した XDM スキーマに従うイベントをAdobe Experience Platform Edge Network に送信できます。

プロセスは次のようになります…

1. 追跡しようとしているモバイルアプリのインタラクションを特定します。

1. スキーマを確認し、適切なイベントを特定します。

1. スキーマを確認し、イベントの説明に使用する必要がある追加のフィールドを特定します。

1. データオブジェクトを作成および設定します。

1. イベントを作成して送信します。

1. 検証します。


### 標準フィールドグループ

標準フィールドグループの場合、処理は次のようになります。

* スキーマで、収集しようとしているイベントを特定します。 この例では、製品表示 (**[!UICONTROL productViews]**) イベントに関連付けられます。

  ![製品表示スキーマ](assets/datacollection-prodView-schema.png)

* アプリ内でエクスペリエンスイベントデータを含むオブジェクトを作成するには、次のようなコードを使用します。

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

   * `eventType`：発生したイベントを記述します。 [既知の値](https://github.com/adobe/xdm/blob/master/docs/reference/classes/experienceevent.schema.md#xdmeventtype-known-values) 可能な場合は。
   * `commerce.productViews.value`：イベントの数値またはブール値。 ブール値 (Adobe Analyticsでは「カウンター」) の場合、値は常に 1 に設定されます。 数値イベントまたは通貨イベントの場合、値は 1 より大きい値になります。

* スキーマ内で、コマース製品表示イベントに関連付けられた追加データを識別します。 この例では、 **[!UICONTROL productListItems]** コマース関連のイベントで使用される標準のフィールドセットです。

  ![製品リスト項目スキーマ](assets/datacollection-prodListItems-schema.png)
   * 次の点に注意してください。 **[!UICONTROL productListItems]** は配列なので、複数の製品を提供できます。

* このデータを追加するには、 `xdmData` 補足データを含むオブジェクト：

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

* これで、このデータ構造を使用して `ExperienceEvent`:

  ```swift
  let productViewEvent = ExperienceEvent(xdm: xdmData)
  ```

* 次に、 `sendEvent` API:

  ```swift
  Edge.sendEvent(experienceEvent: productViewEvent)
  ```

The [`Edge.sendEvent`](https://developer.adobe.com/client-sdks/documentation/edge-network/api-reference/#sendevent) API は、 [`MobileCore.trackAction`](https://developer.adobe.com/client-sdks/documentation/mobile-core/api-reference/#trackaction) および [`MobileCore.trackState`](https://developer.adobe.com/client-sdks/documentation/mobile-core/api-reference/#trackstate) API 呼び出し。 詳しくは、 [Analytics モバイル拡張機能からAdobe Experience Platform Edge Network への移行](https://developer.adobe.com/client-sdks/documentation/adobe-analytics/migrate-to-edge-network/) を参照してください。

次に、このコードを Xcode プロジェクトに実際に実装します。
アプリに異なるコマース製品関連のアクションがあり、ユーザーが実行したこれらのアクションに基づいてイベントを送信したい場合は、次の手順に従います。

* 表示：ユーザーが特定の製品を表示したときに発生します。
* 買い物かごに追加：ユーザーがタップしたとき <img src="assets/addtocart.png" width="20" /> 製品の詳細画面で、
* 後で使用するために保存：ユーザーがタップしたとき <img src="assets/saveforlater.png" width="15" /> 製品の詳細画面で、
* purchase：ユーザーがタップしたとき <img src="assets/purchase.png" width="20" /> 製品の詳細画面で、

コマース関連のエクスペリエンスイベントの送信を再利用可能な方法で実装するには、専用の関数を使用します。

1. に移動します。 **[!DNL Luma]** > **[!DNL Luma]** > **[!DNL Utils]** > **[!UICONTROL MobileSDK]** Xcode プロジェクトナビゲーターで、以下の内容を `func sendCommerceExperienceEvent(commerceEventType: String, product: Product)` 関数に置き換えます。

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

   この関数は、コマースエクスペリエンスのイベントタイプと製品をパラメーターとして、および

   * 関数のパラメーターを使用して、XDM ペイロードをディクショナリとして設定します。
   * 辞書を使用してエクスペリエンスイベントを設定します。
   * は、 [`Edge.sendEvent`](https://developer.adobe.com/client-sdks/documentation/edge-network/api-reference/#sendevent) API.

1. に移動します。 **[!DNL Luma]** > **[!DNL Luma]** > **[!DNL Views]** > **[!DNL Products]** > **[!UICONTROL ProductView]** Xcode プロジェクトナビゲーターで、 `sendCommerceExperienceEvent` 関数：

   1. 次の場合： `.task` 修飾子、内 `ATTrackingManager.trackingAuthorizationStatus` クロージャ。 この `.task` 製品表示が初期化されて表示されると修飾子が呼び出されるので、特定の時点で製品表示イベントを送信できます。

      ```swift
      // Send productViews commerce experience event
      MobileSDK.shared.sendCommerceExperienceEvent(commerceEventType: "productViews", product: product)
      ```

   1. 各ボタン (<img src="assets/saveforlater.png" width="15" />、 <img src="assets/addtocart.png" width="20" /> および <img src="assets/purchase.png" width="20" />) をツールバーの `ATTrackingManager.trackingAuthorizationStatus == .authorized` 閉鎖：

      1. の場合 <img src="assets/saveforlater.png" width="15" />：

         ```swift
         // Send saveForLater commerce experience event
         MobileSDK.shared.sendCommerceExperienceEvent(commerceEventType: "saveForLaters", product: product)
         ```

      1. の場合 <img src="assets/addtocart.png" width="20" />：

         ```swift
         // Send productListAdds commerce experience event
         MobileSDK.shared.sendCommerceExperienceEvent(commerceEventType: "productListAdds", product: product)
         ```

      1. の場合 <img src="assets/purchase.png" width="20" />：

         ```swift
         // Send purchase commerce experience event
         MobileSDK.shared.sendCommerceExperienceEvent(commerceEventType: "purchases", product: product)
         ```

>[!TIP]
>
>Android™用に開発する場合は、マップ (`java.util.Map`) を XDM ペイロードを構築するための基本的なインターフェイスとして使用します。


### カスタムフィールドグループ

アプリ自体の画面ビューやインタラクションを追跡するとします。 このタイプのイベントに対してカスタムフィールドグループを定義したことを忘れないでください。

* スキーマで、収集しようとしているイベントを特定します。
  ![アプリインタラクションスキーマ](assets/datacollection-appInteraction-schema.png)

* オブジェクトの作成を開始します。

  >[!NOTE]
  >
  * 標準フィールドグループは、常にオブジェクトルートから始まります。
  >
  * カスタムフィールドグループは、常にExperience Cloud組織に固有のオブジェクトの下で開始します。 `_techmarketingdemos` この例では、

  アプリのインタラクションイベントの場合は、次のようなオブジェクトを作成します。

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

  画面追跡イベントの場合は、次のようなオブジェクトを作成します。

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


* これで、このデータ構造を使用して `ExperienceEvent`.

  ```swift
  let event = ExperienceEvent(xdm: xdmData)
  ```

* イベントとデータを Platform Edge Network に送信します。

  ```swift
  Edge.sendEvent(experienceEvent: event)
  ```


ここでも、Xcode プロジェクトにこのコードを実装します。

1. 利便性を考慮して、 **[!UICONTROL MobileSDK]**. に移動します。 **[!DNL Luma]** > **[!DNL Luma]** > **[!DNL Utils]** > **[!UICONTROL MobileSDK]** 」をクリックします。

   1. アプリのインタラクション用の 1 つ。 このコードを `func sendAppInteractionEvent(actionName: String)` 関数：

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

      この関数では、アクション名をパラメーターとして使用し、

      * 関数のパラメーターを使用して、XDM ペイロードをディクショナリとして設定します。
      * 辞書を使用してエクスペリエンスイベントを設定します。
      * は、 [`Edge.sendEvent`](https://developer.adobe.com/client-sdks/documentation/edge-network/api-reference/#sendevent) API.


   1. 画面追跡用のもの。 このコードを `func sendTrackScreenEvent(stateName: String) ` 関数：

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

      この関数では、状態名をパラメーターとして使用し、

      * 関数のパラメーターを使用して、XDM ペイロードをディクショナリとして設定します。
      * 辞書を使用してエクスペリエンスイベントを設定します。
      * は、 [`Edge.sendEvent`](https://developer.adobe.com/client-sdks/documentation/edge-network/api-reference/#sendevent) API.

1. に移動します。 **[!DNL Luma]** > **[!DNL Luma]** > **[!DNL Views]** > **[!DNL General]** > **[!UICONTROL LoginSheet]**.

   1. 次のハイライト表示されたコードを [ ログイン ] ボタンのクロージャに追加します。

      ```swift
      // Send app interaction event
      MobileSDK.shared.sendAppInteractionEvent(actionName: "login")
      ```

   1. 次のハイライト表示されたコードをに追加します。 `onAppear` 修飾子：

      ```swift
      // Send track screen event
      MobileSDK.shared.sendTrackScreenEvent(stateName: "luma: content: ios: us: en: login")
      ```

## 検証

1. 以下を確認します。 [設定手順](assurance.md#connecting-to-a-session) 「 」セクションを使用して、シミュレーターまたはデバイスを Assurance に接続します。

   1. アシュランスアイコンを左に移動します。
   1. 選択 **[!UICONTROL ホーム]** をクリックし、 **[!UICONTROL ECID]**, **[!UICONTROL 電子メール]**、および **[!UICONTROL CRM ID]** 」と入力します。
   1. 選択 **[!DNL Products]** 」をクリックします。
   1. 製品を選択します。
   1. 選択 <img src="assets/saveforlater.png" width="15" />。
   1. 選択 <img src="assets/addtocart.png" width="20" />。
   1. 選択 <img src="assets/purchase.png" width="15" />。

      <img src="./assets/mobile-app-events-3.png" width="300">


1. Assurance UI で、 **[!UICONTROL hitReceived]** イベント **[!UICONTROL com.adobe.edge.conductor]** ベンダー。
1. イベントを選択し、 **[!UICONTROL メッセージ]** オブジェクト。 または、 ![コピー](https://spectrum.adobe.com/static/icons/workflow_18/Smock_Copy_18_N.svg) **[!UICONTROL 生のイベントをコピー]** を貼り付け、イベントを調べるには、好みのテキストエディターまたはコードエディターを使用します。

   ![データ収集の検証](assets/datacollection-validation.png)


## 次の手順

これで、アプリへのデータ収集の追加を開始するためのすべてのツールが用意されました。 ユーザーがアプリ内の製品をどのように操作するかに関するインテリジェンスを追加でき、さらに多くのアプリインタラクションや画面トラッキングコールをアプリに追加できます。

* 注文、チェックアウト、空のバスケット、その他の機能をアプリに実装し、関連するコマースエクスペリエンスイベントをこの機能に追加します。
* への呼び出しを繰り返します。 `sendAppInteractionEvent` を適切なパラメーターに置き換えて、ユーザーによるその他のアプリの操作を追跡します。
* への呼び出しを繰り返します。 `sendTrackScreenEvent` を適切なパラメーターに設定して、アプリ内でユーザーが表示した画面を追跡します。

>[!TIP]
>
以下を確認します。 [アプリの完了](https://github.com/Adobe-Marketing-Cloud/Luma-iOS-Mobile-App) その他の例を参照してください。


## Analytics と Platform へのイベントの送信

これで、イベントを収集して Platform Edge ネットワークに送信したので、イベントは、 [datastream](create-datastream.md). 後のレッスンでは、このデータをにマッピングします。 [Adobe Analytics](analytics.md), [Adobe Experience Platform](platform.md)などの他のAdobe Experience Cloudソリューション [Adobe Target](target.md) Adobe Journey Optimizer

>[!SUCCESS]
>
これで、Adobe Experience Platform Edge Network と、データストリームで定義したすべてのサービスに対するコマース、アプリのインタラクション、画面のトラッキングイベントを追跡するアプリを設定しました。
>
Adobe Experience Platform Mobile SDK の学習に時間を割いていただき、ありがとうございます。 ご質問がある場合、一般的なフィードバックを共有する場合、または今後のコンテンツに関する提案がある場合は、このドキュメントで共有します [Experience Leagueコミュニティディスカッション投稿](https://experienceleaguecommunities.adobe.com/t5/adobe-experience-platform-data/tutorial-discussion-implement-adobe-experience-cloud-in-mobile/td-p/443796).

次へ： **[WebViews を処理](web-views.md)**
