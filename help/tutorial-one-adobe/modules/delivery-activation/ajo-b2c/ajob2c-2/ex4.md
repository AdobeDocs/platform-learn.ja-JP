---
title: Adobe Journey Optimizer - ジャーニーとメッセージの設定
description: Adobe Journey Optimizer - ジャーニーとメッセージの設定
kt: 5342
doc-type: tutorial
exl-id: 687eb818-2d50-4293-88e6-7e5945b91db6
source-git-commit: e3d3b8e3abdea1766594eca53255df024129cb2c
workflow-type: tm+mt
source-wordcount: '1484'
ht-degree: 4%

---

# 3.2.4 ジャーニーとメッセージの作成

この演習では、Adobe Journey Optimizerを使用して、ジャーニーを作成し、複数のテキストメッセージを作成します。

このユースケースでは、顧客の場所の気象条件に基づいて様々なメッセージを送信することが目標です。 次の 3 つのシナリオが定義されています。

- 摂氏 10 度より寒い
- 摂氏 10～25 度
- 摂氏 25 度より暖かい

これらの 3 つの条件の場合、Adobe Journey Optimizerで 3 つのメッセージを定義する必要があります。

## 3.2.4.1 ジャーニーの作成

[Adobe Experience Cloud](https://experience.adobe.com) に移動して、Adobe Journey Optimizerにログインします。 **Journey Optimizer** をクリックします。

![ACOP](./../../../../modules/delivery-activation/ajo-b2c/ajob2c-1/images/acophome.png)

Journey Optimizerの **ホーム** ビューにリダイレクトされます。 最初に、正しいサンドボックスを使用していることを確認します。 使用するサンドボックスは `--aepSandboxName--` です。 その後、サンドボックス **ージの** ホーム `--aepSandboxName--` ビューに移動します。

![ACOP](./../../../../modules/delivery-activation/ajo-b2c/ajob2c-1/images/acoptriglp.png)

左側のメニューで、**ジャーニーに移動し** 「ジャーニーを作成 **」をクリックして**&#x200B;ジャーニーの作成を開始します。

![デモ](./images/jocreate.png)

まず、ジャーニーに名前を付ける必要があります。

ジャーニーの名前として、`--aepUserLdap-- - Geofence Entry Journey` を使用します。 現時点では、他の値を設定する必要はありません。 「**保存**」をクリックします。

![デモ](./images/joname.png)

画面の左側で、**イベント** を確認します。 以前に作成したイベントが、`--aepUserLdap--GeofenceEntry` という名前でそのリストに表示されます。 選択して、ジャーニーキャンバスにドラッグ&amp;ドロップします。 ジャーニーは次のようになります。

![デモ](./images/joevents.png)

次に、「**オーケストレーション**」をクリックします。 使用可能な **オーケストレーション** 機能が表示されます。 **条件** を選択し、ジャーニーキャンバスにドラッグ&amp;ドロップします。

![デモ](./images/jo2.png)

次に、この条件に 3 つのパスを設定する必要があります。

- 気温はセ氏 10 度より寒いです
- 気温はセ氏 10 度から 25 度の間です
- 気温は摂氏 25 度を超えています

最初の条件を定義します。

### 状態 1：摂氏 10 度より寒い

**条件** をクリックします。  **Path1** をクリックし、パスの名前を **10 C より寒い** に編集します。 Path1 の式の **編集** アイコンをクリックします。

![デモ](./images/jo5.png)

すると、空の **シンプルなエディター** 画面が表示されます。 クエリはもう少し高度なので、**詳細設定モード** が必要です。 **詳細設定モード** をクリックします。

![デモ](./images/jo7.png)

次に、コードを入力できる **詳細エディター** が表示されます。

![デモ](./images/jo9.png)

以下のコードを選択して、**詳細エディター** に貼り付けます。

`#{--aepUserLdap--WeatherApi.--aepUserLdap--WeatherByCity.main.temp} <= 10`

その後、これが表示されます。

![デモ](./images/jo10.png)

この条件の一部として気温を取得するには、顧客が現在いる市区町村を指定する必要があります。
**市区町村** は、Open Weather API ドキュメントで前に説明したように、動的パラメーター `q` にリンクする必要があります。

スクリーンショットに示されているフィールド **dynamic val: q** をクリックします。

![デモ](./images/jo11.png)

次に、利用可能なデータソースの 1 つで、顧客の現在の市区町村を含むフィールドを見つける必要があります。この場合、**コンテキスト** の下でそれを見つける必要があります。

![デモ](./images/jo12.png)

`--aepUserLdap--GeofenceEntry.placeContext.geo.city` に移動すると、フィールドを見つけることができます。

そのフィールドをクリックするか **+** をクリックすると、そのフィールドがパラメーター `q` の動的な値として追加されます。 このフィールドには、例えばモバイルアプリに実装した geolocation-service が入力されます。 この場合、デモ web サイトのデータ収集プロパティを使用して、これをシミュレートします。 「**OK**」をクリックします。

![デモ](./images/jo13.png)

### 条件 2：摂氏 10～25 度

最初の条件を追加すると、この画面が表示されます。 **パスを追加** をクリックします。

![デモ](./images/joc2.png)

**Path1** をダブルクリックし、パス名を **10～25 C** に編集します。 このパスの式の **編集** アイコンをクリックします。

![デモ](./images/joc6.png)

すると、空の **シンプルなエディター** 画面が表示されます。 クエリはもう少し高度なので、**詳細設定モード** が必要です。 **詳細設定モード** をクリックします。

![デモ](./images/jo7.png)

次に、コードを入力できる **詳細エディター** が表示されます。

![デモ](./images/jo9.png)

以下のコードを選択して、**詳細エディター** に貼り付けます。

`#{--aepUserLdap--WeatherApi.--aepUserLdap--WeatherByCity.main.temp} > 10 and #{--aepUserLdap--WeatherApi.--aepUserLdap--WeatherByCity.main.temp} <= 25`

その後、これが表示されます。

![デモ](./images/joc10.png)

この条件の一部として気温を取得するには、顧客が現在いる市区町村を指定する必要があります。
**市区町村** は、以前に Open Weather API ドキュメントで見たように、動的パラメーター **q** にリンクされている必要があります。

スクリーンショットに示されているフィールド **dynamic val: q** をクリックします。

![デモ](./images/joc11.png)

次に、利用可能なデータソースの 1 つで、顧客の現在の市区町村を含むフィールドを見つける必要があります。

![デモ](./images/jo12.png)

`--aepUserLdap--GeofenceEntry.placeContext.geo.city` に移動すると、フィールドを見つけることができます。 そのフィールドをクリックすると、パラメーター **q** の動的な値として追加されます。 このフィールドには、例えばモバイルアプリに実装した geolocation-service が入力されます。 この場合、デモ web サイトのデータ収集プロパティを使用して、これをシミュレートします。 「**OK**」をクリックします。

![デモ](./images/jo13.png)

次に、3 番目の条件を追加します。

### 状態 3：摂氏 25 度より暖かい

2 番目の条件を追加すると、この画面が表示されます。 **パスを追加** をクリックします。

![デモ](./images/joct2.png)

Path1 をダブルクリックして、名前を **25 C より暖かい** に変更します。
次に、このパスの式の **編集** アイコンをクリックします。

![デモ](./images/joct6.png)

すると、空の **シンプルなエディター** 画面が表示されます。 クエリはもう少し高度なので、**詳細設定モード** が必要です。 **詳細設定モード** をクリックします。

![デモ](./images/jo7.png)

次に、コードを入力できる **詳細エディター** が表示されます。

![デモ](./images/jo9.png)

以下のコードを選択して、**詳細エディター** に貼り付けます。

`#{--aepUserLdap--WeatherApi.--aepUserLdap--WeatherByCity.main.temp} > 25`

その後、これが表示されます。

![デモ](./images/joct10.png)

この条件の一部として気温を取得するには、顧客が現在いる市区町村を指定する必要があります。
**市区町村** は、以前に Open Weather API ドキュメントで見たように、動的パラメーター **q** にリンクされている必要があります。

スクリーンショットに示されているフィールド **dynamic val: q** をクリックします。

![デモ](./images/joct11.png)

次に、利用可能なデータソースの 1 つで、顧客の現在の市区町村を含むフィールドを見つける必要があります。

![デモ](./images/jo12.png)

```--aepUserLdap--GeofenceEntry.placeContext.geo.city``` に移動すると、フィールドを見つけることができます。 そのフィールドをクリックすると、パラメーター **q** の動的な値として追加されます。 このフィールドには、例えばモバイルアプリに実装した geolocation-service が入力されます。 この場合、デモ web サイトのデータ収集プロパティを使用して、これをシミュレートします。 「**OK**」をクリックします。

![デモ](./images/jo13.png)

これで、3 つのパスが設定されました。 「**保存**」をクリックします。

![デモ](./images/jo3path.png)

これは学習目的のジャーニーなので、マーケターがメッセージを配信するために必要な様々なオプションを紹介するために、いくつかのアクションを設定します。

## 3.2.4.2 パスのメッセージを送信：10°C より寒い

温度コンテキストごとに、顧客にテキストメッセージを送信しようとします。 この演習では、携帯電話番号ではなく、実際のメッセージをSlack チャンネルに送信します。

パス **10°C より寒い** に焦点を当てましょう。

![デモ](./images/p1steps.png)

左側のメニューで、「**アクション**」に戻り、「アクション」 `--aepUserLdap--TextSlack` プションを選択して、「**メッセージ**」アクションの後にドラッグ&amp;ドロップします。

![デモ](./images/joa18.png)

「**リクエストパラメーター**」までスクロールし、パラメーター **の** 編集 `textToSlack` アイコンをクリックします。

![デモ](./images/joa19.png)

ポップアップウィンドウで、「**詳細設定モード**」をクリックします。

![デモ](./images/joa20.png)

以下のコードを選択し、コピーして **詳細モードエディター** に貼り付けます。 「**OK**」をクリックします。

`"Brrrr..." + #{ExperiencePlatform.ProfileFieldGroup.profile.person.name.firstName} + ",  it's cold and freezing outside. Get comfortable at home with a 20% discount on a Disney+ subscription!"`

![デモ](./images/joa21.png)

完了したアクションが表示されます。 上にスクロールして、「**保存**」をクリックします。

![デモ](./images/joa22.png)

これで、ジャーニーのこのパスの準備が整いました。

## 3.2.4.3 パスのメッセージを送信：10° ～ 25°C

温度コンテキストごとに、顧客にメッセージを送信しようとします。 この演習では、携帯電話番号ではなく、実際のメッセージをSlack チャンネルに送信します。

**10～25°C** のパスに焦点を当ててみましょう。

![デモ](./images/p2steps.png)

左側のメニューで、「**アクション**」に戻り、「アクション」 `--aepUserLdap--TextSlack` プションを選択して、「**メッセージ**」アクションの後にドラッグ&amp;ドロップします。

![デモ](./images/jop18.png)

「**リクエストパラメーター**」までスクロールし、パラメーター **の** 編集 `textToSlack` アイコンをクリックします。

![デモ](./images/joa19z.png)

ポップアップウィンドウで、「**詳細設定モード**」をクリックします。

![デモ](./images/joa20.png)

以下のコードを選択し、コピーして **詳細モードエディター** に貼り付けます。 「**OK**」をクリックします。

`"What nice weather for the time of year, " + #{ExperiencePlatform.ProfileFieldGroup.profile.person.name.firstName} + " 20% discount on Apple AirPods so you can go for a walk and listen to your favorite podcast!"`

![デモ](./images/jop21.png)

完了したアクションが表示されます。 上にスクロールして、「**保存**」をクリックします。

![デモ](./images/jop22.png)

これで、ジャーニーのこのパスの準備が整いました。

## 3.2.4.4 パスのメッセージを送信：25°C より高い

温度コンテキストごとに、顧客にメッセージを送信しようとします。 この演習では、携帯電話番号ではなく、実際のメッセージをSlack チャンネルに送信します。

**25°C よりも暖かい** パスに焦点を当てましょう。

![デモ](./images/p3steps.png)

左側のメニューで、「**アクション**」に戻り、「アクション」 `--aepUserLdap--TextSlack` プションを選択して、「**メッセージ**」アクションの後にドラッグ&amp;ドロップします。

![デモ](./images/jod18.png)

「**リクエストパラメーター**」までスクロールし、パラメーター **の** 編集 `textToSlack` アイコンをクリックします。

![デモ](./images/joa19zzz.png)

ポップアップウィンドウで、「**詳細設定モード**」をクリックします。

![デモ](./images/joa20.png)

以下のコードを選択し、コピーして **詳細モードエディター** に貼り付けます。 「**OK**」をクリックします。

`"So warm, " + #{ExperiencePlatform.ProfileFieldGroup.profile.person.name.firstName} + "! 20% discount on adding 10GB of extra data so you can get online at the beach!"`

![デモ](./images/jod21.png)

完了したアクションが表示されます。 「**保存**」をクリックします。

![デモ](./images/jod22.png)

これで、ジャーニーのこのパスの準備が整いました。

## 3.2.4.5 ジャーニーの公開

これで、ジャーニーが完全に設定されました。 「**公開**」をクリックします。

![デモ](./images/jodone.png)

もう一度 **公開** をクリックします。

![デモ](./images/jopublish1.png)

これで、ジャーニーが公開されました。

![デモ](./images/jopublish2.png)

## 次の手順

ジャーニーをトリガーする [3.2.5](./ex5.md){target="_blank"} に移動します

[Adobe Journey Optimizer：外部データソースとカスタムアクション &#x200B;](journey-orchestration-external-weather-api-sms.md){target="_blank"} に戻る

[&#x200B; すべてのモジュール &#x200B;](./../../../../overview.md){target="_blank"} に戻る
