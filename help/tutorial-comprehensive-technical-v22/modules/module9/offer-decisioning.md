---
title: Offer Decisioning
description: offer decisioning
kt: 5342
audience: Data Engineer, Data Architect, Orchestration Engineer, Marketer
doc-type: tutorial
activity: develop
exl-id: a7218d65-422b-48e5-89fa-864c5af8d1c6
source-git-commit: cc7a77c4dd380ae1bc23dc75608e8e2224dfe78c
workflow-type: tm+mt
source-wordcount: '457'
ht-degree: 2%

---

# 9.Offer decisioning

**作成者： [ロブインデルモール](https://www.linkedin.com/in/ridmaur/), [ウーターヴァンゲルウ](https://www.linkedin.com/in/woutervangeluwe/)**

このモジュールでは、Adobe Journey OptimizerのOffer decisioning機能に関する実践的な説明を取得します。

Adobe Journey Optimizerは、パーソナライズされたオファーを作成し、Adobe Journey Optimizerにリンクされているすべての宛先に対して調整された方法でオファーを配信する機能を提供します。

offer decisioningを使用すると、利用可能な選択肢の中から最適なオプションを決定できます。 これらのオプションには、オファー、製品レコメンデーション、Web エクスペリエンスのコンテンツコンポーネント、会話スクリプト、実行するアクションが含まれます。

このビデオを見て、価値とカスタマージャーニーについて理解してください。

>[!VIDEO](https://video.tv.adobe.com/v/328829?quality=12&learn=on)

## 学習内容

- offer decisioning、
- 実際のカスタマージャーニーに影響を与えるOffer decisioningアプリケーションサービスの設定方法を説明します。

## 前提条件

- Adobe Journey Optimizerへのアクセス

>[!IMPORTANT]
>
>このチュートリアルは、特定のワークショップ形式を容易にするために作成されました。 アクセスできない特定のシステムおよびアカウントを使用します。 アクセスがなくても、この非常に詳細な内容を読むことで、多くを学ぶことができると思います。 ワークショップの参加者で、アクセス資格情報が必要な場合は、Adobe担当者に連絡し、必要な情報を伝えてもらってください。

## アーキテクチャの概要

以下のアーキテクチャを見てみましょう。このモジュールで説明および使用するコンポーネントが強調表示されます。

![アーキテクチャの概要](../../assets/images/architecturem14.png)

## 使用するサンドボックス

このモジュールでは、次のサンドボックスを使用してください。 `--aepSandboxId--`.

>[!NOTE]
>
>忘れずに、で参照されているように、Chrome 拡張機能をインストール、設定および使用してください。 [0.1 -Experience Leagueドキュメント用の Chrome 拡張機能のインストール](../module0/ex1.md)

## 演習

[9.1Offer decisioning101](./ex1.md)

この練習では、Offer decisioningの様々な概念と、Adobe Journey OptimizerのOffer decisioningへのアクセス方法について、より深く理解できます。

[9.2 オファーと決定の設定](./ex2.md)

この演習では、パーソナライズされた独自のオファーと独自の決定を設定し、公開します。

[9.3Offer decisioning用のデータ収集クライアントプロパティと Web SDK 設定の準備](./ex3.md)

この練習では、デモ Web サイトを使用して決定をテストします。

[9.4Adobe TargetとOffer decisioningの結合](./ex4.md)

この演習では、Adobe Targetでオファーを使用します。

[9.5 決定を電子メールで使用](./ex5.md)

この演習では、決定を E メールで使用します。

[9.6 API を使用して決定をテストする](./ex6.md)

この演習では、PostmanとAdobe Experience Platform API を使用して、決定をテストします。

[概要とメリット](./summary.md)

このモジュールの概要とメリットの概要。

>[!NOTE]
>
>Adobe Experience Platformについて知っておくべきすべてのことを学ぶために時間を費やしてくれてありがとう。 ご質問がある場合は、今後のコンテンツに関する提案がある一般的なフィードバックを共有したい場合は、Wouter Van Geluwe に直接お問い合わせください。 **vangeluw@adobe.com**.

[すべてのモジュールに戻る](../../overview.md)
