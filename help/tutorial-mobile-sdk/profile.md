---
title: プロファイル
description: モバイルアプリでプロファイルデータを収集する方法を説明します。
exl-id: 97717611-04d9-45e3-a443-ea220a13b57c
source-git-commit: cc7a77c4dd380ae1bc23dc75608e8e2224dfe78c
workflow-type: tm+mt
source-wordcount: '441'
ht-degree: 2%

---

# プロファイル

モバイルアプリでプロファイルデータを収集する方法を説明します。

Profile 拡張機能を使用して、ユーザーに関する属性をクライアントに保存できます。 この情報を後で使用して、オンラインまたはオフラインのシナリオでメッセージのターゲティングやパーソナライズをおこなうことができます。最適なパフォーマンスを得るために、サーバーに接続する必要はありません。 Profile 拡張機能は、クライアントサイド操作プロファイル (CSOP) を管理し、API への対応、ユーザープロファイル属性の更新、ユーザープロファイル属性の他のシステムとの生成イベントとしての共有をおこなう方法を提供します。

プロファイルデータは、他の拡張機能によってプロファイル関連のアクションを実行するために使用されます。 例えば、プロファイルデータを使用し、プロファイルデータに基づいてルールを実行する Rules Engine 拡張機能があります。 詳しくは、 [Profile 拡張機能](https://aep-sdks.gitbook.io/docs/foundation-extensions/profile) ドキュメント内

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

ターゲティングやパーソナライゼーションでは、ユーザーが以前にアプリで購入したかどうかをすばやく把握すると便利です。 Luma アプリで設定しましょう。

1. `Cart.swift` に移動します。

1. 以下のコードを `processOrder() `関数に置き換えます。

   ```swift
   var profileMap = [String: Any]()
   profileMap["isPaidUser"] = "yes"
   UserProfile.updateUserAttributes(attributeDict: profileMap)
   ```

また、パーソナライゼーションチームは、ユーザーの忠誠度に基づいてターゲットを設定することもできます。 Luma アプリで設定しましょう。

1. `Account.swift` に移動します。

1. 以下のコードを `showUserInfo()` 関数に置き換えます。

   ```swift
   var profileMap = [String: Any]()
   profileMap["loyaltyLevel"] = loyaltyLevel
   UserProfile.updateUserAttributes(attributeDict: profileMap)
   ```

追加 `updateUserAttributes` ドキュメントを参照してください [ここ](https://aep-sdks.gitbook.io/docs/foundation-extensions/profile/profile-api-references#update-user-attributes).

## 取得

ユーザーの属性を更新すると、他のAdobeSDK で使用できるようになりますが、属性を明示的に取得することもできます。

```swift
UserProfile.getUserAttributes(attributeNames: ["isPaidUser","loyaltyLevel"]){
    attributes, error in
    print("Profile: getUserAttributes: ",attributes as Any)
}
```

追加 `getUserAttributes` ドキュメントを参照してください [ここ](https://aep-sdks.gitbook.io/docs/foundation-extensions/profile/profile-api-references#get-user-attributes).

## アシュランスで検証

1. 以下を確認します。 [設定手順](assurance.md) 」セクションに入力します。
1. AEM Desktop App をインストールします。
1. Assurance で生成された URL を使用して、アプリを起動します。
1. 「アカウント」アイコンを選択し、「ログイン」を選択します。 注意：資格情報を指定していません。
1. ログインメニューを閉じ、アカウントアイコンを再度選択します。 アカウントの詳細画面が表示されます。この画面で `loyaltyLevel` が設定されている。
1. 次のように表示されます。 **[!UICONTROL UserProfileUpdate]** イベントを更新した `profileMap` の値です。
   ![プロファイルを検証](assets/mobile-profile-validate.png)

次へ： **[データをAdobe Analyticsにマッピング](analytics.md)**

>[!NOTE]
>
>Adobe Experience Platform Mobile SDK の学習に時間を割いていただき、ありがとうございます。 ご質問がある場合、一般的なフィードバックを共有したい場合、または今後のコンテンツに関する提案がある場合は、こちらで共有してください [Experience Leagueコミュニティディスカッション投稿](https://experienceleaguecommunities.adobe.com/t5/adobe-experience-platform-launch/tutorial-discussion-implement-adobe-experience-cloud-in-mobile/td-p/443796)