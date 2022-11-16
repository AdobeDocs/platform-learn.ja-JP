---
title: インテリジェントサービス — 顧客 AI 新しいインスタンスの作成（設定）
description: 顧客 AI — 新しいインスタンスの作成（設定）
kt: 5342
audience: Data Engineer, Data Architect
doc-type: tutorial
activity: develop
exl-id: d9377c97-efed-427a-a063-aa9c6bd1a78a
source-git-commit: cc7a77c4dd380ae1bc23dc75608e8e2224dfe78c
workflow-type: tm+mt
source-wordcount: '312'
ht-degree: 13%

---

# 5.2 顧客 AI — 新しいインスタンスの作成（設定）

顧客 AI は、既存のコンシューマーエクスペリエンスイベントデータを分析して、傾向スコアの変化やコンバージョン傾向スコアを予測します。新しい顧客 AI インスタンスを作成すると、マーケターは目標と測定を定義できます。

## 5.2.1 新しい顧客 AI インスタンスの設定

Adobe Experience Platformで、 **サービス** をクリックします。 「**サービス**」ブラウザーが表示され、使用可能なすべてのサービスが表示されます。顧客 AI のカードで、 **開く**.

![サービスナビゲーション](./images/navigatetoservice.png)

「**インスタンス作成**」をクリックします。

![新しいインスタンスを作成](./images/createnewinstance.png)

これが見えます

![新しいインスタンスを作成](./images/custai1.png)

顧客 AI インスタンスに必要な詳細を入力します。

- 名前：use `--demoProfileLdap-- Product Purchase Propensity`
- 説明：使用： **顧客が製品を購入する可能性の予測**
- 傾向タイプ：選択 **コンバージョン**

![設定ページ 1](./images/setuppage1.png)

「**次へ**」をクリックします。

![設定ページ 1](./images/next.png)

これが見えます 前の演習で作成した、という名前のデータセットを選択します。 `--demoProfileLdap - Demo System - Customer Experience Event Dataset`. 「**次へ**」をクリックします。

![設定ページ 1](./images/custai2.png)

選択 **発生** フィールドを定義します。 **commerce.purchases.value** をターゲット変数として使用します。

![CAI 目標の定義](./images/caidefinegoal.png)

「**次へ**」をクリックします。

![設定ページ 1](./images/next.png)

次に、実行するスケジュールを設定します **毎週** 時刻をできるだけ現在の時刻に近づけます。 切り替えを確認します。 **プロファイルのスコアの有効化** が有効になっている。

![CAI 進行を定義](./images/caiadvancepage.png)

「**完了**」をクリックします。

![設定ページ 1](./images/finish.png)

その後、このポップアップが表示されます。 「**OK**」をクリックします。

![設定ページ 1](./images/finish1.png)

設定したインスタンスは、顧客 AI インスタンスのリストに表示され、「顧客 AI インスタンス」行をクリックして、設定と実行の詳細の概要もプレビューできます。 エラーが見つかった場合は、Summary パネルにエラーの詳細も表示されます。

![インスタンス設定の概要](./images/caiinstancesummary.png)

>[!NOTE]
>
>顧客 AI インスタンスのステータスが **トレーニング待ち** または **エラー**

次のステップ： [5.3 顧客 AI — スコアリングダッシュボードとセグメント化（予測と行動）](./ex3.md)

[モジュール 5 に戻る](./intelligent-services.md)

[すべてのモジュールに戻る](./../../overview.md)
