---
title: SDKの置き換え – Adobe TargetからAdobe Journey Optimizer - Decisioning モバイル拡張機能への移行
description: Adobe TargetからAdobe Journey Optimizer - Decisioning モバイル拡張機能に移行する際に、SDKを置き換える方法を説明します。
exl-id: f1b77cad-792b-4a80-acff-e1a2f29250e1
source-git-commit: 62afd1f41b3d20c04782a2b18423683ed3b49d1f
workflow-type: tm+mt
source-wordcount: '677'
ht-degree: 2%

---

# Target SDKを Optimize SDKに置き換えます。

モバイル実装でAdobe Target SDK を最適化 SDK に置き換える方法を説明します。 基本的な置き換えは、次の手順で構成されます。

* Podfile または `build.gradle` ファイルの依存関係を更新します
* 読み込みを更新
* アプリケーションコードを更新

>[!INFO]
>
>Adobe Experience Platform Mobile SDK エコシステム内では、拡張機能は、アプリケーションに読み込まれた、名前が異なる可能性のある SDK によって実装されます。
>
> * **Target SDK** は、**Adobe Target拡張機能を実装しています**
> * **SDKの最適化** は、**Adobe Journey Optimizer - Decisioning 拡張機能を実装しています**

## 依存関係の更新

+++Androidの例

>[!BEGINTABS]

>[!TAB SDKの最適化 ]

移行後の `build.gradle` 依存関係

```Java
implementation platform('com.adobe.marketing.mobile:sdk-bom:3.+')
implementation 'com.adobe.marketing.mobile:edgeconsent'
implementation 'com.adobe.marketing.mobile:edgeidentity'
implementation 'com.adobe.marketing.mobile:edge'
implementation 'com.adobe.marketing.mobile:assurance'
implementation 'com.adobe.marketing.mobile:core'
implementation 'com.adobe.marketing.mobile:identity'
implementation 'com.adobe.marketing.mobile:lifecycle'
implementation 'com.adobe.marketing.mobile:signal'
implementation 'com.adobe.marketing.mobile:userprofile'
```


>[!TAB Target SDK]

移行前に `build.gradle` 依存関係

```Java
implementation platform('com.adobe.marketing.mobile:sdk-bom:3.+')
implementation 'com.adobe.marketing.mobile:analytics'
implementation 'com.adobe.marketing.mobile:target'
implementation 'com.adobe.marketing.mobile:core'
implementation 'com.adobe.marketing.mobile:identity'
implementation 'com.adobe.marketing.mobile:lifecycle'
implementation 'com.adobe.marketing.mobile:signal'
implementation 'com.adobe.marketing.mobile:userprofile'
```


>[!ENDTABS]

+++

+++ iOSの例

>[!BEGINTABS]


>[!TAB SDKの最適化 ]

移行後の `Podfile` 依存関係

```Swift
use_frameworks!
target 'YourAppTarget' do
    pod 'AEPCore', '~> 5.0'
    pod 'AEPEdge', '~> 5.0'
    pod 'AEPEdgeIdentity', '~> 5.0'
    pod 'AEPOptimize', '~> 5.0'
end
```

>[!TAB Target SDK]

移行前に `Podfile` 依存関係

```Swift
use_frameworks!
pod 'AEPAnalytics', '~> 5.0'
pod 'AEPTarget', '~> 5.0'
pod 'AEPCore', '~> 5.0'
pod 'AEPIdentity', '~> 5.0'
pod 'AEPSignal', '~>5.0'
pod 'AEPLifecycle', '~>5.0'
pod 'AEPUserProfile', '~> 5.0'
```

>[!ENDTABS]

+++

## インポートとコードの更新

+++ Androidの例

>[!BEGINTABS]

>[!TAB SDKの最適化 ]

移行後の Java 初期化コード

```Java
import com.adobe.marketing.mobile.AdobeCallback;
import com.adobe.marketing.mobile.Assurance;
import com.adobe.marketing.mobile.Edge;
import com.adobe.marketing.mobile.Extension;
import com.adobe.marketing.mobile.Identity;
import com.adobe.marketing.mobile.Lifecycle;
import com.adobe.marketing.mobile.LoggingMode;
import com.adobe.marketing.mobile.MobileCore;
import com.adobe.marketing.mobile.Signal;
import com.adobe.marketing.mobile.UserProfile;
import com.adobe.marketing.mobile.edge.consent.Consent;
import com.adobe.marketing.mobile.edge.identity.Identity;
import java.util.Arrays;
import java.util.List;
...
import android.app.Application;
...
public class MainApp extends Application {
...
    @Override
    public void onCreate() {
        super.onCreate();
        MobileCore.setApplication(this);
        MobileCore.setLogLevel(LoggingMode.DEBUG);
        ...
        List<Class<? extends Extension>> extensions = Arrays.asList(
            Consent.EXTENSION,
            com.adobe.marketing.mobile.edge.identity.Identity.EXTENSION,
            com.adobe.marketing.mobile.Identity.EXTENSION,
            Edge.EXTENSION,
            Assurance.EXTENSION,
            Lifecycle.EXTENSION,
            Signal.EXTENSION,
            UserProfile.EXTENSION
        );
 
 
        MobileCore.registerExtensions(extensions, new AdobeCallback () {
            @Override
            public void call(Object o) {
                MobileCore.configureWithAppID(<Environment File ID>);
            }
        });
    }
}
```

