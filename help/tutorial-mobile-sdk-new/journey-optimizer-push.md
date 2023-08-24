---
title: Adobe Journey Optimizerプッシュメッセージ
description: Platform Mobile SDK とAdobe Journey Optimizerを使用して、モバイルアプリへのプッシュメッセージを作成する方法について説明します。
solution: Data Collection,Journey Optimizer
feature-set: Journey Optimizer
feature: Push
hide: true
source-git-commit: 2f9298a140c7bd483c8c533427f0e90d90d14af0
workflow-type: tm+mt
source-wordcount: '1899'
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
* 物理iOSデバイスまたはテスト用のシミュレーター。

## 学習内容

このレッスンでは、次の操作を実行します。

* アプリ ID をApple Push Notification service(APN) に登録します。
* の作成 **[!UICONTROL アプリサーフェス]** AJO 内で使用できます。
* を更新します。 **[!UICONTROL スキーマ]** プッシュメッセージフィールドを含めるには
* をインストールして設定します。 **[!UICONTROL Adobe Journey Optimizer]** タグ拡張。
* AJO タグ拡張を含めるようにアプリを更新します。
* アシュランスで設定を検証します。
* テストメッセージを送信します。
* Journey Optimizerで独自のプッシュ通知イベント、ジャーニー、エクスペリエンスを定義します。
* アプリ内から独自のプッシュ通知を送信します。


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
   1. 選択 **[!UICONTROL ライブラリに保存してビルドする]**.
      ![AJO 拡張機能の設定](assets/push-tags-ajo.png)

>[!NOTE]
>
>表示されない場合 `AJO Push Tracking Experience Event Dataset` 必要に応じて、カスタマーケアにお問い合わせください。
>

## アプリでのAdobe Journey Optimizerの実装

前のレッスンで説明したように、モバイルタグ拡張機能のインストールでは設定のみが提供されます。 次に、メッセージング SDK をインストールして登録する必要があります。 これらの手順が明確でない場合は、 [SDK のインストール](install-sdks.md) 」セクションに入力します。

>[!NOTE]
>
>以下を完了した場合、 [SDK のインストール](install-sdks.md) 」セクションに移動した場合は、SDK が既にインストールされているので、手順#7に進むことができます。
>

