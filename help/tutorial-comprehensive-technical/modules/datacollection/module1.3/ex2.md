---
title: データ収集 – FAC - スキーマ、データモデル、リンクの作成
description: 基盤 – FAC - スキーマ、データモデル、リンクの作成
kt: 5342
doc-type: tutorial
exl-id: e863ab3a-44df-4bb4-b081-a62616aaa1f1
source-git-commit: 1c91cb2129f827fd39dc065baf5d8ea067a5731a
workflow-type: tm+mt
source-wordcount: '613'
ht-degree: 5%

---

# 1.3.2 スキーマ、データモデル、リンクの作成

これで、AEP で連合データベースを設定できるようになりました。

URL:[https://experience.adobe.com/platform](https://experience.adobe.com/platform) に移動して、Adobe Experience Platformにログインします。

ログインすると、Adobe Experience Platformのホームページが表示されます。

![データ取得](./../module1.2/images/home.png)

続行する前に、**サンドボックス** を選択する必要があります。 選択するサンドボックスの名前は ``--aepSandboxName--`` です。 適切なサンドボックスを選択すると、画面が変更され、専用のサンドボックスが表示されます。

![データ取得](./../module1.2/images/sb1.png)

## 1.3.2.1 AEP での連合データベースのセットアップ

左側のメニューで **連合データベース** をクリックします。 次に、「**連合データベースを追加**」をクリックします。

![FAC](./images/fdb1.png)

**ラベル** として、`--aepUserLdap-- - CitiSignal Snowflake` を使用し、タイプとして **Snowflake** を選択します。

詳細で、資格情報を入力する必要があります。この資格情報は次のようになります。

![FAC](./images/fdb2.png)

**サーバー**:

Snowflakeーで、**管理者/アカウント** に移動します。 アカウントの横にある 3 **...** をクリックし、「**URL を管理**」をクリックします。

![FAC](./images/fdburl1.png)

その後、これが表示されます。 **現在の URL** をコピーして、AEP の **サーバー** フィールドに貼り付けます。

![FAC](./images/fdburl2.png)

**ユーザー**：演習 1.3.1.1 で前に作成したユーザー名
**パスワード**：演習 1.3.1.1 で以前に作成したパスワード
**データベース**: **CITISIGNAL** を使用します

最後に、これを取得します。 **接続をテスト** をクリックします。 テストが成功した場合は、「**関数をデプロイ**」をクリックすると、ワークフローエンジンに必要なSnowflake側の関数が作成されます。

接続が正常にテストされ、機能がデプロイされると、設定が保存されます。

![FAC](./images/fdb3.png)

**フェデレーション データベース** メニューに戻ると、接続が表示されます。

![FAC](./images/fdb4.png)

## 1.3.2.2 AEP でのスキーマの作成

左側のメニューで **モデル** をクリックし、**スキーマ** に移動します。 **スキーマを作成** をクリックします。

![FAC](./images/fdb5.png)

連合データベースを選択し、「**+ テーブルを追加**」をクリックします。

![FAC](./images/fdb6.png)

その後、これが表示されます。 Snowflakeで作成した 5 つのテーブルを選択します。

- `CK_HOUSEHOLDS`
- `CK_MOBILE_DATA_USAGE`
- `CK_MONTHLY_DATA_USAGE`
- `CK_PERSONS`
- `CK_USERS`

「**追加**」をクリックします。

![FAC](./images/fdb7.png)

次に、AEP は各テーブルの情報を読み込み、UI に表示します。

テーブルごとに、次の操作を実行できます。

- スキーマのラベルを変更する
- 説明を追加する
- すべてのフィールドの名前を変更し、表示を設定する
- スキーマのプライマリキーを選択

この演習では、変更は必要ありません。

「**作成**」をクリックします。

![FAC](./images/fdb8.png)

その後、これが表示されます。 任意のスキーマをクリックして、情報を確認できます。 例えば、「**CK_PERSONS**」をクリックします。

![FAC](./images/fdb9.png)

設定を編集する機能が備わったことがわかります。 **データ** をクリックして、Snowflakeデータベースにあるデータのサンプルを表示します。

![FAC](./images/fdb10.png)

データのサンプルが表示されます。

![FAC](./images/fdb11.png)

## 1.3.2.3 AEP でのモデルの作成

左側のメニューで、**モデル** に移動し、**データモデル** に移動します。 **データモデルを作成** をクリックします。

![FAC](./images/fdb12.png)

ラベルには、`--aepUserLdap-- - CitiSignal Snowflake Data Model` を使用します。 「**作成**」をクリックします。

![FAC](./images/fdb13.png)

「**スキーマを追加**」をクリックします。

![FAC](./images/fdb14.png)

スキーマを選択し、「**追加**」をクリックします。

![FAC](./images/fdb15.png)

その後、これが表示されます。 「**保存**」をクリックします。

これで、スキーマ間のリンクの定義を開始できます。 リンクの定義を開始するには、「**リンクを作成**」をクリックする必要があります。

![FAC](./images/fdb16.png)

まず、テーブル `CK_USERS` と `CK_PERSONS` の間のリンクを定義します。

「**追加**」をクリックします。

![FAC](./images/fdb18.png)

その後、ここに戻ります。 **リンクを作成** をクリックして、別のリンクを作成します。

![FAC](./images/fdb17.png)

次に、テーブル `CK_HOUSEHOLDS` と `CK_PERSONS` の間のリンクを定義します。

![FAC](./images/fdb19.png)

その後、ここに戻ります。 **リンクを作成** をクリックして、別のリンクを作成します。

![FAC](./images/fdb20.png)

次に、テーブル `CK_MONTHLY_DATA_USAGE` と `CK_USERS` の間のリンクを定義します。

![FAC](./images/fdb21.png)

その後、ここに戻ります。 **リンクを作成** をクリックして、別のリンクを作成します。

![FAC](./images/fdb22.png)

次に、テーブル `CK_USERS` と `CK_HOUSEHOLDS` の間のリンクを定義します。

![FAC](./images/fdb23.png)

その後、ここに戻ります。 **保存** をクリックします。
![FAC](./images/fdb24.png)

これで、AEP での設定が完了しました。 これで、連合オーディエンス構成で連合データの使用を開始できます。

次の手順：[1.3.3 フェデレーション構成を作成する ](./ex3.md)

[モジュール 1.3 に戻る](./fac.md)

[すべてのモジュールに戻る](../../../overview.md)
