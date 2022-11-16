---
title: Microsoft Azure Event Hub に対するセグメントのアクティベーション — ストリーミングセグメントの作成
description: Microsoft Azure Event Hub に対するセグメントのアクティベーション — ストリーミングセグメントの作成
kt: 5342
audience: Data Engineer, Data Architect, Data Analyst
doc-type: tutorial
activity: develop
exl-id: de3824bd-553c-4281-8edf-29abcc28a8e7
source-git-commit: cc7a77c4dd380ae1bc23dc75608e8e2224dfe78c
workflow-type: tm+mt
source-wordcount: '357'
ht-degree: 2%

---

# 13.3 セグメントの作成

## 13.3.1 はじめに

単純なセグメントを作成します。

- **機器への関心** 訪問時に顧客プロファイルが適合する対象 **設備** Luma デモ Web サイトのページ。

### 知っておくと良い

リアルタイム CDP は、その宛先のアクティベーションリストに含まれるセグメントに適合する場合、その宛先へのアクティベーションをトリガーします。 その場合、その宛先に送信されるセグメント認定ペイロードにはが含まれます **プロファイルが適合するすべてのセグメント**.

このモジュールの目的は、顧客プロファイルのセグメント認定が **あなたの** イベントハブの宛先をリアルタイムで指定できます。

### セグメントステータス

Adobe Experience Platformのセグメント認定には、常に **ステータス**-property とは、次のいずれかを指定します。

- **実現**:これは、新しいセグメントの選定を示します
- **既存**:これは、既存のセグメントの選定を示します
- **終了**:これは、プロファイルがセグメントの対象でなくなったことを示しています

## 13.3.2 セグメントの作成

セグメントの作成について詳しくは、 [モジュール 6](../module6/real-time-cdp-build-a-segment-take-action.md).

### セグメントを作成

次の URL に移動して、Adobe Experience Platformにログインします。 [https://experience.adobe.com/platform](https://experience.adobe.com/platform).

ログイン後、Adobe Experience Platformのホームページに移動します。

![データ取得](../module2/images/home.png)

続行する前に、 **サンドボックス**. 選択するサンドボックスの名前はです ``--aepSandboxId--``. これを行うには、 **[!UICONTROL 実稼動版]** 画面の上の青い線で表示されます。 適切なサンドボックスを選択すると、画面が変更され、専用のサンドボックスに移動します。

![データ取得](../module2/images/sb1.png)

に移動します。 **セグメント**. 次をクリック： **+セグメントを作成** 」ボタンをクリックします。

![データ取得](./images/seg.png)

セグメントに名前を付ける `--demoProfileLdap-- - Interest in Equipment` ページ名エクスペリエンスイベントを追加します。

クリック **イベント**、ドラッグ&amp;ドロップ **XDM ExperienceEvent / Web / Web ページの詳細/名前**. 入力 **設備** 値は次のとおりです。

![4-05-create-ee-2.png](./images/4-05-create-ee-2.png)

ドラッグ&amp;ドロップ **XDM ExperienceEvent > `--aepTenantIdSchema--` / demoEnvironment / brandName**. 入力 `--demoProfileLdap--` の値として、比較パラメーターをに設定します。 **次を含む** をクリックし、 **保存**:

![4-05-create-ee-2-brand.png](./images/4-05-create-ee-2-brand.png)

### PQL 定義

セグメントの PQL は次のようになります。

```code
CHAIN(xEvent, timestamp, [C0: WHAT(web.webPageDetails.name.equals("equipment", false) and _experienceplatform.demoEnvironment.brandName.contains("--demoProfileLdap--", false))])
```

次のステップ： [13.4 セグメントのアクティブ化](./ex4.md)

[モジュール 13 に戻る](./segment-activation-microsoft-azure-eventhub.md)

[すべてのモジュールに戻る](./../../overview.md)
