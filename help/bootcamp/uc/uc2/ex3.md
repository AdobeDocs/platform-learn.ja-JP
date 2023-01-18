---
title: Bootcamp - Journey Optimizerジャーニーと電子メールメッセージを作成する
description: Bootcamp - Journey Optimizerジャーニーと電子メールメッセージを作成する
kt: 5342
audience: developer
doc-type: tutorial
activity: develop
exl-id: 138a70fa-fe50-4585-b47f-150db4770c3d
source-git-commit: ead28f5631fc430c41e8c756b23dc69ffe19510e
workflow-type: tm+mt
source-wordcount: '917'
ht-degree: 6%

---

# 2.3 ジャーニーと電子メールメッセージの作成

この演習では、デモ Web サイトでアカウントを作成したときにトリガーする必要があるジャーニーを設定します。

に移動してAdobe Journey Optimizerにログインします。 [Adobe Experience Cloud](https://experience.adobe.com). クリック **Journey Optimizer**.

![ACOP](./images/acophome.png)

リダイレクト先： **ホーム**  Journey Optimizerで表示 まず、正しいサンドボックスを使用していることを確認します。 使用するサンドボックスは、と呼ばれます。 `Bootcamp`. サンドボックス間を切り替えるには、 **Prod** リストからサンドボックスを選択します。 この例では、サンドボックスの名前はです。 **Bootcamp**. その後、 **ホーム** サンドボックスの表示 `Bootcamp`.

![ACOP](./images/acoptriglp.png)

## 2.3.1 ジャーニーの作成

左のメニューで、「**ジャーニー**」をクリックします。次に、「 **作成ジャーニー** をクリックして、新しいジャーニーを作成します。

![ACOP](./images/createjourney.png)

すると、空のジャーニー画面が表示されます。

![ACOP](./images/journeyempty.png)

前の練習では、新しい **イベント**. このように名前を付けました `yourLastNameAccountCreationEvent` および置き換え済み `yourLastName` を姓に置き換えます。 これは、イベントの作成の結果です。

![ACOP](./images/eventdone.png)

次に、このイベントをこのイベントの開始として使用する必要があります。ジャーニー これをおこなうには、画面の左側に移動して、イベントのリストでイベントを検索します。

![ACOP](./images/eventlist.png)

イベントを選択し、イベントキャンバスにドラッグ&amp;ドロップします。ジャーニー ジャーニーは次のようになります。

![ACOP](./images/journeyevent.png)

ジャーニーの 2 番目の手順として、短いを追加する必要があります **待機** 手順 画面の左側に移動して、 **Orchestration** を参照してください。 プロファイル属性を使用しているので、それらがリアルタイム顧客プロファイルに入力されていることを確認する必要があります。

![ACOP](./images/journeywait.png)

ジャーニーは次のようになりました。 画面の右側で、待機時間を設定する必要があります。 1 分に設定します。 これにより、イベントが発生した後にプロファイル属性が使用可能になるまでの時間が十分に確保されます。

![ACOP](./images/journeywait1.png)

クリック **Ok** 変更を保存します。

ジャーニーの 3 番目の手順として、 **電子メール** アクション。 画面の左側に移動して、 **アクション**&#x200B;を選択し、 **電子メール** アクションを実行し、ジャーニーの 2 番目のノードにドラッグ&amp;ドロップします。 これが見えます

![ACOP](./images/journeyactions.png)

を **カテゴリ** から **マーケティング** をクリックし、電子メールを送信できる電子メールサーフェスを選択します。 この場合、選択する E メールサーフェスは次のようになります。 **電子メール**. 次のチェックボックスをオンにします。 **メールのクリック数** および **メール開封数** 両方とも有効です。

![ACOP](./images/journeyactions1.png)

次の手順では、メッセージを作成します。 それには、「 **コンテンツを編集**.

![ACOP](./images/journeyactions2.png)

## 2.3.2 メッセージの作成

メッセージを作成するには、 **コンテンツを編集**.

![ACOP](./images/journeyactions2.png)

これが見えます

![ACOP](./images/journeyactions3.png)

次をクリック： **件名** テキストフィールド。

![Journey Optimizer](./images/msg5.png)

テキスト領域で、 **こんにちは**

![Journey Optimizer](./images/msg6.png)

件名はまだ行われていません。 次に、フィールドのパーソナライゼーショントークンを取り込む必要があります **名** それは以下の下に保存されています `profile.person.name.firstName`. 左側のメニューで、下にスクロールして、 **人物** 要素を選択し、矢印をクリックすると、次のレベルに移動します。

![Journey Optimizer](./images/msg7.png)

次に、 **氏名** 要素を選択し、矢印をクリックすると、次のレベルに移動します。

![Journey Optimizer](./images/msg8.png)

最後に、 **名** フィールドに入力し、 **+** その横にサインが表示されます。 パーソナライゼーショントークンがテキストフィールドに表示されます。

![Journey Optimizer](./images/msg9.png)

次に、テキストを追加します。 **新規登録ありがとうございました。**。「**保存**」をクリックします。

![Journey Optimizer](./images/msg10.png)

その後、戻ってきます。 クリック **メールデザイナー** 電子メールのコンテンツを作成します。

![Journey Optimizer](./images/msg11.png)

次の画面で、E メールのコンテンツを提供する 3 つの異なる方法が求められます。

- **ゼロからデザイン**:空白のキャンバスから開始し、WYSIWYG エディターを使用して、構造およびコンテンツコンポーネントをドラッグ&amp;ドロップし、電子メールのコンテンツを視覚的に作成します。
- **独自のコーディング**:HTML
- **インポートHTML**:既存のHTMLテンプレートをインポートします。編集できます。

クリック **インポートHTML**.

![Journey Optimizer](./images/msg12.png)

ファイルをドラッグ&amp;ドロップします **mailtemplatebootcamp.html**（ダウンロード可能） [ここ](../../assets/html/mailtemplatebootcamp.html.zip). 「読み込み」をクリックします。

![Journey Optimizer](./images/msg13.png)

次のデフォルトの電子メールテンプレートが表示されます。

![Journey Optimizer](./images/msg14.png)

E メールをパーソナライズしましょう。 テキストの横をクリック **こんにちは** そして、 **パーソナライゼーションを追加** アイコン

![Journey Optimizer](./images/msg35.png)

次に、 **名** 次の場所に保存されるパーソナライゼーショントークン `profile.person.name.firstName`. メニューで、 **人物** 要素、ドリルダウン **氏名** 要素を選択し、 **+** アイコンをクリックして、式エディターに「名」フィールドを追加します。

「**保存**」をクリックします。

![Journey Optimizer](./images/msg36.png)

パーソナライゼーションフィールドがテキストにどのように追加されたかがわかります。

![Journey Optimizer](./images/msg37.png)

クリック **保存** メッセージを保存します。

![Journey Optimizer](./images/msg55.png)

次をクリックして、メッセージダッシュボードに戻ります。 **矢印** 左上隅の件名行テキストの横に表示されます。

![Journey Optimizer](./images/msg56.png)

登録メールの作成が完了しました。 左上隅の矢印をクリックして、ジャーニーに戻ります。

![Journey Optimizer](./images/msg57.png)

「**OK**」をクリックします。

![Journey Optimizer](./images/msg57a.png)

## 2.3.3 ジャーニーの公開

ジャーニーに名前を付ける必要があります。 これをおこなうには、 **プロパティ** アイコンを使用して、画面の右上に表示されます。

![ACOP](./images/journeyname.png)

ここにジャーニーの名前を入力できます。 以下を使用してください： `yourLastName - Account Creation Journey`. 「**OK**」をクリックして変更を保存します。

![ACOP](./images/journeyname1.png)

これで、「 **公開**.

![ACOP](./images/publishjourney.png)

クリック **公開** 再び

![ACOP](./images/publish1.png)

次に、ジャーニーが公開されたことを示す緑色の確認バーが表示されます。

![ACOP](./images/published.png)

これで、この練習が完了しました。

次のステップ： [2.4 ジャーニーのテスト](./ex4.md)

[ユーザーフローに戻る 2](./uc2.md)

[すべてのモジュールに戻る](../../overview.md)