---
title: モバイルアプリでのAdobe Experience Cloudの実装チュートリアルの概要
description: Adobe Experience Cloudモバイルアプリケーションの実装方法を説明します。 このチュートリアルでは、サンプルの Swift アプリケーションでExperience Cloudアプリケーションを実装する手順を説明します。
recommendations: noDisplay,catalog
last-substantial-update: 2023-11-29T00:00:00Z
exl-id: daff4214-d515-4fad-a224-f7589b685b55
source-git-commit: 4bd8d0cdcf9c5d29434de4968a048fd46e163b54
workflow-type: tm+mt
source-wordcount: '844'
ht-degree: 6%

---

# モバイルアプリでの Adobe Experience Cloud の実装のチュートリアル

Adobe Experience Platform Mobile SDK を使用して、モバイルアプリに Adobe Experience Cloud アプリケーションを実装する方法を説明します。

Experience Platformモバイル SDK は、Adobe Experience Cloudのお客様がAdobe Experience Platform Edge Network を通じてAdobeアプリケーションとサードパーティのサービスの両方を操作できるようにする、クライアントサイド SDK です。 詳しくは、 [Adobe Experience Platform Mobile SDK ドキュメント](https://developer.adobe.com/client-sdks/home/) を参照してください。

![アーキテクチャ](assets/architecture.png)


このチュートリアルでは、Luma と呼ばれるサンプル小売アプリケーションで Platform Mobile SDK を実装する手順を説明します。 The [Luma アプリ](https://github.com/Adobe-Marketing-Cloud/Luma-iOS-Mobile-App) には、現実的な実装を構築できる機能があります。 このチュートリアルを完了すると、すべてのマーケティングソリューションを、Experience Platformのモバイルアプリで Mobile SDK を通じて実装する準備が整います。

このレッスンはiOS向けに設計され、Swift/SwiftUI で記述されていますが、概念の多くは Android™にも当てはまります。

このチュートリアルでは、次の内容について学習します。

* 標準フィールドグループとカスタムフィールドグループを使用してスキーマを作成します。
* データストリームの設定.
* モバイルタグプロパティを設定します。
* Experience Platformデータセットを設定します（オプション）。
* アプリにタグ拡張機能をインストールして実装します。
* にExperience Cloudパラメーターを正しく渡す [webview](web-views.md).
* を使用して実装を検証する [Adobe Experience Platform Assurance](assurance.md).
* 次のAdobe Experience Cloudアプリケーション/拡張機能を追加します。
   * [Adobe Experience Platform Edge (XDM)](events.md)
   * [ライフサイクルデータの収集](lifecycle-data.md)
   * [同意](consent.md)
   * [ID](identity.md)
   * [プロファイル](profile.md)
   * [Places](places.md)
   * [Analytics](analytics.md)
   * [Experience Platform](platform.md)
   * [Journey Optimizerを使用したプッシュメッセージ](journey-optimizer-push.md)
   * [Journey Optimizerを使用したアプリ内メッセージ](journey-optimizer-inapp.md)
   * [Journey Optimizerを使用した決定管理](journey-optimizer-offers.md)
   * [Target](target.md)


>[!NOTE]
>
>同様のマルチソリューションチュートリアルを、 [Web SDK](../tutorial-web-sdk/overview.md).

## 前提条件

このレッスンでは、練習を完了するために必要なAdobeID とユーザーレベルの権限があることを前提としています。 アクセスできない場合は、Adobe管理者に問い合わせて、アクセス権を要求する必要があります。

* データ収集には、以下が必要です。
   * **[!UICONTROL プラットフォーム]** — 権限項目 **[!UICONTROL モバイル]**
   * **[!UICONTROL プロパティ権限]** — 許可する項目 **[!UICONTROL 開発]**, **[!UICONTROL 承認]**, **[!UICONTROL 公開]**, **[!UICONTROL 拡張機能の管理]**、および **[!UICONTROL 環境の管理]**.
   * **[!UICONTROL 会社権限]** — 許可する項目 **[!UICONTROL プロパティを管理]** また、オプションのプッシュメッセージレッスンを完了している場合は、 **[!UICONTROL アプリ設定を管理]**

     タグ権限について詳しくは、 [タグのユーザー権限](https://experienceleague.adobe.com/docs/experience-platform/tags/admin/user-permissions.html?lang=ja){target="_blank"} （製品ドキュメント内）。
* Experience Platformでは、次が必要です。
   * **[!UICONTROL データモデリング]** — スキーマを管理および表示する権限項目です。
   * **[!UICONTROL Identity Management]**—id 名前空間を管理および表示する権限項目です。
   * **[!UICONTROL データ収集]** — データストリームを管理および表示する権限項目。

   * Real-Time CDP、Journey Optimizer、Customer Journey Analyticsなどの Platform ベースのアプリケーションをご利用のお客様は、次の関連レッスンをおこなう必要があります。
      * **[!UICONTROL データ管理]** — データセットを管理および表示する権限項目。
      * 開発 **sandbox** このチュートリアルで使用できる

   * Journey Optimizerのレッスンでは、 **プッシュ通知サービス** およびを作成するには、以下を実行します。 **アプリ表面**, a **ジャーニー**, a **メッセージ**、および **メッセージプリセット**. 決定管理では、次の操作をおこなうための適切な権限が必要です。 **オファーを管理** および **決定** 説明に従って [ここ](https://experienceleague.adobe.com/docs/journey-optimizer/using/access-control/privacy/high-low-permissions.html?lang=en#decisions-permissions).

* Adobe Analyticsの場合は、どちらかを知っておく必要があります。 **レポートスイート** を使用して、このチュートリアルを完了できます。

* Adobe Targetの場合、アクティビティを作成およびアクティブ化する権限が必要です。


>[!NOTE]
>
>このチュートリアルの一部として、スキーマ、データセット、ID などを作成します。 複数のユーザーが単一のサンドボックスでこのチュートリアルを実行する場合は、これらのオブジェクトを作成する際に、命名規則の一部として識別を追加するか、事前に付加することを検討してください。 例えば、 ` - <your name or initials>` を、作成するように指示されるオブジェクトの名前に追加します。

## バージョン履歴

* 2023 年 11 月 29 日：新しいサンプルアプリと、アプリ内メッセージ、決定管理、Adobe Targetに関する新しいレッスンによる大規模な見直し。
* 2022 年 3 月 9 日：初回公開

## Luma アプリケーションのダウンロード

サンプルアプリケーションの 2 つのバージョンをダウンロードできます。 両方のバージョンをダウンロード/複製できます [Github](https://github.com/Adobe-Marketing-Cloud/Luma-iOS-Mobile-App). 次の 2 つのフォルダーがあります。


1. [開始](https://github.com/Adobe-Marketing-Cloud/Luma-iOS-Mobile-App){target="_blank"}：このチュートリアルで実践的な演習を完了するために必要な、Experience PlatformMobile SDK コードのほとんどに対して、コードがない、またはプレースホルダーコードが付いたプロジェクトです。
1. [完了](https://github.com/Adobe-Marketing-Cloud/Luma-iOS-Mobile-App){target="_blank"}：参照用に完全な実装を含むバージョン。


>[!NOTE]
>
>プラットフォームとしてiOSを使用し、 [!DNL Swift] プログラミング言語として [!DNL SwiftUI] UI フレームワークとして、および [!DNL Xcode] を統合開発環境 (IDE) として使用する。 ただし、説明されている実装概念の多くは、他の開発プラットフォームと同様です。 多くのユーザーは、以前のiOS/Swift(UI) 操作をほとんどあるいはまったく使用せずに、既にこのチュートリアルを完了しています。 コードを快適に読んで理解できれば、レッスンを完了するのに専門家である必要はありませんが、レッスンを最大限活用することができます。


それでは、始めましょう。

>[!SUCCESS]
>
>Adobe Experience Platform Mobile SDK の学習に時間を割いていただき、ありがとうございます。 ご質問がある場合、一般的なフィードバックを共有する場合、または今後のコンテンツに関する提案がある場合は、このドキュメントで共有します [Experience Leagueコミュニティディスカッション投稿](https://experienceleaguecommunities.adobe.com/t5/adobe-experience-platform-data/tutorial-discussion-implement-adobe-experience-cloud-in-mobile/td-p/443796).

次へ： **[XDM スキーマの作成](create-schema.md)**
