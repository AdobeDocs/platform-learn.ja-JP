---
title: 調整したキャンペーンの作成
description: 調整したキャンペーンの作成
kt: 5342
doc-type: tutorial
exl-id: f3ca3230-db30-4e41-91f1-9324b12211a6
source-git-commit: 72aee2daa489f00dfc753e6986f0cab2271c6a7f
workflow-type: tm+mt
source-wordcount: '1112'
ht-degree: 2%

---

# 3.8.2 オーケストレーションされたキャンペーンの作成

## オーケテ 3.8.2.1 ト済みキャンペーンの作成

**キャンペーン** に移動します。 **キャンペーンを作成** をクリックします。

![AJO OC](./images/ajooc1.png)

**オーケストレーション – マーケティング** を選択し、「**確認**」をクリックします。

![AJO OC](./images/ajooc2.png)

キャンペーン名 `--aepUserLdap-- - CitiSignal Family Account Optimization Campaign` を入力し、「**保存** をクリックします。

![AJO OC](./images/ajooc3.png)

この画像が表示されます。 **+** アイコンをクリックします。

![AJO OC](./images/ajooc4.png)

「**分岐**」を選択します。

![AJO OC](./images/ajooc5.png)

### オーディエンス 1 を作成

**+** アイコンをクリックし、「**オーディエンスを作成**」を選択します。

![AJO OC](./images/ajooc6.png)

クリックして、**ターゲティングディメンション** のフォルダーを開きます。

![AJO OC](./images/ajooc7.png)

「**`--aepUserLdap--_citisignal_recipients`**」を選択し、「**確認**」をクリックします。

![AJO OC](./images/ajooc8.png)

**オーディエンスを作成** をクリックします。

![AJO OC](./images/ajooc9.png)

「**条件を追加**」をクリックします。

![AJO OC](./images/ajooc10.png)

**recipient_type** を選択し、「**確認**」をクリックします。

![AJO OC](./images/ajooc11.png)

フィールド **`account_holder`** 値 **に** と入力し、「**計算**」をクリックします。

![AJO OC](./images/ajooc12.png)

**ターゲットとするプロファイル** の数が表示されます。 示されているように、グレーの領域の任意の場所をクリックします。

![AJO OC](./images/ajooc13.png)

「**条件を追加**」をクリックします。

![AJO OC](./images/ajooc14.png)

**`citisignal_accounts`** にドリルダウンします。

![AJO OC](./images/ajooc15.png)

「**`account_status`**」を選択し、「**確認**」をクリックします。

![AJO OC](./images/ajooc16.png)

フィールド **`active`** 値 **に** と入力します。 次に、グレーの領域の任意の場所をクリックします。

![AJO OC](./images/ajooc17.png)

「**条件を追加**」をクリックします。

![AJO OC](./images/ajooc18.png)

**`citisignal_mobile_subscriptions`** にドリルダウンします。

![AJO OC](./images/ajooc19.png)

「**`subscription_id`**」を選択し、「**確認**」をクリックします。

![AJO OC](./images/ajooc20.png)

**データを集計** のスイッチャーを有効にします。 次に、以下を選択します。

- **集計関数**: **Count**
- **演算子**: **以上**
- **値**: **1**

「**確認**」をクリックします。

![AJO OC](./images/ajooc21.png)

この画像が表示されます。 「**確認**」をクリックします。

![AJO OC](./images/ajooc22.png)

### オーディエンス 2 を作成

別のパスにある次のノードの「**+**」アイコンをクリックします。

![AJO OC](./images/ajooc23.png)

**オーディエンスを作成** を選択します。

![AJO OC](./images/ajooc24.png)

クリックして、**ターゲティングディメンション** のフォルダーを開きます。

![AJO OC](./images/ajooc25.png)

「**`--aepUserLdap--_mobile_subscriptions`**」を選択し、「**確認**」をクリックします。

![AJO OC](./images/ajooc26.png)

**オーディエンスを作成** をクリックします。

![AJO OC](./images/ajooc27.png)

「**条件を追加**」をクリックします。

![AJO OC](./images/ajooc28.png)

**subscription_status** を選択し、「**確認**」をクリックします。

![AJO OC](./images/ajooc29.png)

フィールド **`active`** 値 **に** と入力します。 次に、「**条件を追加**」をクリックします。

![AJO OC](./images/ajooc30.png)

