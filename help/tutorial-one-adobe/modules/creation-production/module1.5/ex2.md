---
title: Frame.io を使用した承認
description: Frame.io を使用した承認
role: Developer
level: Beginner
jira: KT-5342
doc-type: Tutorial
source-git-commit: 96711c78cecdce13e2e2fd6e5a43e0815f59e079
workflow-type: tm+mt
source-wordcount: '707'
ht-degree: 0%

---

# 1.5.2 Frame.io での承認

>[!NOTE]
>
> 次のスクリーンショットは、使用されている特定の環境を示しています。 このチュートリアルを進めていくと、環境に異なる名前が付いている可能性が非常に高くなります。 このチュートリアルに登録したときに、使用する環境の詳細が提供されました。これらの手順に従ってください。

Frame.io で承認ワークフローを実行するには、アセットが必要です。 この演習では、まず、Adobe FireflyとAdobe Expressを使用して自分でアセットを作成します。 アセットを取得したら、Frame.io にアップロードし、最終的に承認します。

## Adobe Firefly Services1.5.2.1Adobe Expressを使用したアセットの作成

[https://firefly.adobe.com/](https://firefly.adobe.com/){target="_blank"} に移動します。 プロンプト `a neon rabbit running very fast through space` を入力し、「**生成**」をクリックします。

![GSPeM](./../../workflow-planning/module1.2/images/gsasset1.png)

その後、複数の画像が生成されます。 最も気に入った画像を選択し、画像上の **共有** アイコンをクリックして、「**Adobe Expressで開く**」を選択します。

![GSPeM](./../../workflow-planning/module1.2/images/gsasset2.png)

生成した画像がAdobe Expressで編集できるようになります。 次に、画像に CitiSignal ロゴを追加する必要があります。 それには、**Brands** に移動します。

![GSPeM](./../../workflow-planning/module1.2/images/gsasset3.png)

CitiSignal ブランドテンプレートが表示されます。 GenStudio for Performance Marketingで作成されたものがAdobe Expressに表示されます。 名前に `CitiSignal` が含まれるブランドテンプレートをクリックして選択します。

![GSPeM](./../../workflow-planning/module1.2/images/gsasset4.png)

**ロゴ** に移動し、**白** Citignal ロゴをクリックして画像にドロップします。

![GSPeM](./../../workflow-planning/module1.2/images/gsasset5.png)

CitiSignal ロゴは、画像の中央からそれほど遠くない位置に配置します。

![GSPeM](./../../workflow-planning/module1.2/images/gsasset6.png)

**テキスト** に移動します。

![GSPeM](./../../workflow-planning/module1.2/images/gsasset6a.png)

「**テキストを追加**」をクリックします。

![GSPeM](./../../workflow-planning/module1.2/images/gsasset6b.png)

テキスト `Timetravel now!` を入力し、フォントカラーとフォントサイズを変更し、テキストを **太字** に設定して、これに類似した画像が表示されるようにします。

![GSPeM](./../../workflow-planning/module1.2/images/gsasset6c.png)

次に、「**共有**」をクリックします。

![GSPeM](./../../workflow-planning/module1.2/images/gsasset7.png)

「**...」をクリックします。すべて表示**.

![Frame.io](./images/frameioasset1.png)

下にスクロールして、「**ダウンロード**」を選択します。

![Frame.io](./images/frameioasset2.png)

**ダウンロード** をクリックします。

![Frame.io](./images/frameioasset3.png)

その後、ローカルマシンにアセットを作成します。

![Frame.io](./images/frameioasset4.png)

## 1.5.2.2 Frame.io でのアセットの承認

[https://next.frame.io/](https://next.frame.io/) に移動します。 環境 `--aepImsOrgName--` にログインしていることを確認します。

![Frame.io](./images/frameio1.png)

右環境にログインしていない場合は、左下隅のロゴをクリックし、をクリックして、使用する必要がある環境を選択します。

![Frame.io](./images/frameio2.png)

`--aepUserLdap--` という名前にする必要があるワークスペースに移動し、フォルダー **CitiSignal** を開きます。 **+** アイコンをクリックし、「**新規フォルダー**」を選択します。

![Frame.io](./images/frameioappr1.png)

フォルダーに「`--aepUserLdap-- - Approvals`」という名前を付けます。 フォルダーをダブルクリックして開きます。

![Frame.io](./images/frameioappr2.png)

前の演習で作成したファイルをこのフォルダーにアップロードします。 **アップロード** をクリックします。

![Frame.io](./images/frameioappr3.png)

ファイルを選択し、「**開く** をクリックします。

![Frame.io](./images/frameioappr4.png)

これで完了です。 ファイルをダブルクリックして開きます。

![Frame.io](./images/frameioappr5.png)

アイコンを有効にして、アンカーされたコメントを残します。

![Frame.io](./images/frameioappr6.png)

コメント（`Change CTA to "Get on board now!"` など）を入力します。 **送信** アイコンをクリックして、コメントを共有します。

![Frame.io](./images/frameioappr7.png)

これで完了です。 **フィールド** に移動します。

![Frame.io](./images/frameioappr8.png)

**ステータス** フィールドで、ステータスを **レビューが必要** に変更します。

![Frame.io](./images/frameioappr9.png)

これで完了です。 矢印をクリックしてフォルダーに戻ります。

![Frame.io](./images/frameioappr10.png)

3 つのドット **...** をクリックし、「**名前を変更**」を選択します。

![Frame.io](./images/frameioappr11.png)

ファイル名を `version1.png` に変更します。

![Frame.io](./images/frameioappr12.png)

## 1.5.2.3 Adobe Expressでデザインを変更する

[https://new.express.adobe.com/your-stuff/files](https://new.express.adobe.com/your-stuff/files) に移動し、前に作成した画像を再度開きます。

![WF](./../../workflow-planning/module1.2/images/wfp25a.png)

CTAのテキストを `Get On Board Now!` に変更します。

![WF](./../../workflow-planning/module1.2/images/wfp25b.png)

**共有** をクリックし、「**ダウンロード**」を選択します。

![WF](./images/frameioasset5.png)

**ダウンロード** をクリックします。

![WF](./images/frameioasset6.png)

ローカルマシンに新しい画像がダウンロードされます。 ファイル名を `version2.png` に変更します。

![WF](./images/frameioasset7.png)

## 1.5.2.4 Frame.io で version2 を承認する

Frame.io のフォルダーで「**+**」アイコンをクリックし、「**アセットをアップロード**」を選択します。

![Frame.io](./images/frameioappr13.png)

ファイル **version2.png** を選択し、「**開く**」をクリックします。

![Frame.io](./images/frameioappr14.png)

次に、ファイル **version2.png** をファイル **version1.png** の上にドラッグします。 このアクションは、Frame.io でのバージョンのスタックを有効にします。

![Frame.io](./images/frameioappr15.png)

この画像が表示されます。

![Frame.io](./images/frameioappr16.png)

画像の 3 ドット **...** をクリックし、「**バージョンを比較**」を選択します。

![Frame.io](./images/frameioappr17.png)

ファイルの両方のバージョンを表示するこの比較ビューが表示されます。 **フィールド** に移動します。

![Frame.io](./images/frameioappr18.png)

フィールド **ステータス** を **承認済み** に変更します。

![Frame.io](./images/frameioappr19.png)

これで完了です。 矢印アイコンをクリックして、フォルダービューに戻ります。

![Frame.io](./images/frameioappr20.png)

3 つのドット **...** をクリックし、このファイルを別のアプリケーションで使用する場合は「**ダウンロード**」を選択します。

![Frame.io](./images/frameioappr21.png)

## 次の手順

[1.5.3 Frame.io とPremiere Pro](./ex3.md){target="_blank"}

[Frame.io によるワークフローの効率化 ](./frameio.md){target="_blank"} に戻る

[ すべてのモジュール ](./../../../overview.md){target="_blank"} に戻る
