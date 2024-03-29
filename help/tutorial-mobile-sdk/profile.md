---
title: Platform Mobile SDK でのプロファイルデータの収集
description: モバイルアプリでプロファイルデータを収集する方法を説明します。
jira: KT-14634
exl-id: 97717611-04d9-45e3-a443-ea220a13b57c
source-git-commit: 25f0df2ea09bb7383f45a698e75bd31be7541754
workflow-type: tm+mt
source-wordcount: '573'
ht-degree: 3%

---

# プロファイルデータを収集

モバイルアプリでプロファイルデータを収集する方法を説明します。

Profile 拡張機能を使用して、ユーザーに関する属性をクライアントに保存できます。 この情報を後で使用して、オンラインまたはオフラインのシナリオでメッセージのターゲティングやパーソナライズをおこなうことができます。最適なパフォーマンスを得るために、サーバーに接続する必要はありません。 Profile 拡張機能は、クライアントサイド操作プロファイル (CSOP) を管理し、API への対応、ユーザープロファイル属性の更新、ユーザープロファイル属性の他のシステムとの生成イベントとしての共有をおこなう方法を提供します。

プロファイルデータは、他の拡張機能によってプロファイル関連のアクションを実行するために使用されます。 例えば、プロファイルデータを使用し、プロファイルデータに基づいてルールを実行する Rules Engine 拡張機能があります。 詳しくは、 [Profile 拡張機能](https://developer.adobe.com/client-sdks/documentation/profile/) ドキュメント内

>[!IMPORTANT]
>
>このレッスンで説明するプロファイル機能は、Adobe Experience Platformおよび Platform ベースのアプリケーションのリアルタイム顧客プロファイル機能とは別の機能です。


## 前提条件

* SDK が正常に構築され、インストールされ、設定された状態でアプリが実行されました。

## 学習内容

このレッスンでは、次の操作を実行します。

* ユーザー属性を設定または更新します。
* ユーザー属性を取得します。


## ユーザー属性の設定と更新

アプリでのターゲティングやパーソナライゼーションに役立つのは、ユーザーが過去または最近に購入したかどうかをすばやく知ることです。 Luma アプリでセットアップしましょう。

1. に移動します。 **[!DNL Luma]** > **[!DNL Luma]** > **[!DNL Utils]** >  **[!DNL MobileSDK]** Xcode プロジェクトナビゲーターで、 `func updateUserAttribute(attributeName: String, attributeValue: String)` 関数に置き換えます。 次のコードを追加します。

   ```swift
   // Create a profile map, add attributes to the map and update profile using the map
   var profileMap = [String: Any]()
   profileMap[attributeName] = attributeValue
   UserProfile.updateUserAttributes(attributeDict: profileMap)
   ```

   このコードは次を実行します。

   1. 次の名前の空の辞書を設定します： `profileMap`.

   1. を使用して辞書に要素を追加します。 `attributeName` 例： `isPaidUser`) および `attributeValue` 例： `yes`) をクリックします。

   1. を使用します。 `profileMap` 辞書を `attributeDict` のパラメーター [`UserProfile.updateUserAttributes`](https://developer.adobe.com/client-sdks/documentation/profile/api-reference/#updateuserattributes) API 呼び出し。

1. に移動します。 **[!DNL Luma]** > **[!DNL Luma]** > **[!DNL Views]** > **[!DNL Products]** > **[!DNL ProductView]** をクリックし、 `updateUserAttributes` ( 購入に関するコード内 <img src="assets/purchase.png" width="15" /> 」ボタン ) をクリックします。 次のコードを追加します。

   ```swift
   // Update attributes
   MobileSDK.shared.updateUserAttribute(attributeName: "isPaidUser", attributeValue: "yes")
   ```


## ユーザー属性の取得

ユーザーの属性を更新すると、他のAdobeSDK でも使用できるようになりますが、属性を明示的に取得して、アプリを好きなように動作させることもできます。

1. に移動します。 **[!DNL Luma]** > **[!DNL Luma]** > **[!DNL Views]** > **[!DNL General]** > **[!DNL HomeView]** Xcode プロジェクトナビゲーターで、 `.onAppear` 修飾子 次のコードを追加します。

   ```swift
   // Get attributes
   UserProfile.getUserAttributes(attributeNames: ["isPaidUser"]) { attributes, error in
       if attributes?.count ?? 0 > 0 {
           if attributes?["isPaidUser"] as? String == "yes" {
               showBadgeForUser = true
           }
           else {
               showBadgeForUser = false
           }
       }
   }
   ```

   このコードは次を実行します。

   1. 呼び出し [`UserProfile.getUserAttributes`](https://developer.adobe.com/client-sdks/documentation/profile/api-reference/#getuserattributes) を使用した API `isPaidUser` 属性名を `attributeNames` 配列。
   1. 次に、 `isPaidUser` 属性とタイミング `yes`をクリックし、 <img src="assets/paiduser.png" width="20" /> アイコンを使用して、アイコンをクリックします。

その他のドキュメントも参照できます。 [ここ](https://developer.adobe.com/client-sdks/documentation/profile/api-reference/#getuserattributes).

## アシュランスで検証

1. 以下を確認します。 [設定手順](assurance.md#connecting-to-a-session) シミュレーターまたはデバイスを Assurance に接続するには、「 」セクションを参照してください。
1. アプリを実行してログインし、製品とやり取りします。

   1. アシュランスアイコンを左に移動します。
   1. 選択 **[!UICONTROL ホーム]** 」をクリックします。
   1. ログインシートを開くには、 <img src="assets/login.png" width="15" /> 」ボタンをクリックします。

      <img src="./assets/mobile-app-events-1.png" width="300">

   1. ランダムな電子メールと顧客 ID を挿入するには、 <img src="assets/insert.png" width="15" /> ボタンをクリックします。
   1. 選択 **[!UICONTROL ログイン]**.

      <img src="./assets/mobile-app-events-2.png" width="300">

   1. 選択 **[!DNL Products]** 」をクリックします。
   1. 1 つの製品を選択します。
   1. 選択 <img src="assets/saveforlater.png" width="15" />。
   1. 選択 <img src="assets/addtocart.png" width="20" />。
   1. 選択 <img src="assets/purchase.png" width="15" />。

      <img src="./assets/mobile-app-events-3.png" width="300">

   1. に戻る **[!UICONTROL ホーム]** 画面。 バッジが追加されたことがわかります。 <img src="assets/person-badge-icon.png" width="15" />。

      <img src="./assets/personbadges.png" width="300">



1. Assurance UI には、 **[!UICONTROL UserProfileUpdate]** および **[!UICONTROL getUserAttributes]** 更新された `profileMap` の値です。
   ![プロファイルを検証](assets/profile-validate.png)

>[!SUCCESS]
>
>これで、Edge ネットワーク内のプロファイルの属性を更新するアプリを設定し、（設定時に）Adobe Experience Platformでプロファイルの属性を更新するようになりました。
>
>Adobe Experience Platform Mobile SDK の学習に時間を割いていただき、ありがとうございます。 ご質問がある場合、一般的なフィードバックを共有する場合、または今後のコンテンツに関する提案がある場合は、このドキュメントで共有します [Experience Leagueコミュニティディスカッション投稿](https://experienceleaguecommunities.adobe.com/t5/adobe-experience-platform-data/tutorial-discussion-implement-adobe-experience-cloud-in-mobile/td-p/443796).

次へ： **[場所を使用](places.md)**