「**`is_upgrade_eligible`**」を選択し、「**確認**」をクリックします。

![AJO OC](./images/ajooc31.png)

**Value** を **true** に設定します

![AJO OC](./images/ajooc32.png)

「**計算**」をクリックして、このオーディエンスに適合するプロファイルの推定を表示します。 次に、「**確認**」をクリックします。

![AJO OC](./images/ajooc33.png)

### 分割

**+** アイコンをクリックし、「**分割**」を選択します。

![AJO OC](./images/ajooc34.png)

フィールド **ラベル** を **90/10 Treatment vs Control** に変更します。 クリックしてオブジェクト **サブセット** を開きます。

![AJO OC](./images/ajooc35.png)

**制限を有効にする** のスイッチャーを有効にし、**制限サイズ** を **10 perecent** に設定します。

![AJO OC](./images/ajooc36.png)

**セグメントを追加** をクリックすると、**Result** オブジェクトが追加されていることがわかります。

「**保存**」をクリックします。

![AJO OC](./images/ajooc37.png)

### オーディエンスの保存

**+** アイコンをクリックし、「**オーディエンスを保存**」を選択します。

![AJO OC](./images/ajooc38.png)

フィールド **オーディエンスラベル** を **`--aepUserLdap-- - Control Group`** に設定します。 「**オーディエンスマッピングを追加**」をクリックします。

![AJO OC](./images/ajooc39.png)

**ターゲティングディメンション** にドリルダウンします。

![AJO OC](./images/ajooc40.png)

「**`account_id`**」を選択し、「**確認**」をクリックします。

![AJO OC](./images/ajooc41.png)

**プロファイルマッピングフィールド** を **`--aepUserLdap--_citisignal_recipients - account_id`** に設定します。

![AJO OC](./images/ajooc41a.png)

### エンリッチメント：インターネット購読

**+** アイコンをクリックします。

![AJO OC](./images/ajooc42.png)

**エンリッチメント** を選択します。

![AJO OC](./images/ajooc43.png)

この画像が表示されます。 「**エンリッチメントデータを追加**」をクリックします。

![AJO OC](./images/ajooc44.png)

**`Targeting dimension`** にドリルダウンします。

![AJO OC](./images/ajooc44a.png)

**`citisignal_accounts`** にドリルダウンします。

![AJO OC](./images/ajooc45.png)

**`citisignal_internet_subscriptions`** にドリルダウンします。

![AJO OC](./images/ajooc45a.png)

「**`account_id`**」を選択し、「**確認**」をクリックします。

![AJO OC](./images/ajooc46.png)

この画像が表示されます。 **属性を追加** をクリックします。

![AJO OC](./images/ajooc47.png)

「**`subscription_status`**」を選択し、「**確認**」をクリックします。

![AJO OC](./images/ajooc48.png)

**属性を追加** をクリックします。

![AJO OC](./images/ajooc49.png)

「**`connection_type`**」を選択し、「**確認**」をクリックします。

![AJO OC](./images/ajooc50.png)

**属性を追加** をクリックします。

![AJO OC](./images/ajooc51.png)

「**`service_city`**」を選択し、「**確認**」をクリックします。

![AJO OC](./images/ajooc52.png)

**属性を追加** をクリックします。

![AJO OC](./images/ajooc53.png)

「**`avg_bandwidth_usage_gb`**」を選択し、「**確認**」をクリックします。

![AJO OC](./images/ajooc54.png)

**属性を追加** をクリックします。

![AJO OC](./images/ajooc55.png)

「**`data_cap_gb`**」を選択し、「**確認**」をクリックします。

![AJO OC](./images/ajooc56.png)

**属性を追加** をクリックします。

![AJO OC](./images/ajooc57.png)

「**`advertised_speed_mbps`**」を選択し、「**確認**」をクリックします。

![AJO OC](./images/ajooc58.png)

**属性を追加** をクリックします。

![AJO OC](./images/ajooc59.png)

「**`monthly_recurring_charge`**」を選択し、「**確認**」をクリックします。

![AJO OC](./images/ajooc60.png)

「**保存**」をクリックします。

![AJO OC](./images/ajooc61.png)

上にスクロールして、フィールド **ラベル** を `Enrichment: Internet Subscription` に変更します。

![AJO OC](./images/ajooc61a.png)

### エンリッチメント：モバイルデバイス購読

