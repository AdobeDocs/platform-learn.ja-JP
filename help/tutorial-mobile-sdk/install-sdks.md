---
title: Adobe Experience Platform Mobile SDK のインストール
description: モバイルアプリにAdobe Experience Platform Mobile SDK を実装する方法について説明します。
exl-id: 98d6f59e-b8a3-4c63-ae7c-8aa11e948f59
source-git-commit: 94ca4a238c241518219fb2e8d73f775836f86d86
workflow-type: tm+mt
source-wordcount: '591'
ht-degree: 2%

---

# Adobe Experience Platform Mobile SDK のインストール

モバイルアプリにAdobe Experience Platform Mobile SDK を実装する方法について説明します。

>[!INFO]
>
> このチュートリアルは、2023 年 11 月後半に新しいサンプルモバイルアプリを使用した新しいチュートリアルに置き換えられます

## 前提条件

* タグライブラリが正常に構築され、 [前のレッスン](configure-tags.md).
* からの開発環境ファイル ID [モバイルインストール手順](configure-tags.md#generate-sdk-install-instructions).
* ダウンロード済み、空 [サンプルアプリ](https://github.com/Adobe-Marketing-Cloud/Luma-iOS-Mobile-App){target="_blank"}.
* の使用経験 [XCode](https://developer.apple.com/xcode/){target="_blank"}.
* 基本 [コマンドライン](https://en.wikipedia.org/wiki/Command-line_interface){target="_blank"} 知識

## 学習内容

このレッスンでは、次の操作を実行します。

* CocoaPod ファイルを更新します。
* 必要な SDK をインポートします。
* 拡張機能を登録します。

>[!NOTE]
>
>モバイルアプリの実装では、「拡張機能」と「SDK」という用語はほぼ互換性があります。


## PodFile を更新

>[!NOTE]
>
> CocoaPods に詳しくない場合は、公式の [入門ガイド](https://guides.cocoapods.org/using/getting-started.html).

Install は通常、次の簡単な sudo コマンドです。

```console
sudo gem install cocoapods
```

CocoaPods がインストールされたら、ポッドファイルを開きます。

![初期ポッドファイル](assets/mobile-install-initial-podfile.png)

ファイルを更新して、次のポッドを含めます。

```swift
pod 'AEPCore', '~> 3'
pod 'AEPEdge', '~> 1'
pod 'AEPUserProfile', '~> 3'
pod 'AEPAssurance', '~> 3'
pod 'AEPServices', '~> 3'
pod 'AEPEdgeConsent', '~> 1'
pod 'AEPLifecycle', '~>3'
pod 'AEPMessaging', '~>1'
pod 'AEPEdgeIdentity', '~>1'
pod 'AEPSignal', '~>3'
```

>[!NOTE]
>
> `AEPMessaging` は、Adobe Journey Optimizerを使用してプッシュメッセージを実装する予定がある場合にのみ必要です。 次のチュートリアルをお読みください： [Adobe Journey Optimizerでのプッシュメッセージの実装](journey-optimizer-push.md) を参照してください。

ポッドファイルへの変更を保存したら、プロジェクトのあるフォルダーに移動し、 `pod install` 」コマンドを使用して変更をインストールします。

![ポッドのインストール](assets/mobile-install-podfile-install.png)

>[!NOTE]
>
> 「プロジェクトディレクトリにポッドファイルが見つかりません」と表示された場合は、 エラーが発生しました。ターミナルが間違ったフォルダーにあります。 更新したポッドファイルが含まれるフォルダーに移動し、再度お試しください。

最新バージョンにアップグレードする場合は、 `pod update` コマンドを使用します。

>[!INFO]
>
>自分のアプリで CocoaPods を使用できない場合は、他の情報を参照できます [サポートされる実装](https://github.com/adobe/aepsdk-core-ios#binaries) を GitHub プロジェクトに追加します。

## CocoaPods の作成

CocoaPods を構築するには、を開きます。 `Luma.xcworkspace`をクリックし、次を選択します。 **製品**&#x200B;に続いて **ビルドフォルダをクリーンアップ**.

>[!NOTE]
>
> 次の設定が必要な場合は、 **アクティブなアーキテクチャのみを構築** から **いいえ**. これをおこなうには、プロジェクトナビゲーターから Pods プロジェクトを選択し、「 **ビルド設定**&#x200B;をクリックし、 **アクティブなアーキテクチャの構築** から **いいえ**.

これで、プロジェクトを構築して実行できます。

![ビルド設定](assets/mobile-install-build-settings.png)

>[!NOTE]
>
>Luma プロジェクトは、M1 チップセット上で Xcode v12.5 を使用して構築され、iOSシミュレーター上で動作します。 別の設定を使用している場合は、アーキテクチャを反映するためにビルド設定を変更する必要が生じる場合があります。
>
>ビルドが成功しなかった場合は、 **アクティブなアーキテクチャの構築** > **デバッグ** に戻す **はい**.
>
>このチュートリアルの作成時に、シミュレーター設定「iPod touch（7 世代）」が使用されました。

## 拡張機能のインポート

各 `.swift` ファイルに次のインポートを追加します。 まず、 `AppDelegate.swift`.

```swift
import AEPUserProfile
import AEPAssurance
import AEPEdge
import AEPCore
import AEPEdgeIdentity
import AEPEdgeConsent
import AEPLifecycle
import AEPMessaging //Optional, used for AJO push messaging
import AEPSignal
import AEPServices
```

## AppDelegate を更新

Adobe Analytics の `AppDelegate.swift` ファイルで、次のコードを `didFinishLaunchingWithOptions`. currentAppId を、のタグから取得した開発環境ファイル ID 値に置き換えます。 [前のレッスン](configure-tags.md).

```swift
let currentAppId = "b5cbd1a1220e/bae66382cce8/launch-88492c6dcb6e-development"

let extensions = [Edge.self, Assurance.self, Lifecycle.self, UserProfile.self, Consent.self, AEPEdgeIdentity.Identity.self, Messaging.self]

MobileCore.setLogLevel(.trace)

MobileCore.registerExtensions(extensions, {
    MobileCore.configureWith(appId: currentAppId)
})
```

`Messaging.self` は、説明に従って、Adobe Journey Optimizerを介してプッシュメッセージを実装する予定がある場合にのみ必要です [ここ](journey-optimizer-push.md).

上記のコードでは、次の処理をおこないます。

* 必要な拡張機能を登録します。
* タグプロパティ設定を使用するように MobileCore および他の拡張機能を設定します。
* デバッグログを有効にします。 詳細およびオプションについては、 [Mobile SDK ドキュメント](https://developer.adobe.com/client-sdks/documentation/getting-started/enable-debug-logging/).

>[!IMPORTANT]
>実稼動アプリケーションでは、現在の環境 (dev/stag/prod) に基づいて AppId を切り替える必要があります。
>

次へ： **[アシュランスの設定](assurance.md)**

>[!NOTE]
>
>Adobe Experience Platform Mobile SDK の学習に時間を割いていただき、ありがとうございます。 ご質問がある場合、一般的なフィードバックを共有したい場合、または今後のコンテンツに関する提案がある場合は、こちらで共有してください [Experience Leagueコミュニティディスカッション投稿](https://experienceleaguecommunities.adobe.com/t5/adobe-experience-platform-launch/tutorial-discussion-implement-adobe-experience-cloud-in-mobile/td-p/443796)