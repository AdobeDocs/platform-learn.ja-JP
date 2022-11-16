---
title: Microsoft Azure Event Hub へのセグメントのアクティベーション — Azure でのイベントハブのセットアップ
description: Microsoft Azure Event Hub へのセグメントのアクティベーション — Azure でのイベントハブのセットアップ
kt: 5342
audience: Data Engineer, Data Architect, Data Analyst
doc-type: tutorial
activity: develop
exl-id: 9434ac83-5554-48bf-838c-7346d571efbf
source-git-commit: cc7a77c4dd380ae1bc23dc75608e8e2224dfe78c
workflow-type: tm+mt
source-wordcount: '567'
ht-degree: 1%

---

# 13.1 Microsoft Azure EventHub 環境の設定

Azure Event Hubs は、1 秒あたり数百万件のイベントを取り込み、複数のアプリケーションにストリーミングできる、拡張性の高いパブリッシュサブスクライブサービスです。 これにより、接続されたデバイスやアプリケーションで生成された大量のデータを処理および分析できます。

## 13.1.1 Azure Event Hubs とは

Azure Event Hubs は、ビッグデータストリーミングプラットフォームおよびイベントインジェストサービスです。 1 秒あたりに数百万件のイベントを受信して処理できます。 イベントハブに送信されるデータは、任意のリアルタイム分析プロバイダーまたはバッチ/ストレージアダプターを使用して、変換および保存できます。

イベントハブは、 **前扉** イベントパイプラインの場合は、多くの場合、ソリューションアーキテクチャ内のイベントインジェスターと呼ばれます。 イベント取り込み元は、イベントパブリッシャー (Adobe Experience Platform RTCDP など ) とイベントコンシューマーとの間で切り離され、イベントストリームの生成をこれらのイベントの使用から切り離すコンポーネントまたはサービスです。 イベントハブは、時間保持バッファを備えた統合ストリーミングプラットフォームを提供し、イベントプロデューサーとイベントコンシューマーを分離します。

## 13.1.2 Event Hubs 名前空間の作成

に移動します。 [https://portal.azure.com/#home](https://portal.azure.com/#home) を選択し、 **リソースの作成**.

![1-01-open-azure-portal.png](./images/1-01-open-azure-portal.png)

リソース画面で、「 **イベント** 検索バーで、「 **イベントハブ** ドロップダウンから、次の操作をおこないます。

![1-02-search-event-hubs.png](./images/1-02-search-event-hubs.png)

クリック **作成**:

![1-03-event-hub-create.png](./images/1-03-event-hub-create.png)

Azure で初めてリソースを作成する場合は、新しい **リソースグループ**. 既にリソースグループがある場合は、そのリソースグループを選択（または新しく作成）できます。

選択 **新規作成**、グループに名前を付けます。 `--demoProfileLdap---aep-enablement`.

![1-04-create-resource-group.png](./images/1-04-create-resource-group.png)

次に示すように、フィールドのテストを完了します。

- 名前空間：名前空間を定義します。一意である必要があります。次のパターンを使用します `--demoProfileLdap---aep-enablement`
- 場所： **西ヨーロッパ** アムステルダムの Azure データセンターを参照
- 価格レベル： **基本**
- スループットの単位： **1**

![1-05-create-namespace.png](./images/1-05-create-namespace.png)

クリック **確認して作成**.

![1-06-namespace-review-create.png](./images/1-06-namespace-review-create.png)

「**作成**」をクリックします。

![1-07-namespace-create.png](./images/1-07-namespace-create.png)

リソースグループのデプロイメントには、1 ～ 2 分かかる場合があります。正常に完了すると、次の画面が表示されます。

![1-08-namespace-deploy.png](./images/1-08-namespace-deploy.png)

## 13.1.3 Azure でのイベントハブのセットアップ

に移動します。 [https://portal.azure.com/#home](https://portal.azure.com/#home) を選択し、 **すべてのリソース**.

![1-09-all-resources.png](./images/1-09-all-resources.png)

リソースのリストから、 `--demoProfileLdap---aep-enablement` 名前空間：

![1-10-list-resources.png](./images/1-10-list-resources.png)

In `--demoProfileLdap---aep-enablement` 詳細画面：「 」を選択します。 **イベントハブ**:

![1-11-eventhub-namespace.png](./images/1-11-eventhub-namespace.png)

クリック **+イベントハブ**.

![1-12-add-event-hub.png](./images/1-12-add-event-hub.png)

用途 `--demoProfileLdap---aep-enablement-event-hub` 名前として設定し、「 **作成**.

![1-13-create-event-hub.png](./images/1-13-create-event-hub.png)

クリック **イベントハブ** を設定します。 これで、 **イベントハブ** リストに表示されました。 その場合は、次の演習に進みます。

![1-14-event-hub-list.png](./images/1-14-event-hub-list.png)

## 13.1.4 Azure ストレージアカウントのセットアップ

後の演習で Azure Event Hub 機能をデバッグするには、Visual Studio Code プロジェクトセットアップの一部として Azure Storage アカウントを提供する必要があります。 次に、その Azure ストレージアカウントを作成します。

に移動します。 [https://portal.azure.com/#home](https://portal.azure.com/#home) を選択し、 **リソースの作成**.

![1-15-event-hub-storage.png](./images/1-15-event-hub-storage.png)

入力 **ストレージ** を選択し、 **ストレージアカウント** を選択します。

![1-16-event-hub-search-storage.png](./images/1-16-event-hub-search-storage.png)

「**作成**」を選択します。

![1-17-event-hub-create-storage.png](./images/1-17-event-hub-create-storage.png)

次を指定： **リソースグループ** （この演習の最初に作成）、 `--demoProfileLdap--aepstorage` ストレージアカウント名として「 」を選択し、 **ローカル冗長ストレージ (LRS)**&#x200B;を選択し、「 **確認して作成**.

![1-18-event-hub-create-review-storage.png](./images/1-18-event-hub-create-review-storage.png)

「**作成**」をクリックします。

![1-19-event-hub-submit-storage.png](./images/1-19-event-hub-submit-storage.png)

ストレージアカウントの作成には数秒かかります。

![1-20-event-hub-deploy-storage.png](./images/1-20-event-hub-deploy-storage.png)

終了すると、画面に **リソースに移動** 」ボタンをクリックします。

クリック **Microsoft Azure**.

![1-21-event-hub-deploy-ready-storage.png](./images/1-21-event-hub-deploy-ready-storage.png)

ストレージアカウントが次の場所に表示されます。 **最近のリソース**.

![1-22-event-hub-deploy-resources-list.png](./images/1-22-event-hub-deploy-resources-list.png)

次のステップ： [13.2 Adobe Experience Platformでの Azure イベントハブの宛先の設定](./ex2.md)

[モジュール 13 に戻る](./segment-activation-microsoft-azure-eventhub.md)

[すべてのモジュールに戻る](./../../overview.md)
