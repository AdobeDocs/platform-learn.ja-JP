---
title: Web データ用の XDM スキーマの作成
description: データ収集インターフェイスで web データの XDM スキーマを作成する方法を説明します。 このレッスンは、Web SDK を使用したAdobe Experience Cloudの実装チュートリアルの一部です。
feature: Web SDK,Schemas
exl-id: 159f914a-43d4-4808-b6af-01136386e25c
source-git-commit: fe8b92c560c9676a44935005cc558388244d6aea
workflow-type: tm+mt
source-wordcount: '1493'
ht-degree: 1%

---

# Web データ用の XDM スキーマの作成

データ収集インターフェイスで web データの XDM スキーマを作成する方法を説明します。

エクスペリエンスデータモデル（XDM）スキーマは、Adobe Experience Platformでデータを収集するための構成要素、原則およびベストプラクティスです。

Platform Web SDK は、スキーマを使用して web イベントデータを標準化し、Platform Edge Networkに送信し、最終的にデータストリームで設定されたExperience Cloudアプリケーションにデータを転送します。 この手順は、カスタマーエクスペリエンスデータをExperience Platformに取り込むために必要な標準データモデルを定義し、これらの標準に基づいて構築されたダウンストリームのサービスとアプリケーションを可能にするので、重要です。

## データをモデル化する理由

企業には、ドメインについてコミュニケーションを行うための独自の言語があります。 自動車の販売店はメーカー、モデル、シリンダーを扱っています。 航空会社は便名、サービス区分、座席割り当てを扱っています。 これらの用語には、特定の会社に固有のものや、業界別で共有されているものや、ほとんどすべての企業で共有されているものがあります。 業界横断的な用語や、より広範な用語を共有する用語の場合、共通の方法で用語に名前を付けて構造化することで、データを活用して強力な処理を開始できます。

例えば、多くの企業が注文を扱っています。 これらの企業が同様の方法で注文をモデル化すると判断した場合はどうなりますか？ 例えば、データモデルが、で構成されたオブジェクトで構成されている場合 `priceTotal` 注文の合計金額を表すプロパティ？ そのオブジェクトにという名前のプロパティも含まれている場合 `currencyCode` および `purchaseOrderNumber`? order オブジェクトにという名前のプロパティが含まれている場合があります。 `payments` これは、支払いオブジェクトの配列になります。 各オブジェクトは、注文の支払いを表します。 例えば、顧客が注文の一部をギフトカードで支払い、残りをクレジットカードで支払った場合を考えてみましょう。 次のようなモデルの作成を開始できます。

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

注文を扱うすべての企業が、業界で一般的な用語について一貫した方法で注文データをモデル化することを決定した場合、不思議なことが起こり始める可能性があります。 データ（prop や evar、誰でも）を絶えず解釈したり翻訳したりしなくても、組織内や組織外でより流動的に情報を交換できます。 機械学習を使用すると、データの内容をより簡単に理解できます _手段_ 実用的なインサイトを提供します。 関連するデータを表示するためのユーザーインターフェイスが、より直感的になる可能性があります。 データは、同じモデリングに従っているパートナーやベンダーとシームレスに統合できます。

