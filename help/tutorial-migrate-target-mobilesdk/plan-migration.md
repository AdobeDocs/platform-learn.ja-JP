---
title: 計画 – モバイルアプリ内の Target を Target 拡張機能から Optimize 拡張機能に移行する
description: at.js 2.x からAdobe Experience Platform Web SDK へのAdobe Target実装を計画する方法について説明します。
source-git-commit: 009548969b88d1bfa6eac23f65b1ca2144f27c34
workflow-type: tm+mt
source-wordcount: '199'
ht-degree: 0%

---

# 最適化拡張機能への Target の移行の計画

Target を Target 拡張機能からモバイルアプリの最適化拡張機能にアップグレードする前に、現在の実装を評価する必要があります。

## 現在の Target 拡張機能の実装の評価

移行を成功させるための最初のステップは、現在の Target 拡張機能の実装を十分に理解することです。 更新が必要な機能、関数およびカスタムコードを使用できます。 評価する際は、次の点を考慮してください。

### サポートされている機能

<!--Platform Web SDK is under continuous active development and features and enhancements are added regularly. As you evaluate your current at.js implementation, refer to the [supported use cases](https://github.com/orgs/adobe/projects/18/views/1) page for the latest information.-->

### 現在どんな関数を使っていますか？

<!--Platform Web SDK is a new library that consolidates all Adobe solutions for the websites into a single SDK. This enables tighter integration and enables new capabilities unique to Adobe Experience Platform. However, this also means at.js functions are not backwards compatible with Platform Web SDK. As you evaluate your current implementation, make note of the following:

- at.js functions such as `getOffer()` and `applyOffer()`
- Modifications to Target's global settings
- Integration with Adobe Analytics
- Use of a flicker mitigation script
- Use of response tokens
- Use of mbox, profile, and entity parameters
- Custom code unique to your implementation-->

### どの移行アプローチを使用しますか？

<!--Once you have revisited your at.js implementation, you need to determine a migration approach. There are two options:

- Migrate all Adobe applications at once across the entire site
- Migrate on a page-by-page basis

Because Platform Web SDK combines and enables multiple Adobe applications, you must coordinate the Target migration of other Adobe applications like Analytics and Audience Manager. All Adobe libraries on a given page should be migrated at the same time. A mixed implementation of Platform Web SDK for Target and AppMeasurement for Analytics on a particular page is not supported. However, a mixed implementation across different pages is supported, for example Platform Web SDK on page A, and at.js with AppMeasurement on page B.

As you migrate, you should plan on following your company's process for testing and releasing new code and use things like development, qa, and staging environments before you release to production.-->

<!--
>[!CAUTION]
>
>Redirect offers are not supported in page-by-page migrations if redirecting from a page with one library to a page with a different library
-->


次に、詳細な [Target 拡張機能と最適化拡張機能の比較 ](detailed-comparison.md) を確認して、技術的な違いをより深く理解し、さらに焦点を当てる必要がある領域を特定します。

>[!NOTE]
>
>アドビは、Target 拡張機能から Optimize 拡張機能へのモバイルターゲットの移行を成功させるために取り組んでいます。 移行の際に問題が発生した場合、またはこのガイドに重要な情報が欠落していると感じる場合は、[ このコミュニティのディスカッション ](https://experienceleaguecommunities.adobe.com/t5/adobe-experience-platform-data/tutorial-discussion-migrate-target-from-at-js-to-web-sdk/m-p/575587#M463) に投稿してお知らせください。
