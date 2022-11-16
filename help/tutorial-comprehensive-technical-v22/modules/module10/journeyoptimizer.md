---
title: Adobe Journey Optimizer
description: このモジュールでは、Journey Optimizerに関して知っておくべきすべてのことを学びます。これは、企業が、顧客に対して、つながりのある、コンテキストに沿った、パーソナライズされたエクスペリエンスを設計し、提供するのに役立ちます。
kt: 5342
audience: Data Engineer, Data Architect, Data Analyst
doc-type: tutorial
activity: develop
exl-id: c85fc4ca-cdf8-463d-b0ad-e84036033d16
source-git-commit: cc7a77c4dd380ae1bc23dc75608e8e2224dfe78c
workflow-type: tm+mt
source-wordcount: '376'
ht-degree: 2%

---

# 10.Adobe Journey Optimizer

**作成者： [Maxime Foutrel](https://www.linkedin.com/in/maximefoutrel/), [ウーターヴァンゲルウ](https://www.linkedin.com/in/woutervangeluwe/)**

このモジュールでは、Adobe Journey Optimizerに関して知っておくべきすべてのことを学びます。これは、企業が、顧客に対して、つながりのある、コンテキストに沿った、パーソナライズされたエクスペリエンスを設計し、提供するのに役立ちます。

## 学習内容

- Adobe Journey Optimizerを知る
- 電子メールおよびプッシュメッセージの作成
- トリガーベースのジャーニーとバッチジャーニーの設定
- カスタマージャーニーの一環としての電子メールおよびプッシュ通知の送信

## 前提条件

- Adobe Journey Optimizerへのアクセス
- **これらのアセットをダウンロード**:
   - [Assets](./../../assets/ajo/ajo_assets.zip)

## アーキテクチャの概要

以下のアーキテクチャを見てみましょう。このモジュールで説明および使用するコンポーネントが強調表示されます。

![アーキテクチャの概要](../../assets/images/architecturem23.png)

## 使用するサンドボックス

このモジュールでは、次のサンドボックスを使用してください。 `--aepSandboxId--`.

>[!NOTE]
>
>忘れずに、で参照されているように、Chrome 拡張機能をインストール、設定および使用してください。 [0.1 -Experience Leagueドキュメント用の Chrome 拡張機能のインストール](../module0/ex1.md)

## 演習

[10.1 イベントベースのジャーニーの設定 — 注文の確認](./ex1.md)

この演習では、前の演習で作成した電子メールメッセージを送信するためのトリガーベースのジャーニーを設定します。

[10.2 バッチベースのニュースレタージャーニーの設定](./ex2.md)

この演習では、バッチベースのジャーニーを設定して、前の演習で作成した電子メールメッセージを送信します。

[10.3 電子メールメッセージへのパーソナライゼーションの適用](./ex3.md)

この演習では、セグメントのメンバーシップを使用して、E メール内に表示するコンテンツを定義します。

[10.4 プッシュ通知のセットアップと使用](./ex4.md)

この演習では、モバイルアプリケーションをiOSデバイスにインストールし、プッシュ通知を設定してデバイスに配信します。

[10.5 ビジネスイベントのジャーニーの作成](./ex5.md)

この演習では、ビジネスイベントを定義して、以前にその製品に関心を示したが、製品が在庫切れのため購入できなかった顧客に、SMS を介して在庫戻りメッセージを配信します。

[概要とメリット](./summary.md)

このモジュールの概要とメリットの概要。

>[!NOTE]
>
>Adobe Experience Platformについて知っておくべきすべてのことを学ぶために時間を費やしてくれてありがとう。 ご質問がある場合は、今後のコンテンツに関する提案がある一般的なフィードバックを共有したい場合は、Wouter Van Geluwe に直接お問い合わせください。 **vangeluw@adobe.com**.

[すべてのモジュールに戻る](../../overview.md)
