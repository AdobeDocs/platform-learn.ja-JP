---
title: Microsoft Azure Event Hub へのAudience Activation
description: Microsoft Azure Event Hub へのAudience Activation
kt: 5342
doc-type: tutorial
exl-id: 23713cb4-2055-43e8-9380-0ca8845a75e8
source-git-commit: bd46be455f88007174f7e6be9a1ce5f508edc09b
workflow-type: tm+mt
source-wordcount: '551'
ht-degree: 0%

---

# 2.4 Real-Time CDP:Microsoft Azure Event Hub へのAudience Activation

このモジュールでは、Adobe Experience Platform Real-time CDP のリアルタイムの宛先として、Microsoft Azure EventHub の宛先を設定します。 また、Adobe Experience Platformが Azure EventHub の宛先にオーディエンスペイロードを配信するたびにリアルタイムでトリガーされる Azure 関数をセットアップしてデプロイします。 トリガーする Azure 関数は、Adobe Experience Platform Real-time CDP のアクティベーション機能のメカニズムを示します。

また、このモジュールの一部として、指定された宛先にペイロードを実際に配信する Real-time CDP のトリガーについても理解します。 また、オーディエンスの選定のステータスと、アクティベーションとの関係についても説明します。

Adobe Experience Platform Real-time CDP は、ストリーミングクラウドストレージの宛先へのデータアクティベーションをサポートしており、オーディエンスデータとイベントを、JSON 形式でこれらの宛先にリアルタイムで書き出すことができます。 その後、宛先でこれらのイベントにビジネスロジックを記述できます

Microsoft Azure Event Hubs は、シンプルで信頼でき、拡張性の高い、完全に管理されたリアルタイムのデータ取り込みサービスです。 あらゆるソースから 1 秒あたり数百万ものイベントをストリーミングして、動的データパイプラインを構築し、ビジネス上の課題に直ちに対応します。

## 学習内容

- Microsoft Azure Event Hubs の理解
- Microsoft Azure Event Hub への RTCDP 宛先の設定
- Real-time CDP がアクティブ化されるタイミングと、アクティベーションペイロードがどのようなものかを理解します
- Azure プロジェクトを開発、テスト、デプロイするための Visual Studio Code のセットアップ
- RTCDP によってリアルタイムに配信されるオーディエンス選定を使用する Azure 関数を作成してデプロイします

## 前提条件

- [Adobe Experience Platform](https://experience.adobe.com/platform) へのアクセス
- Adobe Experience Platformでオーディエンスを定義、使用およびアクティブ化する方法を理解します。

>[!NOTE]
>
>Experience LeagueドキュメントのChrome拡張機能のインストール [&#x200B; で参照されているように、Chrome拡張機能をインストール、設定および使用することを忘れないでください &#x200B;](../../gettingstarted/gettingstarted/ex1.md)

## 演習

[2.4.1 環境の設定](./ex1.md)

この演習では、Microsoft Azure 環境を設定します。

[2.4.2 Microsoft Azure EventHub 環境の設定](./ex2.md)

この演習では、Microsoft Azure EventHub 環境を設定します。

[2.4.3 Adobe Experience Platformでの Azure Event Hub の宛先の設定](./ex3.md)

この演習では、前の演習で設定したイベントハブインスタンスにオーディエンスをリアルタイムで配信する Real-time CDP 宛先接続を設定します。

[2.4.4 オーディエンスの作成](./ex4.md)

この演習では、Adobe Experience Platformでオーディエンスを作成します

[2.4.5 オーディエンスのアクティブ化](./ex5.md)

この演習では、EventHub 宛先に対するオーディエンスをアクティブ化します。

[2.4.6 Microsoft Azure プロジェクトの作成](./ex6.md)

この演習では、Experience Platform が対応する Azure Event Hub 宛先にオーディエンスの選定を配信する際に、リアルタイムでトリガーされる Azure 関数をAdobeします。

[2.4.7 エンドツーエンドのシナリオ](./ex7.md)

この時点で、すべてが設定されています。 デモ Web サイトでブラウジングを実行し、Microsoft Azure Event Hub のトリガー機能に配信されるオーディエンスの選定を取得できるようになりました。

[概要と利点](./summary.md)

このモジュールの概要とメリットの概要

![&#x200B; 技術インサイダー &#x200B;](./../../../assets/images/techinsiders.png){width="50px" align="left"}

>[!NOTE]
>
>Adobe Experience Platformとそのアプリケーションについて知るのに時間を費やしていただき、ありがとうございます。 ご不明な点がある場合は、have suggestions on future content の一般的なフィードバックをお知らせください。**techinsiders@adobe.com** に電子メールを送信して、技術インサイダーに直接問い合わせてください。

[すべてのモジュールに戻る](../../../overview.md)
