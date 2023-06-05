---
title: WebViews を処理
description: モバイルアプリで WebViews を使用してデータ収集を処理する方法を説明します。
kt: 6987
exl-id: 9b3c96fa-a1b8-49d2-83fc-ece390b9231c
source-git-commit: b2e1bf08d9fb145ba63263dfa078c96258342708
workflow-type: tm+mt
source-wordcount: '397'
ht-degree: 0%

---

# WebViews を処理

モバイルアプリで WebViews を使用してデータ収集を処理する方法を説明します。

## 前提条件

* SDK が正常に構築され、インストールされ、設定された状態でアプリが実行されました。

## 学習内容

このレッスンでは、次の操作を実行します。

* WebViews に関する特別な考慮事項を考慮する必要がある理由を理解します。
* トラッキングの問題を防ぐために必要なコードを理解します。

## トラッキングの問題の可能性

アプリのネイティブ部分と WebView からデータを送信する場合、それぞれが独自のExperience CloudID(ECID) を生成します。 その結果、ヒットが切断され、訪問/訪問者のデータが水増しされます。 ECID について詳しくは、 [ECID の概要](https://experienceleague.adobe.com/docs/experience-platform/identity/ecid.html?lang=en).

その望ましくない状況を解決するには、ユーザーの ECID をネイティブ部分から WebView に渡すことが重要です。

WebView のExperience CloudID サービス JavaScript 拡張機能は、新しい ID のリクエストをAdobeに送信する代わりに、URL から ECID を抽出します。 ID サービスは、この ECID を使用して訪問者を追跡します。

## 実装

Luma サンプルアプリで、 `TermsOfService.swift` ファイル ( `Intro-Login_SignUp` フォルダー ) を探し、次のコードを探します。

```swift
// Show tou.html
let url = Bundle.main.url(forResource: "tou", withExtension: "html")
let myRequest = URLRequest(url: url!)
self.webView.load(myRequest)
```

これは、WebView を読み込む簡単な方法です。 この場合、ローカルファイルですが、リモートページにも同じ概念が適用されます。

次に示すように、Web ビューコードをリファクタリングします。

```swift
let url = Bundle.main.url(forResource: "tou", withExtension: "html")
if var urlString = url?.absoluteString {
    // Adobe Experience Platform - Handle Web View
    AEPEdgeIdentity.Identity.getUrlVariables {(urlVariables, error) in
        if let error = error {
            self.simpleAlert("\(error.localizedDescription)")
            return;
        }

        if let urlVariables: String = urlVariables {
            urlString.append("?" + urlVariables)
        }

        DispatchQueue.main.async {
            self.webView.load(URLRequest(url: URL(string: urlString)!))
        }
        print("Successfully retrieved urlVariables for WebView, final URL: \(urlString)")
    }
} else {
    self.simpleAlert("Failed to create URL for webView")
}
```

詳しくは、 `Identity.getUrlVariables` の API [Edge Network 拡張機能 API リファレンスガイドの ID](https://developer.adobe.com/client-sdks/documentation/identity-for-edge-network/api-reference/#geturlvariables).

## 検証

次の [設定手順](assurance.md) セクションを開き、シミュレーターまたはデバイスを Assurance に接続し、WebView を読み込んで、 `Edge Identity Response URL Variables` イベント `com.adobe.griffon.mobile` ベンダー。

WebView を読み込むには、Luma アプリのホーム画面に移動し、「アカウント」アイコンを選択し、フッターの「利用条件」を選択します。

WebView の読み込み後、イベントを選択し、 `urlvariables` フィールド `ACPExtensionEventData` オブジェクトの URL に次のパラメーターが存在することを確認します。 `adobe_mc`, `mcmid`、および `mcorgid`.

![webview 検証](assets/mobile-webview-validation.png)

サンプル `urvariables` フィールドは次のように表示されます。

```html
// Original (with escaped characters)
adobe_mc=TS%3D1636526122%7CMCMID%3D79076670946787530005526183384271520749%7CMCORGID%3D7ABB3E6A5A7491460A495D61%40AdobeOrg

// Beautified
adobe_mc=TS=1636526122|MCMID=79076670946787530005526183384271520749|MCORGID=7ABB3E6A5A7491460A495D61@AdobeOrg
```

>[!NOTE]
>
>現在、これらの URL パラメーターを使用した訪問者のステッチは、Platform Web SDK( バージョン2.11.0以降 ) および `VisitorAPI.js`.


次へ： **[ID](identity.md)**

>[!NOTE]
>
>Adobe Experience Platform Mobile SDK の学習に時間を割いていただき、ありがとうございます。 ご質問がある場合、一般的なフィードバックを共有したい場合、または今後のコンテンツに関する提案がある場合は、こちらで共有してください [Experience Leagueコミュニティディスカッション投稿](https://experienceleaguecommunities.adobe.com/t5/adobe-experience-platform-launch/tutorial-discussion-implement-adobe-experience-cloud-in-mobile/td-p/443796)