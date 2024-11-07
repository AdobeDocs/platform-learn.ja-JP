---
title: Microsoft Azure Event Hub に対するセグメントのアクティベーション
description: Microsoft Azure Event Hub に対するセグメントのアクティベーション
kt: 5342
doc-type: tutorial
source-git-commit: 2cdc145d7f3933ec593db4e6f67b60961a674405
workflow-type: tm+mt
source-wordcount: '567'
ht-degree: 0%

---

# 2.4 Real-Time CDP:Microsoft Azure Event Hub へのセグメントのアクティベーション

**著者：[Marc Meewis](https://www.linkedin.com/in/marcmeewis/)、[Wouter Van Geluwe](https://www.linkedin.com/in/woutervangeluwe/)**

このモジュールでは、Adobe Experience Platform Real-time CDP のリアルタイムの宛先として、Microsoft Azure EventHub の宛先を設定します。 また、Adobe Experience Platformがセグメントペイロードを Azure EventHub の宛先に配信するたびにリアルタイムにトリガーされる Azure 関数をセットアップしてデプロイします。 トリガーする Azure 関数は、Adobe Experience Platform Real-time CDP のアクティベーション機能のメカニズムを示します。

また、このモジュールの一部として、指定された宛先にペイロードを実際に配信する Real-time CDP のトリガーについても理解します。 また、セグメントの選定のステータスと、アクティブ化との関係についても説明します。

Adobe Experience Platform Real-time CDP は、ストリーミングクラウドストレージの宛先へのデータアクティベーションをサポートしており、オーディエンスデータとイベントを、JSON 形式でこれらの宛先にリアルタイムで書き出すことができます。 その後、宛先でこれらのイベントにビジネスロジックを記述できます

Microsoft Azure Event Hubs は、シンプルで信頼でき、拡張性の高い、完全に管理されたリアルタイムのデータ取り込みサービスです。 あらゆるソースから 1 秒あたり数百万ものイベントをストリーミングして、動的データパイプラインを構築し、ビジネス上の課題に直ちに対応します。

## 学習内容

- Microsoft Azure Event Hubs の理解
- Microsoft Azure Event Hub への RTCDP 宛先の設定
- Real-time CDP がアクティブ化されるタイミングと、アクティベーションペイロードがどのようなものかを理解します
- Azure プロジェクトを開発、テスト、デプロイするための Visual Studio Code のセットアップ
- RTCDP によってリアルタイムに配信されるセグメント選定を使用する Azure 関数を作成してデプロイします

## 前提条件

- [Adobe Experience Platform](https://experience.adobe.com/platform) へのアクセス
- AEP デモ Web サイト環境に精通していること
- Adobe Experience Platformでストリーミングセグメントを定義、使用、アクティブ化する方法について説明します。

>[!NOTE]
>
>[0.1 -Experience Leagueドキュメント用のChrome拡張機能のインストールで参照されているように、Chrome拡張機能をインストール、設定および使用することを忘れないでください ](../../gettingstarted/gettingstarted/ex1.md)

## 演習

[2.4.0 環境の設定](./ex0.md)

この演習では、Microsoft Azure 環境を設定します。

[2.4.1 Microsoft Azure EventHub 環境の設定](./ex1.md)

この演習では、Microsoft Azure EventHub 環境を設定します。

[2.4.2 Adobe Experience Platformでの Azure Event Hub の宛先の設定](./ex2.md)

この演習では、前の演習で設定した EventHub にリアルタイムでセグメントを配信する Real-time CDP 宛先接続を設定します。

[2.4.3 セグメントの作成](./ex3.md)

この演習では、Adobe Experience Platformでストリーミングセグメントを作成します

[2.4.4 セグメントのアクティブ化](./ex4.md)

この演習では、Real-time CDP EventHub 宛先へのストリーミングセグメントをアクティブ化します。

[2.4.5 Microsoft Azure プロジェクトの作成](./ex5.md)

この演習では、AdobeExperience Platform が対応する Azure Event Hub 宛先に対してセグメントの選定をアクティブ化したときにリアルタイムにトリガーされる Azure 関数を作成します。

[2.4.6 エンドツーエンドのシナリオ](./ex6.md)

この時点で、すべてが設定されています。 AEP デモ web サイトでブラウジングを実行し、セグメントの選定をMicrosoft Azure EventHubトリガー関数に配信できるようになりました。

[概要と利点](./summary.md)

このモジュールの概要とメリットの概要

>[!NOTE]
>
>Adobe Experience Platformとそのアプリケーションについて知るのに時間を費やしていただき、ありがとうございます。 ご不明な点がある場合は、have suggestions on future content の一般的なフィードバックをお知らせください。**techinsiders@adobe.com** に電子メールを送信して、技術インサイダーに直接問い合わせてください。

[すべてのモジュールに戻る](../../../overview.md)
