---
title: Web サイトへのBrand Conciergeの実装
description: Web サイトへのBrand Conciergeの実装
kt: 5342
doc-type: tutorial
source-git-commit: fb1fc5c72723cc4e1ede87f90410feb0cc314eea
workflow-type: tm+mt
source-wordcount: '1347'
ht-degree: 0%

---

# 1.4.2 Web サイトへのBrand Conciergeの実装

>[!IMPORTANT]
>
>この演習を行うには、動作しているAEM Assets CS オーサー環境とAEM CS/EDS Web サイトにアクセスできる必要があります。
>
>そのような環境がない場合は、[Adobe Experience Manager Cloud ServiceおよびEdge Delivery Services](./../../../modules/asset-mgmt/module2.1/aemcs.md){target="_blank"} に移動します。 指示に従うと、そのような環境にアクセスできます。

>[!IMPORTANT]
>
>以前にAEM CS プログラムをAEM Assets CS 環境で設定している場合は、AEM CS サンドボックスが休止状態になっている可能性があります。 このようなサンドボックスの休止解除には 10～15 分かかるので、後で待つ必要がないように、今すぐ休止解除プロセスを開始することをお勧めします。

## 1.4.2.1 Brand Concierge - AEM オーサーを表示するように web サイトを設定する

Brand Conciergeを web サイトに表示するには、新しいページに追加する必要がある新しいカスタムブロックを作成し、新しいページが web サイトのナビゲーションに追加されていることを確認する必要があります。

次の項目をこの順序で設定する必要があります。

- Web サイトにBrand Conciergeを読み込むために使用する、新しいカスタムブロックを作成します。
- Web サイトにBrand Conciergeの新しいページを作成します。
- 新しく作成したBrand Conciergeページに新しく作成したカスタムブロックをリンクします。
- Web サイトのナビゲーションヘッダーファイルで新しく作成したBrand Conciergeページに移動するための参照を追加します。

### 新しいカスタムブロックを作成

新しいカスタムブロックを作成するには、Web サイトにリンクされている GitHub リポジトリに移動します。

