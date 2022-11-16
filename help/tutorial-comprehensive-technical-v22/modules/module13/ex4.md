---
title: Microsoft Azure Event Hub へのセグメントのアクティベーション — セグメントのアクティブ化
description: Microsoft Azure Event Hub へのセグメントのアクティベーション — セグメントのアクティブ化
kt: 5342
audience: Data Engineer, Data Architect, Data Analyst
doc-type: tutorial
activity: develop
exl-id: 250f8536-b6bd-4c64-a552-80d5c6fb6358
source-git-commit: cc7a77c4dd380ae1bc23dc75608e8e2224dfe78c
workflow-type: tm+mt
source-wordcount: '340'
ht-degree: 3%

---

# 13.4 セグメントのアクティブ化

## 13.4.1 Azure イベントハブの宛先へのセグメントの追加

この演習では、セグメントを追加します `--demoProfileLdap-- - Interest in Equipment` を `--demoProfileLdap---aep-enablement` Azure イベントハブの宛先。

次の URL に移動して、Adobe Experience Platformにログインします。 [https://experience.adobe.com/platform](https://experience.adobe.com/platform).

ログイン後、Adobe Experience Platformのホームページに移動します。

![データ取得](../module2/images/home.png)

続行する前に、 **サンドボックス**. 選択するサンドボックスの名前はです ``--aepSandboxId--``. これを行うには、 **[!UICONTROL 実稼動版]** 画面の上の青い線で表示されます。 適切なサンドボックスを選択すると、画面が変更され、専用のサンドボックスに移動します。

![データ取得](../module2/images/sb1.png)

に移動します。 **宛先**&#x200B;を選択し、「 **参照**. その後、使用可能な宛先がすべて表示されます。 宛先を見つけ、 **+** 以下に示すアイコン

![5-01-select-destination.png](./images/5-01-select-destination.png)

これが見えます LDAP を使用してセグメントを検索し、「 」を選択します。 `--demoProfileLdap-- - Interest in Equipment` を選択します。

「**次へ**」をクリックします。

![5-04-select-segment.png](./images/5-04-select-segment.png)

Adobe Experience Platform Real-time CDP は、ペイロードを、セグメントの宛先とプロファイルの宛先の 2 種類に配信できます。

セグメントの宛先は、事前に定義されたセグメント認定ペイロードを受け取ります。これについては後で説明します。 このようなペイロードには **すべて** 特定のプロファイルのセグメント認定。 宛先のアクティベーションリストにないセグメントの場合も同様です。 このようなセグメントの宛先の例を次に示します。 **Azure イベントハブ** および **AWS Kinesis**.

プロファイルベースの宛先を使用すると、XDM プロファイル和集合スキーマから任意の属性（firstName、lastName など）を選択し、アクティベーションペイロードに含めることができます。 このような宛先の例として、 **メールマーケティング**.

Azure Event Hub の宛先は **セグメント** 宛先、例えばフィールドを選択 `--aepTenantId--.identification.core.ecid`.

クリック **新しいフィールドを追加**、「スキーマを参照」をクリックして、フィールドを選択します。 `--aepTenantId--identification.core.ecid` （自動的に表示されるその他のフィールドを削除します）。

「**次へ**」をクリックします。

![5-05-select-attributes.png](./images/5-05-select-attributes.png)

「**完了**」をクリックします。

![5-06-destination-finish.png](./images/5-06-destination-finish.png)

これで、セグメントがMicrosoft Event Hub の宛先に対してアクティブ化されます。

![5-07-destination-segment-added.png](./images/5-07-destination-segment-added.png)

次のステップ： [13.5 Microsoft Azure プロジェクトの作成](./ex5.md)

[モジュール 13 に戻る](./segment-activation-microsoft-azure-eventhub.md)

[すべてのモジュールに戻る](./../../overview.md)
