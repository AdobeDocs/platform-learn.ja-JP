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

に移動してAdobe Journey Optimizerにログインします。 [Adobe Experience Cloud](https://experience.adobe.com). クリック **Journey Optimizer**.

![ACOP](./images/acophome.png)

にリダイレクトされます **ホーム**  Journey Optimizerで表示します。 最初に、正しいサンドボックスを使用していることを確認します。 使用するサンドボックスはと呼ばれます `Bootcamp`. サンドボックスを変更するには、をクリックします。 **Prod** リストからサンドボックスを選択します。 この例では、サンドボックスの名前はです **Bootcamp**. その後、 **ホーム** サンドボックスの表示 `Bootcamp`.

![ACOP](./images/acoptriglp.png)

## 2.3.1 ジャーニーの作成

左のメニューで、「**ジャーニー**」をクリックします。次に、 **ジャーニーを作成** 新規ジャーニーを作成します。

![ACOP](./images/createjourney.png)

すると、空のジャーニー画面が表示されます。

![ACOP](./images/journeyempty.png)

前の演習では、新しい **イベント**. 次のような名前を付けました `yourLastNameAccountCreationEvent` およびが置き換えられました `yourLastName` 姓で。 イベント作成の結果：

![ACOP](./images/eventdone.png)

次に、このジャーニーをこのイベントの開始として受け取る必要があります。 これを行うには、画面の左側に移動して、イベントのリストでイベントを検索します。

![ACOP](./images/eventlist.png)

イベントを選択し、ジャーニーキャンバスにドラッグ&amp;ドロップします。 ジャーニーは次のようになります。

![ACOP](./images/journeyevent.png)

ジャーニーの 2 番目の手順として、短いものを追加する必要があります **待機** ステップ。 画面の左側に移動し、 **オーケストレーション** これを見つけるためにセクション。 プロファイル属性を使用し、リアルタイム顧客プロファイルに入力されていることを確認する必要があります。

![ACOP](./images/journeywait.png)

ジャーニーは次のようになります。 画面の右側には、待機時間を設定する必要があります。 1 分に設定します。 これにより、イベントの発生後にプロファイル属性が使用可能になるまで、十分な時間が与えられます。

![ACOP](./images/journeywait1.png)

クリック **Ok** 変更を保存します。

ジャーニーの 3 番目の手順として、を追加する必要があります **電子メール** アクション。 画面の左側に移動して、以下を行います **アクション**&#x200B;を選択し、 **電子メール** アクションを実行してから、ジャーニーの 2 番目のノードにドラッグ&amp;ドロップします。 これが表示されます。

![ACOP](./images/journeyactions.png)

を **カテゴリ** 対象： **Marketing** を選択し、メール送信を有効にするメールサーフェスを選択します。 この場合、選択するメールサーフェスはです。 **電子メール**. 以下のチェックボックスをオンにします。 **メールのクリック数** および **メールの開封数** 両方とも有効になっています。

![ACOP](./images/journeyactions1.png)

次の手順では、メッセージを作成します。 次のボタンをクリックします **コンテンツを編集**.

![ACOP](./images/journeyactions2.png)

## 2.3.2 メッセージの作成

メッセージを作成するには、 **コンテンツを編集**.

![ACOP](./images/journeyactions2.png)

これが表示されます。

![ACOP](./images/journeyactions3.png)

「」をクリックします **件名** テキストフィールド。

![Journey Optimizer](./images/msg5.png)

テキスト領域に書き込みを開始します **こんにちは**

![Journey Optimizer](./images/msg6.png)

件名がまだ完了していません。 次に、フィールドのパーソナライゼーショントークンを取り込みます **名** に保存されます。 `profile.person.name.firstName`. 左側のメニューで、下にスクロールし、 **人物** 要素と深いレベルに行くために矢印をクリックしてください。

![Journey Optimizer](./images/msg7.png)

次に、 **姓名** 要素と深いレベルに行くために矢印をクリックしてください。

![Journey Optimizer](./images/msg8.png)

最後に、を見つけます **名** フィールドに移動し、 **+** その隣に署名してください。 テキストフィールドにパーソナライゼーショントークンが表示されます。

![Journey Optimizer](./images/msg9.png)

次に、テキストを追加します **様、登録いただきありがとうございます。**。「**保存**」をクリックします。

![Journey Optimizer](./images/msg10.png)

その後、ここに戻ります。 クリック **電子メールデザイナー** ：メールのコンテンツを作成します。

![Journey Optimizer](./images/msg11.png)

次の画面では、メールのコンテンツを指定するための 3 つの異なる方法を選択するように求められます。

- **ゼロからデザイン**：空のキャンバスから開始し、WYSIWYG エディターを使用して、構造およびコンテンツコンポーネントをドラッグ&amp;ドロップして、メールのコンテンツを視覚的に作成します。
- **独自のコーディング**:HTMLを使用してコーディングすることにより、独自のメールテンプレートを作成します
- **読み込みHTML**：編集可能な既存のHTMLテンプレートを読み込みます。

クリック **読み込みHTML**. または、以下のいずれかをクリックします。 **保存済みテンプレート** テンプレートを選択します。 **Bootcamp - メールテンプレート**.

![Journey Optimizer](./images/msg12.png)

を選択した場合 **読み込みHTML**&#x200B;これで、ファイルをドラッグ&amp;ドロップできます **mailtemplatebootcamp.html**&#x200B;をダウンロードできます [こちら](../../assets/html/mailtemplatebootcamp.html.zip). 「読み込み」をクリックします。

![Journey Optimizer](./images/msg13.png)

すると、次のデフォルトのメールテンプレートが表示されます。

![Journey Optimizer](./images/msg14.png)

メールをパーソナライズしましょう。 テキストの横にあるをクリックします **こんにちは** 次に、 **Add Personalization** アイコン。

![Journey Optimizer](./images/msg35.png)

次に、 **名** の下に保存されるパーソナライゼーショントークン `profile.person.name.firstName`. メニューで、を見つけます **人物** 要素、にドリルダウンします **氏名** 要素を選択し、 **+** アイコンをクリックして、「名」フィールドを式エディターに追加します。

「**保存**」をクリックします。

![Journey Optimizer](./images/msg36.png)

これで、パーソナライゼーションフィールドがテキストにどのように追加されたかがわかります。

![Journey Optimizer](./images/msg37.png)

クリック **保存** メッセージを保存します。

![Journey Optimizer](./images/msg55.png)

「」をクリックして、メッセージダッシュボードに戻ります **矢印** 左上隅の件名行のテキストの横。

![Journey Optimizer](./images/msg56.png)

登録メールの作成が完了しました。 左上隅の矢印をクリックして、ジャーニーに戻ります。

![Journey Optimizer](./images/msg57.png)

「**OK**」をクリックします。

![Journey Optimizer](./images/msg57a.png)

## 2.3.3 ジャーニーの公開

ジャーニーに名前を付ける必要があります。 それには、 **鉛筆** アイコンが画面の左上に表示されます。

![ACOP](./images/journeyname.png)

ジャーニーの名前をここに入力できます。 を使用してください。 `yourLastName - Account Creation Journey`. 「**OK**」をクリックして変更を保存します。

![ACOP](./images/journeyname1.png)

次をクリックして、ジャーニーを公開できます。 **公開**.

![ACOP](./images/publishjourney.png)

クリック **公開** また。

![ACOP](./images/publish1.png)

その後、ジャーニーが公開済みになったことを示す緑色の確認バーが表示されます。

![ACOP](./images/published.png)

これで、この演習が完了しました。

次の手順： [2.4 ジャーニーのテスト](./ex4.md)

[ユーザーフロー 2 に戻る](./uc2.md)

[すべてのモジュールに戻る](../../overview.md)