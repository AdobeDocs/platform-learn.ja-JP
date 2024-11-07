---
title: Microsoft Azure Event Hub へのセグメントのアクティブ化 – セグメントのアクティブ化
description: Microsoft Azure Event Hub へのセグメントのアクティブ化 – セグメントのアクティブ化
kt: 5342
doc-type: tutorial
source-git-commit: 6962a0d37d375e751a05ae99b4f433b0283835d0
workflow-type: tm+mt
source-wordcount: '347'
ht-degree: 2%

---

# 2.4.4 セグメントのアクティブ化

## 2.4.4.1 Azure Event Hub 宛先へのセグメントの追加

この演習では、セグメント `--aepUserLdap-- - Interest in Equipment` を `--aepUserLdap---aep-enablement` Azure Event Hub の宛先に追加します。

URL:[https://experience.adobe.com/platform](https://experience.adobe.com/platform) に移動して、Adobe Experience Platformにログインします。

ログインすると、Adobe Experience Platformのホームページが表示されます。

![データ取得](./../../../modules/datacollection/module1.2/images/home.png)

続行する前に、**サンドボックス** を選択する必要があります。 選択するサンドボックスの名前は ``--aepSandboxName--`` です。 これを行うには、画面上部の青い線のテキスト **[!UICONTROL 実稼動製品]** をクリックします。 適切なサンドボックスを選択すると、画面が変更され、専用のサンドボックスが表示されます。

![データ取得](./../../../modules/datacollection/module1.2/images/sb1.png)

**宛先** に移動し、「参照 **をクリック** ます。 使用可能なすべての宛先が表示されます。 宛先を見つけて、以下に示すように **+** アイコンをクリックします。

![5-01-select-destination.png](./images/5-01-select-destination.png)

その後、これが表示されます。 LDAP を使用してセグメントを検索し、セグメントのリストから `--aepUserLdap-- - Interest in Equipment` を選択します。

「**次へ**」をクリックします。

![5-04-select-segment.png](./images/5-04-select-segment.png)

Adobe Experience Platform Real-time CDP は、セグメント宛先とプロファイル宛先の 2 種類の宛先にペイロードを配信できます。

セグメントの宛先には、事前に定義されたセグメントの選定ペイロードが届きます。これについては後で説明します。 このようなペイロードには、特定のプロファイルに対するセグメント選定 **すべて** が含まれます。 宛先のアクティベーションリストにないセグメントの場合でも可能です。 このようなセグメントの宛先の例として、**Azure Event Hubs** と **AWS Kinesis** があります。

プロファイルベースの宛先を使用すると、XDM プロファイル結合スキーマから任意の属性（firstName、lastName など）を選択して、アクティベーションペイロードに含めることができます。 このような宛先の例として、**メールマーケティング** があります。

Azure Event Hub の宛先は **セグメント** の宛先なので、例えばフィールド `--aepTenantId--.identification.core.ecid` を選択します。

「**新しいフィールドを追加**」をクリックし、「スキーマを参照」をクリックして、フィールド `--aepTenantId--identification.core.ecid` を選択します（自動的に表示されるその他のフィールドがあれば削除します）。

「**次へ**」をクリックします。

![5-05-select-attributes.png](./images/5-05-select-attributes.png)

「**完了**」をクリックします。

![5-06-destination-finish.png](./images/5-06-destination-finish.png)

これで、セグメントがMicrosoft Event Hub の宛先に対してアクティブ化されました。

![5-07-destination-segment-added.png](./images/5-07-destination-segment-added.png)

次の手順：[2.4.5 Microsoft Azure プロジェクトを作成する ](./ex5.md)

[モジュール 2.4 に戻る](./segment-activation-microsoft-azure-eventhub.md)

[すべてのモジュールに戻る](./../../../overview.md)
