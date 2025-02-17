---
title: Adobe Journey Optimizer – 外部天気 API、SMS アクションなど
description: Adobe Journey Optimizer – 外部天気 API、SMS アクションなど
kt: 5342
audience: Data Engineer, Data Architect, Orchestration Engineer, Marketer
doc-type: tutorial
activity: develop
exl-id: f18a0ec9-ee56-42b9-98bd-b5e433d77043
source-git-commit: 3d61d91111d8693ab031fbd7b26706c02818108c
workflow-type: tm+mt
source-wordcount: '438'
ht-degree: 0%

---

# 3.2 Adobe Journey Optimizer：外部データソースとカスタムアクション

このモジュールでは、Adobe Journey Optimizerを使用して、オンラインとオフラインの両方で顧客の行動をリッスンし、インテリジェントでコンテキストに応じたリアルタイムの方法で対応します。 モジュール 6 のAdobe Journey Optimizerを使用した最初の実践経験は既にあります。 この演習では、もう少し詳しく説明し、外部データソースがジャーニーの一部として使用される、より高度なユースケースを調べます。

## 学習内容

- Adobe Journey Optimizerでイベント、外部データソース、ジャーニーを作成する方法を説明します
- Open Weather API から天気情報を使用する方法を学ぶ
- Adobe Journey Optimizerの Twilio やSlackなどのカスタムアクション宛先の使用方法を説明します

## 前提条件

- Adobe Experience Platformへのアクセス：[https://experience.adobe.com/platform](https://experience.adobe.com/platform)
- Adobe Journey Optimizerへのアクセス
- Open Weather API へのアクセス

## ビジネスコンテキスト

ブランドとして、あなたはオンラインエクスペリエンスのパーソナライズに多額の投資をしてきました。 次に、状況に応じて、オフラインエクスペリエンスに関連性の高い設定にします。
このモジュールでは、オフラインストアでの顧客のプレゼンスを使用し、関連するコンテンツを店舗の画面で顧客に表示することで、店舗内でパーソナライズされたエクスペリエンスを提供すると同時に、パーソナライズされたプッシュ通知または SMS メッセージを、すべてリアルタイムで同じ顧客に配信します。
また、ブランドは、コンテキストが顧客の興味に大きく影響することを理解しています。そのため、その顧客の場所の現在の天気情報を取り込んで、表示するコンテンツやプロモーションを決定する必要があります。

>[!NOTE]
>
>[Experience League ドキュメントのChrome拡張機能のインストール ](../../../getting-started/gettingstarted/ex1.md) で参照されているように、Chrome拡張機能をインストール、設定、使用することを忘れないでください。

## 演習

[3.2.1 イベントの定義](./ex1.md)

Adobe Journey Optimizerを使用してカスタムイベントを定義する方法を説明します。

[3.2.2 外部データソースの定義](./ex2.md)

Adobe Journey Optimizerを使用して外部データソースを設定する方法を説明します。

[3.2.3 カスタムアクションの定義](./ex3.md)

Adobe Journey Optimizerを使用して外部アクションを定義する方法を説明します。

[3.2.4 ジャーニーとメッセージの作成](./ex4.md)

イベント、データソース、アクションをインテリジェントでコンテキストに沿ったジャーニーに組み合わせます。

[3.2.5 ジャーニーのトリガー](./ex5.md)

特定のジャーニーをトリガーします。

[概要と利点](./summary.md)

このモジュールの概要とメリットの概要

![ 技術インサイダー ](./../../../../assets/images/techinsiders.png){width="50px" align="left"}

>[!NOTE]
>
>Adobe Experience Platformとそのアプリケーションについて知るのに時間を費やしていただき、ありがとうございます。 ご不明な点がある場合は、have suggestions on future content の一般的なフィードバックをお知らせください。**techinsiders@adobe.com** に電子メールを送信して、技術インサイダーに直接問い合わせてください。

[すべてのモジュールに戻る](./../../../../overview.md)
