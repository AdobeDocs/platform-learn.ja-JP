---
title: プロファイル
description: モバイルアプリでプロファイルデータを収集する方法を説明します。
hide: true
hidefromtoc: true
source-git-commit: ca83bbb571dc10804adcac446e2dba4fda5a2f1d
workflow-type: tm+mt
source-wordcount: '582'
ht-degree: 2%

---

# プロファイル

モバイルアプリでプロファイルデータを収集する方法を説明します。

Profile 拡張機能を使用して、ユーザーに関する属性をクライアントに保存できます。 この情報を後で使用して、オンラインまたはオフラインのシナリオでメッセージのターゲティングやパーソナライズをおこなうことができます。最適なパフォーマンスを得るために、サーバーに接続する必要はありません。 Profile 拡張機能は、クライアントサイド操作プロファイル (CSOP) を管理し、API への対応、ユーザープロファイル属性の更新、ユーザープロファイル属性の他のシステムとの生成イベントとしての共有をおこなう方法を提供します。

プロファイルデータは、他の拡張機能によってプロファイル関連のアクションを実行するために使用されます。 例えば、プロファイルデータを使用し、プロファイルデータに基づいてルールを実行する Rules Engine 拡張機能があります。 詳しくは、 [Profile 拡張機能](https://developer.adobe.com/client-sdks/documentation/profile/) ドキュメント内

>[!IMPORTANT]
>
>このレッスンで説明するプロファイル機能は、Adobe Experience Platformおよび Platform ベースのアプリケーションのリアルタイム顧客プロファイル機能とは別の機能です。


## 前提条件

* SDK が正常に構築され、インストールされ、設定された状態でアプリが実行されました。
* プロファイル SDK を読み込みました。

  ```swift
  import AEPUserProfile
  ```

## 学習内容

このレッスンでは、次の操作を実行します。

* ユーザー属性を設定または更新します。
* ユーザー属性を取得します。


## 設定と更新

ターゲティングやパーソナライゼーションでは、ユーザーが以前にアプリで購入したかどうかをすばやく把握すると便利です。 Luma アプリでセットアップしましょう。

1. に移動します。 **[!UICONTROL ProductView]** ( **[!UICONTROL 件数]** > **[!UICONTROL 製品]**) をクリックし、 `updateUserAttributes` （「購入」ボタン内）:

   ```swift {highlight="8-9"}
   Button {
       Task {
           if ATTrackingManager.trackingAuthorizationStatus == .authorized {
               // Send purchase commerce experience event
               MobileSDK.shared.sendCommerceExperienceEvent(commerceEventType: "purchases", product: product)
               // Update attributes
               MobileSDK.shared.updateUserAttributes(attributeName: "isPaidUser", attributeValue: "yes")
           }
       }
       showPurchaseDialog.toggle()
   } label: {
       Label("", systemImage: "creditcard")
   }
   .alert(isPresented: $showPurchaseDialog, content: {
       Alert(title: Text( "Purchases"), message: Text("The selected item is purchased…"))
   })
   ```

2. に移動します。 **[!UICONTROL MobileSDK]** そして、 `updateUserAttributes` 関数に置き換えます。 次のハイライト表示されたコードを追加します。

   ```swift {highlight="2-4"}
   func updateUserAttributes(attributeName: String, attributeValue: String) {
       var profileMap = [String: Any]()
       profileMap[attributeName] = attributeValue
       UserProfile.updateUserAttributes(attributeDict: profileMap)
   }
   ```

   このコードは次を実行します。

   1. 次の名前の空の辞書を設定します： `profileMap`.

   1. を使用して辞書に要素を追加します。 `attributeName` 例： `isPaidUser`) および `attributeValue` 例： `yes`) をクリックします。

   1. を使用します。 `profileMap` 辞書を `attributeDict` のパラメーター `UserProfile.updateUserAttributes` API 呼び出し。


