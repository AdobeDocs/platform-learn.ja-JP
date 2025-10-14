---
title: Cloud Manager プログラムの作成
description: Cloud Manager プログラムの作成
kt: 5342
doc-type: tutorial
exl-id: fda247eb-1865-4936-b46e-84128ccab357
source-git-commit: 7384eabe00354374f7012be10c24870c68ea7f2c
workflow-type: tm+mt
source-wordcount: '344'
ht-degree: 3%

---

# 1.1.1 Cloud Manager プログラムを作成する

[https://my.cloudmanager.adobe.com](https://my.cloudmanager.adobe.com){target="_blank"} に移動します。 選択する組織は `--aepImsOrgName--` です。 次のようなメッセージが表示されます。 「**プログラムを追加**」をクリックします。

![AEMCS](./images/aemcs1.png)

**プログラム名** には、`--aepUserLdap-- - CitiSignal AEM+ACCS` を使用します。 「**サンドボックスを設定**」オプションを選択します。 「**続行**」をクリックします。

![AEMCS](./images/aemcs2.png)

次のオプションが選択されていることを確認します。

- サイト
- フォーム
- アセット

**Assets** の矢印をクリックして、オプションのリストを開きます。

![AEMCS](./images/aemcs3.png)

次のオプションが選択されていることを確認します。

- Content Hub

リストを下にスクロールします。

![AEMCS](./images/aemcs3a.png)

次のオプションが選択されていることを確認します。

- Edge 配信サービス
- Dynamic Media

「**作成**」をクリックします。

![AEMCS](./images/aemcs3b.png)

環境の作成には時間がかかります（10 ～ 20 分）。

![AEMCS](./images/aemcs4.png)

環境が作成され、使用する準備が整うと、確認のメールが届きます。その後、ここに戻ることができます。

![AEMCS](./images/aemcs5.png)

メールによる確認を受け取ったら、[https://my.cloudmanager.adobe.com](https://my.cloudmanager.adobe.com){target="_blank"} に戻ります。 その後、プログラムのステータスが **準備完了** に変更されたことがわかります。 プログラムをクリックして開きます。

![AEMCS](./images/aemcs6.png)

「パイプライン **タブを確認し** す。 3 つのドット **...** をクリックし、「**実行** をクリックします。

![AEMCS](./images/aemcs7.png)

**実行** をクリックします。

![AEMCS](./images/aemcs8.png)

次に、「**環境**」タブの 3 つのドット **...** をクリックし、「**詳細を表示**」をクリックします。

![AEMCS](./images/aemcs9.png)

次の演習で必要とする **オーサー** 環境の URL など、環境の詳細が表示されます。

**Content Hub** の行を見て、「**クリックして有効化**」を選択します。

![AEMCS](./images/aemcs10.png)

**アクティブ化** をクリックします。

![AEMCS](./images/aemcsact1.png)

**Content Hub** のライセンス認証が開始されました。 これには 10 分以上かかる場合があります。

![AEMCS](./images/aemcsact2.png)

約 10 分後に、**Content Hub** のライセンス認証が行われます。
次に、「**Dynamic Media**」行を見て、「**クリックして有効化**」を選択します。

![AEMCS](./images/aemcsact3.png)

**アクティブ化** をクリックします。

![AEMCS](./images/aemcsact4.png)

**Dynamic Media** のアクティベーションが開始されました。 これには 10 分以上かかる場合があります。

![AEMCS](./images/aemcsact5.png)

約 10 分後、**Dynamic Media** のアクティベーションが行われます。

![AEMCS](./images/aemcsact6.png)

パイプラインの実行が完了したら、次の演習に進むことができます。

次の手順：[AEM CS 環境のセットアップ &#x200B;](./ex2.md){target="_blank"}

[Adobe Experience Manager Cloud ServiceとEdge Delivery Services](./aemcs.md){target="_blank"} に戻る

[&#x200B; すべてのモジュールに戻る &#x200B;](./../../../overview.md){target="_blank"}
