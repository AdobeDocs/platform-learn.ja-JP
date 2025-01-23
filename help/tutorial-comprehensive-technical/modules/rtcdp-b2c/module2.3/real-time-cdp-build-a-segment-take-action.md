---
title: Real-time CDP - セグメントを作成してアクションを実行します。
description: Real-time CDP - セグメントを作成してアクションを実行します。
kt: 5342
audience: Data Architect, Orchestration Engineer, Marketer
doc-type: tutorial
activity: develop
exl-id: 147d9153-5742-4857-aae1-0ec434a1e626
source-git-commit: bd46be455f88007174f7e6be9a1ce5f508edc09b
workflow-type: tm+mt
source-wordcount: '338'
ht-degree: 1%

---

# 2.3 Real-time CDP - セグメントを作成してアクションを実行します

このモジュールでは、ストリーミングセグメントを設定し、そのセグメントを複数の宛先に対してアクティブ化します。

## 学習内容

- セグメントを作成してストリーミングを有効にする方法を説明します。
- Adobe Experience Platform UI を使用して広告の宛先を設定する方法を説明します。
- セグメントを宛先に接続してアクティブ化する方法を説明します。
- 双方向のセグメント共有により、Adobe Audience ManagerでのAdobe Experience Platform セグメントの使用方法と、Adobe Experience PlatformでのAdobe Audience Manager セグメントの使用方法を説明します。

## 前提条件

- Adobe Experience Platformへのアクセス：[https://experience.adobe.com/platform](https://experience.adobe.com/platform)
- Adobe Targetへのアクセス
- AWS S3 へのアクセス

>[!NOTE]
>
>Experience LeagueドキュメントのChrome拡張機能のインストール [ で参照されているように、Chrome拡張機能をインストール、設定および使用することを忘れないでください ](../../gettingstarted/gettingstarted/ex1.md)

## 演習

[2.3.1 オーディエンスの作成](./ex1.md)

オーディエンスの作成方法を説明します。

[2.3.2 宛先を使用した DV360 宛先の設定方法の確認](./ex2.md)

Real-Time CDP UI を使用して広告の宛先を設定する方法を説明します。

[2.3.3 アクションの実行：オーディエンスを DV360 に送信する](./ex3.md)

作成したオーディエンスを宛先 DV360 に接続します。

[2.3.4 アクションの実行：オーディエンスを S3 の宛先に送信する](./ex4.md)

作成したオーディエンスを使用し、S3-destination （通常はメールマーケティングの宛先に使用される）に送信します。

[2.3.5 アクションの実行：オーディエンスをAdobe Targetに送信します](./ex5.md)

作成したオーディエンスを使用して、Adobe Targetのエクスペリエンスのターゲット設定アクティビティを設定します。

[2.3.6 外部オーディエンス](./ex6.md)

外部ソースシステムからAdobe Experience Platformにオーディエンスを読み込みます。

[2.3.7 宛先SDK](./ex7.md)

宛先SDKを使用して独自の宛先を設定します。

[概要と利点](./summary.md)

このモジュールの概要とメリットの概要

![ 技術インサイダー ](./../../../assets/images/techinsiders.png){width="50px" align="left"}

>[!NOTE]
>
>Adobe Experience Platformとそのアプリケーションについて知るのに時間を費やしていただき、ありがとうございます。 ご不明な点がある場合は、have suggestions on future content の一般的なフィードバックをお知らせください。**techinsiders@adobe.com** に電子メールを送信して、技術インサイダーに直接問い合わせてください。

[すべてのモジュールに戻る](../../../overview.md)
