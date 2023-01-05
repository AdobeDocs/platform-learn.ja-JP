---
title: 初期設定 | at.js 2.x から Web SDK への Target の移行
description: Platform Web SDK の実装に必要な、重要な基本的要素について説明し、設定します
source-git-commit: dad7a1b01c4313d6409ce07d01a6520ed83f5e89
workflow-type: tm+mt
source-wordcount: '290'
ht-degree: 2%

---

# データ収集の初期設定の実行

at.js から Platform Web SDK に移行する場合、Platform Web SDK の適切なデータキャプチャ、機能、機能を有効にするために、初期設定が必要です。 次の手順は、 [Platform Web SDK 実装チュートリアル](https://experienceleague.adobe.com/docs/platform-learn/implement-web-sdk/overview.html?lang=ja) は、web サイト実装の変更がおこなわれる前に、次の手順を実行する必要があります。

- [適切な権限の設定](https://experienceleague.adobe.com/docs/platform-learn/implement-web-sdk/initial-configuration/configure-permissions.html)データ収集用のAdobe Admin Consoleの {target=&quot;_blank&quot;}
- [XDM スキーマの設定](https://experienceleague.adobe.com/docs/platform-learn/implement-web-sdk/initial-configuration/configure-schemas.html)構造化データを Edge ネットワークに渡すための {target=&quot;_blank&quot;}
- [ID 名前空間の設定](https://experienceleague.adobe.com/docs/platform-learn/implement-web-sdk/initial-configuration/configure-identities.html)クロスデバイスパーソナライゼーションと mbox3rdPartyId 機能の場合は {target=&quot;_blank&quot;}
- [データストリームの作成](https://experienceleague.adobe.com/docs/platform-learn/implement-web-sdk/initial-configuration/configure-datastream.html){target=&quot;_blank&quot;} :Edge ネットワークからのデータの転送を有効にします
- [データストリームの設定](https://experienceleague.adobe.com/docs/platform-learn/implement-web-sdk/applications-setup/setup-target.html#configure-the-datastream)Adobe Targetへのデータ転送を有効にする {target=&quot;_blank&quot;}

>[!CAUTION]
>
>Web SDK のこれらのデザイン面は、Target、Analytics、Audience Manager移行で調整する必要があります。

初期設定が完了したら、Adobe Experience Platform Edge Network を使用して Target 機能を有効にする必要があります。

次に、 [at.js ライブラリを置き換え、Platform Web SDK の基本的な実装を設定する](replace-library.md).

>[!NOTE]
>
>at.js から Web SDK への Target の移行を成功に導くための支援に努めています。 移行時に障害が発生した場合や、このガイドに重要な情報が欠落していると思われる場合は、 [このコミュニティディスカッション](https://experienceleaguecommunities.adobe.com/t5/adobe-experience-platform-launch/tutorial-discussion-implement-adobe-experience-cloud-with-web/td-p/444996).
