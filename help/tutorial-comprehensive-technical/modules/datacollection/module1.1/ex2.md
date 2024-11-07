---
title: 基盤 – Adobe Experience Platform Data Collection と Web SDK 拡張機能の設定 – Edge Network、データストリームおよびサーバーサイドのデータ収集
description: 基盤 – Adobe Experience Platform Data Collection と Web SDK 拡張機能の設定 – Edge Network、データストリームおよびサーバーサイドのデータ収集
kt: 5342
doc-type: tutorial
source-git-commit: 6962a0d37d375e751a05ae99b4f433b0283835d0
workflow-type: tm+mt
source-wordcount: '583'
ht-degree: 0%

---

# 1.1.2 Edge Network、データストリーム、およびサーバサイドのデータ収集

## コンテキスト

この演習では、**データストリーム** を作成します。 **データストリーム** は、Web SDK で収集されたデータの送信先をAdobe Edge サーバーに指示します。 例えば、データをAdobe Experience Platformに送信しますか？ Adobe Analytics? Adobe Audience Manager? Adobe Target?

データストリームは、常にAdobe Experience Platform Data Collection ユーザーインターフェイスで管理され、Web SDK を使用したAdobe Experience Platform Data Collection にとって重要です。 Adobe以外のタグ管理ソリューションで Web SDK を実装する場合でも、Adobe Experience Platform Data Collection ユーザーインターフェイスでデータストリームを作成する必要があります。

次の演習では、ブラウザーに Web SDK を実装します。 その後、収集されるデータがどのように表示されるかがより明確になります。 現時点では、データの転送先をデータストリームに指示するだけです。

## データストリームの作成

[ 演習 0.2 では ](./../../../modules/gettingstarted/gettingstarted/ex2.md) 既にデータストリームを作成しましたが、データストリームである理由と背景については説明しませんでした。

データストリームは、Web SDK で収集されたデータの送信先をAdobe Edge サーバーに伝えます。 例えば、データをAdobe Experience Platformに送信しますか？ Adobe Analytics? Adobe Audience Manager? Adobe Target? データストリームは、Adobe Experience Platform Data Collection ユーザーインターフェイスで管理され、Adobe Experience Platform Data Collection 経由で Web SDK を実装しているかどうかに関係なく、Web SDK を使用した Platform データ収集にとって重要です。

**[!UICONTROL データストリーム]** を確認しましょう。

[https://experience.adobe.com/launch/](https://experience.adobe.com/launch/) に移動します。

左側のメニューで **[!UICONTROL データストリーム]** または **[!UICONTROL データストリーム（Beta）]** をクリックします。

![ 左側のナビゲーションでデータストリームアイコンをクリック ](./images/edgeconfig1.png)

`--aepUserLdap-- - Demo System Datastream` という名前のデータストリームを検索します。

![ データストリームに名前を付けて保存する ](./images/edgeconfig2.png)

データストリームの詳細が表示されます。

![ データストリームに名前を付けて保存する ](./images/edgecfg1.png)

**Adobe Experience Platform** の横にある「**...**」をクリックし、「**編集**」をクリックします。

![ データストリームに名前を付けて保存する ](./images/edgecfg1a.png)

その後、これが表示されます。 現時点では、Adobe Experience Platformのみが有効になっています。 設定は、以下の設定のようになります。 （環境とAdobe Experience Platform インスタンスによっては、サンドボックス名が異なる場合があります）

![ データストリームに名前を付けて保存する ](./images/edgecfg2.png)

以下のフィールドを次のように解釈する必要があります。

このデータストリームの場合…

- 収集されたすべてのデータは、Adobe Experience Platformの `--aepSandboxName--` サンドボックスに保存されます
- すべてのエクスペリエンスイベントデータは、デフォルトでデータセット **デモシステム - Web サイトのイベントデータセット（グローバル v1.1）** に収集されます。
- すべてのプロファイルデータは、デフォルトでデータセット **デモシステム - Web サイトのプロファイルデータセット （グローバル v1.1）** に収集されます（現在、Web SDK でプロファイルデータをネイティブに取り込む機能は、Web SDK ではまだサポートされておらず、後で利用できるようになります）
- このデータストリームで **Offer decisioning** アプリケーションサービスを使用する場合は、Offer decisioningのチェックボックスをオンにする必要があります。 （これは、[ モジュール 3.3](./../../../modules/ajo-b2c/module3.3/offer-decisioning.md) の一部です）
- **Edge Segmentation** を使用する場合は、「Edge セグメント化」チェックボックスをオンにする必要があります。
- **Personalizationの宛先** を使用する場合は、「Personalizationの宛先」チェックボックスをオンにする必要があります。

現時点では、データストリームに他の設定は必要ありません。

次の手順：[1.1.3 Adobe Experience Platformのデータ収集の概要 ](./ex3.md)

[モジュール 1.1 に戻る](./data-ingestion-launch-web-sdk.md)

[すべてのモジュールに戻る](./../../../overview.md)
