---
title: Platform Mobile SDK実装に対する同意の実装
description: モバイルアプリで同意を実装する方法を説明します。
feature: Mobile SDK,Consent
jira: KT-14629
exl-id: 08042569-e16e-4ed9-9b5a-864d8b7f0216
source-git-commit: 008d3ee066861ea9101fe9fe99ccd0a088b63f23
workflow-type: tm+mt
source-wordcount: '673'
ht-degree: 1%

---

# 同意の実装

モバイルアプリで同意を実装する方法を説明します。

Adobe Experience Platform同意モバイル拡張機能を使用すると、Adobe Experience Platform Mobile SDKおよびEdge Network拡張機能を使用する際に、モバイルアプリから同意環境設定を収集できます。 [ 同意拡張機能 ](https://developer.adobe.com/client-sdks/documentation/consent-for-edge-network/) について詳しくは、ドキュメントを参照してください。

## 前提条件

* SDK がインストールおよび設定された状態で、アプリケーションが正常に構築および実行されました。

## 学習目標

このレッスンでは、次の操作を行います。

* ユーザーに同意を求めます。
* ユーザーの応答に基づいて拡張機能を更新します。
* 現在の同意状態を取得する方法を説明します。

## 同意を求める

最初からチュートリアルに従った場合、同意拡張機能のデフォルトの同意を、ユーザーが同意環境設定を指定する前に発生する **[!UICONTROL 保留中 – キューのイベント]** に設定していることに注意してください。

データの収集を開始するには、ユーザーの同意を得る必要があります。 実際のアプリでは、お住まいの地域に合わせた同意のベストプラクティスを参照する必要があります。 このチュートリアルでは、アラートを付けて要求するだけで、ユーザーから同意を得ます。

>[!BEGINTABS]

>[!TAB iOS]

1. ユーザーに同意を求めるのは 1 回だけです。 Mobile SDKの同意を、Appleの [App Tracking Transparency Framework](https://developer.apple.com/documentation/apptrackingtransparency) を使用したトラッキングに必要な認証と組み合わせます。 このアプリでは、トラッキングを承認するユーザーが、イベントの収集に同意すると仮定します。

1. Xcode プロジェクトナビゲーターで **[!DNL Luma]**/**[!DNL Luma]**/**[!DNL Utils]**/**[!UICONTROL MobileSDK]** に移動します。

   このコードを `updateConsent` 関数に追加します。

   ```swift
   // Update consent
   let collectConsent = ["collect": ["val": value]]
   let currentConsents = ["consents": collectConsent]
   Consent.update(with: currentConsents)
   MobileCore.updateConfigurationWith(configDict: currentConsents)
   ```

1. Xcode のプロジェクトナビゲーターで、**[!DNL Luma]**/**[!DNL Luma]**/**[!DNL Views]**/**[!DNL General]**/**[!UICONTROL DisclaimerView]** に移動します。 Xode のプロジェクトナビゲーターは、アプリケーションをインストールまたは再インストールし、アプリケーションを初めて起動した後に表示されるビューです。 Appleごとのトラッキングを認証するプロンプトが表示されます [App Tracking Transparency Framework](https://developer.apple.com/documentation/apptrackingtransparency)。 ユーザーが承認すると、同意も更新されます。

   `ATTrackingManager.requestTrackingAuthorization { status in` クロージャに次のコードを追加します。

   ```swift
   // Add consent based on authorization
   if status == .authorized {
      // Set consent to yes
      MobileSDK.shared.updateConsent(value: "y")
   }
   else {
      // Set consent to yes
      MobileSDK.shared.updateConsent(value: "n")
   }
   ```

>[!TAB Android]

1. ユーザーに同意を求めるのは 1 回だけです。 このアプリでは、トラッキングを承認するユーザーが、イベントの収集に同意すると仮定します。

1. Android Studio ナビゲーターで **[!UICONTROL app]**/**[!UICONTROL kotlin+java]**/**[!UICONTROL com.adobe.luma.tutorial.android]**/**[!UICONTROL models]**/**[!UICONTROL MobileSDK]** に移動します。

   このコードを `updateConsent(value: String)` 関数に追加します。

   ```kotlin
   // Update consent
   val collectConsent = mapOf("collect" to mapOf("val" to value))
   val currentConsents = mapOf("consents" to collectConsent)
   Consent.update(currentConsents)
   MobileCore.updateConfiguration(currentConsents)
   ```

1. Android Studio ナビゲーターで **[!UICONTROL app]**/**[!UICONTROL kotlin+java]**/**[!UICONTROL com.adobe.luma.tutorial.android]**/**[!UICONTROL views]**/**[!UICONTROL DisclaimerView.kt]** に移動します。

   `DisclaimerView(navController: NavController)`、`// Set content to yes` の下の `// Set content to no` 関数に次のコードを追加します。

   ```kotlin
   // Add consent based on authorization
   if (status) {
      showPersonalizationWarning = false
   
      // Set consent to yes
      MobileSDK.shared.updateTrackingStatus(TrackingStatus.AUTHORIZED)
      MobileSDK.shared.updateConsent("y")
   } else {
      Toast.makeText(
            context,
            "You will not receive offers and location tracking will be disabled.",
            Toast.LENGTH_LONG
      ).show()
      showPersonalizationWarning = true
   
      // Set consent to no
      MobileSDK.shared.updateTrackingStatus(TrackingStatus.DENIED)
      MobileSDK.shared.updateConsent("n")
   }
   ```

>[!ENDTABS]

## 現在の同意状態を取得

同意モバイル拡張機能は、現在の同意値に基づいて、トラッキングを自動的に抑制/保留/許可します。 現在の同意状態に自分でアクセスすることもできます。

>[!BEGINTABS]

>[!TAB iOS]

1. Xcode のプロジェクトナビゲーターで **[!DNL Luma]**/**[!DNL Luma]**/**[!DNL Utils]**/**[!UICONTROL MobileSDK]** に移動します。

   `getConsents` 関数に次のコードを追加します。

   ```swift
   // Get consents
   Consent.getConsents { consents, error in
      guard error == nil, let consents = consents else { return }
      guard let jsonData = try? JSONSerialization.data(withJSONObject: consents, options: .prettyPrinted) else { return }
      guard let jsonStr = String(data: jsonData, encoding: .utf8) else { return }
      Logger.aepMobileSDK.info("Consent getConsents: \(jsonStr)")
   }
   ```

2. Xcode のプロジェクトナビゲーターで、**[!DNL Luma]**/**[!DNL Luma]**/**[!DNL Views]**/**[!DNL General]**/**[!UICONTROL HomeView]** に移動します。

   `.task` 修飾子に次のコードを追加します。

   ```swift
   // Ask status of consents
   MobileSDK.shared.getConsents()   
   ```

上記の例では、同意ステータスを Xcode のコンソールに記録するだけです。 実際のシナリオでは、ユーザーに表示するメニューやオプションを変更する場合に使用します。

>[!TAB Android]

1. Android Studio ナビゲーターで **[!UICONTROL app]**/**[!UICONTROL kotlin+java]**/**[!UICONTROL com.adobe.luma.tutorial.android]**/**[!UICONTROL models]**/**[!UICONTROL MobileSDK]** に移動します。

   `getConsents()` 関数に次のコードを追加します。

   ```kotlin
   // Get consents
   Consent.getConsents { callback ->
      if (callback != null) {
            val jsonStr = JSONObject(callback).toString(4)
            Log.i("MobileSDK", "Consent getConsents: $jsonStr")
      }
   }
   ```

1. Android Studio ナビゲーターで **[!UICONTROL app]**/**[!UICONTROL kotlin+java]**/**[!UICONTROL com.adobe.luma.tutorial.android]**/**[!UICONTROL views]**/**[!UICONTROL HomeView.kt]** に移動します。

   `LaunchedEffect(unit)` に次のコードを追加します。

   ```kotlin
   // Ask status of consents
   MobileSDK.shared.getConsents()   
   ```

上記の例では、同意ステータスをAndroid Studio のコンソールに記録するだけです。 実際のシナリオでは、ユーザーに表示するメニューやオプションを変更する場合に使用します。

>[!ENDTABS]

## Assurance での検証

1. デバイスまたはシミュレーターからアプリケーションを削除して、トラッキングと同意を適切にリセットおよび初期化します。
1. シミュレーターやデバイスをAssuranceに接続するには、[ 設定手順 ](assurance.md#connecting-to-a-session) セクションを確認してください。
1. アプリを **[!UICONTROL ホーム]** 画面から **[!UICONTROL 製品]** 画面に移動し、**[!UICONTROL ホーム]** 画面に戻ると、Assurance UI に **[!UICONTROL 同意応答を取得]** イベントが表示されます。
   ![ 同意を検証 ](assets/consent-update.png){zoomable="yes"}


>[!SUCCESS]
>
>これで、Adobe Experience Platform Mobile SDKを使用して、インストール（または再インストール）後、最初にユーザーに同意を求めるプロンプトをアプリで表示できるようになりました。
>
>Adobe Experience Platform Mobile SDKの学習にご協力いただき、ありがとうございます。 ご不明な点がある場合や、一般的なフィードバックをお寄せになる場合、または今後のコンテンツに関するご提案がある場合は、この [Experience League Community Discussion の投稿でお知らせください ](https://experienceleaguecommunities.adobe.com/t5/adobe-experience-platform-data/tutorial-discussion-implement-adobe-experience-cloud-in-mobile/td-p/443796)

次のトピック：**[ライフサイクル・データの収集](lifecycle-data.md)**
