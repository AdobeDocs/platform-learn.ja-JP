---
title: Web データ用の XDM スキーマの作成
description: データ収集インターフェイスで Web データ用の XDM スキーマを作成する方法を説明します。 このレッスンは、「 Adobe Experience Cloudと Web SDK の実装」チュートリアルの一部です。
feature: Web SDK,Schemas
source-git-commit: f08866de1bd6ede50bda1e5f8db6dbd2951aa872
workflow-type: tm+mt
source-wordcount: '1493'
ht-degree: 1%

---

# Web データ用の XDM スキーマの作成

データ収集インターフェイスで Web データ用の XDM スキーマを作成する方法を説明します。

エクスペリエンスデータモデル (XDM) スキーマは、Adobe Experience Platformでデータを収集するための構成要素、原則およびベストプラクティスです。

Platform Web SDK は、スキーマを使用して WebExperience Cloudデータを標準化し、Platform Edge ネットワークに送信し、最終的に、データをデータストリームで設定された任意のイベントアプリケーションに転送します。 顧客体験データをExperience Platformに取り込むために必要な標準データモデルを定義し、これらの標準に基づいて構築されたダウンストリームサービスとアプリケーションを可能にするので、この手順は重要です。

## データのモデル化の理由

企業は、自社のドメインについてのコミュニケーションに独自の言語を使用します。 自動車販売店は、メイク、モデル、シリンダーを扱っています。 航空会社は便番号、サービスのクラス、座席の割り当てを扱っています。 これらの用語の一部は特定の会社に固有のもので、一部は業種間で共有されるもの、一部はほとんどの企業で共有されるものです。 業界の業種やより広い分野で共有される用語については、これらの用語に共通の方法で名前を付け、構造化する際に、データを使用して強力な操作を開始できます。

例えば、多くの企業では注文を扱います。 これらの企業が共同で、同様の方法で注文をモデル化することを決定した場合、どうなりますか？ 例えば、データモデルが `priceTotal` 注文の総価格を表すプロパティですか？ そのオブジェクトに、という名前のプロパティも含まれている場合はどうなりますか？ `currencyCode` および `purchaseOrderNumber`? 注文オブジェクトに、という名前のプロパティが含まれている可能性があります `payments` これは支払いオブジェクトの配列になります。 各オブジェクトは、注文の支払いを表します。 例えば、顧客が注文の一部に対してギフトカードで支払い、残りの部分に対してクレジットカードで支払ったとします。 次のようなモデルを作成できます。

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

注文を扱うすべてのビジネスが、業界で共通の用語に対して一貫した方法で注文データをモデル化することを決定した場合、魔法のような事態が発生し始める可能性があります。 情報は、常にデータ（prop や eVar、誰か？）を解釈し翻訳する代わりに、組織の内外でより柔軟に交換することができます。 機械学習はデータをより簡単に理解できる _手段_ 実用的なインサイトを提供します。 関連データを表示するユーザーインターフェイスをより直感的にすることができます。 データは、同じモデリングを使用するパートナーやベンダーとシームレスに統合できます。

