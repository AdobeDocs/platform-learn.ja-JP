---
title: 初期設定 | Target を at.js 2.x から Web SDK に移行
description: Platform Web SDK の実装に必要な重要な基本要素の説明と設定
exl-id: dbf9683b-1cfc-474a-9c38-432cad4d1533
source-git-commit: 2182441d992aec0602d0955d78aa85407bd770c9
workflow-type: tm+mt
source-wordcount: '234'
ht-degree: 0%

---

# データ収集の初期設定の実行

at.js から Platform Web SDK に移行するには、Platform Web SDK の適切なデータ取得、機能、機能を有効にするための初期設定が必要です。 Web サイトの実装変更を行う前に、[Platform Web SDK の実装チュートリアル ](https://experienceleague.adobe.com/docs/platform-learn/implement-web-sdk/overview.html?lang=ja) の次の手順を完了する必要があります。

- Adobe Admin Console for Data Collection での [ 適切な権限の設定 ](https://experienceleague.adobe.com/en/docs/platform-learn/implement-web-sdk/overview#prerequisites){target="_blank"}
- 構造化データをEdge Networkに渡すための [XDM スキーマの設定 ](https://experienceleague.adobe.com/docs/platform-learn/implement-web-sdk/initial-configuration/configure-schemas.html){target="_blank"}
- クロスデバイスパーソナライゼーションと mbox3rdPartyId 機能のための [ID 名前空間の設定 ](https://experienceleague.adobe.com/docs/platform-learn/implement-web-sdk/initial-configuration/configure-identities.html){target="_blank"}
- [ データストリームを作成 ](https://experienceleague.adobe.com/docs/platform-learn/implement-web-sdk/initial-configuration/configure-datastream.html){target="_blank"} して、Edge Networkからのデータの転送を有効にします。
- [ データストリームを設定 ](https://experienceleague.adobe.com/docs/platform-learn/implement-web-sdk/applications-setup/setup-target.html#configure-the-datastream){target="_blank"} して、Adobe Targetへのデータの転送を有効にします。

>[!CAUTION]
>
>これらの設計の側面は、Target、Analytics およびAudience Managerの移行全体で調整する必要があります。

初期設定が完了したら、Adobe Experience Platform Edge Networkを使用して Target 機能を有効にする必要があります。

次に、at.js ライブラリの置き換え [ と、基本的な Platform Web SDK の実装のセットアップ ](replace-library.md) 方法を説明します。

>[!NOTE]
>
>アドビは、at.js から Web SDK への Target の移行を成功させるために取り組んでいます。 移行の際に問題が発生した場合、またはこのガイドに重要な情報が欠落していると感じる場合は、[ このコミュニティのディスカッション ](https://experienceleaguecommunities.adobe.com/t5/adobe-experience-platform-data/tutorial-discussion-migrate-target-from-at-js-to-web-sdk/m-p/575587#M463) に投稿してお知らせください。
