---
title: Workfrontの計画の概要
description: Workfrontの計画の概要
kt: 5342
doc-type: tutorial
exl-id: 26fa872b-c872-46b6-8f56-fa41696100da
source-git-commit: 645d078b55b7126a692dedded71208e1f3c04971
workflow-type: tm+mt
source-wordcount: '1098'
ht-degree: 2%

---

# 1.1.1 Workfrontの計画の概要

## 1.1.1.1 Workfront Planning の用語

Workfront Planning の主なオブジェクトと概念を次に示します。

| 用語 | 説明 |
| --- | ---|
| **Workspace** | 特定の組織の運用ライフサイクルを定義するレコードタイプのコレクション。 ワークスペースは、組織単位の作業フレームです。 |
| **レコードタイプ** | Workfront Planning のオブジェクト・タイプの名前。 レコードタイプがワークスペースに入力します。 オブジェクトタイプが事前定義されているWorkfront Workflow とは異なり、Workfront Planning では独自のオブジェクトタイプを作成できます。 |
| **レコード** | レコードタイプのインスタンス。 |
| **Workspace テンプレート** | 定義済みのテンプレートを使用してワークスペースを作成できます。 テンプレートに含まれる事前定義済みのレコードタイプとフィールドを使用することも、独自のレコードタイプとフィールドを追加することもできます。 |
| **フィールド** | フィールドは、レコードタイプに追加できる属性です。 フィールドには、レコードタイプに関する情報が含まれます。 |

>[!NOTE]
>
>作成できるWorkfront Planning オブジェクトの数には制限があります。 詳しくは、Adobe Workfront Planning オブジェクトの制限事項の概要を参照してください。

次に、実践的に、これらのオブジェクトのいくつかを自分で作成し始めます。

## Workspace1.1.1.2、レコードタイプ、フィールド

