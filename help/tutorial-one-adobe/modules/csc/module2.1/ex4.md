---
title: AEM CS – 基本カスタムブロック
description: AEM CS – 基本カスタムブロック
kt: 5342
doc-type: tutorial
exl-id: 57c08a88-d885-471b-ad78-1dba5992da9d
source-git-commit: 2f53c8da2cbe833120fa6555c65b8b753bfa4f8d
workflow-type: tm+mt
source-wordcount: '813'
ht-degree: 2%

---

# 2.1.4 基本的なカスタムブロックの作成

## 2.1.4.1 ローカル開発環境の設定

[https://desktop.github.com/download/](https://desktop.github.com/download/){target="_blank"} に移動し、**Github デスクトップ** をダウンロードしてインストールします。

![ ブロック ](./images/block1.png)

Github デスクトップがインストールされたら、前の演習で作成した GitHub リポジトリに移動します。 「**&lt;> コード」をクリックしてから** 「**GitHub デスクトップで開く**」をクリックします。

![ ブロック ](./images/block2.png)

GitHub リポジトリは、GitHub デスクトップで開かれます。 **ローカルパス** を自由に変更できます。 **クローン** をクリックします。

![ ブロック ](./images/block3.png)

これで、ローカルフォルダーが作成されます。

![ ブロック ](./images/block4.png)

Visual Studio Code を開きます。 **File**/**Open Folder** に移動します。

![ ブロック ](./images/block5.png)

**citisignal** 用の GitHub 設定で使用するフォルダーを選択します。

![ ブロック ](./images/block6.png)

Visual Studio Code でそのフォルダーが開いていることが確認できます。新しいブロックを作成する準備が整いました。

![ ブロック ](./images/block7.png)

## 2.1.4.2 基本的なカスタムブロックの作成

Adobeでは、次の 3 つの段階アプローチでブロックを開発することをお勧めします。

- ブロックの定義とモデルを作成し、レビューして、実稼動環境に取り込みます。
- 新しいブロックでコンテンツを作成します。
- 新しいブロックの装飾とスタイルを実装します。

### component-definition.json

Visual Studio Code で、ファイル **component-definition.json** を開きます。

![ ブロック ](./images/block8.png)

コンポーネント **Quote** が表示されるまで下にスクロールします。 最後のコンポーネントの閉じブラケットの隣にカーソルを置きます。

![ ブロック ](./images/block9.png)

このコードを貼り付け、コードのブロックの後にコンマ **,** を入力します。

```json
{
  "title": "FiberOffer",
  "id": "fiberoffer",
  "plugins": {
    "xwalk": {
      "page": {
        "resourceType": "core/franklin/components/block/v1/block",
        "template": {
          "name": "FiberOffer",
          "model": "fiberoffer",
          "offerText": "<p>Fiber will soon be available in your region!</p>",
          "offerCallToAction": "Get your offer now!",
          "offerImage": ""
        }
      }
    }
  }
}
```

変更を保存します。

![ ブロック ](./images/block10.png)

### component-models.json

Visual Studio Code で、ファイル **component-models.json** を開きます。

![ ブロック ](./images/block11.png)

最後の項目が表示されるまで下にスクロールします。 最後のコンポーネントの閉じブラケットの隣にカーソルを置きます。

![ ブロック ](./images/block12.png)

コンマ **,** を入力し、enter キーを押して、次の行に次のコードをペーストします。

```json
{
  "id": "fiberoffer",
  "fields": [
     {
       "component": "richtext",
       "name": "offerText",
       "value": "",
       "label": "Offer Text",
       "valueType": "string"
     },
     {
       "component": "richtext",
       "valueType": "string",
       "name": "offerCallToAction",
       "label": "Offer CTA",
       "value": ""
     },
     {
       "component": "reference",
       "valueType": "string",
       "name": "offerImage",
       "label": "Offer Image",
        "multi": false
     }
   ]
}
```

変更を保存します。

![ ブロック ](./images/block13.png)

### component-filters.json

Visual Studio Code で、ファイル **component-filters.json** を開きます。

![ ブロック ](./images/block14.png)

**セクション** で、コンマ **,** を入力し、現在の最後の行の後にコンポーネントの ID **フィバーオファー** を入力します。

変更を保存します。

![ ブロック ](./images/block15.png)

## 2.1.4.3 変更をコミットする

これで、プロジェクトで、GitHub リポジトリにコミットして戻す必要のある変更をいくつか加えました。 それには、**GitHub デスクトップ** を開きます。

編集した 3 つのファイルが「変更 **の下に表示され** す。 変更をレビューします。

![ ブロック ](./images/block16.png)

PR、`Fiber Offer custom block` の名前を入力します。 「**メインにコミット**」をクリックします。

![ ブロック ](./images/block17.png)

この画像が表示されます。 **接触チャネルをプッシュ** をクリックします。

![ ブロック ](./images/block18.png)

数秒後に、変更が GitHub リポジトリにプッシュされます。

![ ブロック ](./images/block19.png)

ブラウザーで、GitHub アカウントと、CitiSignal 用に作成したリポジトリに移動します。 変更を受け取ったことを示す、次のようなメッセージが表示されます。

![ ブロック ](./images/block20.png)

## 2.1.4.4 ページにブロックを追加する

基本的な引用ブロックが定義され、CitiSignal プロジェクトにコミットされたので、既存のページに **fiberoffer** ブロックを追加できます。

[https://my.cloudmanager.adobe.com](https://my.cloudmanager.adobe.com){target="_blank"} に移動します。 **プログラム** をクリックして開きます。

![AEMCS](./images/aemcs6.png)

次に、「**環境**」タブの 3 つのドット **...** をクリックし、「**詳細を表示**」をクリックします。

![AEMCS](./images/aemcs9.png)

その後、環境の詳細が表示されます。 **オーサー** 環境の URL をクリックします。

>[!NOTE]
>
>環境が休止状態になっている可能性があります。 その場合は、まず環境の休止状態を解除する必要があります。

![AEMCS](./images/aemcs10.png)

AEM オーサー環境が表示されます。 **サイト** に移動します。

![AEMCS](./images/block21.png)

**CitiSignal**/**us**/**en** に移動します。

![AEMCS](./images/block22.png)

**作成** をクリックし、「**ページ**」を選択します。

![AEMCS](./images/block23.png)

**ページ** を選択し、「**次へ**」をクリックします。

![AEMCS](./images/block24.png)

次の値を入力します。

- タイトル：**CitiSignal ファイバー**
- 名前：**citisignal-fiber**
- ページタイトル：**CitiSignal ファイバー**

「**作成**」をクリックします。

![AEMCS](./images/block25.png)

この画像が表示されます。

![AEMCS](./images/block26.png)

空白領域をクリックして、「**セクション**」コンポーネントを選択します。 次に、右側のメニューのプラス **+** アイコンをクリックします。

![AEMCS](./images/block27.png)

カスタムブロックが、使用可能なブロックのリストに表示されます。 クリックして選択します。

![AEMCS](./images/block28.png)

**オファーテキスト**、**オファーCTA**、**オファー画像** などのフィールドがエディターに追加されます。 **オファー画像** フィールドの「**+追加** をクリックして、画像を選択します。

![AEMCS](./images/block29.png)

この画像が表示されます。 クリックしてフォルダー **citisignal** を開きます。

![AEMCS](./images/blockpub1.png)

画像 **product-enrichment-1.png** を選択します。 「**選択**」をクリックします。

![AEMCS](./images/blockpub2.png)

これで完了です。 「**公開**」をクリックします。

![AEMCS](./images/blockpub3.png)

もう一度 **0}Publish} をクリックします。**

![AEMCS](./images/blockpub4.png)

これで、新しいページが公開されました。

## 2.1.4.5 新しいページをナビゲーションメニューに追加する

AEM Sitesの概要で、**CitiSignal**/**Fragments** に移動し、「**Header**」のチェックボックスをオンにします。 「**編集**」をクリックします。

![AEMCS](./images/nav0.png)

テキスト `Fiber` を使用して、ナビゲーションメニューにメニューオプションを追加します。 テキスト **Fibre** を選択し、「**リンク**」アイコンをクリックします。

![AEMCS](./images/nav1.png)

**URL** `/us/en/citisignal-fiber` に対してこれを入力し、**V** アイコンをクリックして確認します。

![AEMCS](./images/nav3.png)

これで完了です。 「**公開**」をクリックします。

![AEMCS](./images/nav4.png)

もう一度 **0}Publish} をクリックします。**

![AEMCS](./images/nav5.png)

XXX を GitHub ユーザーアカウント（この例では `woutervangeluwe`）に置き換えた後、`main--citisignal--XXX.aem.page/us/en` や `main--citisignal--XXX.aem.live/us/en` に移動して、web サイトの変更を表示できるようになりました。

この例では、完全な URL は次のようになります。
`https://main--citisignal--woutervangeluwe.aem.page/us/en` や `https://main--citisignal--woutervangeluwe.aem.live/us/en`。

この画像が表示されます。 **ファイバ** をクリックします。

![AEMCS](./images/nav6.png)

これが基本的なカスタムブロックですが、web サイトにレンダリングされています。

![AEMCS](./images/nav7.png)

次の手順：[2.1.5 詳細カスタムブロック ](./ex5.md){target="_blank"}

[ モジュール 2.1 に戻る ](./aemcs.md){target="_blank"}

[ すべてのモジュールに戻る ](./../../../overview.md){target="_blank"}
