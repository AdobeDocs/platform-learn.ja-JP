---
title: Adobe Journey Optimizer — ビジネスイベント
description: この節では、「在庫品目」ユースケースを実行するためのビジネスイベント機能の使用方法を説明します
kt: 5342
audience: Data Engineer, Data Architect, Data Analyst
doc-type: tutorial
activity: develop
exl-id: cc06d847-a405-4223-836c-c22ad6c9caca
source-git-commit: cc7a77c4dd380ae1bc23dc75608e8e2224dfe78c
workflow-type: tm+mt
source-wordcount: '1187'
ht-degree: 8%

---

# 10.5 ビジネスイベントのジャーニーの作成

に移動してAdobe Journey Optimizerにログインします。 [Adobe Experience Cloud](https://experience.adobe.com). クリック **Journey Optimizer**.

![ACOP](../module7/images/acophome.png)

リダイレクト先： **ホーム**  Journey Optimizerで表示 まず、正しいサンドボックスを使用していることを確認します。 使用するサンドボックスは、と呼ばれます。 `--aepSandboxId--`. サンドボックス間を切り替えるには、 **実稼動 (VA7)** リストからサンドボックスを選択します。 この例では、サンドボックスの名前はです。 **AEP 有効化 FY22**. その後、 **ホーム** サンドボックスの表示 `--aepSandboxId--`.

![ACOP](../module7/images/acoptriglp.png)

## 10.5.1 ビジネスイベントの作成

左側のメニューで、 **設定**. をクリックします。 **管理** ボタンを **イベント** カード。

![Journey Optimizer](./images/be1.png)

ビジネスイベントは、Journey Optimizer内で作成できる新しいタイプのイベントです。 とは異なり、 **単一** 以前のモジュールで作成したイベントは、顧客ではなく組織によってトリガーされます。 次に、ビジネスイベントを作成します。

クリック **イベントを作成**.

![Journey Optimizer](./images/be2.png)

イベント作成フォームで次の値を入力します。

- **名前**: `--demoProfileLdap--ItemBackInStock`. 例： **vangeluwItemBackInStock**
- **説明**:このイベントは、製品が在庫に戻ったときにトリガーされます
- **タイプ**:選択 **法人** ドロップダウン内

![Journey Optimizer](./images/evde.png)

スキーマの場合、「 」を選択します。 **デモシステム — JO ビジネスイベント（グローバル v1.1） v.1 のイベントスキーマ**. 次に、このユースケースで必要なフィールドをスキーマから選択する必要があります。

![Journey Optimizer](./images/evdes.png)

次の手順に従います。

次をクリック： **鉛筆** アイコンが表示されているフィールド上のアイコン **1 個のフィールドが選択されました**.

![Journey Optimizer](./images/23.8-4.png)

スキーマ内の使用可能なフィールドをすべて選択し、「 **OK**.

![Journey Optimizer](./images/23.8-5.png)

条件の場合：このスキーマ内のどのレコードがビジネスイベントをトリガーするかを指定する必要があります。

次の手順に従います。

次をクリック： **鉛筆** アイコンが表示されているフィールド上のアイコン **条件を追加**.

![Journey Optimizer](./images/23.8-6.png)

左側の `--aepTenantId--` オブジェクトを展開します。 **joBusinessEvents** をクリックし、「 」フィールドをドラッグ&amp;ドロップします。 **eventName** をキャンバスに貼り付けます。

![Journey Optimizer](./images/23.8-7.png)

フィールド **eventName**、次の値を入力します。 `--demoProfileLdap--ItemBackInStock`. 例：vangeluwItemBackInStock.
「**OK**」をクリックします。

![Journey Optimizer](./images/23.8-8.png)

「**OK**」をクリックします。

![Journey Optimizer](./images/23.8-9.png)

最後に、イベント作成フォームは次のようになります。 クリック **保存** ビジネスイベントを保存します。

![Journey Optimizer](./images/23.8-10.png)

## 10.5.2 ビジネスイベントのジャーニーの作成

このビジネスイベントとメッセージをジャーニー内で活用できるようになりました。 に移動します。 **ジャーニー**. クリック **作成ジャーニー**.

![Journey Optimizer](./images/bej10.png)

右側に、ジャーニーの名前と説明を指定する必要があるフォームが表示されます。 次の値を入力します。

- **名前**: `--demoProfileLdap-- - Item back in stock journey`. 例：vangeluw — アイテムの再在庫ジャーニー
- **説明**:このジャーニーは、品目が在庫に戻ったときに、興味を示した訪問者に SMS を送信します。

「**OK**」をクリックします。

![Journey Optimizer](./images/bej11.png)

左側のメニューで、 **イベント**、ldap を検索します。 以前に作成したビジネスイベントが表示されます `--demoProfileLdap--ItemBackInStock`. このイベントをキャンバスにドラッグ&amp;ドロップします。これがジャーニーの開始点になります。

![Journey Optimizer](./images/bej12.png)

ご覧のように、 **セグメントを読み取り** 「 」アクティビティが自動的にキャンバスに追加されました。 これは、ビジネスイベントがジャーニーのトリガーを送信して特定のセグメントを読み取るだけで、そのジャーニーのプロファイルのリストを取得できるからです。

次をクリック： **セグメントを読み取り** アクティビティ。
この **セグメントを読み取り** 設定では、発生したばかりのビジネスイベントを通知するセグメントを選択する必要があります。 次をクリック： **セグメントを選択** フィールドに入力します。

![Journey Optimizer](./images/bej13.png)

内 **セグメントを選択** ポップアップ、ldap を検索し、 [モジュール 6 — リアルタイム CDP — セグメントを構築し、アクションを実行する](../module6/real-time-cdp-build-a-segment-take-action.md) 名前付き `--demoProfileLdap-- - Interest in PROTEUS FITNESS JACKSHIRT`. 例：vangeluw — プロテウスフィットネスジャックシャツに興味。 「**保存**」をクリックします。

![Journey Optimizer](./images/bej14.png)

次に、「 **Ok**.

![Journey Optimizer](./images/bej15.png)

次の手順では、このジャーニーで実行するアクションをドラッグ&amp;ドロップします。 アクションを選択 **SMS**&#x200B;をクリックし、追加した条件の後にドラッグ&amp;ドロップします。

![デモ](./images/jop9.png)

を **カテゴリ** から **マーケティング** をクリックし、sms を送信できる sms 表面を選択します。 この場合、選択する E メールサーフェスは次のようになります。 **SMS**.

![ACOP](./images/journeyactions1x.png)

次の手順では、メッセージを作成します。 それには、「 **コンテンツを編集**.

![ACOP](./images/journeyactions2x.png)

これで、SMS のテキストを設定できるメッセージダッシュボードが表示されます。 次をクリック： **メッセージを作成** 領域を使用して、メッセージを作成します。

![Journey Optimizer](./images/sms3.png)

次のテキストを入力します。 `Hi {{profile.person.name.firstName}}, the Proteus Fitness Jackshirt is back in stock at Luma.`. 「**保存**」をクリックします。

![Journey Optimizer](./images/sms4.png)

次をクリックして、メッセージダッシュボードに戻ります。 **矢印** 左上隅の件名行テキストの横に表示されます。

![Journey Optimizer](./images/oc79xx.png)

これで、完了した SMS アクションが表示されます。 「**OK**」をクリックします。

![Journey Optimizer](./images/oc79xxy.png)

これで、ジャーニーを公開する準備が整いました。 「**公開**」をクリックします。

![Journey Optimizer](./images/jop13.png)

クリック **公開** 再び

![Journey Optimizer](./images/jop14.png)

ジャーニーが公開され、テストできるようになりました。

![Journey Optimizer](./images/jop15.png)

## 10.5.3 ビジネスイベントのジャーニーのテスト

次に、新しいイベントを **デモシステム — JO ビジネスイベント（グローバル v1.1） v.1 のイベントスキーマ** Postmanの使用

左側のメニューで、 **ソース** 次に、 **アカウント** タブをクリックします。

![Journey Optimizer](./images/s1.png)

の **アカウント** 「 」タブに、「 」という名前のアカウントが表示されます。 **Journey Optimizerビジネスイベント**. クリックして開きます。

![Journey Optimizer](./images/s2.png)

このアカウントには 1 つのデータフローのみが含まれています。データフロー名をクリックして選択します。

![Journey Optimizer](./images/s3.png)

クリック **スキーマペイロードをコピー** をクリックします。 このオプションは、 **curl** に対してレコードを挿入するコマンド **デモシステム — JO ビジネスイベント（グローバル v1.1） v.1 のイベントスキーマ** をクリップボードに追加します。

![Journey Optimizer](./images/s4.png)

「 Curl 」コマンドをテキストエディター内に貼り付けます。

![Journey Optimizer](./images/s5.png)

このリクエストをもっと詳しく見てみましょう。

- POSTリクエストが DCS インレット ID に送信されます
- リクエストは、スキーマ、データセット、組織 ID を参照します。
- 最後に、データセット内に作成するデータを表す xdmEntity ノードが含まれます。

次の項目を置き換える必要があります `xdmEntity` 行…

```json
"xdmEntity": {
  "_experienceplatform": {
    "joBusinessEvents": {
      "eventDescription": "string",
      "eventName": "string",
      "stockEventId": "string"
    }
  },
  "_id": "/uri-reference",
  "eventType": "advertising.completes",
  "timestamp": "2018-11-12T20:20:39+00:00"
}
```

...この行では、次のように、フィールド eventName を必ず確認してください `--demoProfileLdap--ItemBackInStock`：ジャーニーをトリガーするためにビジネスイベントで指定した条件を表します。

```json
"xdmEntity": {
  "_experienceplatform": {
    "joBusinessEvents": {
      "eventDescription": "Product Proteus Fitness Jackshirt is back in stock",
      "eventName": "--demoProfileLdap--ItemBackInStock",
      "stockEventId": "1"
    }
  },
  "_id": "/uri-reference",
  "eventType": "productBackInStock",
  "timestamp": "2021-04-19T15:25:39+00:00"
}
```

更新済み **curl** コマンドは次のようになります。

![Journey Optimizer](./images/s6.png)

すべてを選択し、クリップボードにコピーします。

Postmanを開きます。 Postmanの左側で、 **インポート**.

![Journey Optimizer](./images/23.8-46.png)

を選択します。 **生のテキスト** 「 」タブをタブに移動し、前にコピーしたコマンドをここに貼り付けます。 「**続行**」をクリックします。

![Journey Optimizer](./images/s7.png)

「**Import**」をクリックします。

![Journey Optimizer](./images/23.8-50.png)

Postmanが自動的に変換されました **curl** コマンドを REST コマンドに追加し、 **送信** ボタンをクリックして、データセット内でのそのレコードの作成をリクエストします。

![Journey Optimizer](./images/23.8-51.png)

リクエストが正常に受信されたことを確認します。 を探します。 **200 OK** 郵便配達員のステータス

![Journey Optimizer](./images/s8.png)

SMS が携帯電話に届くまでに数分かかる場合があります。 そうでない場合は、 **Proteus Fitness Jackshirt への関心** セグメントに、正しい携帯電話を持つプロファイルが含まれていない可能性があります。 その場合は、Luma の Web サイトにアクセスし、 **Proteus Fitness Jackshirt** 製品を入力し、正しい携帯電話番号を入力する際に登録してください。

![Journey Optimizer](./images/s9.png)

これで、この練習は終了です。

次のステップ： [概要とメリット](./summary.md)

[モジュール 10 に戻る](./journeyoptimizer.md)

[すべてのモジュールに戻る](../../overview.md)
