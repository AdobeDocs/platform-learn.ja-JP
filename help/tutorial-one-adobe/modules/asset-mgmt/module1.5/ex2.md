---
title: ACCS をAEM Sites CS/EDS ストアフロントに接続する
description: ACCS をAEM Sites CS/EDS ストアフロントに接続する
kt: 5342
doc-type: tutorial
source-git-commit: b39cc993120ba6feecbfc044d40e066f9d8f91de
workflow-type: tm+mt
source-wordcount: '520'
ht-degree: 0%

---

# 1.5.2 ACCS をAEM Sites CS/EDS ストアフロントに接続する

>[!IMPORTANT]
>
>この演習を完了するには、EDS 環境を使用して動作するAEM SitesとAssets CS にアクセスできる必要があります。
>
>そのような環境がまだない場合は、[Adobe Experience Manager、Cloud Service、Edge Delivery Services](./../../../modules/asset-mgmt/module2.1/aemcs.md){target="_blank"} の演習に進んでください。 指示に従うと、そのような環境にアクセスできます。

>[!IMPORTANT]
>
>以前、AEM CS プログラムをAEM SitesとAssets CS 環境で設定したことがある場合は、AEM CS サンドボックスが休止状態になっている可能性があります。 このようなサンドボックスの休止解除には 10～15 分かかるので、後で待つ必要がないように、今すぐ休止解除プロセスを開始することをお勧めします。

この演習では、AEM Sites CS/EDS ストアフロントを ACCS バックエンドにリンクします。 現時点では、AEM Sites CS/EDS Storefront を開いて **Phones** 商品リストページに移動しても、商品はまだ表示されません。

この実習の最後に、前の実習で構成した製品が、AEM Sites CS/EDS ストアフロントの **Phones** 製品リスト・ページに表示されます。

![ACCS+AEM Sites](./images/accsaemsites0.png)

[https://experience.adobe.com/](https://experience.adobe.com/){target="_blank"} に移動します。 `--aepImsOrgName--` という名前の環境が正しいことを確認します。 **Commerce** をクリックします。

![ACCS+AEM Sites](./images/accsaemsites1.png)

ACCS インスタンスの横にある **info** アイコンをクリックします。このアイコンの名前は `--aepUserLdap-- - ACCS` にする必要があります。

![ACCS+AEM Sites](./images/accsaemsites2.png)

この画像が表示されます。 **GraphQL エンドポイント** をコピーします。

![ACCS+AEM Sites](./images/accsaemsites3.png)

[https://da.live/app/adobe-commerce/storefront-tools/tools/config-generator/config-generator](https://da.live/app/adobe-commerce/storefront-tools/tools/config-generator/config-generator) に移動します。 次に、AEM Sites CS ストアフロントを ACCS バックエンドにリンクするために使用する config.json ファイルを生成する必要があります。

**Config Generator** ページに、コピーした **GraphQL エンドポイント** URL を貼り付けます。

**生成** をクリックします。

![ACCS+AEM Sites](./images/accsaemsites4.png)

生成された JSON ペイロード全体をコピーします。

![ACCS+AEM Sites](./images/accsaemsites5.png)

AEM Sites CS/EDS 環境の設定時に作成した GitHub リポジトリに移動します。 このリポジトリは、演習 [1.1.2 AEM CS 環境の設定で作成し ](./../../../modules/asset-mgmt/module2.1/ex3.md){target="_blank"}**citisignal-aem-accs** という名前にする必要があります。

![ACCS+AEM Sites](./images/accsaemsites6.png)

ルートディレクトリで、下にスクロールしてクリックし、**config.json** ファイルを開きます。

![ACCS+AEM Sites](./images/accsaemsites7.png)

**編集**&#x200B;アイコンをクリックします。

![ACCS+AEM Sites](./images/accsaemsites8.png)

現在のすべてのテキストを削除し、コピーした JSON ペイロードを **Config Generator** ページに貼り付けて置き換えます。

「**変更をコミット…**」をクリックします。

![ACCS+AEM Sites](./images/accsaemsites9.png)

**変更をコミット** をクリックします。

![ACCS+AEM Sites](./images/accsaemsites10.png)

**config.json** ファイルが更新されました。 数分以内に web サイトに変更が表示されます。 変更が正常に取得されたかどうかを確認するには、**Phones** 製品ページに移動します。 これで、**iPhone Air** がページに表示されます。

![ACCS+AEM Sites](./images/accsaemsites11.png)

製品の表示中は、まだ製品の画像を利用できません。 次の演習では、商品画像用のリンクをAEM Assets CS と設定します。

次の手順：[ACCS をAEM Assets CS に接続する ](./ex3.md){target="_blank"}

[Adobe Commerce as a Cloud Service](./accs.md){target="_blank"} に戻る

[ すべてのモジュールに戻る ](./../../../overview.md){target="_blank"}
