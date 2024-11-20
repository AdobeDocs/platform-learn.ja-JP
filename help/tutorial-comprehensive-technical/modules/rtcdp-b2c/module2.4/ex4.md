---
title: Microsoft Azure Event Hub へのAudience Activation- オーディエンスの作成
description: Microsoft Azure Event Hub へのAudience Activation- オーディエンスの作成
kt: 5342
doc-type: tutorial
exl-id: 56f6a6dc-82aa-4b64-a3f6-b6f59c484ccb
source-git-commit: 216914c9d97827afaef90e21ed7d4f35eaef0cd3
workflow-type: tm+mt
source-wordcount: '338'
ht-degree: 2%

---

# 2.4.4 オーディエンスの作成

## はじめに

シンプルなオーディエンスを作成します。

- **CitiSignal デモ Web サイトの** プラン **ページを訪問した顧客が対象となる** プランへの関心。

### 知っておいて良い

Real-time CDP は、宛先のアクティベーションリストの一部であるオーディエンスに適合すると、宛先に対するアクティベーションをトリガーします。 その場合、その宛先に送信されるオーディエンスの選定ペイロードには **顧客プロファイルが選定されるすべてのオーディエンス** が含まれます。

このモジュールの目的は、顧客プロファイルのオーディエンスの選定がイベントハブの宛先にほぼリアルタイムで送信されることを示すことです。

### オーディエンスステータス

Adobe Experience Platformでのオーディエンスの選定には、常に **status** プロパティがあり、次のいずれかになります。

- **実現済み**：新しいオーディエンスの選定を示します
- **離脱**：プロファイルがオーディエンスに適合しなくなったことを示します

## オーディエンスの構築

URL:[https://experience.adobe.com/platform](https://experience.adobe.com/platform) に移動して、Adobe Experience Platformにログインします。

ログインすると、Adobe Experience Platformのホームページが表示されます。

![データ取得](./../../../modules/datacollection/module1.2/images/home.png)

続行する前に、**サンドボックス** を選択する必要があります。 選択するサンドボックスの名前は ``--aepSandboxName--`` です。 適切なサンドボックスを選択すると、画面が変更され、専用のサンドボックスが表示されます。

![データ取得](./../../../modules/datacollection/module1.2/images/sb1.png)

**オーディエンス** に移動します。 **+ オーディエンスを作成** ボタンをクリックします。

![データ取得](./images/seg.png)

「**ルールを作成**」を選択し、「**作成**」をクリックします。

![データ取得](./images/seg1.png)

オーディエンス `--aepUserLdap-- - Interest in Plans` に名前を付け、評価方法を **Edgeに設定し** エクスペリエンスイベントからページ名を追加します。

**イベント** をクリックし、**XDM ExperienceEvent/Web/Web ページの詳細/名前** をドラッグ&amp;ドロップします。 値として **plans** を入力します。

![4-05-create-ee-2.png](./images/405createee2.png)

**XDM ExperienceEvent/`--aepTenantId--`/demoEnvironment/brandName** をドラッグ&amp;ドロップします。 値として `--aepUserLdap--` を入力し、比較パラメーターを **contains** に設定して、**Publish** をクリックします。

![4-05-create-ee-2-brand.png](./images/405createee2brand.png)

オーディエンスが公開されました。

![4-05-create-ee-2-brand.png](./images/405createee2brand1.png)

次の手順：[2.4.5 オーディエンスをアクティベートする ](./ex5.md)

[モジュール 2.4 に戻る](./segment-activation-microsoft-azure-eventhub.md)

[すべてのモジュールに戻る](./../../../overview.md)
