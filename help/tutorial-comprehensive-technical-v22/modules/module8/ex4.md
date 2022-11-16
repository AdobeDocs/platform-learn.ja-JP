---
title: Adobe Journey Optimizer - Adobe Journey Optimizer内で SMS チャネルを設定して使用する
description: Adobe Journey Optimizer - Adobe Journey Optimizer内で SMS チャネルを設定して使用する
kt: 5342
audience: Data Engineer, Data Architect, Orchestration Engineer, Marketer
doc-type: tutorial
activity: develop
exl-id: 1a08f666-4ea3-43bc-ace7-5dc9854b89ad
source-git-commit: cc7a77c4dd380ae1bc23dc75608e8e2224dfe78c
workflow-type: tm+mt
source-wordcount: '2261'
ht-degree: 6%

---

# 8.4 ジャーニーとメッセージの作成

この演習では、Adobe Journey Optimizerを使用して、ジャーニーと複数のテキストメッセージを作成します。

この使用例では、顧客の所在地の気象状況に基づいて異なる SMS メッセージを送信することを目的としています。 次の 3 つのシナリオが定義されました。

- 摂氏 10°以上低い
- 摂氏 10°～25°
- 摂氏 25°以上

この 3 つの条件に対して、Adobe Journey Optimizerで 3 つの SMS メッセージを定義する必要があります。

## 8.4.1 ジャーニーの作成

