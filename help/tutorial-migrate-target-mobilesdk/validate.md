---
title: Web SDK での Target 実装の検証 – Target を at.js 2.x から Web SDK に移行します
description: Adobe Experience Platform Web SDK を使用してアクティビティを検証し、Adobe Target実装をデバッグする方法について説明します。
source-git-commit: 009548969b88d1bfa6eac23f65b1ca2144f27c34
workflow-type: tm+mt
source-wordcount: '315'
ht-degree: 1%

---

# Platform Web SDK 実装の検証

Target 実装を Target 拡張機能から Optimize 拡張機能に移行した後、実稼動アプリに変更を公開する前に、すべてが正しく機能していることを検証することが重要です。 Adobeでは次のことをお勧めします。詳しくは、このページを参照してください。

* 技術検証を実行し、基本的な実装および Platform Mobile SDK のリクエストと応答が正しいことを確認します
* Target アクティビティが適切に配信およびレンダリングされることを確認します。
* レポートが正しく機能することを確認します
* オーディエンスとプロファイルスクリプトを再確認して、Platform Mobile SDK および Optimizer 拡張機能と互換性があることを確認します
* Adobeまたはサードパーティアプリケーションとの統合が正しく機能することを確認します

Target の実装は、使用するサイトのアーキテクチャと機能によって異なります。 以下の表を出発点として使用し、実装に固有の項目を追加することができます。 このチュートリアルの [ デバッグページ ](debugging.md) には、この検証に役立つツールが表示されています。

## 技術的検証

| 検証項目 | メモ |
|---|---|
| | |


## アクティビティの配信とレンダリング

|検証項目 |備考 |
| | |

## レポート

|検証項目 |備考 |
| | |

## オーディエンスとプロファイルスクリプト

| 検証項目 | メモ |
|---|---|
| | |

## Adobeアプリケーションとの統合

|検証項目 |備考 |
| | |

## サードパーティアプリケーションとの統合

| 検証項目 | メモ |
|---|---|
| | |

上記の検証手順を実行したら、最適化拡張機能を備えた Platform Mobile SDK 実装が、実稼動環境に移行する準備が整っていることを確認できます。

次に、Platform Web SDK を使用した Target 実装のトラブルシューティング [ 方法を説明 ](debugging.md) ます。

>[!NOTE]
>
>アドビは、Target 拡張機能から Optimize 拡張機能へのモバイルターゲットの移行を成功させるために取り組んでいます。 移行の際に問題が発生した場合、またはこのガイドに重要な情報が欠落していると感じる場合は、[ このコミュニティのディスカッション ](https://experienceleaguecommunities.adobe.com/t5/adobe-experience-platform-data/tutorial-discussion-migrate-target-from-at-js-to-web-sdk/m-p/575587#M463) に投稿してお知らせください。
