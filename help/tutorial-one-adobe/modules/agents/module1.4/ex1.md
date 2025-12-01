---
title: Brand Conciergeの概要
description: Brand Conciergeの概要
kt: 5342
doc-type: tutorial
source-git-commit: 6642acb3fdce2c9d3a9b919d5c9457191e4780a6
workflow-type: tm+mt
source-wordcount: '536'
ht-degree: 1%

---

# 1.4.1 Brand Conciergeの概要

## ビデオ

このビデオでは、この演習に関係するすべての手順の説明とデモを行います。

## 1.4.1.1 Brand Conciergeの概要

Brand Conciergeを設定する際に使用する 2 つの主な要素は次のとおりです。

- **Agent Composer （設定レイヤー）**

  目的：対話型 AI エクスペリエンスの構築と設定に使用される主要な UI プラットフォーム。

  主な責務：

   - データソースとナレッジベースの定義と管理
   - ブランド表現（トーン、スタイル、ガードレール）の設定
   - 会議予約エージェントの設定

- **Agent Orchestrator（実行エンジン）**

  目的：ユーザーのリクエストを解釈し、適切なエージェントのアクションを実行する推論およびオーケストレーションエンジン。

  主な責務：

   - 自然言語のユーザーインテントの解釈
   - 複数ステップ推論プランの生成と実行
   - 適切な演算子やツールを選択して呼び出す
   - ブランドコンテキスト、コンプライアンス、ガードレールの適用
   - マルチエージェントワークフローの調整
   - 複数のデータソースからの応答の集計と作成

- **Brand Concierge Conversation Runtime （サービス レイヤー）**

  目的：チャットセッション、コンテキスト、クライアントとのインタラクションを管理する、顧客向けの会話サービスレイヤー。

  主要なコンポーネント：

   - Web エージェント（クライアント）:Web SDKを使用して統合されたブラウザーまたはモバイルチャット UI
   - 会話サービス （バックエンド）: セッション状態を管理し、オーケストレーションゲートウェイとして機能します

  主な責務：

   - ユーザーセッションと会話トランスクリプトの管理
   - ユーザー認証とプロファイルの処理
   - クライアントとAgent Orchestrator間のメッセージのルーティング
   - 会話のコンテキストの保持
   - 行動イベントと操作イベントのAEP for analytics への記録
   - サーフェス固有の設定の適用

## 1.4.1.2 Brand Concierge インスタンスの設定

独自のBrand Concierge インスタンスの作成を開始するには、次の手順に従います。

[https://experience.adobe.com/](https://experience.adobe.com/){target="_blank"} に移動します。 **Brand Concierge** を開きます。

![Brand Concierge](./images/bc1.png)

この画像が表示されます。 **サンドボックス選択** メニューをクリックします。

![Brand Concierge](./images/bc2.png)

自分に割り当てられているサンドボックスを選択します。 そのサンドボックスの名前は `--aepUserLdap--` にする必要があります。

![Brand Concierge](./images/bc3.png)

**開始** をクリックします。

![Brand Concierge](./images/bc4.png)

Brand Concierge インスタンス名には、`--aepUserLdap-- - CitiSignal Brand Concierge` を使用します。

**コンシェルジュで実行する操作** の下に次のテキストを入力します。

```javascript
Brand Concierge should help customers find their best device, plan or entertainment deal. Brand Concierge should help users discover internet plans, entertainment deals,  and help find the best available packages. Brand Concierge should also answer questions about devices such as phones and watches.
```

「**作成**」をクリックします。

![Brand Concierge](./images/bc5.png)

この画像が表示されます。 **開始** をクリックして、ナレッジソースを追加してください。

![Brand Concierge](./images/bc6.png)

**Web サイトリンク** を選択し、「**続行**」をクリックします。

![Brand Concierge](./images/bc7.png)

この画像が表示されます。 ナレッジソースの名前として `CitiSignal website` を入力します。

次に、web サイトのリンクを含む csv ファイルをアップロードする必要があります。 [CitiSignal web サイトは CSV ファイル ](./assets/citisignal-website-links.csv) をデスクトップにダウンロードします。

**ファイルを参照** をクリックします。

![Brand Concierge](./images/bc8.png)

ファイル **citisignal-website-links.csv** を開き、リンクを更新して、独自の CitiSignal web サイトを指すようにします。

![Brand Concierge](./images/bc8a.png)

ダウンロードして編集したばかりのファイル **citisignal-website-links.csv** を選択します。 「**開く**」をクリックします。

![Brand Concierge](./images/bc9.png)

これで、ファイルがこのナレッジソースに追加されました。 「**追加**」をクリックします。

![Brand Concierge](./images/bc10.png)

この画像が表示されます。 「**ホームに移動** をクリックします。

![Brand Concierge](./images/bc11.png)

この画像が表示されます。 **コンシューマー向け製品アドバイザリ** カードの **開始** をクリックします。

![Brand Concierge](./images/bc12.png)



```
CitiSignal is a telecommunications company that sells devices such as phones and watches and that sells internet services such as their lead product CitiSignal Fiber Max. On top of that, CitiSignal sells entertainment services that offer premium streaming services at a discounted price. CitiSignal is targeting these 3 personas primarily: Smart Home Families, Online Gamers and Remote Professionals.
```

```
Prioritize positioning the CitiSignal Fiber Max offering.
```

```
Competitor pricing, competitor products
```

更新内容は自動的に保存されます。 **矢印** をクリックすると、前の画面に戻ります。

![Brand Concierge](./images/bc13.png)

この画像が表示されます。 **開始** をクリックして、ブランド式をカスタマイズします。

![Brand Concierge](./images/bc14.png)

**ブランド式** ページで独自の選択を行うことができます。

![Brand Concierge](./images/bc15.png)

下にスクロールして、「応答の長さ **フィールドの設定を選択し** す。

更新内容は自動的に保存されます。

![Brand Concierge](./images/bc16.png)

上にスクロールし、**矢印** をクリックして前の画面に戻ります。

![Brand Concierge](./images/bc17.png)


[Brand Concierge](./brandconcierge.md){target="_blank"} に戻る

[ すべてのモジュールに戻る ](./../../../overview.md){target="_blank"}