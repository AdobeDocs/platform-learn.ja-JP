---
title: データの構造化
description: データの構造化
role: Developer
level: Intermediate
recommendations: noDisplay,noCatalog
jira: KT-10447
hide: true
hidefromtoc: true
exl-id: d300429a-5a66-4b61-97cb-b934fc8e8291
source-git-commit: 90f7621536573f60ac6585404b1ac0e49cb08496
workflow-type: tm+mt
source-wordcount: '400'
ht-degree: 0%

---

# データの構造化

企業は、自社のドメインについてのコミュニケーションに独自の言語を使用します。 自動車販売店は、メイク、モデル、シリンダーを扱っています。 航空会社は便番号、サービスのクラス、座席の割り当てを扱っています。 これらの用語の一部は特定の会社に固有のもので、一部は業界の間で共有されるもの、一部はほとんどすべての企業で共有されるものです。 業界の業種やより広範な分野で共有される用語については、これらの用語に共通の方法で名前を付け、構造化する際に、データを使用して強力な操作を開始できます。

例えば、多くの企業では注文を扱います。 これらの企業をまとめて、同様の方法で注文をモデル化することを決定した場合はどうなりますか。 例えば、データモデルが `priceTotal` 注文の合計価格を表すプロパティ。 そのオブジェクトに、という名前のプロパティも含まれている場合は、どうすればよいですか？ `currencyCode` および `purchaseOrderNumber`. 注文オブジェクトに、という名前のプロパティが含まれている可能性があります `payments` これは支払いオブジェクトの配列になります。 各オブジェクトは、注文の支払いを表します。 例えば、顧客が注文の一部に対してギフトカードで支払い、残りの部分に対してクレジットカードで支払ったとします。 次のようなモデルを作成できます。

```json
{
  "order": {
    "priceTotal": 89.50,
    "currencyCode": "EUR",
    "purchaseOrderNumber": "JWN20192388410012",
    "payments": [
      {
        "paymentType": "gift_card",
        "paymentAmount": 50
      },
      {
        "paymentType": "credit_card",
        "paymentAmount": 39.50
      }
    ]
  }
}
```

注文を扱うすべてのビジネスが、業界で共通の用語に対して一貫した方法で注文データをモデル化することを決定した場合、魔法のような事態が発生し始める可能性があります。 情報は、常にデータ（prop や eVar、誰か？）を解釈し翻訳する代わりに、組織の内外でより柔軟にやり取りすることができます。 機械学習はデータをより簡単に理解できる _手段_ 実用的なインサイトを提供します。 関連データを表示するユーザーインターフェイスをより直感的にすることができます。 データは、同じモデリングを使用するパートナーやベンダーとシームレスに統合できます。

## XDM

これがAdobeの目標 [エクスペリエンスデータモデル](https://business.adobe.com/products/experience-platform/experience-data-model.html). XDM は、業界で一般的なデータの規範的なモデリングを提供しますが、特定のニーズに合わせてモデルを拡張することもできます。 Adobe Experience Platformは XDM に基づいて構築されているので、Experience Platformに送信されるデータは XDM 内に存在する必要があります。 Experience Platformにデータを送信する前に、現在のデータモデルを XDM に変換する場所と方法を考えるのではなく、組織全体で XDM をより広く採用して、翻訳が必要になることをほとんど考えないようにします。
