---
title: Meta に対するGenStudio for Performance Marketing Campaign のアクティブ化
description: Meta に対するGenStudio for Performance Marketing Campaign のアクティブ化
role: Developer
level: Beginner
jira: KT-5342
doc-type: Tutorial
source-git-commit: 4d8952cdd136e9bf3a82fa864de4d51641bcbfd8
workflow-type: tm+mt
source-wordcount: '854'
ht-degree: 6%

---

# 1.3.4 AJO用のメールエクスペリエンスの作成

>[!IMPORTANT]
>
>この演習を行うには、GenStudio for Performance Marketing（現在はベータ版）との統合用にプロビジョニングされたAdobe Journey Optimizer環境にアクセスできる必要があります。

>[!IMPORTANT]
>
>この演習のすべての手順を実行するには、既存のAdobe Workfront環境にアクセスする必要があり、その環境でプロジェクトと承認ワークフローを作成する必要があります。 [Adobe Workfrontによるワークフロー管理 ](./../../../modules/asset-mgmt/module2.2/workfront.md){target="_blank"} の演習に従うと、必要な設定を使用できるようになります。

## 1.3.4.1 メール作成および承認エクスペリエンス

左側のメニューで、**作成** に移動します。 **メール** を選択します。

![GSPeM](./images/gsemail1.png)

以前に読み込んだ **メール** テンプレート（`--aepUserLdap---citisignal-email-template` という名前）を選択します。 **使用** をクリックします。

![GSPeM](./images/gsemail2.png)

この画像が表示されます。 広告の名前を `--aepUserLdap-- - Email Online Gamers Fiber Max` に変更します。

![GSPeM](./images/gsemail3.png)

**パラメーター** で、次のオプションを選択します。

- **ブランド**: `--aepUserLdap-- - CitiSignal`
- **言語**: `English (US)`
- **ペルソナ**: `--aepUserLdap-- - Smart Home Families`
- **製品**: `--aepUserLdap-- - CitiSignal Fiber Max`

**コンテンツから選択** をクリックします。

![GSPeM](./images/gsemail4.png)

アセット `--aepUserLdap-- - neon rabbit.png` を選択します。 **使用** をクリックします。

![GSPeM](./images/gsemail5.png)

プロンプト `convince online gamers to start playing online multiplayer games using CitiSignal internet` を入力し、「**生成**」をクリックします。

![GSPeM](./images/gsemail6.png)

次に、4 つのメールバリエーションが生成された、次のようになります。 デフォルト表示では **モバイル** 表示が表示され、**コンピューター** アイコンをクリックするとデスクトップビューに切り替えることができます。

![GSPeM](./images/gsemail7.png)

メールごとに、準拠スコアが自動的に計算されます。 スコアをクリックすると詳細が表示されます。

![GSPeM](./images/gsemail8.png)

**問題を表示して修正** をクリックします。

![GSPeM](./images/gsemail9.png)

その後、複雑さのスコアを最適化するために何ができるかについて、より詳細を確認できます。

![GSPeM](./images/gsemail10.png)

次に、「**承認をリクエスト**」をクリックすると、Adobe Workfrontに接続します。

![GSPeM](./images/gsemail11.png)

Adobe Workfront プロジェクトを選択します。`--aepUserLdap-- - CitiSignal Fiber Launch` という名前を付ける必要があります。 **ユーザーを招待** の下に自分のメールアドレスを入力し、自分の役割が **承認者** に設定されていることを確認します。

![GSPeM](./images/gsemail12.png)

または、Adobe Workfrontで既存の承認ワークフローを使用することもできます。 それには、「**テンプレートを使用** をクリックし、テンプレート `--aepuserLdap-- - Approval Workflow` を選択します。 「**送信**」をクリックします。

![GSPeM](./images/gsemail13.png)

「**Workfrontでコメントを表示**」をクリックすると、Adobe Workfront Proof UI に送信されるようになります。

![GSPeM](./images/gsemail14.png)

Adobe Workfront Proof UI で、「**決定する**」をクリックします。

![GSPeM](./images/gsemail15.png)

「**承認済み**」を選択し、「**決定する**」をクリックします。

![GSPeM](./images/gsemail16.png)

「**公開**」をクリックします。

![GSPeM](./images/gsemail17.png)

Campaign `--aepUserLdap-- - CitiSignal Fiber Launch Campaign` を選択し、「**公開** をクリックします。

![GSPeM](./images/gsemail18.png)

**コンテンツで開く** をクリックします。

![GSPeM](./images/gsemail19.png)

