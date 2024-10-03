---
title: データアーキテクトおよびデータエンジニア向けAdobe Experience Platformの概要
description: データアーキテクトおよびデータエンジニア向けAdobe Experience Platformの概要。
breadcrumb-title: 概要
role: Data Architect, Data Engineer
jira: KT-4348
thumbnail: 4348-overview.jpg
recommendations: catalog, noDisplay
last-substantial-update: 2023-06-21T00:00:00Z
exl-id: fabbc591-840b-40dc-89af-305626a16338
source-git-commit: 63987fb652a653283a05a5f35f7ce670127ae905
workflow-type: tm+mt
source-wordcount: '771'
ht-degree: 0%

---

# データアーキテクトおよびデータエンジニア向けAdobe Experience Platformの概要

<!--5min-->

_データアーキテクトおよびデータエンジニア向けAdobe Experience Platform使用の手引き_ は、Experience Platformを実際に体験するための最適な出発点です。


<!--How do we address ETL-->

## 学習内容

データアーキテクトとデータエンジニアが緊密に連携して、Experience Platformの導入を成功させる必要があります。 この実践チュートリアルでは、_両方の役割_ で実行される主なタスクについて説明するので、自分のビジネスに Platform を実装する方法を理解できます。 Experience Platformの主な用語、機能、インターフェイス、API を紹介する演習を通じてガイドされます。 Real-time Customer Data Platform、Customer Journey Analytics、Journey OptimizerなどのAdobe Experience Cloud アプリケーションのお客様も、Platform サービスがこれらのアプリケーションの重要な基盤となるので、このコンテンツが役立つことに気付くでしょう。

![ このチュートリアルで扱う Platform サービスを重点的に解説したAdobe Experience Cloud マーケテクチャ - ID、プロファイル、セグメント化、取り込み、クエリ、ガバナンス ](assets/marketecture.png)

トピックは次のとおりです。

* ユーザー権限の設定
* サンドボックスの作成
* Developer Console プロジェクトの設定と Platform API の使用
* データ管理（スキーマ、データセット、ID、結合ポリシー、データガバナンスの作成を含む）
* バッチモードとストリーミングモードを使用したデータ取り込み
* Adobe Experience Platform Web SDK を使用した web データのキャプチャ
* リアルタイム顧客プロファイルの作成
* クエリサービスを使用したデータの検証と抽出
* セグメントの作成

## ビジネスシナリオ

Adobe Experience Platformは、マーケティング目標の達成を支援するように設計されたテクニカルプラットフォームです。 ビジネスユースケースでは、テクノロジーの設計および実装方法を推進する必要があります。 このチュートリアルでは、Luma と呼ばれる架空の小売ブランドに焦点を当てます。 Luma は、複数の国で実店舗を運営しているほか、web サイトやモバイルアプリを備えたオンラインプレゼンスもあります。 ロイヤルティ、CRM、web、オフラインの購入データをリアルタイムの顧客プロファイルに結合し、これらのプロファイルをアクティブ化してマーケティングを次のレベルに引き上げるために、Adobe Experience Platformへの投資を進めています。 Luma のビジネス目標は、会社の目標と一致する場合もあれば、一致しない場合もありますが、このチュートリアルの実践的な手順を独自のビジネス目標に関連付けることができます。

## 前提条件

* あなたはExperience Leagueーで [Adobe Experience Platform プレイリストの概要 ](https://experienceleague.adobe.com/en/playlists/experience-platform-introduction) を見ており、Platform の機能をよく知っています
* Adobe Experience Platform（またはReal-Time CDPやJourney Optimizerなどの Platform ベースのアプリケーション）とデータ収集（以前の Launch）でプロビジョニングされたアカウントにアクセスできます。
* そのアカウントのシステム管理者であるか、1 つの [ ユーザー権限の設定 ](configure-permissions.md) を持つことができます。

## このチュートリアルの使用

このチュートリアルでは、データエンジニアとデータアーキテクトの両方のタスクを組み合わせます。 これは初級レベルのチュートリアルなので、両方の役割のタスクを完了できます。 多くのレッスンは、以前のレッスンで実装されたものに基づいて構築されているので、順番にレッスンを進める必要があります。 どの授業を省略してよいか私が注意します。

このチュートリアルで様々な Platform 要素を作成する際は、できるだけ推奨する名前に従ってください。 ただし、組織で複数のユーザーが同時にこのチュートリアルを実行する場合に備えて、カスタマイズした高レベルの要素名がいくつかあります。 例えば、Platform サンドボックスに、単に「Luma チュートリアルプラットフォーム」ではなく「Luma チュートリアルプラットフォーム - Ignatius J Reilly」という名前を付けることができます。

問題が発生した場合は、最初に手順を再度読んでから、各ページのサイドバーにある ![ 問題を記録 ](https://experienceleague.adobe.com/assets/img/feedback.svg) リンクを使用して連絡してください。

## テクニカルノート

### サンドボックス環境

このチュートリアルでは、サンドボックス環境を作成し、それを使用して演習を完了します。 サンドボックス環境を使用すると、実稼動データの妥協を気にすることなく、安全に演習と実験を完了できます。

### API

Platform は、API ファーストで構築されています。 インターフェイスワークフローは、すべての主要な Platform ワークフローに存在し、主に使用されますが、チュートリアルには API 指向の演習がいくつか含まれています。 Adobe Developer Consoleの基本的なプロジェクト設定を順を追って説明し、Platform API を使い始めるための環境とコレクション [!DNL Postman] 提供します。 チュートリアルを完了すると、Platform API を熟知して、独自のデプロイメントで使用できることが役に立つ場合があります。

### サードパーティのテクノロジー

このチュートリアルでは複数のテクノロジーを使用しますが、ほぼ完全にAdobeエコシステム内に残ります。 お客様の Platform 実装では、Platform を特定のサードパーティテクノロジーと統合する可能性が高くなります。 このチュートリアルをすべてのお客様に適切なものにするために、より一般的な実装を使用します。

## チュートリアルの最新情報

* 2023 年 6 月：新しい権限ワークフローを含み、OAuth サーバー間 API 資格情報を使用するように更新されました


次に、最初のレッスンである [ 権限の設定 ](configure-permissions.md) に進みます。
