---
title: インテリジェントサービス – 顧客 AI 新しいインスタンスを作成（設定）
description: 顧客 AI – 新しいインスタンスを作成（設定）
kt: 5342
doc-type: tutorial
exl-id: 067f3fa2-5c1e-4861-b26a-4315cad73a85
source-git-commit: 58e60ad8c83dcd25996e06f11c75f68eae35ef20
workflow-type: tm+mt
source-wordcount: '368'
ht-degree: 9%

---

# 2.2.2 顧客 AI – 新しいインスタンスを作成する（設定）

顧客 AI は、既存のコンシューマーエクスペリエンスイベントデータを分析して、傾向スコアの変化やコンバージョン傾向スコアを予測します。新しい顧客 AI インスタンスを作成すると、マーケターは目標と測定を定義できます。

## 新しい顧客 AI インスタンスの設定

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

**保存して続行** をクリックします。

![ 設定ページ 1](./images/setuppage1.png)

その後、これが表示されます。 前の演習で作成した `--aepUserLdap-- - Demo System - Customer Experience Event Dataset` という名前のデータセットを選択します。 「**追加**」をクリックします。

![ 設定ページ 1](./images/custai2.png)

その後、これが表示されます。 **ID** フィールドを定義する必要があります。 **なし** をクリックします。

![ 設定ページ 1](./images/custai2a.png)

ポップアップで、「**ID マップ （identityMap）」を選択し** 名前空間 **デモシステム - CRMID （crmId）** を選択します。 次に、「**保存** をクリックします。

![ 設定ページ 1](./images/custai2b.png)

**保存して続行** をクリックします。

![ 設定ページ 1](./images/custai2c.png)

特定のデータセットで **発生します** を選択し、フィールド **commerce.purchases.value** をターゲット変数として定義します。

![CAI 目標の定義 ](./images/caidefinegoal.png)

次に、スケジュールを **毎週** 実行するように設定し、現在の時刻にできるだけ近い時刻を設定します。 「**プロファイルのスコアを有効にする**」切替スイッチが有効になっていることを確認します。 **保存して続行** をクリックします。

![CAI 拡張の定義 ](./images/caiadvancepage.png)

インスタンスを設定すると、顧客 AI サービスリストに表示され、顧客 AI インスタンスの行をクリックして、設定と実行の詳細の概要をプレビューすることもできます。 エラーが見つかった場合、概要パネルにはエラーの詳細も表示されます。

![ インスタンス設定の概要 ](./images/caiinstancesummary.png)

>[!NOTE]
>
>顧客 AI インスタンスのステータスが **トレーニングを待機中** または **エラー** であれば、任意の定義または属性を変更できます

モデルが実行されると、これが表示されます。

![ インスタンス設定の概要 ](./images/caiinstancesummary1.png)


次の手順：[2.2.3 顧客 AI - スコアリングダッシュボードとセグメント化（予測と実行アクション） ](./ex3.md)

[モジュール 2.2 に戻る](./intelligent-services.md)

[すべてのモジュールに戻る](./../../../overview.md)
