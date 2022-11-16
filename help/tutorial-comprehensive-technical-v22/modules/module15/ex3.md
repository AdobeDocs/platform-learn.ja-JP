---
title: Adobe Experience Platformでの HTTP API エンドポイントの設定
description: Adobe Experience Platformでの HTTP API エンドポイントの設定
kt: 5342
audience: Data Engineer, Data Architect, Data Analyst
doc-type: tutorial
activity: develop
exl-id: 3346c57b-3a78-40b1-a891-053fc8781659
source-git-commit: cc7a77c4dd380ae1bc23dc75608e8e2224dfe78c
workflow-type: tm+mt
source-wordcount: '321'
ht-degree: 9%

---

# 15.3 Adobe Experience Platformでの HTTP API ストリーミングエンドポイントの設定

Kafka でAdobe Experience Platform Sink コネクタを設定する前に、Adobe Experience Platformで HTTP API ソースコネクタを作成する必要があります。 Adobe Experience Platform Sink Connector を設定するには、HTTP API ストリーミングエンドポイント URL が必要です。

HTTP API ソースコネクタを作成するには、次の URL に移動してAdobe Experience Platformにログインします。 [https://experience.adobe.com/platform](https://experience.adobe.com/platform).

ログイン後、Adobe Experience Platformのホームページに移動します。

![データ取得](../module2/images/home.png)

続行する前に、 **サンドボックス**. 選択するサンドボックスの名前はです ``--aepSandboxId--``. これを行うには、 **[!UICONTROL 実稼動版]** 画面の上の青い線で表示されます。 適切なサンドボックスを選択すると、画面が変更され、専用のサンドボックスに移動します。

![データ取得](../module2/images/sb1.png)

左側のメニューで、に移動します。 **ソース** をクリックし、 **ソースカタログ** 見るまで **HTTP API**. クリック **データを追加**.

![データ取得](./images/kaep1.png)

クリック **新しいアカウント**. 用途 `--demoProfileLdap-- - Kafka` を HTTP API 接続の名前として使用する ( この場合は **バンジェルウ — カフカ**. チェックボックスを有効にする **XDM 互換**. クリック **ソースに接続**.

![データ取得](./images/kaep2.png)

次に、「 **次へ**.

![データ取得](./images/kaep3.png)

選択 **既存のデータセット**&#x200B;をクリックし、ドロップダウンメニューを開きます。 データセットを検索して選択します。 **デモシステム — コールセンターのイベントデータセット（グローバル v1.1）**.

![データ取得](./images/kaep4.png)

「**次へ**」をクリックします。

![データ取得](./images/kaep6.png)

「**次へ**」をクリックします。

![データ取得](./images/kaep7.png)

「**完了**」をクリックします。

![データ取得](./images/kaep8.png)

作成した HTTP API ソースコネクタの概要が表示されます。

![データ取得](./images/kaep9.png)

次の項目をコピーする必要があります： **ストリーミングエンドポイント** 次の演習で必要になる URL です。URL は以下のように表示されます。

`https://dcs.adobedc.net/collection/d282bbfc8a540321341576275a8d052e9dc4ea80625dd9a5fe5b02397cfd80dc`

この練習は終わりました。

次のステップ： [15.4 Kafka Connect とAdobe Experience Platform Sink Connector のインストールと設定](./ex4.md)

[モジュール 15 に戻る](./aep-apache-kafka.md)

[すべてのモジュールに戻る](../../overview.md)
