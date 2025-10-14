---
title: 顧客 AI - スコアリングダッシュボードとセグメント化（予測と実行アクション）
description: 顧客 AI - スコアリングダッシュボードとセグメント化（予測と実行アクション）
kt: 5342
doc-type: tutorial
exl-id: 4dd8489a-65e4-489a-9228-3c642b10e761
source-git-commit: b53ee64ae8438b8f48f842ed1f44ee7ef3e813fc
workflow-type: tm+mt
source-wordcount: '272'
ht-degree: 2%

---

# 2.2.3 顧客 AI - スコアリングダッシュボードおよびセグメント化（予測と実行アクション）

顧客 AI インスタンスがモデルの実行を完了すると、今後 30 日間に購入を行う顧客を予測するために評価される傾向スコアを視覚化できます。

![AI](./images/caiinstancesummary1.png)

>[!NOTE]
>
>ステータスが **成功** の顧客 AI インスタンスのみが、サービスのインサイトをプレビューできます。

## 傾向の予測

次に、顧客 AI インスタンスモデルによって生成される予測された傾向を確認しましょう。 インスタンス名をクリックしてダッシュボードを表示します。

![AI](./images/caimodels1.png)

顧客 AI ダッシュボードには、スコア、母集団の分布および評価するモデルに影響を与えた要因に関する概要が表示されます。

![AI の説明 &#x200B;](./images/caidescription.png)

影響を及ぼす要因にポインタを合わせると、データ配分のさらなる分類が表示されます。

![&#x200B; 影響要因 &#x200B;](./images/caiinfluencefactors.png)

## ビジネスアクション

### 顧客のセグメント化

顧客 AI ダッシュボードでは、1 回のクリックでセグメントを定義できます。 傾向カードの **セグメントを作成** ボタンをクリックします。

![セグメントの作成](./images/caiinfluencefactors1.png)

セグメント定義が自動的に作成されていることがわかります。

![&#x200B; セグメントルール &#x200B;](./images/caicreatesegment.png)

次の命名規則に従って、セグメントに名前を付けます：`--aepUserLdap-- - Customer AI High Propensity`。 「**公開**」をクリックします。

![&#x200B; セグメントルール &#x200B;](./images/caicreatesegment1.png)

これで、例えば Real-time CDP、Journey OptimizerおよびAdobe Targetを使用したターゲティングに、このセグメントを使用できるようになりました。

## クリーンアップ

不要なデモデータが環境に保持されないようにするには、この演習を正常に完了したら、必ずデータセット `--aepUserLdap-- - Demo System - Customer Experience Event Dataset` を削除してください。 デモデータを削除しないと、AEP インスタンスのコストに影響します。

![プロファイル](./images/cleanup.png)

次の手順：[&#x200B; 概要とメリット &#x200B;](./summary.md)

[モジュール 2.2 に戻る](./intelligent-services.md)

[すべてのモジュールに戻る](./../../../overview.md)
