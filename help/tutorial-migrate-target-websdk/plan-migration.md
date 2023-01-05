---
title: 計画 | at.js 2.x から Web SDK への Target の移行
description: at.js 2.x からAdobe Experience Platform Web SDK へのAdobe Target実装の計画方法について説明します。
source-git-commit: dad7a1b01c4313d6409ce07d01a6520ed83f5e89
workflow-type: tm+mt
source-wordcount: '490'
ht-degree: 2%

---

# at.js から Platform Web SDK への移行の計画

サイト上の Platform Web SDK にアップグレードする前に、現在の実装を評価する必要があります。

## 現在の at.js の実装を評価する

移行を成功させるための最初の手順は、現在の at.js Target の実装を確実に理解することです。 更新が必要な機能、関数、カスタムコードが使用できます。 評価を行う際は、以下の点を考慮してください。

### サポートされる機能は何ですか？

Platform Web SDK は継続的にアクティブな開発の下にあり、機能と機能強化が定期的に追加されています。 現在の at.js 実装を評価する際は、 [サポートされる使用例](https://github.com/orgs/adobe/projects/18/views/1) ページを参照してください。

### 今日はどのような機能を使っていますか？

Platform Web SDK は、Web サイトのすべてのAdobeソリューションを単一の SDK に統合する新しいライブラリです。 これにより、より緊密な統合が可能になり、Adobe Experience Platform独自の新機能が可能になります。 ただし、これはまた、at.js 関数と Platform Web SDK の後方互換性がないことを意味します。 現在の実装を評価する際には、次の点に注意してください。

- at.js 関数 `getOffer()` および `applyOffer()`
- Target のグローバル設定の変更
- Adobe Analytics との統合
- ちらつき軽減スクリプトの使用
- レスポンストークンの使用
- mbox、プロファイルおよびエンティティパラメーターの使用
- 実装に固有のカスタムコード

### 移行にはどのようなアプローチを取りますか？

at.js の実装を再度検討したら、移行アプローチを決定する必要があります。 次の 2 つのオプションがあります。

- すべてのAdobe・アプリケーションをサイト全体に一度に移行
- ページごとに移行

Platform Web SDK は、複数のAdobeアプリケーションを組み合わせて有効にするので、Analytics やAudience Managerなど、他のAdobeアプリケーションについて Target の移行を調整する必要があります。 特定のページ上のすべてのAdobeライブラリを同時に移行する必要があります。 特定のページでの Platform Web SDK for Target と AppMeasurement for Analytics の混在実装はサポートされていません。 ただし、異なるページ間での混在実装がサポートされます。例えば、ページ A では Platform Web SDK、ページ B では at.js と AppMeasurement がサポートされます。

移行する際は、実稼動環境にリリースする前に、新しいコードのテストとリリースについて会社のプロセスに従い、開発環境、QA 環境、ステージング環境などを使用する必要があります。

>[!CAUTION]
>
>あるライブラリを持つページから別のライブラリを持つページにリダイレクトする場合、ページごとの移行では、リダイレクトオファーはサポートされません


次に、詳細を確認します。 [at.js と Platform Web SDK の比較](detailed-comparison.md) 技術的な違いをより深く理解し、さらに焦点を絞る必要のある領域を特定する。

>[!NOTE]
>
>at.js から Web SDK への Target の移行を成功に導くための支援に努めています。 移行時に障害が発生した場合や、このガイドに重要な情報が欠落していると思われる場合は、 [このコミュニティディスカッション](https://experienceleaguecommunities.adobe.com/t5/adobe-experience-platform-launch/tutorial-discussion-implement-adobe-experience-cloud-with-web/td-p/444996).
