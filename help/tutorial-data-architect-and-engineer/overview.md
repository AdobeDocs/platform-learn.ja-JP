---
title: データアーキテクトおよびデータエンジニア向けAdobe Experience Platformの概要
description: データアーキテクトおよびデータエンジニア向けAdobe Experience Platformの概要。
breadcrumb-title: 概要
role: Data Architect, Data Engineer
kt: 4348
thumbnail: 4348-overview.jpg
recommendations: catalog, noDisplay
last-substantial-update: 2023-06-21T00:00:00Z
exl-id: fabbc591-840b-40dc-89af-305626a16338
source-git-commit: 191fe710c6cd00b5355881158a7e0af85523e22e
workflow-type: tm+mt
source-wordcount: '761'
ht-degree: 1%

---

# データアーキテクトおよびデータエンジニア向けAdobe Experience Platformの概要

<!--5min-->

_データアーキテクトおよびデータエンジニア向けAdobe Experience Platformの概要_ は、Experience Platformを実践するための最適な出発点です。


<!--How do we address ETL-->

## 学習内容

データアーキテクトとデータエンジニアは、データのデプロイメントを成功させるために、緊密にExperience Platformを組む必要があります。 この実践チュートリアルでは、が実行する主なタスクについて説明します。 _両方の役割_ お客様自身のビジネスに合わせて Platform の実装を開始する方法を理解している必要があります。 演習では、Experience Platformの主要な用語、機能、インターフェイス、API について説明します。 また、Real-time Customer Data Platform、Customer Journey Analytics、Journey OptimizerなどのAdobe Experience Cloudアプリケーションのお客様は、Platform サービスがこれらのアプリケーションの重要な基礎となるので、このコンテンツも役に立つと考えます。

![このチュートリアルで扱う Platform サービス（ID、プロファイル、セグメント化、取り込み、クエリ、ガバナンス）を重点的に解説するAdobe Experience Cloud Marketecture](assets/marketecture.png)

トピックは次のとおりです。

* ユーザー権限の設定
* サンドボックスの作成
* Developer Console プロジェクトの設定と Platform API の使用
* データ管理 — スキーマ、データセット、ID、結合ポリシー、データガバナンスの作成を含む
* バッチモードとストリーミングモードを使用したデータ取り込み
* Adobe Experience Platform Web SDK を使用した Web データのキャプチャ
* リアルタイム顧客プロファイルの作成
* クエリサービスを使用したデータの検証とデータの抽出
* セグメントの作成

## ビジネスシナリオ

Adobe Experience Platformは、マーケティング目標の達成を支援するように設計された技術プラットフォームです。 ビジネス上の使用例は、テクノロジーの設計と実装の方法を促進する必要があります。 このチュートリアルでは、Luma という架空の小売ブランドに焦点を当てています。 Luma は、複数の国で実店舗を運営しており、Web サイトやモバイルアプリとのオンラインプレゼンスも備えています。 ロイヤリティー、CRM、Web、オフラインの購入データをリアルタイムの顧客プロファイルに組み合わせ、これらのプロファイルをアクティブ化して、マーケティングを次のレベルに引き上げます。 Luma のビジネス目標は、会社の目標と一致する場合と一致しない場合がありますが、このチュートリアルの実践手順を独自のビジネス目標に関連付けることができます。

## 前提条件

* これで、 [Adobe Experience Platformコースの概要](https://experienceleague.adobe.com/?recommended=ExperiencePlatform-U-1-2020.1&amp;lang=ja) を使用し、Platform の機能に精通していること
* Adobe Experience Platform( またはReal-Time CDPやJourney Optimizerなどのプラットフォームベースのアプリケーション ) とデータ収集（旧称 Launch）でプロビジョニングされたアカウントにアクセスできます。
* このアカウントのシステム管理者であるか、または [ユーザー権限の設定](configure-permissions.md) あなたのために。

## このチュートリアルの使用

このチュートリアルでは、データエンジニアとデータアーキテクトの両方のタスクを組み合わせます。 これは入門レベルのチュートリアルなので、両方の役割のタスクを完了できるはずです。 レッスンの多くは、以前のレッスンで実装された内容に基づいて構築されているので、順を追ってレッスンを進める必要があります。 私はどのレッスンをスキップできるかを呼び出します。

このチュートリアルでは、様々な Platform 要素を作成するので、できる限り推奨する名前を付けるようにします。 ただし、組織内の複数のユーザーが同時にこのチュートリアルを受け取る場合に備えて、カスタマイズする必要がある高レベルの要素名がいくつかあります。 例えば、Platform サンドボックスに、「Luma Tutorial Platform」ではなく、「Luma Tutorial Platform - Ignatius J Reilly」という名前を付けることができます。

動かなくなった場合は、まず手順を読み直してから、 ![問題のログ](https://experienceleague.adobe.com/assets/img/feedback.svg) 各ページのサイドバーにあるリンクを使用して、私に連絡します。

## テクニカルノート

### サンドボックス環境

このチュートリアルでは、サンドボックス環境を作成し、それを使用して演習を完了します。 サンドボックス環境を使用すると、実稼動データを妥協することなく、演習や実験を完了して安全におこなうことができます。

### API

Platform は、API を使用して最初に構築されます。 インターフェイスワークフローはすべての主要な Platform ワークフローに対して存在し、主に使用されますが、このチュートリアルでは、API に関する演習をいくつか含んでいます。 Adobe Developer Console での基本的なプロジェクト設定手順を説明し、 [!DNL Postman] 環境とコレクションを参照してください。 チュートリアルを完了すると、Platform API に詳しく、独自のデプロイメントで使用すると便利です。

### サードパーティのテクノロジー

このチュートリアルでは複数のテクノロジーを使用しますが、テクノロジーエコシステムのほぼ完全なAdobeを維持します。 独自の Platform 実装では、Platform を特定のサードパーティテクノロジーと統合する可能性が高くなります。 このチュートリアルをすべてのお客様に対して適切に保つために、より一般的な実装を使用します。

では、最初のレッスンに進みましょう —[権限の設定](configure-permissions.md).
