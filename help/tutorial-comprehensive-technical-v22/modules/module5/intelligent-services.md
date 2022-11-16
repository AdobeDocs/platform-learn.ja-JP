---
title: インテリジェントサービス
description: インテリジェントサービス
kt: 5342
audience: Data Engineer, Data Architect, Data Scientist
doc-type: tutorial
activity: develop
exl-id: 99b56722-95bf-4c51-b4d6-8b5a8e5fd936
source-git-commit: cc7a77c4dd380ae1bc23dc75608e8e2224dfe78c
workflow-type: tm+mt
source-wordcount: '361'
ht-degree: 16%

---

# 5.インテリジェントサービス

**作成者： [ディプティマンバダヘナ](https://www.linkedin.com/in/diptiman-badajena-1b178019/), [ウーターヴァンゲルウ](https://www.linkedin.com/in/woutervangeluwe/)**

このモジュールでは、Adobe Experience Platform Intelligent Services を設定、設定および使用する方法を学びます。

## 学習内容

- Adobe Experience Platformを知る
- インテリジェントサービスで使用するスキーマ/データセットの設定
- 新しい顧客 AI インスタンスの作成
- スコアリングダッシュボードとセグメント化

## 前提条件

- Adobe Experience Platformへのアクセス： [https://experience.adobe.com/platform](https://experience.adobe.com/platform)

>[!IMPORTANT]
>
>このチュートリアルは、特定のワークショップ形式を容易にするために作成されました。 アクセスできない特定のシステムおよびアカウントを使用します。 アクセスがなくても、この非常に詳細な内容を読むことで、多くを学ぶことができると思います。 ワークショップの参加者で、アクセス資格情報が必要な場合は、Adobe担当者に連絡し、必要な情報を伝えてもらってください。

## アーキテクチャの概要

以下のアーキテクチャを見てみましょう。このモジュールで説明および使用するコンポーネントが強調表示されます。

![アーキテクチャの概要](../../assets/images/architecturem5.png)

## 使用するサンドボックス

このモジュールでは、次のサンドボックスを使用してください。 `--module10sandbox--`.

>[!NOTE]
>
>忘れずに、で参照されているように、Chrome 拡張機能をインストール、設定および使用してください。 [0.1 -Experience Leagueドキュメント用の Chrome 拡張機能のインストール](../module0/ex1.md)

## 演習

[5.1 顧客 AI — データ準備（取り込み）](./ex1.md)

顧客データが取り込まれ、Adobe Experience Platform の Experience Data Model（XDM）で変換されます。特に、インテリジェントサービスで使用されるすべてのデータセットは、Consumer ExperienceEvent(CEE)XDM スキーマに準拠している必要があります。

[5.2 顧客 AI — 新しいインスタンスの作成（設定）](./ex2.md)

マーケティングアナリストは、ビジネスルールを指定し、関連データを識別して、目的の予測を設定します。モデルを設定したら、実行をスケジュールし、スコアを確認します。

[5.3 顧客 AI — スコアリングダッシュボードとセグメント化（予測と行動）](./ex3.md)

モデルのトレーニングとスコア測定が完了すると、スコアが Platform にもう一度書き込まれます。セグメントの定義、カスタムダッシュボードの作成など、予測に基づいて実行するアクションを決定できます。

>[!NOTE]
>
>Adobe Experience Platformについて知っておくべきすべてのことを学ぶために時間を費やしてくれてありがとう。 ご質問がある場合は、今後のコンテンツに関する提案がある一般的なフィードバックを共有したい場合は、Wouter Van Geluwe に直接お問い合わせください。 **vangeluw@adobe.com**.

[すべてのモジュールに戻る](../../overview.md)