4 つのメールエクスペリエンスを **コンテンツ**/**エクスペリエンス** で使用できるようになりました。

![GSPeM](./images/gsemail20.png)

## AJO1.3.4.2 キャンペーンを作成するには

[Adobe Experience Cloud](https://experience.adobe.com) に移動して、Adobe Journey Optimizerにログインします。 **Journey Optimizer** をクリックします。

![ACOP](./../../../modules/delivery-activation/ajo-b2c/ajob2c-1/images/acophome.png)

Journey Optimizerの **ホーム** ビューにリダイレクトされます。 最初に、正しいサンドボックスを使用していることを確認します。 使用するサンドボックスは `--aepSandboxName--` です。 その後、サンドボックス **ージの** ホーム `--aepSandboxName--` ビューに移動します。

![ACOP](./../../../modules/delivery-activation/ajo-b2c/ajob2c-1/images/acoptriglp.png)

次に、キャンペーンを作成します。 前の演習のイベントベースのジャーニーは、受信エクスペリエンスイベントやオーディエンスの入口または出口に依存して 1 人の特定顧客のジャーニーをトリガーにするのとは異なり、キャンペーンは、ニュースレター、1 回限りのプロモーション、一般的な情報などの一意のコンテンツで 1 回、またはインスタンスの誕生日キャンペーンやリマインダーなどの定期的に送信される同様のコンテンツで、オーディエンス全体をターゲットにします。

メニューで、「**キャンペーン**」に移動し、「**キャンペーンを作成**」をクリックします。

![Journey Optimizer](./images/gsemail21.png)

**スケジュール型 – マーケティング** を選択し、「**作成**」をクリックします。

![Journey Optimizer](./images/gsemail22.png)

キャンペーンの作成画面で、以下を設定します。

- **名前**:`--aepUserLdap--  - Online Gamers CitiSignal Fiber Max`。
- **説明**：オンラインゲーマー向けファイバーキャンペーン

**アクション** をクリックします。

![Journey Optimizer](./images/gsemail23.png)

「**+アクションを追加**」をクリックし、「**メール**」を選択します。

![Journey Optimizer](./images/gsemail24.png)

次に、既存の **メール設定** を選択し、「**コンテンツを編集**」をクリックします。

![Journey Optimizer](./images/gsemail25.png)

その後、これが表示されます。 **件名** には、次を使用します。

```
{{profile.person.name.firstName}}, say goodbye to delays!
```

次に、「**コンテンツを編集**」をクリックします。

![Journey Optimizer](./images/gsemail26.png)

**HTMLを読み込み** をクリックします。

![Journey Optimizer](./images/gsemail27.png)

次に、**Adobe GenStudio for Performance Marketing** のボタンをクリックします。

![Journey Optimizer](./images/gsemail28.png)

GenStudio for Performance Marketingで公開されたすべてのメールエクスペリエンスを示すポップアップウィンドウが表示されます。 使用可能なメールエクスペリエンスの 1 つを選択し、「**使用**」をクリックします。

![Journey Optimizer](./images/gsemail29.png)

独自のAEM Assets CS リポジトリを選択して（`--aepUserLdap-- - CitiSignal dev` という名前にする必要があります）、「**インポート**」をクリックします。

![Journey Optimizer](./images/gsemail30.png)

この画像が表示されます。 不足している画像ボタンを選択し、「**アセットを選択**」をクリックします。

![Journey Optimizer](./images/gsemail31.png)

**GenStudio.zip.....から、次のようなフォルダーに移動します画像** を `--aepUserLdap-- - neon rabbit.png` して選択します。 クリック **選択**

![Journey Optimizer](./images/gsemail32.png)

この画像が表示されます。

![Journey Optimizer](./images/gsemail33.png)

フッターまでスクロールダウンし、「**登録解除**」という単語を選択し、「**リンク**」アイコンをクリックします。

![Journey Optimizer](./images/gsemail38.png)

**タイプ** を **外部オプトアウト/購読解除** に設定し、URL を `https://techinsiders.org/unsubscribe.html` に設定します（購読解除リンクに空白の URL を指定することはできません）。

「**保存**」をクリックしてから、画面の左上隅にある **矢印** をクリックして、キャンペーン設定に戻ります。

![Journey Optimizer](./images/gsemail39.png)

**オーディエンス** に移動します。

![Journey Optimizer](./images/gsemail34.png)

**オーディエンスを選択** をクリックします。

![Journey Optimizer](./images/gsemail35.png)

オンラインゲーマーの購読リストのオーディエンスを選択します。このオーディエンスには、`--aepUserLdap--_SL_Interest_Online_Gaming` という名前を付ける必要があります。 「**保存**」をクリックします。

![Journey Optimizer](./images/gsemail36.png)

**アクティブ化するレビュー** をクリックします。

![Journey Optimizer](./images/gsemail37.png)

Campaign の設定に問題がない場合は、「**アクティブ化**」をクリックできます。

![Journey Optimizer](./images/gsemail40.png)

その後、キャンペーンがアクティブ化されます（数分かかります）。

![Journey Optimizer](./images/gsemail41.png)

数分後にキャンペーンはライブになり、選択した購読リストにメールが送信されます。

![Journey Optimizer](./images/gsemail42.png)

これで、この演習が完了しました。

## 次の手順

[ 概要とメリット ](./summary.md){target="_blank"} に移動します。

[GenStudio for Performance Marketing](./genstudio.md){target="_blank"} に戻る

[ すべてのモジュール ](./../../../overview.md){target="_blank"} に戻る
