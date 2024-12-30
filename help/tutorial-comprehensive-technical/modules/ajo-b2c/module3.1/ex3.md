---
title: Journey Optimizer ジャーニーとメールメッセージの作成
description: Journey Optimizer メールメッセージの作成
kt: 5342
doc-type: tutorial
exl-id: 6807f93d-bd44-4f63-8005-6819c9f5f1ed
source-git-commit: f843c50af04d744a7d769f320b5b55a5e6d25ffd
workflow-type: tm+mt
source-wordcount: '1301'
ht-degree: 5%

---

# 3.1.3 ジャーニー、フラグメント、メッセージを作成する

この演習では、ジャーニーと、デモ web サイトでアカウントが作成されたときにトリガーする必要があるメッセージを設定します。

[Adobe Experience Cloud](https://experience.adobe.com) に移動して、Adobe Journey Optimizerにログインします。 **Journey Optimizer** をクリックします。

![ACOP](./images/acophome.png)

Journey Optimizerの **ホーム** ビューにリダイレクトされます。 最初に、正しいサンドボックスを使用していることを確認します。 使用するサンドボックスは `--aepSandboxName--` です。

![ACOP](./images/acoptriglp.png)

## 3.1.3.1 ジャーニーを作成する

左のメニューで、「**ジャーニー**」をクリックします。次に、「**ジャーニーを作成**」をクリックして、新規のジャーニーを作成します。

![ACOP](./images/createjourney.png)

すると、空のジャーニー画面が表示されます。

![ACOP](./images/journeyempty.png)

前の演習では、新しい **イベント** を作成しました。 この `--aepUserLdap--AccountCreationEvent` のように名前を付け、`ldap` を ldap に置き換えました。 イベント作成の結果：

![ACOP](./images/eventdone.png)

次に、このジャーニーをこのイベントの開始として受け取る必要があります。 これを行うには、画面の左側に移動して、イベントのリストでイベントを検索します。

![ACOP](./images/eventlist.png)

イベントを選択し、ジャーニーキャンバスにドラッグ&amp;ドロップします。 ジャーニーは次のようになります。

![ACOP](./images/journeyevent.png)

ジャーニーの 2 番目のステップとして、短い **待機** ステップを追加する必要があります。 画面の左側の **オーケストレーション** セクションに移動して、これを見つけます。 プロファイル属性を使用し、リアルタイム顧客プロファイルに入力されていることを確認する必要があります。

![ACOP](./images/journeywait.png)

ジャーニーは次のようになります。 画面の右側には、待機時間を設定する必要があります。 1 分に設定します。 これにより、イベントの発生後にプロファイル属性が使用可能になるまで、十分な時間が与えられます。 「**保存**」をクリックして変更を保存します。

![ACOP](./images/journeywait1.png)

ジャーニーの 3 番目の手順として、**メール** アクションを追加する必要があります。 画面の左側に移動して **アクション** し、**メール** アクションを選択して、ジャーニーの 2 番目のノードにドラッグ&amp;ドロップします。 これが表示されます。

![ACOP](./images/journeyactions.png)

**カテゴリ** を **マーケティング** に設定し、メールの送信を可能にするメール設定を選択します。 この場合、選択するメール設定は **メール** です。 **メールのクリック数** と **メールの開封数** のチェックボックスが両方とも有効になっていることを確認します。

![ACOP](./images/journeyactions1.png)

## 3.1.3.2 メッセージの作成

メッセージを作成するには、「**コンテンツを編集**」をクリックします。

![ACOP](./images/journeyactions2.png)

これが表示されます。

![ACOP](./images/journeyactions3.png)

**パーソナライゼーションダイアログを開く** アイコンをクリックします。

![Journey Optimizer](./images/msg5.png)

テキスト `Hi ` を書き込みます。 次に、`profile.person.name.firstName` に保存されている「名 **フィールドのパーソナライゼーショントークンを取り込む必要が** ります。 左側のメニューで、「**Person/Full Name/First Name**」フィールドを探し、「**+**」アイコンをクリックします。 テキストフィールドにパーソナライゼーショントークンが表示されます。

![Journey Optimizer](./images/msg9.png)

次に、「**, thank you for signing up!**。「**保存**」をクリックします。

![Journey Optimizer](./images/msg10.png)

これで、メールの本文の設定を開始できます。 **メール本文を編集** をクリックします。

![Journey Optimizer](./images/msg11.png)

実際のメッセージ自体のコンテンツを作成する前に、メッセージの内容について考えることをお勧めします。 メッセージ内のコンテンツには、メッセージ自体に固有のものもありますが、その他の部分は、顧客に送信するすべてのメールで同じである可能性が高い標準コンポーネントです。

前の演習では、これらの標準コンポーネントをJourney Optimizerでフラグメントとして既に作成しました。ここで、このメッセージと、今後作成する他のすべてのメッセージで参照できます。

次の画面では、メールのコンテンツを指定するための 3 つの異なる方法を選択するように求められます。

- **ゼロからデザイン**：空のキャンバスから開始し、WYSIWYG エディターを使用して、構造およびコンテンツコンポーネントをドラッグ&amp;ドロップして、メールのコンテンツを視覚的に構築します。
- **独自にコーディング**:HTMLを使用してコーディングし、独自のメールテンプレートを作成します
- **HTMLをインポート**：既存のHTMLテンプレートをインポートします。

**ゼロからデザイン** をクリックします。

![Journey Optimizer](./images/msg12.png)

左側のメニューには、メールの構造（行と列）を定義するために使用できる構造コンポーネントがあります。

![Journey Optimizer](./images/msg13.png)

また、左側のメニューには **フラグメント** があり、以前に作成したフラグメントが表示されます。

![Journey Optimizer](./images/msg14.png)

ヘッダーとフッターをキャンバスに追加する前に、メールに 2 つの構造を追加する必要があります。 左側のメニューで「**+**」アイコンをクリックし、2 **1:1 列** コンポーネントをキャンバスにドラッグします。

![Journey Optimizer](./images/msg14a.png)

左側のメニューで、**フラグメント** に戻ります。 ヘッダーフラグメントを最初のコンポーネントに、フッターフラグメントを 2 番目のコンポーネントにドラッグ&amp;ドロップします。 その後、これが表示されます。

![Journey Optimizer](./images/msg15.png)

左側のメニューで「**+**」アイコンをクリックし、さらに 2 つの **1:1 列** コンポーネントをキャンバスのヘッダーとフッターの間にドラッグ&amp;ドロップします。

![Journey Optimizer](./images/msg16.png)

**画像** コンポーネントを最初の **1:1 列** コンポーネントにドラッグ&amp;ドロップします。 **参照** をクリックします。

![Journey Optimizer](./images/msg17.png)

**citi-signal-images** フォルダー内。 画像 **`welcome_email_image.png`** を選択し、「**選択** をクリックします。

![Journey Optimizer](./images/msg28.png)

すると、次のようになります。

![Journey Optimizer](./images/msg30.png)

次に、**コンテンツ** に移動し、**テキスト** コンポーネントを 4 行目の構造コンポーネントにドラッグ&amp;ドロップします。

![Journey Optimizer](./images/msg33.png)

デフォルトのテキストを選択します **ここにテキストを入力してください。他のテキストエディターの場合と同様に** きます。 代わりに **家族へようこそ** と書いてください。 ツールバーで、「**パーソナライゼーションを追加** アイコンをクリックします。

![Journey Optimizer](./images/msg34.png)

次に、`profile.person.name.firstName` に保存されている **名** パーソナライゼーショントークンを取り込む必要があります。 メニューで、**ユーザー** 要素を見つけ、**姓名** 要素にドリルダウンし、**+** アイコンをクリックして、名フィールドを式エディターに追加します。

「**保存**」をクリックします。

![Journey Optimizer](./images/msg36.png)

これで、パーソナライゼーションフィールドがテキストにどのように追加されたかがわかります。

![Journey Optimizer](./images/msg37.png)

同じテキストフィールドで **Enter** キーを 2 回押して 2 行を追加し、次のテキストをコピーして貼り付けます。

```
Welcome aboard! We're thrilled to have you join the CitiSignal family. 
As a valued member of our community, you're now poised to experience top-notch telecommunications services that cater to your every need.

At CitiSignal, we understand that staying connected is more than just a convenience - it's a necessity. Whether you're browsing the web, streaming your favourite content, or keeping in touch with loved ones, we're here to ensure you have the best tools and resources at your fingertips.
```

![Journey Optimizer](./images/msg38.png)

**テキストの配置** を中央に配置し、メッセージのルックアンドフィールを独自のニーズに合わせて自由に調整できます。 完了したら、「**保存**」をクリックします。

![Journey Optimizer](./images/msg39.png)

最後に、メールの準備が整ったことを確認するチェックとして、プレビューし、「**コンテンツをシミュレート**」ボタンをクリックします。

![Journey Optimizer](./images/msg50.png)

メールメッセージをシミュレートする前に、テストプロファイルを追加する必要があります。 **テストプロファイルを管理** をクリックします。

![Journey Optimizer](./images/test1.png)

**ID 名前空間を入力** フィールドの横にあるアイコンをクリックして **メール** 名前空間を選択します。

ID 名前空間のリストで、「**メール**」名前空間を選択します。 「**ID 値**」フィールドに、前の演習で使用し、Adobe Experience Platformに既に保存されている以前のプロファイルのメールアドレスを入力します。 **プロファイルを追加** をクリックします。 前の画面に戻ります。

![Journey Optimizer](./images/msg53.png)

次に、この顧客プロファイル用にシミュレートされたメールメッセージが表示されます。 件名と本文のパーソナライゼーションを検証し、必要に応じて配達確認メールを送信できるようになりました。

**閉じる** をクリックして、プレビューを閉じます。

![Journey Optimizer](./images/msg54.png)

「**保存**」をクリックしてメッセージを保存し、左上隅の件名テキストの横にある **矢印** をクリックしてメッセージダッシュボードに戻ります。

![Journey Optimizer](./images/msg55.png)

**矢印** をクリックして、ジャーニーに戻ります。

![Journey Optimizer](./images/msg57a.png)

## 3.1.3.3 ジャーニーのPublish

「**保存**」をクリックします。

![Journey Optimizer](./images/msg58.png)

ジャーニーに名前を付ける必要があります。 画面の右上にある **プロパティ** アイコンをクリックすると、これを行うことができます。

![ACOP](./images/journeyname.png)

ジャーニーの名前をここに入力できます。 `--aepUserLdap-- - Registration Journey` を使用してください。 「**保存**」をクリックします。

![ACOP](./images/journeyname1.png)

これで、**Publish** をクリックしてジャーニーを公開できます。

![ACOP](./images/publishjourney.png)

もう一度 **0}Publish} をクリックします。**

![ACOP](./images/publish1.png)

数分後に、ジャーニーのステータスが **ライブ** に変わり、ジャーニーのパフォーマンスがリアルタイムでダッシュボードに表示されます。

![ACOP](./images/published.png)

これで、この演習が完了しました。

次の手順：[3.1.4 データ収集プロパティを更新し、ジャーニーをテストする ](./ex4.md)

[モジュール 3.1 に戻る](./journey-orchestration-create-account.md)

[すべてのモジュールに戻る](../../../overview.md)
