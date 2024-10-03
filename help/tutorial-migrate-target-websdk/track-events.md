---
title: トラックイベント - Target を at.js 2.x から Web SDK に移行します
description: Experience Platform Web SDK を使用してAdobe Target コンバージョンイベントをトラッキングする方法について説明します。
exl-id: 5da772bc-de05-4ea9-afbd-3ef58bc7f025
source-git-commit: d4308b68d6974fe47eca668dd16555d15a8247c9
workflow-type: tm+mt
source-wordcount: '635'
ht-degree: 1%

---

# Platform Web SDK を使用した Target コンバージョンイベントの追跡

Target のコンバージョンイベントは、at.js と同様に、Platform Web SDK で追跡できます。 コンバージョンイベントは通常、次のカテゴリに分類されます。

* 設定を必要としない自動的に追跡されたイベント
* ベストプラクティス Platform Web SDK 実装に合わせて調整する必要がある購入コンバージョンイベント
* コードの更新が必要な購入以外のコンバージョンイベント

## 目標トラッキングの比較

次の表では、at.js と Platform Web SDK がコンバージョンイベントをどのように追跡するかを比較しています

| アクティビティの目標 | Target at.js 2.x | Platform Web SDK |
|---|---|---|
| コンバージョン > ページが表示された | 自動的に追跡されます。 at.js リクエストペイロードの `context.address.url` の値に基づいています。 | 自動的に追跡されます。 `sendEvent` ペイロードの `xdm.web.webPageDetails.URL` の値に基づく |
| コンバージョン > mbox を表示 | ディスプレイ mbox の場所のリクエストまたは `trackEvent()` を使用した通知、または `type` 値が `display` の `sendNotifications()` でトラッキングされます。 | Platform Web SDK でトラッキングされ、`decisioning.propositionDisplay` の `eventType` を使用して `sendEvent` 呼び出します。 |
| コンバージョン /要素をクリック | VEC ベースのアクティビティ用に自動的に追跡されます。 インリクエストペイロードに `notifications` オブジェクトを持ち、`type` 値が `click` の at.js ネットワーク呼び出しとして表示されます。 | VEC ベースのアクティビティ用に自動的に追跡されます。 `decisioning.propositionInteract` の `eventType` で呼び出され `sendEvent`Platform Web SDK として表示されます。 |
| エンゲージメント > ページビュー | 自動的に追跡 | 自動的に追跡 |
| エンゲージメント > サイト滞在時間 | 自動的に追跡 | 自動的に追跡 |

