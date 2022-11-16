---
title: offer decisioning — デモ Web サイトを使用して決定をテストする
description: デモ Web サイトを使用して決定をテストする
kt: 5342
audience: Data Engineer, Data Architect, Orchestration Engineer, Marketer
doc-type: tutorial
activity: develop
exl-id: cdb2ba7d-bfc3-43ce-b9a1-1f0866322589
source-git-commit: cc7a77c4dd380ae1bc23dc75608e8e2224dfe78c
workflow-type: tm+mt
source-wordcount: '358'
ht-degree: 4%

---

# 9.4Adobe TargetとOffer decisioningの結合

## 9.4.1 デモプロジェクトの共有可能なリンクを収集する

Adobe Targetでデモ Web サイトプロジェクトを読み込むには、まずAdobe Targetがデモ Web サイトプロジェクトを読み込めるようにする特別なリンクを収集する必要があります。

それには、に移動します。 [https://builder.adobedemo.com/projects](https://builder.adobedemo.com/projects). Adobe IDでログインすると、次の内容が表示されます。 Web サイトプロジェクトをクリックして開きます。

![RTCDP](./images/builder1.png)

これが見えます 「**共有**」をクリックします。

![RTCDP](./images/builder2.png)

クリック **リンクを生成** 次に、リンクをクリップボードにコピーします。

![RTCDP](./images/builder3.png)

に移動します。 [https://bitly.com](https://bitly.com)、コピーしたリンクを貼り付けて、 **短縮**. 短縮リンクが表示されます。次のようになります。 `https://bit.ly/3JxN7aG`. 次の演習では、このリンクが必要になります。

![RTCDP](./images/builder4.png)

## 9.4.2 収集

次に、Adobe Experience Cloudのホームページで、 [https://experiencecloud.adobe.com/](https://experiencecloud.adobe.com/). クリック **ターゲット**.

![RTCDP](../module6/images/excl.png)

の **Adobe Target** ホームページには、既存のすべてのアクティビティが表示されます。

![RTCDP](../module6/images/exclatov.png)

クリック **+アクティビティを作成** をクリックして、新しいアクティビティを作成します。

![RTCDP](../module6/images/exclatcr.png)

選択 **エクスペリエンスのターゲット設定**.

![RTCDP](./images/exclatcrxt.png)

今すぐ選択 **ビジュアル** 短縮リンクを「 」フィールドに貼り付けます。 **アクティビティ URL を入力**. 「**次へ**」をクリックします。

![RTCDP](./images/exclatcrxt1.png)

次に、Visual Experience Composer にデモ Web サイトプロジェクトが読み込まれていることがわかります。

![RTCDP](./images/vec1.png)

に移動します。 **参照** クリックのモード **すべて許可** cookie の同意ポップアップが表示されます。

![RTCDP](./images/vec2.png)

テキストを含む領域をクリックします。 **注目のカテゴリ**. クリック **前に挿入** 次に、 **オファーの決定**.

![RTCDP](./images/vec3.png)

その後、このポップアップが表示されます。 サンドボックスを選択 `--aepSandboxId--` 配置を選択します。 **Web — 画像**.

![RTCDP](./images/vec4.png)

次に、決定を選択します `--demoProfileLdap-- - Luma Decision`. 「**保存**」をクリックします。

![RTCDP](./images/vec5.png)

これが見えます 「追加のテンプレートルールを追加」をオンにします。 **URL** **次を含む** **your-project-name**. クリック **保存**.

![RTCDP](./images/vec6.png)

これが見えます 「**次へ**」をクリックします。

![RTCDP](./images/vec7.png)

オファーの名前を入力します。この名前を使用します。 `--demoProfileLdap-- - XT with Offers (VEC)`. 「**次へ**」をクリックします。

![RTCDP](./images/vec8.png)

これが見えます を定義 **目標指標** 示されているように 「**保存して閉じる**」をクリックします。

![RTCDP](./images/vec9.png)

これでオファーが作成され、公開されます。

![RTCDP](./images/vec10.png)

オファーを公開したら、有効にできます。

次のステップ： [9.5 決定を電子メールと SMS で使用する](./ex5.md)

[モジュール 9 に戻る](./offer-decisioning.md)

[すべてのモジュールに戻る](./../../overview.md)
