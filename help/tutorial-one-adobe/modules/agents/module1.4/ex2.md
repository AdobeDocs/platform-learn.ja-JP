---
title: Web サイトへのBrand Conciergeの実装
description: Web サイトへのBrand Conciergeの実装
kt: 5342
doc-type: tutorial
exl-id: 21c388b0-3604-448d-8d82-514a032e34f8
source-git-commit: f3a365b1453ee34d9649202bdb523624a469b623
workflow-type: tm+mt
source-wordcount: '1349'
ht-degree: 1%

---

# 1.4.2 web サイトへのBrand Conciergeの実装

>[!IMPORTANT]
>
>この演習を完了するには、作業中のAEM Assets CS オーサー環境とAEM CS/EDS web サイトにアクセスする必要があります。
>
>そのような環境がない場合は、[Adobe Experience Manager Cloud ServiceとEdge Delivery Services](./../../../modules/asset-mgmt/module2.1/aemcs.md){target="_blank"}に移動します。 そこに記載されている手順に従うと、そのような環境にアクセスできるようになります。

>[!IMPORTANT]
>
>AEM Assets CS環境でAEM CS プログラムを既に設定している場合は、AEM CS サンドボックスが休止状態になっている可能性があります。 このようなサンドボックスの休止解除には10～15分かかることを考えると、後で待つ必要がないように、今すぐ休止解除プロセスを開始することをお勧めします。

## 1.4.2.1 Brand Conciergeを表示するようにweb サイトを設定 – AEM オーサー

Brand Conciergeをweb サイトに表示するには、新しいページに追加する必要がある新しいカスタムブロックを作成する必要があり、新しいページがweb サイトのナビゲーションに追加されていることを確認する必要があります。

次の項目をこの順序で設定する必要があります。

- Web サイトにBrand Conciergeを読み込むために使用する新しいカスタムブロックを作成します。
- Brand Concierge用にweb サイトに新しいページを作成します。
- 新しく作成したBrand Concierge ページで、新しく作成したカスタムブロックをリンクします。
- Web サイトのナビゲーションヘッダーファイルで、新しく作成したBrand Concierge ページに移動するための参照を追加します。

### 新しいカスタムブロックを作成

新しいカスタムブロックを作成するには、web サイトにリンクされているGitHub リポジトリに移動します。

