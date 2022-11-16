---
title: 基盤 — データ取り込み — オフラインソースからのデータ取り込み
description: 基盤 — データ取り込み — オフラインソースからのデータ取り込み
kt: 5342
audience: Data Engineer, Data Architect
doc-type: tutorial
activity: develop
exl-id: 93d9f4ef-9cbd-4310-879e-d69106b70404
source-git-commit: cc7a77c4dd380ae1bc23dc75608e8e2224dfe78c
workflow-type: tm+mt
source-wordcount: '773'
ht-degree: 3%

---

# 2.5 データランディングゾーン

この練習では、データランディングゾーンソースコネクタを Azure BLOB ストレージと共にセットアップすることが目標です。

データランディングゾーンは、Adobe Experience Platformがプロビジョニングした Azure BLOB ストレージインターフェイスで、ファイルを Platform に取り込むための、セキュリティで保護されたクラウドベースのファイルストレージ機能にアクセスできます。 データランディングゾーンは SAS ベースの認証をサポートし、そのデータは、保存時および送信時に標準の Azure Blob ストレージセキュリティメカニズムで保護されます。 SAS ベースの認証を使用すると、パブリックインターネット接続を介してデータランディングゾーンコンテナに安全にアクセスできます。

>[!NOTE]
>
> Adobe Experience Platform **では、厳密な 7 日間の有効期間 (TTL) が適用されます** を、データランディングゾーンコンテナにアップロードされたすべてのファイルに対して設定します。 すべてのファイルは 7 日後に削除されます。


## 2.5.1 前提条件

