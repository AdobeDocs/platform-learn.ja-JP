---
title: AJOとGenStudio for Performance Marketing
description: AJOとGenStudio for Performance Marketing
kt: 5342
doc-type: tutorial
exl-id: 1424f649-d004-4b14-b8af-927ca1d47de5
source-git-commit: 10f1f6a1f77c41e3c912b3d03b73da7b6c68670c
workflow-type: tm+mt
source-wordcount: '891'
ht-degree: 6%

---

# 3.6.3 AJOとGenStudio for Performance Marketing

>[!IMPORTANT]
>
>この演習を行うには、GenStudio for Performance Marketing（現在はベータ版）との統合用にプロビジョニングされたAdobe Journey Optimizer環境にアクセスできる必要があります。

>[!IMPORTANT]
>
>この演習を行うには、Adobe GenStudio for Performance Marketing用にプロビジョニングされたインスタンスにアクセスできる必要があります。

>[!IMPORTANT]
>
>この演習のすべての手順を実行するには、既存のAdobe Workfront環境にアクセスする必要があり、その環境でプロジェクトと承認ワークフローを作成する必要があります。 [Adobe Workfrontによるワークフロー管理 &#x200B;](./../../../../modules/workflow-planning/module1.2/workfront.md){target="_blank"} の演習に従うと、必要な設定を使用できるようになります。

## Adobe GenStudio1.3.4.1 メールエクスペリエンスを作成および承認する

[https://experience.adobe.com/](https://experience.adobe.com/){target="_blank"} に移動します。 **GenStudio** を開きます。

![GSPeM](./../../../creation-production/module1.3/images/gspem1.png)

この画像が表示されます。 左側のメニューで、**作成** に移動します。 **メール** を選択します。

![GSPeM](./../../../creation-production/module1.3/images/gsemail1.png)

以前に読み込んだ **メール** テンプレート（`--aepUserLdap---citisignal-email-template` という名前）を選択します。 **使用** をクリックします。

![GSPeM](./../../../creation-production/module1.3/images/gsemail2.png)

この画像が表示されます。 広告の名前を `--aepUserLdap-- - Email Online Gamers Fiber Max` に変更します。

![GSPeM](./../../../creation-production/module1.3/images/gsemail3.png)

**パラメーター** で、次のオプションを選択します。

- **ブランド**: `--aepUserLdap-- - CitiSignal`
- **言語**: `English (US)`
- **ペルソナ**: `--aepUserLdap-- - Smart Home Families`
- **製品**: `--aepUserLdap-- - CitiSignal Fiber Max`

**コンテンツから選択** をクリックします。

![GSPeM](./../../../creation-production/module1.3/images/gsemail4.png)

アセット `--aepUserLdap-- - neon rabbit.png` を選択します。 **使用** をクリックします。

![GSPeM](./../../../creation-production/module1.3/images/gsemail5.png)

プロンプト `convince online gamers to start playing online multiplayer games using CitiSignal internet` を入力し、「**生成**」をクリックします。

![GSPeM](./../../../creation-production/module1.3/images/gsemail6.png)

次に、4 つのメールバリエーションが生成された、次のようになります。 デフォルト表示では **モバイル** 表示が表示され、**コンピューター** アイコンをクリックするとデスクトップビューに切り替えることができます。

![GSPeM](./../../../creation-production/module1.3/images/gsemail7.png)

メールごとに、準拠スコアが自動的に計算されます。 スコアをクリックすると詳細が表示されます。

![GSPeM](./../../../creation-production/module1.3/images/gsemail8.png)

**問題を表示して修正** をクリックします。

![GSPeM](./../../../creation-production/module1.3/images/gsemail9.png)

その後、複雑さのスコアを最適化するために何ができるかについて、より詳細を確認できます。

![GSPeM](./../../../creation-production/module1.3/images/gsemail10.png)

次に、「**承認をリクエスト**」をクリックすると、Adobe Workfrontに接続します。

![GSPeM](./../../../creation-production/module1.3/images/gsemail11.png)

Adobe Workfront プロジェクトを選択します。`--aepUserLdap-- - CitiSignal Fiber Launch` という名前を付ける必要があります。 **ユーザーを招待** の下に自分のメールアドレスを入力し、自分の役割が **承認者** に設定されていることを確認します。

![GSPeM](./../../../creation-production/module1.3/images/gsemail12.png)

または、Adobe Workfrontで既存の承認ワークフローを使用することもできます。 それには、「**テンプレートを使用** をクリックし、テンプレート `--aepuserLdap-- - Approval Workflow` を選択します。 「**送信**」をクリックします。

![GSPeM](./../../../creation-production/module1.3/images/gsemail13.png)

「**Workfrontでコメントを表示**」をクリックすると、Adobe Workfront Proof UI に送信されるようになります。

![GSPeM](./../../../creation-production/module1.3/images/gsemail14.png)

Adobe Workfront Proof UI で、「**決定する**」をクリックします。

![GSPeM](./../../../creation-production/module1.3/images/gsemail15.png)

「**承認済み**」を選択し、「**決定する**」をクリックします。

![GSPeM](./../../../creation-production/module1.3/images/gsemail16.png)

「**公開**」をクリックします。

![GSPeM](./../../../creation-production/module1.3/images/gsemail17.png)

Campaign `--aepUserLdap-- - CitiSignal Fiber Launch Campaign` を選択し、「**公開** をクリックします。

![GSPeM](./../../../creation-production/module1.3/images/gsemail18.png)

**コンテンツで開く** をクリックします。

![GSPeM](./../../../creation-production/module1.3/images/gsemail19.png)

4 つのメールエクスペリエンスを **コンテンツ**/**エクスペリエンス** で使用できるようになりました。

![GSPeM](./../../../creation-production/module1.3/images/gsemail20.png)

## AJO1.3.4.2 キャンペーンを作成するには

[Adobe Experience Cloud](https://experience.adobe.com) に移動して、Adobe Journey Optimizerにログインします。 **Journey Optimizer** をクリックします。

![ACOP](./../../../../modules/delivery-activation/ajo-b2c/ajob2c-1/images/acophome.png)

Journey Optimizerの **ホーム** ビューにリダイレクトされます。 最初に、正しいサンドボックスを使用していることを確認します。 使用するサンドボックスは `--aepSandboxName--` です。 その後、サンドボックス **ージの** ホーム `--aepSandboxName--` ビューに移動します。

![ACOP](./../../../../modules/delivery-activation/ajo-b2c/ajob2c-1/images/acoptriglp.png)

次に、キャンペーンを作成します。 前の演習のイベントベースのジャーニーは、受信エクスペリエンスイベントやオーディエンスの入口または出口に依存して 1 人の特定顧客のジャーニーをトリガーにするのとは異なり、キャンペーンは、ニュースレター、1 回限りのプロモーション、一般的な情報などの一意のコンテンツで 1 回、またはインスタンスの誕生日キャンペーンやリマインダーなどの定期的に送信される同様のコンテンツで、オーディエンス全体をターゲットにします。

メニューで、「**キャンペーン**」に移動し、「**キャンペーンを作成**」をクリックします。

![Journey Optimizer](./../../../creation-production/module1.3/images/gsemail21.png)

**スケジュール型 – マーケティング** を選択し、「**作成**」をクリックします。

![Journey Optimizer](./../../../creation-production/module1.3/images/gsemail22.png)

キャンペーンの作成画面で、以下を設定します。

- **名前**:`--aepUserLdap--  - Online Gamers CitiSignal Fiber Max`。
- **説明**：オンラインゲーマー向けファイバーキャンペーン

**アクション** をクリックします。

![Journey Optimizer](./../../../creation-production/module1.3/images/gsemail23.png)

「**+アクションを追加**」をクリックし、「**メール**」を選択します。

![Journey Optimizer](./../../../creation-production/module1.3/images/gsemail24.png)

次に、既存の **メール設定** を選択し、「**コンテンツを編集**」をクリックします。

![Journey Optimizer](./../../../creation-production/module1.3/images/gsemail25.png)

その後、これが表示されます。 **件名** には、次を使用します。

```
{{profile.person.name.firstName}}, say goodbye to delays!
```

次に、「**コンテンツを編集**」をクリックします。

![Journey Optimizer](./../../../creation-production/module1.3/images/gsemail26.png)

**HTMLを読み込み** をクリックします。

![Journey Optimizer](./../../../creation-production/module1.3/images/gsemail27.png)

次に、**Adobe GenStudio for Performance Marketing** のボタンをクリックします。

![Journey Optimizer](./../../../creation-production/module1.3/images/gsemail28.png)

GenStudio for Performance Marketingで公開されたすべてのメールエクスペリエンスを示すポップアップウィンドウが表示されます。 使用可能なメールエクスペリエンスの 1 つを選択し、「**使用**」をクリックします。

![Journey Optimizer](./../../../creation-production/module1.3/images/gsemail29.png)

独自のAEM Assets CS リポジトリを選択して（`--aepUserLdap-- - CitiSignal dev` という名前にする必要があります）、「**インポート**」をクリックします。

![Journey Optimizer](./../../../creation-production/module1.3/images/gsemail30.png)

この画像が表示されます。 不足している画像ボタンを選択し、「**アセットを選択**」をクリックします。

![Journey Optimizer](./../../../creation-production/module1.3/images/gsemail31.png)

**GenStudio.zip.....から、次のようなフォルダーに移動します画像** を `--aepUserLdap-- - neon rabbit.png` して選択します。 クリック **選択**

![Journey Optimizer](./../../../creation-production/module1.3/images/gsemail32.png)

この画像が表示されます。

![Journey Optimizer](./../../../creation-production/module1.3/images/gsemail33.png)

フッターまでスクロールダウンし、「**登録解除**」という単語を選択し、「**リンク**」アイコンをクリックします。

![Journey Optimizer](./../../../creation-production/module1.3/images/gsemail38.png)

**タイプ** を **外部オプトアウト/購読解除** に設定し、URL を `https://techinsiders.org/unsubscribe.html` に設定します（購読解除リンクに空白の URL を指定することはできません）。

「**保存**」をクリックしてから、画面の左上隅にある **矢印** をクリックして、キャンペーン設定に戻ります。

![Journey Optimizer](./../../../creation-production/module1.3/images/gsemail39.png)

**オーディエンス** に移動します。

![Journey Optimizer](./../../../creation-production/module1.3/images/gsemail34.png)

**オーディエンスを選択** をクリックします。

![Journey Optimizer](./../../../creation-production/module1.3/images/gsemail35.png)

オンラインゲーマーの購読リストのオーディエンスを選択します。このオーディエンスには、`--aepUserLdap--_SL_Interest_Online_Gaming` という名前を付ける必要があります。 「**保存**」をクリックします。

![Journey Optimizer](./../../../creation-production/module1.3/images/gsemail36.png)

**アクティブ化するレビュー** をクリックします。

![Journey Optimizer](./../../../creation-production/module1.3/images/gsemail37.png)

Campaign の設定に問題がない場合は、「**アクティブ化**」をクリックできます。

![Journey Optimizer](./../../../creation-production/module1.3/images/gsemail40.png)

その後、キャンペーンがアクティブ化されます（数分かかります）。

![Journey Optimizer](./../../../creation-production/module1.3/images/gsemail41.png)

数分後にキャンペーンはライブになり、選択した購読リストにメールが送信されます。

![Journey Optimizer](./../../../creation-production/module1.3/images/gsemail42.png)

これで、この演習が完了しました。

## 次の手順

[&#x200B; 概要とメリット &#x200B;](./summary.md) に移動します。

[Adobe Journey Optimizer：コンテンツ管理 &#x200B;](./ajocontent.md){target="_blank"} に戻る

[&#x200B; すべてのモジュール &#x200B;](./../../../../overview.md){target="_blank"} に戻る
