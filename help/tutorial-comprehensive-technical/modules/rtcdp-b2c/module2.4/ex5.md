---
title: Microsoft Azure Event Hub へのAudience Activation- オーディエンスのアクティブ化
description: Microsoft Azure Event Hub へのAudience Activation- オーディエンスのアクティブ化
kt: 5342
doc-type: tutorial
exl-id: 89cfda0e-6c5e-45ab-9506-f0f0f6211e7f
source-git-commit: 216914c9d97827afaef90e21ed7d4f35eaef0cd3
workflow-type: tm+mt
source-wordcount: '216'
ht-degree: 4%

---

# 2.4.5 オーディエンスのアクティブ化

## Azure Event Hub の宛先へのオーディエンスの追加

この演習では、オーディエンス `--aepUserLdap-- - Interest in Equipment` を `--aepUserLdap---aep-enablement` Azure Event Hub の宛先に追加します。

URL:[https://experience.adobe.com/platform](https://experience.adobe.com/platform) に移動して、Adobe Experience Platformにログインします。

ログインすると、Adobe Experience Platformのホームページが表示されます。

![データ取得](./../../../modules/datacollection/module1.2/images/home.png)

続行する前に、**サンドボックス** を選択する必要があります。 選択するサンドボックスの名前は ``--aepSandboxName--`` です。 適切なサンドボックスを選択すると、画面が変更され、専用のサンドボックスが表示されます。

![データ取得](./../../../modules/datacollection/module1.2/images/sb1.png)

**宛先** に移動し、「参照 **をクリック** ます。 使用可能なすべての宛先が表示されます。 宛先を見つけて、以下に示す 3 つのドット**...**をクリックし、「**オーディエンスをアクティブ化**」をクリックします。

![5-01-select-destination.png](./images/501selectdestination.png)

その後、これが表示されます。 LDAP を使用してオーディエンスを検索し、オーディエンスのリストから `--aepUserLdap-- - Interest in Plans` を選択します。

「**次へ**」をクリックします。

![5-04-select-segment.png](./images/504selectsegment.png)

「**新しいフィールドを追加**」をクリックし、「スキーマを参照」をクリックして、フィールド `--aepTenantId--identification.core.ecid` を選択します（自動的に表示されるその他のフィールドがあれば削除します）。

「**次へ**」をクリックします。

![5-05-select-attributes.png](./images/505selectattributes.png)

「**完了**」をクリックします。

![5-06-destination-finish.png](./images/506destinationfinish.png)

これで、オーディエンスがMicrosoft Event Hub の宛先に対してアクティブ化されました。

![5-07-destination-segment-added.png](./images/507destinationsegmentadded.png)

次の手順：[2.4.6 Microsoft Azure プロジェクトを作成する ](./ex6.md)

[モジュール 2.4 に戻る](./segment-activation-microsoft-azure-eventhub.md)

[すべてのモジュールに戻る](./../../../overview.md)
