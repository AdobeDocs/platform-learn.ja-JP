---
title: アシュランスの設定
description: モバイルアプリに Assurance 拡張機能を実装する方法を説明します。
feature: Mobile SDK,Assurance
hide: true
source-git-commit: e364d70375f687b9c50691efd04a1db757fee364
workflow-type: tm+mt
source-wordcount: '738'
ht-degree: 4%

---

# Assurance

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

以下の手順を実行して、組織がアシュランスにアクセスできることを確認します。

1. 訪問 [https://experience.adobe.com/assurance](https://experience.adobe.com/assurance){target="_blank"}.
1. Experience CloudのAdobe ID資格情報を使用してログインします。
1. 次の項目が表示された場合、 **[!UICONTROL セッション]** 画面が表示され、アクセス権が付与されます。 （ベータ版）アクセスページが表示された場合は、「 **[!UICONTROL 登録]** 登録する。

## 実装方法

一般 [SDK のインストール](install-sdks.md)前のレッスンで完了したiOSでは、アプリのアシュランスセッションを開始するために、以下の追加も必要です。

1. に移動します。 **[!UICONTROL Luma]** > **[!UICONTROL Luma]** > **[!UICONTROL SceneDelegate]** をクリックします。

1. 次のコードを `func scene(_ scene: UIScene, openURLContexts URLContexts: Set<UIOpenURLContext>` に追加します。

   ```swift
   // Called when the app in background is opened with a deep link.
   if let deepLinkURL = URLContexts.first?.url {
       // Start the Assurance session
       Assurance.startSession(url: deepLinkURL)
   }
   ```

詳細はこちらをご覧ください [ここ](https://developer.adobe.com/client-sdks/documentation/platform-assurance-sdk/api-reference/){target="_blank"}.

## 署名

Xcode でアプリケーションを初めて実行する前に、必ず署名を更新してください。

1. Xcode で  プロジェクトを開きます。
1. 選択 **[!UICONTROL Luma]** 」と入力します。
1. を選択します。 **[!UICONTROL Luma]** ターゲット。
1. を選択します。 **署名と機能** タブをクリックします。
1. 設定 **[!UICONTROL 署名を自動管理]**, **[!UICONTROL チーム]**、および **[!UICONTROL バンドル識別子]**.

   ![Xcode 署名機能](assets/xcode-signing-capabilities.png)

## ベース URL の設定

1. Xcode でプロジェクトに移動します。
1. 選択 **[!UICONTROL Luma]** 」と入力します。
1. を選択します。 **[!UICONTROL Luma]** ターゲット。
1. を選択します。 **情報** タブをクリックします。
1. ベース URL を追加するには、下にスクロールして **URL タイプ** をクリックし、 **+** 」ボタンをクリックします。
1. 設定 **識別子** を、で設定したバンドル識別子に追加します。 [署名](#signing) 例： `com.adobe.luma.tutorial.swiftui`) および **URL スキーム** から `lumatutorialswiftui`.

   ![アシュアランス url](assets/assurance-url-type.png)

iOSでの URL スキームについて詳しくは、 [Appleドキュメント](https://developer.apple.com/documentation/xcode/defining-a-custom-url-scheme-for-your-app){target="_blank"}.

アシュランスは、ブラウザーまたは QR コードを介して URL を開くことで機能します。 この URL は、アプリを開くベース URL で始まり、追加のパラメーターが含まれています。 これらの一意のパラメーターは、セッションの接続に使用されます。


## セッションへの接続

1. シミュレーターまたは接続された物理デバイスでアプリケーションを実行します。
1. 選択 **[!UICONTROL アシュランス]** をデータ収集 UI の左側のパネルから削除します。
1. 選択 **[!UICONTROL セッションを作成]**.
1. 選択 **[!UICONTROL 開始]**.
1. 次を提供： **[!UICONTROL セッション名]** 例： `Luma Mobile App Session` そして **[!UICONTROL ベース URL]**:Xcode で入力した URL スキームで、その後に `://`. 例：`lumatutorialswiftui://`。
1. 「**[!UICONTROL 次へ]**」を選択します。
   ![アシュランス作成セッション](assets/assurance-create-session.png)
1. Adobe Analytics の **[!UICONTROL 新しいセッションを作成]** モーダルダイアログ：

   物理デバイスを使用している場合：

   * 選択 **[!UICONTROL QR コードをスキャン]**. 物理デバイスでカメラを使用して QR コードをスキャンし、リンクをタップしてアプリを開きます。

     ![アシュランス qa コード](assets/assurance-qr-code.png)

   シミュレーターを使用している場合は、次の手順に従います。

   1. 選択 **[!UICONTROL リンクをコピー]**.
   1. コピーを使用してディープリンクをコピーします ![コピー](https://spectrum.adobe.com/static/icons/workflow_18/Smock_Copy_18_N.svg) 」ボタンをクリックし、ディープリンクを使用して、シミュレーターで Safari でアプリを開きます。
      ![アシュランスコピーリンク](assets/assurance-copy-link.png)

1. アプリが読み込まれると、手順 7 で示す PIN を入力するよう求めるモーダルダイアログが表示されます。

   <img src="assets/assurance-enter-pin.png" width="300">

   PIN を入力し、を選択します。 **[!UICONTROL 接続]**.


1. 接続に成功した場合は、次のように表示されます。
   * アプリの上に浮かぶアシュランスアイコン。

   <img src="assets/assurance-modal.png" width="300">

   * Assurance の Web ベースの UI で提供されるExperience Cloudの更新で、次の内容が表示されます。

      1. アプリからのエクスペリエンスイベント。
      1. 選択したイベントの詳細。
      1. デバイスとタイムライン。

     ![アシュランスイベント](assets/assurance-events.png)

問題が発生した場合は、 [技術](https://developer.adobe.com/client-sdks/documentation/platform-assurance-sdk/){target="_blank"} and [general documentation](https://experienceleague.adobe.com/docs/experience-platform/assurance/home.html?lang=ja){target="_blank"}.

>[!SUCCESS]
>
>これで、このチュートリアルの残りの部分でアシュランスを使用するようにアプリを設定しました。<br/>Adobe Experience Platform Mobile SDK の学習に時間を割いていただき、ありがとうございます。 ご質問がある場合、一般的なフィードバックを共有したい場合、または今後のコンテンツに関する提案がある場合は、こちらで共有してください [Experience Leagueコミュニティディスカッション投稿](https://experienceleaguecommunities.adobe.com/t5/adobe-experience-platform-launch/tutorial-discussion-implement-adobe-experience-cloud-in-mobile/td-p/443796)


次へ： **[同意](consent.md)**
