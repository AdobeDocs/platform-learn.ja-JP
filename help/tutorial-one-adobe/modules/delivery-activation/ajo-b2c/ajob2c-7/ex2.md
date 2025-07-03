---
title: Offer Decisioning - オファーと意思決定 ID の設定
description: Offer Decisioning - オファーと意思決定 ID の設定
kt: 5342
doc-type: tutorial
source-git-commit: 13d790855601fa6f36c1afa0f2d5faad5fc07eb0
workflow-type: tm+mt
source-wordcount: '217'
ht-degree: 13%

---

# 3.7.2 オファーと決定の設定

## パーソナラ 3.7.2.1 ズされたオファーの作成

この演習では、4 つの **パーソナライズされたオファー** を作成します。 これらのオファーを作成する際に考慮する詳細を次に示します。

| 名前 | 日付範囲 | メールの画像リンク | Web の画像リンク | テキスト | 優先度 | 実施要件 | 言語 | キャッピング頻度 | 画像名 |
|-----|------------|----------------------|--------------------|------|:--------:|--------------|:-------:|:-------:|:-------:|
| `--aepUserLdap-- - AirPods Max` | 今日 – 1 か月後 | https://bit.ly/4a9RJ5d | Assets ライブラリから選択 | `{{ profile.person.name.firstName }}, 10% discount on AirPods Max` | 25 | all – 女性のお客様 | 英語（米国） | 3 | Apple AirPods Max- Female.jpg |
| `--aepUserLdap-- - Galaxy S24` | 今日 – 1 か月後 | https://bit.ly/3W8yuDv | Assets ライブラリから選択 | `{{ profile.person.name.firstName }}, 5% discount on Galaxy S24` | 15 | all – 女性のお客様 | 英語（米国） | 3 | Galaxy S24 - Female.jpg |
| `--aepUserLdap-- - Apple Watch` | 今日 – 1 か月後 | https://bit.ly/4fGwfxX | https://bit.ly/4fGwfxX | `{{ profile.person.name.firstName }}, 10% discount on Apple Watch` | 25 | all – 男性の顧客 | 英語（米国） | 3 | Apple ウォッチ - Male.jpg |
| `--aepUserLdap-- - Galaxy Watch 7` | 今日 – 1 か月後 | https://bit.ly/4gTrkeo | Assets ライブラリから選択 | `{{ profile.person.name.firstName }}, 5% discount on Galaxy Watch 7` | 15 | all – 男性の顧客 | 英語（米国） | 3 | Galaxy Watch7 - Male.jpg |

{style="table-layout:auto"}

[Adobe Experience Cloud](https://experience.adobe.com) に移動して、Adobe Journey Optimizerにログインします。 **Journey Optimizer** をクリックします。

![ACOP](./../../../../modules/delivery-activation/ajo-b2c/ajob2c-1/images/acophome.png)

Journey Optimizerの **ホーム** ビューにリダイレクトされます。 最初に、正しいサンドボックスを使用していることを確認します。 使用するサンドボックスは `--aepSandboxName--` です。 その後、サンドボックス **ージの** ホーム `--aepSandboxName--` ビューに移動します。

![ACOP](./../../../../modules/delivery-activation/ajo-b2c/ajob2c-1/images/acoptriglp.png)

## 次の手順

Experience Decisioning の web SDKのセットアップ [3.7.3](./ex3.md){target="_blank"} に移動します。

[Experience Decisioning](ajo-decisioning.md){target="_blank"} に戻る

[ すべてのモジュール ](./../../../../overview.md){target="_blank"} に戻る
