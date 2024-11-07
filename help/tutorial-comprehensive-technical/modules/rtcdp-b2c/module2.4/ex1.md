---
title: Microsoft Azure Event Hub へのセグメントのアクティベーション - Azure での Event Hub のセットアップ
description: Microsoft Azure Event Hub へのセグメントのアクティベーション - Azure での Event Hub のセットアップ
kt: 5342
doc-type: tutorial
source-git-commit: 6962a0d37d375e751a05ae99b4f433b0283835d0
workflow-type: tm+mt
source-wordcount: '589'
ht-degree: 1%

---

# 2.4.1 Microsoft Azure EventHub 環境の設定

Azure Event Hubs は、1 秒あたり数百万のイベントを取り込んで複数のアプリケーションにストリーミングできる、拡張性の高いパブリッシュ/サブスクライブ サービスです。 これにより、接続されたデバイスやアプリケーションによって生成された膨大な量のデータを処理および分析できます。

## 2.4.1.1 Azure Event Hubs とは

Azure Event Hubs は、ビッグデータストリーミングプラットフォームとイベント取り込みサービスです。 1 秒あたり数百万のイベントを受信し、処理できます。 イベントハブに送信されたデータは、任意のリアルタイム分析プロバイダーまたはバッチ/ストレージアダプターを使用して変換および保存できます。

Event Hubs は、イベントパイプラインの **フロントドア** を表し、多くの場合、ソリューションアーキテクチャではイベント取り込みツールと呼ばれます。 イベント取得ツールは、イベントパブリッシャー（Adobe Experience Platform RTCDP など）とイベントコンシューマーの間に位置するコンポーネントまたはサービスで、イベントストリームの生成とそのイベントの利用を切り離すものです。 Event Hubs は、時間保持バッファーを備えた統合ストリーミングプラットフォームを提供し、イベントプロデューサーをイベントコンシューマーから分離します。

## 2.4.1.2 Event Hubs 名前空間の作成

[https://portal.azure.com/#home](https://portal.azure.com/#home) に移動し、「**リソースを作成** を選択します。

![1-01-open-azure-portal.png](./images/1-01-open-azure-portal.png)

リソース画面で、検索バーに **Event** と入力し、ドロップダウンから **Event Hubs** を選択します。

![1-02-search-event-hubs.png](./images/1-02-search-event-hubs.png)

**作成** をクリックします。

![1-03-event-hub-create.png](./images/1-03-event-hub-create.png)

Azure で初めてリソースを作成する場合は、新しい **リソースグループ** を作成する必要があります。 既にリソースグループがある場合は、そのリソースグループを選択（または新しいリソースグループを作成）できます。

**新規作成** を選択し、グループに `--aepUserLdap---aep-enablement` という名前を付けます。

![1-04-create-resource-group.png](./images/1-04-create-resource-group.png)

次に示すフィールドのテストを完了します。

- 名前空間：名前空間を定義します。名前空間は一意である必要があります。次のパターンを使用します `--aepUserLdap---aep-enablement`
- 所在地：**西ヨーロッパ** は、アムステルダムにある Azure データセンターを指します
- 価格レベル：**基本**
- スループット単位：**1**

![1-05-create-namespace.png](./images/1-05-create-namespace.png)

**レビューして作成** をクリックします。

![1-06-namespace-review-create.png](./images/1-06-namespace-review-create.png)

「**作成**」をクリックします。

![1-07-namespace-create.png](./images/1-07-namespace-create.png)

リソースグループのデプロイメントには 1～2 分かかる場合があります。成功すると、次の画面が表示されます。

![1-08-namespace-deploy.png](./images/1-08-namespace-deploy.png)

## 2.4.1.3 Azure でのイベントハブのセットアップ

[https://portal.azure.com/#home](https://portal.azure.com/#home) に移動し、「**すべてのリソース**」を選択します。

![1-09-all-resources.png](./images/1-09-all-resources.png)

リソースリストから、`--aepUserLdap---aep-enablement` 名前空間を選択します。

![1-10-list-resources.png](./images/1-10-list-resources.png)

詳細画面 `--aepUserLdap---aep-enablement`、「**Event Hubs**」を選択します。

![1-11-eventhub-namespace.png](./images/1-11-eventhub-namespace.png)

**+ Event Hub** をクリックします。

![1-12-add-event-hub.png](./images/1-12-add-event-hub.png)

`--aepUserLdap---aep-enablement-event-hub` を名前として使用し、「作成 **をクリックし** す。

![1-13-create-event-hub.png](./images/1-13-create-event-hub.png)

Event Hub 名前空間の **Event Hubs** をクリックします。 **イベントハブ** がリストに表示されます。 その場合は、次の演習に進むことができます。

![1-14-event-hub-list.png](./images/1-14-event-hub-list.png)

## 2.4.1.4 Azure ストレージアカウントのセットアップ

後の演習で Azure Event Hub 機能をデバッグするには、Visual Studio Code プロジェクト設定の一部として Azure ストレージアカウントを指定する必要があります。 次に、その Azure ストレージアカウントを作成します。

[https://portal.azure.com/#home](https://portal.azure.com/#home) に移動し、「**リソースを作成** を選択します。

![1-15-event-hub-storage.png](./images/1-15-event-hub-storage.png)

検索に **ストレージ** と入力し、リストから **ストレージアカウント** を選択します。

![1-16-event-hub-search-storage.png](./images/1-16-event-hub-search-storage.png)

「**作成**」を選択します。

![1-17-event-hub-create-storage.png](./images/1-17-event-hub-create-storage.png)

（この演習の最初に作成した **リソース グループ** を指定し、ストレージ アカウント名として `--aepUserLdap--aepstorage` を使用して、**ローカル冗長ストレージ （LRS）** を選択してから、**確認+作成** をクリックします。

![1-18-event-hub-create-review-storage.png](./images/1-18-event-hub-create-review-storage.png)

「**作成**」をクリックします。

![1-19-event-hub-submit-storage.png](./images/1-19-event-hub-submit-storage.png)

ストレージアカウントの作成には、数秒かかります。

![1-20-event-hub-deploy-storage.png](./images/1-20-event-hub-deploy-storage.png)

完了すると、画面に **リソースに移動** ボタンが表示されます。

**Microsoft Azure** をクリックします。

![1-21-event-hub-deploy-ready-storage.png](./images/1-21-event-hub-deploy-ready-storage.png)

ストレージアカウントが **最近のリソース** の下に表示されるようになりました。

![1-22-event-hub-deploy-resources-list.png](./images/1-22-event-hub-deploy-resources-list.png)

次の手順：[2.4.2 Adobe Experience Platformで Azure Event Hub の宛先を設定する ](./ex2.md)

[モジュール 2.4 に戻る](./segment-activation-microsoft-azure-eventhub.md)

[すべてのモジュールに戻る](./../../../overview.md)
