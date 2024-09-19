---
title: Target を at.js 2.x から Web SDK に移行する
description: at.js 2.x からAdobe Experience Platform Web SDK にAdobe Target実装を移行する方法を説明します。 JavaScript ライブラリの読み込み、パラメーターの送信、レンダリングアクティビティ、その他の注目すべきコールアウトについて説明します。
last-substantial-update: 2023-02-23T00:00:00Z
exl-id: c8920fde-ad6b-4f2d-a35f-ce865b35bba0
source-git-commit: eebe598e55228d038dfc2adb97df0f8ff03748ac
workflow-type: tm+mt
source-wordcount: '556'
ht-degree: 4%

---

# Target を at.js 2.x から Platform Web SDK に移行する

このガイドは、Adobe Targetの経験豊富な実装者向けに、at.js 実装をAdobe Experience Platform Web SDK に移行する方法を説明します。

Adobe Experience Platform Web SDK は、Adobe Experience Cloudのお客様がAdobe Experience Platform Edge Networkを通じてExperience Cloudサービスを操作できるようにする、クライアントサイド JavaScript ライブラリです。 この新しいライブラリは、個別のAdobeアプリケーションライブラリの機能を、Adobe Experience Platformの新機能を最大限に活用できる 1 つの軽量パッケージに組み合わせています。

## 主なメリット

スタンドアロンの at.js ライブラリと比較した場合の Platform Web SDK の利点には、次のようなものがあります。

* [Real-time Customer Data Platform](https://experienceleague.adobe.com/docs/platform-learn/tutorials/experience-cloud/next-hit-personalization.html?lang=ja) からのオーディエンスの共有を高速化
* [Offer decisioning配信をサポートするための Target とJourney Optimizerの統合 ](https://experienceleague.adobe.com/docs/target/using/integrate/ajo/offer-decision.html)
* [ ファーストパーティ ID](https://experienceleague.adobe.com/docs/platform-learn/data-collection/edge-network/generate-first-party-device-ids.html?lang=ja) を使用して ECID を生成する機能により、訪問者の識別を延長
* Adobe・アプリケーション間のネットワーク・コールの統合
* 設置面積の縮小によるページ速度指標の改善
* Adobe Analyticsとの緊密な統合：個別のネットワーク呼び出しからの情報のステッチに依存しない
* 開発者向けの実装の柔軟性の向上

Target をご利用のお客様が移行する最大のメリットは、おそらくReal-time Customer Data Platformとの統合です。 Real-Time CDPは、Experience Platformに取り込まれるすべてのデータ範囲とリアルタイム顧客プロファイル機能に基づいて、オーディエンスを構築する途方もない機能を提供します。 ビルトインのデータガバナンスフレームワークにより、そのデータの責任ある使用が自動化されます。 顧客 AI を使用すると、機械学習モデルを簡単に使用して、傾向モデルとチャーンモデルを作成し、その出力をAdobe Targetに戻すことができます。 最後に、オプションのヘルスケアおよびプライバシーおよびセキュリティシールド アドオンのお客様は、同意強制機能を使用して、個々のお客様の同意設定を簡単に適用できます。 Platform Web SDK は、web チャネルでこれらの RTCDP 機能を使用するための要件です。

## 学習目標

このチュートリアルを最後まで学習すると、以下の内容を習得できます。

* at.js と Platform Web SDK の Target 実装の違いについて
* Target 機能の初期設定の指定
* at.js ライブラリを Platform Web SDK にアップグレードします
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
* Target インスタンスに [ 編集者または発行者の役割 ](https://experienceleague.adobe.com/docs/target/using/administer/manage-users/enterprise/properties-overview.html#section_8C425E43E5DD4111BBFC734A2B7ABC80) があることを確認して、例を自分で試せるようにします
* Adobe Targetでアクティビティを設定する方法を理解する 復習が必要な場合は、次のチュートリアルとガイドがこのレッスンに役立ちます。
   * [Visual Experience Composer の使用](https://experienceleague.adobe.com/docs/target-learn/tutorials/experiences/use-the-visual-experience-composer.html)
   * [ フォームベースの Experience Composer の使用 ](https://experienceleague.adobe.com/docs/target-learn/tutorials/experiences/use-the-form-based-experience-composer.html)
   * [ エクスペリエンスのターゲット設定アクティビティの作成 ](https://experienceleague.adobe.com/docs/target-learn/tutorials/activities/create-experience-targeting-activities.html)

準備が整ったら、移行を成功させるための最初の手順は、[ 移行プロセスについて、および at.js と Platform Web SDK の違いについて説明 ](migration-overview.md) することです。

>[!NOTE]
>
>アドビは、at.js から Web SDK への Target の移行を成功させるために取り組んでいます。 移行の際に問題が発生した場合、またはこのガイドに重要な情報が欠落していると感じる場合は、[ このコミュニティのディスカッション ](https://experienceleaguecommunities.adobe.com/t5/adobe-experience-platform-data/tutorial-discussion-migrate-target-from-at-js-to-web-sdk/m-p/575587#M463) に投稿してお知らせください。
