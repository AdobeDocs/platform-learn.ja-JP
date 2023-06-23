---
title: Adobeクライアントデータレイヤーの使用方法
description: Adobeクライアントデータレイヤーの使用方法
role: Developer
level: Intermediate
recommendations: noDisplay,noCatalog
jira: KT-10447
hide: true
hidefromtoc: true
exl-id: 33a5db8c-e49b-4073-b4d7-4abe19537fcb
source-git-commit: 90f7621536573f60ac6585404b1ac0e49cb08496
workflow-type: tm+mt
source-wordcount: '884'
ht-degree: 0%

---

# Adobeクライアントデータレイヤーの使用方法

In [データレイヤーとは](whats-a-data-layer.md)では、データレイヤーについて説明する際に考慮すべき点が 2 つあることを学びました。コンテナとコンテンツ。 Adobeクライアントデータレイヤーはコンテナです。 君はどうでもよい [データの構造化](../structuring-your-data.md) または、データに入れるために選択した情報の一部を指定します。 データは次のように構造化できます。 [XDM](../structuring-your-data.md#xdm)以下の例に示すように、または独自の構造を完全に構築できます。

会社のエンジニアリングチームが、ページ上のコードを通じて必要なデータをデータレイヤーにプッシュするのが理想です。 次に、マーケティングチームは、データレイヤーからデータを取得します。できれば、Adobe Experience Platformタグを使用します。

## データレイヤーへのデータのプッシュ

Adobeクライアントデータレイヤーは JavaScript 配列です。 Adobeクライアントデータレイヤーを作成すると、次の場所から始まります。

```js
window.adobeDataLayer = window.adobeDataLayer || [];
```

データをデータレイヤーに配置するには、 `push` メソッドを使用して、データレイヤー配列に対して次の操作を実行します。

```js
window.adobeDataLayer.push({
  "claims": {
    "ID": "CL10991306",
    "policyID": "IXP28113",
    "type": "automobile"
  }
});
```

を呼び出すことで、いつでも追加データをデータレイヤーにプッシュできます `push` 再び

```js
window.adobeDataLayer.push({
  "claims": {
    "status": "approved",
    "benefitAmount": {
      "amount": 1827.90,
      "currencyCode": "USD"
    }
  }
});
```

## プッシュされたデータの意味

以前の 2 つの `push` を呼び出すと、データレイヤー配列に 2 つのエントリが含まれます。 この状態では、データレイヤーは特に役立ちません。 通常は、データレイヤーの結合状態、つまり、データレイヤーにプッシュしたすべてのデータの結合結果である単一のオブジェクトにアクセスします。 この結合状態にアクセスする方法については、チュートリアルの後半で説明します。 現時点では、2 つの後のデータレイヤーの計算済み状態を理解するだけで十分です。 `push` の呼び出しは次のようになります。

```json
{
  "claims": {
    "ID": "CL10991306",
    "policyID": "IXP28113",
    "type": "automobile",
    "status": "approved",
    "benefitAmount": {
      "amount": 1827.90,
      "currencyCode": "USD"
    }
  }
}
```

## データの削除

場合によっては、データレイヤーからデータを削除する必要があります。 これは、ユーザーがビュー間を移動する際に使用されるシングルページアプリケーションで特に一般的です。 例えば、ユーザーが製品表示から連絡先表示に移動した場合、データレイヤー上の製品データはアクティブな表示とは関係なくなったので、そのデータを消去すると効果的です。

値を `undefined` 削除するキーに対して。 を削除する場合は、以前の例に基づいてを作成します。 `status` データレイヤーから取得したコードは次のようになります。

```js
window.adobeDataLayer.push({
  "claims": {
    "status": undefined
  }
});
```

データレイヤーの計算済みの状態には、以下が含まれなくなります。 `status`:

```json
{
  "claims": {
    "ID": "CL10991306",
    "policyID": "IXP28113",
    "type": "automobile",
    "benefitAmount": {
      "amount": 1827.90,
      "currencyCode": "USD"
    }
  }
}
```

## イベントのデータレイヤーへのプッシュ

Adobeクライアントデータレイヤーは、データの保存に使用するだけでなく、ページ上で発生しているイベントを通信する目的にも使用します。 実際、通常、データをデータレイヤーにプッシュします _結果として_ 」という名前に設定されます。 (1) チャットボットを開く、検索バーに検索語を入力するなどのインタラクションイベント、(2) 広告のインプレッションや Web ページのパフォーマンス計算の完了などの非インタラクションイベントが含まれます。

ページ上でイベントが発生したことを伝えるには、 `event` キーは、データレイヤーにプッシュするオブジェクト内で使用します。 例えば、ユーザーが検索フィールドに検索クエリを入力したことを伝えたい場合があります。

```js
window.adobeDataLayer.push({
  "event": "searchQueryEntered"
});
```

後で、特定のイベントがデータレイヤーにプッシュされる際にAdobe Experience Platformタグ内でルールをトリガーする方法を学びます。 また、 `event` キーは _not_ 計算済みの状態に含まれます。 データ層による特別な処理を受けます。

## イベントとデータをデータレイヤーにプッシュする

ユーザーが検索クエリを入力したことをリスナーに通知すると便利ですが、イベントに関する追加情報を提供したい場合は、どうすればよいですか？ 例えば、ユーザーの検索クエリを含めたい場合があります。 このデータは、次の 2 つの方法のいずれかで提供できます。

1. データを提供して **が保持されます** データレイヤーの計算済み状態の一部としてのデータレイヤーの。
2. データを提供して **は保持されません** データレイヤーの計算済み状態の一部としてのデータレイヤーの。

通常、データレイヤーでデータを保持するかどうかは、ページ上でのユーザーの期間中にそのデータを参照する予定があるかどうかによって異なります。 そうでない場合、データレイヤー内にデータを保持すると、データレイヤーが乱雑になる可能性があります。

以下に、追加データを含むイベントをプッシュする例を示します。 **が保持されます** データレイヤーで、以下の操作をおこないます。

```js
window.adobeDataLayer.push({
  "event": "searchQueryEntered",
  "siteKnowledge": {
    "supportSiteSearch": {
      "term": "roller",
      "locationInPage": "topSearchBar"
    }
  }
});
```

この後 `push` 実行される `siteKnowledge` は、ページがアンロードされるまで（意図的に削除または上書きしない限り）、常にデータレイヤーの計算済み状態で表示されます `siteKnowledge`) をクリックします。

一方、以下に、追加データを含むイベントをプッシュする例を示します。 **は保持されません** データレイヤーで、以下の操作をおこないます。

```js
window.adobeDataLayer.push({
  "event": "searchQueryEntered",
  "eventInfo": {
    "siteKnowledge": {
      "supportSiteSearch": {
        "term": "roller",
        "locationInPage": "topSearchBar"
      }
    }
  }
});
```

この例では、 `siteKnowledge` は内側にラップされます `eventInfo`. この `eventInfo` キーは、データレイヤーによる特別な処理を受けます。 このデータは、データレイヤーに対してその旨を伝えます _should_ リスナーに送信されるイベントに含まれるが、それは _次の値を指定しない_ は、データレイヤー内に保持されます。 リスナー (Adobe Experience Platformタグなど ) にイベントの通知が送信されると、このデータは基本的に忘れられます。 この `siteKnowledge` キーは、データレイヤーの計算済み状態内に表示されません。

を呼び出すたびに `push`を指定した場合、Adobeクライアントデータレイヤーはリスナーに通知します。 後で、Adobe Experience Platformタグとタグルールから、それに応じてこれらの通知をリッスンする方法をトリガーします。
