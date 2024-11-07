---
title: Offer decisioning- デモ Web サイトを使用して意思決定をテストします
description: デモ Web サイトを使用して決定をテスト
kt: 5342
doc-type: tutorial
source-git-commit: 2cdc145d7f3933ec593db4e6f67b60961a674405
workflow-type: tm+mt
source-wordcount: '357'
ht-degree: 3%

---

# 3.3.4 Adobe TargetとOffer decisioningの組み合わせ

## 3.3.4.1 デモプロジェクトの共有可能なリンクを収集する

デモ Web サイトプロジェクトをAdobe Targetに読み込むには、まず、Adobe Targetでデモ Web サイトプロジェクトを読み込むための特別なリンクを収集する必要があります。

その場合は、[https://builder.adobedemo.com/projects](https://builder.adobedemo.com/projects) にアクセスしてください。 Adobe IDでログインすると、このが表示されます。 Web サイトプロジェクトをクリックして開きます。

![RTCDP](./images/builder1.png)

この画面が表示されます。 「**共有**」をクリックします。

![RTCDP](./images/builder2.png)

**リンクを生成** をクリックし、リンクをクリップボードにコピーします。

![RTCDP](./images/builder3.png)

[https://bitly.com](https://bitly.com) に移動し、コピーしたリンクを貼り付けて、[**短縮**] をクリックします。 これで、次のような短縮リンクが表示されます。`https://bit.ly/3JxN7aG` そのリンクは、次の演習で必要になります。

![RTCDP](./images/builder4.png)

## 3.3.4.2 収集

次に、[https://experiencecloud.adobe.com/](https://experiencecloud.adobe.com/) にアクセスして、Adobe Experience Cloud ホームページに移動します。 **ターゲット** をクリックします。

![RTCDP](./../../../modules/rtcdp-b2c/module2.3/images/excl.png)

**Adobe Target** のホームページには、既存のすべてのアクティビティが表示されます。

![RTCDP](./../../../modules/rtcdp-b2c/module2.3/images/exclatov.png)

「**+ アクティビティを作成**」をクリックして、新しいアクティビティを作成します。

![RTCDP](./../../../modules/rtcdp-b2c/module2.3/images/exclatcr.png)

**エクスペリエンスのターゲット設定** を選択します。

![RTCDP](./images/exclatcrxt.png)

次に、「**ビジュアル**」を選択し、「アクティビティ URL を入力 **フィールドに短縮リンクを貼り付け** す。 「**次へ**」をクリックします。

![RTCDP](./images/exclatcrxt1.png)

デモ Web サイトプロジェクトが Visual Experience Composer に読み込まれるのが確認できます。

![RTCDP](./images/vec1.png)

**参照** モードに移動し、cookie の同意ポップアップで **すべて許可** をクリックします。

![RTCDP](./images/vec2.png)

テキスト **おすすめカテゴリ** を含む領域をクリックします。 「**前に挿入**」をクリックし、「**オファーの決定**」を選択します。

![RTCDP](./images/vec3.png)

このポップアップが表示されます。 サンドボックス `--aepSandboxId--` を選択し、プレースメントを選択します **Web – 画像**。

![RTCDP](./images/vec4.png)

次に、決定 `--demoProfileLdap-- - Luma Decision` を選択します。 「**保存**」をクリックします。

![RTCDP](./images/vec5.png)

その後、これが表示されます。 追加のテンプレートルール **URL****contains****your-project-name** を確認します。 **保存** をクリックします。

![RTCDP](./images/vec6.png)

その後、これが表示されます。 「**次へ**」をクリックします。

![RTCDP](./images/vec7.png)

オファーの名前を入力します。使用する名前：`--demoProfileLdap-- - XT with Offers (VEC)`。 「**次へ**」をクリックします。

![RTCDP](./images/vec8.png)

その後、これが表示されます。 示されているように、**目標指標** を定義します。 **保存して閉じる** をクリックします。

![RTCDP](./images/vec9.png)

オファーが作成され、公開されます。

![RTCDP](./images/vec10.png)

オファーが公開されたら、有効にできます。

次の手順：[3.3.5 メールと SMS で決定を使用する ](./ex5.md)

[モジュール 3.3 に戻る](./offer-decisioning.md)

[すべてのモジュールに戻る](./../../../overview.md)
