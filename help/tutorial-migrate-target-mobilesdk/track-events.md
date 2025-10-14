---
title: コンバージョンイベントの追跡 – モバイルアプリのAdobe Target実装をOffer Decisioningおよび Target 拡張機能に移行します
description: Offer Decisioningおよび Target モバイル拡張機能を使用してAdobe Target コンバージョンイベントをトラッキングする方法について説明します
exl-id: 7b53aab1-0922-4d9f-8bf0-f5cf98ac04c4
source-git-commit: 876e664a213aec954105bf2d5547baab5d8a84ea
workflow-type: tm+mt
source-wordcount: '404'
ht-degree: 0%

---

# 決定モバイル拡張機能を使用して Target コンバージョンイベントを追跡

ほとんどの Target アクティビティの目標は、購入、登録、クリック数などの、アプリケーションでの貴重なユーザーアクションを促進することです。 Target 実装では、通常、カスタムコンバージョンイベントを使用して、これらのアクションを追跡します。多くの場合、コンバージョンに関する追加の詳細が含まれています。 Target のコンバージョンイベントは、Target SDKと同様に、「SDKの最適化」で追跡できます。 コンバージョンイベントを追跡するには、次の表に示すように、特定の API を呼び出す必要があります。

| アクティビティの目標 | Target 拡張機能 | Offer Decisioningと Target の拡張機能 |
|---|---|---|
| mbox の場所（スコープ）のビューコンバージョンイベントの追跡 | mbox の場所が表示されている場合は、[displayedLocations](https://developer.adobe.com/client-sdks/solution/adobe-target/api-reference/#displayedlocations){target=_blank} API を呼び出します | mbox の場所のオファーが表示されたら、[&#x200B; 表示 &#x200B;](https://developer.adobe.com/client-sdks/edge/adobe-journey-optimizer-decisioning/#proposition-tracking-using-direct-offer-class-methods){target=_blank} API を呼び出します。 これにより、event type decisioning.propositionDisplay を含むイベントが Experience Edge Network に送信されます。 **これは、Target アクティビティで訪問者を増やすために不可欠であり、通常の Target オファーとデフォルトの Target オファーの両方を配信する際に行う必要があります。** |
| mbox の場所（スコープ）のクリックコンバージョンイベントの追跡 | mbox の場所がクリックされた場合は、で [clickedLocations](https://developer.adobe.com/client-sdks/solution/adobe-target/api-reference/#displayedlocations){target=_blank} API を呼び出します | mbox の場所に対するオファーがクリックされたら、[&#x200B; タップ済み &#x200B;](https://developer.adobe.com/client-sdks/edge/adobe-journey-optimizer-decisioning/#proposition-tracking-using-direct-offer-class-methods){target=_blank} API を呼び出します。 これにより、イベントタイプ decisioning.propositionInteract を持つイベントが Experience Edge ネットワークに送信されます。 |
| Target プロファイルパラメーターや注文の詳細など、追加データを含む可能性のあるカスタムコンバージョンイベントを追跡します | [displayedLocations](https://developer.adobe.com/client-sdks/solution/adobe-target/api-reference/#displayedlocations){target=_blank} および [clickedLocations](https://developer.adobe.com/client-sdks/solution/adobe-target/api-reference/#displayedlocations){target=_blank} API によって提供される TargetParameters フィールドに追加データを渡します | mbox の場所のオファーで使用可能なパブリックメソッド [generateDisplayInteractionXdm](https://developer.adobe.com/client-sdks/edge/adobe-journey-optimizer-decisioning/#proposition-tracking-using-edge-extension-api){target=_blank} および [generateTapInteractionXdm](https://developer.adobe.com/client-sdks/edge/adobe-journey-optimizer-decisioning/#proposition-tracking-using-edge-extension-api){target=_blank} API を使用して、表示用およびクリック用に XDM 形式のデータを生成します。 次に、Edge SDK [sendEvent](https://developer.adobe.com/client-sdks/edge/edge-network/api-reference/#sendevent){target=_blank} API を呼び出して、このトラッキング XDM データを、追加の XDM およびフリーフォームデータと共に Experience Edge ネットワークに送信します。 |


次に、Offer Decisioningおよび Target 拡張機能との互換性を確保するための [&#x200B; オーディエンスとプロファイルスクリプトの更新 &#x200B;](update-audiences.md) 方法について説明します。

>[!NOTE]
>
>アドビは、Target 拡張機能からOffer Decisioningおよび Target 拡張機能への Mobile Target の移行を成功させるために取り組んでいます。 移行の際に問題が発生した場合、またはこのガイドに重要な情報が欠落していると感じる場合は、[&#x200B; このコミュニティのディスカッション &#x200B;](https://experienceleaguecommunities.adobe.com/t5/adobe-experience-platform-data/tutorial-discussion-migrate-target-from-at-js-to-web-sdk/m-p/575587?profile.language=ja#M463) に投稿してお知らせください。
