---
title: イベントの追跡 | at.js 2.x から Web SDK への Target の移行
description: Experience PlatformWeb SDK を使用してAdobe Targetコンバージョンイベントを追跡する方法について説明します。
source-git-commit: 43740912bc5a941aa21c5f38ed2c1aac74abffbc
workflow-type: tm+mt
source-wordcount: '681'
ht-degree: 1%

---


# Platform Web SDK を使用した Target コンバージョンイベントの追跡

Target のコンバージョンイベントは、at.js と同様に、Platform Web SDK を使用して追跡できます。 コンバージョンイベントは通常、次のカテゴリに分類されます。

* 設定が不要な、自動的に追跡されるイベント
* ベストプラクティスの Platform Web SDK 実装に合わせて調整する必要がある購入コンバージョンイベント
* コードの更新が必要な非購入コンバージョンイベント

>[!WARNING]
>
> 2022 年 10 月 2 日以降に開始された Platform Web SDK 実装では、 [プリフェッチ回避策](prefetch-workaround.md) を有効にして、このページで説明している一部のイベントを正しく追跡するために使用します。

## 目標トラッキングの比較

次の表で、at.js と Platform Web SDK がコンバージョンイベントを追跡する方法を比較します

| アクティビティ目標 | Target at.js 2.x | Platform Web SDK |
|---|---|---|
| コンバージョン/ページが表示された | 自動的に追跡されます。 の値に基づく `context.address.url` at.js リクエストペイロード内で使用されます。 | 自動的に追跡されます。 の値に基づく `xdm.web.webPageDetails.URL` 内 `sendEvent` ペイロード |
| コンバージョン/mbox が表示された | 表示 mbox の場所または通知のリクエストでトラッキングされ、 `trackEvent()` または `sendNotifications()` と `type` 値 `display`. | Platform Web SDK でトラッキングする `sendEvent` を使って呼び出す `eventType` / `decisioning.propositionDisplay`. |
| コンバージョン/要素をクリック | VEC ベースのアクティビティで自動的に追跡されます。 は、 `notifications` オブジェクトをリクエストペイロードに追加し、 `type` 値 `click`. | VEC ベースのアクティビティで自動的に追跡されます。 Platform Web SDK として表示されます `sendEvent` を使って呼び出す `eventType` / `decisioning.propositionInteract`. |
| エンゲージメント/ページビュー数 | 自動的に追跡 | 自動的に追跡 |
| エンゲージメント/サイト滞在時間 | 自動的に追跡 | 自動的に追跡 |

<!--
| Revenue > RPV, AOV, or Total Sales | Tracked based on the `orderTotal` parameter values for the specified mbox(es) | Tracked based on the `xdm.commerce.order.priceTotal` values. Its best to use the "any mbox" option in the goal setup. |
| Revenue > Orders | Tracked based on the unique `orderId` parameter values for the specified mbox(es) | Tracked based on the unique values for `xdm.commerce.order.purchaseID`. Its best to use the "any mbox" option in the goal setup. |
| Engagement > Custom Scoring | Tracked with the `mboxPageValue` parameter. Refer to the [dedicated documentation](https://experienceleague.adobe.com/docs/target/using/activities/success-metrics/capture-score.html) for more details. | Tracked with `data.__adobe.target.mboxPageValue` in the `sendEvent` payload |
-->

## 自動的に追跡されるイベント

以下のコンバージョン目標では、実装を特定の調整をおこなう必要はありません。

* コンバージョン/ページが表示された
* コンバージョン/要素をクリック
* エンゲージメント/ページビュー数
* エンゲージメント/サイト滞在時間

>[!NOTE]
>
>Platform Web SDK を使用すると、リクエストペイロードで渡される値をより詳細に制御できます。 QA URL や「ページが表示されました」コンバージョン目標などの Target 機能が正しく機能することを確認するには、 `xdm.web.webPageDetails.URL` の値には、適切な文字列を含む完全なページ URL が含まれます。

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

## カスタムで追跡したイベント

Target の実装では、通常、カスタムコンバージョンイベントを使用してフォームベースのアクティビティのクリックを追跡し、フロー内のコンバージョンを示したり、新しいコンテンツを要求せずにパラメーターを渡したりします。

次の表に、at.js のアプローチと、一般的なコンバージョントラッキングの使用例で使用する Platform Web SDK と同等のものを示します。

| ユースケース | Target at.js 2.x | Platform Web SDK |
|---|---|---|
| mbox の場所（範囲）のクリックコンバージョンイベントを追跡する | 実行 `trackEvent()` または `sendNotifications()` と `type` 値 `click` （特定の mbox の場所） | の実行 `sendEvent` イベントタイプが `decisioning.propositionInteract` |
| 追加データを含む可能性のあるカスタムコンバージョンイベント（Target プロファイルパラメーターなど）を追跡する | 実行 `trackEvent()` または `sendNotifications()` と `type` 値 `display` （特定の mbox の場所） | の実行 `sendEvent` イベントタイプが `decisioning.propositionDisplay` |

>[!NOTE]
>
>ただし `decisioning.propositionDisplay` は、特定の範囲のインプレッション数の増分に最も一般的に使用されます。また、at.js の直接置き換えとしても使用する必要があります `trackEvent()` 通常は この `trackEvent()` 関数のデフォルト値は次のタイプです。 `display` 指定されていない場合は。 実装を確認し、定義したカスタムコンバージョンに正しいイベントタイプを使用していることを確認してください。

の使用方法の詳細については、該当する at.js ドキュメントを参照してください [`trackEvent()`](https://developer.adobe.com/target/implement/client-side/atjs/atjs-functions/adobe-target-trackevent/) および [`sendNotifications()`](https://developer.adobe.com/target/implement/client-side/atjs/atjs-functions/adobe-target-sendnotifications-atjs-21/) （Target イベントを追跡するため）

at.js の使用例 `trackEvent()` mbox の場所のクリックを追跡するには、次の手順を実行します。

```JavaScript
adobe.target.trackEvent({
  "type": "click",
  "mbox": "homepage_hero"
});
```

Platform Web SDK の実装を使用すると、 `sendEvent` コマンド、 `_experience.decisioning.propositions` XDM フィールドグループと、 `eventType` を 2 つの値のいずれかに変更します。

* `decisioning.propositionDisplay`:Target アクティビティのレンダリングを示します。
* `decisioning.propositionInteract`:マウスのクリックと同様に、ユーザーがアクティビティを操作することを示します。

この `_experience.decisioning.propositions` XDM フィールドグループは、オブジェクトの配列です。 各オブジェクトのプロパティは、 `result.propositions` が `sendEvent` コマンド： `{ id, scope, scopeDetails }`

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

次に、 [クロスドメイン ID 共有の有効化](cross-domain.md) 一貫性のある訪問者プロファイルに対して

>[!NOTE]
>
>at.js から Web SDK への Target の移行を成功に導くための支援に努めています。 移行時に障害が発生した場合や、このガイドに重要な情報が欠落していると思われる場合は、 [このコミュニティディスカッション](https://experienceleaguecommunities.adobe.com/t5/adobe-experience-platform-launch/tutorial-discussion-implement-adobe-experience-cloud-with-web/td-p/444996).