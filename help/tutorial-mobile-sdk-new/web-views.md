---
title: WebViews を処理
description: モバイルアプリで WebViews を使用してデータ収集を処理する方法を説明します。
jira: KT-6987
hide: true
source-git-commit: 1b09f81b364fe8cfa9d5d1ac801d7781d1786259
workflow-type: tm+mt
source-wordcount: '456'
ht-degree: 0%

---


# WebViews を処理

モバイルアプリで WebViews を使用してデータ収集を処理する方法を説明します。

## 前提条件

* SDK が正常に構築され、インストールされ、設定された状態でアプリが実行されました。

## 学習内容

このレッスンでは、次の操作を実行します。

* アプリケーションで WebViews に関する特別な考慮事項を考慮する必要がある理由を理解します。
* トラッキングの問題を防ぐために必要なコードを理解します。

## トラッキングの問題の可能性

アプリのネイティブ部分とアプリ内の WebView からデータを送信する場合、それぞれが独自のExperience CloudID(ECID) を生成します。これにより、ヒットが切断され、訪問/訪問者データが水増しされます。 ECID について詳しくは、 [ECID の概要](https://experienceleague.adobe.com/docs/experience-platform/identity/ecid.html?lang=en).

望ましくない状況を解決するには、アプリのネイティブ部分からアプリで使用したい WebView にユーザーの ECID を渡すことが重要です。

WebView のExperience CloudID サービス JavaScript 拡張機能は、新しい ID のリクエストをAdobeに送信する代わりに、URL から ECID を抽出します。 ID サービスは、この ECID を使用して訪問者を追跡します。

## 実装

に移動します。 **[!UICONTROL Luma]** > **[!UICONTROL Luma]** > **[!UICONTROL 件数]** > **[!UICONTROL 情報]** > **[!UICONTROL TermsOfServiceSheet]**&#x200B;をクリックし、 `func loadUrl()` 関数 `final class SwiftUIWebViewModel: ObservableObject` クラス。 次の呼び出しを追加して、Web ビューを処理します。

```swift
// Handle web view
AEPEdgeIdentity.Identity.getUrlVariables {(urlVariables, error) in
    if let error = error {
        print("Error with Webview", error)
        return;
    }
    
    if let urlVariables: String = urlVariables {
        urlString.append("?" + urlVariables)
        guard let url = URL(string: urlString) else {
            return
        }
        DispatchQueue.main.async {
            self.webView.load(URLRequest(url: url))
        }
    }
    Logger.aepMobileSDK.info("Successfully retrieved urlVariables for WebView, final URL: \(urlString)")
}
```

The [`AEPEdgeIdentity.Identity.getUrlVariables`](https://developer.adobe.com/client-sdks/documentation/identity-for-edge-network/api-reference/#geturlvariables) API は、ECID などのすべての関連情報を含めるために URL の変数を設定します。 この例では、ローカルファイルを使用していますが、リモートページにも同じ概念が適用されます。

詳しくは、 `Identity.getUrlVariables` の API [Edge Network 拡張機能 API リファレンスガイドの ID](https://developer.adobe.com/client-sdks/documentation/identity-for-edge-network/api-reference/#geturlvariables).

## 検証

コードを実行するには、次の手順に従います。

1. 次に移動： **[!UICONTROL 設定]** アプリ内
1. 次をタップします。 **[!UICONTROL 表示…]** ボタンをクリックして、 **[!UICONTROL 利用条件]**.

   <img src="./assets/tou1.png" width="300" /> <img src="./assets/tou2.png" width="300" />

1. Assurance UI で、 **[!UICONTROL エッジ ID 応答 URL 変数]** イベント **[!UICONTROL com.adobe.griffon.mobile]** ベンダー。
1. イベントを選択し、 **[!UICONTROL urlvariable]** フィールド **[!UICONTROL ACPExtensionEventData]** オブジェクトの URL に次のパラメーターが存在することを確認します。 `adobe_mc`, `mcmid`、および `mcorgid`.

   ![Web ビュー検証](assets/webview-validation.png)

   サンプル `urvariables` フィールドは次のように表示されます。

   * 元の文字（エスケープ文字を使用）

     ```html
     adobe_mc=TS%3D1636526122%7CMCMID%3D79076670946787530005526183384271520749%7CMCORGID%3D7ABB3E6A5A7491460A495D61%40AdobeOrg
     ```

   * 美化

     ```html
     adobe_mc=TS=1636526122|MCMID=79076670946787530005526183384271520749|MCORGID=7ABB3E6A5A7491460A495D61@AdobeOrg
     ```

>[!NOTE]
>
>これらの URL パラメーターを使用した訪問者のステッチは、Platform Web SDK( バージョン2.11.0以降 ) で、 `VisitorAPI.js`.


>[!SUCCESS]
>
>これで、Adobe Experience Platform Mobile SDK が既に発行した ECID と同じ ECID を使用して、Web ビューの URL に基づいてコンテンツを表示するアプリを設定しました。<br/>Adobe Experience Platform Mobile SDK の学習に時間を割いていただき、ありがとうございます。 ご質問がある場合、一般的なフィードバックを共有する場合、または今後のコンテンツに関する提案がある場合は、このドキュメントで共有します [Experience Leagueコミュニティディスカッション投稿](https://experienceleaguecommunities.adobe.com/t5/adobe-experience-platform-launch/tutorial-discussion-implement-adobe-experience-cloud-in-mobile/td-p/443796)

次へ： **[ID](identity.md)**
