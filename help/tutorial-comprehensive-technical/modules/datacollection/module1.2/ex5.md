---
title: Foundation - データ取得 – オフラインソースからのデータ取得
description: Foundation - データ取得 – オフラインソースからのデータ取得
kt: 5342
doc-type: tutorial
exl-id: 21b84a77-4115-4ba7-b847-b236aa14bbdd
source-git-commit: 8bdcd03bd38a6da98b82439ad86482cad5f4e684
workflow-type: tm+mt
source-wordcount: '771'
ht-degree: 4%

---

# 1.2.5 データランディングゾーン

この演習の目標は、Azure Blob ストレージを使用して Data Landing Zone Source コネクタを設定することです。

Data Landing Zone は、Adobe Experience Platformによってプロビジョニングされた Azure Blob ストレージインターフェイスです。安全なクラウドベースのファイルストレージ機能にアクセスして、ファイルを Platform に取り込むことができます。 データランディングゾーンは SAS ベースの認証をサポートし、そのデータは保存時および転送中は標準の Azure Blob Storage セキュリティメカニズムで保護されます。 SAS ベースの認証を使用すると、パブリックインターネット接続を介してデータランディングゾーンコンテナに安全にアクセスできます。

>[!NOTE]
>
> Adobe Experience Platformでは、データランディングゾーンコンテナにアップロードされるすべてのファイルで **厳密に 7 日間の有効期間（TTL）が適用されます**。 すべてのファイルは 7 日後に削除されます。


## 前提条件

