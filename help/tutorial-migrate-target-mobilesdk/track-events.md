---
title: コンバージョンイベントの追跡 – モバイルアプリのAdobe Target実装をAdobe Journey Optimizer - Decisioning 拡張機能に移行します
description: Adobe Journey Optimizer - Decisioning モバイル拡張機能を使用してAdobe Target コンバージョンイベントをトラッキングする方法を説明します
exl-id: 7b53aab1-0922-4d9f-8bf0-f5cf98ac04c4
source-git-commit: d2da62ed2d36f73af1c8053be5af27feea32cb14
workflow-type: tm+mt
source-wordcount: '395'
ht-degree: 0%

---

# 決定モバイル拡張機能を使用して Target コンバージョンイベントを追跡

ほとんどの Target アクティビティの目標は、購入、登録、クリック数などの、アプリケーションでの貴重なユーザーアクションを促進することです。 Target 実装では、通常、カスタムコンバージョンイベントを使用して、これらのアクションを追跡します。多くの場合、コンバージョンに関する追加の詳細が含まれています。 Target のコンバージョンイベントは、Target SDKと同様に、「SDKの最適化」で追跡できます。 コンバージョンイベントを追跡するには、次の表に示すように、特定の API を呼び出す必要があります。

| アクティビティの目標 | Target 拡張機能 | Decisioning 拡張機能 |
|---|---|---|
| mbox の場所（スコープ）のビューコンバージョンイベントの追跡 | mbox の場所が表示されている場合は、[displayedLocations](https://developer.adobe.com/client-sdks/solution/adobe-target/api-reference/#displayedlocations){target=_blank} API を呼び出します | mbox の場所のオファーが表示されたら、[ 表示 ](https://developer.adobe.com/client-sdks/edge/adobe-journey-optimizer-decisioning/#proposition-tracking-using-direct-offer-class-methods){target=_blank} API を呼び出します。 これにより、event type decisioning.propositionDisplay を含むイベントが Experience Edge Network に送信されます。 **これは、Target アクティビティで訪問者を増やすために不可欠であり、通常の Target オファーとデフォルトの Target オファーの両方を配信する際に行う必要があります。** |
| mbox の場所（スコープ）のクリックコンバージョンイベントの追跡 | mbox の場所がクリックされた場合は、で [clickedLocations](https://developer.adobe.com/client-sdks/solution/adobe-target/api-reference/#displayedlocations){target=_blank} API を呼び出します | mbox の場所に対するオファーがクリックされたら、[ タップ済み ](https://developer.adobe.com/client-sdks/edge/adobe-journey-optimizer-decisioning/#proposition-tracking-using-direct-offer-class-methods){target=_blank} API を呼び出します。 これにより、イベントタイプ decisioning.propositionInteract を持つイベントが Experience Edge ネットワークに送信されます。 |
| Target プロファイルパラメーターや注文の詳細など、追加データを含む可能性のあるカスタムコンバージョンイベントを追跡します | [displayedLocations](https://developer.adobe.com/client-sdks/solution/adobe-target/api-reference/#displayedlocations){target=_blank} および [clickedLocations](https://developer.adobe.com/client-sdks/solution/adobe-target/api-reference/#displayedlocations){target=_blank} API によって提供される TargetParameters フィールドに追加データを渡します | mbox の場所のオファーで使用可能なパブリックメソッド [generateDisplayInteractionXdm](https://developer.adobe.com/client-sdks/edge/adobe-journey-optimizer-decisioning/#proposition-tracking-using-edge-extension-api){target=_blank} および [generateTapInteractionXdm](https://developer.adobe.com/client-sdks/edge/adobe-journey-optimizer-decisioning/#proposition-tracking-using-edge-extension-api){target=_blank} API を使用して、表示用およびクリック用に XDM 形式のデータを生成します。 次に、Edge SDK [sendEvent](https://developer.adobe.com/client-sdks/edge/edge-network/api-reference/#sendevent){target=_blank} API を呼び出して、このトラッキング XDM データを、追加の XDM およびフリーフォームデータと共に Experience Edge ネットワークに送信します。 |


次に、Decisioning 拡張機能との互換性を確保するために [ オーディエンスとプロファイルスクリプトを更新 ](update-audiences.md) する方法を説明します。

>[!NOTE]
>
>アドビは、Target 拡張機能から Decisioning 拡張機能への Mobile Target の移行を成功させるために取り組んでいます。 移行の際に問題が発生した場合、またはこのガイドに重要な情報が欠落していると感じる場合は、[ このコミュニティのディスカッション ](https://experienceleaguecommunities.adobe.com/t5/adobe-experience-platform-data/tutorial-discussion-migrate-target-from-at-js-to-web-sdk/m-p/575587?profile.language=ja#M463) に投稿してお知らせください。
