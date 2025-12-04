---
title: Data Collection Tags を使用したBrand Conciergeの実装
description: Data Collection Tags を使用したBrand Conciergeの実装
kt: 5342
doc-type: tutorial
source-git-commit: 3704abb57e9fa64c2ff6d6914b6da8b46a5f44aa
workflow-type: tm+mt
source-wordcount: '433'
ht-degree: 6%

---

# 1.4.3 Data Collection Tags を使用したBrand Conciergeの実装

>[!IMPORTANT]
>
>この演習は作業中で、まだ終了していません。

## データ収集タグのプロパティ

Brand Conciergeは、Adobe Experience Platformにデータを送信する必要があります。 それには、web SDK（または alloy.js）を web サイトにデプロイする必要があります。

これを可能にするには、データ収集タグプロパティを作成する必要があります。

[https://experience.adobe.com/](https://experience.adobe.com/){target="_blank"} に移動します。 **データ収集** を開きます。

![Brand Concierge](./images/aep101.png)

「**新規プロパティ**」をクリックします。

![Brand Concierge](./images/aep102.png)

`--aepUserLdap-- - CitiSignal Website + Brand Concierge` という名前を入力し、Web サイトのドメインも入力します。

「**保存**」をクリックします。

![Brand Concierge](./images/aep103.png)

プロパティを検索して開きます。

![Brand Concierge](./images/aep104.png)

**拡張機能** に移動し、**カタログ** に移動します。

![Brand Concierge](./images/aep105.png)

`web sdk` を検索し、拡張機能 **Adobe Experience Platform Web SDK** をクリックします。 **インストール** をクリックします。

![Brand Concierge](./images/aep106.png)

この画像が表示されます。 ここで必要なのは、データストリームの詳細を指定することだけです。 それには、少し下にスクロールします。

![Brand Concierge](./images/aep107.png)

3 つの環境 **実稼動**、**ステージング** および **開発** すべてについて、次の項目を選択してください。

- **サンドボックス**: `--aepUserLdap-- - bc`
- **データストリーム**: `--aepUserLdap-- - Brand Concierge`

「**保存**」をクリックします。

![Brand Concierge](./images/aep108.png)

この画像が表示されます。 **ルール** に移動します。

![Brand Concierge](./images/aep108a.png)

「**新規ルールを作成**」をクリックします。

![Brand Concierge](./images/aep109.png)

`Homepage` という名前を入力します。 次に、「**EVENTS**」の下の「**+追加**」をクリックします。

![Brand Concierge](./images/aep110.png)

次のオプションを選択します。

- **拡張機能**: **Core**
- **イベントタイプ**:**ライブラリが読み込まれました（ページのトップ）**

「**変更を保存**」をクリックします。

![Brand Concierge](./images/aep111.png)

この画像が表示されます。 **条件** の **+追加** をクリックします。

![Brand Concierge](./images/aep112.png)

次のオプションを選択します。

- **論理タイプ**: **標準**
- **拡張機能**: **Core**
- **条件タイプ**: **クエリ文字列のないパス**
- **パスが…と等しい**:web サイトのドメイン（この場合は `https://vangeluw.adobedemosystem.com/`）を入力します。

「**変更を保存**」をクリックします。

![Brand Concierge](./images/aep113.png)

この画像が表示されます。 **アクション** の下の「**+追加**」をクリックします。

![Brand Concierge](./images/aep114.png)

次のオプションを選択します。

- **拡張機能**: **Core**
- **アクションタイプ**:**カスタムコード**
- **言語**: **JavaScript**

**エディターを開く** をクリックします。

![Brand Concierge](./images/aep115.png)

次のコードを貼り付けます。

```javascript
window["alloy"]("sendEvent", {
        conversation: {fetchConversationalExperience: true}
    }).then(result=> {
        console.log("Conversation experience fetched", result);
        window["alloy"]("bootstrapConversationalExperience", {
            selector: "#brand-concierge-mount",
						// src: "main.js",
            src: "https://experience-stage.adobe.net/solutions/experience-platform-brand-concierge-web-agent/static-assets/main.js",
            stylingConfigurations: window.styleConfiguration,
						stickySession: true
        })
    });
```

「**保存**」をクリックします。

![Brand Concierge](./images/aep116.png)

この画像が表示されます。 「**変更を保存**」をクリックします。

![Brand Concierge](./images/aep117.png)

この画像が表示されます。 「**保存**」をクリックします。

![Brand Concierge](./images/aep118.png)

**公開フロー** に移動します。 **ライブラリを追加** をクリックします。

![Brand Concierge](./images/aep119.png)

`Dev` という名前を入力し、環境の **開発（開発）** を選択して、「**変更されたすべてのリソースを追加**」をクリックします。

「**保存して開発用にビルド**」をクリックします。

![Brand Concierge](./images/aep120.png)

数分後にライブラリが構築されます。 **開発** の横の **緑のドット** が表示されるまで待ちます。 次に、**環境** に移動します。

![Brand Concierge](./images/aep121.png)

**開発** 環境の **インストール** アイコンをクリックします。

![Brand Concierge](./images/aep122.png)

これを確認する必要があります。 「**コピー**」ボタンをクリックして、ライブラリのパスをコピーします。 これを web サイトに実装する必要があります。

ライブラリパスは次のようになります。
`<script src="https://assets.adobedtm.com/XXXXXXX/XXXXXXXX/launch-XXXXXXXXX-development.min.js" async></script>`

![Brand Concierge](./images/aep123.png)

[Brand Concierge](./brandconcierge.md){target="_blank"} に戻る

[&#x200B; すべてのモジュールに戻る &#x200B;](./../../../overview.md){target="_blank"}