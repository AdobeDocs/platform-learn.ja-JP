---
title: Adobe Experience Platform Data Collection & Real-time Server Side Forwarding - データストリームを更新して、Adobe Experience Platform Data Collection Server プロパティでデータを使用できるようにします
description: Adobe Experience Platform Data Collection Server プロパティでデータを使用できるように、データストリームを更新します
kt: 5342
doc-type: tutorial
exl-id: 7b5b598e-e54c-4f0f-b260-d643600ee6ca
source-git-commit: 6485bfa1c75c43bb569f77c478a273ace24a61d4
workflow-type: tm+mt
source-wordcount: '231'
ht-degree: 1%

---

# 2.5.2 Adobe Experience Platform Data Collection Server プロパティでデータを使用できるように、データストリームを更新します。

## データストリームの更新

[&#x200B; はじめに &#x200B;](./../../gettingstarted/gettingstarted/ex2.md) で、独自の **[!UICONTROL データストリーム]** を作成しました。 その後、`--aepUserLdap-- - Demo System Datastream` という名前を使用しました。

この演習では、**[!UICONTROL データ収集サーバープロパティ]** と連携するように **Datastream** を設定する必要があります。

その場合は、[https://experience.adobe.com/#/data-collection/](https://experience.adobe.com/#/data-collection/) にアクセスしてください。 その後、これが表示されます。 左側のメニューで、「**[!UICONTROL データストリーム]**」をクリックします。

画面の右上隅にあるサンドボックス名を選択します（`--aepSandboxName--` にする必要があります）。

![&#x200B; 左側のナビゲーションで「Edge設定」アイコンをクリック &#x200B;](./images/edgeconfig1b.png)

**[!UICONTROL Datastream]** を検索します。名前は `--aepUserLdap-- - Demo System Datastream` です。 **[!UICONTROL データストリーム]** をクリックして開きます。

![WebSDK](./images/websdk0.png)

その後、これが表示されます。 「**[!UICONTROL + サービスを追加]**」をクリックします。

![WebSDK](./images/websdk3.png)

サービス **イベント転送** を選択します。 これにより、2 つの追加設定が表示されます。 前の演習で作成し、`--aepUserLdap-- - Demo System (DD/MM/YYYY) (Edge)` という名前のイベント転送プロパティを選択します。 次に、「環境 **の下の** 開発 **を選択し** す。 「**保存**」をクリックします。

![WebSDK](./images/websdk4.png)

これでデータストリームが更新され、使用する準備が整いました。

![WebSDK](./images/websdk8a.png)

これで、データストリームが **[!DNL Event Forwarding property]** で動作する準備ができました。

次の手順：[2.5.3 カスタム Webhook を作成して設定する &#x200B;](./ex3.md)

[モジュール 2.5 に戻る](./aep-data-collection-ssf.md)

[すべてのモジュールに戻る](./../../../overview.md)
