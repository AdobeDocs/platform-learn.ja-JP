---
title: Adobe Experience Platform Mobile SDK のインストール
description: Adobe Experience Platform Mobile SDK をモバイルアプリに実装する方法について説明します。
jira: KT-14627
exl-id: 98d6f59e-b8a3-4c63-ae7c-8aa11e948f59
source-git-commit: 008d3ee066861ea9101fe9fe99ccd0a088b63f23
workflow-type: tm+mt
source-wordcount: '1768'
ht-degree: 3%

---

# Adobe Experience Platform Mobile SDK のインストール {#tutorial_install_mobile_sdks}

>[!CONTEXTUALHELP]
>
>id="platform_mobile_sdk_tutorial_install"
>title="Adobe Experience Platform Mobile SDK のインストール"
>abstract="Adobe Experience Platform Mobile SDK をモバイルアプリに実装する方法について説明します。"

Adobe Experience Platform Mobile SDK をモバイルアプリに実装する方法について説明します。

## 前提条件

* [ 前のレッスン ](configure-tags.md) で説明した拡張機能を使用して、タグライブラリを正常に作成しました。
* [ モバイルインストール手順 ](configure-tags.md#generate-sdk-install-instructions) の開発環境ファイル ID。
* [iOS用サンプルアプリ ](https://github.com/Adobe-Marketing-Cloud/Luma-iOS-Mobile-App) または [Android用サンプルアプリ ](https://github.com/adobe/Luma-Android) をダウンロードした。
* [Xcode](https://developer.apple.com/xcode/) （iOS）または [Android Studio](https://developer.android.com/studio/intro?utm_source=android-studio) （Android）の使用経験

## 学習目標

このレッスンでは、次の操作を行います。

* 必要な SDK をプロジェクトに追加します。
* 拡張機能を登録します

>[!NOTE]
>
>モバイルアプリの実装では、*拡張機能* と *SDK* という用語はほとんど入れ替えられます。

>[!BEGINTABS]

>[!TAB iOS]

## Swift パッケージマネージャー

（[SDKのインストール手順の生成 ](./configure-tags.md#generate-sdk-install-instructions) で説明しているように） CocoaPods とポッドファイルを使用する代わりに、Xcode のネイティブの Swift パッケージマネージャーを使用して、個々のパッケージを追加します。 Xcode プロジェクトには、すべてのパッケージ依存関係が既に追加されています。 Xcode **[!UICONTROL パッケージの依存関係]** 画面は次のようになります。

![Xcode パッケージの依存関係 ](assets/xcode-package-dependencies.png){zoomable="yes"}


Xcode では、**[!UICONTROL File]** > **[!UICONTROL Add Packages...]** を使用してパッケージを追加できます。 次の表は、パッケージの追加に使用する URL へのリンクを示しています。 また、リンクでは、それぞれの特定のパッケージに関する詳細も示されます。

| パッケージ | 説明 |
|---|---|
| [AEP Core](https://github.com/adobe/aepsdk-core-ios) | `AEPCore`、`AEPServices`、`AEPIdentity` の各拡張機能は、Adobe Experience Platform SDKの基盤となります。SDKを使用するすべてのアプリに、拡張機能を含める必要があります。 これらのモジュールには、すべてのSDK Extensions が必要とする機能とサービスの共通のセットが含まれています。<br/><ul><li>`AEPCore` には、イベントハブの実装が含まれています。 イベントハブは、アプリとSDKの間でイベントを配信するために使用されるメカニズムです。 イベントハブは、拡張機能間でのデータの共有にも使用されます。</li><li>`AEPServices` は、ネットワーク、ディスクアクセス、データベース管理など、プラットフォームのサポートに必要な、再利用可能な実装をいくつか提供しています。</li><li>`AEPIdentity` は、Adobe Experience Platform ID サービスとの統合を実装します。</li><li>`AEPSignal` は、マーケターがアプリに「シグナル」を送信し、データを外部の宛先に送信したり、URL を開いたりできる、Adobe Experience Platform SDK シグナル拡張機能を表します。</li><li>`AEPLifecycle` は、Adobe Experience Platform SDK ライフサイクル拡張機能を表し、アプリケーションのインストールまたはアップグレードの情報、アプリケーションの起動およびセッションの情報、デバイス情報、アプリケーション開発者から提供されるその他のコンテキストデータなど、アプリケーションのライフサイクル指標を収集するのに役立ちます。</li></ul> |
| [AEPEdge](https://github.com/adobe/aepsdk-edge-ios) | Adobe Experience Platform Edge Network モバイル拡張機能（`AEPEdge`）を使用すると、モバイルアプリケーションから Adobe Edge Network にデータを送信できます。 この拡張機能を使用すると、Adobe Experience Cloud機能をより堅牢な方法で実装し、1 回のネットワーク呼び出しで複数のAdobe ソリューションを提供した後、この情報を同時にAdobe Experience Platformに転送できます。<br/>Edge Network モバイル拡張機能は、Adobe Experience Platform SDKの拡張機能です。 この拡張機能には、イベント処理のための `AEPCore` と `AEPServices` の拡張機能に加え、ECID などの ID を取得するための `AEPEdgeIdentity` 拡張機能が必要です。 |
| [AEP Edge ID](https://github.com/adobe/aepsdk-edgeidentity-ios) | Adobe Experience Platform Edge ID モバイル拡張機能（`AEPEdgeIdentity`）を使用すると、Adobe Experience Platform SDKおよびEdge Network拡張機能を使用する際に、モバイルアプリケーションからユーザーの ID データを処理できます。 |
| [AEP Edgeの同意 ](https://github.com/adobe/aepsdk-edgeconsent-ios) | Adobe Experience Platform Consent Collection モバイル拡張機能（`AEPConsent`）は、Adobe Experience Platform SDKとEdge Network拡張機能を使用する際に、モバイルアプリケーションからの同意環境設定の収集を有効にします。 |
| [AEP ユーザープロファイル ](https://github.com/adobe/aepsdk-userprofile-ios) | Adobe Experience Platform User Profile Mobile Extension （`AEPUserProfile`）は、Adobe Experience Platform SDKのユーザープロファイルを管理するための拡張機能です。 |
| [AEP](https://github.com/adobe/aepsdk-places-ios) | Adobe Experience Platform Places 拡張機能（`AEPPlaces`）を使用すると、Adobe Places インターフェイスおよびAdobe Data Collection Tag ルールで定義した位置情報イベントをトラッキングできます。 |
| [AEPのメッセージング ](https://github.com/adobe/aepsdk-messaging-ios) | Adobe Experience Platform Messaging 拡張機能（`AEPMessaging`）を使用すると、プッシュ通知トークンとプッシュ通知のクリックスルーフィードバックをAdobe Experience Platformに送信できます。 |
| [AEPの最適化 ](https://github.com/adobe/aepsdk-optimize-ios) | Adobe Experience Platform Optimize 拡張機能（`AEPOptimize`）は、Adobe TargetまたはAdobe Journey Optimizer Offer Decisioningを使用して、Adobe Experience Platform Mobile SDK でリアルタイムパーソナライゼーションワークフローを有効にするための API を提供します。 パーソナライゼーションクエリイベントを Experience Edge Networkに送信するには、`AEPCore` と `AEPEdge` の拡張機能が必要です。 |
| [AEPAssurance](https://github.com/adobe/aepsdk-assurance-ios) | Adobe Experience Platform Assuranceは、モバイルアプリでデータを収集したりエクスペリエンスを提供したりする方法を検査、配達確認、シミュレートおよび検証するのに役立つ、Adobe Experience Cloudの製品です。 |


## 拡張機能の読み込み

Xcode で、サンプルアプリの **[!UICONTROL スタート]** フォルダーにあるプロジェクトを開きます。

Xcode で、**[!DNL Luma]** / **[!DNL Luma]** / **[!UICONTROL AppDelegate]** に移動し、次の読み込みがこのソースファイルの一部であることを確認します。

```swift
// import AEP MobileSDK libraries
import AEPCore
import AEPServices
import AEPIdentity
import AEPSignal
import AEPLifecycle
import AEPEdge
import AEPEdgeIdentity
import AEPEdgeConsent
import AEPUserProfile
import AEPPlaces
import AEPMessaging
import AEPOptimize
import AEPAssurance
```

**[!DNL Luma]**/**[!DNL Luma]**/**[!DNL Utils]**/**[!UICONTROL MobileSDK]** に対して、同じ操作を行います。

## AppDelegate の更新

Xcode プロジェクトナビゲーターで **[!DNL Luma]**/**[!DNL Luma]**/**AppDelegate** に移動します。

1. `@AppStorage` の `YOUR_ENVIRONMENT_ID_GOES_HERE` 値 `environmentFileId` を、[SDK インストール手順の生成 ](configure-tags.md#generate-sdk-install-instructions) のタグから取得した環境ファイル ID 値に置き換えます。

   ```swift
   @AppStorage("environmentFileId") private var environmentFileId = "YOUR_ENVIRONMENT_ID_GOES_HERE"
   ```

1. `application(_, didFinishLaunchingWithOptions)` 関数に次のコードを追加します。

   ```swift
   // Define extensions
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
   
   // Register extensions
   MobileCore.registerExtensions(extensions, {
       // Use the environment file id assigned to this application via Adobe Experience Platform Data Collection
       Logger.aepMobileSDK.info("Luma - using mobile config: \(self.environmentFileId)")
       MobileCore.configureWith(appId: self.environmentFileId)
   
       // set this to false or comment it when deploying to TestFlight (default is false),
       // set this to true when testing on your device.
       MobileCore.updateConfigurationWith(configDict: ["messaging.useSandbox": true])
       if appState != .background {
           // only start lifecycle if the application is not in the background
           MobileCore.lifecycleStart(additionalContextData: nil)
       }
   
       // assume unknown, adapt to your needs.
       MobileCore.setPrivacyStatus(.unknown)
   })
   ```

上記のコードの動作は次のとおりです。

1. 必要な拡張機能を登録します。
1. タグプロパティ設定を使用するように MobileCore およびその他の拡張機能を設定します。
1. デバッグログを有効にします。 詳細およびオプションについては、[Adobe Experience Platform Mobile SDK ドキュメント ](https://developer.adobe.com/client-sdks/documentation/getting-started/enable-debug-logging/) を参照してください。
1. ライフサイクルの監視を開始します。 詳しくは、チュートリアルの [ ライフサイクル ](lifecycle-data.md) ステップを参照してください。
1. デフォルトの同意を不明に設定します。 詳しくは、チュートリアルの [ 同意 ](consent.md) 手順を参照してください。

作成するタグ環境（開発、ステージングまたは実稼動）の `MobileCore.configureWith(appId: self.environmentFileId)` に基づいて、`appId` を使用して `environmentFileId` を更新してください。

>[!TAB Android]

## Gradle

[SDKのインストール手順の生成 ](./configure-tags.md#generate-sdk-install-instructions) の依存関係を使用して、Gradle とAndroid Studio の統合を使用して個々のパッケージを追加します。Android Studio プロジェクトには、すべてのパッケージの依存関係が既に追加されています。

1. ![FolderOutline](/help/assets/icons/FolderOutline.svg) をツールとして選択します。
1. **[!UICONTROL Android]** ビューを選択します。
1. 左側のペインから **[!UICONTROL Gradle scripts]**/**[!UICONTROL build.gradle.kts （Module :app）]** を選択します。 次に、右側のペインで、`dependencies` が表示されるまでスクロールします。

   ![Android Gradle の依存関係 ](assets/androidstudio-package-dependencies.png){zoomable="yes"}

Android Studio では、**[!UICONTROL File]**/**[!UICONTROL Project Structure...]** を使用して、モジュールの依存関係を追加できます。 **[!UICONTROL 依存関係]** を選択してから、**[!UICONTROL モジュール]** ![ 追加 ](/help/assets/icons/Add.svg) を使用してモジュールを追加してください。 次の表は、依存関係モジュールの追加に使用する URL へのリンクを示しています。 また、各モジュールの詳細についても説明します。

| Package<br/>com.adobe.<br/>marketing.mobile: | 説明 |
|---|---|
| [ コア ](https://github.com/adobe/aepsdk-core-android) | `MobileCore` と `Identity` の拡張機能は、Adobe Experience Platform SDKの基盤を表します。 SDKを使用するアプリには、必ずインクルードする必要があります。 これらのモジュールには、すべてのSDK Extensions が必要とする機能とサービスの共通セットが含まれています。<ul><li>`MobileCore` には、イベントハブの実装が含まれています。 イベントハブは、アプリとSDKの間でイベントを配信するために使用されるメカニズムです。 イベントハブは、拡張機能間でのデータの共有にも使用され、ネットワーク、ディスクアクセス、データベース管理など、プラットフォームのサポートに必要な再利用可能な実装をいくつか提供しています。</li><li>`Identity` は、Adobe Experience Platform ID サービスとの統合を実装します。</li><li>`Signal` は、マーケターがアプリに「シグナル」を送信し、データを外部の宛先に送信したり、URL を開いたりできる、Adobe Experience Platform SDKのシグナル拡張機能を表します。</li><li>`Lifecycle` は、Adobe Experience Platform SDKのライフサイクル拡張機能を表し、アプリケーションのインストールまたはアップグレードの情報、アプリケーションの起動およびセッションの情報、デバイス情報、アプリケーション開発者から提供されるその他のコンテキストデータなど、アプリケーションのライフサイクル指標を収集するのに役立ちます。</li></ul> |
| [edge](https://github.com/adobe/aepsdk-edge-android) | Adobe Experience Platform Edge Network モバイル拡張機能（`AEPEdge`）を使用すると、モバイルアプリケーションから Adobe Edge Network にデータを送信できます。 この拡張機能を使用すると、Adobe Experience Cloud機能をより堅牢な方法で実装し、1 回のネットワーク呼び出しで複数のAdobe ソリューションを提供した後、この情報を同時にAdobe Experience Platformに転送できます。<br/>Edge Network モバイル拡張機能は、Adobe Experience Platform SDKの拡張機能です。 拡張機能には、イベント処理のための `Mobile Core` および `Services` 拡張機能が必要です。 ECID などの ID を取得するための `Identity for Edge Network` 拡張機能です。 |
| [edgeidentity](https://github.com/adobe/aepsdk-edgeidentity-android) | Adobe Experience Platform Edge ID モバイル拡張機能を使用すると、Adobe Experience Platform SDKおよびEdge Network拡張機能を使用する際に、モバイルアプリケーションからユーザーの ID データを処理できます。 |
| [edgeversent](https://github.com/adobe/aepsdk-edgeconsent-android) | Adobe Experience Platform同意収集モバイル拡張機能を使用すると、Adobe Experience Platform SDKおよびEdge Network拡張機能を使用する際に、モバイルアプリケーションから同意環境設定を収集できます。 |
| [userprofile](https://github.com/adobe/aepsdk-userprofile-android) | Adobe Experience Platform ユーザープロファイルモバイル拡張機能は、Adobe Experience Platform SDKのユーザープロファイルを管理するための拡張機能です。 |
| [aepplaces](https://github.com/adobe/aepsdk-places-android) | Adobe Places Service は、位置情報対応のモバイルアプリを可能にする位置情報サービスです。 柔軟な目標地点（POI）データベースを備えた、機能豊富で使いやすいSDK インターフェイスを使用して、場所のコンテキストを理解します。 詳しくは、Places Service ドキュメントを参照してください。<br/> このサービスはAndroid 2.x Adobe Experience Platform SDK用の Places モバイル拡張機能で、イベント処理には Core 拡張機能が必要です。 |
| [ メッセージング ](https://github.com/adobe/aepsdk-messaging-android) | Adobe Experience Platform Messaging 拡張機能は、モバイルアプリのプッシュ通知、アプリ内メッセージおよびコードベースのエクスペリエンスを強化します。 また、この拡張機能は、ユーザープッシュトークンの収集と、Adobe Experience Platform サービスとのインタラクション測定の管理にも役立ちます。 |
| [ 最適化 ](https://github.com/adobe/aepsdk-optimize-android) | Adobe Experience Platform Optimize 拡張機能は、Adobe TargetまたはAdobe Journey Optimizer Offer Decisioningを使用して、Adobe Experience Platform SDK でリアルタイムパーソナライゼーションワークフローを有効にするための API を提供します。 これは Mobile Core に依存し、パーソナライゼーションクエリイベントをEdge Edge Networkに送信するには Experience Extension が必要です。 |
| [assurance](https://github.com/adobe/aepsdk-assurance-android) | Assurance（Griffon プロジェクトとも呼ばれる）は、Adobe Experience Platform Assuranceとの統合を可能にするAdobe Experience Platformのモバイル拡張機能です。 拡張機能は、モバイルアプリでデータを収集したりエクスペリエンスを提供したりする方法を検査、配達確認、シミュレートおよび検証するのに役立ちます。 この拡張機能には MobileCore が必要です。 |

## 拡張機能の読み込み

Android Studio で、**[!UICONTROL app]**/**[!UICONTROL kotlin+java]**/**[!UICONTROL com.adobe.luma.tutorial.android]**/**[!UICONTROL LumaApplication]** に移動し、次の読み込みがソースファイルの一部であることを確認します。

```kotlin
import com.adobe.marketing.mobile.Assurance
import com.adobe.marketing.mobile.Edge
import com.adobe.marketing.mobile.Lifecycle
import com.adobe.marketing.mobile.LoggingMode
import com.adobe.marketing.mobile.Messaging
import com.adobe.marketing.mobile.MobileCore
import com.adobe.marketing.mobile.MobilePrivacyStatus
import com.adobe.marketing.mobile.Places
import com.adobe.marketing.mobile.Signal
import com.adobe.marketing.mobile.UserProfile
import com.adobe.marketing.mobile.edge.consent.Consent
import com.adobe.marketing.mobile.edge.identity.Identity
import com.adobe.marketing.mobile.optimize.Optimize
```

**[!UICONTROL app]**/**[!UICONTROL kotlin+java]**/**[!UICONTROL com.adobe.luma.tutorial.android]**/**[!UICONTROL models]**/**[!UICONTROL MobileSDK]** に対して、同じ操作を行います。


## LumaApplication の更新

**[!UICONTROL Android]** ビューで、Android Studio の **[!UICONTROL app]**/**[!UICONTROL kotlin+java]**/**[!UICONTROL com.adobe.luma.tutorial.android]**/**[!UICONTROL LumaApplication]** に移動します。

1. `"YOUR_ENVIRONMENT_FILE_ID"` の `private var environmentFileId = "YOUR_ENVIRONMENT_ID_GOES_HERE"` を、[SDK インストール手順の生成 ](configure-tags.md#generate-sdk-install-instructions) のタグから取得した環境ファイル ID 値に置き換えます。

   ```kotlin
   private var environmentFileId = "YOUR_ENVIRONMENT_ID_GOES_HERE"
   ```

1. `override fun onCreate()` の関数に次のコード `class LumaApplication : Application()` 追加します。

   ```kotlin
   // Define extensions
   val extensions = listOf(
      Identity.EXTENSION,
      Lifecycle.EXTENSION,
      Signal.EXTENSION,
      Edge.EXTENSION,
      Consent.EXTENSION,
      UserProfile.EXTENSION,
      Places.EXTENSION,
      Messaging.EXTENSION,
      Optimize.EXTENSION,
      Assurance.EXTENSION
   )
   
   // Register extensions
   MobileCore.registerExtensions(extensions) {
   // Use the environment file id assigned to this application via Adobe Experience Platform Data Collection
     Log.i("Luma", "Using mobile config: $environmentFileId")
     MobileCore.configureWithAppID(environmentFileId)
   
     // set this to true when testing on your device, default is false.
     //MobileCore.updateConfiguration(mapOf("messaging.useSandbox" to true))
   
     // assume unknown, adapt to your needs.
     MobileCore.setPrivacyStatus(MobilePrivacyStatus.UNKNOWN)
   }
   ```

   上記のコードの動作は次のとおりです。

   1. 必要な拡張機能を登録します。
   1. タグプロパティ設定を使用するように MobileCore およびその他の拡張機能を設定します。
   1. デバッグログを有効にします。 詳細およびオプションについては、[Adobe Experience Platform Mobile SDK ドキュメント ](https://developer.adobe.com/client-sdks/documentation/getting-started/enable-debug-logging/) を参照してください。
   1. ライフサイクルの監視を開始します。 詳しくは、チュートリアルの [ ライフサイクル ](lifecycle-data.md) ステップを参照してください。
   1. デフォルトの同意を不明に設定します。 詳しくは、チュートリアルの [ 同意 ](consent.md) 手順を参照してください。

`MobileCore.configureWith(environmentFileId)` を、構築対象のタグ環境（開発、ステージングまたは実稼動）の環境ファイル ID に基づいて `environmentFileId` で更新してください。


>[!ENDTABS]

>[!SUCCESS]
>
>これで、必要なパッケージをインストールし、チュートリアルの残りの部分で使用する、必要なAdobe Experience Platform モバイル SDK拡張機能を登録するためにプロジェクトを更新しました。
>
>Adobe Experience Platform Mobile SDKの学習にご協力いただき、ありがとうございます。 ご不明な点がある場合や、一般的なフィードバックをお寄せになる場合、または今後のコンテンツに関するご提案がある場合は、この [Experience League Community Discussion の投稿でお知らせください ](https://experienceleaguecommunities.adobe.com/t5/adobe-experience-platform-data/tutorial-discussion-implement-adobe-experience-cloud-in-mobile/td-p/443796?profile.language=ja)

次のトピック：**[Assuranceの設定](assurance.md)**
