---
title: Customer Journey Analytics - Customer Journey Analytics内のAdobe Experience Platform データセットの接続
description: Customer Journey Analytics - Customer Journey Analytics内のAdobe Experience Platform データセットの接続
kt: 5342
doc-type: tutorial
exl-id: 96e7a5b2-9833-430a-8eab-27651a113675
source-git-commit: d6f6423adbc8f0ce8e20e686ea9ffd9e80ebb147
workflow-type: tm+mt
source-wordcount: '714'
ht-degree: 1%

---

# 4.1.2 Customer Journey AnalyticsでのAdobe Experience Platform データセットの接続

## 目標

- データ接続 UI について
- Adobe Experience Platform データを CJA に取り込む
- 人物 ID とデータステッチについて
- Customer Journey Analyticsでのデータストリーミングの概念について説明します

## 4.1.2.1 接続

[analytics.adobe.com](https://analytics.adobe.com) に移動して、Customer Journey Analyticsにアクセスします。

Customer Journey Analyticsホームページで、「**接続**」に移動します。

![ デモ ](./images/cja2.png)

ここでは、CJA と Platform の間で行われたすべての異なる接続を確認できます。 これらの接続の目標は、Adobe Analyticsのレポートスイートと同じです。 ただし、データの収集は完全に異なります。 すべてのデータは、Adobe Experience Platform データセットから取得されます。

最初の接続を作成しましょう。 **新しい接続を作成** をクリックします。

![ デモ ](./images/cja4.png)

その後、**接続を作成** UI が表示されます。

![ デモ ](./images/cja5.png)

接続に名前を付けられるようになりました。

命名規則 `--aepUserLdap-- – Omnichannel Data Connection` を使用してください。

また、使用する正しいサンドボックスを選択する必要があります。 サンドボックスメニューで、`--aepSandboxName--` すサンドボックスを選択します。 この例では、サンドボックスは **テクニカルインサイダー** です。 また、**毎日のイベントの平均数** を **100 万未満** に設定する必要があります。

![ デモ ](./images/cjasb.png)

サンドボックスを選択したら、データセットの追加を開始できます。 「**データセットを追加**」をクリックします。

![ デモ ](./images/cjasb1.png)

## 4.1.2.2 Adobe Experience Platform データセットの選択

データセット `Demo System - Event Dataset for Website (Global v1.1)` を検索します。 このデータセットのボックスを有効にして、この接続に追加します。

![ デモ ](./images/cja7.png)

同じ画面にとどまり、`Demo System - Event Dataset for Call Center (Global v1.1)` のチェックボックスを検索して確認します。

これで完了です。 「**次へ**」をクリックします。

![ デモ ](./images/cja9.png)

## 4.1.2.3 人物 ID とデータステッチ

### ユーザー ID

現在の目標は、これらのデータセットを結合することです。 選択した各データセットに、「ユーザー ID **というフィールドが表示され** す。 各データセットには、独自のユーザー ID フィールドがあります。

![ デモ ](./images/cja11.png)

ご覧のように、ほとんどの場合、ユーザー ID が自動的に選択されます。 これは、Adobe Experience Platformのすべてのスキーマでプライマリ ID が選択されているからです。 例えば、`Demo System - Event Schema for Website (Global v1.1)` のスキーマで、プライマリ ID が `ecid` に設定されていることがわかります。

![ デモ ](./images/cja13.png)

ただし、接続のためにデータセットをつなぎ合わせるために使用する識別子には、引き続き影響を与えることができます。 データセットにリンクされたスキーマに設定されている任意の識別子を使用できます。 ドロップダウンをクリックして、各データセットで使用できる ID を調べます。

![ デモ ](./images/cja14.png)

前述のように、データセットごとに異なるユーザー ID を設定できます。 これにより、CJA で複数のオリジンの異なるデータセットを統合できます。 NPS や調査データを取り込むと、コンテキストや何かが起きた理由を理解するのに非常に興味深く役立つだろうと想像してください。

ユーザー ID フィールドの値が対応している限り、ユーザー ID フィールドの名前は重要ではありません。 あるデータセットに `email` が含まれ、別のデータセットに `emailAddress` が含まれ、これがユーザー ID として定義されているとします。 両方のデータセット `delaigle@adobe.com` 人物 ID フィールドの値が同じ場合、CJA はデータをステッチできます。

CJA に関する FAQ をここで確認し、ID ステッチのニュアンスを理解します。[FAQ](https://experienceleague.adobe.com/docs/analytics-platform/using/cja-overview/cja-faq.html?lang=ja)。

### ユーザー ID を使用したデータのステッチ

これで、ユーザー ID を使用してデータセットをステッチするという概念を理解できたので、各データセットのユーザー ID として `email` を選択します。

![ デモ ](./images/cja15.png)

各データセットに移動して、ユーザー ID を更新します。 次に、ドロップダウンリストで `email` を選択して、「ユーザー ID」フィールドに入力します。

![ デモ ](./images/cja12a.png)

2 つのデータセットをステッチしたら、続行する準備が整います。

| データセット | ユーザー ID |
| ----------------- |-------------| 
| デモシステム - Web サイトのイベントデータセット（グローバル v1.1） | メール |
| デモシステム – コールセンターのイベントデータセット（グローバル v1.1） | メール |

また、両方のデータセットで、次のオプションが有効になっていることを確認する必要があります。

- すべての新しいデータをインポート
- 既存のすべてのデータをバックフィル

（2 番目のデータセットでは、これらのオプションを両方とも有効にすることを忘れないでください）

また、データセットごとに **データソースタイプ** を選択する必要があります。

以下は、データセットの設定です **デモシステム - Web サイトのイベントデータセット（グローバル v1.1）**。

![ デモ ](./images/cja16a.png)

以下は、データセットの設定です **デモシステム - Web サイトのイベントデータセット（グローバル v1.1）**。

「**データセットを追加**」をクリックします。

![ デモ ](./images/cja16.png)

「**保存**」をクリックして、次の演習に進みます。

**接続** を作成した後、CJA でデータを使用できるようになるまで数時間かかる場合があります。

![ デモ ](./images/cja20.png)

次の手順：[4.1.3 データビューの作成 ](./ex3.md)

[モジュール 4.1 に戻る](./customer-journey-analytics-build-a-dashboard.md)

[すべてのモジュールに戻る](./../../../overview.md)