次のノードにある「**+**」アイコンをクリックし、「**エンリッチメント**」を選択します。

![AJO OC](./images/ajooc62.png)

フィールド **ラベル** を `Enrichment: Mobile Devices Subscription` に変更し、「**エンリッチメントデータを追加** をクリックします。

![AJO OC](./images/ajooc63.png)

**ターゲティングディメンション** にドリルダウンします。

![AJO OC](./images/ajooc64.png)

**`citisignal_accounts`** にドリルダウンします。

![AJO OC](./images/ajooc65.png)

**`citisignal_mobile_subscriptions`** にドリルダウンします。

![AJO OC](./images/ajooc65a.png)

「**`phone_number`**」を選択し、「**確認**」をクリックします。

![AJO OC](./images/ajooc66.png)

**属性を追加** をクリックします。

![AJO OC](./images/ajooc67.png)

**`citisignal_equipment_subscriptions`** にドリルダウンします。

![AJO OC](./images/ajooc68.png)

「**`model`**」を選択し、「**確認**」をクリックします。

![AJO OC](./images/ajooc68a.png)

**属性を追加** をクリックします。

![AJO OC](./images/ajooc69.png)

**`citisignal_equipment_subscriptions`** にドリルダウンします。

![AJO OC](./images/ajooc69a.png)

「**`recommended_device_model`**」を選択し、「**確認**」をクリックします。

![AJO OC](./images/ajooc70.png)

**属性を追加** をクリックします。

![AJO OC](./images/ajooc71.png)

**`citisignal_equipment_subscriptions`** にドリルダウンします。

![AJO OC](./images/ajooc71a.png)

「**`is_upgrade_eligible`**」を選択し、「**確認**」をクリックします。

![AJO OC](./images/ajooc72.png)

これで、テスト実行を行って進捗をテストし、キャンペーンで使用可能なデータを確認できます。

変更を保存し、「**開始**」をクリックします。

![AJO OC](./images/ajooctest1.png)

しばらくすると、これが表示されます。 **結果をプレビュー** をクリックします。

![AJO OC](./images/ajooctest2.png)

これに似た情報が表示されます。 「**閉じる**」をクリックします。

![AJO OC](./images/ajooctest3.png)

ノード **エンリッチメント：モバイルデバイス購読** に戻ります。

**属性を追加** をクリックします。

![AJO OC](./images/ajooc73.png)

「**`account_id`**」を選択し、「**確認**」をクリックします。

![AJO OC](./images/ajooc74.png)

**属性を追加** をクリックします。

![AJO OC](./images/ajooc75.png)

「**`subscription_id`**」を選択し、「**確認**」をクリックします。

![AJO OC](./images/ajooc76.png)

**属性を追加** をクリックします。

![AJO OC](./images/ajooc77.png)

「**`renewal_eligibility_date`**」を選択し、「**確認**」をクリックします。

![AJO OC](./images/ajooc78.png)

**属性を追加** をクリックします。

![AJO OC](./images/ajooc79.png)

「**`line_user_recipient_id`**」を選択し、「**確認**」をクリックします。

![AJO OC](./images/ajooc80.png)

**属性を追加** をクリックします。

![AJO OC](./images/ajooc81.png)

「**`current_device_id`**」を選択し、「**確認**」をクリックします。

![AJO OC](./images/ajooc82.png)

**属性を追加** をクリックします。

![AJO OC](./images/ajooc86.png)

「**`contract_start_date`**」を選択し、「**確認**」をクリックします。

![AJO OC](./images/ajooc87.png)

**属性を追加** をクリックします。

![AJO OC](./images/ajooc89.png)

**`citisignal_equipment_subscriptions`** にドリルダウンします。

![AJO OC](./images/ajooc90.png)

「**`manufacturer`**」を選択し、「**確認**」をクリックします。

![AJO OC](./images/ajooc91.png)

**属性を追加** をクリックします。

![AJO OC](./images/ajooc92.png)

**`citisignal_equipment_subscriptions`** にドリルダウンします。

![AJO OC](./images/ajooc93.png)

「**`device_age_months`**」を選択し、「**確認**」をクリックします。

![AJO OC](./images/ajooc94.png)

**属性を追加** をクリックします。

![AJO OC](./images/ajooc95.png)

**`citisignal_equipment_subscriptions`** にドリルダウンします。

![AJO OC](./images/ajooc96.png)