>[!TAB Target SDK]

移行前の Java 初期化コード

```Java
import com.adobe.marketing.mobile.AdobeCallback;
import com.adobe.marketing.mobile.Analytics;
import com.adobe.marketing.mobile.Extension;
import com.adobe.marketing.mobile.Identity;
import com.adobe.marketing.mobile.Lifecycle;
import com.adobe.marketing.mobile.LoggingMode;
import com.adobe.marketing.mobile.MobileCore;
import com.adobe.marketing.mobile.Signal;
import com.adobe.marketing.mobile.Target;
import com.adobe.marketing.mobile.UserProfile;
import java.util.Arrays;
import java.util.List;
...
import android.app.Application;
...
public class MainApp extends Application {
...
    @Override
    public void onCreate() {
        super.onCreate();
        MobileCore.setApplication(this);
        MobileCore.setLogLevel(LoggingMode.DEBUG);
        ...
        List<Class<? extends Extension>> extensions = Arrays.asList(
            Analytics.EXTENSION,
            Target.EXTENSION,
            Identity.EXTENSION,
            Lifecycle.EXTENSION,
            Signal.EXTENSION,
            UserProfile.EXTENSION
        );
 
 
        MobileCore.registerExtensions(extensions, new AdobeCallback () {
            @Override
            public void call(Object o) {
                MobileCore.configureWithAppID(<Environment File ID>);
            }
        });
    }
}
```

>[!ENDTABS]

+++

+++ iOS

>[!BEGINTABS]

>[!TAB SDKの最適化 ]

移行後の Swift 初期化コード

```Swift
import AEPCore
import AEPAnalytics
import AEPTarget
import AEPIdentity
import AEPLifecycle
import AEPSignal
import AEPServices
import AEPUserProfile
...
@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        MobileCore.setLogLevel(.debug)
        let appState = application.applicationState
        ...
        let extensions = [
            Consent.self,
            AEPEdgeIdentity.Identity.self,
            AEPIdentity.Identity.self,
            Edge.self,
            Assurance.self,
            Lifecycle.self,
            Signal.self,
            UserProfile.self
        ]
        MobileCore.registerExtensions(extensions, {
        MobileCore.configureWith(<Environment File ID>)
        if appState != .background {
            MobileCore.lifecycleStart(additionalContextData: ["contextDataKey": "contextDataVal"])
            }
        })
        ...
        return true
    }
}
```

>[!TAB Target SDK]

移行前の Swift 初期化コード

```Swift
import AEPCore
import AEPAnalytics
import AEPTarget
import AEPIdentity
import AEPLifecycle
import AEPSignal
import AEPServices
import AEPUserProfile
...
@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        MobileCore.setLogLevel(.debug)
        let appState = application.applicationState
        ...
        let extensions = [
            Analytics.self,
            Target.self,
            Identity.self,
            Lifecycle.self,
            Signal.self,
            UserProfile.self
        ]
        MobileCore.registerExtensions(extensions, {
        MobileCore.configureWith(<Environment File ID>)
        if appState != .background {
            MobileCore.lifecycleStart(additionalContextData: ["contextDataKey": "contextDataVal"])
            }
        })
        ...
        return true
    }
}
```

>[!ENDTABS]

+++

## 関数の比較

