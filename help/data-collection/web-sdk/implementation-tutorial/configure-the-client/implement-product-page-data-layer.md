---
title: 製品ページへのデータレイヤーの実装
description: 製品ページへのデータレイヤーの実装
role: Developer
level: Intermediate
recommendations: noDisplay,noCatalog
jira: KT-10447
hide: true
hidefromtoc: true
exl-id: a72011a5-ea9c-45df-a0f3-5eb40bc99d3f
source-git-commit: 90f7621536573f60ac6585404b1ac0e49cb08496
workflow-type: tm+mt
source-wordcount: '573'
ht-degree: 0%

---

# 製品ページへのデータレイヤーの実装

このチュートリアルでは、一般的な e コマース Web サイト用にAdobeクライアントデータレイヤーを実装します。 まだお読みになっていない場合は、 [Adobeクライアントデータレイヤーの使用方法](how-to-use-the-adobe-client-data-layer.md) まず、クライアントデータレイヤーがどのようにAdobeされるかを理解します。

ユーザーが製品を閲覧し、フォームローラーをクリックして詳細を確認するとします。 フォームローラー製品の詳細ページに移動します。

次に、シンプルな製品詳細ページのHTMLを示します。

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

ご存じのように、 `<head>` タグがある `<script>` タグを使用します。 JavaScript コードを配置する場所です。 を配置する必要はありません。 `<script>` タグ内 `<head>`ですが、データレイヤーにできるだけ早くデータをプッシュすると、ユーザーがページを離れる前に、マーケターがAdobe Experience Platformにすばやく送信できるようになります。

内部 `<script>` タグを付け、最初に `adobeDataLayer` 配列を作成し、適切なイベントおよびデータ情報を配列にプッシュします。 データは XDM スキーマに準拠します [以前に作成した](../configure-the-server/create-a-schema.md).

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

この例では、データレイヤーに 2 回プッシュし、それぞれに `event` キー。 次を含む： `event` キーは、ページで発生したイベントを伝えるだけでなく、マーケターがAdobe Experience Platformタグ内で適切なルールを簡単に作成できるようにします。

データレイヤーへの最初のプッシュは、ユーザーがページを閲覧したことをリスナー（タグルール）に通知します。 また、ページ名とサイトセクションもデータレイヤーに追加します。

データレイヤーへの 2 番目のプッシュは、ユーザーが製品を閲覧したことをリスナー（タグルール）に通知します。 また、製品情報もデータレイヤーに追加します。

## 買い物かごに追加

また、ユーザーが [!UICONTROL 買い物かごに追加] 」ボタンをクリックします。

これをおこなうには、ユーザーが [!UICONTROL 買い物かごに追加] 」ボタンをクリックします。

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

この関数を呼び出すと、まず、ユーザーに対して買い物かごが既に存在するかどうかを確認します。 通常、これは特定の cookie または変数が存在するかどうかを確認することでおこなわれます。 買い物かごが存在しない場合は、 `cartOpened` イベントをデータレイヤーに追加します。 その後、 `productAddedToCart` イベントをデータレイヤーに追加します。 製品情報は既にデータレイヤーに存在するので、再度追加する必要はありません。

を追加します。 `onclick` 属性 [!UICONTROL 買い物かごに追加] 新しい `onAddToCartClick` 関数に置き換えます。

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

## アプリをダウンロード

最後に、ユーザーが _[!UICONTROL アプリをダウンロード]_ リンク。

これをおこなうには、ユーザーが _[!UICONTROL アプリをダウンロード]_ リンク。

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

を追加します。 `onclick` 属性 [!UICONTROL アプリをダウンロード] 新しい `onDownloadAppClick` 関数に置き換えます。

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
