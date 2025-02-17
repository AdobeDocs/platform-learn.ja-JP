---
title: 1.1 Adobe Experience Platform Data Collection と Web SDK拡張機能のセットアップ
description: Foundation - Adobe Experience Platform Data Collection と Web SDK拡張機能の設定
kt: 5342
doc-type: tutorial
exl-id: 8c613648-9007-49fb-898f-039c366297da
source-git-commit: 3d61d91111d8693ab031fbd7b26706c02818108c
workflow-type: tm+mt
source-wordcount: '590'
ht-degree: 1%

---

# 1.1 Adobe Experience Platform Data Collection と Web SDK Tag Extension のセットアップ

この基本モジュールでは、Adobeのデータ収集のビジョンを紹介し、web サイトやモバイルアプリケーションから、Adobe Experience Platform Data Collection、Adobe Experience Platform SDK およびAdobe Experience Platform Edge Networkを使用してAdobe Experience Platformや他のアプリケーションにデータを取得する方法について説明します。

ここでは、Adobe Experience Platformのテクニカルチュートリアルの範囲外にも影響を与える概念およびテクノロジーをいくつか紹介します。 これらの演習の残りの部分の基礎となるのはどの部分かをはっきりと示しておく必要があります。これは、Edge Networkとその機能の詳細と、さらなる情報とチュートリアルの参照先を示しています。

## 学習内容

- ブランドがAdobe Experience Platform Data Collection をTag Management System （TMS）として使用する方法を説明します。
- ブランドがAdobe製品にデータを取り込むために使用するデータフローについて説明します。
- Adobe Experience Platform Edge Networkを介してAdobe Experience Platformや他の製品にデータを送信する方法について説明します。
- Web およびモバイルからデータを収集するデータ要素およびルールを作成する方法を説明します。
- [Web SDK](https://experienceleague.adobe.com/ja/docs/experience-platform/web-sdk/home) トラッキングイベントとそのコンテンツのデバッグ方法について説明します。
- データレイヤーとは何か、およびデータレイヤーを実装する際にAdobeが推奨することを説明します。
- [Web SDK](https://experienceleague.adobe.com/ja/docs/experience-platform/web-sdk/home) を最初から実装する手順を説明します。
- Web 実装とモバイル実装の違いを説明します。

## 前提条件

- Adobe Experience Platformへのアクセス：[https://experience.adobe.com/platform](https://experience.adobe.com/platform)
- Adobe Experience Platform Data Collection へのアクセス：[https://experience.adobe.com/#/data-collection/](https://experience.adobe.com/#/data-collection/)
- デモ Web サイトへのアクセス

>[!NOTE]
>
>[Experience League ドキュメントのChrome拡張機能のインストール ](../../../getting-started/gettingstarted/ex1.md) で参照されているように、Chrome拡張機能をインストール、設定、使用することを忘れないでください。

## 演習

[1.1.1 Adobe Experience Platformのデータ収集について](./ex1.md)

この演習では、Adobe Experience Platform Data Collection UI を探索し、その機能を理解します。

[1.1.2 Edge Network、データストリームおよびサーバーサイドのデータ収集](./ex2.md)

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

![ 技術インサイダー ](./../../../../assets/images/techinsiders.png){width="50px" align="left"}

>[!NOTE]
>
>Adobe Experience Platformとそのアプリケーションについて知るのに時間を費やしていただき、ありがとうございます。 ご不明な点がある場合は、have suggestions on future content の一般的なフィードバックをお知らせください。**techinsiders@adobe.com** に電子メールを送信して、技術インサイダーに直接問い合わせてください。

[すべてのモジュールに戻る](./../../../../overview.md)
