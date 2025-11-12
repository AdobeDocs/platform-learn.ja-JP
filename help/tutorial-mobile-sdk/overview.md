---
title: モバイルアプリでのAdobe Experience Cloudの実装のチュートリアル
description: Adobe Experience Cloud モバイルアプリケーションの実装方法を説明します。 このチュートリアルでは、サンプルの Swift またはAndroid アプリでのExperience Cloud アプリケーションの実装について説明します。
recommendations: noDisplay,catalog
last-substantial-update: 2023-11-29T00:00:00Z
exl-id: daff4214-d515-4fad-a224-f7589b685b55
source-git-commit: 342bb7efbe868622c4bc08e02568bce948fed61c
workflow-type: tm+mt
source-wordcount: '1019'
ht-degree: 1%

---

# モバイルアプリでのAdobe Experience Cloudの実装のチュートリアル

Adobe Experience Platform Mobile SDKを使用して、モバイルアプリにAdobe Experience Cloud アプリケーションを実装する方法を説明します。

Experience Platform Mobile SDKは、Adobe Experience Cloudのお客様がAdobe Experience Platform Edge Networkを通じてAdobe アプリケーションとサードパーティのサービスの両方を操作できるようにする、クライアントサイド SDKです。 詳しくは、[Adobe Experience Platform Mobile SDKのドキュメント &#x200B;](https://developer.adobe.com/client-sdks/home/) を参照してください。

![アーキテクチャ](assets/architecture.png){zoomable="yes"}


このチュートリアルでは、Luma と呼ばれるサンプルアプリでの Platform Mobile SDKの実装について説明します。 Luma アプリには、現実的な実装を構築できる機能があります。 このチュートリアルを完了すると、独自のモバイルアプリでExperience Platform Mobile SDKを使用してすべてのマーケティングソリューションの実装を開始する準備が整います。

レッスンの目的は次のとおりです。

* iOS（Swift プログラミング言語と SwiftUI フレームワークを使用）
* Android（Kotlin、Java プログラミング言語、JetPack 作成フレームワークを使用）

このチュートリアルを完了すると、次の操作を実行できるようになります。

* 標準フィールドグループとカスタムフィールドグループを使用してスキーマを作成します。
* データストリームを設定します。
* モバイルタグプロパティを設定します。
* Experience Platform データセットを設定します（オプション）。
* アプリにタグ拡張機能をインストールして実装します。
* Experience Cloud パラメーターを [webview](web-views.md) に正しく渡す。
* [Adobe Experience Platform Assurance](assurance.md) を使用して実装を検証します。
* 次のAdobe Experience Cloud アプリケーションまたは拡張機能を追加します。
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
   * [ターゲット](target.md)


>[!NOTE]
>
>[Web SDK](../tutorial-web-sdk/overview.md) についても、同様のマルチソリューションチュートリアルを参照できます。

## 権限

これらのレッスンでは、Adobe ID と、演習を完了するために必要なユーザーレベルの権限があることを前提としています。 そうでない場合は、Adobe管理者に連絡してアクセスをリクエストしてください。

* データ収集には、次が必要です。
   * **[!UICONTROL Platforms]** – 権限項目 **[!UICONTROL モバイル]**
   * **[!UICONTROL プロパティ権限]** - **[!UICONTROL 開発]**、**[!UICONTROL 承認]**、**[!UICONTROL 公開]**、**[!UICONTROL 拡張機能の管理]**、**[!UICONTROL 環境の管理]** の権限項目。
   * **[!UICONTROL 会社権限]** - プロパティを管理するための権限項目 **[!UICONTROL 管理]**

     タグ権限について詳しくは、製品ドキュメントの [&#x200B; タグのユーザー権限 &#x200B;](https://experienceleague.adobe.com/en/docs/experience-platform/tags/admin/user-permissions){target="_blank"} を参照してください。
* Experience Platformには、以下が必要です。
   * **[!UICONTROL データモデリング]** - スキーマを管理および表示する権限項目。
   * **[!UICONTROL Identity Management]** - ID 名前空間を管理および表示する権限項目です。
   * **[!UICONTROL データ収集]** - データストリームを管理および表示する権限項目。

   * Real-Time CDP、Journey Optimizer、Customer Journey Analyticsなどの Platform ベースのアプリケーションのお客様で、関連するレッスンを予定している場合は、次のことも習得する必要があります。
      * **[!UICONTROL データ管理]** - データセットを管理および表示する権限項目。
      * このチュートリアルに使用できる開発 **サンドボックス**。

   * Journey Optimizerのレッスンでは、**プッシュ通知サービス** を設定し、**アプリサーフェス**、**ジャーニー**、**メッセージ** および **メッセージプリセット** を作成するための権限が必要です。 さらに、意思決定管理の場合は、「権限レベル **で説明されているように、** オファーを管理 **および** 決定 [&#x200B; のための適切な権限が必要 &#x200B;](https://experienceleague.adobe.com/en/docs/journey-optimizer/using/access-control/high-low-permissions) なります。

* Adobe Analyticsの場合、このチュートリアルを完了するために使用できる **レポートスイート** がわかっている必要があります。

* Adobe Targetの場合、アクティビティを作成してアクティブ化する権限が必要です。


>[!NOTE]
>
>このチュートリアルの一部として、スキーマ、データセット、ID などを作成します。 このチュートリアルを 1 つのサンドボックスで複数のユーザーが行う場合は、これらのオブジェクトを作成する際の命名規則の一部として、ID を追加または先頭に追加することを検討してください。 例えば、作成するように指示されたオブジェクトの名前に ` - <your name or initials>` を追加します。

## バージョン履歴

* 2025 年 9 月 9 日（PT）:
   * 手順が記載されたAndroid版のアプリ。
   * Journey Optimizerのアプリサーフェスとキャンペーン機能の変更に関する更新。
* 2023 年 11 月 29 日（PT）：新しいサンプルアプリと、アプリ内メッセージ、意思決定管理、Adobe Targetに関する新しいレッスンを含む大幅な見直し。
* 2022 年 3 月 9 日：初回公開

## Luma アプリのダウンロード

>[!BEGINTABS]

>[!TAB iOS]

2 つのバージョンのサンプルアプリをダウンロードできます。 どちらのバージョンも [GitHub](https://github.com/Adobe-Marketing-Cloud/Luma-iOS-Mobile-App) からダウンロードまたはクローン作成できます。 次の 2 つのフォルダーがあります。

1. [&#x200B; 開始 &#x200B;](https://github.com/Adobe-Marketing-Cloud/Luma-iOS-Mobile-App){target="_blank"}：このチュートリアルの実践的な演習を完了するために必要なExperience Platform Mobile SDK コードのほとんどに対して、コードを含まない、またはプレースホルダーコードを含むプロジェクト。
1. [&#x200B; 完了 &#x200B;](https://github.com/Adobe-Marketing-Cloud/Luma-iOS-Mobile-App){target="_blank"}：参照用に完全な実装を持つバージョン。

iOSをプラットフォーム、プログラミング言語、UI フレームワーク、統合開発環境（IDE） [!DNL Swift] して使用し [!DNL SwiftUI] す [!DNL Xcode]。 ただし、説明されている実装概念の多くは、他の開発プラットフォームでも似ています。 多くのユーザーは、このチュートリアルを既に正常に完了しており、以前のiOSと Swift （UI）の開発経験はほとんどありません。 レッスンを完了するために専門家である必要はありませんが、コードを快適に読んで理解できれば、レッスンからより多くを得ることができます。

製品化された最終的なバージョンのアプリは、App Storeからダウンロードできます。

[![&#x200B; ダウンロード &#x200B;](assets/download-app.svg)](https://apps.apple.com/us/app/luma-app/id6466588487)

>[!TAB Android]

2 つのバージョンのサンプルアプリをダウンロードできます。 どちらのバージョンも、[GitHub](https://github.com/adobe/Luma-Android) からダウンロードまたはクローン作成できます。 次の 2 つのフォルダーがあります。

1. [&#x200B; 開始 &#x200B;](https://github.com/adobe/Luma-Android){target="_blank"}：このチュートリアルの実践的な演習を完了するために必要なExperience Platform Mobile SDK コードのほとんどに対して、コードを含まない、またはプレースホルダーコードを含むプロジェクト。
1. [&#x200B; 完了 &#x200B;](https://github.com/adobe/Luma-Android){target="_blank"}：参照用に完全な実装を持つバージョン。

Androidをプラットフォーム、[!DNL Kotlin]+[!DNL Java] をプログラミング言語、[!DNL JetPack Compose] を UI フレームワーク、[!DNL Android Studio] を統合開発環境（IDE）として使用します。 ただし、説明されている実装概念の多くは、他の開発プラットフォームでも似ています。 多くのユーザーは、このチュートリアルを既に完了しており、以前のAndroid / Kotlin+Java / JetPack Compose の経験はほとんどありません。 レッスンを完了するために専門家である必要はありませんが、コードを快適に読んで理解できれば、レッスンからより多くを得ることができます。

必要に応じて、Google Playからアプリの [&#x200B; 製品化されたバージョンのテストに参加する &#x200B;](https://play.google.com/apps/internaltest/4700642199234438150) ことができます。


>[!ENDTABS]

それでは、始めましょう。

>[!SUCCESS]
>
>Adobe Experience Platform Mobile SDKの学習にご協力いただき、ありがとうございます。 ご不明な点がある場合や、一般的なフィードバックをお寄せになる場合、または今後のコンテンツに関するご提案がある場合は、この [Experience League Community Discussion の投稿 &#x200B;](https://experienceleaguecommunities.adobe.com/t5/adobe-experience-platform-data/tutorial-discussion-implement-adobe-experience-cloud-in-mobile/td-p/443796) でお知らせください。

次のトピック：**[XDM スキーマの作成](create-schema.md)**
