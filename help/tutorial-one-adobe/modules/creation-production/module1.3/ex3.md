---
title: Meta に対するGenStudio for Performance Marketing Campaign のアクティブ化
description: Meta に対するGenStudio for Performance Marketing Campaign のアクティブ化
role: Developer
level: Beginner
jira: KT-5342
doc-type: Tutorial
exl-id: 2c7ef715-b8af-4a5b-8873-5409b43d7cb0
source-git-commit: b8f7b370a5aba82a0dcd6e7f4f0222fe209976f7
workflow-type: tm+mt
source-wordcount: '798'
ht-degree: 0%

---

# 1.3.3 Meta に対する Campaign のアクティブ化

>[!IMPORTANT]
>
>この演習を行うには、AEM Content Hubを有効にした状態で、動作するAEM Assets CS オーサー環境にアクセスできる必要があります。 演習 [Adobe Experience Manager Cloud ServiceおよびEdge Delivery Servicesに従うと ](./../../../modules/asset-mgmt/module2.1/aemcs.md){target="_blank"} このような環境にアクセスできます。

>[!IMPORTANT]
>
>以前、AEM Assets CS プログラムをオーサー環境とAEM Assets環境で設定したことがある場合は、AEM CS サンドボックスが休止状態になっている可能性があります。 このようなサンドボックスの休止解除には 10～15 分かかるので、後で待つ必要がないように、今すぐ休止解除プロセスを開始することをお勧めします。

## 1.3.3.1 キャンペーンを作成

**GenStudio for Performance Marketing** で、左側のメニューの **キャンペーン** に移動します。 「**+ キャンペーンを追加**」をクリックします。

![GSPeM](./images/gscampaign1.png)

すると、空のキャンペーン概要が表示されます。

![GSPeM](./images/gscampaign2.png)

フィールド名には、`--aepUserLdap-- - CitiSignal Fiber Launch Campaign` を使用します。

「**説明**」フィールドに以下のテキストを使用します。

```
The CitiSignal Fiber Launch campaign introduces CitiSignal’s flagship fiber internet service—CitiSignal Fiber Max—to key residential markets. This campaign is designed to build awareness, drive sign-ups, and establish CitiSignal as the go-to provider for ultra-fast, reliable, and future-ready internet. The campaign will highlight the product’s benefits for remote professionals, online gamers, and smart home families, using persona-driven messaging across digital and physical channels.
```

フィールド **目的** に対して、以下のテキストを使用します。

```
Generate brand awareness in target regions
Drive early sign-ups and pre-orders for CitiSignal Fiber Max
Position CitiSignal as a premium, customer-first fiber internet provider
Educate consumers on the benefits of fiber over cable or DSL
```

「**キーメッセージング**」フィールドには、次のテキストを使用します。

```
Supporting Points:
Symmetrical speeds up to 2 Gbps
Whole-home Wi-Fi 6E coverage
99.99% uptime guarantee
24/7 concierge support
No data caps or throttling
 Channels:
Digital Advertising: Google Display, YouTube pre-roll, Meta (Facebook/Instagram), TikTok (for gamers)
Email Marketing: Persona-segmented drip campaigns
Social Media: Organic and paid posts with testimonials, speed demos, and influencer partnerships
Out-of-Home (OOH): Billboards, transit ads in suburban commuter corridors
Local Events: Pop-up booths at tech expos, family festivals, and gaming tournaments
Direct Mail: Personalized flyers with QR codes for early sign-up discounts
 
Target Regions:
Primary Launch Markets:
Denver Metro Area, CO
Austin, TX
Raleigh-Durham, NC
Salt Lake City, UT
Demographic Focus:
Suburban neighborhoods with high remote work density
Areas with high smart home adoption
Zip codes with underserved or dissatisfied cable customers
```

すると、次のようになります。

![GSPeM](./images/gscampaign3.png)

下にスクロールして、その他のフィールドを表示：

![GSPeM](./images/gscampaign4.png)

「**開始日** フィールドには、今日の日付を設定します。

「**終了**」フィールドには、1 か月後の日付を設定します。

フィールド **ステータス** で、**アクティブ** に設定します。

フィールド **チャネル** で、「**メタ**」、「**メール**」、「**有料メディア**」、「**ディスプレイ**」に設定します。

フィールド **地域** で、選択する地域を選択します。

フィールド **参照** > **製品** の場合：製品 `--aepUserLdap-- - CitiSignal Fiber Max` を選択します。

