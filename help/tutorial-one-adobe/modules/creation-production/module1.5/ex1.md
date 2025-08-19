---
title: Frame.io の基本を学ぶ
description: Frame.io の基本を学ぶ
role: Developer
level: Beginner
jira: KT-5342
doc-type: Tutorial
exl-id: 09e8fdfd-e02f-43ff-a4f4-fa92eb3f01a3
source-git-commit: 917ebcd2dd5d8316413a183bd2c1a048c090428c
workflow-type: tm+mt
source-wordcount: '466'
ht-degree: 0%

---

# 1.5.1 Frame.io の概要

>[!NOTE]
>
> 次のスクリーンショットは、使用されている特定の環境を示しています。 このチュートリアルを進めていくと、環境に異なる名前が付いている可能性が非常に高くなります。 このチュートリアルに登録したときに、使用する環境の詳細が提供されました。これらの手順に従ってください。

[https://next.frame.io/](https://next.frame.io/) に移動します。 環境 `--aepImsOrgName--` にログインしていることを確認します。

![Frame.io](./images/frameio1.png)

右環境にログインしていない場合は、左下隅のロゴをクリックし、をクリックして、使用する必要がある環境を選択します。

![Frame.io](./images/frameio2.png)

## ワークスペ 1.5.1.1 スとプロジェクトの作成

「**+ New Workspace**」をクリックします。

![Frame.io](./images/frameio3.png)

ワークスペース名には、`--aepUserLdap--` を使用します。 「**保存**」をクリックします。

![Frame.io](./images/frameio4.png)

これで、ワークスペースが作成されました。 次に、新しいプロジェクトを作成してください。 **+新規プロジェクト** をクリックします。

![Frame.io](./images/frameio5.png)

「**空白**」を選択し、`CitiSignal` という名前を使用します。 **新規プロジェクトを作成** をクリックします。

![Frame.io](./images/frameio6.png)

これで、プロジェクトが作成されました。 次に、プロジェクトにアセットをアップロードする必要があります。 **アップロード** をクリックします。

![Frame.io](./images/frameio7.png)

次のファイルをダウンロードします：[https://tech-insiders.s3.us-west-2.amazonaws.com/Frame.io_Assets.zip](https://tech-insiders.s3.us-west-2.amazonaws.com/Frame.io_Assets.zip) デスクトップにダウンロードし、デスクトップに展開します。

![Frame.io](./images/frameio8.png)

すべてのファイルを選択し、「**開く** をクリックします。

>[!NOTE]
>
>スクリーンショットからわかるように、現時点ではフォルダー **Sound Effects** は選択されていません。 これは、手動アップロードがフォルダーのアップロードをサポートしていないためです。 数分で Frame.io 転送アプリがインストールされ、そのフォルダーとそのファイルのアップロードに使用されます。

![Frame.io](./images/frameio9.png)

数分後、ファイルが Frame.io で使用できるようになります。

![Frame.io](./images/frameio10.png)

ファイルを手動でアップロードしましたが、Frame.io との間でファイルをアップロードおよびダウンロードする、より優れた迅速な方法があります。 Frame.io 転送アプリを使うのが一番です。

## 1.5.1.2 Frame.io 転送アプリのダウンロードと設定

[https://frame.io/transfer](https://frame.io/transfer) に移動し、お使いのコンピューターのバージョンをダウンロードします。

![Frame.io](./images/frameio11.png)

アプリケーションをインストールしてから開きます。

![Frame.io](./images/frameio12.png)

アプリケーションが開いたら、ログインする必要があります。 「**ログイン**」をクリックします。

![Frame.io](./images/frameio13.png)

Adobe アカウントのメールアドレスを入力し、「**やってみましょう**」をクリックします。

![Frame.io](./images/frameio14.png)

認証が成功したら、**Frame.io 転送アプリを開く** をクリックします。

![Frame.io](./images/frameio15.png)

この画像が表示されます。 正しい環境を選択するには、をクリックしてドロップダウンリストを開きます。

![Frame.io](./images/frameio16.png)

このチュートリアルで使用する必要がある環境（`--aepImsOrgName--`）を選択します。

![Frame.io](./images/frameio17.png)

これにより、以前に作成したワークスペースとプロジェクトが、手動でアップロードしたファイルと共に表示されます。

**アップロード** をクリックします。

![Frame.io](./images/frameio18.png)

以前に使用したフォルダーに移動します。これには、以前にダウンロードした解凍されたファイルが含まれています。 フォルダー **サウンドエフェクト** を選択し、**アップロード** をクリックします。

![Frame.io](./images/frameio19.png)

その後、ファイルがアップロードされます。

![Frame.io](./images/frameio20.png)

アップロードすると、Frame.io で新しいフォルダーが使用できるようになります。

![Frame.io](./images/frameio21.png)

## 次の手順

[1.5.2 Frame.io を使用した承認 ](./ex2.md){target="_blank"} に移動

[Frame.io によるワークフローの効率化 ](./frameio.md){target="_blank"} に戻る

[ すべてのモジュール ](./../../../overview.md){target="_blank"} に戻る
