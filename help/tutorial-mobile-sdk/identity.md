---
title: Mobile SDKを使用したモバイルアプリでの ID データの収集
description: モバイルアプリで ID データを収集する方法を説明します。
feature: Mobile SDK,Identities
jira: KT-14633
exl-id: cbcd1708-29e6-4d74-be7a-f75c917ba2fa
source-git-commit: 456c5437cec745f667435e97d21edfba1700750a
workflow-type: tm+mt
source-wordcount: '966'
ht-degree: 2%

---

# ID データの収集

モバイルアプリで ID データを収集する方法を説明します。

Adobe Experience Platform ID サービスを使用すると、顧客とその行動をより確実に把握できます。 このサービスは、デバイスやシステム間で ID を結び付け、インパクトのある個人的なデジタルエクスペリエンスをリアルタイムで提供できます。 ID フィールドと名前空間は、異なるデータソースを結合して 360 度リアルタイム顧客プロファイルを作成する接着剤です。

[ID 拡張機能 ](https://developer.adobe.com/client-sdks/documentation/identity-for-edge-network/) および [ID サービス ](https://experienceleague.adobe.com/ja/docs/experience-platform/identity/home) について詳しくは、ドキュメントを参照してください。

## 前提条件

* SDK がインストールおよび設定された状態で、アプリケーションが正常に構築および実行されました。

## 学習目標

このレッスンでは、次の操作を行います。

* カスタム ID 名前空間を設定します。
* ID を更新します。
* ID グラフを検証します。
* ECID およびその他の ID を取得します。


## カスタム ID 名前空間の設定

ID 名前空間は、ID の関連先コンテキストのインジケーターとして機能する [ID サービス ](https://experienceleague.adobe.com/ja/docs/experience-platform/identity/home) のコンポーネントです。 例えば、値 `name@email.com` をメールアドレスとして、または `443522` を数値 CRM ID として区別します。

>[!NOTE]
>
>Mobile SDKは、アプリのインストール時にExperience Cloud ID （ECID）という名前の一意の ID を独自の名前空間内に生成します。 この ECID は、モバイルデバイスの永続メモリに保存され、ヒットごとに送信されます。 ECID は、ユーザーがアプリをアンインストールするとき、またはユーザーが Mobile SDK グローバルプライバシーステータスをオプトアウトに設定するとき、削除されます。 サンプル Luma アプリでは、アプリを削除して再インストールし、独自の一意の ECID を持つ新しいプロファイルを作成する必要があります。


ID 名前空間を新規作成するには：

1. データ収集インターフェイスで、左側のナビゲーションバーから **[!UICONTROL ID]** を選択します。
1. 「**[!UICONTROL ID 名前空間を作成]**」を選択します。
1. **[!UICONTROL の]** 表示名 `Luma CRM ID` と **[!UICONTROL の]** ID シンボル `lumaCRMId` 値を指定します。
1. **[!UICONTROL クロスデバイス ID]** を選択します。
1. 「**[!UICONTROL 作成]**」を選択します。

   ![ID 名前空間を作成 ](assets/identity-create.png){zoomable="yes"}




## ID の更新

ユーザーがアプリにログインしたときに、標準 ID （メール）とカスタム ID （Luma CRM ID）の両方を更新するとします。

>[!BEGINTABS]

>[!TAB iOS]

1. Xcode プロジェクトナビゲーターで **[!DNL Luma]**/**[!DNL Luma]**/**[!DNL Utils]**/**[!UICONTROL MobileSDK]** に移動し、`func updateIdentities(emailAddress: String, crmId: String)` 関数の実装を見つけます。 関数に次のコードを追加します。

   ```swift
   // Set up identity map, add identities to map and update identities
   let identityMap: IdentityMap = IdentityMap()
   
   let emailIdentity = IdentityItem(id: emailAddress, authenticatedState: AuthenticatedState.authenticated)
   let crmIdentity = IdentityItem(id: crmId, authenticatedState: AuthenticatedState.authenticated)
   identityMap.add(item:emailIdentity, withNamespace: "Email")
   identityMap.add(item: crmIdentity, withNamespace: "lumaCRMId")
   
   Identity.updateIdentities(with: identityMap)
   ```

   このコード：

   1. 空の `IdentityMap` オブジェクトを作成します。

      ```swift
      let identityMap: IdentityMap = IdentityMap()
      ```

   1. メールおよび CRM ID の `IdentityItem` オブジェクトを設定します。

      ```swift
      let emailIdentity = IdentityItem(id: emailAddress, authenticatedState: AuthenticatedState.authenticated)
      let crmIdentity = IdentityItem(id: crmId, authenticatedState: AuthenticatedState.authenticated)
      ```

   1. これらの `IdentityItem` オブジェクトを `IdentityMap` オブジェクトに追加します。

      ```swift
      identityMap.add(item:emailIdentity, withNamespace: "Email")
      identityMap.add(item: crmIdentity, withNamespace: "lumaCRMId")
      ```

   1. `IdentityItem` オブジェクトを `Identity.updateIdentities` API 呼び出しの一部としてEdge Networkに送信します。

      ```swift
      Identity.updateIdentities(with: identityMap) 
      ```

1. Xcode プロジェクトナビゲーターで **[!DNL Luma]**/**[!DNL Luma]**/**[!DNL Views]**/**[!DNL General]**/**[!UICONTROL LoginSheet]** に移動し、「**[!UICONTROL ログイン]**」ボタンを選択するときに実行するコードを見つけます。 次のコードを追加します。

   ```swift
   // Update identities
   MobileSDK.shared.updateIdentities(emailAddress: currentEmailId, crmId: currentCRMId)                             
   ```


>[!TAB Android]

1. Android Studio ナビゲーターで **[!UICONTROL Android]** ![ChevronDown](/help/assets/icons/ChevronDown.svg)/**[!DNL app]**/**[!DNL kotlin+java]**/**[!DNL com.adobe.luma.tutorial.android]**/**[!UICONTROL models]**/**[!UICONTROL MobileSDK]** に移動し、`fun updateIdentities(emailAddress: String, crmId: String) ` 関数の実装を探します。 関数に次のコードを追加します。

   ```kotlin
   // Set up identity map, add identities to map and update identities
   val identityMap = IdentityMap()
   
   val emailIdentity = IdentityItem(emailAddress, AuthenticatedState.AUTHENTICATED, true)
   val crmIdentity = IdentityItem(crmId, AuthenticatedState.AUTHENTICATED, true)
   identityMap.addItem(emailIdentity, "Email")
   identityMap.addItem(crmIdentity, "lumaCRMId")
   
   Identity.updateIdentities(identityMap)
   ```

   このコード：

   1. 空の `IdentityMap` オブジェクトを作成します。

      ```kotlin
      val identityMap = IdentityMap()
      ```

   1. メールおよび CRM ID の `IdentityItem` オブジェクトを設定します。

      ```kotlin
      val emailIdentity = IdentityItem(emailAddress, AuthenticatedState.AUTHENTICATED, true)
      val crmIdentity = IdentityItem(crmId, AuthenticatedState.AUTHENTICATED, true)
      ```

   1. これらの `IdentityItem` オブジェクトを `IdentityMap` オブジェクトに追加します。

      ```kotlin
      identityMap.addItem(emailIdentity, "Email")
      identityMap.addItem(crmIdentity, "lumaCRMId")
      ```

   1. `IdentityItem` オブジェクトを `Identity.updateIdentities` API 呼び出しの一部としてEdge Networkに送信します。

      ```kotlin
      Identity.updateIdentities(identityMap)
      ```

1. Android Studio ナビゲーターで **[!UICONTROL Android]** ![ChevronDown](/help/assets/icons/ChevronDown.svg)/**[!DNL app]**/**[!DNL kotlin+java]**/**[!DNL com.adobe.luma.tutorial.android]**/**[!UICONTROL views]**/**[!UICONTROL LoginSheet.kt]** に移動し、「**[!UICONTROL ログイン]**」ボタンをクリックするときに実行するコードを見つけます。 次のコードを追加します。

   ```kotlin
   // Update identities
   MobileSDK.shared.updateIdentities(
      MobileSDK.shared.currentEmailId.value,
      MobileSDK.shared.currentCRMId.value
   )                             
   ```


>[!ENDTABS]



>[!NOTE]
>
>1 回の `updateIdentities` 呼び出しで複数の ID を送信できます。 以前に送信した ID を変更することもできます。


## ID を削除

[`Identity.removeIdentity`](https://developer.adobe.com/client-sdks/documentation/identity-for-edge-network/api-reference/#removeidentity) API を使用して、保存されたクライアントサイド ID マップから ID を削除できます。 ID 拡張機能は、Edge Networkへの識別情報の送信を停止します。 この API を使用しても、サーバーサイドの ID グラフから識別子が削除されることはありません。 ID グラフについて詳しくは、[ID グラフの表示 ](https://experienceleague.adobe.com/ja/docs/platform-learn/tutorials/identities/view-identity-graphs) を参照してください。


>[!BEGINTABS]

>[!TAB iOS]

1. Xcode プロジェクトナビゲーターで **[!DNL Luma]**/**[!DNL Luma]**/**[!DNL Utils]**/**[!UICONTROL MobileSDK]** に移動し、`func removeIdentities(emailAddress: String, crmId: String)` 関数に次のコードを追加します。

   ```swift
   // Remove identities and reset email and CRM Id to their defaults
   Identity.removeIdentity(item: IdentityItem(id: emailAddress), withNamespace: "Email")
   Identity.removeIdentity(item: IdentityItem(id: crmId), withNamespace: "lumaCRMId")
   currentEmailId = "testUser@gmail.com"
   currentCRMId = "b642b4217b34b1e8d3bd915fc65c4452"
   ```

1. Xcode プロジェクトナビゲーターで **[!DNL Luma]**/**[!DNL Luma]**/**[!DNL Views]**/**[!DNL General]**/**[!UICONTROL LoginSheet]** に移動し、「**[!UICONTROL ログアウト]**」ボタンを選択するときに実行するコードを見つけます。 次のコードを追加します。

   ```swift
   // Remove identities
   MobileSDK.shared.removeIdentities(emailAddress: currentEmailId, crmId: currentCRMId)                  
   ```

>[!TAB Android]

1. Android Studio ナビゲーターで **[!UICONTROL Android]** ![ChevronDown](/help/assets/icons/ChevronDown.svg)/**[!DNL app]**/**[!DNL kotlin+java]**/**[!DNL com.adobe.luma.tutorial.android]**/**[!UICONTROL models]**/**[!UICONTROL MobileSDK]** に移動し、`fun removeIdentities(emailAddress: String, crmId: String)` 関数に次のコードを追加します。

   ```kotlin
   // Remove identities and reset email and CRM Id to their defaults
   Identity.removeIdentity(IdentityItem(emailAddress), "Email")
   Identity.removeIdentity(IdentityItem(crmId), "lumaCRMId")
   currentEmailId.value = "testUser@gmail.com"
   currentCRMId.value = "112ca06ed53d3db37e4cea49cc45b71e"
   ```

&#x200B;1. Android Studio ナビゲーターで **[!DNL app]** > **[!DNL kotlin+java]** > **[!DNL com.adobe.luma.tutorial.android]** > **[!UICONTROL views]** > **[!UICONTROL LoginSheet.kt]** に移動し、「**[!UICONTROL ログアウト]**」ボタンをクリックするときに実行するコードを見つけます。 次のコードを追加します。

```kotlin
// Remove identities
MobileSDK.shared.removeIdentities(
   MobileSDK.shared.currentEmailId.value,
   MobileSDK.shared.currentCRMId.value
)              
```


>[!ENDTABS]

## Assurance での検証

1. [ 設定手順 ](assurance.md#connecting-to-a-session) の節を参照して、シミュレーターまたはデバイスをAssuranceに接続します。
1. Luma アプリ内
   1. 「**[!UICONTROL ホーム]**」タブを選択し、「Assurance」アイコンを左に動かします。
   1. 右上の ![ ユーザー ](/help/assets/icons/User.svg) アイコンを選択します。

>[!BEGINTABS]

>[!TAB iOS]

<img src="./assets/identity1.png" width="300">

>[!TAB Android]

<img src="./assets/identity1-android.png" width="300">

>[!ENDTABS]

**[!UICONTROL ID]** 画面で、次の操作を行います。

1. メールアドレスと CRM ID を入力する
1. **[!UICONTROL A を選択]** E メール）および **[!UICONTROL CRM ID]** をランダムに生成するには、|**[!UICONTROL （iOS）または]** ランダムな E メールを生成 **[!UICONTROL Android]** を使用します。
1. **[!UICONTROL ログイン]** を選択します。

>[!BEGINTABS]

>[!TAB iOS]

<img src="./assets/identity2.png" width="300">

>[!TAB Android]

<img src="./assets/identity2-android.png" width="300">


>[!ENDTABS]

Assuranceに戻る：

1. **[!UICONTROL com.adobe.griffon.mobile]** ベンダーからの **[!UICONTROL Edge ID 更新 ID]** イベントについて、Assurance Web インターフェイスを調べます。
1. イベントを選択し、**[!UICONTROL ACPExtensionEventData]** オブジェクトのデータを確認します。 更新した ID が表示されます。
   ![id 更新の検証 ](assets/identity-validate-assurance.png){zoomable="yes"}

## ID グラフを使用して検証

[Experience Platformのレッスン ](platform.md) の手順を完了したら、Experience Platform ID グラフビューアで ID の取り込みを確認できます。

1. データ収集 UI で **[!UICONTROL ID]** を選択します。
1. 上部バーの「**[!UICONTROL ID グラフ]**」を選択します。
1. `Luma CRM ID`ID 名前空間 **[!UICONTROL として]** を入力し、`24e620e255734d8489820e74f357b5c8`ID 値 **[!UICONTROL として CRM ID （例：]**）を入力します。
1. **[!UICONTROL ID]** が表示されます。

   ![id グラフを検証 ](assets/identity-validate-graph.png){zoomable="yes"}

>[!INFO]
>
>ECID をリセットするコードがアプリにありません。 アプリケーションのアンインストールと再インストールを行って実行できるのは、ECID をリセットすること（および新しい ECID を持つ新しいプロファイルを効果的に作成すること）のみです。 識別子のリセットを実装するには、[`Identity.resetIdentities`](https://developer.adobe.com/client-sdks/documentation/mobile-core/identity/api-reference/#resetidentities) および [`MobileCore.resetIdentities`](https://developer.adobe.com/client-sdks/documentation/mobile-core/api-reference/#resetidentities) API 呼び出しを参照してください。 プッシュ通知識別子を使用すると（[ プッシュ通知の送信 ](journey-optimizer-push.md) を参照）、その識別子はデバイス上で別の「固定」プロファイル識別子になります。


>[!SUCCESS]
>
>これで、Edge Networkおよび（設定時に）Adobe Experience Platformで ID を更新するアプリの設定が完了しました。
>
>Adobe Experience Platform Mobile SDKの学習にご協力いただき、ありがとうございます。 ご不明な点がある場合や、一般的なフィードバックをお寄せになる場合、または今後のコンテンツに関するご提案がある場合は、この [Experience League Community Discussion の投稿でお知らせください ](https://experienceleaguecommunities.adobe.com/t5/adobe-experience-platform-data/tutorial-discussion-implement-adobe-experience-cloud-in-mobile/td-p/443796?profile.language=ja)

次のトピック：**[プロファイル・データの収集](profile.md)**
