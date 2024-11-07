---
title: インテリジェントサービス – 顧客 AI 新しいインスタンスを作成（設定）
description: 顧客 AI – 新しいインスタンスを作成（設定）
kt: 5342
doc-type: tutorial
source-git-commit: 6962a0d37d375e751a05ae99b4f433b0283835d0
workflow-type: tm+mt
source-wordcount: '324'
ht-degree: 12%

---

# 2.2.2 顧客 AI – 新しいインスタンスを作成する（設定）

顧客 AI は、既存のコンシューマーエクスペリエンスイベントデータを分析して、傾向スコアの変化やコンバージョン傾向スコアを予測します。新しい顧客 AI インスタンスを作成すると、マーケターは目標と測定を定義できます。

## 2.2.2.1 新しい顧客 AI インスタンスの設定

Adobe Experience Platformで、左側のメニューの **サービス** をクリックします。 「**サービス**」ブラウザーが表示され、使用可能なすべてのサービスが表示されます。顧客 AI のカードで、「**開く** をクリックします。

![ サービスナビゲーション ](./images/navigatetoservice.png)

「**インスタンス作成**」をクリックします。

![ 新しいインスタンスの作成 ](./images/createnewinstance.png)

その後、これが表示されます。

![ 新しいインスタンスの作成 ](./images/custai1.png)

顧客 AI インスタンスに必要な詳細を入力します。

- 名前：use `--aepUserLdap-- Product Purchase Propensity`
- 説明：使用：**顧客が製品を購入する可能性を予測する**
- 傾向タイプ：**コンバージョン** を選択します

![ 設定ページ 1](./images/setuppage1.png)

「**次へ**」をクリックします。

![ 設定ページ 1](./images/next.png)

その後、これが表示されます。 前の演習で作成した `--demoProfileLdap - Demo System - Customer Experience Event Dataset` という名前のデータセットを選択します。 「**次へ**」をクリックします。

![ 設定ページ 1](./images/custai2.png)

**発生する** を選択し、「commerce.purchases.value **フィールドをターゲット変数として定義** ます。

![CAI 目標の定義 ](./images/caidefinegoal.png)

「**次へ**」をクリックします。

![ 設定ページ 1](./images/next.png)

次に、スケジュールを **毎週** 実行するように設定し、現在の時刻にできるだけ近い時刻を設定します。 「**プロファイルのスコアを有効にする**」切替スイッチが有効になっていることを確認します。

![CAI 拡張の定義 ](./images/caiadvancepage.png)

「**完了**」をクリックします。

![ 設定ページ 1](./images/finish.png)

このポップアップが表示されます。 「**OK**」をクリックします。

![ 設定ページ 1](./images/finish1.png)

インスタンスを設定すると、顧客 AI インスタンスのリストで確認できます。また、顧客 AI インスタンスの行をクリックして、設定と実行の詳細の概要をプレビューすることもできます。 エラーが見つかった場合、概要パネルにはエラーの詳細も表示されます。

![ インスタンス設定の概要 ](./images/caiinstancesummary.png)

>[!NOTE]
>
>顧客 AI インスタンスのステータスが **トレーニングを待機中** または **エラー** であれば、任意の定義または属性を変更できます

次の手順：[2.2.3 顧客 AI - スコアリングダッシュボードとセグメント化（予測と実行アクション） ](./ex3.md)

[モジュール 2.2 に戻る](./intelligent-services.md)

[すべてのモジュールに戻る](./../../../overview.md)
