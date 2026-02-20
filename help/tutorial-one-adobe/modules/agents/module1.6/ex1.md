---
title: Content Production Agent
description: Content Production Agent
kt: 5342
doc-type: tutorial
exl-id: cb1bf6f0-f329-4e38-ba64-36ffdc3b8bd4
source-git-commit: 7ea3bdc9557ea9e88ddd9693f9ffbfbc634857f8
workflow-type: tm+mt
source-wordcount: '859'
ht-degree: 1%

---

# 1.6.1 AEM Agents の概要

>[!IMPORTANT]
>
>この演習を行うには、EDS 環境で動作するAEM SitesとAssets CS にアクセスし、使用している IMS 組織で様々なAEM エージェントを有効にする必要があります。
>
>そのような環境がまだない場合は、[Adobe Experience Manager、Cloud Service、Edge Delivery Services](./../../../modules/asset-mgmt/module2.1/aemcs.md){target="_blank"} の演習に進んでください。 指示に従うと、そのような環境にアクセスできます。

>[!IMPORTANT]
>
>以前、AEM CS プログラムをAEM SitesとAssets CS 環境で設定したことがある場合は、AEM CS サンドボックスが休止状態になっている可能性があります。 このようなサンドボックスの休止解除には 10～15 分かかるので、後で待つ必要がないように、今すぐ休止解除プロセスを開始することをお勧めします。

## 1.6.1.1 Discovery Agent

Adobe Experience Manager（AEM） Discovery Agent は、AEM as a Cloud Service内の AI を活用したツールで、自然言語プロンプトを使用して（Assets、コンテンツフラグメント、アダプティブFormsなどの）コンテンツを検索、取得、利用できます。 リポジトリ全体の目的を把握して検索することで、手動、クリックが多い、複雑なフィルタリングの必要性がなくなります。

**Discovery Agent** を使用するには、まずAdobe Experience Managerでいくつかのタグを作成し、次にそれらのタグを使用して一部のアセットにタグを付けます。 その後、AI アシスタントを使用して、ビジネスに適した簡単な方法でアセットを検出できます。

