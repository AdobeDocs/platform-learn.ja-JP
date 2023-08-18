---
title: Adobe Journey Optimizerプッシュメッセージ
description: Platform Mobile SDK とAdobe Journey Optimizerを使用して、モバイルアプリへのプッシュメッセージを作成する方法について説明します。
solution: Data Collection,Journey Optimizer
feature-set: Journey Optimizer
feature: Push
hide: true
hidefromtoc: true
source-git-commit: ca83bbb571dc10804adcac446e2dba4fda5a2f1d
workflow-type: tm+mt
source-wordcount: '942'
ht-degree: 4%

---

# Adobe Journey Optimizerプッシュメッセージ

Platform Mobile SDK とAdobe Journey Optimizerを使用して、モバイルアプリ用のプッシュメッセージを作成する方法について説明します。

Journey Optimizerでは、ジャーニーを作成し、ターゲットを絞ったオーディエンスにメッセージを送信できます。 Journey Optimizerでプッシュ通知を送信する前に、適切な設定と統合がおこなわれていることを確認する必要があります。 Adobe Journey Optimizerのプッシュ通知データフローについては、 [ドキュメント](https://experienceleague.adobe.com/docs/journey-optimizer/using/configuration/configuration-message/push-config/push-gs.html).

>[!NOTE]
>
>このレッスンはオプションで、プッシュメッセージの送信を希望するAdobe Journey Optimizerユーザーにのみ適用されます。


## 前提条件

* SDK が正常に構築され、インストールされ、設定された状態でアプリが実行されました。
* Adobe Journey Optimizerへのアクセスと十分な権限（説明を参照） [ここ](https://experienceleague.adobe.com/docs/journey-optimizer/using/configuration/configuration-message/push-config/push-configuration.html?lang=en). また、次のAdobe Journey Optimizer機能に対する十分な権限が必要です。
   * アプリケーションサーフェスを作成します。
   * ジャーニーの作成
   * メッセージを作成。
   * メッセージプリセットの作成.
* 証明書、識別子、キーを作成するのに十分なアクセス権を持つ有料Apple開発者アカウント。
* テスト用の物理iOSデバイス。

## 学習内容

このレッスンでは、次の操作を実行します。

* アプリ ID をApple Push Notification service(APN) に登録します。
* の作成 **[!UICONTROL アプリサーフェス]** AJO 内で使用できます。
* を更新します。 **[!UICONTROL スキーマ]** プッシュメッセージフィールドを含めるには
* をインストールして設定します。 **[!UICONTROL Adobe Journey Optimizer]** タグ拡張。
* AJO タグ拡張を含めるようにアプリを更新します。
* アシュランスで設定を検証します。
* テストメッセージを送信します。


## アプリ ID を APN に登録

次の手順は、Adobe Experience Cloud固有のものではなく、APN 設定を順を追って説明するように設計されています。

### 秘密鍵の作成

1. Apple開発者ポータルで、に移動します。 **[!UICONTROL キー]**.
1. キーを作成するには、「 」を選択します。 **[!UICONTROL +]**.
   ![新しいキーを作成](assets/mobile-push-apple-dev-new-key.png)

1. 次を提供： **[!UICONTROL キー名]**.
1. を選択します。 **[!UICONTROL APN]** チェックボックス。
1. 「**[!UICONTROL 続行]**」を選択します。
   ![新しいキーを設定](assets/mobile-push-apple-dev-config-key.png)
1. 設定を確認し、「 」を選択します。 **[!UICONTROL 登録]**.
1. をダウンロードします。 `.p8` 秘密鍵。 これは、App Surface 設定で使用されます。
1. 次の項目をメモします。 [!UICONTROL キー ID]. これは、App Surface 設定で使用されます。
1. 次の項目をメモします。 [!UICONTROL チーム ID]. これは、App Surface 設定で使用されます。
   ![キーの詳細](assets/push-apple-dev-key-details.png)

追加のドキュメントは、 [ここにある](https://help.apple.com/developer-account/#/devcdfbb56a3).

## データ収集にアプリのプッシュ資格情報を追加

1. 次から： [データ収集インターフェイス](https://experience.adobe.com/data-collection/)を選択します。 **[!UICONTROL アプリのサーフェス]** をクリックします。
1. 設定を作成するには、「 」を選択します。 **[!UICONTROL アプリのサーフェスを作成]**.
   ![アプリのサーフェスホーム](assets/push-app-surface.png)
1. を入力します。 **[!UICONTROL 名前]** 設定の場合、例： `Luma App Tutorial`  .
1. 「モバイルアプリケーション設定」で、「 **[!UICONTROL Apple iOS]**.
1. 「アプリ ID（iOS バンドル ID）」フィールドにモバイルアプリのバンドル ID を入力します。Luma アプリと共にフォローしている場合、その値は `com.adobe.luma.tutorial.swiftui`.
1. をオンにします。 **[!UICONTROL プッシュ認証情報]** ボタンをクリックして、資格情報を追加します。
1. をドラッグ&amp;ドロップします。 `.p8` **Appleプッシュ通知認証キー** ファイル。
1. 次を提供： **[!UICONTROL キー ID]**: `p8` 認証キー。 これはの下にあります。 **[!UICONTROL キー]** タブ **証明書、識別子、およびプロファイル** Apple Developer Portal ページのページ。
1. **[!UICONTROL チーム ID]** を指定します。チーム ID は、 **メンバーシップ** 」タブまたはApple Developer Portal ページの上部に表示されます。
1. 「**[!UICONTROL 保存]**」を選択します。

   ![アプリのサーフェス設定](assets/push-app-surface-config.png)

## Adobe Journey Optimizer Tags 拡張機能のインストール

1. に移動します。 **[!UICONTROL タグ]** > **[!UICONTROL 拡張機能]** > **[!UICONTROL カタログ]**,
1. プロパティを開きます（例： ）。 **[!UICONTROL Luma モバイルアプリチュートリアル]**.
1. 選択 **[!UICONTROL カタログ]**.
1. を検索します。 **[!UICONTROL Adobe Journey Optimizer]** 拡張子。
1. 拡張機能のインストール.
1. Adobe Analytics の **[!UICONTROL 拡張機能のインストール]** ダイアログ
   1. 環境を選択します（例： ）。 **[!UICONTROL 開発]**.
   1. を選択します。 **[!UICONTROL AJO プッシュトラッキングエクスペリエンスイベントデータセット]** データセット **[!UICONTROL イベントデータセット]** ドロップダウンリスト。
      ![AJO 拡張機能の設定](assets/push-tags-ajo.png)
   1. 選択 **[!UICONTROL ライブラリに保存してビルドする]**.

>[!NOTE]
>
>表示されない場合 `AJO Push Tracking Experience Event Dataset` 必要に応じて、カスタマーケアにお問い合わせください。
>

## アプリにAdobe Journey Optimizerを実装する

前のレッスンで説明したように、モバイルタグ拡張機能のインストールでは設定のみが提供されます。 次に、メッセージング SDK をインストールして登録する必要があります。 これらの手順が明確でない場合は、 [SDK のインストール](install-sdks.md) 」セクションに入力します。

>[!NOTE]
>
>以下を完了した場合、 [SDK のインストール](install-sdks.md) 」セクションに移動した場合は、SDK が既にインストールされているので、手順#7に進むことができます。
>

1. Xcode で、 [AEP メッセージ](https://github.com/adobe/aepsdk-messaging-ios.git) は、パッケージの依存関係にパッケージのリストに追加されます。 詳しくは、 [Swift Package Manager](install-sdks.md#swift-package-manager).
1. Xcode を開き、に移動します。 **[!UICONTROL AppDelegate]**.
1. 確認 `AEPMessaging` は、インポートのリストの一部です。

   `import AEPMessaging`

1. 確認 `Messaging.self` は、登録する拡張機能の配列の一部です。

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
   ```

1. 次を追加： `MobileCore.setPushIdentifier` から `application(_, didRegisterForRemoteNotificationsWithDeviceToken)` 関数に置き換えます。

   ```swift {highlight="7"}
   func application(_ application: UIApplication, didRegisterForRemoteNotificationsWithDeviceToken deviceToken: Data) {
       // Required to log the token
       let tokenParts = deviceToken.map { data in String(format: "%02.2hhx", data) }
       let token = tokenParts.joined()
       Logger.notifications.info("didRegisterForRemoteNotificationsWithDeviceToken - device token: \(token)")
   
       // Send push token to Experience Platform
       MobileCore.setPushIdentifier(deviceToken)
       currentDeviceToken = token
   }
   ```

   この関数は、アプリがインストールされているデバイスに固有のデバイストークンを取得し、プッシュメッセージ配信用にAdobeAppleにトークンを送信します。

## テスト用プッシュメッセージを送信して検証

1. 以下を確認します。 [設定手順](assurance.md) 」セクションに入力します。
1. 物理デバイスまたはシミュレーターにアプリをインストールします。
1. Assurance で生成された URL を使用して、アプリを起動します。
1. Assurance UI で、 **[!UICONTROL 設定]**.
   ![クリックを設定](assets/push-validate-config.png)
1. を選択します。 ![プラス](https://spectrum.adobe.com/static/icons/workflow_18/Smock_AddCircle_18_N.svg) 隣のボタン **[!UICONTROL プッシュデバッグ]**.
1. 「**[!UICONTROL 保存]**」を選択します。
   ![保存](assets/push-validate-save.png)
1. 選択 **[!UICONTROL プッシュデバッグ]** をクリックします。
1. を選択します。 **[!UICONTROL 設定の検証]** タブをクリックします。
1. 次の場所からデバイスを選択します。 **[!UICONTROL クライアント]** リスト。
1. エラーが表示されていないことを確認します。
   ![validate](assets/push-validate-confirm.png)
1. を選択します。 **[!UICONTROL テストプッシュの送信]** タブをクリックします。
1. （オプション）次のデフォルトの詳細を変更します： **[!UICONTROL タイトル]** および **[!UICONTROL 本文]**
1. 選択 ![バグ](https://spectrum.adobe.com/static/icons/workflow_18/Smock_Bug_18_N.svg) **[!UICONTROL テストプッシュ通知の送信]**.
1. 次を確認します。 **[!UICONTROL テスト結果]**.
1. アプリにプッシュ通知が表示されます。

   <img src="assets/luma-app-push.png" width="300" />


>[!SUCCESS]
>
>Adobe Experience Platform Mobile SDK 用のAdobe Journey Optimizer拡張機能を使用して、アプリでプッシュ通知を有効にしました。<br/>Adobe Experience Platform Mobile SDK の学習に時間を割いていただき、ありがとうございます。 ご質問がある場合、一般的なフィードバックを共有する場合、または今後のコンテンツに関する提案がある場合は、このドキュメントで共有します [Experience Leagueコミュニティディスカッション投稿](https://experienceleaguecommunities.adobe.com/t5/adobe-experience-platform-launch/tutorial-discussion-implement-adobe-experience-cloud-in-mobile/td-p/443796).

次へ： **[まとめと次のステップ](conclusion.md)**
