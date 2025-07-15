---
title: Target アクティビティの取得 – モバイルアプリのAdobe Target実装をOffer Decisioningおよび Target 拡張機能に移行します
description: Adobe TargetからOffer Decisioningおよび Target モバイル拡張機能に移行する際に、Adobe Target アクティビティを取得する方法について説明します。
exl-id: 39569088-a254-4e64-9956-0c6e1a8ed2a5
source-git-commit: 876e664a213aec954105bf2d5547baab5d8a84ea
workflow-type: tm+mt
source-wordcount: '317'
ht-degree: 0%

---

# Target アクティビティの取得

Target モバイル実装では、地域の mbox （現在は「範囲」）を使用して、Target のフォームベースの Experience Composer を使用するアクティビティからコンテンツを配信します。 ネットワーク呼び出しに範囲を含めるには、モバイルアプリケーションを更新する必要があります。

Target が返すコンテンツ（「オファー」とも呼ばれます）は、通常、最終的な顧客体験をレンダリングするためにアプリケーションで使用する必要があるテキストまたは JSON で構成されます。 Target からのオファーは、多くの場合、次の目的で使用されます。

* アプリケーションの機能フラグの有効化
* 代替テキストまたは画像の提供

アプリケーションの Target 拡張機能とOffer Decisioningおよび Target 拡張機能の両方のバージョンでアクティビティを実行する必要がある場合は、必ず徹底的にテストしてください。 アプリのバージョンごとに異なるオファーを使用する必要がある場合は、インターフェイスのターゲティングオプションを使用して、異なるバージョンに異なるオファーを配信することを検討します。

エラー条件下で適切なエクスペリエンスを表示するには、必ずエラー処理を含めてください。


## オンデマンドでのコンテンツのリクエストと適用

>[!IMPORTANT]
>
>アプリにコンテンツを適用した後、API を実行して、アクティビティで指定 `displayed` た代替コンテンツまたはデフォルトコンテンツが訪問者に表示されたことを Target に知らせる必要があります。 詳しくは、[Target コンバージョンイベントを追跡 ](track-events.md) ページを参照してください。


+++ Androidの例

>[!BEGINTABS]

>[!TAB SDKの最適化 ]

```Java
// Mboxes for Target activities
final DecisionScope decisionScope1 = DecisionScope("myTargetMbox1");
final DecisionScope decisionScope2 = new DecisionScope("myTargetMbox2");
 
final List<DecisionScope> decisionScopes = new ArrayList<>();
decisionScopes.add(decisionScope1);
decisionScopes.add(decisionScope2);
 
// Prefetch the Target mboxes
Optimize.updatePropositions(decisionScopes,
                            new HashMap<String, Object>() {
                                {
                                    put("xdmKey", "xdmValue");
                                }
                            },
                            new HashMap<String, Object>() {
                                {
                                    put("dataKey", "dataValue");
                                }
                            },
                            new AdobeCallbackWithOptimizeError<Map<DecisionScope, OptimizeProposition>>() {
                                @Override
                                public void fail(AEPOptimizeError optimizeError) {
                                    // Log in case of error
                                    Log.d("Target Prefetch error", optimizeError.title);
                                }
 
                                @Override
                                public void call(Map<DecisionScope, OptimizeProposition> propositionsMap) {
                                    // Retrieve cached propositions if prefetch succeeds
                                    Optimize.getPropositions(scopes, new AdobeCallbackWithError<Map<DecisionScope, OptimizeProposition>>() {
                                        @Override
                                      public void fail(final AdobeError adobeError) {
                                              // handle error
                                        }
 
                                        @Override
                                        public void call(Map<DecisionScope, OptimizeProposition> propositionsMap) {
                                              if (propositionsMap != null && !propositionsMap.isEmpty()) {
                                                // get the propositions for the given decision scopes
                                                if (propositionsMap.contains(decisionScope1)) {
                                                      final OptimizeProposition proposition1 = propsMap.get(decisionScope1)
                                                      // read proposition1 offers and display them
                                                }
                                                if (propositionsMap.contains(decisionScope2)) {
                                                      final OptimizeProposition proposition2 = propsMap.get(decisionScope2)
                                                      // read proposition2 offers and display them
                                                }
                                              }
                                        }
                                      });
                                }
                            });
```

>[!ENDTABS]

+++

+++ iOSの例

>[!BEGINTABS]

>[!TAB SDKの最適化 ]

```Swift
// Mboxes for Target activities
let decisionScope1 = DecisionScope(name: "myTargetMbox1")
let decisionScope2 = DecisionScope(name: "myTargetMbox2")
 
// Prefetch the Target mboxes
Optimize.updatePropositions(for: [decisionScope1, decisionScope2]
                            withXdm: ["xdmKey": "xdmValue"]
                            andData: ["dataKey": "dataValue"]) { data, error in
            if let error = error as? AEPOptimizeError {
                // handle error
                return
            }
            // Retrieve cached propositions if prefetch succeeds
            Optimize.getPropositions(for: [decisionScope1, decisionScope2]) { propositionsDict, error in
                if let error = error {
                    // handle error
                    return
                }
 
                if let propositionsDict = propositionsDict {
                    // get the propositions for the given decision scopes
 
                    if let proposition1 = propositionsDict[decisionScope1] {
                        // read proposition1 offers and display them
                    }
 
                    if let proposition2 = propositionsDict[decisionScope2] {
                        // read proposition2 offers and display them
                    }
                }
            }
        }
```

>[!ENDTABS]

+++



次に、[Offer Decisioningと Target 拡張機能を使用して Target パラメーターを渡す ](send-parameters.md) 方法について説明します。

>[!NOTE]
>
>アドビは、Target 拡張機能からOffer Decisioningおよび Target 拡張機能への Mobile Target の移行を成功させるために取り組んでいます。 移行の際に問題が発生した場合、またはこのガイドに重要な情報が欠落していると感じる場合は、[ このコミュニティのディスカッション ](https://experienceleaguecommunities.adobe.com/t5/adobe-experience-platform-data/tutorial-discussion-migrate-adobe-target-to-mobile-sdk-on-edge/m-p/747484?profile.language=ja#M625) に投稿してお知らせください。
