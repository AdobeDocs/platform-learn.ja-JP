---
title: Target オーディエンスとプロファイルスクリプトの更新 – モバイルアプリのAdobe Target実装をOffer Decisioning and Target 拡張機能に移行します
description: Offer Decisioningおよび Target 拡張機能との互換性を確保するために、Adobe Target オーディエンスとプロファイルスクリプトを更新する方法について説明します。
exl-id: de3ce2c7-0066-496a-a8a7-994d7ce3d92c
source-git-commit: 876e664a213aec954105bf2d5547baab5d8a84ea
workflow-type: tm+mt
source-wordcount: '542'
ht-degree: 0%

---

# Decisioning モバイル拡張機能の互換性のための Target オーディエンスとプロファイルスクリプトの更新


Target をOffer Decisioningおよび Target 拡張機能に移行するための技術的な更新が完了したら、スムーズな移行を確保するために、オーディエンス、プロファイルスクリプト、アクティビティの一部を更新する必要がある場合があります。

>[!INFO]
>
>すべての mbox パラメーターを `data.__adobe.target` オブジェクトに移行する場合、以下に示すように、オーディエンス、プロファイルスクリプト、アクティビティを更新する必要はありません。


mbox パラメーターを `xdm` オブジェクトに移行する場合、変更を実稼動環境に公開する前に、次のことを行う必要があります。

* mbox パラメーターを使用するオーディエンスの更新
* mbox パラメーターを使用するプロファイルスクリプトの更新
* mbox パラメータートークンの置き換え（`${mbox.parameter_name}` など）を使用して、オファーとアクティビティを更新します

## オーディエンスの調整

mbox パラメーターを `xdm` オブジェクトに移行する場合は、カスタム mbox パラメーターを使用するオーディエンスを、新しい XDM パラメーター名を使用するように更新する必要があります。 例えば、`page_name` のカスタムパラメーターは、`web.webpagedetails.pageName` にマッピングされる可能性があります。

Target 拡張機能とOffer Decisioningおよび Target 拡張機能の両方との互換性を確保する 1 つのアプローチは、以下に示すように、関連するオーディエンスを更新して、`OR` の条件が使用されるようにすることです。

![Offer Decisioningと Target 拡張機能の互換性に対応する Target オーディエンスの更新の表示方法 ](assets/target-audience-update.png){zoomable="yes"}

## プロファイルスクリプトの編集

mbox パラメーターを `xdm` オブジェクトに移行する場合は、新しい XDM パラメーター名（オーディエンスと同様）を参照するようにプロファイルスクリプトを更新する必要があります。 mbox パラメーター名の変更以外に、Target 実装と Decisioning 実装の間でプロファイルスクリプトが機能する方法に違いはありません。

互換性を確保する 1 つのアプローチは、プロファイルスクリプトコードで `OR` 条件を使用することです。

プロファイルスクリプトの例：

```Javascript
if(mbox.param('pageName') == 'Product Details'){
  return true
}
```

Platform Web SDKの互換性のための更新されたプロファイルスクリプト：

```Javascript
if((mbox.param('pageName') == 'Product Details') || (mbox.param('web.webPageDetails.pageName') =='Product Details')){
  return true
}
```

詳細とベストプラクティスについては、[ プロファイルスクリプト ](https://experienceleague.adobe.com/en/docs/target/using/audiences/visitor-profiles/profile-parameters) に関する専用ドキュメントを参照してください。

## 動的コンテンツのパラメータートークンの更新

mbox パラメーターを `xdm` オブジェクトに移行する場合、および [ 動的コンテンツ置換 ](https://experienceleague.adobe.com/en/docs/target/using/experiences/offers/passing-profile-attributes-to-the-html-offer) を使用するオファー、レコメンデーションデザインまたはアクティビティがある場合は、新しい XDM パラメーター名を考慮して、それに応じて更新する必要がある可能性があります。

mbox パラメーターのトークン置き換えの使用方法によっては、古いパラメーター名と新しいパラメーター名の両方が考慮されるように、既存の設定を強化できる場合があります。 ただし、JSON オファーなど、カスタム JavaScript コードが利用できない状況では、移行が完了して実稼動サイトに移行した後、コピーを作成して更新を行う必要があります。

JSON オファーの例：

```JSON
{
  "pageName" : "${mbox.page_name}",
  "layoutVariation" : "grid"
}
```

XDM オブジェクトパラメーター名を使用した JSON オファーの例：

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
>アドビは、Target 拡張機能からOffer Decisioningおよび Target 拡張機能への Mobile Target の移行を成功させるために取り組んでいます。 移行の際に問題が発生した場合、またはこのガイドに重要な情報が欠落していると感じる場合は、[ このコミュニティのディスカッション ](https://experienceleaguecommunities.adobe.com/t5/adobe-experience-platform-data/tutorial-discussion-migrate-target-from-at-js-to-web-sdk/m-p/575587#M463) に投稿してお知らせください。
