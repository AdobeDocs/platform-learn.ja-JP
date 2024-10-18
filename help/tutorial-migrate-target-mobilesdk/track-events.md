---
title: イベントの追跡 – Adobe TargetからAdobe Journey Optimizer - Decisioning モバイル拡張機能への移行
description: Adobe Journey Optimizer - Decisioning モバイル拡張機能を使用してAdobe Target コンバージョンイベントをトラッキングする方法を説明します
source-git-commit: afbc8248ad81a5d9080a4fdba1167e09bbf3b33d
workflow-type: tm+mt
source-wordcount: '193'
ht-degree: 1%

---

# Adobe Journey Optimizer - Decisioning モバイル拡張機能を使用して Target コンバージョンイベントを追跡する

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
>アドビは、Target 拡張機能から Decisioning 拡張機能への Mobile Target の移行を成功させるために取り組んでいます。 移行の際に問題が発生した場合、またはこのガイドに重要な情報が欠落していると感じる場合は、[ このコミュニティのディスカッション ](https://experienceleaguecommunities.adobe.com/t5/adobe-experience-platform-data/tutorial-discussion-migrate-target-from-at-js-to-web-sdk/m-p/575587#M463) に投稿してお知らせください。
