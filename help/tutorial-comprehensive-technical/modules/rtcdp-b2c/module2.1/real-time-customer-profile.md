---
title: Foundation - リアルタイム顧客プロファイル
description: Foundation - リアルタイム顧客プロファイル
kt: 5342
audience: Data Engineer, Data Architect, Marketer
doc-type: tutorial
source-git-commit: 7d2f5f842559b2d6d9f115f3993268a4b36a0fe0
workflow-type: tm+mt
source-wordcount: '492'
ht-degree: 0%

---

# 2.1 の基盤 – リアルタイム顧客プロファイル

**著者：[Wouter Van Geluwe](https://www.linkedin.com/in/woutervangeluwe/)**

このモジュールでは、Adobe Experience Platformのリアルタイム顧客プロファイルと ID 機能について詳しく説明します。 オーディエンスの定義方法、ID サービスとExperience Cloud ID の役割、セグメントビルダークエリを定義して独自のセグメントを定義する方法について説明します。

## 学習内容

- Adobe Experience Platformの UI を使用して顧客のリアルタイム顧客プロファイルを視覚化する方法について説明します
- Adobe Experience Platformのセグメントビルダーを使用したセグメントの作成方法を説明します
- Adobe Experience Platform API を使用してセグメントを作成し、セグメントの結果をデータセットに保存する方法について説明します
- オフライン環境でリアルタイム動作を含む、完全な顧客プロファイルにアクセスすることによる影響について説明します

## 前提条件

- [Adobe Experience Platform](https://experience.adobe.com/platform) へのアクセス
- [https://public.aepdemo.net](https://public.aepdemo.net) へのアクセス
- **これらのアセットをダウンロードします**。
   - [Postman コレクション](./../../../assets/postman/postman_profile.zip)

>[!IMPORTANT]
>
>このチュートリアルは、特定のワークショップ形式を容易にするために作成されました。 アクセス権がない可能性のある特定のシステムとアカウントを使用します。 アクセス権がなくても、この非常に詳細なコンテンツを読むことで、多くのことを学べると思います。 いずれかのワークショップに参加していて、アクセス資格情報が必要な場合は、Adobe担当者に問い合わせてください。担当者から必要な情報が提供されます。

>[!NOTE]
>
>[0.1 -Experience Leagueドキュメント用のChrome拡張機能のインストールで参照されているように、Chrome拡張機能をインストール、設定および使用することを忘れないでください ](../../gettingstarted/gettingstarted/ex1.md)

## 演習

[2.1.1 ウェブサイトを見る](./ex1.md)

この演習では、スクリプトに従って web サイトを確認します。

[2.1.2 独自のリアルタイム顧客プロファイルの視覚化 – UI](./ex2.md)

この演習では、Adobe Experience Platformにログインし、独自のリアルタイム顧客プロファイルを UI に表示します。

[2.1.3 独自のリアルタイム顧客プロファイルの視覚化 – API](./ex3.md)

この演習では、PostmanとAdobe I/Oを使用して、Adobe Experience Platformの API を利用して独自のリアルタイム顧客プロファイルを表示します。

[2.1.4 セグメントの作成 – UI](./ex4.md)

この演習では、Adobe Experience Platformのセグメントビルダーを使用してセグメントを作成します。

[2.1.5 セグメントの作成 – API](./ex5.md)

この演習では、PostmanとAdobe I/Oを使用してセグメントを作成し、Adobe Experience Platformの API を使用してそのセグメントの結果をデータセットとして保存します。

[2.1.6 コールセンターでのリアルタイム顧客プロファイルの動作を確認する](./ex6.md)

この演習では、顧客から電話を受けるコールセンターの従業員として実行します。 この顧客のエクスペリエンスに本当に影響を与えるためには、利用可能なすべての情報にリアルタイムでアクセスする必要があります。

[概要と利点](./summary.md)

このモジュールの概要とメリットの概要

>[!NOTE]
>
>Adobe Experience Platformとそのアプリケーションについて知るのに時間を費やしていただき、ありがとうございます。 ご不明な点がある場合は、have suggestions on future content の一般的なフィードバックをお知らせください。**techinsiders@adobe.com** に電子メールを送信して、技術インサイダーに直接問い合わせてください。

[すべてのモジュールに戻る](../../../overview.md)