これがAdobeの目標です [エクスペリエンスデータモデル](https://business.adobe.com/products/experience-platform/experience-data-model.html). XDM は、業界で一般的なデータの規範的なモデリングを提供すると同時に、特定のニーズに合わせてモデルを拡張することもできます。 Adobe Experience Platformは XDM を中心に構築されているので、Experience Platformに送信されるデータは XDM 内にある必要があります。 データを翻訳に送信する前に、現在のデータモデルを XDM に変換する場所と方法を考えるのではなく、Experience Platformが必要とすることがほとんどないよう、組織全体で XDM を採用することを検討してください。


>[!NOTE]
>
> デモ目的で、このレッスンの演習では、で顧客が表示したコンテンツと購入した製品をキャプチャするサンプルスキーマを作成します。 [Luma デモサイト](https://luma.enablementadobe.com/content/luma/us/en.html). これらの手順を使用して、異なるスキーマを独自の用途で作成できますが、まずは、サンプルスキーマの作成方法を追ってスキーマエディターの機能を理解することをお勧めします。

XDM スキーマについて詳しくは、コースを参照してください [XDM を使用したカスタマーエクスペリエンスデータのモデル化](https://experienceleague.adobe.com/?recommended=ExperiencePlatform-D-1-2021.1.xdm&amp;lang=ja) または、を参照してください。 [XDM システムの概要](https://experienceleague.adobe.com/docs/experience-platform/xdm/home.html?lang=ja).

## 学習目標

このレッスンを最後まで学習すると、以下の内容を習得できます。

* データ収集インターフェイス内から XDM スキーマを作成します
* XDM スキーマへのフィールドグループの追加
* ベストプラクティスを使用した web イベントデータの XDM スキーマの作成

## 前提条件

データ収集とAdobe Experience Platformに必要なすべてのプロビジョニングとユーザー権限については、を参照してください。 [の概要](overview.md) ページ。

## XDM スキーマの作成

XDM スキーマはExperience Platformでデータを記述する標準的な方法であり、スキーマに適合するすべてのデータを組織間で競合なく再利用したり、複数の組織間で共有したりできます。 詳しくは、 [スキーマ構成の基本](https://experienceleague.adobe.com/docs/experience-platform/xdm/schema/composition.html?lang=ja).

この演習では、で web イベントデータをキャプチャするための推奨ベースラインフィールドグループを使用して、XDM スキーマを作成します [Luma デモサイト](https://luma.enablementadobe.com/content/luma/us/en.html){target="_blank"}:

1. を開きます [データ収集インターフェイス](https://launch.adobe.com/){target="_blank"}
1. 正しいサンドボックスにいることを確認します。 右上隅にあるサンドボックスを見つけます

   >[!NOTE]
   >
   >Real-Time CDPやJourney Optimizerなどの Platform ベースのアプリケーションを使用している場合は、このチュートリアルで開発用サンドボックスを使用することをお勧めします。 そうでない場合は、 **[!UICONTROL Prod]** サンドボックス。

1. に移動 **[!UICONTROL スキーマ]** 左側のナビゲーションで
1. 「」を選択します **[!UICONTROL スキーマを作成]** 右上のボタン

   ![スキーマを作成](assets/schema-xdm-create-schema.png)
1. を選択 **[!UICONTROL エクスペリエンスイベント]** 次の画面で、
1. を選択 **[!UICONTROL 次]**

   ![スキーマエクスペリエンスイベント](assets/schema-experience-event.png)

1. の下にスキーマの名前を入力 **[!UICONTROL スキーマの表示名]** フィールド（この場合は） `Luma Web Event Data`

   >[!TIP]
   >
   >XDM スキーマの一般的な命名規則は、データのソースの後にスキーマを命名することです。


1. 「終了」を選択します

   ![スキーマエクスペリエンスイベント検索](assets/schema-name-schema.png)

## フィールドグループの追加

前述したように、XDM は、ダウンストリーム Adobe Experience Platform サービスで使用する共通の構造と定義を提供することで、顧客体験データを標準化するコアフレームワークです。 XDM 標準に準拠することにより、 _すべての顧客体験データ_ 共通の表現に組み込むことができます。 このアプローチにより、顧客の行動から有益なインサイトを得たり、セグメントを通じて顧客オーディエンスを定義したり、複数のソースのデータを使用してパーソナライゼーション目的で顧客属性を表現したりできます。 参照： [データモデリングのベストプラクティス](https://experienceleague.adobe.com/docs/experience-platform/xdm/schema/best-practices.html?lang=en) を参照してください。

可能であれば、既存のフィールドグループを使用し、製品に依存しないモデルと命名規則に従うことをお勧めします。 上記の事前定義済みのフィールドグループに適合しない、組織に固有の任意のデータの場合は、カスタムフィールドグループを作成できます。 参照： [スキーマエディターを使用したスキーマの作成](https://experienceleague.adobe.com/docs/experience-platform/xdm/tutorials/create-schema-ui.html?lang=en#create) カスタムスキーマの詳細な手順については、を参照してください。

>[!TIP]
> 
>この演習では、web データ収集に推奨される事前定義済みのフィールドグループを追加します。 _**[!UICONTROL AEP Web SDK ExperienceEvent]**_ および _**[!UICONTROL 消費者エクスペリエンスイベント]**_.
>
>
> 実装のみを行う場合 **Adobe Analytics** Web SDK を使用し、にデータを送信しない **Experience Platform**、を使用します [!UICONTROL Adobe Analytics ExperienceEvent テンプレート] xdm スキーマを定義するためのフィールドグループ。 これは、 [Analytics のセットアップ](setup-analytics.md) レッスン：

1. が含まれる **[!UICONTROL フィールドグループ]** セクションで選択 **[!UICONTROL 追加]**

   ![新規フィールドグループ](assets/schema-new-field-group.png)

1. [!UICONTROL `AEP Web SDK ExperienceEvent`] を検索します
1. チェックボックスをオンにする
1. [!UICONTROL `Consumer Experience Event`] を検索します
1. チェックボックスをオンにする
1. を選択 **[!UICONTROL フィールドグループの追加]**

   ![フィールドグループを追加](assets/schema-add-field-group.png)

両方のフィールドグループを使用すると、web 上のデータ収集に必要な最も一般的に使用されるキーと値のペアにアクセスできます。 この [!UICONTROL 表示名] の各フィールドは、Platform ベースのアプリケーションのセグメントビルダーインターフェイスでマーケターに表示され、標準フィールドの表示名を必要に応じて変更できます。 また、不要なフィールドを削除することもできます。 いずれかのフィールドグループ名をクリックすると、それに属するキーと値のペアのグループがインターフェイスで強調表示されます。 以下の例では、どのグループが属しているのかがわかります **[!UICONTROL 消費者エクスペリエンスイベント]**.

![スキーマフィールドグループ](assets/schema-consumer-experience-event.png)

このレッスンは、出発点にすぎません。 独自の web イベントスキーマを作成する場合は、ビジネス要件を調査し、文書化する必要があります。 このプロセスは、を作成する場合と似ています。 [ビジネス要件に関するドキュメント](https://experienceleague.adobe.com/docs/analytics-learn/tutorials/implementation/implementation-basics/creating-a-business-requirements-document.html?lang=ja) および [ソリューションデザインリファレンス](https://experienceleague.adobe.com/docs/analytics-learn/tutorials/implementation/implementation-basics/creating-and-maintaining-an-sdr.html?lang=ja) Adobe Analyticsを実装する場合、の要件を含める必要があります。 _すべてのダウンストリームデータ受信者_ 例えば、Platform、Target、イベント転送の宛先などです。


### identityMap オブジェクト

という Web ユーザーの識別に使用する特別なフィールドがあります。 `[!UICONTROL identityMap]`.

![Luma Web イベントデータ](assets/schema-identityMap.png)

これは、web 上のユーザーを識別するために必要なExperience Cloud ID を格納するので、web 関連のデータ収集の必須オブジェクトです。 また、認証済みユーザーに対して内部顧客 ID を設定する際にも重要です。 `[!UICONTROL identityMap]` 詳しくは、以下で説明します [Id の設定](configure-identities.md) レッスン： を使用するすべてのスキーマに自動的に含まれます **[!UICONTROL XDM ExperienceEvent]** クラス。


>[!IMPORTANT]
>
> を有効にすることができます **[!UICONTROL Profile]** （スキーマを保存する前のスキーマ）。 **実行しない** この時点で有効にします。 プロファイルに対してスキーマを有効にすると、そのスキーマを無効にしたり削除したりできなくなります。 この時点では、フィールドをスキーマから削除することもできませんが、削除することは可能です [UI でのフィールドの非推奨化](https://experienceleague.adobe.com/docs/experience-platform/xdm/tutorials/field-deprecation-ui.html?lang=en#deprecate). これらの影響は、実稼動環境で独自のデータを操作する際に後で留意することが重要です。
>
>
>この設定については、 [Experience Platformを設定](setup-experience-platform.md) レッスン：
>![プロファイルスキーマ](assets/schema-profile.png)

このレッスンを完了するには、 **[!UICONTROL 保存]** 右上。

![スキーマを保存](assets/schema-select-save.png)


これで、Web SDK 拡張機能をタグプロパティに追加する際に、このスキーマを参照できるようになります。


[次へ： ](configure-identities.md)

>[!NOTE]
>
>Adobe Experience Platform Web SDK の学習に時間を費やしていただき、ありがとうございます。 ご質問がある場合、一般的なフィードバックを共有したい場合、または将来のコンテンツに関するご提案がある場合は、このページでお知らせください [Experience League コミュニティ ディスカッションの投稿](https://experienceleaguecommunities.adobe.com/t5/adobe-experience-platform-launch/tutorial-discussion-implement-adobe-experience-cloud-with-web/td-p/444996)
