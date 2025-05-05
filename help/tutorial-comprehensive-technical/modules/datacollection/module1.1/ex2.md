---
title: Foundation - Adobe Experience Platform Data Collection と Web SDK Extension のセットアップ（Edge Network、データストリーム、サーバーサイドのデータ収集）
description: Foundation - Adobe Experience Platform Data Collection と Web SDK Extension のセットアップ（Edge Network、データストリーム、サーバーサイドのデータ収集）
kt: 5342
doc-type: tutorial
exl-id: e97d40b5-616d-439c-9d6b-eaa4ebf5acb0
source-git-commit: 1526661a80b4d551627dfca42a7e97c9498dd1f2
workflow-type: tm+mt
source-wordcount: '588'
ht-degree: 1%

---

# 1.1.2 Edge Network、データストリーム、およびサーバサイドのデータ収集

## コンテキスト

この演習では、**datastream** を作成します。 **データストリーム** は、Web SDKで収集されたデータの送信先をAdobe Edge ネットワークサーバーに指示します。 例えば、データをAdobe Experience Platformに送信しますか？ Adobe Analytics? Adobe Audience Manager? Adobe Target?

データストリームは、常にExperience Platformデータ収集ユーザーインターフェイスで管理され、[Web SDK](https://experienceleague.adobe.com/ja/docs/experience-platform/web-sdk/home) を使用したExperience Platformデータ収集にとって重要です。 Adobe以外のタグ管理ソリューションを使用して web SDKを実装する場合でも、データストリームを作成する必要があります。

次の演習では、ブラウザーに web SDKを実装します。 その後、収集されるデータがどのように表示されるかがより明確になります。 現時点では、データストリームにデータの転送先を指示しているだけです。

## データストリームの作成

[ はじめに ](./../../../modules/gettingstarted/gettingstarted/ex2.md) では、既にデータストリームを作成していますが、作成した背景や理由については説明していません。

[ データストリーム ](https://experienceleague.adobe.com/ja/docs/experience-platform/datastreams/overview) は、Web SDKで収集されたデータの送信先をEdge Networkサーバーに指示します。 データストリームを使用してデータを送信できる場所について詳しくは、[ データストリームへのサービスの追加 ](https://experienceleague.adobe.com/ja/docs/experience-platform/datastreams/configure#add-services) のドキュメントを参照してください。

データストリームは、Experience Platformのデータ収集ユーザーインターフェイスで管理され、Adobe Experience Platform データ収集を使用して web SDKを実装しているかどうかに関係なく、web SDKを使用したデータ収集にとって重要です。

**[!UICONTROL datastream]** を確認しましょう。

[https://experience.adobe.com/launch/](https://experience.adobe.com/launch/) に移動します。

左側のメニューで **[!UICONTROL データストリーム]** をクリックします。

![ 左側のナビゲーションでデータストリームアイコンをクリック ](./images/edgeconfig1.png)

データストリーム（`--aepUserLdap-- - Demo System Datastream` という名前）を開きます。

![ データストリームに名前を付けて保存する ](./images/edgeconfig2.png)

その後、データストリームの詳細が表示されます。

![ データストリームに名前を付けて保存する ](./images/edgecfg1.png)

**Adobe Experience Platform** の横にある「**...**」をクリックし、「**編集**」をクリックします。

![ データストリームに名前を付けて保存する ](./images/edgecfg1a.png)

その後、これが表示されます。 現時点では、Adobe Experience Platformのみが有効になっています。 設定は、以下の設定のようになります。 （環境とAdobe Experience Platform インスタンスによっては、サンドボックス名が異なる場合があります）

![ データストリームに名前を付けて保存する ](./images/edgecfg2.png)

以下のフィールドを次のように解釈する必要があります。

このデータストリームの場合…

- 収集されたすべてのデータは、Adobe Experience Platformの `--aepSandboxName--` サンドボックスに保存されます
- すべてのエクスペリエンスイベントデータは、デフォルトでデータセット **デモシステム - Web サイトのイベントデータセット（グローバル v1.1）** に収集されます。
- すべてのプロファイルデータは、デフォルトでデータセット **デモシステム - web サイトのプロファイルデータセット （グローバル v1.1）** に収集されます（現在、Web SDKでプロファイルデータをネイティブに取り込む機能は、Web SDKではまだサポートされていません）
- このデータストリームに **application** Offer decisioningサービスを使用する場合は、Offer decisioningのチェックボックスをオンにする必要があります。 （これは、[ モジュール 3.3](./../../../modules/ajo-b2c/module3.3/offer-decisioning.md) の一部です）
- **Edge セグメント化** はデフォルトで有効になっています。つまり、選定オーディエンスは、受信トラフィックの取り込み時にエッジで評価されます
- [ パーソナライゼーションの宛先 ](https://experienceleague.adobe.com/ja/docs/experience-platform/destinations/catalog/personalization/overview) を使用する場合、**Personalizationの宛先** のチェックボックスをオンにします。
- このデータストリームで **Adobe Journey Optimizer** の機能を使用する場合は、**Adobe Journey Optimizer** のチェックボックスをオンにする必要があります。


現時点では、データストリームに他の設定は必要ありません。

次の手順：[1.1.3 Adobe Experience Platformのデータ収集の概要 ](./ex3.md)

[モジュール 1.1 に戻る](./data-ingestion-launch-web-sdk.md)

[すべてのモジュールに戻る](./../../../overview.md)
