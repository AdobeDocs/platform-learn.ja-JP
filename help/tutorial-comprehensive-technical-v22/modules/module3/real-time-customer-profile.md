---
title: Foundation — リアルタイム顧客プロファイル
description: Foundation — リアルタイム顧客プロファイル
kt: 5342
audience: Data Engineer, Data Architect, Marketer
doc-type: tutorial
activity: develop
exl-id: 050e5d99-544d-4a86-a7f6-9f103381dca5
source-git-commit: cc7a77c4dd380ae1bc23dc75608e8e2224dfe78c
workflow-type: tm+mt
source-wordcount: '517'
ht-degree: 1%

---

# 3.基盤 — リアルタイム顧客プロファイル

**作成者： [ウーターヴァンゲルウ](https://www.linkedin.com/in/woutervangeluwe/)**

このモジュールでは、Adobe Experience Platformのリアルタイム顧客プロファイルおよび ID 機能について詳しく説明します。 オーディエンスの定義方法、ID サービスとExperience CloudID の役割、独自のセグメントを定義するセグメントビルダークエリを定義する方法について説明します。

## 学習内容

- Adobe Experience Platformの UI を使用して、顧客のリアルタイム顧客プロファイルを視覚化する方法を説明します
- Adobe Experience Platformのセグメントビルダーを使用してセグメントを作成する方法を説明します
- Adobe Experience Platform API を使用してセグメントを作成し、そのセグメントの結果をデータセットに保存する方法を説明します
- リアルタイムの動作を含む完全な顧客プロファイルにアクセスしてオフライン環境に与える影響について説明します

## 前提条件

- アクセス先 [Adobe Experience Platform](https://experience.adobe.com/platform)
- アクセス先 [https://public.aepdemo.net](https://public.aepdemo.net)
- **これらのアセットをダウンロード**:
   - [Postmanコレクション](./../../assets/postman/postman_profile.zip)

>[!IMPORTANT]
>
>このチュートリアルは、特定のワークショップ形式を容易にするために作成されました。 アクセスできない特定のシステムおよびアカウントを使用します。 アクセスがなくても、この非常に詳細な内容を読むことで、多くを学ぶことができると思います。 ワークショップの参加者で、アクセス資格情報が必要な場合は、Adobe担当者に連絡し、必要な情報を伝えてもらってください。

## アーキテクチャの概要

以下のアーキテクチャを見てみましょう。このモジュールで説明および使用するコンポーネントが強調表示されます。

![アーキテクチャの概要](../../assets/images/architecturem3.png)

## 使用するサンドボックス

このモジュールでは、次のサンドボックスを使用してください。 `--aepSandboxId--`.

>[!NOTE]
>
>忘れずに、で参照されているように、Chrome 拡張機能をインストール、設定および使用してください。 [0.1 -Experience Leagueドキュメント用の Chrome 拡張機能のインストール](../module0/ex1.md)

## 演習

[3.1 Web サイトへのアクセス](./ex1.md)

この練習では、スクリプトに従って Web サイトを順を追って進みます。

[3.2 自身のリアルタイム顧客プロファイルの視覚化 — UI](./ex2.md)

この演習では、Adobe Experience Platformにログインし、UI に独自のリアルタイム顧客プロファイルを表示します。

[3.3 自身のリアルタイム顧客プロファイルの視覚化 — API](./ex3.md)

この演習では、 PostmanとAdobe I/Oを使用し、 Adobe Experience Platformの API を使用して、独自のリアルタイム顧客プロファイルを表示します。

[3.4 セグメントの作成 — UI](./ex4.md)

この演習では、Adobe Experience Platformのセグメントビルダーを使用してセグメントを作成します。

[3.5 セグメントの作成 — API](./ex5.md)

この演習では、PostmanとAdobe I/Oを使用し、Adobe Experience Platformの API を使用してセグメントを作成し、そのセグメントの結果をデータセットとして保存します。

[3.6 コールセンターでリアルタイム顧客プロファイルの動作を確認する](./ex6.md)

この演習では、顧客からの呼び出しを受け取るコールセンター従業員を装います。 この顧客の体験に本当に影響を与えるには、利用可能なすべての情報にリアルタイムでアクセスする必要があります。

[概要とメリット](./summary.md)

このモジュールの概要とメリットの概要。

>[!NOTE]
>
>Adobe Experience Platformについて知っておくべきすべてのことを学ぶために時間を費やしてくれてありがとう。 ご質問がある場合は、今後のコンテンツに関する提案がある一般的なフィードバックを共有したい場合は、Wouter Van Geluwe に直接お問い合わせください。 **vangeluw@adobe.com**.

[すべてのモジュールに戻る](../../overview.md)
