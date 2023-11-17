---
title: アシュランスの設定
description: モバイルアプリに Assurance 拡張機能を実装する方法を説明します。
feature: Mobile SDK,Assurance
exl-id: e15774b2-2f52-400f-9313-bb4338a88918
source-git-commit: 94ca4a238c241518219fb2e8d73f775836f86d86
workflow-type: tm+mt
source-wordcount: '603'
ht-degree: 4%

---

# Assurance

モバイルアプリでAdobe Experience Platform Assurance を設定する方法を説明します。

>[!INFO]
>
> このチュートリアルは、2023 年 11 月後半に新しいサンプルモバイルアプリを使用した新しいチュートリアルに置き換えられます

アシュランス（正式には Project Griffon と呼ばれます）は、データ収集やモバイルアプリでのエクスペリエンス提供の方法を調査、配達確認、シミュレーション、検証するのに役立つように設計されています。

保証は、Adobe Experience Platform Mobile SDK で生成された生の SDK イベントを調べるのに役立ちます。 SDK で収集されたすべてのイベントを調査できます。 SDK イベントは、時間順に並べ替えられたリストビューに読み込まれます。 各イベントには、詳細を示す詳細ビューがあります。 SDK 設定、データ要素、共有状態、SDK 拡張機能のバージョンを参照するための追加のビューも提供されます。 詳しくは、 [アシュランス](https://experienceleague.adobe.com/docs/experience-platform/assurance/home.html?lang=ja) （製品ドキュメント内）。


## 前提条件

* SDK が正常にビルドされ、インストールされ、設定された状態でサンプルアプリを実行しました。

## 学習内容

このレッスンでは、次の操作を実行します。

* 組織がアクセス権を持っていることを確認します（持っていない場合はリクエストします）。
* ベース URL を設定します。
* 必要なiOS固有のコードを追加します。
* セッションに接続します。

## アクセスを確認

以下の手順を実行して、組織がアシュランスにアクセスできることを確認します。

1. 訪問 [https://experience.adobe.com/#/assurance](https://experience.adobe.com/griffon){target="_blank"}
1. Experience CloudのAdobe ID資格情報を使用してログインします。
1. もし **[!UICONTROL セッション]** 画面が表示され、アクセス権が付与されます。 ベータ版アクセスページが表示されたら、「 **[!UICONTROL 登録]**.

## 実装方法

一般 [SDK のインストール](install-sdks.md) 前のレッスンを完了したので、iOSでは次の追加も必要です。 `AppDelegate.swift` ファイルに次のコードを追加します。

```swift
func application(_ app: UIApplication, open url: URL, options: [UIApplication.OpenURLOptionsKey: Any] = [:]) -> Bool {
    Assurance.startSession(url: url)
    return true
}
```

このチュートリアルで提供されているサンプル Luma は、iOS 12.0 を使用しています。iOS 13 以降を使用して独自のシーンベースのアプリケーションと共にフォローする場合は、 `UISceneDelegate's scene(_:openURLContexts:)` メソッドを次に示します。

```swift
func scene(_ scene: UIScene, openURLContexts URLContexts: Set<UIOpenURLContext>) {
    // Called when the app in background is opened with a deep link.
    if let deepLinkURL = URLContexts.first?.url {
        Assurance.startSession(url: deepLinkURL)
    }
}
```

詳細はこちらをご覧ください [ここ](https://developer.adobe.com/client-sdks/documentation/platform-assurance-sdk/api-reference/){target="_blank"}.

## ベース URL の設定

1. Xcode を開き、プロジェクト名を選択します。
1. 次に移動： **情報** タブをクリックします。
1. 下にスクロールして **URL タイプ** をクリックし、 **+** ボタンをクリックして、新しいボタンを追加します。
1. 設定 **識別子** および **URL スキーム** を「lumadeeplink」に変更します。
1. アプリをビルドして実行します。

![アシュアランス url](assets/mobile-assurance-url-type.png)

iOSでの URL スキームの詳細については、 [Appleドキュメント](https://developer.apple.com/documentation/xcode/defining-a-custom-url-scheme-for-your-app){target="_blank"}.

アシュランスは、ブラウザーまたは QR コードを介して URL を開くことで機能します。この URL は、アプリを開き、追加のパラメーターを含むベース URL から始まります。 これらの一意のパラメーターは、セッションの接続に使用されます。

## セッションへの接続

1. 次に移動： [アシュランス UI](https://experience.adobe.com/griffon){target="_blank"}.
1. 選択 **[!UICONTROL セッションを作成]**.
1. 提供 **[!UICONTROL セッション名]** 例： `Luma App QA` そして **[!UICONTROL ベース URL]** `lumadeeplink://default`
1. 「**[!UICONTROL 次へ]**」を選択します。
   ![アシュランス作成セッション](assets/mobile-assurance-create-session.png)
1. **[!UICONTROL QR コードをスキャン]** 物理デバイスを使用している場合。 シミュレーターを使用している場合は、 **[!UICONTROL リンクをコピー]** シミュレーターで Safari と共に開きます。
   ![アシュランス qa コード](assets/mobile-assurance-qr-code.png)
1. アプリが読み込まれると、前の手順で PIN を入力するように求めるモーダルが表示されます。
   ![アシュランスピンを入力](assets/mobile-assurance-enter-pin.png)
1. 接続に成功した場合は、アシュランス Web UI にイベントが表示され、アプリに浮動保証アイコンが表示されます。
   * アシュランスアイコンフローティング。
     ![アシュランスモーダル](assets/mobile-assurance-modal.png)
   * Web UI で取得されるExperience Cloudイベント。
     ![アシュランスイベント](assets/mobile-assurance-events.png)

問題が発生した場合は、 [技術](https://developer.adobe.com/client-sdks/documentation/platform-assurance-sdk/){target="_blank"} and [general documentation](https://experienceleague.adobe.com/docs/experience-platform/assurance/home.html?lang=ja){target="_blank"}.

次へ： **[同意](consent.md)**

>[!NOTE]
>
>Adobe Experience Platform Mobile SDK の学習に時間を割いていただき、ありがとうございます。 ご質問がある場合、一般的なフィードバックを共有したい場合、または今後のコンテンツに関する提案がある場合は、こちらで共有してください [Experience Leagueコミュニティディスカッション投稿](https://experienceleaguecommunities.adobe.com/t5/adobe-experience-platform-launch/tutorial-discussion-implement-adobe-experience-cloud-in-mobile/td-p/443796)
