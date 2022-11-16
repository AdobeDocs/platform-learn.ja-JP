---
title: 概要
description: 概要
exl-id: 527d8f73-33d0-45a6-b7a4-5e46cdb7c138
source-git-commit: cc7a77c4dd380ae1bc23dc75608e8e2224dfe78c
workflow-type: tm+mt
source-wordcount: '307'
ht-degree: 2%

---

# Adobe Experience Platform Data Collection を使用

ユーザーのブラウザーで発生するイベントに関するデータを収集することは、マーケティング戦略の基本的な要素です。 Adobeには、このデータを管理するためのツールがいくつか用意されています。 このチュートリアルでは、各ツールに個別に慣れ親しむことができますが、これらの各ツールの動作と、ツールが共通の目標を達成するためにどのように連携して動作するかについて、より広い視野を提供することを目的としています。

このチュートリアルでは、次の戦略について説明します。

1. Adobe Experience Platform内でのデータの構造化と保持
1. ブラウザーでのデータの管理と、特定のイベントが発生したことを伝える
1. 関連するデータをAdobe Experience Platformに送信して、これらのイベントに対応する。

このチュートリアルではAdobeクライアントデータレイヤー、Adobe Experience Platform Web SDK、 [!DNL Tags] より規範的でシームレスな実装を実現するために、これらのツールをサードパーティや社内のツールと組み合わせて、最大限の柔軟性を実現することもできます。

## サンプルシナリオ

このチュートリアルでは、e コマースサイトのシンプルな製品ページのデータ収集を実装します。

1. 製品ページがブラウザーに読み込まれます。 ここでは、ユーザーが製品を表示したことを追跡します。
1. ユーザーは製品の購入を決定したので、ボタンをクリックして製品を買い物かごに追加します。 ここでは、ユーザーが新しい買い物かごを開き、エクスペリエンスイベントをAdobe Experience Platformに送信して、製品が買い物かごに追加されたことを追跡します。
1. 最後に、ユーザーが _アプリをダウンロード_ リンクとは別のユーザーがモバイルアプリに興味を持っているからです。 ユーザーがリンクをクリックしたことを追跡します。

それでは、始めましょう。

[次へ： ](structuring-your-data.md)

>[!NOTE]
>
>データ収集に関する学習に時間を割いていただき、ありがとうございます。 ご質問がある場合、一般的なフィードバックを共有したい場合、または今後のコンテンツに関する提案がある場合は、こちらで共有してください [Experience Leagueコミュニティディスカッション投稿](https://experienceleaguecommunities.adobe.com/t5/adobe-experience-platform-launch/tutorial-discussion-use-adobe-experience-platform-data/m-p/543877)
