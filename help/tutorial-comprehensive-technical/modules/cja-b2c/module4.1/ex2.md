---
title: Customer Journey Analytics - Customer Journey Analytics内のAdobe Experience Platform データセットの接続
description: Customer Journey Analytics - Customer Journey Analytics内のAdobe Experience Platform データセットの接続
kt: 5342
doc-type: tutorial
source-git-commit: 6962a0d37d375e751a05ae99b4f433b0283835d0
workflow-type: tm+mt
source-wordcount: '671'
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

例：`vangeluw - Omnichannel Data Connection`

また、使用する正しいサンドボックスを選択する必要があります。 サンドボックスメニューで、`Bootcamp` すサンドボックスを選択します。 この例では、使用するサンドボックスは **Bootcamp** です。 また、**毎日のイベントの平均数** を **100 万未満** に設定する必要があります。

![ デモ ](./images/cjasb.png)

サンドボックスを選択すると、使用可能なデータセットが更新されます。

![ デモ ](./images/cjasb1.png)

## 4.1.2.2 Adobe Experience Platform データセットの選択

データセット `Demo System - Event Dataset for Website (Global v1.1)` を検索します。 「**+**」をクリックして、この接続にデータセットを追加します。

![ デモ ](./images/cja7.png)

次に、`Demo System - Event Dataset for Voice Assistants (Global v1.1)` と `Demo System - Event Dataset for Call Center (Global v1.1)` のチェックボックスを検索してオンにします。

これで完了です。 「**次へ**」をクリックします。

![ デモ ](./images/cja9.png)

## 4.1.2.3 人物 ID とデータステッチ

### ユーザー ID

現在の目標は、これらのデータセットを結合することです。 選択した各データセットに、「ユーザー ID **というフィールドが表示され** す。 各データセットには、独自のユーザー ID フィールドがあります。

![ デモ ](./images/cja11.png)

ご覧のように、ほとんどの場合、ユーザー ID が自動的に選択されます。 これは、Adobe Experience Platformのすべてのスキーマでプライマリ ID が選択されているからです。 例として、`Demo System - Event Schema for Call Center (Global v1.1)` のスキーマを見てみましょう。この場合、プライマリ ID が `phoneNumber` に設定されています。

![ デモ ](./images/cja13.png)

ただし、接続のためにデータセットをつなぎ合わせるために使用する識別子には、引き続き影響を与えることができます。 データセットにリンクされたスキーマに設定されている任意の識別子を使用できます。 ドロップダウンをクリックして、各データセットで使用できる ID を調べます。

![ デモ ](./images/cja14.png)

前述のように、データセットごとに異なるユーザー ID を設定できます。 これにより、CJA で複数のオリジンの異なるデータセットを統合できます。 NPS や調査データを取り込むと、コンテキストや何かが起きた理由を理解するのに非常に興味深く役立つだろうと想像してください。

ユーザー ID フィールドの値が対応している限り、ユーザー ID フィールドの名前は重要ではありません。 あるデータセットに `email` が含まれ、別のデータセットに `emailAddress` が含まれ、これがユーザー ID として定義されているとします。 両方のデータセット `delaigle@adobe.com` 人物 ID フィールドの値が同じ場合、CJA はデータをステッチできます。

現在、匿名の動作を既知の動作に関連付けるなど、他にもいくつかの制限があります。 よくある質問については、[FAQ](https://experienceleague.adobe.com/docs/analytics-platform/using/cja-overview/cja-faq.html) をご覧ください。

### ユーザー ID を使用したデータのステッチ

これで、ユーザー ID を使用してデータセットをステッチするという概念を理解できたので、各データセットのユーザー ID として `email` を選択します。

![ デモ ](./images/cja15.png)

各データセットに移動して、ユーザー ID を更新します。

![ デモ ](./images/cja12a.png)

次に、ドロップダウンリストで `email` を選択して、「ユーザー ID」フィールドに入力します。

![ デモ ](./images/cja17.png)

3 つのデータセットをステッチしたら、続行する準備が整います。

| データセット | ユーザー ID |
| ----------------- |-------------| 
| デモシステム - Web サイトのイベントデータセット（グローバル v1.1） | メール |
| デモシステム – 音声アシスタントのイベントデータセット（グローバル v1.1） | メール |
| デモシステム – コールセンターのイベントデータセット（グローバル v1.1） | メール |

また、すべてのデータセットで、次のオプションが有効になっていることを確認する必要があります。

- すべての新しいデータをインポート
- 既存のすべてのデータをバックフィル

「**データセットを追加**」をクリックします。

![ デモ ](./images/cja16.png)

「**保存**」をクリックして、次の演習に進みます。
**接続** を作成した後、CJA でデータを使用できるようになるまで数時間かかる場合があります。

![ デモ ](./images/cja20.png)

次の手順：[4.1.3 データビューの作成 ](./ex3.md)

[モジュール 4.1 に戻る](./customer-journey-analytics-build-a-dashboard.md)

[すべてのモジュールに戻る](./../../../overview.md)
