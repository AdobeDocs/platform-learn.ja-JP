---
title: クロスドメインサポートの有効化 | at.js 2.x から Web SDK への Target の移行
description: Experience PlatformWeb SDK を使用して、クロスドメインおよびモバイルアプリ用にAdobe Targetを Web ブラウザーシナリオに設定する方法について説明します。
source-git-commit: 287ebcb275c4fca574dbd6cdf7e07ba4268bddb5
workflow-type: tm+mt
source-wordcount: '468'
ht-degree: 1%

---

# クロスドメインの訪問者プロファイルの有効化

Platform Web SDK は、訪問者 ID 共有機能をサポートします。この機能を使用すると、ドメインをまたいで、パーソナライズされたエクスペリエンスをより正確に配信できます。 この機能を使用すると、サードパーティ cookie に依存することなく、ドメイン間で一貫したパーソナライゼーションを提供し、訪問者のアクティビティレポートの精度を高めることができます。

## 前提条件

クロスドメイン ID 共有を使用するには、Platform Web SDK バージョン2.11.0以降を使用する必要があります。 この機能は、VisitorAPI.js バージョン 1.7.0 以降とも互換性があります。

クロスドメイン ID 共有は、特別な `adobe_mc` 宛先ドメインの URL へのクエリー文字列パラメーター。 このパラメーターは、新しい ID を生成したり、既存の ID を使用したりする代わりに、訪問者 ID を指定するために使用されます。

を処理するには、宛先ドメインがクロスドメイン ID 共有にこれらのライブラリのいずれかを使用する必要があります `adobe_mc` パラメーターを使用し、訪問者 ID を適切に共有する必要があります。

## アプローチの比較

実装する前に、まず、既存の実装が `visitor.appendVisitorIDsTo()` 関数に置き換えます。 この関数を使用するカスタムコードは、新しい `appendIdentityToUrl` Web SDK コマンド。

| VisitorAPI.js | Platform Web SDK |
| --- | --- |
| `visitor.appendVisitorIDsTo(*url*)` | `alloy("appendIdentityToUrl", { url: *url* })` |

## の使用 `appendIdentityToURL` command

クロスドメイン ID 共有の場合、Web SDK バージョン2.11.0では、 `appendIdentityToUrl` コマンドを使用します。 このコマンドを使用すると、 `adobe_mc` クエリー文字列パラメーター。

このコマンドは、1 つのプロパティを持つオブジェクトを受け入れます。 `url`を返し、プロパティ url を持つオブジェクトを返します。

このコマンドは、同意の更新を待ちません。 同意が提供されていない場合、URL は変更されずに返されます。

ECID を指定しない場合、 `/acquire` エンドポイントが呼び出されて、ECID が生成されます。

クロスドメイン ID 共有の実装方法の例を以下に示します。

このコードは、ページ上のすべてのクリックに対してイベントリスナーを追加します。 一致するドメイン（この場合は adobe.com または behance.com）へのリンクをクリックした場合、ID が URL に追加され、そこでユーザーにリダイレクトされます。

```Javascript
document.addEventListener("click", event => {
  const anchor = event.target.closest("a");
  if (!anchor || !anchor.href) {
    return;
  }
  const url = new URL(anchor.href);
  if (!url.hostname.endsWith("adobe.com") && !url.hostname.endsWith("behance.com")) {
    return;
  }
  event.preventDefault();
  alloy("appendIdentityToUrl", { url: anchor.href }).then(result => {
    document.location = result.url;
  });
});
```

>[!TIP]
>
>タグ機能（旧称 Launch）を使用して Web SDK を実装する場合、クロスドメイン ID 共有は、カスタムコードを使用しなくても実行できます。 詳しくは、 [専用ドキュメント](https://experienceleague.adobe.com/docs/experience-platform/edge/identity/id-sharing.html#tags-extension) を参照してください。

>[!NOTE]
>
>Platform Web SDK では、ネイティブのモバイルアプリの使用例に対して、モバイルから Web への ID 共有もサポートしています。 詳しくは、 [モバイルから Web への ID の共有とクロスドメイン ID の共有](https://experienceleague.adobe.com/docs/experience-platform/edge/identity/id-sharing.html).

次に、 [オーディエンスとプロファイルスクリプトの更新](update-audiences.md) を使用して、Platform Web SDK との互換性を確保します。

>[!NOTE]
>
>at.js から Web SDK への Target の移行を成功に導くための支援に努めています。 移行時に障害が発生した場合や、このガイドに重要な情報が欠落していると思われる場合は、 [このコミュニティディスカッション](https://experienceleaguecommunities.adobe.com/t5/adobe-experience-platform-data/tutorial-discussion-migrate-target-from-at-js-to-web-sdk/m-p/575587#M463).