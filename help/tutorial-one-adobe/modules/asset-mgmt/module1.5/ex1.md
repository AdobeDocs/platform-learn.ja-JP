---
title: Adobe Commerce as a Cloud Serviceの導入方法
description: Adobe Commerce as a Cloud Serviceの導入方法
kt: 5342
doc-type: tutorial
exl-id: 8603c8e2-c3ba-4976-9703-cef9e63924b8
source-git-commit: 7e0214226eaee0586d036d46de39c08046d43893
workflow-type: tm+mt
source-wordcount: '891'
ht-degree: 15%

---

# 1.5.1 Adobe Commerce as a Cloud Serviceの概要

[https://experience.adobe.com/](https://experience.adobe.com/){target="_blank"}に移動します。 正しい環境であることを確認してください。名前は`--aepImsOrgName--`にする必要があります。 **Commerce**&#x200B;をクリックします。

![AEM Assets](./images/accs1.png)

## 1.5.1.1 ACCS インスタンスを作成します

そうすると、これが表示されます。 「**+ インスタンスを追加**」をクリックします。

![AEM Assets](./images/accs2.png)

次のようにフィールドに入力します。

- **インスタンス名**:

```
--aepUserLdap-- - ACCS
```

- **環境**: `Sandbox`
- **地域**: `North America`

「**インスタンスを追加**」をクリックします。

![AEM Assets](./images/accs3.png)

インスタンスが作成中です。 これには5～10分かかる場合があります。

![AEM Assets](./images/accs4.png)

インスタンスの準備ができたら、インスタンスをクリックして開きます。

![AEM Assets](./images/accs5.png)

## 1.5.1.2 CitiSignal ストアを設定

そうすると、これが表示されます。 「**Adobe IDでログイン**」をクリックし、ログインします。

![AEM Assets](./images/accs6.png)

ログインすると、このホームページが表示されます。 まず、CommerceでCitiSignal ストアを設定します。 「**店舗**」をクリックします。

![AEM Assets](./images/accs7.png)

**すべてのストア**&#x200B;をクリックします。

![AEM Assets](./images/accs8.png)

「**Web サイトを作成**」をクリックします。

![AEM Assets](./images/accs9.png)

次のようにフィールドに入力します。

- **名前**:

```
CitiSignal
```

- **コード**:

```
citisignal
```

「**Web サイトを保存**」をクリックします。

![AEM Assets](./images/accs10.png)

あなたはここに戻るべきだ。 「**ストアを作成**」をクリックします。

![AEM Assets](./images/accs11.png)

次のようにフィールドに入力します。

- **Web サイト**:

```
CitiSignal
```

- **名前**:

```
CitiSignal
```

- **コード**:

```
citisignal
```

- **ルートカテゴリ**: `Default Category`

「**ストアを保存**」をクリックします。

![AEM Assets](./images/accs12.png)

あなたはここに戻るべきだ。 「**ストアビューを作成**」をクリックします。

![AEM Assets](./images/accs13.png)

次のようにフィールドに入力します。

- **店舗**:

```
CitiSignal
```

- **名前**:

```
CitiSignal
```

- **コード**:

```
citisignal
```

- **ステータス**: `Enabled`

「**ストアビューを保存**」をクリックします。

![AEM Assets](./images/accs14.png)

その後、このメッセージが表示されます。 「**OK**」をクリックします。

![AEM Assets](./images/accs15.png)

あなたはここに戻るべきだ。 **CitiSignal** web サイトをクリックして開きます。

![AEM Assets](./images/accs16.png)

チェックボックスをオンにして、このWeb サイトを既定のWeb サイトとして設定します。

「**Web サイトを保存**」をクリックします。

![AEM Assets](./images/accs16a.png)

あなたはここに戻るべきだ。

![AEM Assets](./images/accs16.png)

## 1.5.1.3 カテゴリと製品の設定

**カタログ**&#x200B;に移動し、**カテゴリー**&#x200B;を選択します。

![AEM Assets](./images/accs17.png)

**既定のカテゴリ**&#x200B;を選択し、**サブカテゴリを追加**&#x200B;をクリックします。

![AEM Assets](./images/accs18.png)

次の名前を入力し、**保存**&#x200B;をクリックします。

```
Phones
```

![AEM Assets](./images/accs19.png)

**既定のカテゴリ**&#x200B;を選択し、**サブカテゴリを追加**&#x200B;をもう一度クリックします。

![AEM Assets](./images/accs20.png)

次の名前を入力し、**保存**&#x200B;をクリックします。

```
Watches
```

![AEM Assets](./images/accs21.png)

**既定のカテゴリ**&#x200B;を選択し、**サブカテゴリを追加**&#x200B;をもう一度クリックします。

![AEM Assets](./images/accs20a.png)

次の名前を入力し、**保存**&#x200B;をクリックします。

```
Plans
```

![AEM Assets](./images/accs21a.png)

**既定のカテゴリ**&#x200B;を選択し、**サブカテゴリを追加**&#x200B;をもう一度クリックします。

![AEM Assets](./images/accs20b.png)

次の名前を入力し、**保存**&#x200B;をクリックします。

```
Entertainment
```

![AEM Assets](./images/accs21b.png)

4つのカテゴリが作成されます。

![AEM Assets](./images/accs22.png)

次に、**カタログ**&#x200B;に移動し、**製品**&#x200B;を選択します。

![AEM Assets](./images/accs23.png)

そうすると、これが表示されます。 「**製品を追加**」をクリックします。

![AEM Assets](./images/accs24.png)

次のように製品を設定します。

- **製品名**:

```
iPhone Air
```

- **SKU**:

>[!NOTE]
>
>SKU フィールドが以下の値と同じであることを確認し、このフィールドにスペースがないことを確認してください。

```
iPhone-Air
```

- **価格**:

```
999
```

- **数量**:

```
10000
```

- **カテゴリ**: `Phones`を選択

「**保存**」をクリックします。

![AEM Assets](./images/accs25.png)

**設定**&#x200B;までスクロールし、**設定の作成**&#x200B;をクリックします。

![AEM Assets](./images/accs26.png)

そうすると、これが表示されます。 **新規属性の作成**&#x200B;をクリックします。

![AEM Assets](./images/accs27.png)

**デフォルトラベル**&#x200B;を以下の値に設定し、**オプションの管理**&#x200B;で「**オプションを追加**」をクリックします。

```
Storage
```

![AEM Assets](./images/accs28.png)

3列すべてで以下の値を使用して最初のオプションを設定し、**オプションを追加**&#x200B;をもう一度クリックします。

```
256GB
```

![AEM Assets](./images/accs29.png)

3列すべてで次の値を使用して2番目のオプションを設定し、**オプションを追加**&#x200B;をもう一度クリックします。

```
512GB
```

![AEM Assets](./images/accs30.png)

3つ目のオプションは、3つの列すべてで以下の値を使用して設定します。

```
1TB
```

![AEM Assets](./images/accs31.png)

**ストアフロントのプロパティ**&#x200B;までスクロールします。 次のオプションを&#x200B;**Yes**&#x200B;に設定します。

- **検索で使用**
- **ストアフロントでHTML タグを許可**
- **ストアフロントのカタログページに表示**
- **製品リストでの使用**

![AEM Assets](./images/accs32.png)

上にスクロールして、**属性を保存**&#x200B;をクリックします。

![AEM Assets](./images/accs33.png)

そうすると、これが表示されます。 **color**&#x200B;と&#x200B;**storage**&#x200B;の両方の属性を選択し、**Next**&#x200B;をクリックします。

![AEM Assets](./images/accs34.png)

そうすると、これが表示されます。 次に、使用可能なカラーオプションを追加する必要があります。 これを行うには、**新しい値を作成**&#x200B;をクリックします。

![AEM Assets](./images/accs35.png)

値`Sky-Blue`を入力し、**新しい値を作成**&#x200B;をクリックします。

![AEM Assets](./images/accs36.png)

値`Light-Gold`を入力し、**新しい値を作成**&#x200B;をクリックします。

![AEM Assets](./images/accs37.png)

値`Cloud-White`を入力し、**新しい値を作成**&#x200B;をクリックします。

![AEM Assets](./images/accs38.png)

値`Space-Black`を入力します。 **すべてを選択**&#x200B;をクリック

![AEM Assets](./images/accs39.png)

**ストレージ**&#x200B;の下にある3つのオプションをすべて選択し、**次へ**&#x200B;をクリックします。

![AEM Assets](./images/accs40.png)

既定の設定を残し、**次へ**&#x200B;をクリックします。

![AEM Assets](./images/accs41.png)

そうすると、これが表示されます。 「**製品を生成**」をクリックします。

![AEM Assets](./images/accs42.png)

各商品の&#x200B;**数量**&#x200B;を`10000`に設定します。 また、列&#x200B;**SKU**&#x200B;にSKUのいずれのスペースも含まれていないことを確認してください。

「**保存**」をクリックします。

![AEM Assets](./images/accs43.png)

「**確認**」をクリックします。

![AEM Assets](./images/accs45.png)

Web サイト **の**&#x200B;製品までスクロールし、**CitiSignal**&#x200B;のチェックボックスをオンにします。

「**保存**」をクリックします。

![AEM Assets](./images/accs44.png)

そうすると、これが表示されます。 「**戻る**」をクリックします。

![AEM Assets](./images/accs46.png)

商品カタログに商品&#x200B;**iPhone Air**&#x200B;とそのバリエーションが表示されました。

![AEM Assets](./images/accs47.png)

## 1.5.1.4製品のインポート

CitiSignalはより多くの製品を販売するため、製品カタログに残りの製品を作成するには、それらをインポートする必要があります。

**システム**&#x200B;に移動し、**読み込み**&#x200B;に移動します。

![AEM Assets](./images/accsimp1.png)

次の値を選択します。

- **エンティティの種類**: `Products`
- **ビヘイビアー**&#x200B;の読み込み：`Add/Update`
- **検証戦略**: `Skip error entries`

「**ファイルを選択**」をクリックします。

![AEM Assets](./images/accsimp2.png)

このファイルをコンピューターにダウンロードします：[product_catalog_import.csv.zip](./assets/product_catalog_import.csv.zip)。 デスクトップ上のファイルを抽出します。

![AEM Assets](./images/accsimp7.png)

ファイル **`product_catalog_import.csv`**&#x200B;を選択し、**開く**&#x200B;をクリックします。

![AEM Assets](./images/accsimp3.png)

そうすると、これが表示されます。 「**データを確認**」をクリックします。

![AEM Assets](./images/accsimp4.png)

そうすると、これが表示されます。 「**インポート**」をクリックします。

![AEM Assets](./images/accsimp5.png)

そうすると、これが表示されます。

![AEM Assets](./images/accsimp6.png)

**カタログ**&#x200B;に移動し、次に&#x200B;**製品**&#x200B;に移動します。

![AEM Assets](./images/accsimp8.png)

下にスクロールして、インポートした商品を探します。

![AEM Assets](./images/accsimp9.png)

次の手順：[ACCSをAEM Sites CS/EDS ストアフロントに接続](./ex2.md){target="_blank"}

[Adobe Commerce as a Cloud Service](./accs.md){target="_blank"}に戻る

[すべてのモジュールに戻る](./../../../overview.md){target="_blank"}
