---
title: Adobe Experience Platform Mobile SDK のインストール
description: モバイルアプリにAdobe Experience Platform Mobile SDK を実装する方法について説明します。
jira: KT-14627
exl-id: 98d6f59e-b8a3-4c63-ae7c-8aa11e948f59
source-git-commit: 25f0df2ea09bb7383f45a698e75bd31be7541754
workflow-type: tm+mt
source-wordcount: '898'
ht-degree: 0%

---

# Adobe Experience Platform Mobile SDK のインストール

モバイルアプリにAdobe Experience Platform Mobile SDK を実装する方法について説明します。

## 前提条件

* タグライブラリが正常に構築され、 [前のレッスン](configure-tags.md).
* からの開発環境ファイル ID [モバイルインストール手順](configure-tags.md#generate-sdk-install-instructions).
* 空の [サンプルアプリ](https://github.com/Adobe-Marketing-Cloud/Luma-iOS-Mobile-App){target="_blank"}.
* の使用経験 [Xcode](https://developer.apple.com/xcode/){target="_blank"}.

## 学習内容

このレッスンでは、次の操作を実行します。

* Swift パッケージマネージャーを使用して、必要な SDK をプロジェクトに追加します。
* 拡張機能を登録します。

>[!NOTE]
>
>モバイルアプリの実装では、「拡張機能」と「SDK」という用語はほぼ互換性があります。

## Swift Package Manager

CocoaPods と POD ファイルを使用する代わりに、 [SDK のインストール手順の生成](./configure-tags.md#generate-sdk-install-instructions)) を使用して、Xcode のネイティブ Swift パッケージマネージャーを使用して個々のパッケージを追加します。 Xcode プロジェクトには、すべてのパッケージの依存関係が既に追加されています。 Xcode **[!UICONTROL パッケージの依存関係]** 画面は次のようになります。

![Xcode パッケージの依存関係](assets/xcode-package-dependencies.png){zoomable=&quot;yes&quot;}


Xcode では、 **[!UICONTROL ファイル]** > **[!UICONTROL パッケージを追加…]** をクリックしてパッケージを追加します。 次の表に、パッケージの追加に使用する URL へのリンクを示します。 また、リンクから、各パッケージの詳細情報にアクセスできます。

| パッケージ | 説明 |
|---|---|
| [AEP コア](https://github.com/adobe/aepsdk-core-ios) | The `AEPCore`, `AEPServices`、および `AEPIdentity` 拡張機能は、Adobe Experience Platform SDK の基盤を表します。SDK を使用するすべてのアプリには、これらを含める必要があります。 これらのモジュールには、すべての SDK 拡張機能で必要となる機能とサービスの共通セットが含まれています。<br/><ul><li>`AEPCore` には、Event Hub の実装が含まれています。 イベントハブは、アプリと SDK の間でイベントを配信する際に使用されるメカニズムです。 イベントハブは、拡張機能間でのデータの共有にも使用されます。</li><li>`AEPServices` は、ネットワーク、ディスクアクセス、データベース管理など、プラットフォームのサポートに必要な再利用可能な実装をいくつか提供します。</li><li>`AEPIdentity` は、Adobe Experience Platform ID サービスとの統合を実装しています。</li><li>`AEPSignal` は、マーケターがアプリに「シグナル」を送信して、外部の宛先にデータを送信したり、URL を開いたりできるAdobe Experience Platform SDK シグナル拡張機能を表します。</li><li>`AEPLifecycle` は、アプリケーションのインストールまたはアップグレード情報、アプリケーションの起動とセッション情報、デバイス情報、アプリケーション開発者が提供する追加のコンテキストデータなど、アプリケーションのライフサイクル指標を収集するのに役立つAdobe Experience Platform SDK の Lifecycle 拡張機能を表します。</li></ul> |
| [AEP Edge](https://github.com/adobe/aepsdk-edge-ios) | Adobe Experience Platform Edge Network モバイル拡張機能 (`AEPEdge`) を使用すると、モバイルアプリケーションからAdobe Edge Network にデータを送信できます。 この拡張機能を使用すると、Adobe Experience Cloud機能をより堅牢な方法で実装し、1 回のAdobe呼び出しで複数のネットワークソリューションを提供し、同時にこの情報をAdobe Experience Platformに転送できます。<br/>Edge Network モバイル拡張機能は、Adobe Experience Platform SDK の拡張機能で、 `AEPCore` および `AEPServices` イベント処理用の拡張機能、および `AEPEdgeIdentity` id を取得するための拡張（ECID など）。 |
| [AEP Edge Identity](https://github.com/adobe/aepsdk-edgeidentity-ios) | AEP Edge Identity Mobile 拡張機能 (`AEPEdgeIdentity`) を使用すると、Adobe Experience Platform SDK と Edge Network 拡張機能を使用する際に、モバイルアプリケーションからユーザー ID データを処理できます。 |
| [AEP Edge の同意](https://github.com/adobe/aepsdk-edgeconsent-ios) | AEP Consent Collection モバイル拡張機能 (`AEPConsent`) は、Adobe Experience Platform SDK と Edge Network 拡張機能を使用する際に、モバイルアプリケーションから同意設定の収集を有効にします。 |
| [AEP ユーザープロファイル](https://github.com/adobe/aepsdk-userprofile-ios) | Adobe Experience Platform User Profile Mobile 拡張機能 (`AEPUserProfile`) は、Adobe Experience Platform SDK のユーザープロファイルを管理する拡張機能です。 |
| [AEP Places](https://github.com/adobe/aepsdk-places-ios) | AEP Places 拡張機能 (`AEPPlaces`) を使用すると、Places インターフェイスおよびAdobeデータ収集Adobeルールで定義された位置情報イベントを追跡できます。 |
| [AEP メッセージ](https://github.com/adobe/aepsdk-messaging-ios) | AEP メッセージ拡張機能 (`AEPMessaging`) を使用すると、プッシュ通知トークンとプッシュ通知クリックスルーフィードバックをAdobe Experience Platformに送信できます。 |
| [AEP 最適化](https://github.com/adobe/aepsdk-optimize-ios) | AEP Optimize 拡張機能 (`AEPOptimize`) は、Adobe TargetまたはAdobe Journey OptimizerOffer decisioningを使用してAdobe Experience Platform Mobile SDK でリアルタイムのパーソナライゼーションワークフローを有効にする API を提供します。 必要な情報 `AEPCore` および `AEPEdge` パーソナライゼーションクエリイベントを Experience Edge ネットワークに送信する拡張機能です。 |
| [AEP アシュランス](https://github.com/adobe/aepsdk-assurance-ios) | Assurance (a.k.a. project Griffon) は、新しい革新的な拡張機能 (`AEPAssurance`) を使用して、モバイルアプリでデータを収集したりエクスペリエンスを提供する方法を調査、配達確認、シミュレーションおよび検証できます。 この拡張機能を使用すると、アプリでアシュランスを有効にできます。 |


## 拡張機能のインポート

Xcode で、に移動します。 **[!DNL Luma]** > **[!DNL Luma]** > **[!UICONTROL AppDelegate]** 次のインポートがこのソースファイルに含まれていることを確認します。

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

同じ操作を次にも実行します。 **[!DNL Luma]** > **[!DNL Luma]** > **[!DNL Utils]** > **[!UICONTROL MobileSDK]**.

## AppDelegate を更新

に移動します。 **[!DNL Luma]** > **[!DNL Luma]** > **AppDelegate** 」をクリックします。

1. 次を `@AppStorage` 値 `YOUR_ENVIRONMENT_ID_GOES_HERE` 対象： `environmentFileId` を、のタグから取得した開発環境ファイル ID 値に追加します。 [SDK のインストール手順の生成](configure-tags.md#generate-sdk-install-instructions).

   ```swift
   @AppStorage("environmentFileId") private var environmentFileId = "YOUR_ENVIRONMENT_ID_GOES_HERE"
   ```

1. 次のコードを `application(_, didFinishLaunchingWithOptions)` 関数に置き換えます。

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

上記のコードでは、次の処理をおこないます。

1. 必要な拡張機能を登録します。
1. タグプロパティ設定を使用するように MobileCore および他の拡張機能を設定します。
1. デバッグログを有効にします。 詳細およびオプションについては、 [Adobe Experience Platform Mobile SDK ドキュメント](https://developer.adobe.com/client-sdks/documentation/getting-started/enable-debug-logging/).
1. ライフサイクル監視を開始します。 詳しくは、 [ライフサイクル](lifecycle-data.md) 詳しくは、チュートリアルの手順を参照してください。
1. デフォルトの同意を不明に設定します。 詳しくは、 [同意](consent.md) 詳しくは、チュートリアルの手順を参照してください。

>[!IMPORTANT]
>
>を必ず更新してください `MobileCore.configureWith(appId: self.environmentFileId)` と `appId` 基準： `environmentFileId` 作成するタグ環境（開発、ステージングまたは実稼動）から。
>

>[!SUCCESS]
>
>これで、必要なパッケージをインストールし、プロジェクトを更新して、チュートリアルの残りの部分で使用する必要なAdobe Experience Platform Mobile SDK 拡張機能を適切に登録しました。
>
>Adobe Experience Platform Mobile SDK の学習に時間を割いていただき、ありがとうございます。 ご質問がある場合、一般的なフィードバックを共有する場合、または今後のコンテンツに関する提案がある場合は、このドキュメントで共有します [Experience Leagueコミュニティディスカッション投稿](https://experienceleaguecommunities.adobe.com/t5/adobe-experience-platform-data/tutorial-discussion-implement-adobe-experience-cloud-in-mobile/td-p/443796)

次へ： **[アシュランスの設定](assurance.md)**
