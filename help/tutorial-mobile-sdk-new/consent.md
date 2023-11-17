---
title: 同意の実装
description: モバイルアプリに同意を実装する方法を説明します。
feature: Mobile SDK,Consent
hide: true
exl-id: 83f240ea-ea18-4986-9e89-5110a56167ce
source-git-commit: 4a12f8261cf1fb071bc70b6a04c34f6c16bcce64
workflow-type: tm+mt
source-wordcount: '539'
ht-degree: 1%

---

# 同意の実装

モバイルアプリに同意を実装する方法を説明します。

Adobe Experience Platform Consent モバイル拡張機能は、Adobe Experience Platform Mobile SDK と Edge Network 拡張機能を使用する際に、モバイルアプリから同意設定を収集できます。 詳しくは、 [同意拡張](https://developer.adobe.com/client-sdks/documentation/consent-for-edge-network/) 」を参照してください。

## 前提条件

* SDK が正常に構築され、インストールされ、設定された状態でアプリが実行されました。

## 学習内容

このレッスンでは、次の操作を実行します。

* ユーザーに同意を求めるプロンプトを表示します。
* ユーザーの応答に基づいて拡張機能を更新します。
* 現在の同意状態を取得する方法を説明します。

## 同意を求める

チュートリアルを最初から実行した場合は、同意拡張機能のデフォルトの同意がに設定されていることを覚えておく必要があります。 **[!UICONTROL 保留中 — ユーザーが同意設定を提供する前に発生したイベントをキューに入れます。]**

データの収集を開始するには、ユーザーから同意を得る必要があります。 実際のアプリでは、お住まいの地域の同意に関するベストプラクティスを参照してください。 このチュートリアルでは、次のアラートを使用して要求するだけで、ユーザーの同意を得ることができます。

1. ユーザーに同意を求めるのは 1 回だけです。 これをおこなうには、Mobile SDK の同意と、Apple Mobile Service を使用した追跡に必要な認証を組み合わせます [App Tracking Transparency フレームワーク](https://developer.apple.com/documentation/apptrackingtransparency). このアプリでは、ユーザーが追跡を許可する場合に、イベントの収集に同意すると想定します。

1. に移動します。 **[!DNL Luma]** > **[!DNL Luma]** > **[!DNL Utils]** > **[!UICONTROL MobileSDK]** 」をクリックします。

   このコードを `updateConsent` 関数に置き換えます。

   ```swift
   // Update consent
   let collectConsent = ["collect": ["val": value]]
   let currentConsents = ["consents": collectConsent]
   Consent.update(with: currentConsents)
   MobileCore.updateConfigurationWith(configDict: currentConsents)
   ```

1. に移動します。 **[!DNL Luma]** > **[!DNL Luma]** > **[!DNL Views]** > **[!DNL General]** > **[!UICONTROL 免責事項ビュー]** Xcode のプロジェクトナビゲーター。アプリケーションをインストールまたは再インストールして、初めてアプリを起動した後に表示されるビューです。 Appleの設定ごとにトラッキングを承認するように求められます。 [App Tracking Transparency フレームワーク](https://developer.apple.com/documentation/apptrackingtransparency). ユーザーが承認した場合は、同意も更新します。

   次のコードを `ATTrackingManager.requestTrackingAuthorization { status in` クロージャ。

   ```swift
   // Add consent based on authorization
   if status == .authorized {
      // Set consent to yes
      MobileSDK.shared.updateConsent(value: "y")
   }
   else {
      // Set consent to yes
      MobileSDK.shared.updateConsent(value: "n")
   }
   ```

## 現在の同意状態を取得する

同意モバイル拡張機能では、現在の同意値に基づいて、 / pends /を自動的に抑制し、トラッキングを許可します。 また、現在の同意状態に自分でアクセスすることもできます。

1. に移動します。 **[!DNL Luma]** > **[!DNL Luma]** > **[!DNL Utils]** > **[!UICONTROL MobileSDK]** Xcode のプロジェクトナビゲーター内。

   次のコードを `getConsents` 関数：

   ```swift
   // Get consents
   Consent.getConsents { consents, error in
      guard error == nil, let consents = consents else { return }
      guard let jsonData = try? JSONSerialization.data(withJSONObject: consents, options: .prettyPrinted) else { return }
      guard let jsonStr = String(data: jsonData, encoding: .utf8) else { return }
      Logger.aepMobileSDK.info("Consent getConsents: \(jsonStr)")
   }
   ```

2. に移動します。 **[!DNL Luma]** > **[!DNL Luma]** > **[!DNL Views]** > **[!DNL General]** > **[!UICONTROL HomeView]** Xcode のプロジェクトナビゲーター内。

   次のコードを `.task` 修飾子：

   ```swift
   // Ask status of consents
   MobileSDK.shared.getConsents()   
   ```

上記の例では、単に Xcode 内のコンソールに同意ステータスをログに記録するだけです。 実際のシナリオでは、これを使用して、ユーザーに表示されるメニューやオプションを変更できます。

## アシュランスで検証

1. デバイスまたはシミュレーターからアプリケーションを削除して、トラッキングと同意を適切にリセットおよび初期化します。
1. シミュレーターまたはデバイスを Assurance に接続するには、 [設定手順](assurance.md#connecting-to-a-session) 」セクションに入力します。
1. 次の場所からアプリ内を移動するとき： **[!UICONTROL ホーム]** 画面に表示 **[!UICONTROL 製品]** 画面と戻る **[!UICONTROL ホーム]** 画面に、 **[!UICONTROL 同意応答を取得]** イベントが Assurance UI に表示されます。
   ![同意を検証](assets/consent-update.png)


>[!SUCCESS]
>
>これで、Adobe Experience Platform Mobile SDK を使用した同意を求めるメッセージが、インストール後（または再インストール後）の最初の起動時にアプリで有効になりました。
>
>Adobe Experience Platform Mobile SDK の学習に時間を割いていただき、ありがとうございます。 ご質問がある場合、一般的なフィードバックを共有する場合、または今後のコンテンツに関する提案がある場合は、このドキュメントで共有します [Experience Leagueコミュニティディスカッション投稿](https://experienceleaguecommunities.adobe.com/t5/adobe-experience-platform-data/tutorial-discussion-implement-adobe-experience-cloud-in-mobile/td-p/443796)

次へ： **[ライフサイクルデータの収集](lifecycle-data.md)**
