---
title: 1.1 Adobe Experience Platform Data Collection と Web SDK拡張機能のセットアップ
description: Foundation - Adobe Experience Platform Data Collection と Web SDK拡張機能の設定
kt: 5342
doc-type: tutorial
exl-id: b69ebe41-ff28-4dde-b639-198201120742
source-git-commit: 1526661a80b4d551627dfca42a7e97c9498dd1f2
workflow-type: tm+mt
source-wordcount: '591'
ht-degree: 1%

---

# 1.1 Foundation - Adobe Experience Platform Data Collection と Web SDK タグ拡張機能のセットアップ

この基本モジュールでは、Adobeのデータ収集のビジョンを示し、web サイトやモバイルアプリケーションから、Adobe Experience Platform データ収集、Adobe Experience Platform SDK およびAdobe Experience Platform Edge Networkを使用してAdobe Experience Platformや他のアプリケーションにデータを取得する方法について説明します。

ここでは、Adobe Experience Platformのテクニカルチュートリアルの範囲外にも影響を与える概念およびテクノロジーをいくつか紹介します。 これらの演習のどの部分が残りの包括的なチュートリアルの基盤となるのかは明確にしてください。これは、Edge Networkとその能力に関する詳細と、さらなる情報とチュートリアルの参照先を示しています。

## 学習内容

- ブランドがAdobe Experience Platform Data Collection をTag Management System （TMS）として使用する方法を説明します。
- Adobeがブランド製品にデータを取り込むために使用するデータフローを説明します。
- Adobe Experience Platform Edge Networkを介してAdobe Experience Platformや他の製品にデータを送信する方法を説明します。
- Web およびモバイルからデータを収集するデータ要素およびルールを作成する方法を説明します。
- [Web SDK](https://experienceleague.adobe.com/ja/docs/experience-platform/web-sdk/home) トラッキングイベントとそのコンテンツのデバッグ方法について説明します。
- データレイヤーとは何か、およびデータレイヤーを実装する際にAdobeが推奨するものを説明します。
- [Web SDK](https://experienceleague.adobe.com/ja/docs/experience-platform/web-sdk/home) を最初から実装する手順を説明します。
- Web 実装とモバイル実装の違いを説明します。

## 前提条件

- Adobe Experience Platformへのアクセス：[https://experience.adobe.com/platform](https://experience.adobe.com/platform)
- Adobe Experience Platform Data Collection へのアクセス：[https://experience.adobe.com/#/data-collection/](https://experience.adobe.com/#/data-collection/)
- デモ Web サイトへのアクセス

>[!NOTE]
>
>Experience LeagueドキュメントのChrome拡張機能のインストール [&#x200B; で参照されているように、Chrome拡張機能をインストール、設定および使用することを忘れないでください &#x200B;](../../gettingstarted/gettingstarted/ex1.md)

## 演習

[1.1.1 Adobe Experience Platformのデータ収集について](./ex1.md)

この演習では、Adobe Experience Platform Data Collection UI を探索し、その機能を理解します。

[1.1.2 Edge Network、データストリーム、およびサーバサイドのデータ収集](./ex2.md)

この演習では、Adobe Experience Platform Data Collection インターフェイスでAdobe製品にデータを転送する方法と、デモ Web サイトで使用されるデータストリームを調査する方法について説明します。

[1.1.3 Adobe Experience Platform Data Collection の概要](./ex3.md)

この演習では、拡張機能を設定し、データ要素とルールを作成して、web に公開する方法について説明します。

[1.1.4 クライアント側のウェブデータ収集](./ex4.md)

この演習では、インストールされている web SDKをデバッグし、その仕組みと、今後の演習で使用するデータを理解します。

[1.1.5 Adobe AnalyticsとAdobe Audience Managerの実装](./ex5.md)

この演習では、Adobe AnalyticsおよびAdobe Audience Managerの Web SDKで収集された web データを参照して使用します。

[1.1.6 Adobe Targetの実装](./ex6.md)

この演習では、Adobe Targetでアクティビティを設定し、web SDKを使用して実装します。

[1.1.7 Adobe Experience Platformにおける XDM スキーマの要件](./ex7.md)

Web SDKでAdobe Experience Platformにデータを確実に取り込めるようにするには、特定の XDM mixin がAdobe Experience Platformの XDM スキーマに含まれる必要があります。

[概要と利点](./summary.md)

このモジュールの概要とメリットの概要

![&#x200B; 技術インサイダー &#x200B;](./../../../assets/images/techinsiders.png){width="50px" align="left"}

>[!NOTE]
>
>Adobe Experience Platformとそのアプリケーションについて知るのに時間を費やしていただき、ありがとうございます。 ご不明な点がある場合は、have suggestions on future content の一般的なフィードバックをお知らせください。**techinsiders@adobe.com** に電子メールを送信して、技術インサイダーに直接問い合わせてください。

[すべてのモジュールに戻る](../../../overview.md)
