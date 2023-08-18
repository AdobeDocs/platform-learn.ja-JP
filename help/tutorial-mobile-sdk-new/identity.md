---
title: ID
description: モバイルアプリで ID データを収集する方法を説明します。
feature: Mobile SDK,Identities
hide: true
hidefromtoc: true
source-git-commit: ca83bbb571dc10804adcac446e2dba4fda5a2f1d
workflow-type: tm+mt
source-wordcount: '626'
ht-degree: 6%

---

# ID

モバイルアプリで ID データを収集する方法を説明します。

Adobe Experience Platform ID サービスを使用すると、デバイスやシステム間で ID を結び付け、顧客とその行動をより良く把握でき、効果的な個人のデジタルエクスペリエンスをリアルタイムで提供できます。 ID フィールドと名前空間は、異なるデータソースを結合して、360 度のリアルタイム顧客プロファイルを構築するための接着剤です。

詳しくは、 [ID 拡張機能](https://developer.adobe.com/client-sdks/documentation/identity-for-edge-network/) そして [id サービス](https://experienceleague.adobe.com/docs/experience-platform/identity/home.html?lang=ja) 」を参照してください。

## 前提条件

* SDK が正常に構築され、インストールされ、設定された状態でアプリが実行されました。

## 学習内容

このレッスンでは、次の操作を実行します。

* カスタム ID 名前空間を設定します。
* ID を更新します。
* ID グラフを検証します。
* ECID やその他の ID を取得します。


## カスタム ID 名前空間の設定

ID 名前空間は、 [ID サービス](https://experienceleague.adobe.com/docs/experience-platform/identity/home.html?lang=ja) id が関連するコンテキストのインジケーターとして機能する 例えば、`name@email.com` の値をメールアドレスとして、または `443522` を数値 CRM ID として区別します。

1. データ収集インターフェイスで、「 」を選択します。 **[!UICONTROL ID]** をクリックします。
1. 「**[!UICONTROL ID 名前空間を作成]**」を選択します。
1. 次を提供： **[!UICONTROL 表示名]** / `Luma CRM ID` および **[!UICONTROL ID シンボル]** の値 `lumaCRMId`.
1. 選択 **[!UICONTROL クロスデバイス ID]**.
1. 「**[!UICONTROL 作成]**」を選択します。

   ![id 名前空間を作成](assets/identity-create.png)




## ID を更新

ユーザーがアプリにログインする際に、標準 ID（電子メール）とカスタム ID(Luma CRM ID) の両方を更新する必要がある場合。

1. に移動します。 **[!UICONTROL LoginSheet]** ( **[!UICONTROL 件数]** > **[!UICONTROL 一般]**) をクリックし、 `updateIdentities`:

   ```swift {highlight="3,4"}
   Button("Login") {
       // call updaeIdentities
       MobileSDK.shared.updateIdentities(emailAddress: currentEmailId, crmId: currentCRMId)
   
       // Send app interaction event
       MobileSDK.shared.sendAppInteractionEvent(actionName: "login")
       dismiss()
   }
   .disabled(currentEmailId.isValidEmail == false)
   .buttonStyle(.bordered)
   ```

1. 次に移動： `updateIdentities` 関数の実装 **[!UICONTROL MobileSDK]** ( **[!UICONTROL Utils]**) を Xcode Luma アプリプロジェクトに追加します。 次のハイライト表示されたコードを関数に追加します。

   ```swift {highlight="2-12"}
   func updateIdentities(emailAddress: String, crmId: String) {
       let identityMap: IdentityMap = IdentityMap()
       // Add identity items
       let emailIdentity = IdentityItem(id: emailAddress, authenticatedState: AuthenticatedState.authenticated)
       let crmIdentity = IdentityItem(id: crmId, authenticatedState: AuthenticatedState.authenticated)
       identityMap.add(item:emailIdentity, withNamespace: "Email")
       identityMap.add(item: crmIdentity, withNamespace: "lumaCRMId")
   
       // Update identities
       Identity.updateIdentities(with: identityMap)
   }
   ```

   このコードは次を実行します。

   1. 空を作成 `IdentityMap` オブジェクト。

      ```swift
      let identityMap: IdentityMap = IdentityMap()
      ```

   1. 設定 `IdentityItem` 電子メール ID と CRM ID 用のオブジェクト。

      ```swift
      let emailIdentity = IdentityItem(id: emailAddress, authenticatedState: AuthenticatedState.authenticated)
      let crmIdentity = IdentityItem(id: crmId, authenticatedState: AuthenticatedState.authenticated)
      ```

   1. 追加 `IdentityItem` オブジェクトを `IdentityMap` オブジェクト。

      ```swift
      identityMap.add(item:emailIdentity, withNamespace: "Email")
      identityMap.add(item: crmIdentity, withNamespace: "lumaCRMId")
      ```

   1. 送信する `IdentityItem` の一部としてのオブジェクト `Identity.updateIdentities` Edge ネットワークへの API 呼び出し。

      ```swift
      Identity.updateIdentities(with: identityMap) 
      ```


>[!NOTE]
>
>1 回のみで複数の ID を送信できます `updateIdentities` を呼び出します。 また、以前に送信した ID を変更することもできます。


## ID の削除

以下を使用できます。 `removeIdentity` をクリックして、保存されたクライアント側の IdentityMap から id を削除します。 ID 拡張機能が Edge ネットワークへの識別子の送信を停止します。 この API を使用しても、サーバー側のユーザープロファイルグラフまたは ID グラフから識別子が削除されることはありません。

1. に移動します。 **[!UICONTROL LoginSheet]** ( **[!UICONTROL 件数]** > **[!UICONTROL 一般]**) をクリックし、 `removeIdentities`:

   ```swift {highlight="3"}
   Button("Logout", role: .destructive) {
       // call removeIdentities
       MobileSDK.shared.removeIdentities(emailAddress: currentEmailId, crmId: currentCRMId)
       dismiss()                   
   }
   .buttonStyle(.bordered)
   ```

1. 次のコードを `removeIdentities` 機能する `MobileSDK`:

   ```swift {highlight="2-8"}
   func removeIdentities(emailAddress: String, crmId: String) {
       Identity.removeIdentity(item: IdentityItem(id: emailAddress), withNamespace: "Email")
       Identity.removeIdentity(item: IdentityItem(id: crmId), withNamespace: "lumaCRMId")
       // reset email and CRM Id to their defaults
       currentEmailId = "testUser@gmail.com"
       currentCRMId = "112ca06ed53d3db37e4cea49cc45b71e"
   }
   ```


## アシュランスで検証

1. 以下を確認します。 [設定手順](assurance.md) を参照し、シミュレーターまたはデバイスを Assurance に接続します。
1. Luma アプリ内
   1. を選択します。 **[!UICONTROL ホーム]** タブをクリックします。
   1. を選択します。 **[!UICONTROL ログイン]** アイコンを右上に表示します。
   1. 電子メールアドレスと CRM ID を入力するか、
   1. A|を選択すると、 **[!UICONTROL 電子メール]** および **[!UICONTROL CRM ID]**.
   1. 選択 **[!UICONTROL ログイン]**.

      <img src="./assets/identity1.png" width="300"> <img src="./assets/identity2.png" width="300">


1. Assurance Web UI で**[!UICONTROL エッジ ID の更新 ID]**イベント **[!UICONTROL com.adobe.griffon.mobile]** ベンダー。
1. イベントを選択し、 **[!UICONTROL ACPExtensionEventData]** オブジェクト。 更新した ID が表示されます。
   ![id の更新を検証](assets/identity-validate-assurance.png)

## ID グラフで検証

手順を完了したら、 [Experience Platformレッスン](platform.md)を使用すると、Platforms の ID グラフビューアで ID の取り込みを確認できます。

1. 選択 **[!UICONTROL ID]** （データ収集 UI）を参照してください。
1. 選択 **[!UICONTROL ID グラフ]** 上部のバーから。
1. 入力 `Luma CRM ID` として **[!UICONTROL ID 名前空間]** と CRM ID（例： ） `24e620e255734d8489820e74f357b5c8`) を **[!UICONTROL ID 値]**.
1. 次のように表示されます。 **[!UICONTROL ID]** リストに表示されました。

   ![id グラフを検証](assets/identity-validate-graph.png)


>[!SUCCESS]
>
>これで、Edge ネットワーク内の ID を更新するアプリを設定し、（設定時に）Adobe Experience Platformで ID を更新するようになりました。<br/>Adobe Experience Platform Mobile SDK の学習に時間を割いていただき、ありがとうございます。 ご質問がある場合、一般的なフィードバックを共有する場合、または今後のコンテンツに関する提案がある場合は、このドキュメントで共有します [Experience Leagueコミュニティディスカッション投稿](https://experienceleaguecommunities.adobe.com/t5/adobe-experience-platform-launch/tutorial-discussion-implement-adobe-experience-cloud-in-mobile/td-p/443796)

次へ： **[プロファイル](profile.md)**
