---
title: Platform Mobile SDK を使用したプロファイルデータの収集
description: モバイルアプリでプロファイルデータを収集する方法を説明します。
jira: KT-14634
exl-id: 97717611-04d9-45e3-a443-ea220a13b57c
source-git-commit: 25f0df2ea09bb7383f45a698e75bd31be7541754
workflow-type: tm+mt
source-wordcount: '573'
ht-degree: 1%

---

# プロファイルデータの収集

モバイルアプリでプロファイルデータを収集する方法を説明します。

プロファイル拡張機能を使用して、クライアント上のユーザーに関する属性を保存できます。 この情報を後で使用すると、最適なパフォーマンスを得るためにサーバーに接続することなく、オンラインまたはオフラインのシナリオ中にメッセージをターゲットにしてパーソナライズできます。 プロファイル拡張機能は、クライアントサイド操作プロファイル（CSOP）の管理、API への対応方法の提供、ユーザープロファイル属性の更新、生成されたイベントとしてのシステムのその他の部分とのユーザープロファイル属性の共有を行います。

プロファイルデータは、他の拡張機能でプロファイル関連のアクションを実行する際に使用されます。 例えば、プロファイルデータを使用し、プロファイルデータに基づいてルールを実行するルールエンジン拡張機能があります。 [ プロファイル拡張機能 ](https://developer.adobe.com/client-sdks/documentation/profile/) について詳しくは、ドキュメントを参照してください

>[!IMPORTANT]
>
>このレッスンで説明するプロファイル機能は、Adobe Experience Platformおよびプラットフォームベースのアプリケーションのリアルタイム顧客プロファイル機能とは別の機能です。


## 前提条件

* SDK がインストールおよび設定された状態で、アプリケーションが正常に構築および実行されました。

## 学習目標

このレッスンでは、次の操作を行います。

* ユーザー属性を設定または更新します。
* ユーザー属性を取得します。


## ユーザー属性の設定と更新

ユーザーが過去または最近に購入したかどうかをアプリ内でターゲティングやパーソナライゼーションですばやく把握すると便利です。 これを Luma アプリで設定しましょう。

1. Xcode プロジェクトナビゲーターで **[!DNL Luma]**/**[!DNL Luma]**/**[!DNL Utils]**/**[!DNL MobileSDK]** に移動し、`func updateUserAttribute(attributeName: String, attributeValue: String)` 関数を見つけます。 次のコードを追加します。

   ```swift
   // Create a profile map, add attributes to the map and update profile using the map
   var profileMap = [String: Any]()
   profileMap[attributeName] = attributeValue
   UserProfile.updateUserAttributes(attributeDict: profileMap)
   ```

   このコード：

   1. `profileMap` という名前の空の辞書を設定します。

   1. `attributeName` （例：`isPaidUser`）および `attributeValue` （例：`yes`）を使用して、要素を辞書に追加します。

   1. `profileMap` ディクショナリを [`UserProfile.updateUserAttributes`](https://developer.adobe.com/client-sdks/documentation/profile/api-reference/#updateuserattributes) API 呼び出しの `attributeDict` パラメーターへの値として使用します。

1. Xcode プロジェクトナビゲーターで **[!DNL Luma]**/**[!DNL Luma]**/**[!DNL Views]**/**[!DNL Products]**/**[!DNL ProductView]** に移動し、（購入のコード内で） `updateUserAttributes` へのコールを見つけます <img src="assets/purchase.png" width="15" /> ボタン）を使用します。 次のコードを追加します。

   ```swift
   // Update attributes
   MobileSDK.shared.updateUserAttribute(attributeName: "isPaidUser", attributeValue: "yes")
   ```


## ユーザー属性の取得

ユーザーの属性を更新すると、他のAdobeSDK で使用できるようになりますが、属性を明示的に取得して、アプリが思いどおりに動作するようにすることもできます。

1. Xcode プロジェクトナビゲーターで **[!DNL Luma]** / **[!DNL Luma]** / **[!DNL Views]** / **[!DNL General]** / **[!DNL HomeView]** に移動し、`.onAppear` 修飾子を見つけます。 次のコードを追加します。

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

   このコード：

   1. `isPaidUser` の属性名を持つ [`UserProfile.getUserAttributes`](https://developer.adobe.com/client-sdks/documentation/profile/api-reference/#getuserattributes) API を `attributeNames` 配列の単一の要素として呼び出します。
   1. 次に、`isPaidUser` 属性の値をチェックし、`yes` の場合は 右上 <img src="assets/paiduser.png" width="20" /> ツールバーにあるアイコン。

その他のドキュメントについては、[ こちら ](https://developer.adobe.com/client-sdks/documentation/profile/api-reference/#getuserattributes) を参照してください。

## Assurance での検証

1. シミュレーターまたはデバイスを Assurance に接続するには、「[ 設定手順 ](assurance.md#connecting-to-a-session)」セクションを確認してください。
1. アプリを実行してログインし、製品とやり取りします。

   1. Assurance アイコンを左に移動します。
   1. タブバーの **[!UICONTROL ホーム]** を選択します。
   1. ログインシートを開くには、 <img src="assets/login.png" width="15" /> ボタン。

      <img src="./assets/mobile-app-events-1.png" width="300">

   1. ランダムなメールと顧客 ID を挿入するには、 「」ボタン <img src="assets/insert.png" width="15" /> クリックします。
   1. **[!UICONTROL ログイン]** を選択します。

      <img src="./assets/mobile-app-events-2.png" width="300">

   1. タブバーで「**[!DNL Products]**」を選択します。
   1. 製品を 1 つ選択します。
   1. 選択 <img src="assets/saveforlater.png" width="15" />。
   1. 選択 <img src="assets/addtocart.png" width="20" />。
   1. 選択 <img src="assets/purchase.png" width="15" />。

      <img src="./assets/mobile-app-events-3.png" width="300">

   1. **[!UICONTROL ホーム]** 画面に戻ります。 バッジが追加されたことがわかります <img src="assets/person-badge-icon.png" width="15" />。

      <img src="./assets/personbadges.png" width="300">



1. Assurance UI で、更新された `profileMap` 値を持つ **[!UICONTROL UserProfileUpdate]** および **[!UICONTROL getUserAttributes]** イベントが表示されます。
   ![ プロファイルを検証 ](assets/profile-validate.png)

>[!SUCCESS]
>
>これで、Edge Network内および（設定時に）Adobe Experience Platformでプロファイルの属性を更新するようにアプリを設定しました。
>
>Adobe Experience Platform Mobile SDK の学習に時間を費やしていただき、ありがとうございます。 ご不明な点がある場合や、一般的なフィードバックをお寄せになる場合、または今後のコンテンツに関するご提案がある場合は、この [Experience League コミュニティ ディスカッションの投稿 ](https://experienceleaguecommunities.adobe.com/t5/adobe-experience-platform-data/tutorial-discussion-implement-adobe-experience-cloud-in-mobile/td-p/443796) でお知らせください。

次のトピック：**[場所を使用](places.md)**
