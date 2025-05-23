---
title: 基盤 – Adobe Experience Platform Data Collection と Web SDK拡張機能の設定 – Adobe AnalyticsとAdobe Audience Managerの実装
description: 基盤 – Adobe Experience Platform Data Collection と Web SDK拡張機能の設定 – Adobe AnalyticsとAdobe Audience Managerの実装
kt: 5342
doc-type: tutorial
exl-id: a9022269-6db2-46c6-a82b-ec8d5b881a55
source-git-commit: 1526661a80b4d551627dfca42a7e97c9498dd1f2
workflow-type: tm+mt
source-wordcount: '525'
ht-degree: 0%

---

# 1.1.5 Adobe AnalyticsとAdobe Audience Managerの実装

## コンテキスト

XDM データが platform に送信されていることがわかります。 [ モジュール 1.2](./../module1.2/data-ingestion.md) の XDM と、カスタム変数を追跡する独自のスキーマの作成方法について詳しく説明します。 ここでは、データを Analytics とAudience Managerに転送するようにデータストリームを設定した場合の動作について説明します。

## Analytics での変数のマッピング

Adobe Experience Platform [!DNL Web SDK] は、特定の値を自動的にマッピングし、Web SDKを使用して Analytics の新しい実装をできる限り迅速に行います。 自動的にマッピングされた変数が [ ここ ](https://experienceleague.adobe.com/docs/experience-platform/edge/data-collection/adobe-analytics/automatically-mapped-vars.html?lang=ja#data-collection) に一覧表示されます。

Adobe Analyticsに自動的にマッピングされない XDM データの場合は、[context data](https://experienceleague.adobe.com/docs/analytics/implementation/vars/page-vars/contextdata.html?lang=ja) を使用して [schema](https://experienceleague.adobe.com/docs/experience-platform/xdm/schema/composition.html?lang=ja) に一致させることができます。 その後、[ 処理ルール ](https://experienceleague.adobe.com/docs/analytics/admin/admin-tools/processing-rules/processing-rules-configuration/t-processing-rules.html?lang=ja) を使用して Analytics にマッピングし、Analytics 変数を設定できます。 コンテキストデータと処理ルールは、以前に Analytics を使用したことがある概念ですが、新しい概念である場合は、詳細について心配する必要はありません。

また、デフォルトのアクションと商品リストのセットを使用して、AEP Web SDKでデータを送信または取得することもできます。 詳細については、[ 製品 ](https://experienceleague.adobe.com/docs/experience-platform/edge/data-collection/collect-commerce-data.html?lang=ja#data-collection) を参照してください。

### コンテキストデータ

Analytics で使用するために、XDM データはドット表記を使用してフラット化され、`contextData` として使用できるようになります。 次の値のペアのリストは、`context data` の例を示しています。

```javascript
{
    "bh": "900",
    "bw": "1680",
    "c": "24",
    "c.a.d.key.[0]": "value1",
    "c.a.d.key.[1]": "value2",
    "c.a.d.object.key1": "value1",
    "c.a.d.object.key2.[0]": "value2",
    "c.a.x.environment.browserdetails.javascriptenabled": "true",
    "c.a.x.environment.type": "browser",
    "cust_hit_time_gmt": "1579781427",
    "g": "http://example.com/home",
    "gn": "home",
    "j": "1.8.5",
    "k": "Y",
    "s": "1680x1050",
    "tnta": "218287:1:0|0,218287:1:0|2,218287:1:0|1,218287:1:0|32767,218287:1:01,218287:1:0|0,218287:1:0|1,218287:1:0|0,218287:1:0|1",
    "user_agent": "Mozilla/5.0 AppleWebKit/537.36 Safari/537.36",
    "v": "Y"
}
```

### 処理ルール

Edge Network で収集されたすべてのデータには、[ 処理ルール ](https://experienceleague.adobe.com/docs/analytics/admin/admin-tools/processing-rules/processing-rules-configuration/t-processing-rules.html?lang=ja) 経由でアクセスできます。 Analytics では、処理ルールを使用してコンテキストデータを Analytics 変数に組み込むことができます。

## Experience PlatformEdge NetworkのAudience Manager

サーバーサイド転送は、Audience Managerに関する新しい概念ではなく、以前と同じプロセスが適用されます。 ID を同期することもできます。

## データストリームを確認し、Adobe Analyticsにデータを送信する

Web SDKで収集したデータをAdobe AnalyticsとAdobe Audience Managerに送信する場合は、次の手順に従います。

[https://experience.adobe.com/launch/](https://experience.adobe.com/launch/) に移動し、**データストリーム** に移動します。

画面の右上隅にあるサンドボックス名を選択します（`--aepSandboxName--` にする必要があります）。 特定のデータストリーム（`--aepUserLdap-- - Demo System Datastream` という名前）を開きます。

![ 左側のナビゲーションで「Edge設定」アイコンをクリック ](./images/edgeconfig1b.png)

その後、これが表示されます。 Adobe Analyticsを有効にするには、「**サービスを追加**」をクリックします。

![AEP デバッガー ](./images/aa2.png)

その後、これが表示されます。 サービス **Adobe Analytics** を選択した後、データをに送信するには、Adobe Analyticsでレポートスイートを追加する必要があります。 このチュートリアルでは、範囲外です。 **キャンセル** をクリックします。

![AEP デバッガー ](./images/aa3.png)

## データストリームを確認し、Adobe Audience Managerにデータを送信する

その後、これが表示されます。 Adobe Audience Managerを有効にするには、「**サービスを追加**」をクリックします。

![AEP デバッガー ](./images/aa2.png)

その後、これが表示されます。 サービス **Adobe Audience Manager** を選択すると、Adobe Audience Manager cookie の宛先や URL の宛先を有効または無効にすることができます。 このチュートリアルでは、この設定は範囲外です。 **キャンセル** をクリックします。

![AEP デバッガー ](./images/aam1.png)

次の手順：[1.1.6 Adobe Targetの実装 ](./ex6.md)

[モジュール 1.1 に戻る](./data-ingestion-launch-web-sdk.md)

[すべてのモジュールに戻る](./../../../overview.md)
