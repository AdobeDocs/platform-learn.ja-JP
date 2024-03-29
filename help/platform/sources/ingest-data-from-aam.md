---
title: Adobe Audience Manager Data Connector を使用したデータの取り込み
description: Audience Managerデータコネクタを使用して、特性とセグメントをAAMから Platform に取り込み、他のリッチデータと組み合わせる方法を説明します。
feature: Sources
topic: Integrations
badgeIntegration: label="統合" type="positive"
role: Data Engineer, Data Architect, Developer
level: Intermediate
thumbnail: 331214.jpg
jira: KT-7111
exl-id: 43688e44-c0ea-4107-ba74-1e630990f732
source-git-commit: 00ef0f40fb3d82f0c06428a35c0e402f46ab6774
workflow-type: tm+mt
source-wordcount: '286'
ht-degree: 5%

---

# Adobe Audience Manager Data Connector を使用したデータの取り込み

この統合ビデオでは、Audience Managerデータコネクタを使用して、AAMから特性とセグメントを Platform に取り込み、他のリッチデータと組み合わせる方法を説明します。 詳しくは、 [Audience Managerソースコネクタのドキュメント](https://experienceleague.adobe.com/docs/experience-platform/sources/connectors/adobe-applications/audience-manager.html?lang=ja).

>[!VIDEO](https://video.tv.adobe.com/v/331214/?learn=on)

プロセスと人員をAdobe Audience ManagerからReal-time Customer Data Platform(Real-Time CDP) に移行するように再設定する際に、Audience Managerデータコネクタを使用して、AAMの特性とセグメントを Platform に取り込み、他のリッチデータ（PII を含む）と組み合わせて、宛先パートナーに送信できます。 このビデオでは、Real-Time CDP用AAM Data Connector の設定手順を説明します。

>[!WARNING]
>
>上記のビデオでは、すべてのセグメントまたは特性を選択するオプションが表示されています。 セグメントの数がわかっているセグメントの数に制限がある場合を除き、このオプションは使用しないことをお勧めします。 多数の訪問者プロファイルを「すべてのセグメント」または「すべての特性」で取り込むと、Real-Time CDPのプロファイルサービスが膨らむ可能性があり、アプリケーションの価格に大きな影響を与える可能性があります（プロファイルの数はアプリケーションのコストに影響するため）。 したがって、「すべて」を選択する代わりに、Real-Time CDPに引き継ぐ特定のセグメントを選択することをお勧めします。
>
>ご覧ください [2022 年 4 月 28 日Experience LeagueLIVE](https://experienceleague.adobe.com/docs/experience-league-live-events/events/episodes/exl-live-episode-04-28-22.html?lang=ja) ここでは、この点について詳しく説明します。
