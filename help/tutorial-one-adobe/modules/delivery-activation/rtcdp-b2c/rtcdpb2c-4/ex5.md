---
title: Microsoft Azure Event Hub へのAudience Activation - オーディエンスのアクティブ化
description: Microsoft Azure Event Hub へのAudience Activation - オーディエンスのアクティブ化
kt: 5342
doc-type: tutorial
exl-id: e6bac0ce-4a1e-4458-af3e-3d6ac40b9cb5
source-git-commit: 3d61d91111d8693ab031fbd7b26706c02818108c
workflow-type: tm+mt
source-wordcount: '225'
ht-degree: 5%

---

# 2.4.5 オーディエンスのアクティブ化

## Azure Event Hub の宛先へのオーディエンスの追加

この演習では、オーディエンス `--aepUserLdap-- - Interest in Plans` を `--aepUserLdap---aep-enablement` Azure Event Hub の宛先に追加します。

URL:[https://experience.adobe.com/platform](https://experience.adobe.com/platform) に移動して、Adobe Experience Platformにログインします。

ログインすると、Adobe Experience Platformのホームページが表示されます。

![データ取得](./../../../../modules/delivery-activation/datacollection/dc1.2/images/home.png)

続行する前に、**サンドボックス** を選択する必要があります。 選択するサンドボックスの名前は ``--aepSandboxName--`` です。 適切なサンドボックスを選択すると、画面が変更され、専用のサンドボックスが表示されます。

![データ取得](./../../../../modules/delivery-activation/datacollection/dc1.2/images/sb1.png)

**宛先** に移動し、「参照 **をクリック** ます。 使用可能なすべての宛先が表示されます。 宛先を見つけて、以下に示す 3 つのドット&#x200B;**...**&#x200B;をクリックし、「**オーディエンスをアクティブ化**」をクリックします。

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

## 次の手順

[2.4.6 Microsoft Azure プロジェクトの作成 &#x200B;](./ex6.md){target="_blank"} に移動します。

[Real-Time CDP:Audience ActivationからMicrosoft Azure Event Hub に戻る &#x200B;](./segment-activation-microsoft-azure-eventhub.md){target="_blank"}

[&#x200B; すべてのモジュール &#x200B;](./../../../../overview.md){target="_blank"} に戻る