**参照**/**ペルソナ**:`--aepUserLdap-- - Remote Professionals`、`--aepUserLdap-- - Online Gamers`、`--aepUserLdap-- - Smart Home Families` のペルソナを選択します

次の情報が表示されます。

![GSPeM](./images/gscampaign5.png)

これで、キャンペーンの準備が整いました。 **矢印** をクリックして戻ります。

![GSPeM](./images/gscampaign6.png)

その後、リストにキャンペーンが表示されます。 カレンダービューアイコンをクリックして、ビューをキャンペーンカレンダーに変更します。

![GSPeM](./images/gscampaign7.png)

次に、どのキャンペーンがその時点でアクティブであるかをより視覚的に把握できるキャンペーンカレンダーが表示されます。

![GSPeM](./images/gscampaign8.png)

## 1.3.3.2 Meta への接続の設定

>[!IMPORTANT]
>
>Meta への接続を設定するには、Meta ユーザーアカウントを使用でき、そのユーザーアカウントを Meta Business アカウントに追加する必要があります。

Meta への接続を設定するには、3 つのドット **...** をクリックし、「**設定**」を選択します。

![GSPeM](./images/gsconnection1.png)

**メタ広告** の **接続** をクリックします。

![GSPeM](./images/gsconnection2.png)

Meta アカウントを使用してログインします。 「**続行**」をクリックします。

![GSPeM](./images/gsconnection3.png)

アカウントが Meta ビジネスアカウントにリンクされている場合、Meta で設定されたビジネスポートフォリオを選択できます。

![GSPeM](./images/gsconnection5.png)

接続が正常に確立されたら、「**X connected account （s）**」という行をクリックします。

![GSPeM](./images/gsconnection4.png)

GenStudio for Performance Marketingに接続されている Meta Business アカウントの詳細が表示されます。

![GSPeM](./images/gsconnection6.png)

## 1.3.3.3 新しいアセットを作成

[https://firefly.adobe.com/](https://firefly.adobe.com/){target="_blank"} に移動します。 プロンプト `a neon rabbit running very fast through space` を入力し、「**生成**」をクリックします。

![GSPeM](./images/gsasset1.png)

その後、複数の画像が生成されます。 最も気に入った画像を選択し、画像上の **共有** アイコンをクリックして、「**Adobe Expressで開く**」を選択します。

![GSPeM](./images/gsasset2.png)

生成した画像がAdobe Expressで編集できるようになります。 次に、画像に CitiSignal ロゴを追加する必要があります。 それには、**Brands** に移動します。

![GSPeM](./images/gsasset3.png)

GenStudio for Performance Marketingで作成した CitiSignal ブランドテンプレートがAdobe Expressに表示されます。 `--aepUserLdap-- - CitiSignal` という名前のブランド テンプレートをクリックして選択します。

![GSPeM](./images/gsasset4.png)

**ロゴ** に移動し、**白** Citignal ロゴをクリックして画像にドロップします。

![GSPeM](./images/gsasset5.png)

CitiSignal ロゴを左上隅に配置します。

![GSPeM](./images/gsasset6.png)

次に、「**共有**」をクリックします。

![GSPeM](./images/gsasset7.png)

「**AEM Assets**」を選択します。

![GSPeM](./images/gsasset8.png)

**フォルダーを選択** をクリックします。

![GSPeM](./images/gsasset9.png)

AEM Assets CS リポジトリ（`--aepUserLdap-- - CitiSignal` という名前）を選択し、フォルダー `--aepUserLdap-- - CitiSignal Fiber Campaign` を選択します。 「**選択**」をクリックします。

![GSPeM](./images/gsasset11.png)

この画像が表示されます。 **1 個のアセットをアップロード** をクリックします。 これで、画像がAEM Assets CS にアップロードされます。

![GSPeM](./images/gsasset12.png)

[https://experience.adobe.com/](https://experience.adobe.com/){target="_blank"} に移動します。 **Experience Manager Assets** を開きます。

![GSPeM](./images/gsasset13.png)

AEM Assets CS 環境を選択します。`--aepUserLdap-- - CitiSignal dev` という名前を付ける必要があります。

![GSPeM](./images/gsasset14.png)

**Assetsに移動し** フォルダー `--aepUserLdap-- - CitiSignal Fiber Campaign` をダブルクリックします。

![GSPeM](./images/gsasset15.png)

これに似た情報が表示されます。 画像 `--aepUserLdap-- - neon rabbit` をダブルクリックします。

![GSPeM](./images/gsasset16.png)

その後、画像 `--aepUserLdap-- - neon rabbit` が表示されます。 **ステータス** を **承認済み** に変更し、「**保存** をクリックします

>[!IMPORTANT]
>
>画像のステータスが **承認済み** に設定されていない場合、画像はGenStudio for Performance Marketingに表示されません。 GenStudio for Performance Marketingでは、承認済みのアセットにのみアクセスできます。

![GSPeM](./images/gsasset17.png)

GenStudio for Performance Marketingに戻ります。 左側のメニューで、**Assetsに移動し** AEM Assets CS リポジトリを選択します。これは `--aepUserLdap-- - CitiSignal` という名前にする必要があります。 作成して承認した画像がGenStudio for Performance Marketing内で使用できるようになります。

![GSPeM](./images/gsasset18.png)

## メタ広告を作成および承認で 1.3.3.4 ない

## 1.3.3.5 Meta に広告を公開

## 次の手順

[ 概要とメリット ](./summary.md){target="_blank"} に移動します。

[GenStudio for Performance Marketing](./genstudio.md){target="_blank"} に戻る

[ すべてのモジュール ](./../../../overview.md){target="_blank"} に戻る
