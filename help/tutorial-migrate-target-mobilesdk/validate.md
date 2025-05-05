---
title: Decisioning 拡張機能の実装の検証とトラブルシューティング
description: Decisioning 拡張機能を使用してAdobe Target Mobile 実装を検証およびトラブルシューティングする方法について説明します。
exl-id: edc6e25a-58d7-4145-97c3-bf48e980914f
source-git-commit: a4fe85580776e5d84f6deaf3c0224f0513ba8415
workflow-type: tm+mt
source-wordcount: '311'
ht-degree: 0%

---

# Decisioning 拡張機能の実装の検証とトラブルシューティング

Target 実装を Target 拡張機能から Decisioning 拡張機能に移行した後、変更を実稼動アプリに公開する前に、すべてが正しく機能していることを検証することが重要です。 Adobeでは次のことをお勧めします。詳しくは、このページを参照してください。

* 技術検証を実行し、基本的な実装と Platform Mobile SDKのリクエストおよび応答が正しいことを確認します
* Target アクティビティが適切に配信およびレンダリングされることを確認します。
* レポートが正しく機能することを確認します
* オーディエンスとプロファイルスクリプトを再確認して、Platform Mobile SDKおよび Optimizer 拡張機能と互換性があることを確認します
* Adobeまたはサードパーティアプリケーションとの統合が正しく機能することを確認します

Target の実装は、使用するサイトのアーキテクチャと機能によって異なります。 以下の表を出発点として使用し、実装に固有の項目を追加することができます。

## 技術的な検証とトラブルシューティング

Platform Mobile SDKと Decisioning 拡張機能を使用した技術検証とトラブルシューティングは、Assuranceで大幅に強化されました。 この重要なツールについては、次のドキュメントページを参照してください。

* [Assuranceでの Decisioning プラグインの設定 ](https://developer.adobe.com/client-sdks/edge/adobe-journey-optimizer-decisioning/assurance-setup/){target=_blank}

* [Optimize SDK設定の検証 ](https://developer.adobe.com/client-sdks/edge/adobe-journey-optimizer-decisioning/optimize-configuration-view/){target=_blank}

* [ リクエストを確認し、様々なエクスペリエンスをシミュレート ](https://developer.adobe.com/client-sdks/edge/adobe-journey-optimizer-decisioning/review-simulate/){target=_blank}

上記の検証手順を実行したら、Decisioning 拡張機能を備えた Platform Mobile SDK実装が、実稼動環境に移行する準備が整っていることを確認できます。

チュートリアルが終了しました。 Adobe Target実装から Decisioning 拡張機能への移行、ご協力をお願いいたします。

>[!NOTE]
>
>アドビは、Target 拡張機能から Decisioning 拡張機能への Mobile Target の移行を成功させるために取り組んでいます。 移行の際に問題が発生した場合、またはこのガイドに重要な情報が欠落していると感じる場合は、[ このコミュニティのディスカッション ](https://experienceleaguecommunities.adobe.com/t5/adobe-experience-platform-data/tutorial-discussion-migrate-target-from-at-js-to-web-sdk/m-p/575587?profile.language=ja#M463) に投稿してお知らせください。