[https://experience.adobe.com/](https://experience.adobe.com/){target="_blank"} に移動します。 クリックして **Workfront** を開きます。

![Workfront計画 ](./images/wfpl1.png)

Workfrontで、をクリックしてメニューを開き、「**計画**」を選択します。

![Workfront計画 ](./images/wfpl2.png)

この画像が表示されます。 **Workspaceを作成** をクリックします。

![Workfront計画 ](./images/wfpl3.png)

**基本マーケティング管理** テンプレートの「**tempmate を使用**」をクリックします。

![Workfront計画 ](./images/wfpl4.png)

これで、新しいワークスペースが作成されました。 続行する前に、ワークスペースの名前を変更する必要があります。 3 つのドット **...** をクリックし、「**編集**」を選択します。

![Workfront計画 ](./images/wfpl5.png)

名前を `--aepUserLdap-- - Basic: Marketing Management` に変更します。 「**保存**」をクリックします。

![Workfront計画 ](./images/wfpl6.png)

これで完了です。

![Workfront計画 ](./images/wfpl7a.png)

## 1.1.1.3 分類：レコードタイプとフィールド

「**分類**」で、「**+ レコードタイプを追加」をクリックし** 「**手動で追加**」を選択します。

![Workfront計画 ](./images/wfpl7.png)

**レコードタイプを追加** ポップアップが表示されます。

![Workfront計画 ](./images/wfpl8.png)

「**外観** タブの次の情報を更新します。

- **名称未設定のレコードタイプ** を `Business Unit` に置き換えます。
- 説明：`Defines which BU is leading campaign planning.`。
- 選択したアイコンの色と形状を選択します

「**保存**」をクリックします。

![Workfront計画 ](./images/wfpl9.png)

クリックして、新しく作成した **事業部門** レコードタイプを開きます。

![Workfront計画 ](./images/wfpl10.png)

新しく作成されたレコードタイプにはフィールドがまだ定義されていないので、空のテーブルビューが表示されます。

![Workfront計画 ](./images/wfpl11.png)

フィールド **開始日** のドロップダウンボタンをクリックし、「**削除** を選択します。

![Workfront計画 ](./images/wfpl12.png)

「**削除**」を選択します。

![Workfront計画 ](./images/wfpl13.png)

フィールド **終了日** のドロップダウンボタンをクリックし、「**削除** を選択します。

![Workfront計画 ](./images/wfpl14.png)

「**削除**」を選択します。

![Workfront計画 ](./images/wfpl15.png)

次に、**+** アイコンをクリックして、新しいフィールドを追加します。 使用可能なフィールドタイプのリストを下にスクロールし、「**人物**」を選択します。

![Workfront計画 ](./images/wfpl16.png)

フィールドの **名前** を `Business Unit Lead` に、フィールドの説明を `Business Unit Lead responsible for budget and resources (VP, Head).` に設定します

「**保存**」をクリックします。

![Workfront計画 ](./images/wfpl17.png)

新しいレコードタイプを作成し、フィールドを削除および作成しました。 左上隅の矢印をクリックして、Workspaceの概要画面に戻ります。

![Workfront計画 ](./images/wfpl18.png)

この画像が表示されます。

![Workfront計画 ](./images/wfpl19.png)

## 1.1.1.4 運用中のレコードタイプ：フィールド

クリックして **キャンペーン** を開きます。

![Workfront計画 ](./images/wfpl20.png)

**+** アイコンをクリックして、新しいフィールドを作成します。 **新しい接続** を選択してから、「**ペルソナ** を選択します。

![Workfront計画 ](./images/wfpl21.png)

デフォルト設定はそのままにしておきます。 「**作成**」をクリックします。

![Workfront計画 ](./images/wfpl22.png)

**スキップ** を選択します。

![Workfront計画 ](./images/wfpl23.png)

新しいフィールドがテーブル表示に表示されます。

![Workfront計画 ](./images/wfpl24.png)

## リクエストフォームを作成 1.1.1.5 るには

Campaigns の概要画面で、「。..**」の 3 つのドット** クリックし、「**リクエストフォームを作成**」を選択します。

![Workfront計画 ](./images/wfpl25.png)

名前を `Campaign Request Form` に変更します。 「**保存**」をクリックします。

![Workfront計画 ](./images/wfpl26.png)

現時点では、フォームに変更を加える必要はありません。 あなたはそれを変更せずに使うでしょう。 最初に **保存** をクリックしてから、**公開** をクリックします。

![Workfront計画 ](./images/wfpl27.png)

左上隅の矢印をクリックして、Formsをリクエストの概要画面に戻ります。

![Workfront計画 ](./images/wfpl28.png)

左上隅の矢印をクリックして、キャンペーンの概要画面に戻ります。

![Workfront計画 ](./images/wfpl29.png)

## リクエストフォームを使用して新しいレコードを送信で 1.1.1.6 ない

キャンペーンの概要画面で、「**+新しいレコード**」をクリックします。

![Workfront計画 ](./images/wfpl31.png)

**リクエストを送信** を選択し、「**続行**」をクリックします。

![Workfront計画 ](./images/wfpl32.png)

**件名** を `--aepUserLdap-- - New Campaign Creation Request` に設定します。

**キャンペーン名** を `--aepUserLdap-- - CitiSignal Fiber Launch` に設定します。

**キャンペーンの概要** を次のように設定します。

```
The CitiSignal Fiber Launch campaign introduces CitiSignal’s flagship fiber internet service—CitiSignal Fiber Max—to key residential markets. This campaign is designed to build awareness, drive sign-ups, and establish CitiSignal as the go-to provider for ultra-fast, reliable, and future-ready internet. The campaign will highlight the product’s benefits for remote professionals, online gamers, and smart home families, using persona-driven messaging across digital and physical channels.
```

**リクエストを送信** をクリックします。

![Workfront計画 ](./images/wfpl33.png)

**X** をクリックして、ポップアップを閉じます。

![Workfront計画 ](./images/wfpl34.png)

すると、新しく作成されたキャンペーンが概要に表示されます。

![Workfront計画 ](./images/wfpl35.png)

## 1.1.1.7 Portfolioとカスタムフォームの作成

次の手順では、Workfront Planning で作成したキャンペーンから情報を取得し、その情報をWorkfrontで使用してプログラムを作成する自動処理を作成します。 自動処理を作成する前に、Workfrontでまず設定すべき 2 つの事項、すなわちポートフォリオとカスタムフォームがあります。

ポートフォリオを作成するには、メニューを開いて「**ポートフォリオ**」をクリックします。

![Workfront計画 ](./images/wfplss1.png)

「**+ New Portfolio**」をクリックします。

![Workfront計画 ](./images/wfplss2.png)

ポートフォリオの名前を `--aepUserLdap-- - Marketing` に設定します。

![Workfront計画 ](./images/wfplss3.png)

次に、メニューを開いて **設定** をクリックし、カスタムフォームを作成します。

![Workfront計画 ](./images/wfplss4.png)

左側のメニューで、**カスタムForms**/**Forms** に移動し、「**+新規カスタムフォーム**」をクリックします。

![Workfront計画 ](./images/wfplss5.png)

**プログラム** を選択し、「**続行**」をクリックします。

![Workfront計画 ](./images/wfplss6.png)

フォームの名前を `--aepUserLdap-- - Program Information` に変更します。

![Workfront計画 ](./images/wfplss7.png)

次に、**フィールドライブラリ** に移動し、`budget` を検索します。 既存のフィールド **予算** をフォームにドラッグ&amp;ドロップします。

「**適用**」をクリックします。

![Workfront計画 ](./images/wfplss8.png)

これで、カスタムフォーム設定が保存されました。

![Workfront計画 ](./images/wfplss9.png)

## 自動処理 1.1.1.8 作成するには

ポートフォリオとカスタムフォームを作成したら、自動処理を作成できます。

クリックしてメニューを開き、「**計画**」を選択します。

![Workfront計画 ](./images/wfpl36.png)

クリックすると、前に作成したワークスペース（`--aepUserLdap-- - Basic: Marketing Management`）が開きます。

![Workfront計画 ](./images/wfpl37.png)

クリックして **キャンペーン** を開きます。

![Workfront計画 ](./images/wfpl38.png)

Campaigns の概要画面で、「。..**」の 3 つのドットをクリックし**、「**自動化を管理**」を選択します。

![Workfront計画 ](./images/wfpl40.png)

**新しい自動処理** をクリックします。

![Workfront計画 ](./images/wfpl41.png)

オートメーションの名前を `Campaign to Program` に設定します。

説明を `This automation will convert a Planning Campaign record to a Workfront Program.` に設定

「**保存**」をクリックします。

![Workfront計画 ](./images/wfpl42.png)

**アクション** を **プログラムを作成** に設定します。 「**+接続フィールドを追加**」をクリックします。

![Workfront計画 ](./images/wfpl43.png)

**プログラムポートフォリオ**: `--aepUserLdap-- - Marketing` を選択します。

**カスタムフォーム**: `--aepUserLdap-- Program information` を選択します。

「**保存**」をクリックします。

![Workfront計画 ](./images/wfpl44.png)

この画像が表示されます。 矢印をクリックして、キャンペーンの概要画面に戻ります。

![Workfront計画 ](./images/wfpl45.png)

前に作成したキャンペーンの前にあるチェックボックスをオンにします。 次に、「**プログラムにキャンペーン**」自動処理をクリックします。

![Workfront計画 ](./images/wfpl46.png)

数秒後、自動化が正常に終了したことを示す確認が表示されます。 つまり、Workfront計画のキャンペーンオブジェクトに基づいて、Workfrontでプログラムが作成されました。

![Workfront計画 ](./images/wfpl47.png)

Workfrontでプログラムを確認するには、メニューを開いて **ポートフォリオ** をクリックします。

![Workfront計画 ](./images/wfpl48.png)

`--aepUserLdap-- - Marketing` という名前のポートフォリオを開きます。

![Workfront計画 ](./images/wfpl49.png)

**プログラム** に移動すると、設定した自動化によって作成されたプログラムが表示されます。

![Workfront計画 ](./images/wfpl50.png)

次の手順：[1.2.2 未定 ](./ex1.md){target="_blank"}

[Workfront計画の概要 ](./wfplanning.md){target="_blank"} に戻る

[ すべてのモジュールに戻る ](./../../../overview.md){target="_blank"}
