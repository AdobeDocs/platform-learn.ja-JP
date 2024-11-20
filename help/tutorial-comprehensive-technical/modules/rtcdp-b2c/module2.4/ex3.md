---
title: Microsoft Azure Event Hub へのセグメントのアクティベーション – ストリーミングセグメントの作成
description: Microsoft Azure Event Hub へのセグメントのアクティベーション – ストリーミングセグメントの作成
kt: 5342
doc-type: tutorial
exl-id: 86bc3afa-16a9-4834-9119-ce02445cd524
source-git-commit: acb941e4ee668248ae0767bb9f4f42e067c181ba
workflow-type: tm+mt
source-wordcount: '344'
ht-degree: 2%

---

# 2.4.3 セグメントの作成

## 2.4.3.1 概要

シンプルなセグメントを作成します。

- **機器への関心** Luma デモ web サイトの **機器** ページにアクセスした顧客プロファイルが対象となります。

### 知っておいて良い

Real-time CDP は、宛先のアクティベーションリストの一部であるセグメントにユーザーが適合すると、宛先に対するアクティベーションをトリガーします。 その場合、その宛先に送信されるセグメントの選定ペイロードには **プロファイルが選定されるすべてのセグメント** が含まれます。

このモジュールの目的は、顧客プロファイルのセグメントの選定が **ユーザーの** イベントハブ宛先にリアルタイムで送信されることを示すことです。

### セグメントステータス

Adobe Experience Platformでのセグメントの選定には、常に **status** プロパティがあり、次のいずれかになります。

- **実現済み**：新しいセグメントの選定を示します
- **既存**：既存のセグメントの選定を示します
- **離脱**：プロファイルがセグメントに適合しなくなったことを示します

## 2.4.3.2 セグメントの作成

セグメントの構築について詳しくは、[ モジュール 2.3](./../../../modules/rtcdp-b2c/module2.3/real-time-cdp-build-a-segment-take-action.md) を参照してください。

### セグメントを作成

URL:[https://experience.adobe.com/platform](https://experience.adobe.com/platform) に移動して、Adobe Experience Platformにログインします。

ログインすると、Adobe Experience Platformのホームページが表示されます。

![データ取得](./../../../modules/datacollection/module1.2/images/home.png)

続行する前に、**サンドボックス** を選択する必要があります。 選択するサンドボックスの名前は ``--aepSandboxName--`` です。 適切なサンドボックスを選択すると、画面が変更され、専用のサンドボックスが表示されます。

![データ取得](./../../../modules/datacollection/module1.2/images/sb1.png)

**セグメント** に移動します。 **+ セグメントを作成** ボタンをクリックします。

![データ取得](./images/seg.png)

セグメント `--aepUserLdap-- - Interest in Equipment` に名前を付け、ページ名エクスペリエンスイベントを追加します。

**イベント** をクリックし、**XDM ExperienceEvent/Web/Web ページの詳細/名前** をドラッグ&amp;ドロップします。 値として **equipment** と入力します。

![4-05-create-ee-2.png](./images/4-05-create-ee-2.png)

**XDM ExperienceEvent/`--aepTenantId--`/demoEnvironment/brandName** をドラッグ&amp;ドロップします。 値として `--aepUserLdap--` と入力し、比較パラメーターを **次を含む** に設定して、「**保存**」をクリックします。

![4-05-create-ee-2-brand.png](./images/4-05-create-ee-2-brand.png)

### PQL定義

セグメントのPQLは次のようになります。

```code
CHAIN(xEvent, timestamp, [C0: WHAT(web.webPageDetails.name.equals("equipment", false) and _experienceplatform.demoEnvironment.brandName.contains("--aepUserLdap--", false))])
```

次の手順：[2.4.4 セグメントをアクティブ化 ](./ex4.md)

[モジュール 2.4 に戻る](./segment-activation-microsoft-azure-eventhub.md)

[すべてのモジュールに戻る](./../../../overview.md)
