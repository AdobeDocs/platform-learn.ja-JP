---
title: 初期設定 | at.js 2.x から Web SDK への Target の移行
description: Platform Web SDK の実装に必要な、重要な基本的要素について説明し、設定します
source-git-commit: 287ebcb275c4fca574dbd6cdf7e07ba4268bddb5
workflow-type: tm+mt
source-wordcount: '277'
ht-degree: 2%

---

# データ収集の初期設定の実行

at.js から Platform Web SDK に移行する場合、Platform Web SDK の適切なデータキャプチャ、機能、機能を有効にするために、初期設定が必要です。 次の手順は、 [Platform Web SDK 実装チュートリアル](https://experienceleague.adobe.com/docs/platform-learn/implement-web-sdk/overview.html?lang=ja) は、web サイト実装の変更がおこなわれる前に、次の手順を実行する必要があります。

- [適切な権限の設定](https://experienceleague.adobe.com/docs/platform-learn/implement-web-sdk/initial-configuration/configure-permissions.html){target="_blank"} ( データ収集用Adobe Admin Console)
- [XDM スキーマの設定](https://experienceleague.adobe.com/docs/platform-learn/implement-web-sdk/initial-configuration/configure-schemas.html){target="_blank"} （構造化データを Edge ネットワークに渡す場合）
- [ID 名前空間の設定](https://experienceleague.adobe.com/docs/platform-learn/implement-web-sdk/initial-configuration/configure-identities.html){target="_blank"} クロスデバイスパーソナライゼーションと mbox3rdPartyId 機能の場合
- [データストリームの作成](https://experienceleague.adobe.com/docs/platform-learn/implement-web-sdk/initial-configuration/configure-datastream.html){target="_blank"} Edge Network からのデータの転送を有効にするには
- [データストリームの設定](https://experienceleague.adobe.com/docs/platform-learn/implement-web-sdk/applications-setup/setup-target.html#configure-the-datastream){target="_blank"} Adobe Targetへのデータ転送を有効にするには

>[!CAUTION]
>
>これらのデザイン面は、Target、Analytics およびAudience Managerの移行で調整する必要があります。

初期設定が完了したら、Adobe Experience Platform Edge Network を使用して Target 機能を有効にする必要があります。

次に、 [at.js ライブラリを置き換え、Platform Web SDK の基本的な実装を設定する](replace-library.md).

>[!NOTE]
>
>at.js から Web SDK への Target の移行を成功に導くための支援に努めています。 移行時に障害が発生した場合や、このガイドに重要な情報が欠落していると思われる場合は、 [このコミュニティディスカッション](https://experienceleaguecommunities.adobe.com/t5/adobe-experience-platform-data/tutorial-discussion-migrate-target-from-at-js-to-web-sdk/m-p/575587#M463).