BLOB やファイルをAdobe Experience Platformデータランディングゾーンにコピーするには、コマンドラインユーティリティの AzCopy を使用します。 オペレーティングシステム用のバージョンは、 [https://docs.microsoft.com/en-us/azure/storage/common/storage-use-azcopy-v10](https://docs.microsoft.com/ja-jp/azure/storage/common/storage-use-azcopy-v10).

![dlz-install-az-copy.png](./images/dlz-install-az-copy.png)

- ダウンロードファイルを解凍します。

![dlz-install-az-copy.png](./images/dlz1.png)

- サンプルデータファイルをダウンロードします。 [global-context-websiteinteractions.csv](../../assets/csv/data-ingestion/global-context-websiteinteractions.csv):Web サイトでのインタラクション例を含み、解凍したフォルダーに保存します。 **azcopy**.

![dlz-install-az-copy.png](./images/dlz2.png)

- ターミナルウィンドウを開き、デスクトップ上のフォルダーに移動すると、例えば OSX 上の次のコンテンツ（azcopy および global-context-websiteinteractions.csv）が表示されます。

![dlz-unzip-azcopy.png](./images/dlz-unzip-azcopy.png)

## 2.5.2 データランディングゾーンのAdobe Experience Platformへの接続

次の URL に移動して、Adobe Experience Platformにログインします。 [https://experience.adobe.com/platform](https://experience.adobe.com/platform).

ログイン後、Adobe Experience Platformのホームページに移動します。

![データ取得](./images/home.png)

続行する前に、 **サンドボックス**. 選択するサンドボックスの名前はです ``--module2sandbox--``. これを行うには、 **[!UICONTROL 実稼動版]** 画面の上の青い線で表示されます。 適切なサンドボックスを選択すると、画面が変更され、専用のサンドボックスに移動します。

![データ取得](./images/sb1.png)

左側のメニューで、に移動します。 **ソース**. ソースカタログで、を検索します。 **データランディング**. の **データランディングゾーン** カード、クリック **...** を選択し、 **認証情報の表示**.

![dlz-view-credentials.png](./images/dlz-view-credentials.png)

上部コピーをクリック **佐須里**.

![dlz-copy-sas-uri.png](./images/dlz-copy-sas-uri.png)

## 2.5.3 csv ファイルを AEP データランディングゾーンにコピーする

AZCopy を使用して、Azure コマンドラインツールを使用してAdobe Experience Platformにデータを取り込むようになります。

azcopy のインストール場所にあるターミナルを開き、次のコマンドを実行して AEP のデータランディングゾーンにファイルをコピーします。

``./azcopy copy <your-local-file> <your SASUri>``

SASUri は必ず二重引用符で囲みます。 置換 `<your-local-file>` ファイルのローカルコピーのパス **global-context-websiteinteractions.csv** azcopy ディレクトリで、 `<your SASUri>` を **佐須里** Adobe Experience Platform UI からコピーした値。 コマンドは次のようになります。

```command
./azcopy copy global-context-websiteinteractions.csv "https://sndbxdtlnd2bimpjpzo14hp6.blob.core.windows.net/dlz-user-container?sv=2020-04-08&si=dlz-xxxxxxx-9843-4973-ae52-xxxxxxxx&sr=c&sp=racwdlm&sig=DN3kdhKzard%2BQwKASKg67Zxxxxxxxxxxxxxxxx"
```

ターミナルで上記のコマンドを実行すると、次のように表示されます。

![dlz-exec-copy-command.png](./images/dlz-exec-copy-command.png)

## 2.5.4 データランディングゾーンでのファイルの参照

Adobe Experience Platformのデータランディングゾーンに移動します。

選択 **ソース**、を検索します。 **データランディング** をクリックし、 **設定** 」ボタンをクリックします。

![dlz-inspect-datalanding-zone.png](./images/dlz-inspect-datalanding-zone.png)

データランディングゾーンが開きます。 アップロードしたファイルがデータランディングゾーンの **データを選択** パネル。

![dlz-datalanding-zone-open.png](./images/dlz-datalanding-zone-open.png)

## 2.5.5 ファイルの処理

ファイルを選択し、を選択します。 **区切り** をデータ形式として設定します。 次に、データのプレビューが表示されます。 「**次へ**」をクリックします。

![dlz-datalanding-select-file.png](./images/dlz-datalanding-select-file.png)

これで、アップロードしたデータのマッピングを開始して、データセットの XDM スキーマに一致させることができます。

選択 **既存のデータセット** をクリックし、データセットを選択します。 **デモシステム — Web サイトのイベントデータセット (Global v1.1)**. 「**次へ**」をクリックします。

![dlz-target-dataset.png](./images/dlz-target-dataset.png)

これで、csv ファイルからの受信ソースデータを、データセットの XDM スキーマのターゲットフィールドにマッピングする準備が整いました。

![dlz-start-mapping.png](./images/dlz-start-mapping.png)

>[!NOTE]
>
> マッピングで発生する可能性のあるエラーは気にしないでください。 次の手順でマッピングを修正します。

## 2.5.6 フィールドのマッピング

まず、 **すべてのマッピングをクリア** 」ボタンをクリックします。 その後、クリーンなマッピングから始めることができます。

![dlz-clear-mappings.png](./images/mappings1.png)

次に、「 **新しいフィールドタイプ** 次に、 **新しいフィールドを追加**.

![dlz-clear-mappings.png](./images/dlz-clear-mappings.png)

次の手順で **ecid** ソースフィールド、フィールドを選択します。 **identities.ecid** をクリックし、 **選択**.

![dlz-map-identity.png](./images/dlz-map-identity.png)

次に、「 **ターゲットフィールドをマッピング**.

![dlz-map-select-target-field.png](./images/dlz-map-select-target-field.png)

フィールドを選択 ``--aepTenantId--``.identification.core.ecid を使用して、スキーマ構造に含めることができます。

![dlz-map-target-field.png](./images/dlz-map-target-field.png)

他のフィールドをマッピングする必要がある場合は、「 **+新しいフィールドタイプ** 続いて **新しいフィールドを追加** このマッピングのフィールドを追加

| ソース | target（ターゲット文字列） |
|---|---|
| resource.info.pagename | web.webPageDetails.name |
| timestamp | timestamp |
| timestamp | _id |

![dlz-add-other-mapping.png](./images/dlz-add-other-mapping.png)

終了すると、次の画面のようになります。 「**次へ**」をクリックします。

![dlz-mapping-result.png](./images/dlz-mapping-result.png)

「**次へ**」をクリックします。

![dlz-default-scheduling.png](./images/dlz-default-scheduling.png)

「**完了**」をクリックします。

![dlz-import-finish.png](./images/dlz-import-finish.png)

## 2.5.7 データフローの監視

データフローを監視するには、に移動します。 **ソース**, **データフロー** 次に、データフローをクリックします。

![dlz-monitor-dataflow.png](./images/dlz-monitor-dataflow.png)

データの読み込みには、数分かかる場合があります。成功すると、ステータスは **成功**:

![dlz-monitor-dataflow-result.png](./images/dlz-monitor-dataflow-result.png)

次のステップ： [概要とメリット](./summary.md)

[モジュール 2 に戻る](./data-ingestion.md)

[すべてのモジュールに戻る](../../overview.md)
