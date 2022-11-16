---
title: Adobe Journey Optimizer — 外部の気象 API、SMS アクションなど — カスタムアクションの定義
description: Adobe Journey Optimizer — 外部の気象 API、SMS アクションなど — カスタムアクションの定義
kt: 5342
audience: Data Engineer, Data Architect, Orchestration Engineer, Marketer
doc-type: tutorial
activity: develop
exl-id: 7ee5aee9-3740-4eee-9f53-a44fdb564a00
source-git-commit: cc7a77c4dd380ae1bc23dc75608e8e2224dfe78c
workflow-type: tm+mt
source-wordcount: '514'
ht-degree: 3%

---

# 8.3 カスタムアクションの定義

この演習では、Adobe Journey Optimizerを組み合わせて使用し、2 つのカスタムアクションを作成します。

に移動してAdobe Journey Optimizerにログインします。 [Adobe Experience Cloud](https://experience.adobe.com). クリック **Journey Optimizer**.

![ACOP](../module7/images/acophome.png)

リダイレクト先： **ホーム**  Journey Optimizerで表示 まず、正しいサンドボックスを使用していることを確認します。 使用するサンドボックスは、と呼ばれます。 `--aepSandboxId--`. サンドボックス間を切り替えるには、 **実稼動 (VA7)** リストからサンドボックスを選択します。 この例では、サンドボックスの名前はです。 **AEP 有効化 FY22**. その後、 **ホーム** サンドボックスの表示 `--aepSandboxId--`.

![ACOP](../module7/images/acoptriglp.png)

左側のメニューで、下にスクロールして、 **設定**. 次に、 **管理** 下のボタン **アクション**.

![デモ](./images/menuactions.png)

次に、 **アクション** リスト。

![デモ](./images/acthome.png)

テキストをSlackチャネルに送信する 1 つのアクションを定義します。

## 8.3.1 アクション：テキストをSlackチャネルに送信

これで、既存のメッセージチャネルを使用して、SlackチャネルにSlackを送信します。 Slackは使いやすい API を備えており、Adobe Journey Optimizerを使用して API をトリガー化する予定です。

![デモ](./images/slack.png)

クリック **アクションを作成** をクリックして、新しいアクションの追加を開始します。

![デモ](./images/adda.png)

空のアクションポップアップが表示されます。

![デモ](./images/emptyact.png)

アクションの名前として、次を使用します。 `--demoProfileLdap--TextSlack`. この例では、「アクション名」は `vangeluwTextSlack`.

説明を次に設定します。 `Send Text to Slack`.

![デモ](./images/slackname.png)

の **URL 設定**、次を使用します。

- URL: `https://2mnbfjyrre.execute-api.us-west-2.amazonaws.com/prod`
- メソッド： **POST**

>[!NOTE]
>
>上記の URL は、AWS Lambda 関数を参照します。この関数は、前述のように、リクエストをSlackチャネルに転送します。 これは、Adobeが所有するSlackチャネルへのアクセスを保護するためにおこなわれます。 独自のSlackチャネルがある場合、 [https://api.slack.com/](https://api.slack.com/)次に、そのSlackアプリで受信 Webhook を作成し、上記の URL を受信 Webhook URL に置き換える必要があります。

ヘッダーフィールドを変更する必要はありません。

![デモ](./images/slackurl.png)

**認証** は、次のように設定する必要があります。 **認証なし**.

![デモ](./images/slackauth.png)

の **アクションパラメーター**&#x200B;の場合は、Slackに送信するフィールドを定義する必要があります。 論理的には、Adobe Journey OptimizerとAdobe Experience Platformをパーソナライゼーションの頭脳にしたいので、Slackに送信するテキストはAdobe Journey Optimizerで定義し、実行のためにSlackに送信する必要があります。

この場合、 **アクションパラメーター**、 **ペイロードを編集** アイコン

![デモ](./images/slackmsgp.png)

空のポップアップウィンドウが表示されます。

![デモ](./images/slackmsgpopup.png)

以下のテキストをコピーし、空のポップアップウィンドウに貼り付けます。

```json
{
 "text": {
  "toBeMapped": true,
  "dataType": "string",
  "label": "textToSlack"
 }
}
```

FYI:以下のフィールドを指定すると、これらのフィールドはお客様のジャーニーからアクセスできるようになり、ジャーニーから動的に入力できるようになります。

**&quot;toBeMapped&quot;:真**

**&quot;dataType&quot;:&quot;string&quot;,**

**&quot;label&quot;:&quot;textToSlack&quot;**

次の内容が表示されます。

![デモ](./images/slackmsgpopup1.png)

「**保存**」をクリックします。

![デモ](./images/twiliomsgpopup2.png)

上にスクロールし、 **保存** カスタムアクションを保存するために、もう 1 回。

![デモ](./images/slackmsgpopup3.png)

カスタムアクションが **アクション** リスト。

![デモ](./images/slackdone.png)

イベント、外部データソース、アクションを定義済み。 次に、すべてを 1 つのジャーニーに統合します。

次のステップ： [8.4 ジャーニーとメッセージの作成](./ex4.md)

[モジュール 8 に戻る](journey-orchestration-external-weather-api-sms.md)

[すべてのモジュールに戻る](../../overview.md)
