---
title: Firefly サービスの概要
description: PostmanとAdobe I/Oを使用して、Adobe Firefly サービス API をクエリする方法を説明します
role: Developer
level: Beginner
jira: KT-5342
doc-type: Tutorial
exl-id: 52385c33-f316-4fd9-905f-72d2d346f8f5
source-git-commit: b083a817700320e8e45645702c2868423c1fae99
workflow-type: tm+mt
source-wordcount: '224'
ht-degree: 0%

---

# 1.1.1 Firefly サービスの概要

PostmanとAdobe I/Oを使用して、Adobe Firefly サービス API をクエリする方法を説明します。

## 1.1.1.1 前提条件

この演習を続ける前に、[Adobe I/O プロジェクト ](./../../../modules/getting-started/gettingstarted/ex6.md) の設定を完了し、[Postman](./../../../modules/getting-started/gettingstarted/ex7.md) や [PostBuster](./../../../modules/getting-started/gettingstarted/ex8.md) などの API を操作するアプリケーションも設定しておく必要があります。

## 1.1.1.2 Adobe I/O - access_token

**Adobe I/O - OAuth** コレクションで、「**POST - アクセストークンを取得**」という名前のリクエストを選択し、「**送信**」を選択します。 応答には、新しい **accestoken** を含める必要があります。

![Postman](./images/ioauthresp.png){zoomable="yes"}

## 1.1.1.3 Firefly サービス API、テキスト 2 画像

これで、有効な新しい access_token が用意できたので、最初のリクエストをFirefly Services API に送信する準備が整いました。

**FF - Firefly Services Tech Insiders** コレクションから **POST - Firefly - T2I V3** という名前のリクエストを選択します。

![Firefly](./images/ff1.png){zoomable="yes"}

応答から画像 URL をコピーし、web ブラウザーで開いて画像を表示します。

![Firefly](./images/ff2.png){zoomable="yes"}

`horses in a field` を描いた美しい画像が表示されます。

![Firefly](./images/ff3.png){zoomable="yes"}

次の演習に進む前に、API リクエストをいろいろと試してください。

## 次の手順

[Microsoft Azure と事前署名済み URL を使用したFirefly プロセスの最適化 ](./ex2.md){target="_blank"} に移動します

[Adobe Firefly サービスの概要 ](./firefly-services.md){target="_blank"} に戻ります

[ すべてのモジュール ](./../../../overview.md){target="_blank"} に戻る
