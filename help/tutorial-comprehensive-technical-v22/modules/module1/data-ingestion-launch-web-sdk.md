---
title: 1. Adobe Experience Platformデータ収集と Web SDK 拡張機能の設定
description: Foundation - Adobe Experience Platformデータ収集と Web SDK 拡張機能のセットアップ
kt: 5342
audience: Data Engineer, Data Architect
doc-type: tutorial
activity: develop
exl-id: 86da7132-cb06-4be3-b6b8-ea3ab937e6dc
source-git-commit: cc7a77c4dd380ae1bc23dc75608e8e2224dfe78c
workflow-type: tm+mt
source-wordcount: '692'
ht-degree: 1%

---

# 1. Foundation - Adobe Experience Platformデータ収集および Web SDK 拡張機能のセットアップ

**作成者： [マシュージョセフ・ウーリー](https://www.linkedin.com/in/matthewjwoolley/), [ウーターヴァンゲルウ](https://www.linkedin.com/in/woutervangeluwe/)**

この基本的なモジュールでは、Adobeのデータ収集ビジョンを紹介し、Adobe Experience Platform Data Collection、Adobe Experience Platform SDK、Adobe Experience Platform Edge Network を使用して、Web サイトやモバイルアプリケーションからAdobe Experience Platformや他のアプリケーションにデータを取得する方法を説明します。 このモジュールでは、 Adobe Experience Platform技術チュートリアルの範囲を超える影響を与える概念とテクノロジーをいくつか紹介します。 これらの演習のどの部分が、包括的なチュートリアルの残りの部分に基づいているかを明確に示します。このチュートリアルでは、Experience Edge とその機能についての詳細と、その他の情報やチュートリアルの参照先を示します。

## 学習内容

- ブランドがAdobe Experience Platform Data Collection をTag Management System(TMS) として使用する方法を説明します。
- ブランドがデータをAdobe製品に取り込むために使用するデータフローについて説明します。
- Adobe Experience Platform Edge Network を使用して、Adobe Experience Platformやその他の製品にデータを送信する方法を説明します。
- Web および Mobile からデータを収集するデータ要素とルールを作成する方法について説明します。
- Web SDK トラッキングイベントと、そのコンテンツのデバッグ方法について説明します。
- データレイヤーとは何か、および実装時にAdobeが推奨するものについて説明します。
- Web SDK を最初から実装する手順について説明します。
- Web 実装とモバイル実装の違いについて説明します。

## 前提条件

- Adobe Experience Platformへのアクセス： [https://experience.adobe.com/platform](https://experience.adobe.com/platform)
- Adobe Experience Platform Data Collection へのアクセス： [https://experience.adobe.com/#/data-collection/](https://experience.adobe.com/#/data-collection/)
- デモ Web サイトへのアクセス

>[!IMPORTANT]
>
>このチュートリアルは、特定のワークショップ形式を容易にするために作成されました。 アクセスできない特定のシステムおよびアカウントを使用します。 アクセスがなくても、この非常に詳細な内容を読むことで、多くを学ぶことができると思います。 ワークショップの参加者で、アクセス資格情報が必要な場合は、Adobe担当者に連絡し、必要な情報を伝えてもらってください。

## アーキテクチャの概要

以下のアーキテクチャを見てみましょう。このモジュールで説明および使用するコンポーネントが強調表示されます。

![アーキテクチャの概要](../../assets/images/architecturem1.png)

## 使用するサンドボックス

このモジュールでは、次のサンドボックスを使用してください。 `--aepSandboxId--`.

>[!NOTE]
>
>忘れずに、で参照されているように、Chrome 拡張機能をインストール、設定および使用してください。 [0.1 -Experience Leagueドキュメント用の Chrome 拡張機能のインストール](../module0/ex1.md)

## 演習

[1.1 Adobe Experience Platformデータ収集について](./ex1.md)

この演習では、 Adobe Experience Platformデータ収集 UI を参照し、その機能を理解します。

[1.2 Edge Network、Datastreams および Server Side のデータ収集](./ex2.md)

この演習では、Adobe Experience Platformのデータ収集インターフェイスでAdobe製品にデータを転送し、デモ Web サイトで使用されるデータストリームを調査する方法を学びます。

[1.3 Adobe Experience Platformデータ収集の概要](./ex3.md)

この演習では、拡張機能の設定、データ要素とルールの作成、Web への公開の方法を学びます。

[1.4 クライアント側の Web データ収集](./ex4.md)

この演習では、インストールされている Web SDK をデバッグして、その仕組みと、今後の演習で使用されるデータを理解します。

[1.5 Adobe AnalyticsとAdobe Audience Managerの実装](./ex5.md)

この演習では、 Adobe AnalyticsとAdobe Audience Managerの Web SDK で収集した Web データを参照および使用します。

[1.6 Adobe Targetの実装](./ex6.md)

この演習では、Web SDK を使用してAdobe Targetにアクティビティを実装します。

[1.7 Adobe Experience Platformでの XDM スキーマ要件](./ex7.md)

Web SDK と alloy.js でデータをAdobe Experience Platformに取り込めるようにするには、特定の XDM Mixin をAdobe Experience Platformの XDM スキーマの一部にする必要があります。

[概要とメリット](./summary.md)

このモジュールの概要とメリットの概要。

>[!NOTE]
>
>Adobe Experience Platformについて知っておくべきすべてのことを学ぶために時間を費やしてくれてありがとう。 ご質問がある場合は、今後のコンテンツに関する提案がある一般的なフィードバックを共有したい場合は、Wouter Van Geluwe に直接お問い合わせください。 **vangeluw@adobe.com**.

[すべてのモジュールに戻る](../../overview.md)
