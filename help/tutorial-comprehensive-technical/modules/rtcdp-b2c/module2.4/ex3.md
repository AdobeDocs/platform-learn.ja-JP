---
title: Microsoft Azure Event Hub へのAudience Activation- Adobe Experience Platformでの Event Hub RTCDP 宛先の設定
description: Microsoft Azure Event Hub へのAudience Activation- Adobe Experience Platformでの Event Hub RTCDP 宛先の設定
kt: 5342
doc-type: tutorial
exl-id: 86bc3afa-16a9-4834-9119-ce02445cd524
source-git-commit: 216914c9d97827afaef90e21ed7d4f35eaef0cd3
workflow-type: tm+mt
source-wordcount: '541'
ht-degree: 0%

---

# 2.4.3 Adobe Experience Platformでの Azure Event Hub の宛先の設定

## 必要な Azure 接続パラメーターの特定

Adobe Experience Platformでイベントハブの宛先を設定するには、次が必要です。

- Event Hubs 名前空間
- イベントハブ
- Azure SAS キー名
- Azure SAS キー

Event Hub と EventHub 名前空間は、前の演習 [Azure でのイベントハブのセットアップ &#x200B;](./ex2.md) で定義されています

### Event Hubs 名前空間

Azure Portal で上記の情報を参照するには、[https://portal.azure.com/#home](https://portal.azure.com/#home) に移動します。 正しい Azure アカウントを使用していることを確認します。

Azure portal で **すべてのリソース** をクリックします。

![2-01-azure-all-resources.png](./images/201azureallresources.png)

リストで **Event Hubs 名前空間** を見つけてクリックします。

![2-01-azure-all-resources.png](./images/201azureallresources1.png)

**Event Hubs 名前空間** の名前がはっきりと表示されるようになりました。 `--aepUserLdap---aep-enablement` のようになります。

![2-01-azure-all-resources.png](./images/201azureallresources2.png)

### イベントハブ

**Event Hubs 名前空間** ページで、**エンティティ/Event Hubs** をクリックして、Event Hubs 名前空間で定義されている Event Hubs のリストを取得します。前の演習で使用した命名規則に従うと、`--aepUserLdap---aep-enablement-event-hub` という名前の Event Hub が見つかります。 それをメモしてください、あなたは次の演習でそれを必要とするでしょう。

![2-04-event-hub-selected.png](./images/204eventhubselected.png)

### SAS キー名

**Event Hubs 名前空間** ページで、**設定/共有アクセスポリシー** をクリックします。 共有アクセスポリシーのリストが表示されます。 探している SAS キーは **RootManageSharedAccessKey** で、これは**SAS キー名です。 書き留めておきなさい。

![2-05-select-sas.png](./images/205selectsas.png)

### SAS キー値

次に、**RootManageSharedAccessKey** をクリックして、SAS キー値を取得します。 **クリップボードにコピー** アイコンを押して、**プライマリキー** （この場合は `pqb1jEC0KLazwZzIf2gTHGr75Z+PdkYgv+AEhObbQEY=`）をコピーします。

![2-07-sas-key-value.png](./images/207saskeyvalue.png)

### 宛先値の概要

この時点で、Adobe Experience Platform Real-time CDP で Azure Event Hub の宛先を定義するために必要なすべての値が特定されています。

| 宛先属性名 | 宛先属性値 | 値の例 |
|---|---|---|
| sasKeyName | SAS キー名 | RootManageSharedAccessKey |
| sasKey | SAS キー値 | pqb1jEC0KLazwZzIf2gTHGr75Z+PdkYgv+AEhObbQEY= |
| 名前空間 | Event Hubs 名前空間 | `--aepUserLdap---aep-enablement` |
| eventHubName | イベントハブ | `--aepUserLdap---aep-enablement-event-hub` |

## Adobe Experience Platformでの Azure Event Hub の宛先の作成

URL:[https://experience.adobe.com/platform](https://experience.adobe.com/platform) に移動して、Adobe Experience Platformにログインします。

ログインすると、Adobe Experience Platformのホームページが表示されます。

![データ取得](./../../../modules/datacollection/module1.2/images/home.png)

続行する前に、**サンドボックス** を選択する必要があります。 選択するサンドボックスの名前は ``--aepSandboxName--`` です。 適切なサンドボックスを選択すると、画面が変更され、専用のサンドボックスが表示されます。

![データ取得](./../../../modules/datacollection/module1.2/images/sb1.png)

**宛先** に移動し、**カタログ** に移動します。 **クラウドストレージ** を選択し、**Azure Event Hubs** に移動して **設定** をクリックします。

![2-08-list-destinations.png](./images/208listdestinations.png)

**標準認証** を選択します。 前の演習で収集した接続の詳細を入力します。 次に、「**宛先に接続**」をクリックします。

![2-09-destination-values.png](./images/209destinationvalues.png)

資格情報が正しければ、「**接続済み** という確認が表示されます。

![2-09-destination-values.png](./images/209destinationvaluesa.png)

ここで、書式 `--aepUserLdap---aep-enablement` に名前と説明を入力する必要があります。 **eventHubName** を入力し（前の演習を参照：`--aepUserLdap---aep-enablement-event-hub`）、「**次へ**」をクリックします。

![2-10-create-destination.png](./images/210createdestination.png)

オプションで、データガバナンスポリシーを選択できます。 **保存して終了** をクリックします。

![2-11-save-exit-activation.png](./images/211saveexitactivation.png)

これで、宛先が作成され、Adobe Experience Platformで使用できるようになりました。

![2-12-destination-created.png](./images/212destinationcreated.png)

次の手順：[2.4.4 オーディエンスの作成 &#x200B;](./ex4.md)

[モジュール 2.4 に戻る](./segment-activation-microsoft-azure-eventhub.md)

[すべてのモジュールに戻る](./../../../overview.md)