これがAdobeの目標 [エクスペリエンスデータモデル](https://business.adobe.com/products/experience-platform/experience-data-model.html). XDM は、業界で一般的なデータの規範的なモデリングを提供しますが、特定のニーズに合わせてモデルを拡張することもできます。 Adobe Experience Platformは XDM に基づいて構築されているので、Experience Platformに送信されるデータは XDM に存在する必要があります。 Experience Platformにデータを送信する前に、現在のデータモデルを XDM に変換する場所と方法を考えるのではなく、組織全体で XDM をより広く採用して、翻訳が必要になることをほとんど考えないようにします。


>[!NOTE]
>
> デモ用に、このレッスンの演習では、スキーマの例を作成して、閲覧されたコンテンツと顧客が購入した製品を [Luma デモサイト](https://luma.enablementadobe.com/content/luma/us/en.html). これらの手順を使用して、独自の目的で別のスキーマを作成できますが、まずサンプルのスキーマを作成して、スキーマエディターの機能を学ぶことをお勧めします。

XDM スキーマの詳細については、コースを参照してください [XDM を使用した顧客体験データのモデル化](https://experienceleague.adobe.com/?recommended=ExperiencePlatform-D-1-2021.1.xdm&amp;lang=ja) または [XDM システムの概要](https://experienceleague.adobe.com/docs/experience-platform/xdm/home.html?lang=ja).

## 学習内容

このレッスンを最後まで学習すると、以下の内容を習得できます。

* データ収集インターフェイス内での XDM スキーマの作成
* XDM スキーマへのフィールドグループの追加
* ベストプラクティスを使用した Web イベントデータの XDM スキーマの作成

## 前提条件

データ収集とAdobe Experience Platformに必要なすべてのプロビジョニングとユーザー権限 ( [概要](overview.md) ページに貼り付けます。

## XDM スキーマの作成

XDM スキーマは、Experience Platform内のデータを記述する標準的な方法で、スキーマに準拠するすべてのデータを、競合なしに組織全体で再利用したり、複数の組織間で共有したりできます。 詳しくは、 [スキーマ構成の基本](https://experienceleague.adobe.com/docs/experience-platform/xdm/schema/composition.html?lang=ja).

この演習では、上の Web イベントデータを取り込むための推奨ベースラインフィールドグループを使用して XDM スキーマを作成します。 [Luma デモサイト](https://luma.enablementadobe.com/content/luma/us/en.html){target="_blank"}:

1. を開きます。 [データ収集インターフェイス](https://launch.adobe.com/){target="_blank"}
1. 正しいサンドボックス内にあることを確認します。 右上隅のサンドボックスを見つけます。

   >[!NOTE]
   >
   >Real-Time CDPやJourney Optimizerなどの Platform ベースのアプリケーションをご利用の場合は、このチュートリアルで開発用サンドボックスを使用することをお勧めします。 そうでない場合は、 **[!UICONTROL Prod]** サンドボックス。

1. に移動します。 **[!UICONTROL スキーマ]** 左のナビゲーションで
1. を選択します。 **[!UICONTROL スキーマを作成]** 右上のボタン

   ![スキーマを作成](assets/schema-xdm-create-schema.png)
1. 選択 **[!UICONTROL エクスペリエンスイベント]** 次の画面で
1. 選択 **[!UICONTROL 次へ]**

   ![スキーマエクスペリエンスイベント](assets/schema-experience-event.png)

1. 以下にスキーマの名前を入力します。 **[!UICONTROL スキーマの表示名]** フィールド、この場合 `Luma Web Event Data`

   >[!TIP]
   >
   >XDM スキーマの一般的な命名規則は、データのソースに続いてスキーマに名前を付けることです。


1. 完了を選択

   ![スキーマエクスペリエンスイベント終了](assets/schema-name-schema.png)

## フィールドグループを追加

前述したように、XDM は、ダウンストリームAdobe Experience Platformサービスで使用する共通の構造と定義を提供することで、顧客体験データを標準化する中核的なフレームワークです。 XDM 標準に準拠することで、 _すべての顧客体験データ_ は、共通の表現に組み込むことができます。 このアプローチを使用すると、顧客の行動から有益なインサイトを得たり、セグメントを通じて顧客のオーディエンスを定義したり、複数のソースのデータを使用してパーソナライズ機能を目的として顧客属性を表したりできます。 詳しくは、 [データモデリングのベストプラクティス](https://experienceleague.adobe.com/docs/experience-platform/xdm/schema/best-practices.html?lang=en) を参照してください。

可能な場合は、既存のフィールドグループを使用し、製品に依存しないモデルや命名規則に従うことをお勧めします。 上記の定義済みフィールドグループに適合しない組織に固有のデータの場合、カスタムフィールドグループを作成できます。 詳しくは、 [スキーマエディターを使用したスキーマの作成](https://experienceleague.adobe.com/docs/experience-platform/xdm/tutorials/create-schema-ui.html?lang=en#create) を参照してください。

>[!TIP]
> 
>この演習では、Web データ収集用に推奨される事前定義済みフィールドグループを追加します。 _**[!UICONTROL AEP Web SDK ExperienceEvent]**_ および _**[!UICONTROL 消費者エクスペリエンスイベント]**_.
>
>
> を実装する場合 **Adobe Analytics** （Web SDK を使用し、にデータを送信しない場合） **Experience Platform**&#x200B;を使用する場合は、 [!UICONTROL Adobe Analytics ExperienceEvent テンプレート] フィールドグループを使用して XDM スキーマを定義します。 これは、 [Analytics を設定](setup-analytics.md) レッスン。

1. Adobe Analytics の **[!UICONTROL フィールドグループ]** セクション、選択 **[!UICONTROL 追加]**

   ![新しいフィールドグループ](assets/schema-new-field-group.png)

1. [!UICONTROL `AEP Web SDK ExperienceEvent`] を検索します
1. 「 」ボックスをオンにします。
1. [!UICONTROL `Consumer Experience Event`] を検索します
1. 「 」ボックスをオンにします。
1. 選択 **[!UICONTROL フィールドグループを追加]**

   ![フィールドグループを追加](assets/schema-add-field-group.jpg)

両方のフィールドグループを使用する場合、Web でのデータ収集に必要な、最も一般的に使用されるキーと値のペアにアクセスできることに注意してください。 The [!UICONTROL 表示名] の各フィールドは、Platform ベースのアプリケーションのセグメントビルダーインターフェイスでマーケターに表示され、必要に応じて標準フィールドの表示名を変更できます。 また、不要なフィールドを削除することもできます。 いずれかのフィールドグループ名をクリックすると、そのグループが属するキーと値のペアのグループがインターフェイスで強調表示されます。 次の例では、どのグループが属しているかを確認します。 **[!UICONTROL 消費者エクスペリエンスイベント]**.

![スキーマフィールドグループ](assets/schema-consumer-experience-event.png)

このレッスンは出発点にすぎません。 独自の Web イベントスキーマを作成する場合は、ビジネス要件を確認し、文書化する必要があります。 このプロセスは、 [ビジネス要件ドキュメント](https://experienceleague.adobe.com/docs/analytics-learn/tutorials/implementation/implementation-basics/creating-a-business-requirements-document.html?lang=ja) および [ソリューションデザインリファレンス](https://experienceleague.adobe.com/docs/analytics-learn/tutorials/implementation/implementation-basics/creating-and-maintaining-an-sdr.html?lang=ja) (Adobe Analytics実装の場合 )。ただし、には _すべてのダウンストリームデータ受信者_ （プラットフォーム、ターゲット、イベントの転送先など）。


### identityMap オブジェクト

Web ユーザーを識別するために使用される、 `[!UICONTROL identityMap]`.

![Luma Web イベントデータ](assets/schema-identityMap.png)

Web 上のユーザーを識別するために必要なExperience CloudID を格納するので、Web 関連のデータ収集には必須のオブジェクトです。 また、認証済みユーザーの内部顧客 ID を設定するためのキーにもなります。 `[!UICONTROL identityMap]` 詳しくは、 [ID の設定](configure-identities.md) レッスン。 これは、 **[!UICONTROL XDM ExperienceEvent]** クラス。


>[!IMPORTANT]
>
> 有効にすることができます。 **[!UICONTROL プロファイル]** スキーマを保存する前に、スキーマのを設定します。 **禁止** この時点で有効にします。 プロファイルに対してスキーマを有効にすると、無効にしたり削除したりすることはできません。 この時点では、フィールドをスキーマから削除することはできませんが、次の操作は可能です。 [UI でのフィールドの廃止](https://experienceleague.adobe.com/docs/experience-platform/xdm/tutorials/field-deprecation-ui.html?lang=en#deprecate). 実稼動環境で独自のデータを使用する際には、後で注意する必要があります。
>
>
>この設定については、 [設定Experience Platform](setup-experience-platform.md) レッスン。
>![プロファイルスキーマ](assets/schema-profile.png)

このレッスンを完了するには、「 」を選択します。 **[!UICONTROL 保存]** を右上に表示します。

![スキーマを保存](assets/schema-select-save.png)


これで、タグプロパティに Web SDK 拡張機能を追加すると、このスキーマを参照できます。


[次へ： ](configure-identities.md)

>[!NOTE]
>
>Adobe Experience Platform Web SDK の学習に時間を割いていただき、ありがとうございます。 ご質問がある場合、一般的なフィードバックを共有したい場合、または今後のコンテンツに関する提案がある場合は、こちらで共有してください [Experience Leagueコミュニティディスカッション投稿](https://experienceleaguecommunities.adobe.com/t5/adobe-experience-platform-launch/tutorial-discussion-implement-adobe-experience-cloud-with-web/td-p/444996)
