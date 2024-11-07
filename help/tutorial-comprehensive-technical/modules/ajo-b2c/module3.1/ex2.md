---
title: Journey Optimizer ジャーニーとメールメッセージの作成
description: Journey Optimizer メールメッセージの作成
kt: 5342
doc-type: tutorial
source-git-commit: 2cdc145d7f3933ec593db4e6f67b60961a674405
workflow-type: tm+mt
source-wordcount: '1413'
ht-degree: 6%

---

# 3.1.2 ジャーニーとメールメッセージの作成

この演習では、ジャーニーと、デモ web サイトでアカウントが作成されたときにトリガーする必要があるメッセージを設定します。

[Adobe Experience Cloud](https://experience.adobe.com) に移動して、Adobe Journey Optimizerにログインします。 **Journey Optimizer** をクリックします。

![ACOP](./images/acophome.png)

Journey Optimizerの **ホーム** ビューにリダイレクトされます。 最初に、正しいサンドボックスを使用していることを確認します。 使用するサンドボックスは `--aepSandboxId--` です。 サンドボックスを切り替えるには、「**実稼動製品（VA7）」をクリックし** リストからサンドボックスを選択します。 この例では、サンドボックスの名前は **AEP イネーブルメント FY22** です。 その後、サンドボックス `--aepSandboxId--` ージの **ホーム** ビューに移動します。

![ACOP](./images/acoptriglp.png)

## 3.1.2.1 ジャーニーの作成

左のメニューで、「**ジャーニー**」をクリックします。次に、「**ジャーニーを作成**」をクリックして、新規のジャーニーを作成します。

![ACOP](./images/createjourney.png)

すると、空のジャーニー画面が表示されます。

![ACOP](./images/journeyempty.png)

前の演習では、新しい **イベント** を作成しました。 この `ldapAccountCreationEvent` のように名前を付け、`ldap` を ldap に置き換えました。 イベント作成の結果：

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

## 3.1.2.2 メッセージの作成

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

- **ゼロからデザイン**：空のキャンバスから開始し、WYSIWYG エディターを使用して、構造およびコンテンツコンポーネントをドラッグ&amp;ドロップして、メールのコンテンツを視覚的に構築します。
- **独自にコーディング**:HTMLを使用してコーディングし、独自のメールテンプレートを作成します
- **HTMLをインポート**：既存のHTMLテンプレートをインポートします。

**ゼロからデザイン** をクリックします。

![Journey Optimizer](./images/msg12.png)

左側のメニューには、メールの構造（行と列）を定義するために使用できる構造コンポーネントがあります。

![Journey Optimizer](./images/msg13.png)

メニューからキャンバスに **1:2 列 Left** をドラッグ&amp;ドロップします。 これがロゴ画像のプレースホルダーになります。

![Journey Optimizer](./images/msg14.png)

前のコンポーネントの下にある **1:1** 列をドラッグ&amp;ドロップします。 これがバナーブロックになります。

![Journey Optimizer](./images/msg15.png)

前のコンポーネントの下の **1:2 列** 左）をドラッグ&amp;ドロップします。 これは、画像が左側に、テキストが右側に表示される実際のコンテンツになります。

![Journey Optimizer](./images/msg16.png)

次に、前のコンポーネントの下にある **1:1** 列をドラッグ&amp;ドロップします。 これはメールのフッターになります。 キャンバスは次のようになります。

![Journey Optimizer](./images/msg17.png)

次に、コンテンツコンポーネントを使用して、これらのブロック内にコンテンツを追加します。 **コンテンツコンポーネント** メニュー項目をクリックします

![Journey Optimizer](./images/msg18.png)

**画像** コンポーネントを最初の行の最初のセルにドラッグ&amp;ドロップします。 **参照** をクリックします。

![Journey Optimizer](./images/msg19.png)

その後、これが表示されます。 フォルダー **enablement-assets** に移動し、**luma-logo.png** ファイルを選択します。 「**選択**」をクリックします。

![Journey Optimizer](./images/msg21.png)

ただいま戻りました：

![Journey Optimizer](./images/msg25.png)

**コンテンツコンポーネント** に移動し、**画像** コンポーネントを最初の行の最初のセルにドラッグ&amp;ドロップします。 **参照** をクリックします。

![Journey Optimizer](./images/msg26.png)

**Assets** ポップアップで、**enablement-assets** フォルダーに移動します。 このフォルダーには、クリエイティブチームが以前に準備およびアップロードしたすべてのアセットが表示されます。 「**module23-thankyou-new.png**」を選択し、「**選択**」をクリックします。

![Journey Optimizer](./images/msg28.png)

すると、次のようになります。

![Journey Optimizer](./images/msg30.png)

画像を選択し、右側のメニューで、**サイズ** 幅スライダーコンポーネントが表示されるまで下にスクロールします。 スライダを使用して幅を f.i に変更します。**60%**。

![Journey Optimizer](./images/msg31.png)

次に、**コンテンツコンポーネント** に移動し、**テキスト** コンポーネントを 4 行目の構造コンポーネントにドラッグ&amp;ドロップします。

![Journey Optimizer](./images/msg33.png)

デフォルトのテキストを選択します **ここにテキストを入力してください。他のテキストエディターの場合と同様に** きます。 代わりに **様** と書いてください。 テキストモードの場合は、テキストツールバーが表示されます。

![Journey Optimizer](./images/msg34.png)

ツールバーで、「**パーソナライゼーションを追加** アイコンをクリックします。

![Journey Optimizer](./images/msg35.png)

次に、`profile.person.name.firstName` に保存されている **名** パーソナライゼーショントークンを取り込む必要があります。 メニューで、**ユーザー** 要素を見つけ、**姓名** 要素にドリルダウンし、**+** アイコンをクリックして、名フィールドを式エディターに追加します。

「**保存**」をクリックします。

![Journey Optimizer](./images/msg36.png)

これで、パーソナライゼーションフィールドがテキストにどのように追加されたかがわかります。

![Journey Optimizer](./images/msg37.png)

同じテキストフィールドで、**Enter** を 2 回押して、2 行を追加し、**Luma でアカウントを作成してくれてありがとう！** と書きます。

![Journey Optimizer](./images/msg38.png)

最後に、メールの準備が整ったことを確認するチェックとして、プレビューし、「**コンテンツをシミュレート**」ボタンをクリックします。

![Journey Optimizer](./images/msg50.png)

まず、プレビューに使用するプロファイルを特定します。 **ID 名前空間を入力** フィールドの横にあるアイコンをクリックして **メール** 名前空間を選択します。

ID 名前空間のリストで、「**メール**」名前空間を選択します。

**ID 値** フィールドに、リアルタイム顧客プロファイルに既に保存されている以前のデモプロファイルのメールアドレスを入力します。 例えば、**woutervangeluwe+06022022-01@gmail.com** で、「**テストプロファイルを検索**」ボタンをクリックします

![Journey Optimizer](./images/msg53.png)

プロファイルがテーブルに表示されたら、「**プレビュー**」タブをクリックして、プレビュー画面にアクセスします。

プレビューの準備が整ったら、件名行でパーソナライゼーションが正しいことを検証します。購読解除リンクと共に、本文テキストがハイパーリンクとしてハイライト表示されます。

**閉じる** をクリックして、プレビューを閉じます。

![Journey Optimizer](./images/msg54.png)

「**保存**」をクリックして、メッセージを保存します。

![Journey Optimizer](./images/msg55.png)

メッセージダッシュボードに戻るには、左上隅の件名テキストの横にある **矢印** をクリックします。

![Journey Optimizer](./images/msg56.png)

登録メールの作成が完了しました。 左上隅の矢印をクリックして、ジャーニーに戻ります。

![Journey Optimizer](./images/msg57.png)

「**OK**」をクリックします。

![Journey Optimizer](./images/msg57a.png)

## 3.1.2.3 ジャーニーのPublish

ジャーニーに名前を付ける必要があります。 画面の右上にある **プロパティ** アイコンをクリックすると、これを行うことができます。

![ACOP](./images/journeyname.png)

ジャーニーの名前をここに入力できます。 `--demoProfileLdap-- - Account Creation Journey` を使用してください。 「**OK**」をクリックして変更を保存します。

![ACOP](./images/journeyname1.png)

これで、**Publish** をクリックしてジャーニーを公開できます。

![ACOP](./images/publishjourney.png)

もう一度 **0}Publish} をクリックします。**

![ACOP](./images/publish1.png)

その後、ジャーニーが公開済みになったことを示す緑色の確認バーが表示されます。

![ACOP](./images/published.png)

これで、この演習が完了しました。

次の手順：[3.1.3 データ収集プロパティを更新し、ジャーニーをテストする ](./ex3.md)

[モジュール 3.1 に戻る](./journey-orchestration-create-account.md)

[すべてのモジュールに戻る](../../../overview.md)
