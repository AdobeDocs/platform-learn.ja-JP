---
title: 初期設定 – Adobe TargetからAdobe Journey Optimizer - Decisioning モバイル拡張機能への移行
description: Platform Web SDKの実装に必要な重要な基本要素について説明し、設定します
exl-id: dfc5abc8-0e79-454a-b1bb-6a42b1219771
source-git-commit: f3fd5f45412900dcb871bc0b346ce89108fa8913
workflow-type: tm+mt
source-wordcount: '294'
ht-degree: 5%

---

# データ収集の初期設定の実行

Target SDKから Optimize SDKに移行するには、Optimize SDKの適切なデータ取得、機能、機能を有効にするための初期設定が必要です。 Web サイトの実装変更を行うには、次の手順を実行する必要があります。

- Adobe Admin Console for Data Collection での [ 適切な権限の設定 ](https://experienceleague.adobe.com/en/docs/platform-learn/implement-web-sdk/overview#prerequisites){target="_blank"}
- 構造化データをEdge Networkに渡すための [XDM スキーマの設定 ](https://experienceleague.adobe.com/en/docs/platform-learn/implement-mobile-sdk/initial-configuration/create-schema){target="_blank"}
- Adobe Target データを受け取るための [ スキーマの設定 ](https://experienceleague.adobe.com/en/docs/platform-learn/implement-mobile-sdk/experience-cloud/target#update-your-schema)
- クロスデバイスパーソナライゼーションと mbox3rdPartyId 機能のための [ID 名前空間の設定 ](https://experienceleague.adobe.com/en/docs/platform-learn/implement-mobile-sdk/app-implementation/identity#set-up-a-custom-identity-namespace){target="_blank"}
- [ データストリームを作成 ](https://experienceleague.adobe.com/en/docs/platform-learn/implement-mobile-sdk/initial-configuration/create-datastream){target="_blank"} して、Edge Networkからのデータの転送を有効にします。
- [ データストリームを設定 ](https://experienceleague.adobe.com/en/docs/platform-learn/implement-mobile-sdk/experience-cloud/target#update-datastream-configuration){target="_blank"} して、Adobe Targetへのデータの転送を有効にします。
- Decisioning 拡張機能の [ タグプロパティの設定 ](https://experienceleague.adobe.com/en/docs/platform-learn/implement-mobile-sdk/experience-cloud/target#install-adobe-journey-optimizer---decisioning-tags-extension)

>[!BEGINTABS]

>[!TAB Target 拡張機能 ]

Target 拡張機能を使用するとインストールされるタグ拡張機能：

1. Mobile Core
1. プロファイル
1. Adobe Target
1. Adobe Analytics（Adobe Target アクティビティのレポートソースとしてAdobe Analyticsを使用する場合はオプション）

![Target 拡張機能の使用時にインストールされるタグ拡張機能 ](assets/tag-extensions-target.png)


>[!TAB Decisioning 拡張機能 ]

Decisioning 拡張機能を使用するとインストールされるタグ拡張機能：

1. Mobile Core
1. プロファイル
1. 同意
1. ID
1. Adobe Experience Platform Edge Network
1. Adobe Journey Optimizer - Decisioning
1. AEP Assurance（オプション、デバッグに必要）

![Decisioning 拡張機能を使用する場合にインストールされるタグ拡張機能 ](assets/tag-extensions-decisioning.png)


>[!ENDTABS]

次に、at.js ライブラリを置き換えて [ 基本的な Platform web SDKの実装をセットアップ ](replace-library.md) する方法について説明します。

>[!NOTE]
>
>アドビは、Target 拡張機能から Decisioning 拡張機能への Mobile Target の移行を成功させるために取り組んでいます。 移行の際に問題が発生した場合、またはこのガイドに重要な情報が欠落していると感じる場合は、[ このコミュニティのディスカッション ](https://experienceleaguecommunities.adobe.com/t5/adobe-experience-platform-data/tutorial-discussion-migrate-target-from-at-js-to-web-sdk/m-p/575587#M463) に投稿してお知らせください。
