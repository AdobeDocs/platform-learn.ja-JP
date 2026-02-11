---
title: Cursor.ai を使用してプロジェクトを開発
description: Cursor.ai を使用してプロジェクトを開発
kt: 5342
doc-type: tutorial
source-git-commit: 2bfa7f4bee54df8411c96b001224d2986e9fcaf9
workflow-type: tm+mt
source-wordcount: '419'
ht-degree: 0%

---

# 1.7.2 Cursor.ai を使用してプロジェクトを開発する

## 1.7.2.1 ディレクトリとツールの設定

デスクトップで、`--aepUserLdap---commerce` という名前で新しいディレクトリを作成します。

![Commerceとエージェンティック ](./images/cursorai1.png)

フォルダを右クリックし、**フォルダに新しいターミナル** を選択します。

![Commerceとエージェンティック ](./images/cursorai2.png)

この画像が表示されます。

![Commerceとエージェンティック ](./images/cursorai3.png)

次に、既存の Github リポジトリを複製する必要があります。これは、[https://github.com/adobe/commerce-integration-starter-kit](https://github.com/adobe/commerce-integration-starter-kit) で確認できます。

このリポジトリーは、Adobeを使用したAdobe Developer App Builder統合スターターキットで、リアルタイムの接続信頼性を高め、Adobe Commerceと ERP、CRM、PIM などの他のバックオフィスシステムとの統合の市場投入までの時間を短縮します。

![Commerceとエージェンティック ](./images/cursorai4.png)

このリポジトリを複製する方法はいくつかあります。この例では、ターミナルが使用されます。

ターミナルウィンドウに次のコマンドを入力して実行します。

`git clone https://github.com/adobe/commerce-integration-starter-kit`

![Commerceとエージェンティック ](./images/cursorai5.png)

数秒後、この結果が表示されます。

![Commerceとエージェンティック ](./images/cursorai6.png)

次に、先ほど作成したフォルダーに移動します。 次のコマンドを入力して実行します。

`cd commerce-integration-starter-kit`

![Commerceとエージェンティック ](./images/cursorai7.png)

この画像が表示されます。

![Commerceとエージェンティック ](./images/cursorai8.png)

次に、Cursor.ai 用のCommerce拡張ツールを設定する必要があります。 次のコマンドを入力して実行します。

`aio commerce extensibility tools-setup`

![Commerceとエージェンティック ](./images/cursorai9.png)

**現在のディレクトリ** を選択します。

![Commerceとエージェンティック ](./images/cursorai10.png)

**カーソル** を選択します。

![Commerceとエージェンティック ](./images/cursorai11.png)

**npm** を選択します。

![Commerceとエージェンティック ](./images/cursorai12.png)

数分後、これが表示されます。

![Commerceとエージェンティック ](./images/cursorai13.png)

Cursor.ai 用のCommerce拡張ツールをインストールすることで、Cursor.ai 環境の一部として MCP サーバーが使用できるようになりました。 次の演習では、その MCP サーバーを使用して、App Builder プロジェクトの開発とデプロイを支援します。

## 1.7.2.2 Webhook の設定

この演習では、注文を作成したときに注文イベントをその Webhook にストリーミングできるように、設定する必要がある Webhook が必要です。 この演習では、[https://pipedream.com/requestbin](https://pipedream.com/requestbin) を使用してサンプルエンドポイントを使用します。

[https://pipedream.com/requestbin](https://pipedream.com/requestbin) に移動し、アカウントを作成してから、ワークスペースを作成します。 ワークスペースを作成すると、次のような情報が表示されます。

「**コピー**」をクリックして、URL をコピーします。 次の演習では、この URL を指定する必要があります。 この例の URL は `https://eodts05snjmjz67.m.pipedream.net` です。

![Cursor.ai + Commerce](./images/webhook1.png)

## 1.7.2.3 Cursor.ai

Cursor.ai を開きます。 **プロジェクトを開く** をクリックします。

![Cursor.ai + Commerce](./images/cursorai14.png)

作成したフォルダーに移動します。`--aepUserLdap---commerce` という名前を付ける必要があります。 そのフォルダーで、`commerce-integration-starter-kit` という名前のフォルダーを選択します。 「**開く**」をクリックします。

![Cursor.ai + Commerce](./images/cursorai15.png)

この画像が表示されます。 続行する前に、Cursor.ai で開いている最上位フォルダーが `commerce-integration-starter-kit` であることを確認してください。

![Cursor.ai + Commerce](./images/cursorai16.png)

`I would like to build an app that subscribes to order created events and sends them to a configurable URL with basic authentication`

## 次の手順

[Adobe Commerce用のインテリジェント開発者ツール ](./aiassisteddev.md){target="_blank"} に戻る

[ すべてのモジュールに戻る ](./../../../overview.md){target="_blank"}