その他 `updateUserAttributes` ドキュメントを参照してください [ここ](https://developer.adobe.com/client-sdks/documentation/profile/api-reference/#updateuserattribute).

## 取得

ユーザーの属性を更新すると、他のAdobeSDK で使用できるようになりますが、属性を明示的に取得することもできます。

1. に移動します。 **[!UICONTROL HomeView]** ( **[!UICONTROL 件数]** > **[!UICONTROL 一般]**) をクリックし、 `.onAppear` 修飾子 次のコードを追加します。

   ```swift {highlight="3-11"}
   .onAppear {
       // Track view screen
       MobileSDK.shared.sendTrackScreenEvent(stateName: "luma: content: ios: us: en: home")
       // Get attributes
       UserProfile.getUserAttributes(attributeNames: ["isPaidUser"]) { attributes, error in
           if attributes?["isPaidUser"] as! String == "yes" {
               showBadgeForUser = true
           }
           else {
               showBadgeForUser = false
           }
       }
   }
   ```

   このコードは次を実行します。

   1. 呼び出し `UserProfile.getUserAttributes` ～で閉鎖する `iPaidUser` 属性名を `attributeNames` 配列。
   1. 次に、 `isPaidUser` 属性とタイミング `yes`では、右上の人物アイコンにバッジを配置します。

その他 `getUserAttributes` ドキュメントを参照してください [ここ](https://developer.adobe.com/client-sdks/documentation/profile/api-reference/#getuserattributes).

## アシュランスで検証

1. 以下を確認します。 [設定手順](assurance.md) 」セクションに入力します。
1. AEM Desktop App をインストールします。
1. Assurance で生成された URL を使用して、アプリを起動します。
1. アプリを実行してログインし、製品とやり取りします。

   1. アシュランスアイコンを左に移動します。
   1. 選択 **[!UICONTROL ホーム]** 」をクリックします。
   1. ログインシートを開くには、 **[!UICONTROL ログイン]** 」ボタンをクリックします。
   1. ランダムな電子メールと顧客 ID を挿入するには、 **[!UICONTROL A|]** ボタンをクリックします。
   1. 選択 **[!UICONTROL ログイン]**.
   1. 選択 **[!UICONTROL 製品]** 」をクリックします。
   1. 1 つの製品を選択します。
   1. 選択 **[!UICONTROL 後で使用するために保存]**.
   1. 選択 **[!UICONTROL 買い物かごに追加]**.
   1. 選択 **[!UICONTROL 購入]**.
   1. に戻る **[!UICONTROL ホーム]** 画面。 更新された「ログイン」ボタンが表示されます。

      <img src="./assets/mobile-app-events-1.png" width="200"> <img src="./assets/mobile-app-events-2.png" width="200"> <img src="./assets/mobile-app-events-3.png" width="200"> <img src="./assets/personbadges.png" width="200">

1. 次のように表示されます。 **[!UICONTROL UserProfileUpdate]** および **[!UICONTROL getUserAttributes]** Assurance UI のイベントと更新済み `profileMap` の値です。
   ![プロファイルを検証](assets/profile-validate.png)

>[!SUCCESS]
>
>これで、Edge ネットワーク内のプロファイルの属性を更新するアプリを設定し、（設定時に）Adobe Experience Platformでプロファイルの属性を更新するようになりました。<br/>Adobe Experience Platform Mobile SDK の学習に時間を割いていただき、ありがとうございます。 ご質問がある場合、一般的なフィードバックを共有する場合、または今後のコンテンツに関する提案がある場合は、このドキュメントで共有します [Experience Leagueコミュニティディスカッション投稿](https://experienceleaguecommunities.adobe.com/t5/adobe-experience-platform-launch/tutorial-discussion-implement-adobe-experience-cloud-in-mobile/td-p/443796)

次へ： **[データをAdobe Analyticsにマッピング](analytics.md)**