多くの Target 拡張機能は、以下の表に示す意思決定拡張機能を使用して、同等のアプローチを持っています。 [functions](https://developer.adobe.com/target/implement/client-side/atjs/atjs-functions/atjs-functions/) について詳しくは、『Adobe Target開発者ガイド』を参照してください。

| ターゲット拡張機能 | Decisioning 拡張機能 | メモ |
| --- | --- | --- | 
| `prefetchContent` | `updatePropositions` |  |
| `retrieveLocationContent` | `getPropositions` | API を使用 `getPropositions` る場合、SDK内のキャッシュされていないスコープを取得するためのリモート呼び出しは行われません。 |
| `displayedLocations` | オファー – > `displayed()` | さらに、オ `generateDisplayInteractionXdm` ァー方法を使用して、項目表示用の XDM を生成できます。 その後、Edge network SDKの sendEvent API を使用して、追加の XDM、自由形式のデータを添付し、エクスペリエンスイベントをリモートに送信できます。 |
| `clickedLocation` | オファー – > `tapped()` | さらに、オ `generateTapInteractionXdm` ァー方法を使用して、項目タップ用の XDM を生成できます。 その後、Edge network SDKの sendEvent API を使用して、追加の XDM、自由形式のデータを添付し、エクスペリエンスイベントをリモートに送信できます。 |
| `clearPrefetchCache` | `clearCachedPropositions` |  |
| `resetExperience` | 該当なし | Edge`removeIdentity`Edge Network ID 拡張機能の API を使用して、SDK ID を訪問者ネットワークに送信するのを停止します。 詳しくは、[removeIdentity API ドキュメント ](https://developer.adobe.com/client-sdks/edge/identity-for-edge-network/api-reference/#removeidentity) を参照してください。 <br><br> メモ：Mobile Core の `resetIdentities` API は、Experience Cloud ID （ECID）を含む、SDKに保存されているすべての ID をクリアするので、使用は慎重に行う必要があります。 |
| `getSessionId` | 該当なし | 応答ハンドル `state:store`、セッション関連の情報を保持します。 Edge network extension は、期限切れでないステートストア項目を後続のリクエストに添付することで、この機能を管理するのに役立ちます。 |
| `setSessionId` | 該当なし | 応答ハンドル `state:store`、セッション関連の情報を保持します。 Edge network extension は、期限切れでないステートストア項目を後続のリクエストに添付することで、この機能を管理するのに役立ちます。 |
| `getThirdPartyId` | 該当なし | Edge Network拡張機能の Identity から updateIdentities API を使用して、サードパーティ ID の値を指定します。 次に、データストリームでサードパーティ ID 名前空間を設定します。 詳しくは、[Target サードパーティ ID モバイルのドキュメント ](https://developer.adobe.com/client-sdks/edge/adobe-journey-optimizer-decisioning/#target-third-party-id) を参照してください。 |
| `setThirdPartyId` | 該当なし | Edge Network拡張機能の Identity から updateIdentities API を使用して、サードパーティ ID の値を指定します。 次に、データストリームでサードパーティ ID 名前空間を設定します。 詳しくは、[Target サードパーティ ID モバイルのドキュメント ](https://developer.adobe.com/client-sdks/edge/adobe-journey-optimizer-decisioning/#target-third-party-id) を参照してください。 |
| `getTntId` | 該当なし | 応答ハンドル `locationHint:result`、Target の場所のヒント情報を保持します。 Target Edge が Experience Edgeと共存することを前提としています。<br> <br>Edge ネットワーク拡張機能は、EdgeNetwork の場所のヒントを使用して、要求の送信先となるEdge ネットワーク クラスターを判断します。 SDK （ハイブリッドアプリ）間でEdgeのネットワーク場所のヒントを共有するには、Edge Network拡張機能の `getLocationHint` および `setLocationHint` API を使用します。 詳しくは、[`getLocationHint` API ドキュメント ](https://developer.adobe.com/client-sdks/edge/edge-network/api-reference/#getlocationhint) を参照してください。 |
| `setTntId` | 該当なし | 応答ハンドル `locationHint:result`、Target の場所のヒント情報を保持します。 Target Edge が Experience Edgeと共存することを前提としています。<br> <br>Edge ネットワーク拡張機能は、EdgeNetwork の場所のヒントを使用して、要求の送信先となるEdge ネットワーク クラスターを判断します。 SDK （ハイブリッドアプリ）間でEdgeのネットワーク場所のヒントを共有するには、Edge Network拡張機能の `getLocationHint` および `setLocationHint` API を使用します。 詳しくは、[`getLocationHint` API ドキュメント ](https://developer.adobe.com/client-sdks/edge/edge-network/api-reference/#getlocationhint) を参照してください。 |


次に、ページに [ アクティビティをリクエストおよびレンダリング ](render-activities.md) する方法を説明します。

>[!NOTE]
>
>アドビは、Target 拡張機能から Decisioning 拡張機能への Mobile Target の移行を成功させるために取り組んでいます。 移行の際に問題が発生した場合、またはこのガイドに重要な情報が欠落していると感じる場合は、[ このコミュニティのディスカッション ](https://experienceleaguecommunities.adobe.com/t5/adobe-experience-platform-data/tutorial-discussion-migrate-target-from-at-js-to-web-sdk/m-p/575587#M463) に投稿してお知らせください。