Adobe Experience Platform Data Landing Zone に BLOB やファイルをコピーするには、コマンドラインユーティリティの AzCopy を使用します。 [https://docs.microsoft.com/en-us/azure/storage/common/storage-use-azcopy-v10](https://docs.microsoft.com/en-us/azure/storage/common/storage-use-azcopy-v10) からお使いのオペレーティングシステムのバージョンをダウンロードし、そのページを下にスクロールして **AzCopy ポータブルバイナリをダウンロード** し、お使いの OS に適したバージョンを選択できます。

![dlz-install-az-copy.png](./images/dlzinstallazcopy.png)

- ダウンロードファイルを解凍します

![dlz-install-az-copy.png](./images/dlz1.png)

- サンプル Web サイトのインタラクションを含んだサンプルデータファイル global-context-websiteinteractions.csv をダウンロードし、解凍したフォルダー **azcopy** に保存します。

![dlz-install-az-copy.png](./images/dlz2.png)

- ターミナルウィンドウを開き、デスクトップ上のフォルダーに移動すると、OSX などに次のコンテンツ（azcopy および global-context-websiteinteractions.csv）が表示されます。

![dlz-unzip-azcopy.png](./images/dlzunzipazcopy.png)

## 1.2.5.2 Adobe Experience Platformへのデータランディングゾーンの接続

URL:[https://experience.adobe.com/platform](https://experience.adobe.com/platform) に移動して、Adobe Experience Platformにログインします。

ログインすると、Adobe Experience Platformのホームページが表示されます。

![データ取得](./images/home.png)

続行する前に、**サンドボックス** を選択する必要があります。 選択するサンドボックスの名前は ``--aepSandboxName--`` です。  適切なサンドボックスを選択すると、画面が変更され、専用のサンドボックスが表示されます。

![データ取得](./images/sb1.png)

左側のメニューで、**ソース** に移動します。 ソースカタログで、「**data landing**」を検索します。

![データ取得](./images/sourcesdlz.png)

**データランディングゾーン** カードをクリックすると、右側のタブに資格情報が表示されます。

![dlz-view-credentials.png](./images/dlzviewcredentials.png)

指示に従ってアイコンをクリックし、**SASUri** をコピーします。

![dlz-copy-sas-uri.png](./images/dlzcopysasuri.png)

## AEP データランディングゾーンに csv ファイルをコピーします

次に、AZCopy を使用した Azure コマンドラインツールを使用して、Adobe Experience Platformにデータを取り込みます。

azcopy のインストール場所にあるターミナルを開き、次のコマンドを実行してファイルを AEP のデータランディングゾーンにコピーします。

``./azcopy copy <your-local-file> <your SASUri>``

SASUri は必ず二重引用符で囲んでください。 `<your-local-file>` を、azcopy ディレクトリ内のファイル **global-context-websiteinteractions.csv** のローカルコピーへのパスで置き換え、`<your SASUri>` を、Adobe Experience Platform UI からコピーした **SASUri** 値で置き換えます。 コマンドは次のようになります。

```command
./azcopy copy global-context-websiteinteractions.csv "https://sndbxdtlnd2bimpjpzo14hp6.blob.core.windows.net/dlz-user-container?sv=2020-04-08&si=dlz-xxxxxxx-9843-4973-ae52-xxxxxxxx&sr=c&sp=racwdlm&sig=DN3kdhKzard%2BQwKASKg67Zxxxxxxxxxxxxxxxx"
```

ターミナルで上記のコマンドを実行すると、次のように表示されます。

![dlz-exec-copy-command.png](./images/dlzexeccopycommand.png)

## データランディングゾーンでのファイルの参照

Adobe Experience Platformのデータランディングゾーンに移動します。

**ソース** を選択し、「**データランディング**」を検索して、「**設定**」ボタンをクリックします。

![dlz-inspect-datalanding-zone.png](./images/dlzinspectdatalandingzone.png)

これにより、データランディングゾーンが開きます。 データランディングゾーンの **データを選択** パネルに、アップロードしたファイルが表示されます。

![dlz-datalanding-zone-open.png](./images/dlzdatalandingzoneopen.png)

## ファイルを処理

ファイルを選択し、データ形式として **区切り** を選択します。 その後、データのプレビューが表示されます。 「**次へ**」をクリックします。

![dlz-datalanding-select-file.png](./images/dlzdatalandingselectfile.png)

これで、アップロードされたデータのマッピングを開始して、データセットの XDM スキーマに一致させることができます。

「**既存のデータセット**」を選択し、「**デモシステム - Web サイトのイベントデータセット （グローバル v1.1）**」を選択します。 「**次へ**」をクリックします。

![dlz-target-dataset.png](./images/dlztargetdataset.png)

これで、csv ファイルから受信したソースデータを、データセットの XDM スキーマのターゲットフィールドにマッピングする準備が整いました。

![dlz-start-mapping.png](./images/dlzstartmapping.png)

>[!NOTE]
>
> マッピングで発生する可能性のあるエラーを気にしないでください。 次の手順で、マッピングを修正します。

## フィールドをマッピング

まず、**すべてのマッピングをクリア** ボタンをクリックします。 その後、クリーンなマッピングから開始できます。

![dlz-clear-mappings.png](./images/mappings1.png)

次に、「**新しいフィールドタイプ**」をクリックし、「**新しいフィールドを追加**」を選択します。

![dlz-clear-mappings.png](./images/dlzclearmappings.png)

**ecid** ソースフィールドをマッピングするには、フィールド **identities.ecid** を選択し、「**選択**」をクリックします。

![dlz-map-identity.png](./images/dlzmapidentity.png)

次に、「**ターゲットフィールドをマッピング**」をクリックします。

![dlz-map-select-target-field.png](./images/dlzmapselecttargetfield.png)

スキーマ構造でフィールド ``--aepTenantId--``.identification.core.ecid を選択します。

![dlz-map-target-field.png](./images/dlzmaptargetfield.png)

他の 2 つのフィールドをマッピングし、「**+新しいフィールドタイプ**」をクリックしてから、「新しいフィールドを追加 **をクリックして、このマッピングのフィールドを追加する必要** あります

| ソース | target（ターゲット文字列） |
|---|---|
| resource.info.pagename | web.webPageDetails.name |
| タイムスタンプ | タイムスタンプ |
| タイムスタンプ | _id |

![dlz-add-other-mapping.png](./images/dlzaddothermapping.png)

完了すると、画面は次のようになります。 「**次へ**」をクリックします。

![dlz-mapping-result.png](./images/dlzmappingresult.png)

「**次へ**」をクリックします。

![dlz-default-scheduling.png](./images/dlzdefaultscheduling.png)

「**完了**」をクリックします。

![dlz-import-finish.png](./images/dlzimportfinish.png)

## データフローの監視

データフローを監視するには、**ソース**、**データフロー** に移動し、データフローをクリックします。

![dlz-monitor-dataflow.png](./images/dlzmonitordataflow.png)

データの読み込みには数分かかることがあります。読み込みに成功すると、**成功** というステータスが表示されます。

![dlz-monitor-dataflow-result.png](./images/dlzmonitordataflowresult.png)

次の手順：[ 概要とメリット ](./summary.md)

[モジュール 1.2 に戻る](./data-ingestion.md)

[すべてのモジュールに戻る](../../../overview.md)