<!--
| Revenue > RPV, AOV, or Total Sales | Tracked based on the `orderTotal` parameter values for the specified mbox(es) | Tracked based on the `xdm.commerce.order.priceTotal` values. Its best to use the "any mbox" option in the goal setup. |
| Revenue > Orders | Tracked based on the unique `orderId` parameter values for the specified mbox(es) | Tracked based on the unique values for `xdm.commerce.order.purchaseID`. Its best to use the "any mbox" option in the goal setup. |
| Engagement > Custom Scoring | Tracked with the `mboxPageValue` parameter. Refer to the [dedicated documentation](https://experienceleague.adobe.com/docs/target/using/activities/success-metrics/capture-score.html) for more details. | Tracked with `data.__adobe.target.mboxPageValue` in the `sendEvent` payload |
-->

## 自動的に追跡されたイベント

次のコンバージョン目標では、実装に対する特定の調整は必要ありません。

* コンバージョン > ページが表示された
* コンバージョン /要素をクリック
* エンゲージメント > ページビュー
* エンゲージメント > サイト滞在時間

>[!NOTE]
>
>Platform Web SDK を使用すると、リクエストペイロードで渡される値をより詳細に制御できます。 QA URL や「ページを閲覧」などの Target 機能が正しく動作することを確認するには、`xdm.web.webPageDetails.URL` の値に、大文字と小文字が適切に区別された完全なページ URL が含まれていることを確認します。

<!--
## Purchase conversion events

The following conversion goals are based on the order details information passed in the Platform Web SDK `sendEvent` payload:

* Revenue > Revenue per Visit (RPV)
* Revenue > Average Order Value (AOV)
* Revenue > Total Sales
* Revenue > Orders

Target at.js implementations typically use an order confirmation mbox with the `trackEvent()` or `sendNotifications()` functions to pass the order ID, order total, and a list of product IDs purchased. These methods are specific to Target.

The Platform Web SDK is a shared library for all Adobe applications and you may have other applications such as Adobe Analytics to consider. Because of this shared nature, its best send a single order confirmation call using the appropriate commerce XDM field group.

For more information and an example, refer to the tutorial section about [sending purchase parameters to Target](send-parameters.md#purchase-parameters). 
-->

## カスタムで追跡されるイベント

Target 実装では、通常、カスタムコンバージョンイベントを使用して、フォームベースのアクティビティのクリック数を追跡したり、フロー内のコンバージョンを示したり、新しいコンテンツをリクエストせずにパラメーターを渡したりします。

次の表に、いくつかの一般的なコンバージョントラッキングのユースケースに対する at.js アプローチと同等の Platform Web SDK の概要を示します。

| ユースケース | Target at.js 2.x | Platform Web SDK |
|---|---|---|
| mbox の場所（スコープ）のクリックコンバージョンイベントの追跡 | 特定の mbox の場所に対して、`type` 値 `click` の `trackEvent()` または `sendNotifications()` を実行します | イベントタイプを `decisioning.propositionInteract` にして `sendEvent` コマンドを実行します。 |
| Target プロファイルパラメーターなどの追加データを含む可能性のあるカスタムコンバージョンイベントを追跡します | 特定の mbox の場所に対して、`type` 値 `display` の `trackEvent()` または `sendNotifications()` を実行します | イベントタイプを `decisioning.propositionDisplay` にして `sendEvent` コマンドを実行します。 |

>[!NOTE]
>
>`decisioning.propositionDisplay` は、特定の範囲のインプレッション数を増やすために最も一般的に使用されますが、at.js の代わりに通常は `trackEvent()` も使用する必要があります。 指定しない場合、`trackEvent()` 関数はデフォルトで `display` 型に設定されます。 実装を調べ、定義したカスタムコンバージョンに対して正しいイベントタイプを使用していることを確認します。

Target イベントのトラッキングに [`trackEvent()`](https://developer.adobe.com/target/implement/client-side/atjs/atjs-functions/adobe-target-trackevent/) と [`sendNotifications()`](https://developer.adobe.com/target/implement/client-side/atjs/atjs-functions/adobe-target-sendnotifications-atjs-21/) の使用方法について詳しくは、専用の at.js ドキュメントを参照してください。

`trackEvent()` を使用して mbox の場所のクリックを追跡する at.js の例：

```JavaScript
adobe.target.trackEvent({
  "type": "click",
  "mbox": "homepage_hero"
});
```

Platform Web SDK の実装を使用すると、`sendEvent` コマンドを呼び出し、`_experience.decisioning.propositions` XDM フィールドグループに入力し、`eventType` を 2 つの値のいずれかに設定することで、イベントとユーザーアクションを追跡できます。

* `decisioning.propositionDisplay`: Target アクティビティのレンダリングをシグナルで通知します。
* `decisioning.propositionInteract`：マウスクリックなど、アクティビティに対するユーザーのインタラクションを示します。

`_experience.decisioning.propositions` XDM フィールドグループは、オブジェクトの配列です。 各オブジェクトのプロパティは、`sendEvent` のコマンドで返される `result.propositions` から派生します。`{ id, scope, scopeDetails }`

```JavaScript
alloy("sendEvent", {
  xdm: { ...},
  decisionScopes: ["hero-banner"]
}).then(function (result) {
  var propositions = result.propositions;

  if (propositions) {
    // Find the discount proposition, if it exists.
    for (var i = 0; i < propositions.length; i++) {
      var proposition = propositions[i];
      for (var j = 0; j < proposition.items; j++) {
        var item = proposition.items[j];

        if (item.schema === "https://ns.adobe.com/personalization/measurement") {
          // add metric to the DOM element
          const button = document.getElementById("form-based-click-metric");

          button.addEventListener("click", event => {
            const executedPropositions = [
              {
                id: proposition.id,
                scope: proposition.scope,
                scopeDetails: proposition.scopeDetails
              }
            ];
            // send the click track event
            alloy("sendEvent", {
              "xdm": {
                "eventType": "decisioning.propositionInteract",
                "_experience": {
                  "decisioning": {
                    "propositions": executedPropositions
                  }
                }
              }
            });
          });
        }
      }
    }
  }
});
```

次に、一貫性のある訪問者プロファイルを作成するための [ クロスドメイン ID 共有を有効にする ](cross-domain.md) 方法を説明します。

>[!NOTE]
>
>アドビは、at.js から Web SDK への Target の移行を成功させるために取り組んでいます。 移行の際に問題が発生した場合、またはこのガイドに重要な情報が欠落していると感じる場合は、[ このコミュニティのディスカッション ](https://experienceleaguecommunities.adobe.com/t5/adobe-experience-platform-data/tutorial-discussion-migrate-target-from-at-js-to-web-sdk/m-p/575587#M463) に投稿してお知らせください。
