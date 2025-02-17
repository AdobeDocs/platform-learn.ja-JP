---
title: Kafka Connect とAdobe Experience Platformシンクコネクタのインストールと設定
description: Kafka Connect とAdobe Experience Platformシンクコネクタのインストールと設定
kt: 5342
doc-type: tutorial
exl-id: 51ddfdfc-fa5c-4bf4-bfc2-b4a88b0b8a4d
source-git-commit: 3d61d91111d8693ab031fbd7b26706c02818108c
workflow-type: tm+mt
source-wordcount: '1080'
ht-degree: 0%

---

# 2.6.4 Kafka Connect とAdobe Experience Platformシンクコネクタのインストールと設定

## Adobe Experience Platform シンクコネクタのダウンロード

[https://github.com/adobe/experience-platform-streaming-connect/releases](https://github.com/adobe/experience-platform-streaming-connect/releases) にアクセスし、Adobe Experience Platform シンクコネクタの最新の公式リリースをダウンロードします。

![ カフカ ](./images/kc1.png)

ファイル **streaming-connect-sink-0.0.27-java-11.jar** をダウンロードします。

![ カフカ ](./images/kc1a.png)

ダウンロードファイル **streaming-connect-sink-0.0.27-java-11.jar** をデスクトップに配置します。

![ カフカ ](./images/kc2.png)

## Kafka 接続の設定

デスクトップ上の **Kafka_AEP** という名前のフォルダーに移動して、フォルダー `kafka_2.13-3.9.0/config` に移動します。
そのフォルダで、任意のテキスト エディタを使用してファイル **connect-distributed.properties** を開きます。

![ カフカ ](./images/kc3a.png)

テキストエディターで、34 行目と 35 行目に移動し、フィールド `key.converter.schemas.enable` と `value.converter.schemas.enable` を必ず `false` に設定します

```json
key.converter.schemas.enable=false
value.converter.schemas.enable=false
```

変更をこのファイルに保存します。

![ カフカ ](./images/kc3.png)

次に、フォルダー `kafka_2.13-3.1.0` に戻り、新しいフォルダーを手動で作成し、`connectors` という名前を付けます。

![ カフカ ](./images/kc4.png)

新しいフォルダを右クリックし、[**フォルダに新しい端子**] をクリックします。

![ カフカ ](./images/kc5.png)

その後、これが表示されます。 コマンド `pwd` を入力して、そのフォルダーのフルパスを取得します。 フルパスを選択し、クリップボードにコピーします。

![ カフカ ](./images/kc6.png)

テキスト エディタに戻り、ファイル **connect-distributed.properties** に移動し、最後の行（スクリーンショットの 89 行目）までスクロール ダウンします。 `# plugin.path=` で始まる行のコメントを解除（`#` を削除）して、`connectors` という名前のフォルダーへの完全なパスを貼り付ける必要があります。 結果は次のようになります。

`plugin.path=/Users/woutervangeluwe/Desktop/Kafka_AEP/kafka_2.13-3.9.0/connectors`

ファイル **connect-distributed.properties** への変更を保存し、テキスト エディタを閉じます。

![ カフカ ](./images/kc7.png)

次に、ダウンロードしたAdobe Experience Platform シンクコネクタの最新の公式リリースを、`connectors` という名前のフォルダーにコピーします。 前にダウンロードしたファイルの名前は **streaming-connect-sink-0.0.27-java-11.jar** で、`connectors` フォルダーに移動するだけです。

![ カフカ ](./images/kc8.png)

次に、**kafka_2.13-3.9.0** フォルダーのレベルで新しいターミナルウィンドウを開きます。 そのフォルダを右クリックして、[**フォルダに新しい端子**] をクリックします。

[ ターミナル ] ウィンドウで、次のコマンドを貼り付けます：`bin/connect-distributed.sh config/connect-distributed.properties` そして **Enter** をクリックします。 このコマンドは Kafka Connect を起動し、Adobe Experience Platformシンクコネクタのライブラリをロードします。

![ カフカ ](./images/kc9.png)

数秒後、次のようなメッセージが表示されます。

![ カフカ ](./images/kc10.png)

## Postmanを使用してAdobe Experience Platform シンクコネクタを作成します

Postmanを使用して Kafka Connect とやり取りできるようになりました。 それには、[ このPostman Collection](./../../../../assets/postman/postman_kafka.zip) をダウンロードし、デスクトップ上のローカルコンピューターに解凍します。 その後、`Kafka_AEP.postman_collection.json` というファイルが得られます。

![ カフカ ](./images/kc11a.png)

このファイルをPostmanに読み込む必要があります。 これを行うには、Postmanを開き、「**読み込み**」をクリックし、ファイル `Kafka_AEP.postman_collection.json` をポップアップにドラッグ&amp;ドロップして、「**読み込み**」をクリックします。

![ カフカ ](./images/kc11b.png)

このコレクションは、Postmanの左側のメニューにあります。 最初のリクエスト、**GETで利用可能な Kafka Connect コネクタ** をクリックして開きます。

![ カフカ ](./images/kc11c.png)

その後、これが表示されます。 青い **送信** ボタンをクリックすると、空の応答 `[]` ーが表示されます。 空の応答は、現在 Kafka Connect コネクタが定義されていないことが原因です。

![ カフカ ](./images/kc11.png)

コネクタを作成するには、をクリックして Kafka コレクションの 2 番目のリクエストを開き、**POST Create AEP Sink Connector** をクリックして **本文** に移動します。 その後、これが表示されます。 11 行目に **&quot;aep.endpoint&quot;: &quot;&quot;** と表示されている場合は、前の演習の最後に受け取った HTTP API ストリーミングエンドポイント URL を貼り付ける必要があります。 HTTP API ストリーミングエンドポイント URL は次のようになります。`https://dcs.adobedc.net/collection/63751d0f299eeb7aa48a2f22acb284ed64de575f8640986d8e5a935741be9067`

![ カフカ ](./images/kc12a.png)

貼り付けた後、リクエストの本文は次のようになります。 青い **送信** ボタンをクリックして、コネクタを作成します。 コネクタの作成についてすぐに応答を受け取ります。

![ カフカ ](./images/kc12.png)

最初のリクエスト、**GETで利用可能な Kafka Connect コネクタ** をクリックして再度開き、青い **送信** ボタンをもう一度クリックします。 これで、Kafka Connect コネクタが存在することがわかります。

![ カフカ ](./images/kc13.png)

次に、Kafka コレクションの 3 つ目のリクエストを開きます。**GET Kafka Connect コネクタのステータスの確認**。 青い **送信** ボタンをクリックすると、次のような応答が表示され、コネクタが実行中であることを示します。

![ カフカ ](./images/kc14.png)

## エクスペリエンスイベントの作成

フォルダ **kafka_2.13-3.9.0** を右クリックし、**フォルダに新しいターミナル** をクリックして、新しい **ターミナル** ウィンドウを開きます。

![ カフカ ](./images/kafka11.png)

次のコマンドを入力します。

`bin/kafka-console-producer.sh --broker-list 127.0.0.1:9092 --topic aep`

その後、これが表示されます。 改行してから Enter ボタンを押すと、新しいメッセージがトピック **aep** に送信されます。

![ カフカ ](./images/kc16.png)

メッセージを送信すると、Adobe Experience Platform シンクコネクタによって使用され、リアルタイムでAdobe Experience Platformに取り込まれます。

以下のエクスペリエンスイベントペイロードのサンプルを取得し、テキストエディターにコピーします。

```json
{
  "header": {
    "datasetId": "61fe23fd242870194a6d779c",
    "imsOrgId": "--aepImsOrgID--",
    "source": {
      "name": "Launch"
    },
    "schemaRef": {
      "id": "https://ns.adobe.com/experienceplatform/schemas/b0190276c6e1e1e99cf56c99f4c07a6e517bf02091dcec90",
      "contentType": "application/vnd.adobe.xed-full+json;version=1"
    }
  },
  "body": {
    "xdmMeta": {
      "schemaRef": {
        "id": "https://ns.adobe.com/experienceplatform/schemas/b0190276c6e1e1e99cf56c99f4c07a6e517bf02091dcec90",
        "contentType": "application/vnd.adobe.xed-full+json;version=1"
      }
    },
    "xdmEntity": {
      "eventType": "callCenterInteractionKafka",
      "_id": "",
      "timestamp": "2024-11-25T09:54:12.232Z",
      "_experienceplatform": {
        "identification": {
          "core": {
            "phoneNumber": ""
          }
        },
        "interactionDetails": {
          "core": {
            "callCenterAgent": {
              "callID": "Support Contact - 3767767",
              "callTopic": "contract",
              "callFeeling": "negative"
            }
          }
        }
      }
    }
  }
}
```

その後、これが表示されます。 2 つのフィールドを手動で更新する必要があります。

- **_id**: `--aepUserLdap--1234` のように、ランダムな id に設定してください
- **timestamp**：タイムスタンプを現在の日時に更新します
- **phoneNumber**：デモ web サイトで以前に作成したアカウントの phoneNumber を入力します。 これは、プロファイルビューアパネルの **ID** の下にあります。

また、次のフィールドを確認して更新する必要もあります。

- **datasetId**：データセット Demo System - Call Center 用イベントデータセット（グローバル v1.1）のデータセット ID をコピーする必要があります

![ カフカ ](./images/kc20ds.png)

- **imsOrgID**:IMS 組織 ID は `--aepImsOrgId--` です

>[!NOTE]
>
>フィールド **_id** は、データ取り込みごとに一意である必要があります。 複数のイベントを生成する場合は、フィールド **_id** を新しい一意の値に毎回更新するようにしてください。

すると、次のようになります。

![ カフカ ](./images/kc21.png)

次に、エクスペリエンスイベント全体をクリップボードにコピーします。 JSON ペイロードの空白を削除する必要があります。それには、オンラインツールを使用します。 [http://jsonviewer.stack.hu/](http://jsonviewer.stack.hu/) に移動して実行してください。

エクスペリエンスイベントをエディターに貼り付け、「**空白を削除**」をクリックします。

![ カフカ ](./images/kc22a.png)

次に、出力テキストをすべて選択し、クリップボードにコピーします。

![ カフカ ](./images/kc23.png)

ターミナルウィンドウに戻ります。

![ カフカ ](./images/kc16.png)

空白を含まない新しいペイロードをターミナルウィンドウに貼り付け、**Enter** をクリックします。

![ カフカ ](./images/kc23a.png)

次に、デモ Web サイトに戻り、ページを更新します。 これで、以下のように、プロファイルの **エクスペリエンスイベント** の下にエクスペリエンスイベントが表示されます。

![ カフカ ](./images/kc24.png)

>[!NOTE]
>
>コールセンターインタラクションをプロファイルビューアパネルに表示する場合は、[https://dsn.adobe.com](https://dsn.adobe.com) で、タブ **プロファイルビューア** に移動し、**イベント** の下に次の変数を含む新しい行を追加して、プロジェクトに以下のラベルとフィルターを追加する必要があります。
>- **イベントタイプラベル**：コールセンターインタラクション
>- **イベントタイプフィルター**:callCenterInteractionKafka
>- **タイトル**: `--aepTenantId--.interactionDetails.core.callCenterAgent.callID`

![ カフカ ](./images/kc25.png)

この演習は完了しました。

## 次の手順

[ 概要とメリット ](./summary.md){target="_blank"} に移動します。

[Apache Kafka からAdobe Experience Platformへのデータのストリーミング ](./aep-apache-kafka.md){target="_blank"} に戻る

[ すべてのモジュール ](./../../../../overview.md){target="_blank"} に戻る
