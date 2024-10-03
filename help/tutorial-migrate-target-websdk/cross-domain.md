---
title: クロスドメインサポートを有効にする – Target を at.js 2.x から Web SDK に移行します
description: Experience Platform Web SDK を使用して、クロスドメインおよびモバイルアプリから web ブラウザーへのシナリオに対応するようにAdobe Targetを設定する方法について説明します。
exl-id: 6ec24ddc-8f6d-4331-a3ae-bd0f3a7d6e78
source-git-commit: d4308b68d6974fe47eca668dd16555d15a8247c9
workflow-type: tm+mt
source-wordcount: '455'
ht-degree: 0%

---

# クロスドメイン訪問者プロファイルの有効化

Platform Web SDK は、訪問者 ID 共有機能をサポートしており、ドメインをまたいで、パーソナライズされたエクスペリエンスを顧客がより正確に提供できるようにします。 この機能を使用すると、サードパーティの Cookie に依存することなく、ドメイン間で一貫したパーソナライゼーションを提供し、訪問者アクティビティレポートの精度を高めることができます。

## 前提条件

クロスドメイン ID 共有を使用するには、Platform Web SDK バージョン 2.11.0 以降を使用する必要があります。 この機能は、VisitorAPI.js バージョン 1.7.0 以降とも互換性があります。

クロスドメイン ID 共有は、宛先ドメインの URL に特別な `adobe_mc` クエリ文字列パラメーターを追加することで機能します。 このパラメーターは、新しい ID を生成したり、既存の ID を使用したりせずに、訪問者 ID を指定するために使用されます。

`adobe_mc` パラメーターを処理して訪問者 ID を適切に共有するには、宛先ドメインがクロスドメイン ID の共有にこれらのライブラリのいずれかを使用する必要があります。

## アプローチの比較

実装する前に、まず、既存の実装が `visitor.appendVisitorIDsTo()` 関数を使用しているかどうかを判断します。 この関数を使用しているカスタムコードは、新しい `appendIdentityToUrl` Web SDK コマンドを使用するように更新する必要があります。

| VisitorAPI.js | Platform Web SDK |
| --- | --- |
| `visitor.appendVisitorIDsTo(*url*)` | `alloy("appendIdentityToUrl", { url: *url* })` |

## `appendIdentityToURL` コマンドの使用

クロスドメイン ID 共有の場合、Web SDK バージョン 2.11.0 では、`appendIdentityToUrl` コマンドのサポートが追加されました。 このコマンドを使用すると、`adobe_mc` のクエリ文字列パラメーターが生成されます。

このコマンドは、1 つのプロパティ `url` を持つオブジェクトを受け入れ、プロパティ url を持つオブジェクトを返します。

このコマンドは、同意の更新を待ちません。 同意が指定されていない場合、URL は変更されずに返されます。

ECID が指定されていない場合は、`/acquire` エンドポイントが呼び出されて、ECID が生成されます。

クロスドメイン ID 共有を実装する方法の例を以下に示します。

このコードは、ページ上のすべてのクリックに対してイベントリスナーを追加します。 クリックが一致するドメイン（この場合はadobe.comまたはbehance.com）へのリンクであった場合、ID を URL に追加し、その URL にあるユーザーをリダイレクトします。

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
>タグ機能（旧称 Launch）を使用して Web SDK を実装する場合、カスタムコードを使用しなくても、クロスドメイン ID 共有を実現できます。 詳しくは、[ 専用ドキュメント ](https://experienceleague.adobe.com/docs/experience-platform/edge/identity/id-sharing.html#tags-extension) を参照してください。

>[!NOTE]
>
>Platform Web SDK は、ネイティブモバイルアプリのユースケースでモバイルから web への ID 共有もサポートしています。 詳しくは、モバイルから web およびクロスドメインでの ID の共有 [ に関する専用ドキュメントを参照し ](https://experienceleague.adobe.com/docs/experience-platform/edge/identity/id-sharing.html) ください。

次に、Platform Web SDK との互換性を確保するために [ オーディエンスとプロファイルスクリプトを更新 ](update-audiences.md) する方法について説明します。

>[!NOTE]
>
>アドビは、at.js から Web SDK への Target の移行を成功させるために取り組んでいます。 移行の際に問題が発生した場合、またはこのガイドに重要な情報が欠落していると感じる場合は、[ このコミュニティのディスカッション ](https://experienceleaguecommunities.adobe.com/t5/adobe-experience-platform-data/tutorial-discussion-migrate-target-from-at-js-to-web-sdk/m-p/575587#M463) に投稿してお知らせください。
