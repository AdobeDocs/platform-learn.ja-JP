---
title: Adobe Journey Optimizer — 外部の気象 API、SMS アクションなど — 概要
description: Adobe Journey Optimizer — 外部の気象 API、SMS アクションなど — 概要
kt: 5342
audience: Data Engineer, Data Architect, Orchestration Engineer, Marketer
doc-type: tutorial
activity: develop
exl-id: d40cde78-bc7d-49b2-9ca4-158e1f3d8456
source-git-commit: cc7a77c4dd380ae1bc23dc75608e8e2224dfe78c
workflow-type: tm+mt
source-wordcount: '337'
ht-degree: 3%

---

# 概要とメリット

Adobe Journey OptimizerとAdobe Experience Platformの学習に時間を割いていただき、ありがとうございます。
このモジュールでは、Adobe Journey Optimizerを使用して、顧客が POI（目標地点）周辺の特定のジオフェンスに入ったときにトリガーされるジャーニーを設定する方法を学びました。 これが発生した場合、その POI の現在の天気データにリアルタイムでアクセスできる外部データソースを設定して使用しました。これは、ジャーニーのパスと顧客に送信されるメッセージに影響します。 このメッセージは、Journey Optimizerとメッセージチャネルを使用した SMS の 2 つのアクションにSlackされました。

## メリット

Adobe Journey OptimizerとAdobe Experience Platformを使用するメリットについて説明します。

- 顧客とのコミュニケーションは、リアルタイムで状況に応じたものである必要があります。 Adobe Journey Optimizerを使用すると、特定の顧客が開始したイベントをリッスンし、顧客が特定のジャーニーをいつ実行するかに応じて、コンテキストジャーニーを慎重にキュレーションできるようになります。
- ジャーニーの編成には、待ち時間、Adobe Experience Platformのデータが別のパスに送信される条件、この例の Weather API などのカスタム外部データソース、また、API を持つ任意のアプリケーションがAdobe Journey Optimizerからどのコンテンツを表示するかに関する指示を受け取るカスタムアクションが含まれます。
- パーソナライズされたエンゲージメントは、顧客とのやり取りに使用されるあらゆるチャネルで真の意味で実現できるようになりました。

## 確認する

- テクニカルブログ： [Adobe Journey Optimizer](https://medium.com/adobetech/journey-orchestration-in-an-omnichannel-world-3a2d32d556d9)
- テクニカルブログ： [パーソナライズされたオムニチャネルエクスペリエンスをリアルタイムで構築するAdobeの新しいAdobe Journey Optimizerサービスの力を実演](https://medium.com/adobetech/demonstrating-the-power-of-adobes-new-journey-orchestration-service-to-build-personalized-aa60d88cd34)
- Tutorials: [Adobe Journey OptimizerTutorials](https://experienceleague.adobe.com/docs/journey-orchestration-learn/tutorials/understanding-journey-orchestration.html?lang=ja)
- Experience Platformドキュメント： [Adobe Journey Optimizer Help](https://experienceleague.adobe.com/docs/journeys/using/journey-orchestration-home.html?lang=ja)

[モジュール 8 に戻る](journey-orchestration-external-weather-api-sms.md)

[すべてのモジュールに戻る](../../overview.md)
