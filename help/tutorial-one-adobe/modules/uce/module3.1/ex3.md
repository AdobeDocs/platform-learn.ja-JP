---
title: データ収集 – FAC - フェデレーション構成の作成
description: 基盤 – FAC - フェデレーション構成の作成
kt: 5342
doc-type: tutorial
source-git-commit: ab3f13389ae194519dcb9c8988ea38b89f6e5907
workflow-type: tm+mt
source-wordcount: '492'
ht-degree: 3%

---

# 3.1.3 フェデレーション構成の作成

AEP でフェデレーションのオーディエンス構成を設定できるようになりました。

URL:[https://experience.adobe.com/platform](https://experience.adobe.com/platform) に移動して、Adobe Experience Platformにログインします。

ログインすると、Adobe Experience Platformのホームページが表示されます。

![データ取得](./images/home.png)

続行する前に、**サンドボックス** を選択する必要があります。 選択するサンドボックスの名前は ``--aepSandboxName--`` です。 適切なサンドボックスを選択すると、画面が変更され、専用のサンドボックスが表示されます。

![データ取得](./images/sb1.png)

## 3.1.3.1 オーディエンスの作成

左側のメニューで、**オーディエンス** に移動し、次に **フェデレーテッド コンポジション** に移動します。 **コンポジションを作成** をクリックします。

![FAC](./images/fedcomp1.png)

ラベルには、`--aepUserLdap-- - CitiSignal Fiber` を使用します。 前の演習で作成したデータモデル（`--aepUserLdap-- - CitiSignal Snowflake Data Model` という名前）を選択します。 「**作成**」をクリックします。

![FAC](./images/fedcomp2.png)

その後、これが表示されます。

![FAC](./images/fedcomp3.png)

**+** アイコンをクリックし、「**オーディエンスを作成** をクリックします。

![FAC](./images/fedcomp4.png)

その後、これが表示されます。 **オーディエンスを作成** を選択します。 **検索** アイコンをクリックして、スキーマを選択します。

![FAC](./images/fedcomp5.png)

スキーマ **CK_FAMILIES** を選択します。 「**確認**」をクリックします。

![FAC](./images/fedcomp6.png)

次に、「**続行** をクリックします。

![FAC](./images/fedcomp7.png)

これで、Snowflakeに送信されるクエリの作成を開始できます。 **+** アイコン、「**カスタム条件** の順にクリックします。

![FAC](./images/fedcomp8.png)

属性 **ISELIGIBLEFORFIBER** を選択し、「**確認**」をクリックします。

![FAC](./images/fedcomp9.png)

その後、これが表示されます。 フィールド **値** を **True** に設定します。 「**計算**」をクリックしてクエリをSnowflakeにプッシュし、選定されたプロファイルの推定を取得します。

![FAC](./images/fedcomp10.png)

次に、「**+**」アイコンを再度クリックし、「**カスタム条件**」を再度クリックして別の条件を追加します。

![FAC](./images/fedcomp11.png)

追加する 2 番目の条件は `Is the user an existing CitiSignal Mobile subscriber?` です。 この質問に答える方法は、世帯と世帯の主要顧客との関係を使用することです。これは、別のテーブル **CK_PERSON** で定義されています。 「**household2person**」リンクを使用して、属性メニューをドリルダウンできます。

![FAC](./images/fedcomp12.png)

属性 **ISMOBILESUB** を選択し、「**確認**」をクリックします。

![FAC](./images/fedcomp13.png)

フィールド **値** を **True** に設定します。もう一度 **計算** をクリックして、ターゲットにするプロファイルの数を更新します。 「**確認**」をクリックします。

![FAC](./images/fedcomp14.png)

**+** アイコン、「**オーディエンスを保存** の順にクリックします。

![FAC](./images/fedcomp15.png)

**オーディエンスラベル** を `--aepUserLdap-- - CitiSignal Eligible for Fiber` に設定します。

「**+ オーディエンスマッピングを追加**」をクリックします。

![FAC](./images/fedcomp16.png)

**HOUSEHOLD_ID** を選択し、「**確認**」をクリックします。

![FAC](./images/fedcomp17.png)

「**+ オーディエンスマッピングを追加**」をクリックします。

![FAC](./images/fedcomp18.png)

**ターゲティングディメンション** をクリックしてドリルダウンします。

![FAC](./images/fedcomp18a.png)

リンク **household2person** をクリックしてドリルダウンします。

![FAC](./images/fedcomp18b.png)

フィールド **名前** を選択します。 「**確認**」をクリックします。

![FAC](./images/fedcomp18c.png)

「**+ オーディエンスマッピングを追加**」をクリックします。

![FAC](./images/fedcomp20.png)

**ターゲティングディメンション** をクリックしてドリルダウンします。

![FAC](./images/fedcomp20a.png)

リンク **household2person** をクリックしてドリルダウンします。

![FAC](./images/fedcomp20b.png)

「**メール**」フィールドを選択します。 「**確認**」をクリックします。

![FAC](./images/fedcomp20c.png)

その後、これが表示されます。 次に、**プライマリ ID フィールド** を設定し、**Household2person_EMAIL** に設定する必要があります。

「**保存**」をクリックします。

![FAC](./images/fedcomp21.png)

君の作文はもう仕上がっている。 「**スタート**」をクリックして実行します。

これで、クエリがSnowflakeにプッシュされ、そこにソースデータがクエリされます。 結果は AEP にプッシュされますが、ソースデータはSnowflake内に残ります。

これでオーディエンスにデータが入力され、オーディエンスは AEP エコシステム内からターゲット設定できます。

次の手順：[ 概要とメリット ](./summary.md)

[モジュール 3.1 に戻る](./fac.md)

[すべてのモジュールに戻る](../../../overview.md)
