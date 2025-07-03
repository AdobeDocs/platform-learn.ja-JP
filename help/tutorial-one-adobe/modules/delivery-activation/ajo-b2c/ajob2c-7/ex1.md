---
title: Experience Decisioning - Experience Decisioning 101
description: Experience Decisioning - Experience Decisioning 101
kt: 5342
audience: Data Engineer, Data Architect, Orchestration Engineer, Marketer
doc-type: tutorial
source-git-commit: 13d790855601fa6f36c1afa0f2d5faad5fc07eb0
workflow-type: tm+mt
source-wordcount: '365'
ht-degree: 1%

---

# 3.7.1 Experience Decisioning 101

## 3.7.1.1 Terminology

Experience Decisioning に関する理解を深めるために、Offer Decisioning アプリケーションサービスとAdobe Experience Platformの連携に関する [ 概要 ](https://experienceleague.adobe.com/docs/journey-optimizer/using/offer-decisioniong/get-started-decision/starting-offer-decisioning.html?lang=en) を読むことを強くお勧めします。

Offer Decisioningを使用するには、次の概念を理解している必要があります。

| 用語 | 説明 |
| ------------------------- | -------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| **オファー** | オファーは、オファーを表示する資格のあるユーザーを指定するルールが関連付けられているマーケティングメッセージです。 オファーのステータスは、ドラフト、承認済みまたはアーカイブ済みです。 |
| **プレースメント** | エンドユーザーに対してオファーが表示される場所（またはチャネルタイプ）とコンテキスト（またはコンテンツタイプ）の組み合わせ。 実際には、テキスト、HTML、画像、モバイル、web、ソーシャル、インスタントメッセージング、非デジタルチャネルの JSON の組み合わせです。 |
| **ルール** | オファーに対するエンドユーザーの実施要件を定義および制御するロジック。 |
| **パーソナライズされたオファー** | 実施要件ルールおよび制約に基づいてカスタマイズできるマーケティングメッセージ。 |
| **フォールバックオファー** | エンドユーザーが使用されるコレクション内のオファーのいずれにも資格がない場合に表示されるデフォルトのオファーです。 |
| **キャッピング** | オファー定義で、1 つのオファーを合計で提示できる回数と特定のユーザーに提示できる回数を定義するために使用します。 |
| **優先度** | オファーの結果セットから優先度ランクを決定するレベル。 |
| **コレクション** | パーソナライズされたオファーリストからオファーのサブセットを除外し、Offer Decisioning プロセスを高速化するために使用されます。 |
| **決定** | マーケターが決定エンジンに対して、最適なオファーを提供することを求めている、オファー、プレースメントおよびプロファイルのセットの組み合わせ。 |
| **AEM Assets Essentials** | Adobe Experience Cloud ソリューションおよびAdobe Experience Platformをまたいでアセットの保存、検索、選択を行う、ユニバーサルで一元化されたエクスペリエンス。 |

{style="table-layout:auto"}

## 3.7.1.2 Experience Decisioning

[Adobe Experience Cloud](https://experience.adobe.com) に移動して、Adobe Journey Optimizerにログインします。 **Journey Optimizer** をクリックします。

![ExD](./../../../../modules/delivery-activation/ajo-b2c/ajob2c-1/images/acophome.png)

Journey Optimizerの **ホーム** ビューにリダイレクトされます。 最初に、正しいサンドボックスを使用していることを確認します。 使用するサンドボックスは `--aepSandboxName--` です。 その後、サンドボックス **ージの** ホーム `--aepSandboxName--` ビューに移動します。

![ExD](./../../../../modules/delivery-activation/ajo-b2c/ajob2c-1/images/acoptriglp.png)

次の演習では、独自のオファーと決定を設定します。

## 次の手順

[3.7.2 オファーと決定の設定 ](./ex2.md){target="_blank"} に移動します。

[Experience Decisioning](ajo-decisioning.md){target="_blank"} に戻る

[ すべてのモジュール ](./../../../../overview.md){target="_blank"} に戻る