1. Xcode で、 [AEP メッセージ](https://github.com/adobe/aepsdk-messaging-ios.git) は、パッケージの依存関係にパッケージのリストに追加されます。 詳しくは、 [Swift Package Manager](install-sdks.md#swift-package-manager).
1. に移動します。 **[!UICONTROL Luma]** > **[!UICONTROL Luma]** > **[!UICONTROL AppDelegate]**.
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

1. 次を追加： `MobileCore.setPushIdentifier` から `func application(_ application: UIApplication, didRegisterForRemoteNotificationsWithDeviceToken deviceToken: Data)` 関数に置き換えます。

   ```swift
   // Send push token to Experience Platform
   MobileCore.setPushIdentifier(deviceToken)
   ```

   この関数は、アプリがインストールされているデバイスに固有のデバイストークンを取得します。 次に、設定済みの設定を使用し、Appleのプッシュ通知サービス (APNS) に依存するプッシュ通知配信用のトークンを設定します。

## アシュランスで検証

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


## 独自のプッシュ通知を作成する

独自のプッシュ通知を作成するには、プッシュ通知の送信を処理するジャーニーをトリガーするイベントをJourney Optimizerで定義する必要があります。

### イベントの定義

1. Journey Optimizer UI で、 **[!UICONTROL 設定]** をクリックします。

1. Adobe Analytics の **[!UICONTROL ダッシュボード]** 画面で、 **[!UICONTROL 管理]** ボタン **[!UICONTROL イベント]** タイル。

1. Adobe Analytics の **[!UICONTROL イベント]** 画面、選択 **[!UICONTROL イベントを作成]**.

1. Adobe Analytics の **[!UICONTROL event1 を編集]** ペイン：

   1. 入力 `LumaTestEvent` として **[!UICONTROL 名前]** イベントの。
   1. 次を提供： **[!UICONTROL 説明]**&#x200B;例： `Test event to trigger push notifications in Luma app`.

   1. 前の手順で作成したモバイルアプリエクスペリエンスイベントスキーマを選択します。 [XDM スキーマの作成](create-schema.md) から **[!UICONTROL スキーマ]** 例えば、リスト **[!UICONTROL Luma モバイルアプリイベントスキーマ v.1]**.
   1. 選択 ![編集](https://spectrum.adobe.com/static/icons/workflow_18/Smock_Edit_18_N.svg) の横 **[!UICONTROL フィールド]** リスト。

      ![イベントの手順 1 を編集](assets/ajo-edit-event1.png)

      Adobe Analytics の **[!UICONTROL フィールド]** ダイアログで、次のフィールドが選択されていることを確認します ( 常に選択されているデフォルトのフィールド（_id、id および timestamp）の上部 )。 ドロップダウンリストを使用して、次の間で切り替えることができます。 **[!UICONTROL 選択済み]**, **[!UICONTROL すべて]** および **[!UICONTROL プライマリ]** または ![検索](https://spectrum.adobe.com/static/icons/workflow_18/Smock_Search_18_N.svg) フィールドに入力します。

      * **[!UICONTROL 特定されたアプリケーション (id)]**,
      * **[!UICONTROL イベントタイプ (eventType)]**,
      * **[!UICONTROL プライマリ（プライマリ）]**.

      ![イベントフィールドを編集](assets/ajo-event-fields.png)

      次に、 **[!UICONTROL OK]**.

   1. 選択 ![編集](https://spectrum.adobe.com/static/icons/workflow_18/Smock_Edit_18_N.svg) の横 **[!UICONTROL イベント ID 条件]** フィールドに入力します。

      1. Adobe Analytics の **[!UICONTROL イベント ID 条件の追加]** ダイアログ、ドラッグ&amp;ドロップ **[!UICONTROL アプリケーション識別子 (id)]** underthen **[!UICONTROL アプリケーション（アプリケーション）]** 次に対して **[!UICONTROL ここに要素をドラッグ&amp;ドロップ]**.
      1. ポップオーバーで、Xcode からバンドル識別子を入力します。例： `com.adobe.luma.tutorial.swiftui` 隣のフィールドで **[!UICONTROL 次と等しい]**.
      1. 「**[!UICONTROL OK]**」をクリックします。
      1. 「**[!UICONTROL OK]**」をクリックします。
         ![イベント条件を編集](assets/ajo-edit-condition.png)

   1. 選択 **[!UICONTROL ECID (ECID)]** から **[!UICONTROL 名前空間]** リスト。 自動的に **[!UICONTROL プロファイル識別子]** フィールドに **[!UICONTROL マップ identityMap のキー ECID の最初の要素の ID。]**.
   1. 「**[!UICONTROL 保存]**」を選択します。
      ![イベントの手順 2 を編集](assets/ajo-edit-event2.png)

このチュートリアルの一部として前に作成したモバイルアプリエクスペリエンスイベントスキーマに基づくイベント設定を作成しました。 このイベント設定は、モバイルアプリ識別子を使用して受信エクスペリエンスイベントをフィルタリングするので、次の手順で作成するジャーニーをトリガーできるのはモバイルアプリから開始されたイベントのみになります。

### ジャーニーの作成

次の手順では、適切なイベントを受信した際にプッシュ通知の送信をトリガーにするジャーニーを作成します。

1. Journey Optimizer UI で、 **[!UICONTROL ジャーニー]** をクリックします。
1. 選択 **[!UICONTROL 「作成」ジャーニー]**.
1. Adobe Analytics の **[!UICONTROL ジャーニーのプロパティ]** パネル：

   1. を入力します。 **[!UICONTROL 名前]** ジャーニーの例 `Luma - Test Push Notification Journey`.
   1. を入力します。 **[!UICONTROL 説明]** ジャーニーの例 `Journey for test push notifications in Luma mobile app`.
   1. 確認 **[!UICONTROL 再エントリを許可]** が選択され、設定されている **[!UICONTROL 再入場待機期間]** から **[!UICONTROL 30]** **[!UICONTROL 秒]**.
   1. 「**[!UICONTROL OK]**」を選択します。
      ![ジャーニーのプロパティ](assets/ajo-journey-properties.png)

1. ジャーニーキャンバスに戻る、 **[!UICONTROL イベント]**&#x200B;をドラッグ&amp;ドロップし、 ![イベント](https://spectrum.adobe.com/static/icons/workflow_18/Smock_Globe_18_N.svg) **[!UICONTROL LumaTestEvent]** それが読むキャンバス上で **[!UICONTROL エントリイベントまたはオーディエンスの閲覧アクティビティを選択]**.

   * イベント内： **[!UICONTROL LumaTestEvent]** パネル、 **[!UICONTROL ラベル]**&#x200B;例： `Luma Test Event`.

1. 次から： **[!UICONTROL アクション]** ドロップダウン、ドラッグ&amp;ドロップ ![プッシュ](https://spectrum.adobe.com/static/icons/workflow_18/Smock_PushNotification_18_N.svg) **[!UICONTROL プッシュ]** の ![追加](https://spectrum.adobe.com/static/icons/workflow_18/Smock_AddCircle_18_N.svg) あなたのすぐ近くに **[!UICONTROL LumaTestEvent]** アクティビティ。 Adobe Analytics の **[!UICONTROL アクション：プッシュ]** ペイン：

   1. 次を提供： **[!UICONTROL ラベル]**&#x200B;例： `Luma Test Push Notification`、 **[!UICONTROL 説明]**&#x200B;例： `Test push notification for Luma mobile app`を選択します。 **[!UICONTROL トランザクション]** から **[!UICONTROL カテゴリ]** リストと選択 **[!UICONTROL Luma]** から **[!UICONTROL 押し出しサーフェス]**.
   1. 選択 ![編集](https://spectrum.adobe.com/static/icons/workflow_18/Smock_Edit_18_N.svg) **[!UICONTROL コンテンツを編集]** 実際のプッシュ通知の編集を開始する場合。
      ![プッシュプロパティ](assets/ajo-push-properties.png)

      Adobe Analytics の **[!UICONTROL プッシュ通知]** 編集者：

      1. を入力します。 **[!UICONTROL タイトル]**&#x200B;例： `Luma Test Push Notification` を入力し、 **[!UICONTROL 本文]**&#x200B;例： `Test push notification for Luma mobile app`.
      1. エディターを保存して終了するには、「 」を選択します。 ![シェブロン左](https://spectrum.adobe.com/static/icons/workflow_18/Smock_ChevronLeft_18_N.svg).
         ![プッシュエディター](assets/ajo-push-editor.png)

   1. プッシュ通知の定義を保存して終了するには、 **[!UICONTROL OK]**.

1. ジャーニーは次のようになります。 選択 **[!UICONTROL 公開]** ジャーニーを公開してアクティブ化する。
   ![ジャーニーが完了しました](assets/ajo-journey-finished.png)


## プッシュ通知のトリガー

プッシュ通知を送信するためのすべての構成要素が揃っている。 残りの点は、このプッシュ通知のトリガー方法です。 基本的には、前に見たのと同じです。適切なペイロードを持つエクスペリエンスイベントを送信するだけです。

今回は、送信しようとしているエクスペリエンスイベントは、単純な XDM 辞書を構築して構築されていません。 プッシュ通知ペイロードを表す構造体を使用します。 アプリケーションでエクスペリエンスイベントペイロードを作成する方法として、専用のデータタイプを定義する方法があります。

1. に移動します。 **[!UICONTROL Luma]** > **[!UICONTROL Luma]** > **[!UICONTROL モデル]** > **[!UICONTROL XDM]** > **[!UICONTROL TestPushPayload]** をクリックし、コードを調べます。

   ```swift
   import Foundation
   
   // MARK: - TestPush
   struct TestPushPayload: Codable {
      let application: Application
      let eventType: String
   }
   
   // MARK: - Application
   struct Application: Codable {
      let id: String
   }
   ```

   コードは、テストプッシュ通知ジャーニーをトリガーするために送信する、次のシンプルなペイロードを表しています

   ```json
   {
      "eventType": string,
      "application" : [
          "id": string
      ]
   }
   ```

1. に移動します。 **[!UICONTROL Luma]** > **[!UICONTROL Luma]** > **[!UICONTROL Utils]** > **[!UICONTROL MobileSDK]** Xcode プロジェクトナビゲーターで、次のコードをに追加します。 `func sendTestPushEvent(applicationId: String, eventType: String)`:

   ```swift
   Task {
       let testPushPayload = TestPushPayload(
           application: Application(
               id: applicationId
           ),
           eventType: eventType
       )
       // send the final experience event
       await sendExperienceEvent(
           xdm: testPushPayload.asDictionary() ?? [:]
       )
   }
   ```

   このコードにより、 `testPushPayload` 関数に指定されたパラメーター (`applicationId` および `eventType`) と呼び出し `sendExperienceEvent` ペイロードを辞書に変換する際に発生した問題を修正しました。 また、このコードは、今回は、に基づく Swift の同時実行モデルを使用してAdobe Experience Platform SDK を呼び出す際の非同期的な側面も考慮します `await` および `async`.

1. に移動します。 **[!UICONTROL Luma]** > **[!UICONTROL Luma]** > **[!UICONTROL 件数]** > **[!UICONTROL 一般]** > **[!UICONTROL ConfigView]** Xcode プロジェクトナビゲーターで使用します。 プッシュ通知ボタンの定義で、次のコードを追加して、テストプッシュ通知エクスペリエンスイベントペイロードを、そのボタンがタップされるたびにジャーニーをトリガーに送信します。

   ```swift
   // Setting parameters and calling function to send push notification
   let eventType = "mobileapp.testpush"
   let applicationId = Bundle.main.bundleIdentifier ?? "No bundle id found"
   await MobileSDK.shared.sendTestPushEvent(applicationId: applicationId, eventType: eventType)   
   ```


## アプリを使用した検証

1. デバイスまたはシミュレーターでアプリを開きます。

1. 次に移動： **[!UICONTROL 設定]** タブをクリックします。

1. タップ **[!UICONTROL プッシュ通知]**. アプリにプッシュ通知が表示されます。
   <img src="assets/ajo-test-push.png" width="300" />


## アプリへの実装

これで、プッシュ通知を（関連する場合に）Luma アプリに追加するためのすべてのツールが揃いました。 例えば、アプリにログインする際や、特定の位置情報に近づいた際に、ユーザーを歓迎する場合などです。

>[!SUCCESS]
>
>Adobe Journey OptimizerとAdobe Experience Platform Mobile SDK 用のAdobe Journey Optimizer拡張機能を使用して、アプリでプッシュ通知を有効にしました。<br/>Adobe Experience Platform Mobile SDK の学習に時間を割いていただき、ありがとうございます。 ご質問がある場合、一般的なフィードバックを共有する場合、または今後のコンテンツに関する提案がある場合は、このドキュメントで共有します [Experience Leagueコミュニティディスカッション投稿](https://experienceleaguecommunities.adobe.com/t5/adobe-experience-platform-launch/tutorial-discussion-implement-adobe-experience-cloud-in-mobile/td-p/443796).

次へ： **[Journey Optimizerを使用したアプリ内メッセージ](journey-optimizer-inapp.md)**

