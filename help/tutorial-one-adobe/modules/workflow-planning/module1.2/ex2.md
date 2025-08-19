---
title: Workfrontでのプルーフ
description: Workfrontでのプルーフ
kt: 5342
doc-type: tutorial
exl-id: 5feb9486-bdb4-4d59-941c-09fc2e38163b
source-git-commit: 917ebcd2dd5d8316413a183bd2c1a048c090428c
workflow-type: tm+mt
source-wordcount: '1613'
ht-degree: 0%

---

# 1.2.2 Workfrontでのプルーフ

>[!IMPORTANT]
>
>以前にAEM CS プログラムをAEM Assets CS 環境で設定している場合は、AEM CS サンドボックスが休止状態になっている可能性があります。 このようなサンドボックスの休止解除には 10～15 分かかるので、後で待つ必要がないように、今すぐ休止解除プロセスを開始することをお勧めします。

## 新 1.2.2.1 い承認フローを作成するには

**Adobe Workfront** に戻ります。 **メニュー** アイコンをクリックし、「**プルーフ**」を選択します。

![WF](./images/wfp1.png)

**ワークフロー** に移動し、「**+新規」をクリックしてから** 「新規テンプレート **を選択し** す。

![WF](./images/wfp2.png)

**テンプレート名** を `--aepUserLdap-- - Approval Workflow` に設定し、**テンプレート所有者** を自分に設定します。

![WF](./images/wfp3.png)