![&#x200B; ブロック &#x200B;](./images/block1.png)

#### component-definition.json

ファイル **component-definition.json**&#x200B;が表示されるまで下にスクロールして開きます

![&#x200B; ブロック &#x200B;](./images/block8.png)

**pencl** アイコンをクリックして、ファイルの編集を開始します。

![&#x200B; ブロック &#x200B;](./images/block8a.png)

**ブロック**&#x200B;が表示されるまで下にスクロールします。 コンポーネント **カード**&#x200B;の閉じ括弧の下にカーソルを設定します

![&#x200B; ブロック &#x200B;](./images/block9.png)

このコードを貼り付け、コードブロックの後にコンマ **,**&#x200B;を入力します。

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

ファイル **component-models.json**&#x200B;が表示されるまで下にスクロールし、**鉛筆** アイコンをクリックしてファイルの編集を開始します。

![&#x200B; ブロック &#x200B;](./images/block11.png)

最後の項目が表示されるまで下にスクロールします。 最後のコンポーネントの閉じ括弧の横にカーソルを設定します。

![&#x200B; ブロック &#x200B;](./images/block12.png)

コンマ **,**&#x200B;を入力し、Enter キーを押して次の行に次のコードを貼り付けます：

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

ファイル **component-filters.json**&#x200B;が表示されるまで下にスクロールし、**鉛筆** アイコンをクリックしてファイルの編集を開始します。

![&#x200B; ブロック &#x200B;](./images/block14.png)

そうすると、これが表示されます。

![&#x200B; ブロック &#x200B;](./images/block14a.png)

**セクション**&#x200B;で、コンマ `,`を入力し、現在の最終行の後にコンポーネント `"brandconcierge"`のIDを貼り付けます。

「**変更をコミット…**」をクリックします。

![&#x200B; ブロック &#x200B;](./images/block15.png)

「**変更をコミット**」をクリックします。

![&#x200B; ブロック &#x200B;](./images/block15a.png)

#### brandconcierge.css

ブロックを作成する場合は、ブロックのスタイル設定のためのファイルを作成することをお勧めします。ブロックと同じ名前にする必要があります。 このファイルを作成する必要があります。今は空のままにしておきます。

**ブロック** フォルダーに移動します。 次に、**ファイルを追加**&#x200B;をクリックし、**新しいファイルを作成**&#x200B;を選択します。

![&#x200B; ブロック &#x200B;](./images/css1.png)

テキストボックスに「`brandconcierge/brandconcierge.css`」と入力します。 ファイルは今のところ空のままです。 「**変更をコミット…**」をクリックします。

![&#x200B; ブロック &#x200B;](./images/css2.png)

「**変更をコミット**」をクリックします。

![&#x200B; ブロック &#x200B;](./images/css3.png)

#### brandconcierge.js

ブロックを作成する場合は、ブロックに関連するJavaScript用のファイルを作成することをお勧めします。ブロックと同じ名前にする必要があります。

**ファイルを追加**&#x200B;をクリックし、**新しいファイルを作成**&#x200B;を選択します。

![&#x200B; ブロック &#x200B;](./images/js1.png)

テキストボックスに「`brandconcierge.js`」と入力します。 ファイルは今のところ空のままです。 「**変更をコミット…**」をクリックします。

```javascript
export default function decorate(block) {
  block.setAttribute('id', 'brand-concierge-mount');
}
```

![&#x200B; ブロック &#x200B;](./images/js2.png)

「**変更をコミット**」をクリックします。

![&#x200B; ブロック &#x200B;](./images/js3.png)

### 新しいページを作成し、新しいカスタムブロックをリンクする

[https://my.cloudmanager.adobe.com](https://my.cloudmanager.adobe.com){target="_blank"}に移動します。 **プログラム**&#x200B;をクリックして開きます。

![AEMCS](./images/aemcs6.png)

次に、**環境** タブの3つのドット **...**&#x200B;をクリックし、**詳細を表示**&#x200B;をクリックします。

![AEMCS](./images/aemcs9.png)

環境の詳細が表示されます。 **Author**&#x200B;環境のURLをクリックします。

>[!NOTE]
>
>環境が休止状態になっている可能性があります。 そのような場合は、まず環境の休止を解除する必要があります。 休止状態を解除する方法については、以下のビデオを参照してください。

>[!VIDEO](https://video.tv.adobe.com/v/3478141?quality=12&learn=on)

![AEMCS](./images/aemcs10.png)

次に、AEM オーサー環境が表示されます。 **Sites**&#x200B;に移動します。

![AEMCS](./images/block21.png)

**CitiSignal**&#x200B;に移動します。 **作成**&#x200B;をクリックし、**ページ**&#x200B;を選択します。

![AEMCS](./images/block23.png)

**ページ**&#x200B;を選択し、**次へ**&#x200B;をクリックします。

![AEMCS](./images/block24.png)

次の値を入力します。

- タイトル：**Brand Concierge**
- 名前：**brandconcierge**
- ページタイトル：**Brand Concierge**

「**作成**」をクリックします。

![AEMCS](./images/block25.png)

「**開く**」を選択します。

![AEMCS](./images/block22.png)

そうすると、これが表示されます。

![AEMCS](./images/block26.png)

空白の領域をクリックして、**セクション** コンポーネントを選択します。 次に、右側のメニューのプラス **+** アイコンをクリックします。

![AEMCS](./images/block27.png)

次に、利用可能なブロックのリストにカスタムブロックが表示されます。 クリックして選択します。

![AEMCS](./images/block28.png)

次に、空のブロックがこのページに追加されます。 このブロックは、次の手順で追加するjavacript ライブラリを使用して動的に読み込まれます。

「**公開**」をクリックします。

![AEMCS](./images/block29.png)

**公開**&#x200B;をもう一度クリックします。

![AEMCS](./images/block30.png)

これで新しいページが公開され、次の手順でナビゲーションヘッダーに追加できるようになりました。

### ナビゲーションヘッダーファイルを更新

AEM Sitesの概要で、**CitiSignal**&#x200B;に移動し、ファイル **Header/nav**&#x200B;のチェックボックスをオンにします。 「**編集**」をクリックします。

![AEMCS](./images/nav0.png)

プレビュー画面で「**テキスト**」フィールドを選択し、画面の右側にある「**テキスト**」フィールドをクリックして編集します。

![AEMCS](./images/nav0a.png)

ナビゲーションメニューにテキスト `Brand Concierge`を含む新しいメニューオプションを作成します。 次に、**Brand Concierge**&#x200B;というテキストを選択し、**リンク** アイコンをクリックします。

![AEMCS](./images/nav1.png)

フィールド **パスまたはURL** `/content/CitiSignal/brandconcierge.html`に対してこれを入力し、フィールド `Brand Concierge` タイトル **に**&#x200B;と入力します。 「**保存**」をクリックします。

![AEMCS](./images/nav3.png)

では、これを使ってください。 「**完了**」をクリックします。

![AEMCS](./images/nav4.png)

では、これを使ってください。 「**公開**」をクリックします。

![AEMCS](./images/nav4a.png)

**公開**&#x200B;をもう一度クリックします。

![AEMCS](./images/nav5.png)

新しいページがメニューに追加されました。

## 1.4.2.2 Brand Conciergeを表示するようにweb サイトを構成する – GitHub

AEM オーサー環境を使用してコンテンツを更新した後、web サイトに使用されるGitHub リポジトリ内のコードの一部を更新する必要があります。

### Javascript ライブラリ

AEM CS/EDSで動作するweb サイトにBrand Conciergeを実装するには、次のライブラリが必要です。

- [styleconfigurations.js](./assets/styleconfigurations.js)
- [alloy.js](./assets/alloy.js)
- [brandconciergemain.js](./assets/brandconciergemain.js)

3つのファイルをすべてデスクトップにダウンロードします。

![Brand Concierge](./images/aem0.png)

AEM CS/EDS web サイトのGitHub プロジェクトに移動します。 **スクリプト**&#x200B;に移動します。

![Brand Concierge](./images/aem1.png)

「**ファイルを追加**」をクリックし、「**ファイルをアップロード**」を選択します。

![Brand Concierge](./images/aem3.png)

**ファイルを選択**&#x200B;をクリックします。

![Brand Concierge](./images/aem3a.png)

デスクトップから3つのファイル **styleConfigurations.js、alloy.js、brandconciergemain.js**&#x200B;をすべて選択し、**開く**&#x200B;をクリックします。

![Brand Concierge](./images/aem4.png)

「**変更をコミット**」をクリックします。

![Brand Concierge](./images/aem5.png)

### head.htmlを更新

前の手順では、3つの新しいライブラリをアップロードしました。 これらのライブラリは、web サイトの読み込み時に読み込む必要があります。そのための方法は、これらのファイルへの参照を&#x200B;**head.html** ファイルに追加することです。

さらに、**head.html** ファイルで手順を指定して、ライブラリが正しい順序で正しい方法で読み込まれるようにすることも必要です。

これを行うには、**Code**&#x200B;をクリックして、AEM CS/EDS web サイトのGitHub プロジェクトに移動します。

![Brand Concierge](./images/aem6.png)

少し下にスクロールします。 ファイル **head.html**&#x200B;を開きます。

![Brand Concierge](./images/aem7.png)

**鉛筆** アイコンをクリックして、このファイルを編集します。

![Brand Concierge](./images/aem8.png)

そうすると、これが表示されます。

![Brand Concierge](./images/aem9.png)

43行目まで下にスクロールして、次の項目を貼り付けます。

以下のコードには、更新が必要な2つのフィールドがあります。

>[!IMPORTANT]
>
>- **datastreamId**&#x200B;は現在「XXXXX」に設定されており、前の手順で作成したデータストリームのIDに置き換える必要があります。
>- **orgId**&#x200B;は、Adobe Experience Cloud インスタンスのIMS組織IDに置き換える必要があります。

```javascript
<script nonce="aem" src="/scripts/styleconfigurations.js"></script>

<script nonce="aem">
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


<script nonce="aem" src="/scripts/alloy.js"></script>

<script nonce="aem">
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

これで、web サイトにライブラリを読み込むために必要なコードが更新されました。

![Brand Concierge](./images/aem12.png)

## 1.4.2.3設定をテストします

これで、XXXをGitHub ユーザーアカウントに置き換えた後、`main--citisignal-aem-accs--XXX.aem.page`または`main--citisignal-aem-accs--XXX.aem.live`に移動して、web サイトで変更をテストできるようになります。この例では`woutervangeluwe`です。

この例では、完全なURLは次のようになります。
`https://main--citisignal-aem-accs--woutervangeluwe.aem.page`または`https://main--citisignal-aem-accs--woutervangeluwe.aem.live`。

すべてのアセットを正しく表示するには、最初に公開する必要があるため、時間がかかる場合があります。

そうすると、これが表示されます。 **Brand Concierge**&#x200B;をクリックします。

![Brand Concierge](./images/aem13.png)

次に、このBrand Conciergeが表示され、プロンプトを入力できます。

![Brand Concierge](./images/aem14.png)

## 次の手順

[Brand Concierge](./brandconcierge.md){target="_blank"}に戻る

[すべてのモジュールに戻る](./../../../overview.md){target="_blank"}
