---
title: Adobe Experience Platform Mobile SDK のインストール
description: Adobe Experience Platform Mobile SDK をモバイルアプリに実装する方法について説明します。
jira: KT-14627
exl-id: 98d6f59e-b8a3-4c63-ae7c-8aa11e948f59
source-git-commit: 3dd9c68203d0021e87caaa82bd962b3f9160a397
workflow-type: tm+mt
source-wordcount: '916'
ht-degree: 7%

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
* 空の [ サンプルアプリ ](https://github.com/Adobe-Marketing-Cloud/Luma-iOS-Mobile-App){target="_blank"} をダウンロードした。
* [Xcode](https://developer.apple.com/xcode/){target="_blank"} の使用経験。

## 学習目標

このレッスンでは、次の操作を行います。

* Swift パッケージマネージャーを使用して、必要な SDK をプロジェクトに追加します。
* 拡張機能を登録します

>[!NOTE]
>
>モバイルアプリの実装では、「拡張機能」と「SDK」という用語はほとんど互換性がありません。

## Swift パッケージマネージャー

（[SDKのインストール手順の生成 ](./configure-tags.md#generate-sdk-install-instructions) で説明しているように） CocoaPods とポッドファイルを使用する代わりに、Xcode のネイティブの Swift パッケージマネージャーを使用して、個々のパッケージを追加します。 Xcode プロジェクトには、すべてのパッケージ依存関係が既に追加されています。 Xcode **[!UICONTROL パッケージの依存関係]** 画面は次のようになります。

![Xcode パッケージの依存関係 ](assets/xcode-package-dependencies.png){zoomable="yes"}


Xcode では、**[!UICONTROL File]** > **[!UICONTROL Add Packages...]** を使用してパッケージを追加できます。 次の表は、パッケージの追加に使用する URL へのリンクを示しています。 また、リンクでは、それぞれの特定のパッケージに関する詳細も示されます。

| パッケージ | 説明 |
|---|---|
| [AEP コア ](https://github.com/adobe/aepsdk-core-ios) | `AEPCore`、`AEPServices`、`AEPIdentity` の各拡張機能は、Adobe Experience Platform SDKの基盤となります。SDKを使用するすべてのアプリに、拡張機能を含める必要があります。 これらのモジュールには、すべてのSDK Extensions で必要な機能とサービスの共通のセットが含まれています。<br/><ul><li>`AEPCore` には、イベントハブの実装が含まれています。 イベントハブは、アプリとSDKの間でイベントを配信するために使用されるメカニズムです。 イベントハブは、拡張機能間でのデータの共有にも使用されます。</li><li>`AEPServices` は、ネットワーク、ディスクアクセス、データベース管理など、プラットフォームのサポートに必要な、再利用可能な実装をいくつか提供しています。</li><li>`AEPIdentity` は、Adobe Experience Platform ID サービスとの統合を実装します。</li><li>`AEPSignal` は、マーケターがアプリに「シグナル」を送信し、データを外部の宛先に送信したり、URL を開いたりできる、Adobe Experience Platform SDK シグナル拡張機能を表します。</li><li>`AEPLifecycle` は、Adobe Experience Platform SDK ライフサイクル拡張機能を表し、アプリケーションのインストールまたはアップグレードの情報、アプリケーションの起動およびセッションの情報、デバイス情報、アプリケーション開発者から提供されるその他のコンテキストデータなど、アプリケーションのライフサイクル指標を収集するのに役立ちます。</li></ul> |
| [AEP Edge](https://github.com/adobe/aepsdk-edge-ios) | Adobe Experience Platform Edge Network モバイル拡張機能（`AEPEdge`）を使用すると、モバイルアプリケーションから Adobe Edge Network にデータを送信できます。 この拡張機能を使用すると、Adobe Experience Cloud機能をより堅牢な方法で実装し、1 回のネットワーク呼び出しで複数のAdobe ソリューションを提供した後、この情報を同時にAdobe Experience Platformに転送できます。<br/>Edge Network モバイル拡張機能はAdobe Experience Platform SDKの拡張機能で、イベント処理のための `AEPCore` と `AEPServices` の拡張機能および ECID などの ID を取得するための `AEPEdgeIdentity` 拡張機能が必要です。 |
| [AEP Edge ID](https://github.com/adobe/aepsdk-edgeidentity-ios) | AEP Edge ID モバイル拡張機能（`AEPEdgeIdentity`）を使用すると、Adobe Experience Platform SDKおよびEdge Network拡張機能を使用する際に、モバイルアプリケーションからユーザーの ID データを処理できます。 |
| [AEP Edge同意 ](https://github.com/adobe/aepsdk-edgeconsent-ios) | AEP Consent Collection モバイル拡張機能（`AEPConsent`）は、Adobe Experience Platform SDKとEdge Network拡張機能を使用する際に、モバイルアプリケーションからの同意環境設定の収集を有効にします。 |
| [AEP ユーザープロファイル ](https://github.com/adobe/aepsdk-userprofile-ios) | Adobe Experience Platform User Profile Mobile Extension （`AEPUserProfile`）は、Adobe Experience Platform SDKのユーザープロファイルを管理するための拡張機能です。 |
| [AEP Places](https://github.com/adobe/aepsdk-places-ios) | AEP Places 拡張機能（`AEPPlaces`）を使用すると、Adobe Places インターフェイスやAdobe Data Collection Tag ルールで定義した位置情報イベントを追跡できます。 |
| [AEP メッセージ ](https://github.com/adobe/aepsdk-messaging-ios) | AEP Messaging 拡張機能（`AEPMessaging`）を使用すると、プッシュ通知トークンとプッシュ通知のクリックスルーフィードバックをAdobe Experience Platformに送信できます。 |
| [AEP の最適化 ](https://github.com/adobe/aepsdk-optimize-ios) | AEP Optimize 拡張機能（`AEPOptimize`）は、Adobe TargetまたはAdobe Journey Optimizer Offer Decisioningを使用して、Adobe Experience Platform Mobile SDK でリアルタイムパーソナライゼーションワークフローを有効にするための API を提供します。 パーソナライゼーションクエリイベントを Experience Edge Network に送信するには、`AEPCore` と `AEPEdge` の拡張機能が必要です。 |
| [AEP Assurance](https://github.com/adobe/aepsdk-assurance-ios) | Assurance（Griffon プロジェクト）は、モバイルアプリでデータを収集したりエクスペリエンスを提供したりする方法を検査、配達確認、シミュレートおよび検証するのに役立つ、新しい革新的な拡張機能（`AEPAssurance`）です。 この拡張機能により、アプリがAssurance用に有効になります。 |


## 拡張機能の読み込み

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

1. `environmentFileId` の `@AppStorage` 値 `YOUR_ENVIRONMENT_ID_GOES_HERE` を、[SDKのインストール手順の生成 ](configure-tags.md#generate-sdk-install-instructions) のタグから取得した開発環境ファイル ID 値に置き換えます。

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

>[!IMPORTANT]
>
>作成するタグ環境（開発、ステージングまたは実稼動）の `environmentFileId` に基づいて、`appId` を使用して `MobileCore.configureWith(appId: self.environmentFileId)` を更新してください。
>

>[!SUCCESS]
>
>これで、必要なパッケージをインストールし、チュートリアルの残りの部分で使用する必要なAdobe Experience Platform Mobile SDK Extensions を適切に登録するために、プロジェクトを更新しました。
>
>Adobe Experience Platform Mobile SDKの学習にご協力いただき、ありがとうございます。 ご不明な点がある場合や、一般的なフィードバックをお寄せになる場合、または今後のコンテンツに関するご提案がある場合は、この [Experience League Community Discussion の投稿でお知らせください ](https://experienceleaguecommunities.adobe.com/t5/adobe-experience-platform-data/tutorial-discussion-implement-adobe-experience-cloud-in-mobile/td-p/443796?profile.language=ja)

次のトピック：**[Assuranceの設定](assurance.md)**
