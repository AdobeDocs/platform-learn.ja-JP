---
title: CSC ブートキャンプ — その他の事前作業
description: CSC ブートキャンプ — その他の事前作業
doc-type: multipage-overview
source-git-commit: 989e4e2add1d45571462eccaeebcbe66a77291db
workflow-type: tm+mt
source-wordcount: '478'
ht-degree: 0%

---

# その他の事前作業

## ブランドアセットを選択

クリエイティブブリーフで説明したように、キャンペーンを効果的に開始するために必要なアセットがいくつかあります。 これらのブランドアセットはWorkfrontのキャンペーンに追加され、アドビが一元的にアクセスできるようになります。

- タスク 1、「初期タスク」を展開し、タスクをクリックして「5 つのブランドアセット（前、後ろ、...）を選択」を開きます。

![アセットを開くタスク](./images/wf-open-assets-task.png)

- 「ドキュメント」をクリックし、「新規追加：

![ドキュメントを追加](./images/wf-add-new-doc.png)

- 「Experience-manager から」を選択します。これにより、AEM Assetsで既に使用可能なブランドアセットを選択できます。

![experience manager から](./images/wf-from-aem.png)

- AEMフォルダー階層が表示されたら、次のパスに移動します。experience-manager / Adobeike Assets /バイクショット 5 つのアセットを選択し、「リンク」をクリックします。

![選択したアセット](./images/selected-assets.png)

- これで、タスクにブランドアセットが追加されました。 つまり、タスク 2 を 100%完了に設定できます。

![タスクを完了](./images/wf-task-2-complete.png)


## Adobe Commerceのデモ

Adobe Commerceは、Adobe Experience Cloudの多くの製品の 1 つで、顧客に最高のデジタルエクスペリエンスを提供するのに役立ちます。 しかし、密造時には、全てを一緒に行う時間がほとんどなかった。

このビデオでは、Adobe Commerceについて理解し、ブートキャンプ時に使用するために作成した製品を紹介します。 実際のシナリオでは、以前に選択したブランドアセットをAdobe Commerceに製品設定にアップロードします。

>[!VIDEO](https://video.tv.adobe.com/v/3418945?quality=12&learn=on)

このタスクが完了したら、Workfrontでタスク 3 を「100%完了」とマークできます。

## 柔軟なキャンペーンが前提条件です

作業計画を見直す際に、少し問題が発生しました。当社の製品マネージャ（リクエスト元）が、「製品ホームページのバナー」をリクエストし忘れたアップデートを発行しました。  これをプロジェクト計画に追加します。

- 「タスク」リストに移動し、「製品ホームページバナーを作成」タスクをタスク 4「実稼動」のすぐ下に追加します。 それには、「モバイルアプリコンテンツを準備」タスクを選択し、「上にタスクを追加」アイコンをクリックします。

![上にタスクを追加](./images/wf-add-task-above.png)

- 追加したタスクにわかりやすい名前を付けます（「製品ホームページのバナーを作成」など）。

![タスクを作成](./images/wf-create-banner.png)

- タスクを作成したら、コンテンツを追加します。 プロジェクトタイトルの右側にある 3 つのドットをクリックし、「テンプレートを添付」を選択します。

![テンプレートを添付](./images/wf-attach-template.png)

- 「製品ホームページのバナーを作成」を選択し、「カスタマイズして添付」をクリックします。

![製品ホームページのバナーを作成](./images/wf-homepage-banner.png)

- カスタマイズ画面で、「製品ホームページのバナーを作成」タスクを親として指定していることを確認します。

![親を追加](./images/wf-create-banner-parent.png)

- 最後に、製品がAdobe Commerceで作成されるまで、実稼動を開始できないので、親タスク「製品ホームページを作成」にタスク 3 の先行タスクを必ずマークしてください。

![正しい先行者を追加する](./images/wf-predecessor.png)

キャンペーンが完了し、計画されました。つまり、キャンペーンの生産と配信から開始できます。


次のステップ： [フェーズ 2 — 実稼動：製品ホームページのバナーを作成](../production/banner.md)

[フェーズ 1 に戻る — 計画：計画](./planning.md)

[すべてのモジュールに戻る](../../overview.md)