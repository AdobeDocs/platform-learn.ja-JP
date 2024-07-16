---
title: オーディエンスとプロファイルスクリプトの更新 | Target を at.js 2.x から Web SDK に移行
description: Experience Platform Web SDK と互換性を持たせるために、Adobe Target オーディエンスとプロファイルスクリプトを更新する方法を説明します。
exl-id: 2c0f85f7-6e8c-4d0b-8ed5-53897d06e563
source-git-commit: 4690d41f92c83fe17eda588538d397ae1fa28af0
workflow-type: tm+mt
source-wordcount: '476'
ht-degree: 0%

---

# Platform Web SDK の互換性に合わせた Target オーディエンスとプロファイルスクリプトの更新

Target を Platform Web SDK に移行する技術的な更新を完了した後、スムーズな移行を確保するために、オーディエンス、プロファイルスクリプト、アクティビティの一部を更新する必要が生じる場合があります。

すべての Target mbox パラメーターは、Platform Web SDK 実装を使用して、XDM 形式で渡す必要があります。 変更を実稼動環境に公開する前に、次を行う必要があります。

* mbox パラメーターを使用するオーディエンスの更新
* mbox パラメーターを使用するプロファイルスクリプトの更新
* mbox パラメータートークンの置き換え（`${mbox.parameter_name}` など）を使用して、オファーとアクティビティを更新します

## オーディエンスの調整

カスタム mbox パラメーターを使用するオーディエンスは、新しい XDM パラメーター名を使用するように更新してください。 例えば、`page_name` のカスタムパラメーターは、`web.webpagedetails.pageName` にマッピングされる可能性があります。

at.js と Platform Web SDK の両方との互換性を確保する 1 つのアプローチは、以下に示すように、関連するオーディエンスを更新して、`OR` の条件が使用されるようにすることです。

![Platform Web SDK 互換性のターゲットオーディエンス更新の表示方法 ](assets/target-audience-update.png){zoomable="yes"}

## プロファイルスクリプトの編集

プロファイルスクリプトは、オーディエンスに類似した新しい XDM パラメーター名を参照するように更新する必要があります。 mbox パラメーター名の変更以外に、at.js と Platform Web SDK 実装の間でプロファイルスクリプトの動作方法に違いはありません。

互換性を確保する 1 つのアプローチは、プロファイルスクリプトコードで `OR` 条件を使用することです。

プロファイルスクリプトの例：

```Javascript
if(mbox.param('pageName') == 'Product Details'){
  return true
}
```

Platform Web SDK 互換性のための更新されたプロファイルスクリプト：

```Javascript
if((mbox.param('pageName') == 'Product Details') || (mbox.param('web.webPageDetails.pageName') =='Product Details')){
  return true
}
```

詳細とベストプラクティスについては、[ プロファイルスクリプト ](https://experienceleague.adobe.com/docs/target/using/audiences/visitor-profiles/profile-parameters.html) に関する専用ドキュメントを参照してください。

## 動的コンテンツのパラメータートークンの更新

[ 動的コンテンツ置換 ](https://experienceleague.adobe.com/docs/target/using/experiences/offers/passing-profile-attributes-to-the-html-offer.html) を使用するオファー、レコメンデーションデザインまたはアクティビティがある場合は、新しい XDM パラメーター名を考慮して、それに応じて更新する必要がある場合があります。

mbox パラメーターのトークン置き換えの使用方法によっては、古いパラメーター名と新しいパラメーター名の両方が考慮されるように、既存の設定を強化できる場合があります。 ただし、JSON オファーなど、カスタム JavaScript コードが利用できない状況では、移行が完了して実稼動サイトに移行した後、コピーを作成して更新を行う必要があります。

JSON オファーの例：

```JSON
{
  "pageName" : "${mbox.page_name}",
  "layoutVariation" : "grid"
}
```

Platform Web SDK パラメーター名を使用した JSON オファーの例：

```JSON
{
  "pageName" : "${mbox.web.webPagedDetails.pageName}",
  "layoutVariation" : "grid"
}
```

移行後に調整を行って新しい XDM mbox パラメーター名を考慮する場合は、影響を受けるアクティビティを移行イベント中に一時停止して、訪問者にアクティビティ表示エラーが表示されないようにしてください。

次に、[Target 実装の検証 ](validate.md) 方法を説明します。

>[!NOTE]
>
>アドビは、at.js から Web SDK への Target の移行を成功させるために取り組んでいます。 移行の際に問題が発生した場合、またはこのガイドに重要な情報が欠落していると感じる場合は、[ このコミュニティのディスカッション ](https://experienceleaguecommunities.adobe.com/t5/adobe-experience-platform-data/tutorial-discussion-migrate-target-from-at-js-to-web-sdk/m-p/575587#M463) に投稿してお知らせください。
