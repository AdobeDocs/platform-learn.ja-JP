---
title: ライブラリの公開
description: ライブラリの公開
role: Developer
level: Intermediate
recommendations: noDisplay,noCatalog
kt: 10447
hide: true
hidefromtoc: true
exl-id: 2fc072df-24f2-4fea-848f-0a973deca2f8
source-git-commit: cc7a77c4dd380ae1bc23dc75608e8e2224dfe78c
workflow-type: tm+mt
source-wordcount: '231'
ht-degree: 4%

---

# ライブラリの公開

次に、タグライブラリを Web サイトにデプロイします。

## ライブラリの作成

まず、作成した拡張機能、ルール、データ要素を含むライブラリを作成する必要があります。 ライブラリを作成するには、「 [!UICONTROL 公開フロー] をクリックします。

選択 [!UICONTROL ライブラリを追加].

ライブラリ作成ビューが表示されます。

![タグライブラリの作成](../../../assets/implementation-strategy/tags-library-creation.png)

ライブラリに次のような名前を付けます。 _デモ_. 選択 [!UICONTROL 開発] 内 [!UICONTROL 環境] ドロップダウン。 次に、 [!UICONTROL 変更されたリソースをすべて追加].

これで、すべての拡張機能、ルールおよびデータ要素がの下に表示されます。 [!UICONTROL リソースの変更]. クリック [!UICONTROL 開発用に保存およびビルド].

## HTMLへの埋め込みコードの追加

次に、新しくビルドされたタグライブラリを読み込むスクリプトタグを製品ページHTMLに追加する必要があります。

最初にクリック [!UICONTROL 環境] をクリックします。 3 つの異なる環境が表示されます。

![タグ環境](../../../assets/implementation-strategy/tags-environments.png)

でパッケージアイコンをクリックします。 [!UICONTROL 開発] 環境行 ページに Launch ライブラリスクリプトをインストールする手順が表示されます。

![タグのインストール手順](../../../assets/implementation-strategy/tags-installation-instructions.png)

スクリプトタグをコピーします（クリップボードにコピーするボタンが付いています）。 製品ページHTMLを開き、 `</head>` タグを使用します。 最終的なHTMLは次のようになります。

```html
<!DOCTYPE html>
<html lang="en">
  <head>
    <title>Product Page</title>
    <script>
      window.adobeDataLayer = window.adobeDataLayer || [];
      window.adobeDataLayer.push({
        "event": "pageViewed",
        "web": {
          "webPageDetails": {
            "name": "Foam Roller",
            "siteSection": "Equipment"
          },
        },
        "productListItems": [
          {
            "SKU": "eqfr08",
            "currencyCode": "USD",
            "name": "Foam Roller",
            "priceTotal": 18.95
          }
        ]
      });
      window.adobeDataLayer.push({
        "event": "productViewed"
      });
      window.onAddToCartClick = function() {
        // In a real implementation, you would change this condition to 
        // only pass if a cart doesn't already exist. You would typically 
        // do this by checking a cookie or variable value.
        if (true) {
          window.adobeDataLayer.push({
            "event": "cartOpened",
          });
        }
        window.adobeDataLayer.push({
          "event": "productAddedToCart"
        });
      };
      window.onDownloadAppClick = function() {
        window.adobeDataLayer.push({
          "event": "downloadAppClicked",
          "eventInfo": {
            "web": {
              "webInteraction": {
                "URL": "https://example.com/download",
                "name": "App Download",
                "type": "download"
              }
            }
          }
        });
      };
    </script>
    <!--Swap this script tag with your own-->
    <script src="https://assets.adobedtm.com/xxxxxxxxxxxx/xxxxxxxxxxxx/launch-xxxxxxxxxxxx-development.min.js" async></script>
  </head>
  <body>
    <h1>Foam Roller</h1>
    <p>This foam roller is composed of durable material that holds its shape and delivers deep tissue therapy. Purchase now for only $18.95!</p>
    <button type="button" onclick="onAddToCartClick()">Add to cart</button>
    <a href="https://example.com/download" onclick="onDownloadAppClick()">Download the app</a>
  </body>
</html>
```

以下を確認します。 [タグの公開ドキュメント](https://experienceleague.adobe.com/docs/experience-platform/tags/publish/overview.html?lang=ja) 公開プロセスの詳細を確認する場合。

次に、新しい実装をテストします。
