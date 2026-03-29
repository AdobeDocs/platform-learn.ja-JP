---
title: Brand Conciergeの導入方法
description: Brand Conciergeの導入方法
kt: 5342
doc-type: tutorial
exl-id: e05b60b1-62d7-4b70-834d-ef91782ac388
source-git-commit: fcf99e48868fd0b189291a7215a2871387ea7532
workflow-type: tm+mt
source-wordcount: '1075'
ht-degree: 1%

---

# 1.4.1 Brand Conciergeの概要

## 1.4.1.1 Brand Conciergeの概要

Brand Conciergeの設定では、主に次の2つの要素を使用します。

- **エージェント コンポーザー（設定レイヤー）**

  目的：会話型AI エクスペリエンスの構築と設定に使用される主要なUI プラットフォーム。

  主な責任：

   - データソースとナレッジベースを定義および管理する
   - ブランド表現（トーン、スタイル、ガードレール）の設定
   - ミーティング予約エージェントの設定

- **Agent Orchestrator （実行エンジン）**

  目的：ユーザーリクエストを解釈し、適切なエージェントアクションを実行する推論およびオーケストレーションエンジン。

  主な責任：

   - 自然言語ユーザーの意図を解釈する
   - マルチステップの推論計画を生成して実行
   - 適切なオペレーター/ツールを選択して呼び出します
   - ブランドのコンテキスト、コンプライアンス、ガードレールの適用
   - 複数の担当者によるワークフローの調整
   - 複数のデータソースから応答を集約して構成する

- **Brand Concierge Conversation Runtime （サービスレイヤー）**

  目的：チャットセッション、コンテキスト、顧客とのやり取りを管理する、顧客向けの会話型サービスレイヤー。

  主要コンポーネント：

   - Web Agent （クライアント）:Web SDKを使用して統合されたブラウザーまたはモバイルチャット UI
   - 会話サービス（バックエンド）: セッション状態を管理し、オーケストレーションゲートウェイとして機能します

  主な責任：

   - ユーザーセッションと会話トランスクリプトの管理
   - ユーザー認証とプロファイルの処理
   - クライアントとAgent Orchestrator間でメッセージをルーティングする
   - 会話コンテキストの永続化
   - Adobe Analytics用にAEPに行動イベントと運用イベントを記録する
   - サーフェス固有の設定の適用

## 1.4.1.2 Brand Concierge インスタンス設定

独自のBrand Concierge インスタンスの作成を開始するには、次の手順に従います。

