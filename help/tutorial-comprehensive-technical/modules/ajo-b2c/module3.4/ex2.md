---
title: Adobe Journey Optimizer - バッチベースのジャーニーの設定
description: この節では、ニュースレターを送信するバッチメールジャーニーを設定します
kt: 5342
doc-type: tutorial
source-git-commit: 7d2f5f842559b2d6d9f115f3993268a4b36a0fe0
workflow-type: tm+mt
source-wordcount: '794'
ht-degree: 8%

---

# 3.4.2 バッチベースのニュースレタージャーニーの設定

[Adobe Experience Cloud](https://experience.adobe.com) に移動して、Adobe Journey Optimizerにログインします。 **Journey Optimizer** をクリックします。

![ACOP](./../../../modules/ajo-b2c/module3.2/images/acophome.png)

Journey Optimizerの **ホーム** ビューにリダイレクトされます。 最初に、正しいサンドボックスを使用していることを確認します。 使用するサンドボックスは `--aepSandboxId--` です。 サンドボックスを切り替えるには、「**実稼動製品（VA7）」をクリックし** リストからサンドボックスを選択します。 この例では、サンドボックスの名前は **AEP イネーブルメント FY22** です。 その後、サンドボックス `--aepSandboxId--` ージの **ホーム** ビューに移動します。

![ACOP](./../../../modules/ajo-b2c/module3.2/images/acoptriglp.png)

## 3.4.2.1 ニュースレタージャーニーの作成

ここでは、バッチベースのジャーニーを作成します。 前の演習のイベントベースのジャーニーは、受信するエクスペリエンスイベントやセグメントの入口または出口に依存して 1 人の顧客のジャーニーをトリガーするのとは異なり、バッチベースのジャーニーは、ニュースレター、1 回限りのプロモーション、一般的な情報などの一意のコンテンツで 1 回、またはインスタンスの誕生日キャンペーンやリマインダーなどの定期的に送信される同様のコンテンツで 1 回セグメント全体をターゲットにします。

メニューで、**ジャーニーに移動し** 「**ジャーニーを作成**」をクリックします。

![Journey Optimizer](./images/oc43.png)

右側に、ジャーニーの名前と説明を指定する必要があるフォームが表示されます。 次の値を入力します。

- **名前**:`--demoProfileLdap-- - Newsletter Journey`。 例：**vangeluw - ニュースレタージャーニー**。
- **説明**：月刊ニュースレター

「**OK**」をクリックします。

![Journey Optimizer](./images/batchj2.png)

**オーケストレーション** の下の **セグメントを読み取り** をキャンバスにドラッグ&amp;ドロップします。 つまり、公開が完了すると、セグメントオーディエンス全体の取得からジャーニーが開始され、ジャーニーとメッセージのターゲットオーディエンスになります。 **セグメントを選択** をクリックします。

![Journey Optimizer](./images/batchj3.png)

**セグメントを選択** ポップアップで、LDAP を検索し、[ モジュール 2.3 - Real-time CDP - セグメントを作成してアクションを実行 ](./../../../modules/rtcdp-b2c/module2.3/real-time-cdp-build-a-segment-take-action.md) という名前のセグメントを選択し `--demoProfileLdap-- - Interest in PROTEUS FITNESS JACKSHIRT` す。 例：vangeluw - Interest in PROTEUS FITNESS JACKSHIRT。 「**保存**」をクリックします。

![Journey Optimizer](./images/batchj5.png)

「**OK**」をクリックします。

![Journey Optimizer](./images/batchj6.png)

左側のメニューで、「**アクション**」セクションを見つけ、**メール** アクションをキャンバスにドラッグ&amp;ドロップします。

![Journey Optimizer](./images/batchj7.png)

**カテゴリ** を **マーケティング** に設定し、メールを送信できるメールサーフェスを選択します。 この場合、選択するメールサーフェスは **メール** です。 **メールのクリック数** と **メールの開封数** のチェックボックスが両方とも有効になっていることを確認します。

![ACOP](./images/journeyactions1eee.png)

次の手順では、メッセージを作成します。 それには、「**コンテンツを編集** をクリックします。

![ACOP](./images/journeyactions2.png)

これが表示されます。 **件名** テキストフィールドをクリックします。

![Journey Optimizer](./images/batch4.png)

件名行に次のテキストを入力します：`Luma Newsletter - your monthly update has arrived.` 「**保存**」をクリックします。

![Journey Optimizer](./images/batch5.png)

その後、ここに戻ります。 「**メールDesigner**」をクリックして、メールコンテンツの作成を開始します。

![Journey Optimizer](./images/batch6.png)

その後、これが表示されます。 **HTMLを読み込み** をクリックします。

![Journey Optimizer](./images/batch7.png)

ポップアップ画面で、メールのHTMLファイルをドラッグ&amp;ドロップする必要があります。 HTMLテンプレートは [ こちら ](./../../../assets/html/ajo-newsletter.html.zip) で確認できます。 HTMLテンプレートが含まれている zip ファイルをローカルマシンにダウンロードし、デスクトップに解凍します。

![Journey Optimizer](./images/html1.png)

ファイル **ajo-newsletter.html** をドラッグ&amp;ドロップし、Journey Optimizerにアップロードします。 **インポート** をクリックします。

![Journey Optimizer](./images/batch8.png)

このメールコンテンツには、想定されるすべてのパーソナライゼーション、画像およびテキストが含まれているため、準備が整いました。 オファーのプレースホルダーのみが空のままになります。

次のエラーメッセージが表示されることがあります。**アセットを取得しようとしたときにエラーが発生しました**。 これはメール内の画像にリンクされています。

![Journey Optimizer](./images/errorfetch.png)

このエラーが発生した場合は、画像を選択して「**画像を編集**」ボタンをクリックします。

![Journey Optimizer](./images/errorfetch1.png)

「**Assets Essentials**」をクリックしてAEM Assets Essentials ライブラリに戻ります。

![Journey Optimizer](./images/errorfetch2.png)

このポップアップが表示されます。 フォルダー **enablement-assets** に移動して、画像 **luma-newsletterContent.png** を選択します。 「**選択**」をクリックします。

![Journey Optimizer](./images/errorfetch3.png)

これで、基本的なニュースレターのメールの準備が整いました。 「**保存**」をクリックします。

![Journey Optimizer](./images/ready.png)

メッセージダッシュボードに戻るには、左上隅の件名テキストの横にある **矢印** をクリックします。

![Journey Optimizer](./images/batch9.png)

左上隅の矢印をクリックして、ジャーニーに戻ります。

![Journey Optimizer](./images/oc79aeee.png)

「**OK**」をクリックして、メールアクションを閉じます。

![Journey Optimizer](./images/oc79beee.png)

これで、ニュースレタージャーニーを公開する準備が整いました。 その前に、「**スケジュール**」セクションに注目してください。このセクションでは、このジャーニーを 1 回限りのキャンペーンから繰り返しキャンペーンに切り替えることができます。 **スケジュール** ボタンをクリックします。

![Journey Optimizer](./images/batchj12.png)

その後、これが表示されます。 **1 回** を選択します。

![Journey Optimizer](./images/sch1.png)

ジャーニーをテストできるよう、次の 1 時間以内の日時を選択します。 「**OK**」をクリックします。

>[!NOTE]
>
>メッセージの送信日時は 1 時間以上である必要があります。

「**公開**」をクリックします。

![Journey Optimizer](./images/batchj13.png)

もう一度 **0}Publish} をクリックします。**

![Journey Optimizer](./images/batchj14.png)

これで、基本的なニュースレタージャーニーが公開されました。 ニュースレターのメールメッセージは、スケジュールで定義したとおりに送信されます。ジャーニーは、最後のメールが送信されると停止します。

![Journey Optimizer](./images/batchj14eee.png)

この演習は完了しました。

次の手順：[3.4.3 メールメッセージにパーソナライゼーションを適用する ](./ex3.md)

[モジュール 3.4 に戻る](./journeyoptimizer.md)

[すべてのモジュールに戻る](../../../overview.md)
