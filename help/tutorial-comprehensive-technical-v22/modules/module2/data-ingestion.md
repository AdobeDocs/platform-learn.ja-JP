---
title: Foundation — データ取り込み
description: Foundation — データ取り込み
kt: 5342
audience: Data Engineer, Data Architect
doc-type: tutorial
activity: develop
exl-id: dbbc0539-ae1b-488d-b312-76a74d4d361f
source-git-commit: cc7a77c4dd380ae1bc23dc75608e8e2224dfe78c
workflow-type: tm+mt
source-wordcount: '508'
ht-degree: 2%

---

# 2.基盤 — データ取り込み

**作成者： [ウーターヴァンゲルウ](https://www.linkedin.com/in/woutervangeluwe/)**

このモジュールの目的は、データ取り込みに関するすべての情報を学ぶことです。 ストリーミングおよびバッチでのデータ取り込みについて学習します。 Launch を使用してストリーミングデータ取り込みを実装し、Hands-On Lab Web サイトの顧客行動がリアルタイムでAdobe Experience Platformにストリーミングされるようにします。 バッチデータ取得については、Adobe Experience Platformワークフローを使用して CSV ファイルを取得し、XDM スキーマにマッピングして、Adobe Experience Platformに取り込みます。

## 学習内容

- Adobe Experience Platformで XDM スキーマを作成する方法を説明します
- Adobe Experience Platformでデータセットを作成する方法を説明します。
- ストリーミングエンドポイントを作成し、Launch でAdobe Experience Platform拡張機能を設定する方法について説明します。
- Launch でルールを作成し、データをAdobe Experience Platformにストリーミングする方法を説明します。
- Web ページにAdobe Experience Platform Launchを統合する方法を学ぶ
- Adobe Experience Platform Workflow を使用して CSV ファイルをAdobe Experience Platformに取り込む方法を説明します

## 前提条件

- Adobe Experience Platformへのアクセス： [https://experience.adobe.com/platform](https://experience.adobe.com/platform)
- Adobe Experience Platform Launchへのアクセス： [https://experience.adobe.com/#/data-collection/](https://experience.adobe.com/#/data-collection/)
- アクセス先 [https://public.aepdemo.net](https://public.aepdemo.net)
- Postmanへのアクセス

>[!IMPORTANT]
>
>このチュートリアルは、特定のワークショップ形式を容易にするために作成されました。 アクセスできない特定のシステムおよびアカウントを使用します。 アクセスがなくても、この非常に詳細な内容を読むことで、多くを学ぶことができると思います。 ワークショップの参加者で、アクセス資格情報が必要な場合は、Adobe担当者に連絡し、必要な情報を伝えてもらってください。

## アーキテクチャの概要

以下のアーキテクチャを見てみましょう。このモジュールで説明および使用するコンポーネントが強調表示されます。

![アーキテクチャの概要](../../assets/images/architecturem2.png)

## 使用するサンドボックス

このモジュールでは、次のサンドボックスを使用してください。 `--module2sandbox--`.

>[!NOTE]
>
>忘れずに、で参照されているように、Chrome 拡張機能をインストール、設定および使用してください。 [0.1 -Experience Leagueドキュメント用の Chrome 拡張機能のインストール](../module0/ex1.md)

## 演習

[2.1 Web サイトの参照](./ex1.md)

この練習では、このイネーブルメントの一部として使用する Web サイトを参照します。

[2.2 スキーマの設定と識別子の設定](./ex2.md)

この演習では、プロファイル情報と顧客の行動を取り込むために必要な XDM スキーマのを設定します。 すべての XDM スキーマで、すべての情報をリンクするプライマリ識別子を設定する必要もあります。

[2.3 データセットの設定](./ex3.md)

この演習では、プロファイル情報と顧客の行動を取得して保存するために必要なデータセットを取得します。

[2.4 オフラインソースからのデータ取り込み](./ex4.md)

この演習では、Web サイトとモバイルアプリに移動して、顧客のように動作し、Platform にデータをストリーミングします。

[2.5 データランディングゾーン](./ex5.md)

Azure BLOB ストレージを使用してデータランディングゾーンソースコネクタをセットアップします。

[概要とメリット](./summary.md)

このモジュールの概要とメリットの概要。

>[!NOTE]
>
>Adobe Experience Platformについて知っておくべきすべてのことを学ぶために時間を費やしてくれてありがとう。 ご質問がある場合は、今後のコンテンツに関する提案がある一般的なフィードバックを共有したい場合は、Wouter Van Geluwe に直接お問い合わせください。 **vangeluw@adobe.com**.

[すべてのモジュールに戻る](../../overview.md)
