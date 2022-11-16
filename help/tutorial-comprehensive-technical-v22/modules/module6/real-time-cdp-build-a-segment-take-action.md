---
title: リアルタイム CDP — セグメントを作成し、アクションを実行する
description: リアルタイム CDP — セグメントを作成し、アクションを実行する
kt: 5342
audience: Data Architect, Orchestration Engineer, Marketer
doc-type: tutorial
activity: develop
exl-id: 147d9153-5742-4857-aae1-0ec434a1e626
source-git-commit: cc7a77c4dd380ae1bc23dc75608e8e2224dfe78c
workflow-type: tm+mt
source-wordcount: '454'
ht-degree: 2%

---

# 6.リアルタイム CDP — セグメントを作成し、アクションを実行する

**作成者： [ウーターヴァンゲルウ](https://www.linkedin.com/in/woutervangeluwe/), [アルベルトデカロ](https://www.linkedin.com/in/albertodecaro/), [ベンディクトウェデニック](https://www.linkedin.com/in/benedikt-wedenik/)**

このモジュールでは、ストリーミングセグメントを設定し、複数の宛先に対してセグメントをアクティブ化します。

## 学習内容

- セグメントを構築し、ストリーミング用に有効にする方法を説明します。
- Adobe Experience Platform UI を使用して広告の宛先を設定する方法を説明します。
- セグメントを宛先に接続し、アクティブ化する方法を説明します。
- 双方向のセグメント共有を使用して、Adobe Audience ManagerでのAdobe Experience Platformセグメントの使用方法と、Adobe Experience PlatformでのAdobe Audience Managerセグメントの使用方法について説明します。

## 前提条件

- Adobe Experience Platformへのアクセス： [https://experience.adobe.com/platform](https://experience.adobe.com/platform)
- Adobe Targetへのアクセス
- AWS S3 へのアクセス

>[!IMPORTANT]
>
>このチュートリアルは、特定のワークショップ形式を容易にするために作成されました。 アクセスできない特定のシステムおよびアカウントを使用します。 アクセスがなくても、この非常に詳細な内容を読むことで、多くを学ぶことができると思います。 ワークショップの参加者で、アクセス資格情報が必要な場合は、Adobe担当者に連絡し、必要な情報を伝えてもらってください。

## アーキテクチャの概要

以下のアーキテクチャを見てみましょう。このモジュールで説明および使用するコンポーネントが強調表示されます。

![アーキテクチャの概要](../../assets/images/architecturem11.png)

## 使用するサンドボックス

このモジュールでは、次のサンドボックスを使用してください。 `--module11sandbox--`.

>[!NOTE]
>
>忘れずに、で参照されているように、Chrome 拡張機能をインストール、設定および使用してください。 [0.1 -Experience Leagueドキュメント用の Chrome 拡張機能のインストール](../module0/ex1.md)

## 演習

[6.1 セグメントの作成](./ex1.md)

セグメントの作成方法を説明します。

[6.2 宛先を使用した DV360 の宛先の設定方法の確認](./ex2.md)

Real-Time CDP UI を使用して広告の宛先を設定する方法を説明します。

[6.3 措置をとる：セグメントを DV360 に送信します。](./ex3.md)

演習 6.1 で作成したセグメントを宛先 DV360 に接続します。

[6.4 措置をとる：セグメントを S3 の宛先に送信する](./ex4.md)

演習 6.1 で作成したセグメントを使用し、S3 の宛先（通常、電子メールマーケティングの宛先で使用）に送信します。

[6.5 措置をとる：セグメントをAdobe Targetに送信](./ex5.md)

演習 6.1 で作成したセグメントを使用して、Adobe Targetでエクスペリエンスのターゲット設定アクティビティを設定します。

[6.6 外部オーディエンス](./ex6.md)

外部ソースシステムからAdobe Experience Platformにオーディエンスをインポートします。

[6.7 宛先 SDK](./ex7.md)

宛先 SDK を使用して独自の宛先を設定する。

[概要とメリット](./summary.md)

このモジュールの概要とメリットの概要。

>[!NOTE]
>
>Adobe Experience Platformについて知っておくべきすべてのことを学ぶために時間を費やしてくれてありがとう。 ご質問がある場合は、今後のコンテンツに関する提案がある一般的なフィードバックを共有したい場合は、Wouter Van Geluwe に直接お問い合わせください。 **vangeluw@adobe.com**.

[すべてのモジュールに戻る](../../overview.md)
