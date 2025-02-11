---
title: モバイルアプリでのAdobe Experience Cloudの実装チュートリアルの概要
description: Adobe Experience Cloud モバイルアプリケーションの実装方法を説明します。 このチュートリアルでは、サンプル Swift アプリでのExperience Cloud アプリケーションの実装について説明します。
recommendations: noDisplay,catalog
last-substantial-update: 2023-11-29T00:00:00Z
exl-id: daff4214-d515-4fad-a224-f7589b685b55
source-git-commit: a928fb5c8e48e71984b75faf4eb397814caac6aa
workflow-type: tm+mt
source-wordcount: '826'
ht-degree: 3%

---

# モバイルアプリでのAdobe Experience Cloudの実装のチュートリアル

Adobe Experience Platform Mobile SDK を使用して、モバイルアプリに Adobe Experience Cloud アプリケーションを実装する方法を説明します。

Experience Platform Mobile SDKは、Adobe Experience Cloudのお客様がAdobe Experience Platform Edge Networkを通じてAdobe アプリケーションとサードパーティのサービスの両方を操作できるようにする、クライアントサイド SDKです。 詳しくは、[Adobe Experience Platform Mobile SDKのドキュメント ](https://developer.adobe.com/client-sdks/home/) を参照してください。

![アーキテクチャ](assets/architecture.png)


このチュートリアルでは、Luma と呼ばれるサンプルの小売アプリでの Platform Mobile SDKの実装について説明します。 [Luma アプリ ](https://github.com/Adobe-Marketing-Cloud/Luma-iOS-Mobile-App) には、現実的な実装を構築できる機能があります。 このチュートリアルを完了すると、独自のモバイルアプリでExperience Platform Mobile SDKを使用してすべてのマーケティングソリューションの実装を開始する準備が整います。

レッスンはiOS向けに設計され、Swift/SwiftUI で記述されていますが、多くのコンセプトはAndroid™ にも当てはまります。

このチュートリアルを完了すると、次の操作を実行できるようになります。

* 標準フィールドグループとカスタムフィールドグループを使用してスキーマを作成します。
* データストリームを設定します。
* モバイルタグプロパティを設定します。
* Experience Platform データセットを設定します（オプション）。
* アプリにタグ拡張機能をインストールして実装します。
* Experience Cloud パラメーターを [webview](web-views.md) に正しく渡す。
* [Adobe Experience Platform Assurance](assurance.md) を使用して実装を検証します。
* 次のAdobe Experience Cloud アプリケーション/拡張機能を追加します。
   * [Adobe Experience Platform Edge（XDM）](events.md)
   * [ライフサイクルデータ収集](lifecycle-data.md)
   * [同意](consent.md)
   * [ID](identity.md)
   * [プロファイル](profile.md)
   * [Places](places.md)
   * [Analytics](analytics.md)
   * [Experience Platform](platform.md)
   * [Journey Optimizerを使用したプッシュメッセージ](journey-optimizer-push.md)
   * [Journey Optimizerを使用したアプリ内メッセージ](journey-optimizer-inapp.md)
   * [Journey Optimizerによる意思決定管理](journey-optimizer-offers.md)
   * [Target](target.md)


>[!NOTE]
>
>[Web SDK](../tutorial-web-sdk/overview.md) についても、同様のマルチソリューションチュートリアルを参照できます。

## 権限

これらのレッスンでは、Adobe ID と、演習を完了するために必要なユーザーレベルの権限があることを前提としています。 そうでない場合は、Adobe管理者に連絡してアクセスをリクエストしてください。

* データ収集には、次が必要です。
   * **[!UICONTROL Platforms]** – 権限項目 **[!UICONTROL モバイル]**
   * **[!UICONTROL プロパティ権限]** - **[!UICONTROL 開発]**、**[!UICONTROL 承認]**、**[!UICONTROL 公開]**、**[!UICONTROL 拡張機能の管理]**、**[!UICONTROL 環境の管理]** の権限項目。
   * **[!UICONTROL 会社権限]** - **[!UICONTROL プロパティの管理]** に対する権限項目と、オプションのプッシュメッセージレッスンを完了している場合は **[!UICONTROL アプリ設定の管理]**

     タグ権限について詳しくは、製品ドキュメントの [ タグのユーザー権限 ](https://experienceleague.adobe.com/docs/experience-platform/tags/admin/user-permissions.html?lang=ja){target="_blank"} を参照してください。
* Experience Platformには、以下が必要です。
   * **[!UICONTROL データモデリング]** - スキーマを管理および表示する権限項目。
   * **[!UICONTROL Identity Management]** - ID 名前空間を管理および表示する権限項目です。
   * **[!UICONTROL データ収集]** - データストリームを管理および表示する権限項目。

   * Real-Time CDP、Journey Optimizer、Customer Journey Analyticsなどの Platform ベースのアプリケーションのお客様の場合は、関連する次のレッスンも受講してください。
      * **[!UICONTROL データ管理]** - データセットを管理および表示する権限項目。
      * このチュートリアルに使用できる開発 **サンドボックス**。

   * Journey Optimizerのレッスンでは、**プッシュ通知サービス** を設定し、**アプリサーフェス**、**ジャーニー**、**メッセージ** および **メッセージプリセット** を作成するための権限が必要です。 意思決定管理の場合、（こちら **で説明しているように、** オファーの管理 [ および **決定** に対する適切な権限が必要 ](https://experienceleague.adobe.com/docs/journey-optimizer/using/access-control/privacy/high-low-permissions.html?lang=en#decisions-permissions) す。

* Adobe Analyticsの場合、このチュートリアルを完了するために使用できる **レポートスイート** がわかっている必要があります。

* Adobe Targetの場合、アクティビティを作成してアクティブ化する権限が必要です。


>[!NOTE]
>
>このチュートリアルの一部として、スキーマ、データセット、ID などを作成します。 このチュートリアルを 1 つのサンドボックスで複数のユーザーが行う場合は、これらのオブジェクトを作成する際の命名規則の一部として、ID を追加または先頭に追加することを検討してください。 例えば、作成するように指示されたオブジェクトの名前に ` - <your name or initials>` を追加します。

## バージョン履歴

* 2023 年 11 月 29 日（PT）：新しいサンプルアプリと、アプリ内メッセージ、意思決定管理、Adobe Targetに関する新しいレッスンを含む大幅な見直し。
* 2022 年 3 月 9 日：初回公開

## Luma アプリのダウンロード

2 つのバージョンのサンプルアプリをダウンロードできます。 どちらのバージョンも、[Github](https://github.com/Adobe-Marketing-Cloud/Luma-iOS-Mobile-App) からダウンロードまたはクローン作成できます。 次の 2 つのフォルダーがあります。


1. [ 開始 ](https://github.com/Adobe-Marketing-Cloud/Luma-iOS-Mobile-App){target="_blank"}：このチュートリアルの実践的な演習を完了するために必要なExperience Platform Mobile SDK コードのほとんどに対して、コードのないプロジェクトまたはプレースホルダーコードを使用したプロジェクト。
1. [ 完了 ](https://github.com/Adobe-Marketing-Cloud/Luma-iOS-Mobile-App){target="_blank"}：参照用に完全な実装を持つバージョン。

>[!NOTE]
>
>iOSをプラットフォーム、プログラミング言語、UI フレームワーク、統合開発環境（IDE） [!DNL SwiftUI] して使用し [!DNL Xcode] す [!DNL Swift]。 ただし、説明されている実装概念の多くは、他の開発プラットフォームでも似ています。 多くのユーザーは、このチュートリアルを既にほとんど、またはまったく以前のiOS/Swift （UI）の経験を持たずに完了しています。 レッスンを完了するために専門家である必要はありませんが、コードを快適に読んで理解できれば、レッスンからより多くを得ることができます。


製品化された最終的なバージョンのアプリは、App Storeからダウンロードできます。

[![ ダウンロード ](assets/download-app.svg)](https://apps.apple.com/us/app/luma-app/id6466588487)


それでは、始めましょう。

>[!SUCCESS]
>
>Adobe Experience Platform Mobile SDKの学習にご協力いただき、ありがとうございます。 ご不明な点がある場合や、一般的なフィードバックをお寄せになる場合、または今後のコンテンツに関するご提案がある場合は、この [Experience League Community Discussion の投稿 ](https://experienceleaguecommunities.adobe.com/t5/adobe-experience-platform-data/tutorial-discussion-implement-adobe-experience-cloud-in-mobile/td-p/443796) でお知らせください。

次のトピック：**[XDM スキーマの作成](create-schema.md)**
