---
title: モバイルアプリでのAdobe Experience Cloudの実装チュートリアルの概要
description: Adobe Experience Cloudモバイルアプリケーションの実装方法を説明します。 このチュートリアルでは、サンプルの Swift アプリケーションでExperience Cloudアプリケーションを実装する手順を説明します。
recommendations: noDisplay,catalog
hide: true
source-git-commit: 4101425bd97e271fa6cc15157a7be435c034e764
workflow-type: tm+mt
source-wordcount: '659'
ht-degree: 11%

---

# モバイルアプリでの Adobe Experience Cloud の実装のチュートリアル

Adobe Experience Platform Mobile SDK を使用して、モバイルアプリに Adobe Experience Cloud アプリケーションを実装する方法を説明します。

Experience Platformモバイル SDK は、Adobe Experience Cloudのお客様がAdobe Experience Platform Edge Network を通じてAdobeアプリケーションとサードパーティのサービスの両方を操作できるようにする、クライアントサイド SDK です。 詳しくは、 [Adobe Experience Platform Mobile SDK ドキュメント](https://developer.adobe.com/client-sdks/documentation/) を参照してください。

![ビルド設定](assets/data-collection-mobile-sdk.png)


このチュートリアルでは、Luma と呼ばれるサンプル小売アプリケーションで Platform Mobile SDK を実装する手順を説明します。 The [Luma アプリ](https://github.com/Adobe-Marketing-Cloud/Luma-iOS-Mobile-App) には、現実的な実装を構築できる機能があります。 このチュートリアルを完了すると、すべてのマーケティングソリューションを、Experience Platformのモバイルアプリで Mobile SDK を通じて実装する準備が整います。

このレッスンはiOS向けに設計され、Swift/SwiftUI で記述されていますが、概念の多くは Android™にも当てはまります。

このチュートリアルでは、次の内容について学習します。

* 標準フィールドグループとカスタムフィールドグループを使用してスキーマを作成します。
* データストリームの設定.
* モバイルタグプロパティを設定します。
* Experience Platformデータセットを設定します（オプション）。
* アプリにタグ拡張機能をインストールして実装します。
* 次のAdobe Experience Cloudアプリケーション/拡張機能を追加します。
   * [Adobe Experience Platform Edge (XDM)](events.md)
   * [ライフサイクルデータの収集](lifecycle-data.md)
   * [XDM 経由のAdobe Analytics](analytics.md)
   * [同意](consent.md)
   * [ID](identity.md)
   * [プロファイル](profile.md)
   * [Adobe Experience Platform](platform.md)
   * [Journey Optimizerを使用したプッシュメッセージ](journey-optimizer-push.md)
   * [Journey Optimizerを使用した Im-app メッセージ](journey-optimizer-inapp.md)
   * [Journey Optimizerとのオファー](journey-optimizer-offers.md)
   * [Target での A/B テスト](target.md)

* にExperience Cloudパラメーターを正しく渡す [webview](web-views.md).
* を使用して実装を検証する [Adobe Experience Platform Assurance](assurance.md).

>[!NOTE]
>
>同様のマルチソリューションチュートリアルを、 [Web SDK](../tutorial-web-sdk/overview.md).

## 前提条件

このレッスンでは、練習を完了するために必要な Adobe ID と権限があることを前提としています。アクセスできない場合は、Adobe管理者に問い合わせて、アクセス権を要求する必要があります。

* データ収集には、以下が必要です。
   * **[!UICONTROL プラットフォーム]** — 権限項目 **[!UICONTROL モバイル]**
   * **[!UICONTROL プロパティ権限]** — 許可する項目 **[!UICONTROL 開発]**, **[!UICONTROL 承認]**, **[!UICONTROL 公開]**, **[!UICONTROL 拡張機能の管理]**、および **[!UICONTROL 環境の管理]**.
   * **[!UICONTROL 会社権限]** — 許可する項目 **[!UICONTROL プロパティを管理]** また、オプションのプッシュメッセージレッスンを完了している場合は、 **[!UICONTROL アプリ設定を管理]**

     タグ権限について詳しくは、 [タグのユーザー権限](https://experienceleague.adobe.com/docs/experience-platform/tags/admin/user-permissions.html?lang=ja){target="_blank"} （製品ドキュメント内）。
* Experience Platformでは、次が必要です。
   * **[!UICONTROL データモデリング]** — スキーマを管理および表示する権限項目です。
   * **[!UICONTROL Identity Management]**—id 名前空間を管理および表示する権限項目です。
   * **[!UICONTROL データ収集]** — データストリームを管理および表示する権限項目。

   * Real-Time CDP、Journey Optimizer、Customer Journey Analyticsなどの Platform ベースのアプリケーションを使用している場合は、次のこともおこなう必要があります。
      * **[!UICONTROL データ管理]** — データセットを管理および表示して完了する権限項目 _オプションの Platform の演習_ （ Platform ベースのアプリケーションのライセンスが必要です）。
      * 開発 **sandbox** このチュートリアルで使用できる
* Adobe Analyticsの場合は、どちらかを知っておく必要があります。 **レポートスイート** を使用して、このチュートリアルを完了できます。

すべてのExperience Cloudのお客様は、Mobile SDK のデプロイに必要な機能にアクセスできる必要があります。

また、あなたが～に詳しいと想定されています。 [!DNL Swift]. コードを快適に読んで理解できれば、レッスンを完了するのに専門家である必要はありませんが、レッスンを最大限活用することができます。

## Luma アプリケーションのダウンロード

サンプルアプリケーションの 2 つのバージョンをダウンロードできます。

1. [空](https://git.corp.adobe.com/rmaur/Luma{target="_blank"})：このチュートリアルの実践的な演習を完了するためのExperience Cloudコードのないバージョン。
1. [完全実装済み](https://git.corp.adobe.com/Luma{target="_blank"})：参照用に完全なExperience Cloud実装を含むバージョン。

それでは、始めましょう。

>[!SUCCESS]
>
>Adobe Experience Platform Mobile SDK の学習に時間を割いていただき、ありがとうございます。 ご質問がある場合、一般的なフィードバックを共有する場合、または今後のコンテンツに関する提案がある場合は、このドキュメントで共有します [Experience Leagueコミュニティディスカッション投稿](https://experienceleaguecommunities.adobe.com/t5/adobe-experience-platform-launch/tutorial-discussion-implement-adobe-experience-cloud-in-mobile/td-p/443796).

次へ： **[XDM スキーマの作成](create-schema.md)**.
