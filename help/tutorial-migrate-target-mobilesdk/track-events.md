---
title: トラックイベント - Target を at.js 2.x から Web SDK に移行します
description: Experience Platform Web SDK を使用してAdobe Target コンバージョンイベントをトラッキングする方法について説明します。
source-git-commit: 009548969b88d1bfa6eac23f65b1ca2144f27c34
workflow-type: tm+mt
source-wordcount: '181'
ht-degree: 1%

---

# Platform Web SDK を使用した Target コンバージョンイベントの追跡

Target のコンバージョンイベントは、次のツールで追跡できます。コンバージョンイベントは通常、次のカテゴリに分類されます。

* 設定を必要としない自動的に追跡されたイベント
* ベストプラクティス Platform Web SDK 実装に合わせて調整する必要がある購入コンバージョンイベント
* コードの更新が必要な購入以外のコンバージョンイベント

## 目標トラッキングの比較

次の表では、at.js と Platform Web SDK がコンバージョンイベントをどのように追跡するかを比較しています

| アクティビティの目標 | Target at.js 2.x | Platform Web SDK |
|---|---|---|
| | | |


## 自動的に追跡されたイベント

次のコンバージョン目標では、実装に対する特定の調整は必要ありません。



次に、一貫性のある訪問者プロファイルを作成するための [ クロスドメイン ID 共有を有効にする ](cross-domain.md) 方法を説明します。

>[!NOTE]
>
>アドビは、Target 拡張機能から Optimize 拡張機能へのモバイルターゲットの移行を成功させるために取り組んでいます。 移行の際に問題が発生した場合、またはこのガイドに重要な情報が欠落していると感じる場合は、[ このコミュニティのディスカッション ](https://experienceleaguecommunities.adobe.com/t5/adobe-experience-platform-data/tutorial-discussion-migrate-target-from-at-js-to-web-sdk/m-p/575587#M463) に投稿してお知らせください。
