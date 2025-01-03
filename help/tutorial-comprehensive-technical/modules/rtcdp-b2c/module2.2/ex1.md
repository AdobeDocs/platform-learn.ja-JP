---
title: インテリジェントサービス – 顧客 AI データ準備（取り込み）
description: 顧客 AI - データ準備（取り込み）
kt: 5342
doc-type: tutorial
source-git-commit: 6962a0d37d375e751a05ae99b4f433b0283835d0
workflow-type: tm+mt
source-wordcount: '785'
ht-degree: 4%

---

# 2.2.1 顧客 AI - データ準備（取り込み）

インテリジェントサービスでマーケティングイベントデータからインサイトを発見するには、データを意味的にエンリッチメントし、標準構造で維持する必要があります。 インテリジェントサービスでは、Adobeの Experience Data Model （XDM）スキーマを活用してこれを実現します。
特に、インテリジェントサービスで使用されるすべてのデータセットは、**コンシューマーエクスペリエンスイベント** XDM スキーマに準拠する必要があります。

## 2.2.1.1 スキーマの作成

この演習では、**顧客 AI** インテリジェントサービスに必要な **コンシューマーエクスペリエンスイベント Mixin** を含むスキーマを作成します。

URL:[https://experience.adobe.com/platform](https://experience.adobe.com/platform) に移動して、Adobe Experience Platformにログインします。

ログインすると、Adobe Experience Platformのホームページが表示されます。

![データ取得](../../datacollection/module1.2/images/home.png)

続行する前に、**サンドボックス** を選択する必要があります。 選択するサンドボックスの名前は ``--module10sandbox--`` です。 これを行うには、画面上部の青い線のテキスト **[!UICONTROL 実稼動製品]** をクリックします。 適切なサンドボックスを選択すると、画面が変更され、専用のサンドボックスが表示されます。

![データ取得](../../datacollection/module1.2/images/sb1.png)

左側のメニューから **スキーマ** をクリックし、**参照** に移動します。 **スキーマを作成** をクリックします。

![ 新しいスキーマの作成 ](./images/create-schema-button.png)

ポップアップで、「**XDM ExperienceEvent**」を選択します。

![ 新しいスキーマの作成 ](./images/xdmee.png)

その後、これが表示されます。

![ 新しいスキーマの作成 ](./images/xdmee1.png)

次の **Mixin** を検索して選択し、このスキーマに追加します。

- コンシューマーエクスペリエンスイベント

  ![ 新しい CEE スキーマ ](./images/cee.png)

- エンドユーザー ID の詳細

  ![ 新しい CEE スキーマ ](./images/identitymap.png)

「**フィールドグループを追加**」をクリックします。

![ID キー定義 ](./images/addmixin.png)

その後、これが表示されます。 「Mixin **エンドユーザー ID 詳細**」を選択します。

![ 新しいスキーマの作成 ](./images/eui1.png)

フィールド **endUserIDs に移動します。_experience.emailid.id**.

![ 新しいスキーマの作成 ](./images/eui2.png)

**endUserIDs フィールドの右側のメニューで以下を行います。_experience.emailid.id**、下にスクロールして **ID** のチェックボックスをオンにし、**プライマリ ID** のチェックボックスをオンにして、「**メール** の **ID 名前空間** をオンにします。

![ 新しいスキーマの作成 ](./images/eui3.png)

フィールド **endUserIDs に移動します。_experience.mcid.id**. 「**ID**」のチェックボックスをオンにして、「**ECID**」の「**ID 名前空間**」を選択します。 「**適用**」をクリックします。

![ 新しいスキーマの作成 ](./images/eui4.png)

ここでスキーマに名前を付けます。

スキーマの名前として、次を使用します。

- `--aepUserLdap-- - Demo System - Customer Experience Event`

例えば、ldap **vangeluw** の場合、次はスキーマの名前である必要があります。

- **vangeluw - デモシステム – カスタマーエクスペリエンスイベント**

それはあなたにこのようなものを与えるはずです。 「**+追加**」ボタンをクリックして、新しい **Mixin** を追加します。

![ 新しいスキーマの作成 ](./images/xdmee2.png)

スキーマの名前を選択します。 これで、「プロファイル **切り替えをクリックして、** プロファイル **のスキーマを有効に** ます。

![ 新しいスキーマの作成 ](./images/xdmee3.png)

その後、これが表示されます。 **有効にする** をクリックします。

![ 新しいスキーマの作成 ](./images/xdmee4.png)

これで、このが得られます。 「**保存**」をクリックしてスキーマを保存します。

![ 新しいスキーマの作成 ](./images/xdmee5.png)

## 2.2.1.2 データセットの作成

左側のメニューで **データセット** をクリックし、**参照** に移動します。 **データセットを作成** をクリックします。

![データセット](./images/createds.png)

「**スキーマからデータセットを作成**」をクリックします。

![データセット](./images/createdatasetfromschema.png)

次の画面では、前の演習で作成したデータセット（「**[!UICONTROL ldap - Demo System - Customer Experience Event]**」という名前）を選択します。 「**次へ**」をクリックします。

![データセット](./images/createds1.png)

データセットの名前として、`--aepUserLdap-- - Demo System - Customer Experience Event Dataset` を使用します。 「**完了**」をクリックします。

![データセット](./images/createds2.png)

これで、データセットが作成されました。 **プロファイル** 切り替えを有効にします。

![データセット](./images/createds3.png)

**有効にする** をクリックします。

![データセット](./images/createds4.png)

これで、次のようになります。

![データセット](./images/createds5.png)

これで、消費者エクスペリエンスイベントデータの取り込みを開始し、顧客 AI サービスの使用を開始する準備が整いました。

## 2.2.1.3 エクスペリエンスイベントテストデータのダウンロード

**スキーマ** と **データセット** を設定したら、エクスペリエンスイベントデータを取り込む準備が整います。 顧客 AI には少なくとも **** 2 四半期にわたるデータが必要なので、外部で準備されたデータを取り込む必要があります。

エクスペリエンスイベント用に作成するデータは、[ コンシューマーエクスペリエンスイベント XDM Mixin](https://github.com/adobe/xdm/blob/797cf4930d5a80799a095256302675b1362c9a15/docs/reference/context/experienceevent-consumer.schema.md) の要件とスキーマに準拠している必要があります。

サンプルデータを含んだファイルを次の場所からダウンロードしてください：[https://dashboard.adobedemo.com/data](https://dashboard.adobedemo.com/data)。 「**ダウンロード**」ボタンをクリックします。

![データセット](./images/dsn1.png)

または、上記のリンクにアクセスできない場合は、次の場所からもファイルをダウンロードできます：[https://aepmodule10.s3-us-west-2.amazonaws.com/retail-v1-dec2020-xl.json.zip](https://aepmodule10.s3-us-west-2.amazonaws.com/retail-v1-dec2020-xl.json.zip)。

これで、**retail-v1-dec2020-xl.json.zip** という名前のファイルをダウンロードしました。 ファイルをコンピューターのデスクトップに配置し、展開すると、**retail-v1.json** という名前のファイルが表示されます。 このファイルは、次の演習で必要になります。

![データセット](./images/ingest.png)

## 2.2.1.4 エクスペリエンスイベントテストデータの取り込み

Adobe Experience Platformで、**データセット** に移動し、データセットを開きます。名前は **[!UICONTROL ldap - Demo System - Customer Experience Event Dataset]** です。

![データセット](./images/ingest1.png)

データセットで、「**ファイルを選択**」をクリックしてデータを追加します。

![データセット](./images/ingest2.png)

ポップアップでファイル **retail-v1.json** を選択し、「**開く**」をクリックします。

![データセット](./images/ingest3.png)

その後、データが読み込まれ、新しいバッチが **読み込み中** 状態で作成されます。 ファイルがアップロードされるまで、このページから移動しないでください。

![データセット](./images/ingest4.png)

ファイルがアップロードされると、バッチステータスが **読み込み中** から **処理中** に変更されます。

![データセット](./images/ingest5.png)

データの取り込みと処理には、10～20 分かかる場合があります。

データの取り込みに成功すると、バッチステータスが **成功** に変わります。

![データセット](./images/ingest7.png)

![データセット](./images/ingest8.png)

次の手順：[2.2.2 顧客 AI – 新しいインスタンスの作成（設定） ](./ex2.md)

[モジュール 2.2 に戻る](./intelligent-services.md)

[すべてのモジュールに戻る](./../../../overview.md)
