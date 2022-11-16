---
title: Adobe Journey Optimizer — 外部の気象 API、SMS アクションなど
description: Adobe Journey Optimizer — 外部の気象 API、SMS アクションなど
kt: 5342
audience: Data Engineer, Data Architect, Orchestration Engineer, Marketer
doc-type: tutorial
activity: develop
exl-id: 7f3d6dcb-845d-4ff1-97c3-8e93b8d2c624
source-git-commit: cc7a77c4dd380ae1bc23dc75608e8e2224dfe78c
workflow-type: tm+mt
source-wordcount: '536'
ht-degree: 1%

---

# 8.Adobe Journey Optimizer外部データソースとカスタムアクション

**作成者： [ウーターヴァンゲルウ](https://www.linkedin.com/in/woutervangeluwe/)**

このモジュールでは、Adobe Journey Optimizerを使用して、オンラインとオフラインの両方で顧客の行動をリッスンし、インテリジェントで、コンテキストに応じた、リアルタイムな方法でそれに応答します。 モジュール 6 では、既にAdobe Journey Optimizerを初めて実際に使用した経験があります。 この演習では、さらに詳しく説明し、外部データソースをジャーニーの一部として使用する、より高度な使用例を見てみましょう。

## 学習内容

- Adobe Journey Optimizerでイベント、外部データソース、ジャーニーを作成する方法を説明します
- Open Weather API から天気情報を使用する方法を説明します。
- Twilio やAdobe Journey OptimizerのSlackなどのカスタムアクションの宛先を使用する方法を説明します

## 前提条件

- Adobe Experience Platformへのアクセス： [https://experience.adobe.com/platform](https://experience.adobe.com/platform)
- Adobe Journey Optimizerへのアクセス
- Open Weather API へのアクセス

>[!IMPORTANT]
>
>このチュートリアルは、特定のワークショップ形式を容易にするために作成されました。 アクセスできない特定のシステムおよびアカウントを使用します。 アクセスがなくても、この非常に詳細な内容を読むことで、多くを学ぶことができると思います。 ワークショップの参加者で、アクセス資格情報が必要な場合は、Adobe担当者に連絡し、必要な情報を伝えてもらってください。

## アーキテクチャの概要

以下のアーキテクチャを見てみましょう。このモジュールで説明および使用するコンポーネントが強調表示されます。

![アーキテクチャの概要](../../assets/images/architecturem12.png)

## ビジネスコンテキスト

ブランドとして、オンラインエクスペリエンスのパーソナライズに多くの投資をしてきました。 現在は、オフラインエクスペリエンスに対してコンテキストに応じて関連性の高い関係を保ちたいと考えています。
このモジュールでは、顧客の存在をオフラインストアで使用し、関連するコンテンツを店舗画面でその顧客に表示し、同時に、パーソナライズされたプッシュまたは SMS メッセージを同じ顧客にリアルタイムで配信します。
ブランドとしては、コンテキストが顧客の関心に大きく影響することも理解できるので、顧客の場所の現在の気象情報を取り込み、表示するコンテンツやプロモーションを決定したいと考えます。

## 使用するサンドボックス

このモジュールでは、次のサンドボックスを使用してください。 `--aepSandboxId--`.

>[!NOTE]
>
>忘れずに、で参照されているように、Chrome 拡張機能をインストール、設定および使用してください。 [0.1 -Experience Leagueドキュメント用の Chrome 拡張機能のインストール](../module0/ex1.md)

## 演習

[8.1 イベントの定義](./ex1.md)

Adobe Journey Optimizerを使用してカスタムイベントを定義する方法を説明します。

[8.2 外部データソースの定義](./ex2.md)

Adobe Journey Optimizerを使用して外部データソースを設定する方法を説明します。

[8.3 カスタムアクションの定義](./ex3.md)

Adobe Journey Optimizerを使用して外部アクションを定義する方法を説明します。

[8.4 ジャーニーとメッセージの作成](./ex4.md)

イベント、データソース、アクションを組み合わせて、インテリジェントでコンテキストに沿ったジャーニーを実現します。

[8.5 ジャーニーのトリガー](./ex5.md)

特定のジャーニーをトリガーします。

[概要とメリット](./summary.md)

このモジュールの概要とメリットの概要。

>[!NOTE]
>
>Adobe Experience Platformについて知っておくべきすべてのことを学ぶために時間を費やしてくれてありがとう。 ご質問がある場合は、今後のコンテンツに関する提案がある一般的なフィードバックを共有したい場合は、Wouter Van Geluwe に直接お問い合わせください。 **vangeluw@adobe.com**.

[すべてのモジュールに戻る](../../overview.md)