![&#x200B; ブロック &#x200B;](./images/block1.png)

#### component-definition.json

ファイル **component-definition.json** が表示されるまで下にスクロールして開きます

![&#x200B; ブロック &#x200B;](./images/block8.png)

**pencl** アイコンをクリックして、ファイルの編集を開始します。

![&#x200B; ブロック &#x200B;](./images/block8a.png)

**ブロック** が表示されるまで下にスクロールします。 カーソルをコンポーネントの閉じブラケットの下に置きます **カード**

![&#x200B; ブロック &#x200B;](./images/block9.png)

このコードを貼り付け、コードのブロックの後にコンマ **,** を入力します。

```json
{
  "title": "BrandConcierge",
  "id": "brandconcierge",
  "plugins": {
    "xwalk": {
      "page": {
        "resourceType": "core/franklin/components/block/v1/block",
        "template": {
          "name": "BrandConcierge",
          "model": "brandconcierge"
        }
      }
    }
  }
},
```

「**変更をコミット…**」をクリックします。

![&#x200B; ブロック &#x200B;](./images/block10.png)

「**変更をコミット**」をクリックします。

![&#x200B; ブロック &#x200B;](./images/block10a.png)

#### component-models.json

ファイル **component-models.json** が表示されるまで下にスクロールし、**鉛筆** アイコンをクリックしてファイルの編集を開始します。

![&#x200B; ブロック &#x200B;](./images/block11.png)

最後の項目が表示されるまで下にスクロールします。 最後のコンポーネントの閉じブラケットの隣にカーソルを置きます。

![&#x200B; ブロック &#x200B;](./images/block12.png)

コンマ **,** を入力し、enter キーを押して、次の行に次のコードをペーストします。

```json
{
  "id": "brandconcierge",
  "fields": []
}
```

「**変更をコミット…**」をクリックします。

![&#x200B; ブロック &#x200B;](./images/block13.png)

「**変更をコミット**」をクリックします。

![&#x200B; ブロック &#x200B;](./images/block13a.png)

#### component-filters.json

ファイル **component-filters.json** が表示されるまで下にスクロールし、「**鉛筆**」アイコンをクリックしてファイルの編集を開始します。

![&#x200B; ブロック &#x200B;](./images/block14.png)

この画像が表示されます。

![&#x200B; ブロック &#x200B;](./images/block14a.png)

**セクション** の下で、コンマ `,` を入力し、現在の最後の行の後にコンポーネント `"brandconcierge"` の ID を貼り付けます。

「**変更をコミット…**」をクリックします。

![&#x200B; ブロック &#x200B;](./images/block15.png)

「**変更をコミット**」をクリックします。

![&#x200B; ブロック &#x200B;](./images/block15a.png)

#### brandconcierge.css

ブロックを作成するときは、ブロックのスタイルを設定するためのファイルを作成することをお勧めします。このファイルには、ブロックと同じ名前を付ける必要があります。 そのファイルを作成します。ここでは空のままにします。

**blocks** フォルダーに移動します。 次に、「**ファイルを追加**」をクリックし、「**新しいファイルを作成**」を選択します。

![&#x200B; ブロック &#x200B;](./images/css1.png)

テキストボックスに `brandconcierge/brandconcierge.css` と入力します。 ファイルは今のところ空のままです。 「**変更をコミット…**」をクリックします。

![&#x200B; ブロック &#x200B;](./images/css2.png)

「**変更をコミット**」をクリックします。

![&#x200B; ブロック &#x200B;](./images/css3.png)

#### brandconcierge.js

ブロックを作成するときは、ブロックに関連する Javascript 用のファイルを作成することをお勧めします。このファイルには、ブロックと同じ名前を付ける必要があります。

**ファイルを追加** をクリックし、「**新しいファイルを作成**」を選択します。

![&#x200B; ブロック &#x200B;](./images/js1.png)

テキストボックスに `brandconcierge.js` と入力します。 ファイルは今のところ空のままです。 「**変更をコミット…**」をクリックします。

```javascript
export default function decorate(block) {
  block.setAttribute('id', 'brand-concierge-mount');
}
```

![&#x200B; ブロック &#x200B;](./images/js2.png)

「**変更をコミット**」をクリックします。

![&#x200B; ブロック &#x200B;](./images/js3.png)

### 新しいページを作成して新しいカスタムブロックをリンク

[https://my.cloudmanager.adobe.com](https://my.cloudmanager.adobe.com){target="_blank"} に移動します。 **プログラム** をクリックして開きます。

![AEMCS](./images/aemcs6.png)

次に、「**環境**」タブの 3 つのドット **...** をクリックし、「**詳細を表示**」をクリックします。

![AEMCS](./images/aemcs9.png)

その後、環境の詳細が表示されます。 **オーサー** 環境の URL をクリックします。

>[!NOTE]
>
>環境が休止状態になっている可能性があります。 その場合は、まず環境の休止状態を解除する必要があります。 休止状態を解除する方法については、以下のビデオを参照してください。

>[!VIDEO](https://video.tv.adobe.com/v/3478141?quality=12&learn=on)

![AEMCS](./images/aemcs10.png)

AEM オーサー環境が表示されます。 **サイト** に移動します。

![AEMCS](./images/block21.png)

**CitiSignal** に移動します。 **作成** をクリックし、「**ページ**」を選択します。

![AEMCS](./images/block23.png)

**ページ** を選択し、「**次へ**」をクリックします。

![AEMCS](./images/block24.png)

次の値を入力します。

- タイトル：**Brand Concierge**
- 名前：**brandconcierge**
- ページタイトル：**Brand Concierge**

「**作成**」をクリックします。

![AEMCS](./images/block25.png)

**開く** を選択します。

![AEMCS](./images/block22.png)

この画像が表示されます。

![AEMCS](./images/block26.png)

空白領域をクリックして、「**セクション**」コンポーネントを選択します。 次に、右側のメニューのプラス **+** アイコンをクリックします。

![AEMCS](./images/block27.png)

カスタムブロックが、使用可能なブロックのリストに表示されます。 クリックして選択します。

![AEMCS](./images/block28.png)

このページに空のブロックが追加されているのが確認できます。 このブロックは、次の手順で追加する javascript ライブラリを使用して動的に読み込まれます。

「**公開**」をクリックします。

![AEMCS](./images/block29.png)

もう一度 **公開** をクリックします。

![AEMCS](./images/block30.png)

これで新しいページが公開され、次の手順でナビゲーションヘッダーに追加できるようになります。

### ナビゲーションヘッダーファイルを更新

AEM Sitesの概要で **CitiSignal** に移動し、「Header/nav **ファイルのチェックボックスをオンに** ます。 「**編集**」をクリックします。

![AEMCS](./images/nav0.png)

プレビュー画面で **テキスト** フィールドを選択し、画面の右側にある **テキスト** フィールドをクリックして編集します。

![AEMCS](./images/nav0a.png)

ナビゲーションメニューに新しいメニューオプションをテキスト `Brand Concierge` で作成します。 次に、テキスト「**Brand Concierge**」を選択し、「**リンク** アイコンをクリックします。

![AEMCS](./images/nav1.png)

フィールド **パスまたは URL** に `/content/CitiSignal/brandconcierge.html` これを入力し、フィールド `Brand Concierge` タイトル **に** を入力します。 「**保存**」をクリックします。

![AEMCS](./images/nav3.png)

これで完了です。 「**完了**」をクリックします。

![AEMCS](./images/nav4.png)

これで完了です。 「**公開**」をクリックします。

![AEMCS](./images/nav4a.png)

もう一度 **公開** をクリックします。

![AEMCS](./images/nav5.png)

これで、新しいページがメニューに追加されました。

## 1.4.2.2 Brand Conciergeを表示するように web サイトを設定する – GitHub

AEM オーサー環境を使用してコンテンツを更新した後、web サイトで使用する GitHub リポジトリーのコードの一部を更新する必要があります。

### Javascript ライブラリ

AEM CS/EDS で動作する web サイトにBrand Conciergeを実装するには、次のライブラリが必要です。

- [styleconfigurations.js](./assets/styleconfigurations.js)
- [alloy.js](./assets/alloy.js)
- [brandconciergemain.js](./assets/brandconciergemain.js)

3 つのファイルをすべてデスクトップにダウンロードします。

![Brand Concierge](./images/aem0.png)

AEM CS/EDS web サイトの GitHub プロジェクトに移動します。 **スクリプト** に移動します。

![Brand Concierge](./images/aem1.png)

**ファイルを追加** をクリックし、「**ファイルをアップロード**」を選択します。

![Brand Concierge](./images/aem3.png)

**ファイルを選択** をクリックします。

![Brand Concierge](./images/aem3a.png)

デスクトップから 3 つのファイル **styleConfigurations.js、alloy.js、brandconciergemain.js** をすべて選択し、「**開く**」をクリックします。

![Brand Concierge](./images/aem4.png)

「**変更をコミット**」をクリックします。

![Brand Concierge](./images/aem5.png)

### head.html を更新

前の手順では、3 つの新しいライブラリをアップロードしました。 これらのライブラリは、web サイトが読み込まれる際に読み込む必要があります。その方法は、これらのファイルへの参照をファイル **head.html** に追加することです。

さらに、ライブラリが正しい順序で正しく読み込まれるように **head.html** ファイルで指示を指定する必要もあります。

それには、AEM CS/EDS web サイトの GitHub プロジェクトで「**コード**」をクリックします。

![Brand Concierge](./images/aem6.png)

少し下にスクロールします。 ファイル **head.html** を開きます。

![Brand Concierge](./images/aem7.png)

**鉛筆** アイコンをクリックして、このファイルを編集します。

![Brand Concierge](./images/aem8.png)

この画像が表示されます。

![Brand Concierge](./images/aem9.png)

43 行目までスクロールして、次を貼り付けます。

以下のコードには、更新が必要な 2 つのフィールドがあります。

>[!IMPORTANT]
>
>- **datastreamId** は現在「XXXXX」に設定されており、前の手順で作成したデータストリームの ID に置き換える必要があります。
>- **orgId** は、Adobe Experience Cloud インスタンスの IMS 組織 ID に置き換える必要があります。

```javascript
<script src="/scripts/styleconfigurations.js"></script>

<script>
		!function (n, o) {
      o.forEach(function (o) {
        n[o] || ((n.__alloyNS = n.__alloyNS ||
          []).push(o), n[o] = function () {
            var u = arguments; return new Promise(
              function (i, l) { n[o].q.push([i, l, u]) })
          }, n[o].q = [])
      })
    }
      (window, ["alloy"]);
	</script>


<script src="/scripts/alloy.js"></script>

<script>
	alloy("configure", {
		defaultConsent: "in",
        edgeDomain: "edge.adobedc.net",
        edgeBasePath: "ee",
        datastreamId: "XXXXX", // replace datastreamId
        orgId: "--aepImsOrgId--", // replace ims org Id
        debugEnabled: true,
        idMigrationEnabled: false,
        thirdPartyCookiesEnabled: false,
        prehidingStyle: ".personalization-container { opacity: 0 !important }",
    });

window["alloy"]("sendEvent", {
    conversation: {
        fetchConversationalExperience: true
    }
}).then(result => {
    console.log("Conversation experience fetched", result);
    window["alloy"]("bootstrapConversationalExperience", {
        selector: "#brand-concierge-mount",
        src: "/scripts/brandconciergemain.js",
        stylingConfigurations: window.styleConfiguration,
        stickySession: true // create a sticky session cookie with expiration
    })
});
</script>
```

「**変更をコミット…**」をクリックします。

![Brand Concierge](./images/aem10.png)

「**変更をコミット**」をクリックします。

![Brand Concierge](./images/aem11.png)

これで、Web サイトにライブラリを読み込むために必要なコードが更新されました。

![Brand Concierge](./images/aem12.png)

## 1.4.2.3 設定をテストする

XXX を GitHub ユーザーアカウント（この例では `main--citisignal-aem-accs--XXX.aem.page`）に置き換えた後、`main--citisignal-aem-accs--XXX.aem.live` または `woutervangeluwe` に移動して、web サイトで変更をテストできるようになりました。

この例では、完全な URL は次のようになります。
`https://main--citisignal-aem-accs--woutervangeluwe.aem.page` や `https://main--citisignal-aem-accs--woutervangeluwe.aem.live`。

最初に公開する必要があるので、すべてのアセットが正しく表示されるまでには時間がかかる場合があります。

この画像が表示されます。 **Brand Concierge** をクリックします。

![Brand Concierge](./images/aem13.png)

プロンプトを入力できるこのBrand Conciergeが表示されます。

![Brand Concierge](./images/aem14.png)

[Brand Concierge](./brandconcierge.md){target="_blank"} に戻る

[&#x200B; すべてのモジュールに戻る &#x200B;](./../../../overview.md){target="_blank"}