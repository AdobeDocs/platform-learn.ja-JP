---
title: Bootcamp -Customer Journey Analytics-Customer Journey Analyticsを使用したビジュアライゼーション
description: Bootcamp -Customer Journey Analytics-Customer Journey Analyticsを使用したビジュアライゼーション
jira: KT-5342
audience: Data Engineer, Data Architect, Data Analyst
doc-type: tutorial
activity: develop
solution: Customer Journey Analytics
feature-set: Customer Journey Analytics
feature: Visualizations
exl-id: 051b5b91-56c4-414e-a4c4-74aa67219551
source-git-commit: 3c86f9b19cecf92c9a324fb6fcfcefaebf82177f
workflow-type: tm+mt
source-wordcount: '1497'
ht-degree: 1%

---

# 4.5Customer Journey Analytics

## 目標

- Analysis Workspace UI について
- Analysis Workspaceをそれほど異なるものにする機能を学びましょう。
- Analysis Workspaceを使用した CJA での分析方法を説明します

## コンテキスト

この演習では、CJA 内でAnalysis Workspaceを使用して、製品ビュー、製品ファネル、チャーンなどを分析します。

で作成したプロジェクトを使用します。 [4.4 Analysis Workspaceでのデータの準備](./ex4.md)に移動します。 [https://analytics.adobe.com](https://analytics.adobe.com).

![デモ](./images/prohome.png)

プロジェクトを開く `yourLastName - Omnichannel Analysis`.

プロジェクトを開き、データビューで `CJA Bootcamp - Omnichannel Data View` 選択した場合、最初のビジュアライゼーションの作成を開始する準備が整いました。

![デモ](./images/prodataView1.png)

## 毎日の製品表示数

まず、データを分析する適切な日付を選択する必要があります。 キャンバスの右側にあるカレンダードロップダウンに移動します。 該当する日付範囲をクリックして選択します。

>[!IMPORTANT]
>
>利用可能な最新のデータが19/09/2022に取り込まれました。この日付を含む日付範囲を選択してください。

![デモ](./images/pro1.png)

左側のメニュー（コンポーネント領域）で、計算指標を探します。 **製品表示**. それを選択し、フリーフォームテーブル内の右上にあるキャンバスにドラッグ&amp;ドロップします。

![デモ](./images/pro2.png)

自動的にディメンションを **日** が追加され、最初のテーブルを作成します。 これで、あなたの質問が即座に答えられたのが見えます。

![デモ](./images/pro3.png)

次に、指標の概要を右クリックします。

![デモ](./images/pro4.png)

クリック **視覚化** 次に、 **線** ビジュアライゼーションとして。

![デモ](./images/pro5.png)

日別に製品ビューが表示されます。

![デモ](./images/pro6.png)

時間範囲は、 **設定** を選択します。

![デモ](./images/pro7.png)

の隣の点をクリックします。 **線** から **データソースを管理**.

![デモ](./images/pro7a.png)

次に、「 **選択をロック** を選択し、 **選択した項目** このビジュアライゼーションをロックして、常に製品表示のタイムラインを表示する場合。

![デモ](./images/pro7b.png)

## 閲覧された上位 4 件の製品

上位 4 件の製品は何を閲覧したか。

時々必ずプロジェクトを保存してください。

| OS | ショートカット |
| ----------------- |-------------| 
| Windows | Ctrl + S |
| Mac | Command + S |

閲覧された上位 4 件の製品の検索を開始します。 左側のメニューで、 **製品名** -Dimension。

![デモ](./images/pro8.png)

今すぐドラッグ&amp;ドロップ **製品名** 交換する **日** ディメンション：

これが結果です

![デモ](./images/pro10a.png)

次に、いずれかの製品をブランド名で分類します。 を検索 **brandName** 最初の製品名の下にドラッグします。

![デモ](./images/pro13.png)

次に、ロイヤルティレベルを使用して分類を実行します。 を検索 **ロイヤルティレベル** ブランド名の下にドラッグします。

![デモ](./images/pro15.png)

次の内容が表示されます。

![デモ](./images/pro15a.png)

最後に、さらにビジュアライゼーションを追加できます。 左側のビジュアライゼーションで、を検索します。 `Donut`. テイク `Donut`をクリックし、キャンバスの下の **線** ビジュアライゼーション。

![デモ](./images/pro18.png)

次に、テーブルで、 **ロイヤルティレベル**  行を **Google Pixel XL 32GB ブラックスマートフォン** > **シティ信号**. 3 行を選択する際、 **CTRL** ボタン（Windows の場合）または **コマンド** ボタン (Mac)

![デモ](./images/pro20.png)

ドーナツグラフは次のように変化します。

![デモ](./images/pro21.png)

また、 **線** グラフおよび **ドーナツ** は、互いに隣り合うように少し小さくグラフ化します。

![デモ](./images/pro22.png)

の隣の点をクリックします。 **ドーナツ** から **データソースを管理**.
次に、「 **選択をロック** このビジュアライゼーションをロックして、常に製品表示のタイムラインを表示する場合。

![デモ](./images/pro22b.png)

Analysis Workspaceを使用したビジュアライゼーションの詳細については、こちらを参照してください。

- [https://experienceleague.adobe.com/docs/analytics/analyze/analysis-workspace/visualizations/freeform-analysis-visualizations.html?lang=ja](https://experienceleague.adobe.com/docs/analytics/analyze/analysis-workspace/visualizations/freeform-analysis-visualizations.html?lang=ja)
- [https://experienceleague.adobe.com/docs/analytics/analyze/analysis-workspace/visualizations/t-sync-visualization.html](https://experienceleague.adobe.com/docs/analytics/analyze/analysis-workspace/visualizations/t-sync-visualization.html)

## 表示から購入まで、製品インタラクションファネル

この質問を解決する方法は多数あります。 その 1 つは、製品のインタラクションタイプを使用し、フリーフォームテーブルで使用することです。 別の方法は、 **フォールアウトビジュアライゼーション**. 視覚化と分析を同時に行う際に、最後のものを使いましょう。

ここをクリックして、現在のパネルを閉じます。

![デモ](./images/pro23.png)

新しい空のパネルを追加するには、 **+空のパネルを追加**.

![デモ](./images/pro24.png)

ビジュアライゼーションをクリック **フォールアウト**.

![デモ](./images/pro25.png)

前の演習と同じ日付範囲を選択します。

![デモ](./images/pro1.png)

これが見えます

![デモ](./images/prodatefa.png)

ディメンションを検索 **イベントタイプ** 左側のコンポーネントの下：

![デモ](./images/pro26.png)

矢印をクリックして、次の寸法を開きます。

![デモ](./images/pro27.png)

使用可能なイベントタイプがすべて表示されます。

![デモ](./images/pro28.png)

項目を選択 **commerce.productViews** をクリックし、 **タッチポイントを追加** 中のフィールド **フォールアウトビジュアライゼーション**.

![デモ](./images/pro29.png)

同じ操作を **commerce.productListAdds** および **commerce.purchases** をクリックし、 **タッチポイントを追加** 中のフィールド **フォールアウトビジュアライゼーション**. ビジュアライゼーションは次のようになります。

![デモ](./images/props1.png)

ここでは多くのことができます。 次に例を示します。時間の経過と共に比較し、各ステップをデバイスごとに比較したり、ロイヤルティ別に比較したりします。 ただし、買い物かごに品目を追加した後に顧客が購入しない理由など、興味深いものを分析したい場合は、CJA で最適なツールを使用できます。右クリックします。

タッチポイントを右クリックします。 **commerce.productListAdds**. 次に、 **このタッチポイントでのフォールアウトを分類**.

![デモ](./images/pro32.png)

新しいフリーフォームテーブルが作成され、訪問者が購入しなかった場合の行動を分析します。

![デモ](./images/pro33.png)

を **イベントタイプ** 作成者 **ページ名**、新しいフリーフォームテーブルで、購入確認ページの代わりにどのページに移動するのかを確認できます。

![デモ](./images/pro34.png)

## [ サービスのキャンセル ] ページに到達する前に、サイト上でのユーザーの行動を教えてください。

この分析を実行する方法は多数あります。 フロー分析を使用して、検出部分を開始します。

ここをクリックして現在のパネルを閉じます。

![デモ](./images/pro0.png)

新しい空のパネルを追加するには、 **+空のパネルを追加**.

![デモ](./images/pro0a.png)

ビジュアライゼーションをクリック **フロー**.

![デモ](./images/pro35.png)

次の内容が表示されます。

![デモ](./images/pro351.png)

前の演習と同じ日付範囲を選択します。

![デモ](./images/pro1.png)

ディメンションを検索 **ページ名** 左側のコンポーネントの下：

![デモ](./images/pro36.png)

矢印をクリックして、次の寸法を開きます。

![デモ](./images/pro37.png)

表示されたすべてのページが表示されます。 ページ名を検索します。 **サービスをキャンセル**.
ドラッグ&amp;ドロップ **サービスをキャンセル** を中央のフィールドの「フロービジュアライゼーション」に変更します。

![デモ](./images/pro38.png)

次の内容が表示されます。

![デモ](./images/pro40.png)

次に、 **サービスをキャンセル** Web サイト上のページはコールセンターとも呼ばれ、結果は何かを示します。

ディメンションの下で、戻って、を探します。 **呼び出しインタラクションタイプ**.
ドラッグ&amp;ドロップ **呼び出しインタラクションタイプ** 右側の最初のインタラクションを **フロービジュアライゼーション**.

![デモ](./images/pro43.png)

現在、 **サービスをキャンセル** ページ。

![デモ](./images/pro44.png)

次に、ディメンションで、を検索します。 **通話感**.  ドラッグ&amp;ドロップして、 **フロービジュアライゼーション**.

![デモ](./images/pro46.png)

次の内容が表示されます。

![デモ](./images/flow.png)

ご覧のように、フロービジュアライゼーションを使用してオムニチャネル分析を実行しました。 お客様の中には、サービスをキャンセルしようと思うお客様が、コールセンターに電話をかけた後にポジティブな気持ちを持っていたようです。 プロモーションで考えを変えたのか？


## ポジティブコールセンターの連絡先を持つお客様は、メイン KPI に対してどのように実行されますか。

最初にデータをセグメント化して、でユーザーのみを取得します。 **陽性** 呼び出し。 CJA では、セグメントをフィルターと呼びます。 コンポーネント領域内（左側）のフィルターに移動し、 **+**.

![デモ](./images/pro58.png)

フィルタービルダー内で、フィルターに名前を付けます

| 名前 | 説明 |
| ----------------- |-------------| 
| 通話感 — ポジティブ | 通話感 — ポジティブ |

![デモ](./images/pro47.png)

（フィルタービルダー内の）コンポーネントの下で、を探します。 **通話感** をクリックし、フィルタービルダー定義にドラッグ&amp;ドロップします。

![デモ](./images/pro48.png)

今すぐ選択 **陽性** をフィルターの値として使用します。

![デモ](./images/pro49.png)

範囲を **人物** レベル。

![デモ](./images/pro50.png)

終了するには、 **保存**.

![デモ](./images/pro51.png)

その後、戻ってきます。 まだ終わっていない場合は、前のパネルを閉じます。

![デモ](./images/pro0c.png)

新しい空のパネルを追加するには、 **+空のパネルを追加**.

![デモ](./images/pro24c.png)

前の演習と同じ日付範囲を選択します。

![デモ](./images/pro1.png)

クリック **フリーフォームテーブル**.

![デモ](./images/pro52.png)

作成したフィルターをドラッグ&amp;ドロップします。

![デモ](./images/pro53.png)

指標を追加する時間。 開始 **製品表示**. フリーフォームテーブルにドラッグ&amp;ドロップします。 また、 **イベント** 指標。

![デモ](./images/pro54.png)

同じ操作を **人**,  **買い物かごに追加** および **購入**. こんなテーブルになる。

![デモ](./images/pro55.png)

最初のフロー分析のおかげで、新しい質問が思い浮かびました。 そこで、このテーブルを作成し、セグメントに対する KPI を確認して、その質問に答えることにしました。 ご覧のように、インサイトを見る時間は、SQL や他の BI ソリューションを使用する場合に比べてはるかに高速です。

## Customer Journey AnalyticsとAnalysis Workspaceのまとめ

このラボで学習したように、Analysis Workspaceはすべてのチャネルのデータを結び付け、完全なカスタマージャーニーを分析します。 また、ジャーニーに結び付けられていないのと同じワークスペースにデータを取り込むこともできます。
切り離されたデータを分析に取り込んで、ジャーニーにコンテキストを提供すると非常に役立ちます。 例としては、NPS データ、調査、Facebook Ads イベント、オフラインインタラクション（識別されていないもの）などがあります。

次のステップ： [4.6 インサイトから行動へ](./ex6.md)

[ユーザーフローに戻る 4](./uc4.md)

[すべてのモジュールに戻る](./../../overview.md)
