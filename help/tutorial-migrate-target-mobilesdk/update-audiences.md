---
title: オーディエンスとプロファイルスクリプトの更新 – Adobe TargetからAdobe Journey Optimizer - Decisioning モバイル拡張機能に移行します
description: Experience Platform Web SDK と互換性を持たせるために、Adobe Target オーディエンスとプロファイルスクリプトを更新する方法を説明します。
source-git-commit: afbc8248ad81a5d9080a4fdba1167e09bbf3b33d
workflow-type: tm+mt
source-wordcount: '167'
ht-degree: 0%

---

# Adobe Journey Optimizer用の Target オーディエンスとプロファイルスクリプトの更新 – Decisioning Mobile Extension の互換性


## オーディエンスの調整


詳細とベストプラクティスについては、[ プロファイルスクリプト ](https://experienceleague.adobe.com/docs/target/using/audiences/visitor-profiles/profile-parameters.html) に関する専用ドキュメントを参照してください。

## 動的コンテンツのパラメータートークンの更新



移行後に調整を行って新しい XDM mbox パラメーター名を考慮する場合は、影響を受けるアクティビティを移行イベント中に一時停止して、訪問者にアクティビティ表示エラーが表示されないようにしてください。

次に、[Target 実装の検証 ](validate.md) 方法を説明します。

>[!NOTE]
>
>アドビは、Target 拡張機能から Decisioning 拡張機能への Mobile Target の移行を成功させるために取り組んでいます。 移行の際に問題が発生した場合、またはこのガイドに重要な情報が欠落していると感じる場合は、[ このコミュニティのディスカッション ](https://experienceleaguecommunities.adobe.com/t5/adobe-experience-platform-data/tutorial-discussion-migrate-target-from-at-js-to-web-sdk/m-p/575587#M463) に投稿してお知らせください。