「**`trade_in_value`**」を選択し、「**確認**」をクリックします。

![AJO OC](./images/ajooc97.png)

**属性を追加** をクリックします。

![AJO OC](./images/ajooc98.png)

**`citisignal_equipment_subscriptions`** にドリルダウンします。

![AJO OC](./images/ajooc99.png)

「**`monthly_payment`**」を選択し、「**確認**」をクリックします。

![AJO OC](./images/ajooc100.png)

### エンリッチメント：モバイルデバイス購読

これで完了です。 「**保存**」をクリックします。次に、「**+**」アイコンをクリックして新しいノードを追加し、「**エンリッチメント**」を選択します。

![AJO OC](./images/ajooc101.png)

この画像が表示されます。 「**エンリッチメントデータを追加**」をクリックします。

![AJO OC](./images/ajooc102.png)

**ターゲティングディメンション** にドリルダウンします。

![AJO OC](./images/ajooc103.png)

**`citisignal_offer_eligibility`** にドリルダウンします。

![AJO OC](./images/ajooc104.png)

**`citisignal_offers`** にドリルダウンします。

![AJO OC](./images/ajooc105.png)

「**`offer_name`**」を選択し、「**確認**」をクリックします。

![AJO OC](./images/ajooc106.png)

**属性を追加** をクリックします。

![AJO OC](./images/ajooc107.png)

**`citisignal_offers`** にドリルダウンします。

![AJO OC](./images/ajooc108.png)

「**`offer_code`**」を選択し、「**確認**」をクリックします。

![AJO OC](./images/ajooc109.png)

**属性を追加** をクリックします。

![AJO OC](./images/ajooc110.png)

**`citisignal_offers`** にドリルダウンします。

![AJO OC](./images/ajooc111.png)

「**`offer_description`**」を選択し、「**確認**」をクリックします。

![AJO OC](./images/ajooc112.png)

**属性を追加** をクリックします。

![AJO OC](./images/ajooc110.png)

**`citisignal_offers`** にドリルダウンします。

![AJO OC](./images/ajooc113.png)

「**`offer_description`**」を選択し、「**確認**」をクリックします。

![AJO OC](./images/ajooc114.png)

**並べ替えを有効にする** をオンにします。

![AJO OC](./images/ajooc115.png)

**`citisignal_offers`** にドリルダウンします。

![AJO OC](./images/ajooc116.png)

「**`offer_priority`**」を選択し、「**確認**」をクリックします。

![AJO OC](./images/ajooc117.png)

これで、キャンペーンをテストできます。 「**開始**」をクリックします。

![AJO OC](./images/ajooc118.png)

しばらくするとこれが表示されます。 **結果** をクリックし、**結果をプレビュー** を選択します。

![AJO OC](./images/ajooc120.png)

これに似た情報が表示されます。

![AJO OC](./images/ajooc121.png)

### メールアクティビティ

**+** アイコンをクリックし、「**メール**」を選択します。

![AJO OC](./images/ajooc122.png)

**メールを編集** をクリックします。

![AJO OC](./images/ajooc123.png)

**アクション** に移動します。

![AJO OC](./images/ajooc124.png)

前に作成した **メールチャネル設定** を選択し、「**コンテンツを編集**」をクリックします。

![AJO OC](./images/ajooc125.png)

**件名** に、次を貼り付けます。

`{{target.--aepUserLdap--_citisignal_recipients.first_name}}, Your CitiSignal Family Account Summary`

**メール本文を編集** をクリックします。

![AJO OC](./images/ajooc126.png)

[family_account_review.zip](./assets/family_account_review.zip) ファイルをデスクトップにダウンロードします。

![AJO OC](./images/ajooc127.png)

**HTMLを読み込み** をクリックします。

![AJO OC](./images/ajooc128.png)

クリックしてファイルを選択します。

![AJO OC](./images/ajooc129.png)

ファイル **`family_account_review.zip`** を選択します。

![AJO OC](./images/ajooc130.png)

「**次へ**」をクリックします。

![AJO OC](./images/ajooc131.png)

この画像が表示されます。

![AJO OC](./images/ajooc132.png)

## 次の手順

[Adobe Journey Optimizer：調整されたキャンペーン ](./ajocampaigns.md){target="_blank"} に戻る

[ すべてのモジュール ](./../../../../overview.md){target="_blank"} に戻る
