---
title: 計画 | Target を at.js 2.x から Web SDK に移行
description: at.js 2.x からAdobe Experience Platform Web SDK へのAdobe Target実装を計画する方法について説明します。
exl-id: 0e8f9cde-f361-4f69-886d-aad3074cd9b2
source-git-commit: 4690d41f92c83fe17eda588538d397ae1fa28af0
workflow-type: tm+mt
source-wordcount: '480'
ht-degree: 1%

---

# at.js から Platform Web SDK への移行の計画

サイトで Platform Web SDK にアップグレードする前に、現在の実装を評価する必要があります。

## 現在の at.js の実装を評価

移行を成功させるための最初のステップは、現在の at.js Target 実装を十分に理解することです。 更新が必要な機能、関数およびカスタムコードを使用できます。 評価する際は、次の点を考慮してください。

### サポートされている機能

Platform Web SDK は継続的に活発に開発中で、機能および機能強化が定期的に追加されています。 現在の at.js 実装を評価する際に、最新情報については [ サポートされるユースケース ](https://github.com/orgs/adobe/projects/18/views/1) ページを参照してください。

### 現在どんな関数を使っていますか？

Platform Web SDK は、web サイトのすべてのAdobeソリューションを 1 つの SDK に統合する新しいライブラリです。 これにより、より緊密な統合が可能になり、Adobe Experience Platformに特有の新機能を利用できるようになります。 ただし、これは、at.js 関数が Platform Web SDK と後方互換性がないことを意味します。 現在の実装を評価する際は、次の点に注意してください。

- `getOffer()` や `applyOffer()` などの at.js 関数
- Target のグローバル設定の変更
- Adobe Analytics との統合
- ちらつき軽減スクリプトの使用
- レスポンストークンの使用
- mbox、profile、entity パラメーターの使用
- 実装に固有のカスタムコード

### どの移行アプローチを使用しますか？

at.js の実装を再検討したら、移行アプローチを決定する必要があります。 次の 2 つのオプションがあります。

- サイト全体にわたってすべてのAdobe・アプリケーションを一度に移行
- ページ単位で移行

Platform Web SDK では複数のAdobeアプリケーションを組み合わせて有効にするので、Analytics やAudience Managerなどの他のAdobeアプリケーションの Target 移行を調整する必要があります。 特定のページ上のすべてのAdobeライブラリを同時に移行する必要があります。 特定のページでの Platform Web SDK for Target とAppMeasurement for Analytics の混合実装はサポートされていません。 ただし、異なるページ間の混合実装がサポートされています（例：ページ A の Platform Web SDK とページ B のAppMeasurementを持つ at.js）。

移行時には、新しいコードのテストとリリースに関する会社のプロセスに従い、開発、qa、ステージング環境などを使用した後で、実稼動環境にリリースする必要があります。

>[!CAUTION]
>
>あるライブラリを持つページから別のライブラリを持つページにリダイレクトする場合、リダイレクトオファーはページごとの移行ではサポートされません


次に、詳細な [at.js と Platform Web SDK の比較 ](detailed-comparison.md) を確認して、技術的な違いをより深く理解し、さらに焦点を当てる必要がある領域を特定します。

>[!NOTE]
>
>アドビは、at.js から Web SDK への Target の移行を成功させるために取り組んでいます。 移行の際に問題が発生した場合、またはこのガイドに重要な情報が欠落していると感じる場合は、[ このコミュニティのディスカッション ](https://experienceleaguecommunities.adobe.com/t5/adobe-experience-platform-data/tutorial-discussion-migrate-target-from-at-js-to-web-sdk/m-p/575587#M463) に投稿してお知らせください。
