---
title: 製品ページへのデータレイヤーの実装
description: 製品ページへのデータレイヤーの実装
exl-id: 0debf34a-48d4-4029-b790-7fd78865c334
source-git-commit: cc7a77c4dd380ae1bc23dc75608e8e2224dfe78c
workflow-type: tm+mt
source-wordcount: '632'
ht-degree: 0%

---

# 製品ページへのデータレイヤーの実装

このチュートリアルでは、一般的な e コマース Web サイト用にAdobeクライアントデータレイヤーを実装します。 まだお読みになっていない場合は、 [Adobeクライアントデータレイヤーの使用方法](how-to-use-the-adobe-client-data-layer.md) まず、クライアントデータレイヤーのAdobeについて理解します。

ユーザーが製品を閲覧し、フォームローラーをクリックして詳細を確認するとします。 フォームローラー製品の詳細ページに移動します。

## シンプルな製品の詳細ページを作成します

1. 次のコードをコピーして新しいHTMLファイルに貼り付け、コンピューターに保存します。

```html
<!DOCTYPE html>
<html lang="en">
  <head>
    <title>Product Page</title>
    <script>
      // Code will go here.
    </script>
  </head>
  <body>
    <h1>Foam Roller</h1>
    <p>This foam roller is composed of durable material that holds its shape and delivers deep tissue therapy. Purchase now for only $18.95!</p>
    <button type="button">Add to cart</button>
    <a href="https://example.com/download">Download the app</a>
  </body>
</html>
```

内部 `<head>` タグがある `<script>` タグを使用します。 JavaScript コードを配置する場所です。 ただし、 `<script>` タグを `<head>` コンテナ（推奨）。 これにより、様々な使用例に対応できるよう、可能な限り早くデータレイヤーでデータを使用できるようになります。

## Adobeデータレイヤーの追加

1. 内部 `<script>` タグの下に、 `adobeDataLayer` 配列を作成し、適切なイベントおよびデータ情報を配列にプッシュします。 データは XDM スキーマに準拠します [以前に作成した](../configure-the-server/create-a-schema.md).

```js
window.adobeDataLayer = window.adobeDataLayer || [];
window.adobeDataLayer.push({
  "event": "pageViewed",
  "web": {
    "webPageDetails": {
      "name": "Foam Roller",
      "siteSection": "Equipment"
    },
  }
});
window.adobeDataLayer.push({
  "event": "productViewed",
  "productListItems": [
    {
      "SKU": "eqfr08",
      "currencyCode": "USD",
      "name": "Foam Roller",
      "priceTotal": 18.95
    }
  ]
});
```

この例では、データレイヤーに 2 回プッシュし、それぞれに `event` キー。 次を含む： `event` キーは、ページで発生したイベントを伝えるだけでなく、マーケターがタグ内で適切なルールを簡単に作成できるようにします。

データレイヤーへの最初のプッシュは、ユーザーがページを閲覧したことをリスナー（タグルール）に通知します。 また、ページ名とサイトセクションもデータレイヤーに追加します。

データレイヤーへの 2 番目のプッシュは、ユーザーが製品を閲覧したことをリスナー（タグルール）に通知します。 また、製品情報もデータレイヤーに追加します。

## 買い物かごへの追加追跡用のコードの追加

このチュートリアルでは、ユーザーが [!UICONTROL 買い物かごに追加] 」ボタンをクリックします。

1. データレイヤーコードの後にこのコードをコピーして貼り付けます。 関数は、ユーザーが [!UICONTROL 買い物かごに追加] 」ボタンをクリックします。

```js
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
```

この関数は、最初に、ユーザーに対して買い物かごが既に存在するかどうかを確認します。  買い物かごが存在しない場合は、 `cartOpened` イベントをデータレイヤーに追加します。 後で、 `productAddedToCart` イベントをデータレイヤーに追加します。 製品情報は既にデータレイヤーに存在するので、再度追加する必要はありません。

## 属性を追加して買い物かごに追加ボタン

1. を追加します。 `onclick` 属性 [!UICONTROL 買い物かごに追加] 新しい `onAddToCartClick` 関数に置き換えます。

HTMLページの結果は次のようになります。

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
    </script>
  </head>
  <body>
    <h1>Foam Roller</h1>
    <p>This foam roller is composed of durable material that holds its shape and delivers deep tissue therapy. Purchase now for only $18.95!</p>
    <button type="button" onclick="onAddToCartClick()">Add to cart</button>
    <a href="https://example.com/download">Download the app</a>
  </body>
</html>
```

## アプリダウンロードトラッキング用のコードを追加

最後に、ユーザーが _[!UICONTROL アプリをダウンロード]_ リンク。

1. これをおこなうには、このコードをコピーして、買い物かごに追加するコードの下に貼り付けます。 この関数は、ユーザーが _[!UICONTROL アプリをダウンロード]_ リンク。

```js
window.onDownloadAppClick = function(event) {
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
```

この場合、リンクに関する情報は `eventInfo` キー。 詳しくは、 [Adobeクライアントデータレイヤーの使用方法](how-to-use-the-adobe-client-data-layer.md)これは、データレイヤーに対し、イベントと共にこのデータを通信するよう伝えますが、 _not_ データレイヤー内でデータを保持します。 リンククリックの場合、クリックされたリンクに関する情報をデータレイヤーに追加するのは有用ではありません。リンクがページ全体に関係しないので、発生する可能性のある他のイベントには適用できません。

## アプリのダウンロードリンクに属性を追加

1. を追加します。 `onclick` 属性 [!UICONTROL アプリをダウンロード] 新しい `onDownloadAppClick` 関数に置き換えます。

HTMLページの結果は次のようになります。

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
  </head>
  <body>
    <h1>Foam Roller</h1>
    <p>This foam roller is composed of durable material that holds its shape and delivers deep tissue therapy. Purchase now for only $18.95!</p>
    <button type="button" onclick="onAddToCartClick()">Add to cart</button>
    <a href="https://example.com/download" onclick="onDownloadAppClick()">Download the app</a>
  </body>
</html>
```

[次へ： ](create-a-tags-property-and-install-extensions.md)

>[!NOTE]
>
>データ収集に関する学習に時間を割いていただき、ありがとうございます。 ご質問がある場合、一般的なフィードバックを共有したい場合、または今後のコンテンツに関する提案がある場合は、こちらで共有してください [Experience Leagueコミュニティディスカッション投稿](https://experienceleaguecommunities.adobe.com/t5/adobe-experience-platform-launch/tutorial-discussion-use-adobe-experience-platform-data/m-p/543877)
