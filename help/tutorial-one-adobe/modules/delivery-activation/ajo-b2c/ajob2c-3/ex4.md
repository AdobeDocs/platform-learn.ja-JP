---
title: Offer Decisioning - デモ Web サイトを使用して意思決定をテストします
description: デモ Web サイトを使用して決定をテスト
kt: 5342
doc-type: tutorial
exl-id: ecfcdcc7-fc26-48f7-b3f8-6e97f8e1eee3
source-git-commit: 3d61d91111d8693ab031fbd7b26706c02818108c
workflow-type: tm+mt
source-wordcount: '379'
ht-degree: 3%

---

# 3.3.4 Adobe TargetとOffer Decisioningの組み合わせ

## 3.3.4.1 デモプロジェクトの共有可能なリンクを収集する

デモ Web サイトプロジェクトをAdobe Targetに読み込むには、まず、Adobe Targetでデモ Web サイトプロジェクトを読み込むための特別なリンクを収集する必要があります。

その場合は、[https://dsn.adobe.com/projects](https://builder.adobedemo.com/projects) にアクセスしてください。 Adobe IDでログインすると、このが表示されます。 Web サイトプロジェクトをクリックして開きます。

![RTCDP](./images/builder1.png)

この画面が表示されます。 **共有** に移動します。 **リンクを生成** をクリックし、リンクをクリップボードにコピーします。

![RTCDP](./images/builder2.png)

[https://bitly.com](https://bitly.com) に移動し、コピーしたリンクを貼り付けて、[**リンクを作成**] をクリックします。

![RTCDP](./images/builder4.png)

これで、次のような短縮リンクが表示されます。`https://adobe.ly/3PpGcFk` そのリンクは、次の演習で必要になります。

![RTCDP](./images/builder5.png)

## 3.3.4.2 収集

次に、[https://experiencecloud.adobe.com/](https://experiencecloud.adobe.com/) にアクセスして、Adobe Experience Cloud ホームページに移動します。 **ターゲット** をクリックします。

![RTCDP](./../../../../modules/delivery-activation/rtcdp-b2c/rtcdpb2c-3/images/excl.png)

**Adobe Target** のホームページには、既存のすべてのアクティビティが表示されます。 **アクティビティを作成** をクリックし、「**エクスペリエンスのターゲット設定**」をクリックします。

![RTCDP](./../../../../modules/delivery-activation/rtcdp-b2c/rtcdpb2c-3/images/exclatov.png)

次に、「**ビジュアル**」を選択し、「アクティビティ URL を入力 **フィールドに短縮リンクを貼り付け** す。 「**作成**」をクリックします。

![RTCDP](./images/exclatcrxt1.png)

デモ Web サイトプロジェクトが Visual Experience Composer に読み込まれるのが確認できます。

>[!NOTE]
>
>Web サイトが正しく読み込まれない場合は、Chrome Web ストアからChrome拡張機能 **Adobe Target VEC Helper** をインストールして有効にし、もう一度試してください。

![RTCDP](./images/vec1.png)

Disney+ オファーを保持する領域をクリックします。 必ず完全な **コンテナ** を選択します。 「**前に挿入**」をクリックし、「**オファーの決定**」を選択します。

![RTCDP](./images/vec3.png)

このポップアップが表示されます。 サンドボックス `--aepSandboxName--` を選択し、プレースメントを選択します **Web – 画像**。

![RTCDP](./images/vec4.png)

次に、決定 `--aepUserLdap-- - CitiSignal Decision` を選択します。 「**保存**」をクリックします。

![RTCDP](./images/vec5.png)

その後、これが表示されます。 **ルールを確認** をクリックします。

![RTCDP](./images/vec5a.png)

追加のテンプレートルール **URL**&#x200B;**contains**&#x200B;**your-project-name** を確認します。 「**保存**」をクリックします。

![RTCDP](./images/vec6.png)

その後、これが表示されます。 「**次へ**」をクリックします。

![RTCDP](./images/vec7.png)

オファーの名前を入力します。使用する名前：`--aepUserLdap-- - XT with Offers (VEC)`。 「**次へ**」をクリックします。

![RTCDP](./images/vec8.png)

その後、これが表示されます。 示されているように、**目標指標** を定義します。 **保存して閉じる** をクリックします。

![RTCDP](./images/vec9.png)

オファーが作成され、公開されます。 オファーが公開されたら、アクティブ化できます。

![RTCDP](./images/vec11.png)

## 次の手順

[3.3.5 に移動メールと SMS で決定を使用する ](./ex5.md){target="_blank"}

[Offer Decisioning](offer-decisioning.md){target="_blank"} に戻る

[ すべてのモジュール ](./../../../../overview.md){target="_blank"} に戻る
