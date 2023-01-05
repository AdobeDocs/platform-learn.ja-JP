---
title: はじめに | at.js 2.x から Web SDK への Target の移行
description: Adobe Target実装を at.js 2.x からAdobe Experience Platform Web SDK に移行する方法について説明します。 トピックには、JavaScript ライブラリの読み込み、送信パラメーター、レンダリングアクティビティ、その他の注目すべき引き出し線が含まれます。
recommendations: catalog,noDisplay
source-git-commit: dad7a1b01c4313d6409ce07d01a6520ed83f5e89
workflow-type: tm+mt
source-wordcount: '635'
ht-degree: 5%

---

# at.js 2.x から Platform Web SDK への Target の移行

このガイドは、経験豊富なAdobe Target実装者向けに、at.js 実装をAdobe Experience Platform Web SDK に移行する方法を学ぶためのものです。

Adobe Experience Platform Web SDK は、Adobe Experience Cloudのお客様がAdobe Experience Platform Edge Network を通じてExperience Cloudサービスを操作できるようにする、クライアントサイド JavaScript ライブラリです。 この新しいライブラリは、個別のAdobeアプリケーションライブラリの機能を 1 つの軽量パッケージに組み合わせ、新しいAdobe Experience Platform機能を最大限に活用できます。

## 主なメリット

スタンドアロンの at.js ライブラリと比較した場合の Platform Web SDK のメリットには、次のものがあります。

* からのオーディエンスの共有を高速化 [Real-time Customer Data Platform](https://experienceleague.adobe.com/docs/platform-learn/tutorials/experience-cloud/next-hit-personalization.html?lang=ja)
* Target とJourney Optimizerの統合によるサポート [offer decisioning配信](https://experienceleague.adobe.com/docs/target/using/integrate/ajo/offer-decision.html)
* 使用可能 [ファーストパーティ id](https://experienceleague.adobe.com/docs/platform-learn/data-collection/edge-network/generate-first-party-device-ids.html?lang=ja) 長期間の訪問者識別用に ECID を生成するには
* Adobe・アプリケーション間のネットワーク・コールの統合
* 小さいフットプリントでページ速度の指標を改善
* Adobe Analyticsとのより緊密な統合で、別々のネットワーク呼び出しからの情報のステッチに依存しない
* 開発者にとって柔軟性の高い実装

おそらく、移行の最大のメリットは、Real-time Customer Data Platformのお客様にとってです。 Real-Time CDPは、Experience Platformに取り込まれるあらゆるデータとリアルタイム顧客プロファイル機能に基づいて、幅広いオーディエンス構築機能を提供します。 組み込みのデータガバナンスフレームワークにより、そのデータの責任を持つ使用が自動化されます。 顧客 AI を使用すると、機械学習モデルを簡単に使用して、傾向モデルと、その出力をAdobe Targetに共有できるチャーンモデルを構築できます。 さらに、オプションの医療およびプライバシーとセキュリティシールドのアドオンのお客様は、同意実施機能を使用して、個々のお客様の同意設定を容易に実施できます。 Platform Web SDK は、Web チャネルでこれらの RTCDP 機能を使用するための要件です。

## 学習内容

このチュートリアルを最後まで学習すると、以下の内容を習得できます。

* at.js と Platform Web SDK の Target 実装の違いについて
* Target 機能の初期設定のセットアップ
* at.js ライブラリを Platform Web SDK にアップグレードする
* フォームベースのアクティビティと Visual Experience Composer アクティビティをレンダリングする
* Target にパラメーターを渡す
* コンバージョンイベントの追跡
* クロスドメインサポートの有効化
* オーディエンスとプロファイルスクリプトを更新
* の実装を検証する
* Target エクスペリエンス配信のデバッグ


## 前提条件

このチュートリアルを完了するには、まず以下をおこなう必要があります。

* 現在の Target at.js の実装を技術的に理解する
* 次の項目があることを確認します。 [編集者または発行者の役割](https://experienceleague.adobe.com/docs/target/using/administer/manage-users/enterprise/properties-overview.html#section_8C425E43E5DD4111BBFC734A2B7ABC80) を Target インスタンスに追加し、独自の例を試せるようにします。
* のインストール [Adobe Experience Cloud Visual Editing Helper ブラウザー拡張機能](https://experienceleague.adobe.com/docs/target/using/experiences/vec/troubleshoot-composer/visual-editing-helper-extension.html) Google Chrome 用
* Adobe Targetでアクティビティを設定する方法を説明します。 リフレッシャーが必要な場合、このレッスンで役立つチュートリアルとガイドを次に示します。
   * [Visual Experience Composer の使用](https://experienceleague.adobe.com/docs/target-learn/tutorials/experiences/use-the-visual-experience-composer.html)
   * [フォームベースの Experience Composer の使用](https://experienceleague.adobe.com/docs/target-learn/tutorials/experiences/use-the-form-based-experience-composer.html)
   * [エクスペリエンスのターゲット設定アクティビティを作成](https://experienceleague.adobe.com/docs/target-learn/tutorials/activities/create-experience-targeting-activities.html)

準備が整ったら、移行を成功させるための最初の手順は、次のとおりです。 [移行プロセスの詳細](migration-overview.md) および at.js と Platform Web SDK の違いについて説明します。

>[!NOTE]
>
>at.js から Web SDK への Target の移行を成功に導くための支援に努めています。 移行時に障害が発生した場合や、このガイドに重要な情報が欠落していると思われる場合は、 [このコミュニティディスカッション](https://experienceleaguecommunities.adobe.com/t5/adobe-experience-platform-launch/tutorial-discussion-implement-adobe-experience-cloud-with-web/td-p/444996).