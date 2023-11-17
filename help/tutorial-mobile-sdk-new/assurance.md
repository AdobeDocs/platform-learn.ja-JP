---
title: アシュランスの設定
description: モバイルアプリに Assurance 拡張機能を実装する方法を説明します。
feature: Mobile SDK,Assurance
hide: true
exl-id: 49d608e7-e9c4-4bc8-8a8a-5195f8e2ba42
source-git-commit: 4a12f8261cf1fb071bc70b6a04c34f6c16bcce64
workflow-type: tm+mt
source-wordcount: '985'
ht-degree: 2%

---

# アシュランスの設定

モバイルアプリでAdobe Experience Platform Assurance を設定する方法を説明します。

アシュランス（正式には Project Griffon と呼ばれます）は、データ収集やモバイルアプリでのエクスペリエンス提供の方法を調査、配達確認、シミュレーション、検証するのに役立つように設計されています。

保証は、Adobe Experience Platform Mobile SDK で生成された生の SDK イベントを調べるのに役立ちます。 SDK で収集されたすべてのイベントを調査できます。 SDK イベントは、時間順に並べ替えられたリストビューに読み込まれます。 各イベントには、詳細を示す詳細ビューがあります。 SDK 設定、データ要素、共有状態、SDK 拡張機能のバージョンを参照するための追加のビューも提供されます。 詳しくは、 [アシュランス](https://experienceleague.adobe.com/docs/experience-platform/assurance/home.html?lang=ja) （製品ドキュメント内）。


## 前提条件

* SDK を使用したアプリが正常にセットアップされ、設定されました。

## 学習内容

このレッスンでは、次の操作を実行します。

* 組織がアクセス権を持っていることを確認します（持っていない場合はリクエストします）。
* ベース URL を設定します。
* 必要なiOS固有のコードを追加します。
* セッションに接続します。

## アクセスを確認

組織がアシュランスにアクセスできることを確認します。 ユーザーは、Adobe Experience Platformのプロファイルに追加される必要があります。 詳しくは、 [ユーザーアクセス](https://experienceleague.adobe.com/docs/experience-platform/assurance/user-access.html?lang=en) （アシュランスガイド）を参照してください。

## 実装方法

一般 [SDK のインストール](install-sdks.md)前のレッスンで完了したiOSでは、アプリのアシュランスセッションを開始するために、以下の追加も必要です。

1. に移動します。 **[!DNL Luma]** > **[!DNL Luma]** > **[!UICONTROL SceneDelegate]** をクリックします。

1. 次のコードを `func scene(_ scene: UIScene, openURLContexts URLContexts: Set<UIOpenURLContext>` に追加します。

   ```swift
   // Called when the app in background is opened with a deep link.
   if let deepLinkURL = URLContexts.first?.url {
       // Start the Assurance session
       Assurance.startSession(url: deepLinkURL)
   }
   ```

   このコードは、アプリがバックグラウンドになっていて、ディープリンクを使用して開いたときに、保証セッションを開始します。

詳細はこちらをご覧ください [ここ](https://developer.adobe.com/client-sdks/documentation/platform-assurance-sdk/api-reference/){target="_blank"}.

<!-- not initially required

## Signing

Signing the application is only required for the [Create and send push notifications](journey-optimizer-push.md) and the [Create and send in-app messages](journey-optimizer-inapp.md) lessons in this tutorial. These lessons require an Apple provisioning profile which **requires a paid Apple developer account**.

To update the signing for the lessons that require that you sign the application:

1. Open the project in Xcode.
1. Select **[!DNL Luma]** in the Project navigator.
1. Select the **[!DNL Luma]** target.
1. Select the **Signing & Capabilities** tab.
1. Configure **[!UICONTROL Automatic manage signing]**, **[!UICONTROL Team]**, and **[!UICONTROL Bundle Identifier]**, or use your specific Apple development provisioning details. 
 
   >[!IMPORTANT]
   >
   >Ensure you use a _unique_ bundle identifier and replace the `com.adobe.luma.tutorial.swiftui` bundle identifier, as each bundle identifier needs to be unique. Typically, you use a reverse-DNS format for bundle ID strings, like `com.organization.brand.uniqueidentifier`. The Finished version of this tutorial, for example, uses `com.adobe.luma.tutorial.swiftui`.


    ![Xcode signing capabilities](assets/xcode-signing-capabilities.png){zoomable="yes"}

-->

## ベース URL の設定

1. Xcode でプロジェクトに移動します。
1. 選択 **[!DNL Luma]** をクリックします。
1. を選択します。 **[!DNL Luma]** ターゲット。
1. を選択します。 **情報** タブをクリックします。
1. ベース URL を追加するには、下にスクロールして **URL タイプ** をクリックし、 **+** 」ボタンをクリックします。
1. 設定 **識別子** を任意のバンドル識別子に追加し、 **URL スキーム** を選択します。

   ![アシュアランス url](assets/assurance-url-type.png)

   >[!IMPORTANT]
   >
   >必ず _ユニーク_ バンドル識別子を置き換えます。 `com.adobe.luma.tutorial.swiftui` バンドル識別子。各バンドル識別子は一意である必要があります。 通常、バンドル ID 文字列には逆引き DNS 形式を使用します ( 例： `com.organization.brand.uniqueidentifier`.<br/>同様に、一意の URL スキームを使用し、既に指定されている `lumatutorialswiftui` を使用して、一意の URL スキームを設定します。

iOSでの URL スキームについて詳しくは、 [Appleドキュメント](https://developer.apple.com/documentation/xcode/defining-a-custom-url-scheme-for-your-app){target="_blank"}.

アシュランスは、ブラウザーまたは QR コードを介して URL を開くことで機能します。 この URL は、アプリを開くベース URL で始まり、追加のパラメーターが含まれています。 これらの一意のパラメーターは、セッションの接続に使用されます。


## セッションへの接続

Xcode の場合：

1. を使用して、シミュレーターまたは Xcode の物理デバイスで、アプリをビルドまたはリビルドして実行します。 ![再生](https://spectrum.adobe.com/static/icons/workflow_18/Smock_Play_18_N.svg).

   >[!TIP]
   >
   >必要に応じて、特に予期しない結果が表示された場合に、ビルドを「クリーンアップ」することができます。 それには、「 」を選択します。 **[!UICONTROL ビルドフォルダーをクリーンアップ…]** Xcode から **[!UICONTROL 製品]** メニュー。


1. Adobe Analytics の **[!UICONTROL 「Luma アプリ」でロケーションを使用することを許可]** ダイアログ、選択 **[!UICONTROL アプリの使用中に許可]**.

   <img src="assets/geolocation-permissions.png" width="300">

1. Adobe Analytics の **[!UICONTROL 「Luma アプリ」が通知を送信します]** ダイアログ、選択 **[!UICONTROL 許可]**.

   <img src="assets/notification-permissions.png" width="300">

1. 選択 **[!UICONTROL 続行…]** ：アプリがアクティビティを追跡できるようにします。

   <img src="assets/tracking-continue.png" width="300">

1. Adobe Analytics の **[!UICONTROL 「Luma アプリ」で、他の会社のアプリや Web サイトをまたいでアクティビティを追跡できるようにします]** ダイアログ、選択 **[!UICONTROL 許可]**.

   <img src="assets/tracking-allow.png" width="300">


ブラウザーで、以下の操作を実行します。

1. データ収集 UI に移動します。
1. 選択 **[!UICONTROL アシュランス]** をクリックします。
1. 選択 **[!UICONTROL セッションを作成]**.
1. 選択 **[!UICONTROL 開始]**.
1. 次を提供： **[!UICONTROL セッション名]** 例： `Luma Mobile App Session` そして **[!UICONTROL ベース URL]**:Xcode で入力した URL スキームで、その後に `://` 例： `lumatutorialswiftui://`
1. 「**[!UICONTROL 次へ]**」を選択します。
   ![アシュランス作成セッション](assets/assurance-create-session.png)
1. Adobe Analytics の **[!UICONTROL 新しいセッションを作成]** モーダルダイアログ：

   物理デバイスを使用している場合：

   * 選択 **[!UICONTROL QR コードをスキャン]**. アプリを開くには、物理デバイスのカメラを使用して QR コードをスキャンし、リンクをタップします。

     ![アシュランス qa コード](assets/assurance-qr-code.png)

   シミュレーターを使用している場合は、次の手順に従います。

   1. 選択 **[!UICONTROL リンクをコピー]**.
   1. を使用してディープリンクをコピーする ![コピー](https://spectrum.adobe.com/static/icons/workflow_18/Smock_Copy_18_N.svg)  ディープリンクを使用して、シミュレーターで Safari でアプリを開きます。
      ![アシュランスコピーリンク](assets/assurance-copy-link.png)

1. アプリが読み込まれると、手順 7 で示す PIN を入力するよう求めるモーダルダイアログが表示されます。

   <img src="assets/assurance-enter-pin.png" width="300">

   PIN を入力し、を選択します。 **[!UICONTROL 接続]**.


1. 接続に成功した場合は、次のように表示されます。
   * アプリの上に浮かぶアシュランスアイコン。

     <img src="assets/assurance-modal.png" width="300">

   * Assurance UI でのExperience Cloudの更新で、次の内容が表示されます。

      1. アプリからのエクスペリエンスイベント。
      1. 選択したイベントの詳細。
      1. デバイスとタイムライン。

         ![アシュランスイベント](assets/assurance-events.png)

問題が発生した場合は、 [技術](https://developer.adobe.com/client-sdks/documentation/platform-assurance-sdk/){target="_blank"} and [general documentation](https://experienceleague.adobe.com/docs/experience-platform/assurance/home.html?lang=ja){target="_blank"}.


## 拡張機能の検証

アプリが最新の拡張機能を使用しているかどうかを確認するには：

1. 選択 **[!UICONTROL 設定]**.

1. 選択 ![追加](https://spectrum.adobe.com/static/icons/workflow_18/Smock_AddCircle_18_N.svg) 対象： ![123](https://spectrum.adobe.com/static/icons/workflow_18/Smock_123_18_N.svg) **[!UICONTROL 拡張機能のバージョン]**.

1. 「**[!UICONTROL 保存]**」を選択します。

   ![拡張機能のバージョンの設定](assets/assurance-configure-extension-versions.png)

1. 選択 ![123](https://spectrum.adobe.com/static/icons/workflow_18/Smock_123_18_N.svg) **[!UICONTROL 拡張機能のバージョン]** を参照して、利用可能な最新の拡張機能と、アプリのバージョンで使用される拡張機能の概要を確認してください。

   ![拡張機能のバージョン](assets/assurance-extension-versions.png)

1. 拡張機能のバージョンを更新するには ( 例： **[!UICONTROL メッセージ]** および **[!UICONTROL 最適化]**) パッケージ（拡張）を次の中から選択します。 **[!UICONTROL パッケージの依存関係]** ( 例： **[!UICONTROL AEPMessaging]**) を選択し、コンテキストメニューから「 」を選択します。 **[!UICONTROL パッケージを更新]**. Xcode はパッケージの依存関係を更新します。


>[!NOTE]
>
>Xcode で拡張機能（パッケージ）を更新したら、現在のセッションを閉じてから削除し、 [セッションへの接続](#connecting-to-a-session) および [拡張機能の検証](#verify-extensions) アシュランスが、新しいアシュランスセッションで適切な拡張を適切に報告するようにする。





>[!SUCCESS]
>
>これで、このチュートリアルの残りの部分でアシュランスを使用するようにアプリを設定しました。
>
>Adobe Experience Platform Mobile SDK の学習に時間を割いていただき、ありがとうございます。 ご質問がある場合、一般的なフィードバックを共有する場合、または今後のコンテンツに関する提案がある場合は、このドキュメントで共有します [Experience Leagueコミュニティディスカッション投稿](https://experienceleaguecommunities.adobe.com/t5/adobe-experience-platform-data/tutorial-discussion-implement-adobe-experience-cloud-in-mobile/td-p/443796)


次へ： **[同意の実装](consent.md)**
