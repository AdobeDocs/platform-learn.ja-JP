---
title: Adobe Journey Optimizerでの dynamic media テンプレートの使用
description: Adobe Journey Optimizerでの dynamic media テンプレートの使用
kt: 5342
doc-type: tutorial
source-git-commit: 261475b85bfb15f7e9f630d1c5203732c2d4c254
workflow-type: tm+mt
source-wordcount: '340'
ht-degree: 8%

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

この画像が表示されます。

![Journey Optimizer](./images/gsemail33.png)

## 次の手順

[Adobe Experience Manager Assetsと Dynamic Media](./aemassetsdm.md){target="_blank"} に戻る

[&#x200B; すべてのモジュールに戻る &#x200B;](./../../../overview.md){target="_blank"}
