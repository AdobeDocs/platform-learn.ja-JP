---
title: プリフェッチの回避策 | at.js 2.x から Web SDK への Target の移行
description: プリフェッチでパラメーターを渡す回避策を実装する方法を説明します
source-git-commit: d061d2492d6d5e8e7a8a6e03ce63b9b6cd3793d8
workflow-type: tm+mt
source-wordcount: '502'
ht-degree: 0%

---

# プリフェッチの回避策

2022 年 10 月 1 日以前にExperience PlatformWeb SDK を使用して実稼動環境にいなかったすべての Target ユーザーは、「プリフェッチ」モードを使用して、Experience PlatformEdge ネットワークから Target にリクエストを送信します。 プリフェッチを使用すると、訪問者がページの正しい状態に達した場合に適用できる状態になるように、ブラウザーは Target オファーをプリロードしてキャッシュできます。 シングルページアプリケーション (SPA) では、追加のネットワークリクエストがなくても、可能な限り迅速に目的のユーザーエクスペリエンスをレンダリングできるので、この方法が便利です。 ただし、SPA実装と非SPA実装の両方に、重要な影響があります。

オファーコンテンツがネットワークリクエストで配信される際に、アクティビティで訪問者をカウントする代わりに、訪問者が `propositionDisplay` sendEvent リクエストは Web SDK によって作成されます。 これらのリクエストは、 renderDecisions が true に設定されている場合と、エクスペリエンスがページ上に正常にレンダリングされた場合に、Visual Experience Composer(VEC) アクティビティによって自動的におこなわれます。 カスタムスコープで、 renderDecisions が false に設定されている場合、 propositionDisplay リクエストは実装者によって意図的に開始される必要があります。 また、 _即時の活動資格以外の目的で使用されるすべてのパラメーターは、 `propositionDisplay`  イベント_.

## 回避策が必要な理由

多くの Target 実装では、アクティビティが配信されるのを待たずに、重要なネットワークリクエストがおこなわれる場合があります。 例えば、次のような要求がおこなわれます。

* 注文コンバージョンの記録
* プロファイルパラメーターの設定
* トリガープロファイルスクリプト
* エンティティパラメーターを送信してRecommendationsカタログに入力

残念ながら、プリフェッチモードでは、これらは期待どおりに動作しません。 プリフェッチモードでは、このデータは、 `propositionDisplay`.

## 回避策とは？

回避策は、次の 3 つの部分で構成されます。

1. カスタムスコープを `sendEvent`
1. フォームベースのアクティビティでカスタムスコープを使用する（アクティビティはデフォルトコンテンツを提供できます）
1. 応答ハンドラーを使用して別の応答を作成する `sendEvent` propositionDisplay の場合は、順序をキャプチャするために必要なパラメーターを含め、プロファイルパラメーターを設定し、プロファイルスクリプトをトリガーし、エンティティパラメーターを送信します。

次に、回避策を使用してプロファイルパラメーターを送信する方法の例を示します。


```JavaScript
var data = {
    "__adobe": {
        "target": {
            "profile.gender": "male"
        }
    }
};
// Send the initial event with the data object and custom decision scope
alloy("sendEvent", {
    "renderDecisions": true,
    data,
    decisionScopes: ['profile-param-example']
}).then(function(result) {
    var propositions = result.propositions;
    var ctaProposition;
    if (propositions) {
        // Find the discount proposition, if it exists.
        for (var i = 0; i < propositions.length; i++) {
            var proposition = propositions[i];
            if (proposition.scope === "profile-param-example") {
                ctaProposition = proposition;
                break;
            }
        }
    }
    if (ctaProposition) {
        // Send a "decisioning.propositionDisplay" event signaling that the proposition has been rendered, and includes the data object again
        alloy("sendEvent", {
            xdm: {
                eventType: "decisioning.propositionDisplay",
                _experience: {
                    decisioning: {
                        propositions: [{
                            id: ctaProposition.id,
                            scope: ctaProposition.scope,
                            scopeDetails: ctaProposition.scopeDetails
                        }]
                    }
                }
            },
            data
        });
    }
});
```

プロファイルを propositionDisplay の一部として設定すると、訪問者のプロファイルに保存され、以降のリクエストで使用できます。 同じ方法を使用して、注文コンバージョンの詳細とエンティティパラメーターをレポートできます。

タグで、 Send Event Complete イベントタイプを使用して、追加の sendEvent を含むイベントをトリガー化します。

## 実装でプリフェッチモードが使用されているかどうかを確認するには、どうすればよいですか？

アカウントがプリフェッチモードを使用しているかどうかを確認するには、カスタマーケアチケットを開く必要があります。


>[!NOTE]
>
>at.js から Web SDK への Target の移行を成功に導くための支援に努めています。 移行時に障害が発生した場合や、このガイドに重要な情報が欠落していると思われる場合は、 [このコミュニティディスカッション](https://experienceleaguecommunities.adobe.com/t5/adobe-experience-platform-launch/tutorial-discussion-implement-adobe-experience-cloud-with-web/td-p/444996).