に移動してAdobe Journey Optimizerにログインします。 [Adobe Experience Cloud](https://experience.adobe.com). クリック **Journey Optimizer**.

![ACOP](../module7/images/acophome.png)

リダイレクト先： **ホーム**  Journey Optimizerで表示 まず、正しいサンドボックスを使用していることを確認します。 使用するサンドボックスは、と呼ばれます。 `--aepSandboxId--`. サンドボックス間を切り替えるには、 **実稼動 (VA7)** リストからサンドボックスを選択します。 この例では、サンドボックスの名前はです。 **AEP 有効化 FY22**. その後、 **ホーム** サンドボックスの表示 `--aepSandboxId--`.

![ACOP](../module7/images/acoptriglp.png)


左側のメニューで、に移動します。 **ジャーニー** をクリックし、 **作成ジャーニー** をクリックして、ジャーニーの作成を開始します。

![デモ](./images/jocreate.png)

ジャーニーに名前を付ける必要があります。

ジャーニーの名前として、次を使用します。 `--demoProfileLdap-- - Geofence Entry Journey`. この例では、ジャーニー名はです。 `vangeluw - Geofence Entry Journey`. 現時点では、他の値を設定する必要はありません。 「**OK**」をクリックします。

![デモ](./images/joname.png)

画面の左側で、を見てください。 **イベント**. このリストには、以前に作成したイベントが表示されます。 選択し、ジャーニーキャンバスにドラッグ&amp;ドロップします。 ジャーニーは次のようになります。 「**OK**」をクリックします。

![デモ](./images/joevents.png)

次に、 **Orchestration**. これで、使用可能な **Orchestration** 機能 選択 **条件**&#x200B;をクリックし、「ジャーニー」キャンバスにドラッグ&amp;ドロップします。

![デモ](./images/jo2.png)

次に、3 つの条件を定義する必要があります。

- 摂氏 10°度より寒い
- 摂氏 10°～25°です
- 摂氏 25°度より暖かい

最初の条件を定義します。

### 条件 1:摂氏 10°以上低い

をクリックします。 **条件**.  クリック **パス 1** パスの名前を **10 C より低い**. をクリックします。 **編集** Path1 の式のアイコン。

![デモ](./images/jo5.png)

すると、空の **簡易エディタ** 画面 クエリがもう少し高度になるので、 **詳細設定モード**. クリック **詳細設定モード**.

![デモ](./images/jo7.png)

次に、 **詳細エディタ** コードを入力できます。

![デモ](./images/jo9.png)

以下のコードを選択し、 **詳細エディタ**.

`#{--demoProfileLdap--WeatherApi.--demoProfileLdap--WeatherByCity.main.temp} <= 10`

これが見えます

![デモ](./images/jo10.png)

この条件の一部として温度を取得するには、顧客が現在いる市区町村を指定する必要があります。
この **市区町村** 動的パラメーターにリンクする必要があります `q`前述の Open Weather API ドキュメントで見たように。

フィールドをクリック **動的値：q** スクリーンショットで示したように。

![デモ](./images/jo11.png)

次に、使用可能なデータソースの 1 つで、顧客の現在の市区町村を含むフィールドを検索する必要があります。

![デモ](./images/jo12.png)

次の場所に移動すると、このフィールドを見つけることができます。 `--demoProfileLdap--GeofenceEntry.placeContext.geo.city`.

そのフィールドをクリックすると、パラメーターの動的な値として追加されます `q`. このフィールドには、モバイルアプリに実装した位置情報サービスなどが入力されます。 この例では、デモ Web サイトの admin console でこれをシミュレートします。 「**OK**」をクリックします。

![デモ](./images/jo13.png)

### 条件 2:摂氏 10°～25°

最初の条件を追加すると、次の画面が表示されます。 クリック **パスを追加**.

![デモ](./images/joc2.png)

ダブルクリック **パス 1** パス名を次のように編集します。 **10 ～ 25 C の間**. 次をクリック： **編集** このパスの式のアイコン。

![デモ](./images/joc6.png)

すると、空の **簡易エディタ** 画面 クエリがもう少し高度になるので、 **詳細設定モード**. クリック **詳細設定モード**.

![デモ](./images/jo7.png)

次に、 **詳細エディタ** コードを入力できます。

![デモ](./images/jo9.png)

以下のコードを選択し、 **詳細エディタ**.

`#{--demoProfileLdap--WeatherApi.--demoProfileLdap--WeatherByCity.main.temp} > 10 and #{--demoProfileLdap--WeatherApi.--demoProfileLdap--WeatherByCity.main.temp} <= 25`

これが見えます

![デモ](./images/joc10.png)

この条件の一部として温度を取得するには、顧客が現在いる市区町村を指定する必要があります。
この **市区町村** 動的パラメーターにリンクする必要があります **q**&#x200B;前述の Open Weather API ドキュメントで見たように。

フィールドをクリック **動的値：q** スクリーンショットで示したように。

![デモ](./images/joc11.png)

次に、使用可能なデータソースの 1 つで、顧客の現在の市区町村を含むフィールドを検索する必要があります。

![デモ](./images/jo12.png)

次の場所に移動すると、このフィールドを見つけることができます。 `--demoProfileLdap--GeofenceEntry.placeContext.geo.city`. そのフィールドをクリックすると、パラメーターの動的な値として追加されます **q**. このフィールドには、モバイルアプリに実装した位置情報サービスなどが入力されます。 この例では、デモ Web サイトの admin console でこれをシミュレートします。 「**OK**」をクリックします。

![デモ](./images/jo13.png)

次に、3 番目の条件を追加します。

### 条件 3:摂氏 25°以上

2 番目の条件を追加すると、次の画面が表示されます。 クリック **パスを追加**.

![デモ](./images/joct2.png)

パス 1 をダブルクリックして名前を次に変更します。 **25 C より暖かい**.
次に、 **編集** このパスの式のアイコン。

![デモ](./images/joct6.png)

すると、空の **簡易エディタ** 画面 クエリがもう少し高度になるので、 **詳細設定モード**. クリック **詳細設定モード**.

![デモ](./images/jo7.png)

次に、 **詳細エディタ** コードを入力できます。

![デモ](./images/jo9.png)

以下のコードを選択し、 **詳細エディタ**.

`#{--demoProfileLdap--WeatherApi.--demoProfileLdap--WeatherByCity.main.temp} > 25`

これが見えます

![デモ](./images/joct10.png)

この条件の一部として温度を取得するには、顧客が現在いる市区町村を指定する必要があります。
この **市区町村** 動的パラメーターにリンクする必要があります **q**&#x200B;前述の Open Weather API ドキュメントで見たように。

フィールドをクリック **動的値：q** スクリーンショットで示したように。

![デモ](./images/joct11.png)

次に、使用可能なデータソースの 1 つで、顧客の現在の市区町村を含むフィールドを検索する必要があります。

![デモ](./images/jo12.png)

次の場所に移動すると、このフィールドを見つけることができます。 ```--demoProfileLdap--GeofenceEntry.placeContext.geo.city```. そのフィールドをクリックすると、パラメーターの動的な値として追加されます **q**. このフィールドには、モバイルアプリに実装した位置情報サービスなどが入力されます。 この例では、デモ Web サイトの admin console でこれをシミュレートします。 「**OK**」をクリックします。

![デモ](./images/jo13.png)

これで、3 つのパスが設定されました。 「**OK**」をクリックします。

![デモ](./images/jo3path.png)

これは学習目的のジャーニーなので、マーケターがメッセージを配信する必要のある様々なオプションを紹介するために、いくつかのアクションを設定します。

## 8.4.2 パスに対するメッセージの送信：摂氏 10°以上低い

温度コンテキストごとに、お客様にテキストメッセージを送信しようとします。 お客様の携帯電話番号がある場合にのみ、テキストメッセージを送信できます。その場合は、まず確認が必要です。

次に焦点を当てましょう **10 C より低い**.

![デモ](./images/p1steps.png)

次を見てみましょう **条件** 要素をドラッグし、以下のスクリーンショットに示すようにドラッグします。 この顧客の携帯電話番号が使用可能かどうかを確認します。

![デモ](./images/joa1.png)

これは一例なので、顧客がモバイル番号を利用できるオプションのみを設定します。 ラベルを **携帯電話は？**.

をクリックします。 **編集** アイコン **パス 1** パス。

![デモ](./images/joa2.png)

左側に表示されているデータソースで、に移動します。 **ExperiencePlatform.ProfileFieldGroup.profile.mobilePhone.number**. Adobe Experience Platformのリアルタイム顧客プロファイルから携帯電話番号を直接読み取るようになりました。

![デモ](./images/joa3.png)

フィールドを選択 **数値**&#x200B;をクリックし、条件キャンバスにドラッグ&amp;ドロップします。

演算子を選択 **が空ではない**. 「**OK**」をクリックします。

![デモ](./images/joa4.png)

これが見えます クリック **OK** 再び

![デモ](./images/joa6.png)

ジャーニーは次のようになります。 クリック **アクション** スクリーンショットで示したように。

![デモ](./images/joa8.png)

アクションを選択 **SMS**&#x200B;をクリックし、追加した条件の後にドラッグ&amp;ドロップします。

![デモ](./images/joa9.png)

を **カテゴリ** から **マーケティング** をクリックし、SMS を送信できる SMS 表面を選択します。 この場合、選択する E メールサーフェスは次のようになります。 **SMS**.

![ACOP](./images/journeyactions1.png)

次の手順では、メッセージを作成します。 それには、「 **コンテンツを編集**.

![ACOP](./images/journeyactions2.png)

これで、SMS のテキストを設定できるメッセージダッシュボードが表示されます。 次をクリック： **メッセージを作成** 領域を使用して、メッセージを作成します。

![Journey Optimizer](./images/sms3.png)

次のテキストを入力します。 `Brrrr... {{profile.person.name.firstName}}, it's freezing. 20% discount on jackets today!`. 「**保存**」をクリックします。

![Journey Optimizer](./images/sms4.png)

これが見えます 左上隅の矢印をクリックして、ジャーニーに戻ります。

![Journey Optimizer](./images/sms4a.png)

その後、戻ってきます。 「**OK**」をクリックします。

![Journey Optimizer](./images/sms4b.png)

左側のメニューで、に戻ります。 **アクション**、「アクション」を選択します。 `--demoProfileLdap--TextSlack`をクリックし、その後にドラッグ&amp;ドロップします。 **メッセージ** アクション。

![デモ](./images/joa18.png)

に移動します。 **アクションパラメーター** をクリックし、 **編集** パラメーターのアイコン `TEXTTOSLACK`.

![デモ](./images/joa19.png)

ポップアップウィンドウで、 **詳細設定モード**.

![デモ](./images/joa20.png)

以下のコードを選択し、コピーして、 **詳細モードエディター**. 「**OK**」をクリックします。

`"Brrrr..." + #{ExperiencePlatform.ProfileFieldGroup.profile.person.name.firstName} + " It's freezing. 20% discount on Jackets today!"`

![デモ](./images/joa21.png)

完了したアクションが表示されます。 「**OK**」をクリックします。

![デモ](./images/joa22.png)

ジャーニーのこのパスの準備が整いました。

## 8.4.3 パスに対するメッセージの送信：摂氏 10°～25°

温度コンテキストごとに、お客様にテキストメッセージを送信しようとします。 お客様の携帯電話番号がある場合にのみ、テキストメッセージを送信できます。その場合は、まず確認が必要です。

次に焦点を当てましょう **10 ～ 25 C の間** パス。

![デモ](./images/p2steps.png)

次を見てみましょう **条件** 要素をドラッグし、以下のスクリーンショットに示すようにドラッグします。 この顧客の携帯電話番号が使用可能かどうかを確認します。

![デモ](./images/jop1.png)

これは一例なので、顧客がモバイル番号を利用できるオプションのみを設定します。 ラベルを **携帯電話は？**.

をクリックします。 **編集** アイコン **パス 1** パス。

![デモ](./images/joa2p2.png)

左側に表示されているデータソースで、に移動します。 **ExperiencePlatform.ProfileFieldGroup.profile.mobilePhone.number**. Adobe Experience Platformのリアルタイム顧客プロファイルから携帯電話番号を直接読み取るようになりました。

![デモ](./images/joa3.png)

フィールドを選択 **数値**&#x200B;をクリックし、条件キャンバスにドラッグ&amp;ドロップします。

演算子を選択 **が空ではない**. 「**OK**」をクリックします。

![デモ](./images/joa4.png)

これが見えます 「**OK**」をクリックします。

![デモ](./images/joa6.png)

ジャーニーは次のようになります。 クリック **アクション** スクリーンショットで示したように。

![デモ](./images/jop8.png)

アクションを選択 **SMS**&#x200B;をクリックし、追加した条件の後にドラッグ&amp;ドロップします。

![デモ](./images/jop9.png)

を **カテゴリ** から **マーケティング** をクリックし、SMS を送信できる SMS 表面を選択します。 この場合、選択する E メールサーフェスは次のようになります。 **SMS**.

![ACOP](./images/journeyactions1z.png)

次の手順では、メッセージを作成します。 それには、「 **コンテンツを編集**.

![ACOP](./images/journeyactions2z.png)

これで、SMS のテキストを設定できるメッセージダッシュボードが表示されます。 次をクリック： **メッセージを作成** 領域を使用して、メッセージを作成します。

![Journey Optimizer](./images/sms3a.png)

次のテキストを入力します。 `What a nice weather for the time of year, {{profile.person.name.firstName}} - 20% discount on Sweaters today!`. 「**保存**」をクリックします。

![Journey Optimizer](./images/sms4az.png)

これが見えます 左上隅の矢印をクリックして、ジャーニーに戻ります。

![Journey Optimizer](./images/sms4azz.png)

これで、完了したアクションが表示されます。 「**OK**」をクリックします。

![デモ](./images/jop17.png)

左側のメニューで、に戻ります。 **アクション**、「アクション」を選択します。 `--demoProfileLdap--TextSlack`をクリックし、その後にドラッグ&amp;ドロップします。 **メッセージ** アクション。

![デモ](./images/jop18.png)

に移動します。 **アクションパラメーター** をクリックし、 **編集** パラメーターのアイコン `TEXTTOSLACK`.

![デモ](./images/joa19z.png)

ポップアップウィンドウで、 **詳細設定モード**.

![デモ](./images/joa20.png)

以下のコードを選択し、コピーして、 **詳細モードエディター**. 「**OK**」をクリックします。

`"What nice weather for the time of year, " + #{ExperiencePlatform.ProfileFieldGroup.profile.person.name.firstName} + " 20% discount on Sweaters today!"`

![デモ](./images/jop21.png)

完了したアクションが表示されます。 「**OK**」をクリックします。

![デモ](./images/jop22.png)

ジャーニーのこのパスの準備が整いました。

## 8.4.4 パスのメッセージの送信：摂氏 25°以上

温度コンテキストごとに、お客様にテキストメッセージを送信しようとします。 お客様の携帯電話番号がある場合にのみ、テキストメッセージを送信できます。その場合は、まず確認が必要です。

次に焦点を当てましょう **25 C より暖かい** パス。

![デモ](./images/p3steps.png)

次を見てみましょう **条件** 要素をドラッグし、以下のスクリーンショットに示すようにドラッグします。 この顧客の携帯電話番号が使用可能かどうかを確認します。

![デモ](./images/jod1.png)

これは一例なので、顧客がモバイル番号を利用できるオプションのみを設定します。 ラベルを **携帯電話は？**.

をクリックします。 **編集** アイコン **パス 1** パス。

![デモ](./images/joa2p3.png)

左側に表示されているデータソースで、に移動します。 **ExperiencePlatform.ProfileFieldGroup.profile.mobilePhone.number**. Adobe Experience Platformのリアルタイム顧客プロファイルから携帯電話番号を直接読み取るようになりました。

![デモ](./images/joa3.png)

フィールドを選択 **数値**&#x200B;をクリックし、条件キャンバスにドラッグ&amp;ドロップします。

演算子を選択 **が空ではない**. 「**OK**」をクリックします。

![デモ](./images/joa4.png)

これが見えます 「**OK**」をクリックします。

![デモ](./images/joa6.png)

ジャーニーは次のようになります。 クリック **アクション** スクリーンショットで示したように。

![デモ](./images/jod8.png)

アクションを選択 **SMS**&#x200B;をクリックし、追加した条件の後にドラッグ&amp;ドロップします。

![デモ](./images/jod9.png)

を **カテゴリ** から **マーケティング** をクリックし、SMS を送信できる SMS 表面を選択します。 この場合、選択する E メールサーフェスは次のようになります。 **SMS**.

![ACOP](./images/journeyactions1zy.png)

次の手順では、メッセージを作成します。 それには、「 **コンテンツを編集**.

![ACOP](./images/journeyactions2zy.png)

これで、SMS のテキストを設定できるメッセージダッシュボードが表示されます。 次をクリック： **メッセージを作成** 領域を使用して、メッセージを作成します。

![Journey Optimizer](./images/sms3ab.png)

次のテキストを入力します。 `So warm, {{profile.person.name.firstName}}! 20% discount on swimwear today!`. 「**保存**」をクリックします。

![Journey Optimizer](./images/sms4ab.png)

これが見えます 左上隅の矢印をクリックして、ジャーニーに戻ります。

![Journey Optimizer](./images/sms4azzz.png)

これで、完了したアクションが表示されます。 「**OK**」をクリックします。

![デモ](./images/jod17.png)

左側のメニューで、に戻ります。 **アクション**、「アクション」を選択します。 `--demoProfileLdap--TextSlack`をクリックし、その後にドラッグ&amp;ドロップします。 **メッセージ** アクション。

![デモ](./images/jod18.png)

に移動します。 **アクションパラメーター** をクリックし、 **編集** パラメーターのアイコン `TEXTTOSLACK`.

![デモ](./images/joa19zzz.png)

ポップアップウィンドウで、 **詳細設定モード**.

![デモ](./images/joa20.png)

以下のコードを選択し、コピーして、 **詳細モードエディター**. 「**OK**」をクリックします。

`"So warm, " + #{ExperiencePlatform.ProfileFieldGroup.profile.person.name.firstName} + "! 20% discount on swimwear today!"`

![デモ](./images/jod21.png)

完了したアクションが表示されます。 「**OK**」をクリックします。

![デモ](./images/jod22.png)

ジャーニーのこのパスの準備が整いました。

## 8.4.5 ジャーニーの公開

これで、ジャーニーの設定が完了しました。 「**公開**」をクリックします。

![デモ](./images/jodone.png)

クリック **公開** 再び

![デモ](./images/jopublish1.png)

ジャーニーが公開されました。

![デモ](./images/jopublish2.png)

次のステップ： [8.5 ジャーニーのトリガー](./ex5.md)

[モジュール 8 に戻る](journey-orchestration-external-weather-api-sms.md)

[すべてのモジュールに戻る](../../overview.md)