下にスクロールして、**ステージ**/**ステージ 1** で、**プルーフ作成者** の役割を **レビュアーおよび承認者** に変更します。 他のユーザーを追加することもできます。例えば、ユーザーを選択して自分を追加し、**レビュアーおよび承認者** の **役割** を設定します。

「**作成**」をクリックします。

![WF](./images/wfp4.png)

これで、基本承認ワークフローを使用する準備が整いました。

![WF](./images/wfp5.png)

## 1.2.2.2 Workfront ブループリントを有効にする

次の手順では、テンプレートを使用して新しいプロジェクトを作成します。 Adobe Workfrontには、アクティブ化するだけの使用可能なブループリントが多数用意されています。

CitiSignal のユースケースでは、ブループリント **統合されたキャンペーン実行** を使用する必要があります。

そのブループリントをインストールするには、メニューを開いて **ブループリント** を選択します。

![WF](./images/blueprint1.png)

フィルター **マーケティング** を選択し、下にスクロールしてブループリント **統合キャンペーン実行** を見つけます。 **インストール** をクリックします。

![WF](./images/blueprint2.png)

「**続行**」をクリックします。

![WF](./images/blueprint3.png)

「**現状のままインストール…**」をクリックします。

![WF](./images/blueprint4.png)

この画像が表示されます。 インストールには数分かかることがあります。

![WF](./images/blueprint5.png)

数分後、ブループリントがインストールされます。

![WF](./images/blueprint6.png)

## 新 1.2.2.3 いプロジェクトを作成するには

**メニュー** を開き、**プログラム** に移動します。

![WF](./images/wfp6a.png)

前に作成したプログラムをクリックします。名前は `--aepUserLdap-- CitiSignal Fiber Launch` です。

>[!NOTE]
>
>作成および実行した自動処理を使用して、[Workfront計画 ](./../module1.1/ex1.md) の演習の一部としてプログラムを作成しました。 まだその手順を実行していない場合は、手順を参照してください。

![WF](./images/wfp6b.png)

プログラムで、「**プロジェクト**」に移動します。 「**+新規プロジェクト**」をクリックし、「**テンプレートから新規プロジェクト**」を選択します。

![WF](./images/wfp6.png)

テンプレート **統合キャンペーン実行** を選択し、「**テンプレートを使用**」をクリックします。

![WF](./images/wfp6g.png)

この画像が表示されます。 名前を `--aepUserLdap-- - CitiSignal Fiber Launch Winter 2026` に変更し、「**プロジェクトを作成** をクリックします。

![WF](./images/wfp6c.png)

これで、プロジェクトが作成されました。 **プロジェクト詳細** に移動します。

![WF](./images/wfp6h.png)

**プロジェクト詳細** に移動します。 **説明** の下の現在のテキストをクリックして選択します。

![WF](./images/wfp6d.png)

説明を `The CitiSignal Fiber Launch project is used to plan the upcoming launch of CitiSignal Fiber.` に設定

「**変更を保存**」をクリックします。

![WF](./images/wfp6e.png)

これで、プロジェクトを使用する準備が整いました。

![WF](./images/wfp7.png)

選択し、として設定したテンプレートに基づいて、プロジェクトのタスクと依存関係が作成されます。 プロジェクトの所有者。 プロジェクトのステータスが「**計画中** に設定されました。 リストで別の値を選択して、プロジェクトのステータスを変更できます。

![WF](./images/wfp7z.png)

## 新規タスクを作成 1.2.2.4 るには

タスク **デザインテンプレートの作成を開始** の上にマウスポインターを置き、3 つのドット **...** をクリックしてください。

![WF](./images/wfp7a.png)

オプション **下にタスクを挿入** を選択します。

![WF](./images/wfp7x.png)

タスクの名前 `Create layout using approved assets and copy` を入力します。

フィールド **Assignments** をロール **Designer** に設定します。
フィールド **期間** を **5 日** に設定します。
フィールドの先行タスクを **9** に設定します。
フィールドに「開始日 **および「期限** を入力 **し** す。

画面内の別の場所をクリックして、新しいタスクを保存します。

![WF](./images/wfp8.png)

この画像が表示されます。 タスクをクリックして開きます。

![WF](./images/wfp9.png)

**タスクの詳細** に移動し、フィールド **説明** を `This task is used to track the progress of the creation of the assets for the CitiSignal Fiber Launch Campaign.` に設定します。

「**変更を保存**」をクリックします。

![WF](./images/wfp9a.png)

この画像が表示されます。 「**プロジェクト**」フィールドをクリックして、プロジェクトに戻ります。

![WF](./images/wfp9b.png)

**プロジェクト** ビューで、「**ワークロードバランサー**」に移動します。

![WF](./images/wfpwlb1.png)

**一括割り当て** をクリックします。

![WF](./images/wfpwlb2.png)

**2&rbrace;Designer** の「役割の割り当て **を選択し、フィールド** 割り当てるユーザー **をクリックします。** Workfront インスタンスで **0&rbrace;Designer&rbrace; のロールを持つすべてのユーザーが表示されます。**&#x200B;この場合は、架空のユーザー **Melissa Jenkins** を選択します。

![WF](./images/wfpwlb3.png)

**割り当て** をクリックします。 選択したユーザーは、**Designer** の役割にリンクされているプロジェクト内のタスクに割り当てられます。

![WF](./images/wfpwlb4.png)

これでタスクが割り当てられました。 「**タスク**」をクリックして、**タスク** の概要ページに戻ります。

![WF](./images/wfpwlb5.png)

作成したタスク（という名前）をクリックします
**承認済みアセットを使用してレイアウトを作成し、コピー** します。

![WF](./images/wfpwlb6.png)

次に、この演習の一部として、このタスクの作業を開始します。 現在、このタスクに Melissa Jenkins が割り当てられていることがわかります。 これを自分用に変更するには、「**割り当て**」フィールドをクリックし、「**自分に割り当て**」を選択します。

![WF](./images/wfpwlb7.png)

「**保存**」をクリックします。

![WF](./images/wfpwlb8.png)

**作業** をクリックします。

![WF](./images/wfpwlb9.png)

この画像が表示されます。

![WF](./images/wfpwlb10.png)

このタスクの一環として、新しい画像を作成し、Workfrontにドキュメントとしてアップロードする必要があります。 次に、Adobe Expressを使用して自分でそのアセットを作成します。

## Adobe Firefly Services1.2.2.5Adobe Expressを使用したアセットの作成

[https://firefly.adobe.com/](https://firefly.adobe.com/){target="_blank"} に移動します。 プロンプト `a neon rabbit running very fast through space` を入力し、「**生成**」をクリックします。

![GSPeM](./images/gsasset1.png)

その後、複数の画像が生成されます。 最も気に入った画像を選択し、画像上の **共有** アイコンをクリックして、「**Adobe Expressで開く**」を選択します。

![GSPeM](./images/gsasset2.png)

生成した画像がAdobe Expressで編集できるようになります。 次に、画像に CitiSignal ロゴを追加する必要があります。 それには、**Brands** に移動します。

![GSPeM](./images/gsasset3.png)

CitiSignal ブランドテンプレートが表示されます。 GenStudio for Performance Marketingで作成されたものがAdobe Expressに表示されます。 名前に `CitiSignal` が含まれるブランドテンプレートをクリックして選択します。

![GSPeM](./images/gsasset4.png)

**ロゴ** に移動し、**白** Citignal ロゴをクリックして画像にドロップします。

![GSPeM](./images/gsasset5.png)

CitiSignal ロゴは、画像の中央からそれほど遠くない位置に配置します。

![GSPeM](./images/gsasset6.png)

**テキスト** に移動します。

![GSPeM](./images/gsasset6a.png)

「**テキストを追加**」をクリックします。

![GSPeM](./images/gsasset6b.png)

テキスト `Timetravel now!` を入力し、フォントカラーとフォントサイズを変更し、テキストを **太字** に設定して、これに類似した画像が表示されるようにします。

![GSPeM](./images/gsasset6c.png)

次に、「**共有**」をクリックします。

![GSPeM](./images/gsasset7.png)

「**AEM Assets**」を選択します。

![GSPeM](./images/gsasset8.png)

ファイル名を `CitiSignal - Neon Rabbit - Timetravel now!` に変更します。
**フォルダーを選択** をクリックします。

![GSPeM](./images/gsasset9.png)

AEM Assets CS リポジトリ（`--aepUserLdap-- - CitiSignal` という名前）を選択し、フォルダー `--aepUserLdap-- - CitiSignal Fiber Campaign` を選択します。 「**選択**」をクリックします。

![GSPeM](./images/gsasset11.png)

この画像が表示されます。 **1 個のアセットをアップロード** をクリックします。 これで、画像がAEM Assets CS にアップロードされます。

![GSPeM](./images/gsasset12.png)

## タスク 1.2.2.6 新規ドキュメントを追加し、承認フローを開始するには

**タスクの詳細** 画面に戻ります。 **ドキュメント** に移動します。 「**+新規追加」をクリックし** AEM Assets CS リポジトリを選択します。このリポジトリには `--aepUserLdap-- - CitiSignal` という名前を付ける必要があります。

![WF](./images/wfp10.png)

ダブルクリックして、フォルダー `--aepUserLdap-- CitiSignal Fiber Campaign` を開きます。

![WF](./images/wfp10a.png)

前の手順で作成したファイル（「CitiSignal - Neon rabbit - Timetravel Now **という名前）を選択します。png**. 「**選択**」をクリックします。

![WF](./images/2048x2048.png){width="50px" align="left"}

これで完了です。 アップロードしたドキュメントにポインタを合わせます。 「**プルーフを作成**」をクリックして、「**詳細プルーフ**」を選択します。

![WF](./images/wfp13.png)

**新しいプルーフ** ウィンドウで、「**自動** を選択したあと、以前に作成したワークフローテンプレートを選択します。このテンプレートには、`--aepUserLdap-- - Approval Workflow` という名前を付ける必要があります。 **プルーフを作成** をクリックします。

![WF](./images/wfp14.png)

**プルーフを開く**」をクリックします

![WF](./images/wfp18.png)

これで、プルーフを確認できます。 「**コメントを追加**」を選択して、ドキュメントの変更を必要とするコメントを追加します。

![WF](./images/wfp19.png)

コメントを入力し、「**投稿**」をクリックします。 次に、「**決定する** をクリックします。

![WF](./images/wfp20.png)

「**変更が必要です**」を選択し、「**決定を下す**」をクリックします。

![WF](./images/wfp24.png)

**タスク** と **ドキュメント** に戻ります。 「**変更が必要**」というテキストも表示されます。

![WF](./images/wfp25.png)

次に、Adobe Expressで行うデザインの変更を行う必要があります。

## 1.2.2.7 Adobe Expressでデザインを変更する

[https://new.express.adobe.com/your-stuff/files](https://new.express.adobe.com/your-stuff/files) に移動し、前に作成した画像を再度開きます。

![WF](./images/wfp25a.png)

CTAのテキストを `Get On Board Now!` に変更します。

![WF](./images/wfp25b.png)

「**共有**」をクリックし、「**AEM Assets**」を選択します。

![WF](./images/wfp25c.png)

`CitiSignal - Neon Rabbit - Get On Board Now!` という名前を入力し、**フォルダーを選択** をクリックして宛先フォルダーを選択します。

![WF](./images/wfp25d.png)

AEM Assets CS リポジトリ（`--aepUserLdap-- - CitiSignal` という名前）を選択し、フォルダー `--aepUserLdap-- - CitiSignal Fiber Campaign` を選択します。 「**選択**」をクリックします。

![WF](./images/wfp25e.png)

**1 個のアセットをアップロード** をクリックします。

![WF](./images/wfp25f.png)

これで、新しいアセットが作成され、AEM Assetsに保存されました。

## 1.2.2.8 ドキュメントの新しいバージョンをタスクに追加

Adobe Workfrontのタスクビューで、承認されなかった古い画像ファイルを選択します。 次に、「**+新規追加**」をクリックし、「**バージョン**」を選択してから、`--aepUserLdap-- - CitiSignal` という名前が付くAEM Assets CS リポジトリを選択します。

![WF](./images/wfp26.png)

フォルダー `--aepUserLdap-- CitiSignal Fiber Campaign` に移動し、ファイル `CitiSignal - Neon Rabit - Get On Board Now!.png` を選択します。 「**選択**」をクリックします。

![WF](./images/wfp26a.png)

これで完了です。 **プルーフを作成** をクリックし、もう一度 **詳細プルーフ** を選択します。

![WF](./images/wfp28.png)

その後、これが表示されます。 Workfrontが以前の承認ワークフローがまだ有効であると想定するので、**ワークフローテンプレート** が事前に選択されるようになりました。 **プルーフを作成** をクリックします。

![WF](./images/wfp29.png)

**プルーフを開く** を選択します。

![WF](./images/wfp30.png)

ファイルの 2 つのバージョンが各ホストの横に表示されるようになりました。 「**配達確認を比較** ボタンをクリックします。

![WF](./images/wfp31.png)

その後、それぞれの横に両方のバージョンの画像が表示されます。 **決定する** をクリックします。

![WF](./images/wfp32.png)

**承認済み** を選択し、もう一度 **決定する** をクリックします。

![WF](./images/wfp32a.png)

左側のバージョンの画像を閉じて、**プルーフを比較** ビューを閉じます。 **タスク名** をクリックして、タスクの概要に戻ります。

![WF](./images/wfp33.png)

その後、承認済みアセットを使用して、タスクビューに戻ります。 次に、このアセットをAEM Assetsに対して共有する必要があります。

![WF](./images/wfp34.png)

承認済みドキュメントを選択します。 **矢印を共有** アイコンをクリックし、AEM Assets統合を選択します。これは、`--aepUserLdap-- - CitiSignal AEM` という名前にする必要があります。

![WF](./images/wfp35.png)

前に作成したフォルダーをダブルクリックします。フォルダーの名前は `--aepUserLdap-- - CitiSignal Fiber Launch Assets` にする必要があります。

![WF](./images/wfp36.png)

**フォルダーを選択** をクリックします。

![WF](./images/wfp37.png)

1～2 分後に、ドキュメントがAEM Assetsに公開されます。 ドキュメント名の横に「AEM」アイコンが表示されます。

![WF](./images/wfp37a.png)

「**完了としてマーク**」をクリックして、このタスクを終了します。

![WF](./images/wfp37b.png)

この画像が表示されます。

![WF](./images/wfp37c.png)

## 1.2.2.9 AEM Assetsでファイルを表示

AEM Assets CS の `--aepUserLdap-- - CitiSignal Fiber Launch Assets` という名前のフォルダーに移動します。

![WF](./images/wfppaem1.png)

画像を選択し、「**詳細**」を選択します。

![WF](./images/wfppaem2.png)

その後、WorkfrontとAEM Assetsの統合によって値が自動的に入力された、前に作成したメタデータフォームが表示されます。

![WF](./images/wfppaem3.png)

[Adobe Workfrontによるワークフロー管理 ](./workfront.md){target="_blank"} に戻る

[ すべてのモジュールに戻る ](./../../../overview.md){target="_blank"}
