---
title: Adobe Experience Platform Mobile SDK のインストール
description: モバイルアプリにAdobe Experience Platform Mobile SDK を実装する方法について説明します。
hide: true
source-git-commit: 6cc58d3d40112b14b1c1b8664c5e7aeb0880b59c
workflow-type: tm+mt
source-wordcount: '928'
ht-degree: 1%

---

# Adobe Experience Platform Mobile SDK のインストール

モバイルアプリにAdobe Experience Platform Mobile SDK を実装する方法について説明します。

## 前提条件

* タグライブラリが正常に構築され、 [前のレッスン](configure-tags.md).
* からの開発環境ファイル ID [モバイルインストール手順](configure-tags.md#generate-sdk-install-instructions).
* ダウンロード済み、空 [サンプルアプリ](https://github.com/Adobe-Marketing-Cloud/Luma-iOS-Mobile-App){target="_blank"}.
* の使用経験 [XCode](https://developer.apple.com/xcode/){target="_blank"}.

## 学習内容

このレッスンでは、次の操作を実行します。

* Swift パッケージマネージャーを使用して、必要な SDK をプロジェクトに追加します。
* 拡張機能を登録します。

>[!NOTE]
>
>モバイルアプリの実装では、「拡張機能」と「SDK」という用語はほぼ互換性があります。

## Swift Package Manager

CocoaPods を使用したり、Pod ファイルを使用する代わりに（モバイルインストールの手順で説明されているように）、 [SDK のインストール手順の生成](./configure-tags.md#generate-sdk-install-instructions)) を使用して、Xcode のネイティブ Swift パッケージマネージャーを使用して個々のパッケージを追加します。

Xcode では、 **[!UICONTROL ファイル]** > **[!UICONTROL パッケージを追加…]** 次の表に示すすべてのパッケージをインストールします。 表内のパッケージのリンクを選択して、特定のパッケージの完全な URL を取得します。

| パッケージ | 説明 |
|---|---|
| [AEP コア](https://github.com/adobe/aepsdk-core-ios.git) | The `AEPCore`, `AEPServices`、および `AEPIdentity` 拡張機能は、Adobe Experience Platform SDK の基盤を表します。SDK を使用するすべてのアプリには、これらを含める必要があります。 これらのモジュールには、すべての SDK 拡張機能で必要となる機能とサービスの共通セットが含まれています。<br/>`AEPCore` には、Event Hub の実装が含まれています。 イベントハブは、アプリと SDK の間でイベントを配信する際に使用されるメカニズムです。 イベントハブは、拡張機能間でのデータの共有にも使用されます。<br/>`AEPServices` は、ネットワーク、ディスクアクセス、データベース管理など、プラットフォームのサポートに必要な再利用可能な実装をいくつか提供します。<br/>`AEPIdentity` は、Adobe Experience Platform ID サービスとの統合を実装しています。<br/>`AEPSignal` は、マーケターがアプリに「シグナル」を送信して、外部の宛先にデータを送信したり、URL を開いたりできる、Adobe Experience Platform SDK のシグナル拡張機能を表します。<br/>`AEPLifecycle` は、アプリケーションのインストールまたはアップグレード情報、アプリケーションの起動とセッション情報、デバイス情報、アプリケーション開発者が提供する追加のコンテキストデータなど、アプリケーションのライフサイクル指標を収集するのに役立つAdobe Experience Platform SDK のライフサイクル拡張を表します。 |
| [AEP Edge](https://github.com/adobe/aepsdk-edge-ios.git) | Adobe Experience Platform Edge Network モバイル拡張機能を使用すると、モバイルアプリケーションからAdobe Edgeネットワークにデータを送信できます。 この拡張機能を使用すると、Adobe Experience Cloud機能をより堅牢な方法で実装し、1 回のAdobe呼び出しで複数のネットワークソリューションを提供し、同時にこの情報をAdobe Experience Platformに転送できます。<br/>Edge Network モバイル拡張機能は、Adobe Experience Platform SDK の拡張機能で、 `AEPCore` および `AEPServices` イベント処理用の拡張機能、および `AEPEdgeIdentity` id を取得するための拡張（ECID など）。 |
| [AEP Edge Identity](https://github.com/adobe/aepsdk-edgeidentity-ios.git) | AEP Edge Identity Mobile 拡張機能を使用すると、Adobe Experience Platform SDK と Edge Network 拡張機能を使用する際に、モバイルアプリケーションからのユーザー ID データを処理できます。 |
| [AEP Edge の同意](https://github.com/adobe/aepsdk-edgeconsent-ios.git) | AEP Consent Collection モバイル拡張機能を使用すると、Adobe Experience Platform SDK と Edge Network 拡張機能を使用する際に、モバイルアプリケーションから同意設定の収集を有効にできます。 |
| [AEP ユーザープロファイル](https://github.com/adobe/aepsdk-userprofile-ios.git) | Adobe Experience Platform User Profile Mobile Extension は、Adobe Experience Platform SDK のユーザープロファイルを管理する拡張機能です。 |
| [AEP Places](https://github.com/adobe/aepsdk-places-ios) | Adobe Experience Platform Places 拡張機能は、Adobe Experience Platform Swift SDK の拡張機能です。 AEPPlaces 拡張機能を使用すると、AdobePlaces UI およびAdobeLaunch ルールで定義された位置情報イベントを追跡できます。 |
| [AEP メッセージ](https://github.com/adobe/aepsdk-messaging-ios.git) | AEP メッセージ拡張機能は、Adobe Experience Platform Swift SDK の拡張機能です。 AEP Messaging 拡張機能を使用すると、プッシュ通知トークンとプッシュ通知クリックスルーフィードバックをAdobe Experience Platformに送信できます。 |
| [AEP 最適化](https://github.com/adobe/aepsdk-optimize-ios) | AEP OptimizeOffer decisioning機能は、Adobe TargetまたはAdobe Journey Optimizer拡張機能を使用して、Adobe Experience Platform Mobile SDK でリアルタイムのパーソナライゼーションワークフローを有効にする API を提供します。 必要な情報 `AEPCore` および `AEPEdge` パーソナライゼーションクエリイベントを Experience Edge ネットワークに送信する拡張機能です。 |
| [AEP Assurance](https://github.com/adobe/aepsdk-assurance-ios.git) | Assurance(a.k.a. project Griffon) は、モバイルアプリでデータを収集したりエクスペリエンスを提供する方法を調査、配達確認、シミュレーション、検証するのに役立つ、新しい革新的な製品です。 |


すべてのパッケージをインストールしたら、Xcode **[!UICONTROL パッケージの依存関係]** 画面は次のようになります。

![Xcode パッケージの依存関係](assets/xcode-package-dependencies.png)


## 拡張機能のインポート

Xcode で、に移動します。 **[!UICONTROL Luma]** > **[!UICONTROL Luma]** > **[!UICONTROL AppDelegate]** 次のインポートを追加します。

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

同じ操作を次にも実行します。 **[!UICONTROL Luma]** > **[!UICONTROL Luma]** > **[!UICONTROL Utils]** > **[!UICONTROL MobileSDK]**.

## AppDelegate を更新

に移動します。 **[!UICONTROL Luma]** > **[!UICONTROL Luma]** > **AppDelegate** 」をクリックします。

1. を設定します。 `@AppStorage` 値 `environmentFileId` を、手順 6 でタグから取得した開発環境ファイル ID 値 ( [SDK のインストール手順の生成](configure-tags.md#generate-sdk-install-instructions).

   ```swift
   @AppStorage("environmentFileId") private var environmentFileId = "b5cbd1a1220e/1857ef6cacb5/launch-2594f26b23cd-development"
   ```

1. 次のコードを `application(_, didFinishLaunchingWithOptions)` 関数に置き換えます。

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
   
       // update version and build
       Logger.configuration.info("Luma - Updating version and build number...")
       SettingsBundleHelper.setVersionAndBuildNumber()
   })
   ```

上記のコードでは、次の処理をおこないます。

1. 必要な拡張機能を登録します。
1. タグプロパティ設定を使用するように MobileCore および他の拡張機能を設定します。
1. デバッグログを有効にします。 詳細およびオプションについては、 [Adobe Experience Platform Mobile SDK ドキュメント](https://developer.adobe.com/client-sdks/documentation/getting-started/enable-debug-logging/).

>[!IMPORTANT]
>
>を必ず更新してください `MobileCore.configureWith(appId: self.environmentFileId)` と `appId` 基準： `environmentFileId` 作成するタグ環境（開発、ステージングまたは実稼動）から。
>

>[!SUCCESS]
>
>これで、必要なパッケージをインストールし、プロジェクトを更新して、チュートリアルの残りの部分で使用する必要なAdobe Experience Platform Mobile SDK 拡張機能を適切に登録しました。<br/>Adobe Experience Platform Mobile SDK の学習に時間を割いていただき、ありがとうございます。 ご質問がある場合、一般的なフィードバックを共有する場合、または今後のコンテンツに関する提案がある場合は、このドキュメントで共有します [Experience Leagueコミュニティディスカッション投稿](https://experienceleaguecommunities.adobe.com/t5/adobe-experience-platform-launch/tutorial-discussion-implement-adobe-experience-cloud-in-mobile/td-p/443796)

次へ： **[アシュランスの設定](assurance.md)**
