---
title: モバイルアプリでのAdobe Experience Cloudの実装チュートリアルの概要
description: Adobe Experience Cloudモバイルアプリケーションの実装方法を説明します。 このチュートリアルでは、サンプルの Swift アプリケーションでExperience Cloudアプリケーションを実装する手順を説明します。
recommendation: noDisplay,catalog
exl-id: daff4214-d515-4fad-a224-f7589b685b55
source-git-commit: cf0193e3aae4d6536c868f078f4773ee14e90408
workflow-type: tm+mt
source-wordcount: '648'
ht-degree: 10%

---

# モバイルアプリでの Adobe Experience Cloud の実装のチュートリアル

Adobe Experience Platform Mobile SDK を使用して、モバイルアプリに Adobe Experience Cloud アプリケーションを実装する方法を説明します。

Experience Platformモバイル SDK は、Adobe Experience Cloudのお客様がAdobe Experience Platform Edge Network を通じてAdobeアプリケーションとサードパーティのサービスの両方を操作できるようにする、クライアントサイド SDK です。 詳しくは、 [Adobe Experience Platform Mobile SDK ドキュメント](https://aep-sdks.gitbook.io/docs/) を参照してください。

![ビルド設定](assets/data-collection-mobile-sdk.png)


このチュートリアルでは、Luma と呼ばれるサンプル小売アプリケーションで Platform Mobile SDK を実装する手順を説明します。 この [Luma アプリ](https://github.com/Adobe-Marketing-Cloud/Luma-iOS-Mobile-App) には、現実的な実装を構築できる機能があります。 このチュートリアルを完了すると、すべてのマーケティングソリューションを、Platform Mobile SDK を通じて独自のモバイルアプリに実装する準備が整います。

このレッスンはiOS向けに設計され、Swift で記述されていますが、概念の多くは Android™にも当てはまります。

このチュートリアルでは、次の内容について学習します。

* 標準フィールドグループとカスタムフィールドグループを使用してスキーマを作成します。
* データストリームを設定します。
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
* にExperience Cloudパラメーターを正しく渡す [webview](web-views.md).
* を使用して実装を検証する [Adobe Experience Platform Assurance](assurance.md).

>[!NOTE]
>
>同様のマルチソリューションチュートリアルを [Web SDK](../tutorial-web-sdk/overview.md).

## 前提条件

このレッスンでは、練習を完了するために必要な Adobe ID と権限があることを前提としています。アクセスできない場合は、Adobe管理者に問い合わせて、アクセス権を要求する必要があります。

* データ収集には、以下が必要です。
   * **[!UICONTROL プラットフォーム]** — 権限項目 **[!UICONTROL モバイル]**
   * **[!UICONTROL プロパティ権限]** — 許可する項目 **[!UICONTROL 開発]**, **[!UICONTROL 承認]**, **[!UICONTROL 公開]**, **[!UICONTROL 拡張機能の管理]**、および **[!UICONTROL 環境の管理]**.
   * **[!UICONTROL 会社権限]** — 許可する項目 **[!UICONTROL プロパティを管理]** また、オプションのプッシュメッセージレッスンを完了している場合、 **[!UICONTROL アプリ設定を管理]**

      タグ権限について詳しくは、 [タグのユーザー権限](https://experienceleague.adobe.com/docs/experience-platform/tags/admin/user-permissions.html?lang=ja){target=&quot;_blank&quot;} を参照してください。
* Experience Platformでは、次が必要です。
   * **[!UICONTROL データモデリング]** — スキーマを管理および表示する権限項目です。
   * **[!UICONTROL Identity Management]**—id 名前空間を管理および表示する権限項目です。
   * **[!UICONTROL データ収集]** — データストリームを管理および表示する権限項目。

   * Real-Time CDP、Journey Optimizer、Customer Journey Analyticsなどの Platform ベースのアプリケーションを使用している場合は、次のこともおこなう必要があります。
      * **[!UICONTROL データ管理]** — データセットを管理および表示して完了する権限項目 _オプションの Platform 演習_ （ Platform ベースのアプリケーションのライセンスが必要です）。
      * 開発 **サンドボックス** このチュートリアルで使用できる
* Adobe Analyticsの場合は、どちらかを知っておく必要があります **レポートスイート** を使用して、このチュートリアルを完了できます。

すべてのExperience Cloudのお客様は、Mobile SDK のデプロイに必要な機能にアクセスできる必要があります。

また、あなたが～に詳しいと想定されています [!DNL Swift]. レッスンを完了するのに専門家である必要はありませんが、コードを快適に読んで理解できれば、レッスンを最大限に活用することができます。

## Luma アプリケーションのダウンロード

サンプルアプリケーションの 2 つのバージョンをダウンロードできます。

1. [空](https://github.com/Adobe-Marketing-Cloud/Luma-iOS-Mobile-App){target=&quot;_blank&quot;} — このチュートリアルの実践演習を完了するためのExperience Cloudコードのないバージョン
1. [完全実装済み](https://github.com/Adobe-Marketing-Cloud/Luma-iOS-Mobile-App){target=&quot;_blank&quot;} — 参照用に完全なExperience Cloud実装を含むバージョン。

それでは、始めましょう。


次へ： **[XDM スキーマの作成](create-schema.md)**

>[!NOTE]
>
>Adobe Experience Platform Mobile SDK の学習に時間を割いていただき、ありがとうございます。 ご質問がある場合、一般的なフィードバックを共有したい場合、または今後のコンテンツに関する提案がある場合は、こちらで共有してください [Experience Leagueコミュニティディスカッション投稿](https://experienceleaguecommunities.adobe.com/t5/adobe-experience-platform-launch/tutorial-discussion-implement-adobe-experience-cloud-in-mobile/td-p/443796)