[https://experience.adobe.com/](https://experience.adobe.com/){target="_blank"}に移動します。 **Brand Concierge**&#x200B;を開きます。

![Brand Concierge](./images/bc1.png)

そうすると、これが表示されます。 「**サンドボックス選択**」メニューをクリックします。 自分に割り当てられたサンドボックスを選択します。 そのサンドボックスには`techinsidersX`という名前を付ける必要があります（Xを割り当てられた番号に置き換えます）。

![Brand Concierge](./images/bc2.png)

次に、次の変数に入力します。

- **会社名**: CitiSignal

- **コンシェルジュ名**: `CitiSignal Sales Assistant`。

「**コンシェルジュに何をしてもらいますか？**」の下に次のテキストを入力します。

```javascript
Brand Concierge should help customers find their best device, plan or entertainment deal. Brand Concierge should help users discover internet plans, entertainment deals,  and help find the best available packages. Brand Concierge should also answer questions about devices such as phones and watches.
```

- **Web サイトのリンク**：使用しているWeb サイトへのリンクを指定します

「**続行**」をクリックします。

![Brand Concierge](./images/bc5.png)

そうすると、これが表示されます。 この情報は、前のページで提供された入力に基づいて、AIを使用して生成されました。 情報を確認し、満足したら、**コンシェルジュの生成**&#x200B;をクリックします。

![Brand Concierge](./images/bc6.png)

そうすると、これが表示されます。 **消費者に関する製品アドバイザリー**&#x200B;の横にある&#x200B;**+追加**&#x200B;をクリックします。

![Brand Concierge](./images/bc6a.png)

そうすると、これが表示されます。 以下のテキストを使用して、次のフィールドに入力します。

**コンシェルジュは、レコメンデーションを行う前に、商品またはオーディエンスについて何を知っておくべきですか？**

```
CitiSignal is a telecommunications company that sells devices such as phones and watches and that sells internet services such as their lead product CitiSignal Fiber Max. On top of that, CitiSignal sells entertainment services that offer premium streaming services at a discounted price. CitiSignal is targeting these 3 personas primarily: Smart Home Families, Online Gamers and Remote Professionals.
```

**コンシェルジュが推奨事項を提案する際に従うべきビジネス ルールや制限はありますか？**

```
Prioritize positioning the CitiSignal Fiber Max offering.
```

**コンシェルジュがフォローまたは避けるべき特定のキーワードやフレーズはありますか？**

```
Competitor pricing, competitor products
```

「**保存**」をクリックします。

![Brand Concierge](./images/bc13.png)

**矢印**&#x200B;をクリックして、前の画面に戻ります。

![Brand Concierge](./images/bc13a.png)

**ナレッジSource**&#x200B;に移動し、**ナレッジソースを作成**&#x200B;をクリックします。

![Brand Concierge](./images/bc7.png)

**Web サイトのリンク**&#x200B;を選択し、**続行**&#x200B;をクリックします。

![Brand Concierge](./images/bc7a.png)

そうすると、これが表示されます。 ナレッジソースの名前として`CitiSignal website`を入力します。

次に、web サイトのリンクを含むcsv ファイルをアップロードする必要があります。 [CitiSignal web サイトをダウンロードすると、CSV ファイル &#x200B;](./assets/citisignal-website-links.csv)がデスクトップにリンクされます。

「**ファイルを参照**」をクリックします。

![Brand Concierge](./images/bc8.png)

ファイル **citisignal-website-links.csv**&#x200B;を開き、リンクを更新して独自のCitiSignal web サイトを指すようにします。

![Brand Concierge](./images/bc8a.png)

ダウンロードして編集したばかりのファイル **citisignal-website-links.csv**&#x200B;を選択します。 「**開く**」をクリックします。

![Brand Concierge](./images/bc9.png)

これで、このナレッジソースにファイルが追加されました。 「**追加**」をクリックします。

![Brand Concierge](./images/bc10.png)

そうすると、これが表示されます。 「**ナレッジソースを作成する**」をクリックします。

![Brand Concierge](./images/bc11.png)

**製品カタログ**&#x200B;を選択し、**続行**&#x200B;をクリックします。

![Brand Concierge](./images/bc20.png)

そうすると、これが表示されます。 ナレッジソースの名前として`CitiSignal Products`を入力します。 「**ファイルを参照**」をクリックし、**デバイスから参照**&#x200B;を選択します。

![Brand Concierge](./images/bc21.png)

次に、web サイトのリンクを含むcsv ファイルをアップロードする必要があります。 [CitiSignal製品カタログ &#x200B;](./assets/CitiSignal-catalog.json.zip)をデスクトップにダウンロードし、解凍します。

![Brand Concierge](./images/bc26.png)

ファイル **CitiSignal-catalog.json**&#x200B;を選択し、**開く**&#x200B;をクリックします。

![Brand Concierge](./images/bc23.png)

そうすると、これが表示されます。 「**追加**」をクリックします。

![Brand Concierge](./images/bc24.png)

その後、ここに戻ります。 処理には10～20分かかるので、処理が成功したかどうかを確認するために、後の段階で戻ってくる必要があります。

![Brand Concierge](./images/bc25.png)

## 1.4.1.3件のAEP オンボーディング手順

Brand Conciergeは、Adobe Experience Platformを使用して、会話のインタラクションデータを保存します。 Brand ConciergeとExperience Platform間の接続には、Brand Conciergeでデータストリームを設定して使用する必要があります。

### データストリーム

[https://experience.adobe.com/](https://experience.adobe.com/){target="_blank"}に移動します。 **Experience Platform**&#x200B;を開きます。

![Brand Concierge](./images/aep1.png)

`techinsidersX`という名前の適切なサンドボックスが選択されていることを確認します。 左側のメニューで、下にスクロールして「**データストリーム**」を選択します。

![Brand Concierge](./images/aep2.png)

**新規データストリーム**&#x200B;をクリックします。

![Brand Concierge](./images/aep3.png)

**データストリーム名** `--aepUserLdap-- - Brand Concierge`を入力し、**マッピングスキーマ** `cja-brand-concierge-sb-XXX`を選択します。

「**保存**」をクリックします。

![Brand Concierge](./images/aep4.png)

これで、データストリームが設定されました。 データストリーム名とデータストリーム IDをコピーし、コンピューター上のテキストファイルに書き留めます。

![Brand Concierge](./images/aep5.png)

### データストリームの設定管理

次の手順では、Brand Concierge Configuration Management APIを有効にして、作成したばかりのデータストリームを設定します。 これは、リクエスト処理中にIMS Org IDやサンドボックスの詳細などを解決するために必要です。

**ホーム**&#x200B;に移動し、**管理者コントロール**&#x200B;を選択します。

![Brand Concierge](./images/admincontrols1.png)

**Datastream Config Management**&#x200B;に移動し、**Add Config**&#x200B;をクリックします。

![Brand Concierge](./images/admincontrols2.png)

前に作成したデータストリームの&#x200B;**データストリーム ID**&#x200B;を貼り付けます。 「**保存**」をクリックします。

![Brand Concierge](./images/admincontrols3.png)

このような表示になります。

![Brand Concierge](./images/admincontrols4.png)

## 1.4.1.4 スタイル設定の管理

**スタイル設定の管理**&#x200B;に移動します。 「**スタイル設定を初期化**」をクリックします。

![Brand Concierge](./images/admincontrols7.png)

**ブランド名** `CitiSignal`を入力し、**スタイル設定の初期化**&#x200B;をクリックします。

![Brand Concierge](./images/admincontrols8.png)

そうすると、これが表示されます。

![Brand Concierge](./images/admincontrols9.png)

## 1.4.1.5 Agent Orchestrator マニフェスト

**マニフェストの更新**&#x200B;に移動します。 そうすると、これが表示されます。 各フィールドの情報を確認し、必要に応じて変更を加えます。 変更を加えたら、「マニフェストを更新**をクリックします。

![Brand Concierge](./images/admincontrols5.png)

## 1.4.1.6 ナレッジソースの設定を完了

**ナレッジソース**&#x200B;に移動します。 10 ～ 20分後、両方のナレッジソースの&#x200B;**ステータス**&#x200B;は&#x200B;**完了**&#x200B;である必要があります。 両方のナレッジソースのステータスが&#x200B;**Success**&#x200B;になったら、**Home**&#x200B;をクリックします。

![Brand Concierge](./images/admincontrols10.png)

そうすると、これが表示されます。 **Web サイトのリンク** カードの&#x200B;**+接続**&#x200B;をクリックします。

![Brand Concierge](./images/bc28.png)

ナレッジソース **CitiSignal Web サイト**&#x200B;を選択し、**保存**&#x200B;をクリックします。

![Brand Concierge](./images/bc29.png)

そうすると、これが表示されます。 **製品カタログ** カードの&#x200B;**+ Connect**&#x200B;をクリックします。

![Brand Concierge](./images/bc30.png)

ナレッジソース **CitiSignal Products**&#x200B;を選択し、**保存**&#x200B;をクリックします。

![Brand Concierge](./images/bc31.png)

そうすると、これが表示されます。 **Preview**&#x200B;をクリックして、Brand Conciergeの操作を開始します。

![Brand Concierge](./images/bc32.png)

提供されたナレッジソースに関連する質問を開始できるようになりました。

![Brand Concierge](./images/bc33.png)

質問`what products do you sell?`を入力し、**send**&#x200B;をクリックします。

![Brand Concierge](./images/bc102.png)

同様の回答を返すべきです。

![Brand Concierge](./images/bc103.png)

これで、Brand Concierge インスタンスをweb サイトに実装する準備が整いました。

## 次の手順

[Web サイトへのBrand Conciergeの実装](./ex2.md){target="_blank"}に移動します

[Brand Concierge](./brandconcierge.md){target="_blank"}に戻る

[すべてのモジュールに戻る](./../../../overview.md){target="_blank"}
