---
title: Bootcamp - Journey Optimizer ジャーニーとメールメッセージの作成
description: Bootcamp - Journey Optimizer ジャーニーとメールメッセージの作成
jira: KT-5342
audience: developer
doc-type: tutorial
activity: develop
solution: Journey Optimizer
feature-set: Journey Optimizer
feature: Journeys
exl-id: 138a70fa-fe50-4585-b47f-150db4770c3d
source-git-commit: cd59a41f4533f18a54d80298ee9faf3a8ba3c6e7
workflow-type: tm+mt
source-wordcount: '948'
ht-degree: 5%

---

# 2.3 ジャーニーとメールメッセージの作成

この演習では、デモ Web サイトでアカウントが作成されたときにトリガーする必要があるジャーニーを設定します。

[Adobe Experience Cloud](https://experience.adobe.com) に移動して、Adobe Journey Optimizerにログインします。 **Journey Optimizer** をクリックします。

![ACOP](./images/acophome.png)

Journey Optimizerの **ホーム** ビューにリダイレクトされます。 最初に、正しいサンドボックスを使用していることを確認します。 使用するサンドボックスは `Bootcamp` です。 サンドボックスを切り替えるには、「**Prod**」をクリックし、リストからサンドボックスを選択します。 この例では、サンドボックスの名前は **Bootcamp** です。 その後、サンドボックス `Bootcamp` ージの **ホーム** ビューに移動します。

![ACOP](./images/acoptriglp.png)

## 2.3.1 ジャーニーの作成

左のメニューで、「**ジャーニー**」をクリックします。次に、「**ジャーニーを作成**」をクリックして、新規のジャーニーを作成します。

![ACOP](./images/createjourney.png)

すると、空のジャーニー画面が表示されます。

![ACOP](./images/journeyempty.png)

前の演習では、新しい **イベント** を作成しました。 この `yourLastNameAccountCreationEvent` のように名前を付け、`yourLastName` を姓に置き換えました。 イベント作成の結果：

![ACOP](./images/eventdone.png)

次に、このジャーニーをこのイベントの開始として受け取る必要があります。 これを行うには、画面の左側に移動して、イベントのリストでイベントを検索します。

![ACOP](./images/eventlist.png)

イベントを選択し、ジャーニーキャンバスにドラッグ&amp;ドロップします。 ジャーニーは次のようになります。

![ACOP](./images/journeyevent.png)

ジャーニーの 2 番目のステップとして、短い **待機** ステップを追加する必要があります。 画面の左側の **オーケストレーション** セクションに移動して、これを見つけます。 プロファイル属性を使用し、リアルタイム顧客プロファイルに入力されていることを確認する必要があります。

![ACOP](./images/journeywait.png)

ジャーニーは次のようになります。 画面の右側には、待機時間を設定する必要があります。 1 分に設定します。 これにより、イベントの発生後にプロファイル属性が使用可能になるまで、十分な時間が与えられます。

![ACOP](./images/journeywait1.png)

**OK** をクリックして、変更を保存します。

ジャーニーの 3 番目の手順として、**メール** アクションを追加する必要があります。 画面の左側に移動して **アクション** し、**メール** アクションを選択して、ジャーニーの 2 番目のノードにドラッグ&amp;ドロップします。 これが表示されます。

![ACOP](./images/journeyactions.png)

**カテゴリ** を **マーケティング** に設定し、メールを送信できるメールサーフェスを選択します。 この場合、選択するメールサーフェスは **メール** です。 **メールのクリック数** と **メールの開封数** のチェックボックスが両方とも有効になっていることを確認します。

![ACOP](./images/journeyactions1.png)

次の手順では、メッセージを作成します。 それには、「**コンテンツを編集** をクリックします。

![ACOP](./images/journeyactions2.png)

## 2.3.2 メッセージの作成

メッセージを作成するには、「**コンテンツを編集**」をクリックします。

![ACOP](./images/journeyactions2.png)

これが表示されます。

![ACOP](./images/journeyactions3.png)

**件名** テキストフィールドをクリックします。

![Journey Optimizer](./images/msg5.png)

テキスト領域で書き始めます **こんにちは**

![Journey Optimizer](./images/msg6.png)

件名がまだ完了していません。 次に、`profile.person.name.firstName` に保存されている「名 **フィールドのパーソナライゼーショントークンを取り込む必要が** ります。 左側のメニューで、下にスクロールして **Person** 要素を見つけ、矢印をクリックしてレベルを深くします。

![Journey Optimizer](./images/msg7.png)

次に、**フルネーム** 要素を見つけて、矢印をクリックしてレベルを深くします。

![Journey Optimizer](./images/msg8.png)

最後に、「**名** フィールドを見つけ、その横にある「**+**」記号をクリックします。 テキストフィールドにパーソナライゼーショントークンが表示されます。

![Journey Optimizer](./images/msg9.png)

次に、「**, thank you for signing up!**。「**保存**」をクリックします。

![Journey Optimizer](./images/msg10.png)

その後、ここに戻ります。 **メールDesigner** をクリックして、メールのコンテンツを作成します。

![Journey Optimizer](./images/msg11.png)

次の画面では、メールのコンテンツを指定するための 3 つの異なる方法を選択するように求められます。

- **ゼロからデザイン**：空のキャンバスから開始し、WYSIWYG エディターを使用して、構造およびコンテンツコンポーネントをドラッグ&amp;ドロップして、メールのコンテンツを視覚的に作成します。
- **独自にコーディング**:HTMLを使用してコーディングし、独自のメールテンプレートを作成します
- **HTMLをインポート**：既存のHTMLテンプレートをインポートします。

**HTMLを読み込み** をクリックします。 または、「**保存済みのテンプレート**」をクリックし、テンプレート **Bootcamp - メールテンプレート** を選択することもできます。

![Journey Optimizer](./images/msg12.png)

**HTMLを読み込み** を選択した場合、ファイル **mailtemplatebootcamp.html** をドラッグ&amp;ドロップして、[ こちら ](../../assets/html/mailtemplatebootcamp.html.zip) からダウンロードできます。 「インポート」をクリックします。

![Journey Optimizer](./images/msg13.png)

すると、次のデフォルトのメールテンプレートが表示されます。

![Journey Optimizer](./images/msg14.png)

メールをパーソナライズしましょう。 テキスト **Hi** の横にある「」をクリックし、「**Personalizationを追加**」アイコンをクリックします。

![Journey Optimizer](./images/msg35.png)

次に、`profile.person.name.firstName` に保存されている **名** パーソナライゼーショントークンを取り込む必要があります。 メニューで、**ユーザー** 要素を見つけ、**姓名** 要素にドリルダウンし、**+** アイコンをクリックして、名フィールドを式エディターに追加します。

「**保存**」をクリックします。

![Journey Optimizer](./images/msg36.png)

これで、パーソナライゼーションフィールドがテキストにどのように追加されたかがわかります。

![Journey Optimizer](./images/msg37.png)

「**保存**」をクリックして、メッセージを保存します。

![Journey Optimizer](./images/msg55.png)

メッセージダッシュボードに戻るには、左上隅の件名テキストの横にある **矢印** をクリックします。

![Journey Optimizer](./images/msg56.png)

登録メールの作成が完了しました。 左上隅の矢印をクリックして、ジャーニーに戻ります。

![Journey Optimizer](./images/msg57.png)

「**OK**」をクリックします。

![Journey Optimizer](./images/msg57a.png)

## 2.3.3 ジャーニーのPublish

ジャーニーに名前を付ける必要があります。 画面の左上にある **鉛筆** アイコンをクリックすると、これを行うことができます。

![ACOP](./images/journeyname.png)

ジャーニーの名前をここに入力できます。 `yourLastName - Account Creation Journey` を使用してください。 「**OK**」をクリックして変更を保存します。

![ACOP](./images/journeyname1.png)

これで、**Publish** をクリックしてジャーニーを公開できます。

![ACOP](./images/publishjourney.png)

もう一度 **0}Publish} をクリックします。**

![ACOP](./images/publish1.png)

その後、ジャーニーが公開済みになったことを示す緑色の確認バーが表示されます。

![ACOP](./images/published.png)

これで、この演習が完了しました。

次の手順：[2.4 ジャーニーのテスト ](./ex4.md)

[ユーザーフロー 2 に戻る](./uc2.md)

[すべてのモジュールに戻る](../../overview.md)