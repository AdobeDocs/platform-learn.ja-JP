---
title: イベントの追跡 – Adobe TargetからAdobe Journey Optimizer - Decisioning モバイル拡張機能への移行
description: Adobe Journey Optimizer - Decisioning モバイル拡張機能を使用してAdobe Target コンバージョンイベントをトラッキングする方法を説明します
exl-id: 7b53aab1-0922-4d9f-8bf0-f5cf98ac04c4
source-git-commit: 314f0279ae445f970d78511d3e2907afb9307d67
workflow-type: tm+mt
source-wordcount: '199'
ht-degree: 1%

---

# Adobe Journey Optimizer - Decisioning モバイル拡張機能を使用して Target コンバージョンイベントを追跡する

コンテンツについては、次のページを参照してください。https://developer.adobe.com/client-sdks/edge/adobe-journey-optimizer-decisioning/#tracking

Target のコンバージョンイベントは、次のツールで追跡できます。コンバージョンイベントは通常、次のカテゴリに分類されます。

* 設定を必要としない自動的に追跡されたイベント
* ベストプラクティスの意思決定拡張機能の実装に合わせて調整する必要がある購入コンバージョンイベント
* コードの更新が必要な購入以外のコンバージョンイベント

## 目標トラッキングの比較

次の表では、at.js と Platform Web SDKがコンバージョンイベントをどのようにトラッキングするかを比較しています

| アクティビティの目標 | Target at.js 2.x | Platform Web SDK |
|---|---|---|
| | | |


## 自動的に追跡されたイベント

次のコンバージョン目標では、実装に対する特定の調整は必要ありません。



次に、一貫性のある訪問者プロファイルを作成するための [ クロスドメイン ID 共有を有効にする ](webview.md) 方法を説明します。

>[!NOTE]
>
>アドビは、Target 拡張機能から Decisioning 拡張機能への Mobile Target の移行を成功させるために取り組んでいます。 移行の際に問題が発生した場合、またはこのガイドに重要な情報が欠落していると感じる場合は、[ このコミュニティのディスカッション ](https://experienceleaguecommunities.adobe.com/t5/adobe-experience-platform-data/tutorial-discussion-migrate-target-from-at-js-to-web-sdk/m-p/575587#M463) に投稿してお知らせください。
