---
title: Target を at.js 2.x から Web SDKに移行する
description: at.js 2.x からAdobe Experience Platform Web SDKにAdobe Targetの実装を移行する方法について説明します。 JavaScript ライブラリの読み込み、パラメーターの送信、レンダリングアクティビティ、その他の注目すべきコールアウトについて説明します。
last-substantial-update: 2023-02-23T00:00:00Z
exl-id: c8920fde-ad6b-4f2d-a35f-ce865b35bba0
source-git-commit: e0359d1bade01f79d0f7aff6a6e69f3e4d0c3b62
workflow-type: tm+mt
source-wordcount: '611'
ht-degree: 5%

---

# Target を at.js 2.x から Platform Web SDKに移行する

このガイドは、Adobe Targetの経験豊富な実装者向けに、at.js 実装をAdobe Experience Platform web SDKに移行する方法を説明します。

Adobe Experience Platform Web SDKは、Adobe Experience Cloudのお客様がAdobe Experience Platform JavaScriptを通じてExperience Cloud サービスを操作できるようにする、クライアントサイド Edge Network ライブラリです。 この新しいライブラリは、個別のAdobe アプリケーションライブラリの機能を、Adobe Experience Platformの新機能を最大限に活用できる軽量なパッケージに組み合わせています。


>[!NOTE]
>
>同様の移行チュートリアルを次のユーザーが利用できます。
>
> * [Adobe Analytics](../tutorial-migrate-analytics-websdk/migration-to-websdk-overview.md)
> * [Adobe Audience Manager](https://experienceleague.adobe.com/ja/docs/audience-manager/user-guide/migrate-to-web-sdk/appmeasurement-to-web-sdk)

>[!CAUTION]
>
> Platform Web SDKは複数のAdobe アプリケーションをサポートしているので、特定のページ上のすべてのAdobe ライブラリを同時に移行する必要があります。 例えば、1 つのページに Web SDK for Target とAppMeasurement for Analytics が混在して実装されているとします _サポートされていません_。 ただし、異なるページ間の混合実装がサポートされています（例：ページ A の Web SDKと、ページ B のAppMeasurementを含む at.js）。



## 主なメリット

スタンドアロンの at.js ライブラリと比較した場合の Platform Web SDKの利点には、次のようなものがあります。

* [Real-Time Customer Data Platform](https://experienceleague.adobe.com/ja/docs/platform-learn/tutorials/destinations/target/next-hit-personalization) からのオーディエンスの共有を高速化
* [Offer Decisioning配信をサポートするための Target とJourney Optimizerの統合 ](https://experienceleague.adobe.com/ja/docs/target/using/integrate/ajo/offer-decision)
* [ ファーストパーティ ID](https://experienceleague.adobe.com/ja/docs/platform-learn/data-collection/edge-network/generate-first-party-device-ids) を使用して ECID を生成する機能により、訪問者の識別を延長
* 設置面積の縮小によるページ速度指標の改善
* 開発者向けの実装の柔軟性の向上

Target をご利用のお客様が移行する最大のメリットは、おそらくReal-Time Customer Data Platformとの統合です。 Real-Time CDPは、Experience Platformに取り込まれるすべてのデータとリアルタイム顧客プロファイル機能に基づいて、オーディエンスを構築する非常に優れた機能を提供します。 ビルトインのデータガバナンスフレームワークにより、そのデータの責任ある使用が自動化されます。 顧客 AI を使用すると、機械学習モデルを簡単に使用して、傾向モデルとチャーンモデルを作成し、その出力をAdobe Targetに戻すことができます。 最後に、オプションのヘルスケアおよびプライバシーおよびセキュリティシールド アドオンのお客様は、同意強制機能を使用して、個々のお客様の同意設定を簡単に適用できます。 Platform Web SDKは、web チャネルでこれらのReal-Time CDP機能を使用するための要件です。

## 学習目標

このチュートリアルを最後まで学習すると、以下の内容を習得できます。

* at.js と Platform Web SDKの Target 実装の違いについて
* Target 機能の初期設定の指定
* at.js ライブラリを Platform Web SDKにアップグレードします
* フォームベースと visual experience composer アクティビティのレンダリング
* Target へのパラメーターの受け渡し
* コンバージョンイベントの追跡
* クロスドメインサポートの有効化
* オーディエンスとプロファイルスクリプトの更新
* の実装を検証する
* Target エクスペリエンス配信のデバッグ


## 前提条件

このチュートリアルを完了するには、まず次の操作を行う必要があります。

* 現在の Target at.js の実装の技術的な理解
* Target インスタンスに [ 編集者または発行者の役割 ](https://experienceleague.adobe.com/docs/target/using/administer/manage-users/enterprise/properties-overview.html?lang=ja#section_8C425E43E5DD4111BBFC734A2B7ABC80) があることを確認して、例を自分で試せるようにします
* Adobe Targetでアクティビティを設定する方法を理解する 復習が必要な場合は、次のチュートリアルとガイドがこのレッスンに役立ちます。
   * [Visual Experience Composer の使用](https://experienceleague.adobe.com/docs/target-learn/tutorials/experiences/use-the-visual-experience-composer.html?lang=ja)
   * [ フォームベースの Experience Composer の使用 ](https://experienceleague.adobe.com/docs/target-learn/tutorials/experiences/use-the-form-based-experience-composer.html?lang=ja)
   * [エクスペリエンスのターゲット設定アクティビティの作成](https://experienceleague.adobe.com/docs/target-learn/tutorials/activities/create-experience-targeting-activities.html?lang=ja)

準備が整ったら、移行を成功させるための最初の手順は、[ 移行プロセスについて、および at.js と Platform Web SDKの違いについて学ぶ ](migration-overview.md) です。

>[!NOTE]
>
>アドビは、at.js から web SDKへの Target の移行を成功させるために取り組んでいます。 移行の際に問題が発生した場合、またはこのガイドに重要な情報が欠落していると感じる場合は、[ このコミュニティのディスカッション ](https://experienceleaguecommunities.adobe.com/t5/adobe-experience-platform-data/tutorial-discussion-migrate-target-from-at-js-to-web-sdk/m-p/575587?profile.language=ja#M463) に投稿してお知らせください。
