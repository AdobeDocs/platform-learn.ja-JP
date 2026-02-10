---
title: Adobe Journey Optimizerでの dynamic media テンプレートの使用
description: Adobe Journey Optimizerでの dynamic media テンプレートの使用
kt: 5342
doc-type: tutorial
exl-id: 0dd499cc-ec3b-42c3-9c08-6512ea5b9377
source-git-commit: 8f746831d4a1481f8ccc14539273c4b16ca5170b
workflow-type: tm+mt
source-wordcount: '637'
ht-degree: 9%

---

# 1.4.2 Adobe Journey Optimizerで dynamic media テンプレートを使用する

## Adobe Journey Optimizer1.4.2.1 キャンペーンを作成するには

[Adobe Experience Cloud](https://experience.adobe.com) に移動して、Adobe Journey Optimizerにログインします。 **Journey Optimizer** をクリックします。

![ACOP](./images/acophome.png)

Journey Optimizerの **ホーム** ビューにリダイレクトされます。 最初に、正しいサンドボックスを使用していることを確認します。 使用するサンドボックスは `--aepSandboxName--` です。 その後、サンドボックス **ージの** ホーム `--aepSandboxName--` ビューに移動します。

![ACOP](./images/acoptriglp.png)

次に、キャンペーンを作成します。 前の演習のイベントベースのジャーニーは、受信エクスペリエンスイベントやオーディエンスの入口または出口に依存して 1 人の特定顧客のジャーニーをトリガーにするのとは異なり、キャンペーンは、ニュースレター、1 回限りのプロモーション、一般的な情報などの一意のコンテンツで 1 回、またはインスタンスの誕生日キャンペーンやリマインダーなどの定期的に送信される同様のコンテンツで、オーディエンス全体をターゲットにします。

メニューで、「**キャンペーン**」に移動し、「**キャンペーンを作成**」をクリックします。

![Journey Optimizer](./images/gsemail21.png)

**スケジュール型 – マーケティング** を選択し、「**作成**」をクリックします。

![Journey Optimizer](./images/gsemail22.png)

キャンペーンの作成画面で、以下を設定します。

- **名前**:`--aepUserLdap-- - CitiSignal Fiber Max DM Email Campaign`。

**アクション** をクリックします。

![Journey Optimizer](./images/gsemail23.png)

「**+アクションを追加**」をクリックし、「**メール**」を選択します。

![Journey Optimizer](./images/gsemail24.png)

次に、既存の **メール設定** を選択し、「**コンテンツを編集**」をクリックします。

![Journey Optimizer](./images/gsemail25.png)

その後、これが表示されます。 **件名** には、次を使用します。

```
{{profile.person.name.firstName}}, say hello to CitiSignal Fiber Max!
```

次に、「**コンテンツを編集**」をクリックします。

![Journey Optimizer](./images/gsemail26.png)

「**ゼロからデザイン**」を選択します。

![Journey Optimizer](./images/gsemail27.png)

この画像が表示されます。

![Journey Optimizer](./images/gsemail28.png)

キャンバスに 2x **1:1 列** を追加します。

![Journey Optimizer](./images/gsemail29.png)

**フラグメント** に移動し、**ヘッダー** フラグメントを最初の 1:1 列にドラッグしてから、**フッター** フラグメントを 2 番目の 1:1 列にドラッグします。

![Journey Optimizer](./images/gsemail30.png)

2 つのフラグメントの間に新しい 1:1 列を追加し、その 1 **列に** 画像 :1 を追加します。 次に、「参照 **をクリック** ます。

![Journey Optimizer](./images/gsemail31.png)

Dynamic Media テンプレートを保存したフォルダーに移動します。 Dynamic Media テンプレートを選択し、「**選択** をクリックします。

![Journey Optimizer](./images/gsemail32.png)

この画像が表示されます。 あなたも。 dynamic media テンプレートのパラメーターを変更できる **パラメーター** に注意してください。

![Journey Optimizer](./images/gsemail33.png)

## 1.4.2.2 Dynamic Media テンプレートのパーソナライズ

前の演習で説明したように、AJOでは、Dynamic Media テンプレートの一部になる値を動的に決定する必要があります。

前の演習の **プレビュー** 手順と同様に、フィールド **city_paris**、**city_dubai** および **city_ny** は 1 に設定する必要があります。つまり、これらの画像は非表示になります。

フィールド **タイトル** で、パーソナライゼーションアイコンをクリックします。

![Journey Optimizer](./images/gsemail34.png)

既定のテキストを `Hi {{profile.person.name.firstName}}` に置き換えます。 「**保存**」をクリックします。

![Journey Optimizer](./images/gsemail35.png)

フィールド **本文** で、パーソナライゼーションアイコンをクリックします。

![Journey Optimizer](./images/gsemail36.png)

既定のテキストを `CitiSignal is coming to {{profile.homeAddress.city}}!` に置き換えます。 「**保存**」をクリックします。

![Journey Optimizer](./images/gsemail37.png)

フィールド **`dynamic_city_hide`** が 0 に設定されていることを確認します。 フィールド **`dynamic_city_image`** のパーソナライゼーションアイコンをクリックします。

![Journey Optimizer](./images/gsemail38.png)

既定のテキストを `--aepUserLdap--CitiSignalDM/citisignal-fiber-max-is-coming_citisignal-{{profile._experienceplatform.individualCharacteristics.fiber_rollout.closest_rollout_city}}-1` に置き換えます。 「**保存**」をクリックします。

![Journey Optimizer](./images/gsemail39.png)

この画像が表示されます。 画像は、メールエディターのコンテキストで動的変数が使用できないので、ここではレンダリングされません。

「**保存**」をクリックします。

![Journey Optimizer](./images/gsemail40.png)

上部テスト設定、「**コンテンツをシミュレート**」の順にクリックし、「**コンテンツをシミュレート**」を選択します。

![Journey Optimizer](./images/gsemail41.png)

次のようなメッセージが表示されます。 使用可能なテストプロファイルがない場合は、「**テストプロファイルの管理**」に移動して追加できます。

このユースケースのテストに必要なデータを含んだテストプロファイルを使用可能にしたら、プロファイルを切り替えて、変更が動的に行われることを確認できます。

ロールアウト都市ニューヨークにリンクされているプロファイルを以下に示します。

![Journey Optimizer](./images/gsemail42.png)

ロールアウト都市パリにリンクされているプロファイルを次に示します。

![Journey Optimizer](./images/gsemail43.png)

ロールアウト都市ドバイにリンクされているプロファイルを以下に示します。

「**閉じる**」をクリックします。

![Journey Optimizer](./images/gsemail44.png)

これで、この演習が完了しました。 メールキャンペーンを公開する必要はありません。

## 次の手順

[Adobe Experience Manager Assetsと Dynamic Media](./aemassetsdm.md){target="_blank"} に戻る

[ すべてのモジュールに戻る ](./../../../overview.md){target="_blank"}