---
title: Foundation - データ取り込み
description: Foundation - データ取り込み
kt: 5342
doc-type: tutorial
exl-id: 0fa38179-637b-4dda-a4e4-754a4cdd61a8
source-git-commit: 3d61d91111d8693ab031fbd7b26706c02818108c
workflow-type: tm+mt
source-wordcount: '398'
ht-degree: 1%

---

# 1.2 データ取り込み

このモジュールの目標は、データ取り込みについてすべて学習することです。 ストリーミングとバッチでのデータ取り込みについて説明します。 Launch を使用してストリーミングデータ取り込みを実装し、実践ラボ web サイトでのお客様の行動がリアルタイムでAdobe Experience Platformにストリーミングされるようにします。 Adobe Experience Platform ワークフローを使用して CSV ファイルを取得し、XDM スキーマにマッピングしてから、Adobe Experience Platformに取り込むことで、バッチデータ取り込みについて説明します。

## 学習内容

- Adobe Experience Platformで XDM スキーマを作成する方法を説明します
- Adobe Experience Platformでデータセットを作成する方法を説明します
- Launch でストリーミングエンドポイントを作成し、Adobe Experience Platform拡張機能を設定する方法について説明します
- Launch でルールを作成して、データをAdobe Experience Platformにストリーミングする方法を説明します
- Adobe Experience Platform Launchを web ページに統合する方法を学ぶ
- Adobe Experience Platform ワークフローを使用して CSV ファイルをAdobe Experience Platformに取り込む方法を説明します

## 前提条件

- Adobe Experience Platformへのアクセス：[https://experience.adobe.com/platform](https://experience.adobe.com/platform)
- Adobe Experience Platform Launchへのアクセス：[https://experience.adobe.com/#/data-collection/](https://experience.adobe.com/#/data-collection/)
- Postmanへのアクセス

>[!NOTE]
>
>[Experience League ドキュメントのChrome拡張機能のインストール &#x200B;](../../../getting-started/gettingstarted/ex1.md) で参照されているように、Chrome拡張機能をインストール、設定、使用することを忘れないでください。

## 演習

[1.2.1 Web サイトを参照する](./ex1.md)

この演習では、このイネーブルメントの一部として使用する web サイトを確認します。

[1.2.2 スキーマの設定と識別子の設定](./ex2.md)

この演習では、プロファイル情報と顧客の行動を取得するために必要な XDM スキーマのを設定します。 また、すべての XDM スキーマで、すべての情報をリンクするプライマリ識別子を設定する必要があります。

[1.2.3 データセットの設定](./ex3.md)

この演習では、プロファイル情報と顧客行動を取得および保存するために必要なデータセットを取得します。

[1.2.4 オフラインソースからのデータ取り込み](./ex4.md)

この演習では、web サイトとモバイルアプリを操作し、顧客のように動作して、データを Platform にストリーミングします。

[1.2.5 データランディングゾーン](./ex5.md)

Azure Blob Storage を使用して Data Landing Zone Source コネクタを設定します。

[概要と利点](./summary.md)

このモジュールの概要とメリットの概要

![&#x200B; 技術インサイダー &#x200B;](./../../../../assets/images/techinsiders.png){width="50px" align="left"}

>[!NOTE]
>
>Adobe Experience Platformとそのアプリケーションについて知るのに時間を費やしていただき、ありがとうございます。 ご不明な点がある場合は、have suggestions on future content の一般的なフィードバックをお知らせください。**techinsiders@adobe.com** に電子メールを送信して、技術インサイダーに直接問い合わせてください。

[すべてのモジュールに戻る](./../../../../overview.md)