[https://my.cloudmanager.adobe.com](https://my.cloudmanager.adobe.com){target="_blank"} に移動します。 選択する組織は `--aepImsOrgName--` です。

### Assetsでのタグの作成と使用

クリックすると、Cloud Manager プログラムが開きます。このプログラムは `--aepUserLdap-- - CitiSignal AEM+ACCS` と呼ばれます。

![AEM エージェント &#x200B;](./images/aemagents1.png)

環境の URL をクリックして開きます。

![AEM エージェント &#x200B;](./images/aemagents2.png)

**ハンマー** アイコンをクリックします。

![AEM エージェント &#x200B;](./images/aemagents3.png)

**一般** の下の **タグ付け** をクリックします。

![AEM エージェント &#x200B;](./images/aemagents4.png)

この画像が表示されます。 **作成** をクリックし、「**名前空間を作成**」を選択します。

![AEM エージェント &#x200B;](./images/aemagents5.png)

**タイトル** フィールドに、`CitiSignal` と入力します。 「**作成**」をクリックします。

![AEM エージェント &#x200B;](./images/aemagents6.png)

名前空間 **CitiSignal** をクリックしてドリルダウンします。 **作成** をクリックし、「**タグを作成**」を選択します。

![AEM エージェント &#x200B;](./images/aemagents7.png)

**タイトル** フィールドに、`Campaign` と入力します。 「**送信**」をクリックします。

![AEM エージェント &#x200B;](./images/aemagents8.png)

タグ **Campaign** をクリックして選択します。 **作成** をクリックし、「**タグを作成**」を選択します。

![AEM エージェント &#x200B;](./images/aemagents9.png)

**タイトル** フィールドに、`Winter 2026` と入力します。 「**送信**」をクリックします。

![AEM エージェント &#x200B;](./images/aemagents10.png)

タグ **Campaign** をクリックして選択します。 **作成** をクリックし、「**タグを作成**」を選択します。

![AEM エージェント &#x200B;](./images/aemagents11.png)

**タイトル** フィールドに、`Spring 2026` と入力します。 「**送信**」をクリックします。

![AEM エージェント &#x200B;](./images/aemagents12.png)

これで、このが得られます。

![AEM エージェント &#x200B;](./images/aemagents13.png)

**Adobe Experience Manager**&#x200B;**Assets&rbrace; の順にクリックし** す。

![AEM エージェント &#x200B;](./images/aemagents14.png)

**ファイル** をクリックします。

![AEM エージェント &#x200B;](./images/aemagents15.png)

フォルダー **CitiSignal** をダブルクリックして開きます。

![AEM エージェント &#x200B;](./images/aemagents16.png)

**作成** をクリックし、**ファイル** を選択します。

![AEM エージェント &#x200B;](./images/aemagents17.png)

ファイル [citisignal-images-campaign.zip](./assets/citisignal-images-campaign.zip) をダウンロードし、デスクトップに解凍します。

![AEM エージェント &#x200B;](./images/aemagents17a.png)

を選択します。 ダウンロードした 3 つのファイルをクリックして **開く**。

![AEM エージェント &#x200B;](./images/aemagents18.png)

**アップロード** をクリックします。

![AEM エージェント &#x200B;](./images/aemagents19.png)

この画像が表示されます。

![AEM エージェント &#x200B;](./images/aemagents20.png)

最初の画像を選択し、「**プロパティ**」をクリックします。

![AEM エージェント &#x200B;](./images/aemagents21.png)

タグの下にある **folder**-icon をクリックします。

![AEM エージェント &#x200B;](./images/aemagents22.png)

タグ **Spring 2026** を選択し、[**選択**] をクリックします。 これらの画像に対して、同じ手順を繰り返します。

- citisignal_lion.png
- citisignal_leopard.png
- citisignal_gorilla.png
- citisignal_rabbit.png

![AEM エージェント &#x200B;](./images/aemagents23.png)

すべての画像に対してそのタグを選択したら、**Experience Manager Assets** に移動します。

![AEM エージェント &#x200B;](./images/aemagents24.png)

使用しているリポジトリを選択します。

![AEM エージェント &#x200B;](./images/aemagents25.png)

**Assets** に移動し、フォルダー **CitiSignal** を開きます。

![AEM エージェント &#x200B;](./images/aemagents26.png)

最初の画像を開きます。

![AEM エージェント &#x200B;](./images/aemagents27.png)

「**承認済み**」を選択し、「**保存**」をクリックします。

![AEM エージェント &#x200B;](./images/aemagents28.png)

**タグ** の下に、以前に選択したタグが表示されます。

![AEM エージェント &#x200B;](./images/aemagents29.png)

このプロセスを繰り返して、4 つの画像がすべて承認されるようにします。

![AEM エージェント &#x200B;](./images/aemagents30.png)

次に、**マイワークスペース** に移動し、クリックして **AI アシスタント** を開きます。

![AEM エージェント &#x200B;](./images/aemagents31.png)

次のプロンプトを入力し、「**送信**」をクリックします。

```javascript
find all assets tagged with 'Spring 2026'
```

![AEM エージェント &#x200B;](./images/aemagents32.png)

複数のAEM Assets CS 環境にアクセスできる場合は、次のように表示されます。 使用する環境の提案された回答をクリックし、「**送信**」をクリックします。

![AEM エージェント &#x200B;](./images/aemagents34.png)

その後、同様の回答が表示されます。 アイコンをクリックして、AI アシスタントを全画面表示に展開します。

![AEM エージェント &#x200B;](./images/aemagents35.png)

回答を確認します。

![AEM エージェント &#x200B;](./images/aemagents36.png)

AI アシスタント ウィンドウ内から、これらのアセットをクリックして表示できます。

![AEM エージェント &#x200B;](./images/aemagents37.png)

その後、AEM Assets CS に直接移動します。

![AEM エージェント &#x200B;](./images/aemagents38.png)

その後、使用可能な他のメタデータも確認できます。

![AEM エージェント &#x200B;](./images/aemagents39.png)

## 1.6.1.2 Experience 実稼動エージェント

### コンテンツ更新

コンテンツ更新スキルは、コンテンツフラグメント、ページ、フォーム、アセットなどの既存のコンテンツを簡単に更新できます。 エージェントは、コンテンツ要素の更新、削除、置換、追加などのアクションを実行して、エクスペリエンスを正確かつ最新の状態に保つことができます。 入力は自然言語による説明にすることができます。Jira PDF やスクリーンショットで使用する場合は、入力も指定できます。

AI アシスタント画面に戻ります。

![AEM エージェント &#x200B;](./images/aemagents40.png)

次のプロンプトを入力し、「**送信**」をクリックします。

`Generate multiple social media formats (Instagram 1080x1920, Facebook 1200x630, Twitter 1200x675) for the third image`

![AEM エージェント &#x200B;](./images/aemagents40a.png)

数分後、同様の応答が表示されます。

![AEM エージェント &#x200B;](./images/aemagents41.png)

生成された画像を確認します。

![AEM エージェント &#x200B;](./images/aemagents42.png)

### フォームの作成

フォーム作成スキルを使用すると、開発チームや IT チームに依存することなく、自然言語プロンプトを通じてアダプティブフォームを作成できます。 この機能は、ブランドの一貫性を維持しながらフォームの開発を促進し、ビジネスユーザーが技術的な深い知識がなくてもフォームを作成できるようにします。


## 次の手順

[AEMとエージェント &#x200B;](./aemagents.md){target="_blank"} に戻る

[&#x200B; すべてのモジュールに戻る &#x200B;](./../../../overview.md){target="_blank"}
