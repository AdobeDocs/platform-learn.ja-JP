---
title: セグメントの作成
seo-title: Build segments | Getting Started with Adobe Experience Platform for Data Architects and Data Engineers
breadcrumb-title: セグメントの作成
description: このレッスンでは、前のレッスンで取り込んだプロファイルデータに基づいて、いくつかのセグメントを作成します。
role: Data Architect
feature: Data Governance
jira: KT-4348
thumbnail: 4348-build-segments.jpg
exl-id: cd05e814-1ea7-48ba-adf6-1a71504c623e
source-git-commit: 00ef0f40fb3d82f0c06428a35c0e402f46ab6774
workflow-type: tm+mt
source-wordcount: '905'
ht-degree: 1%

---

# セグメントの作成

<!-- 30 min-->
このレッスンでは、前のレッスンで取り込んだプロファイルデータに基づいて、いくつかのセグメントを作成します。

リアルタイム顧客プロファイルを取得したら、類似の特性を共有し、マーケティング戦略と同様の反応を示す可能性のある個人のセグメントを作成できます。 これらのセグメントの構成要素は、以前に作成した XDM フィールドです。

**データアーキテクト** は、このチュートリアル以外でセグメントを作成し、このタスクで同僚をサポートする必要があります。

演習を開始する前に、この短いビデオを視聴して、セグメントの作成について詳しく確認してください。
>[!VIDEO](https://video.tv.adobe.com/v/27254?learn=on)


## 必要な権限

[ 権限の設定 ](configure-permissions.md) レッスンでは、このレッスンを完了するために必要なすべてのアクセス制御を設定します。

* 権限項目 **[!UICONTROL プロファイル管理]**/**[!UICONTROL セグメントの管理]**、**[!UICONTROL セグメントの表示]** および **[!UICONTROL オーディエンスセグメントの書き出し]**
* 権限項目 **[!UICONTROL プロファイル管理]**/**[!UICONTROL プロファイルを表示]** および **[!UICONTROL プロファイルの管理]**
* 権限項目 **[!UICONTROL サンドボックス]**/`Luma Tutorial`
* `Luma Tutorial Platform` 製品プロファイルへのユーザー役割アクセス
* `Luma Tutorial Platform` 製品プロファイルへの開発者/役割アクセス（API 用）

## 基本セグメントの作成

ゴールドまたはプラチナステータスのロイヤルティプログラム顧客に対して、シンプルなセグメントを作成しましょう

1. Platform ユーザーインターフェイスで、左側のナビゲーションの **[!UICONTROL セグメント]** に移動します
1. 「**[!UICONTROL セグメントを作成]**」ボタンを選択します
1. スキーマビルダーの左側には、属性（レコードデータ）、イベント（時系列データ）、オーディエンスの 3 つのタブがあります
1. 歯車アイコンを選択すると、セグメントビルダーのデフォルトでデータを含むフィールドのみが表示され、結合ポリシーを変更できることが示されます
1. 「属性」タブで、**XDM 個人プロファイル/ロイヤルティ** フォルダーに移動します（「ロイヤルティ」を検索することもできます）
1. 属性フィールドメニューからセグメントビルダーキャンバスに `Tier` ラッグ&amp;ドロップします
1. `Gold` または `Platinum` と等しい `Tier` を選択
1. **[!UICONTROL 見積もりを更新]** を選択して、セグメントに適格なプロファイルの数を確認します
1. **[!UICONTROL 名前]** として、`Luma customers with level Gold or Above` と入力します
1. 「**[!UICONTROL 保存]**」を選択します
   ![ セグメント ](assets/segment-goldOrAbove.png)

<!--## Build a sequential segment-->

## 動的セグメントの作成

この演習では、同じ製品を 30 日以内に 2 回購入した顧客のセグメントを作成します。 動的セグメントを使用すると、フィールドを変数として使用することで、セグメント化を拡大・縮小できます。

1. 左ナビゲーションの **[!UICONTROL セグメント]** に移動します
1. 「**[!UICONTROL セグメントを作成]**」ボタンを選択します
1. 「**[!UICONTROL イベント]**」タブを選択します
1. リストをフィルターして `purchases` します
1. **[!UICONTROL 購入]** イベントタイプをキャンバスに _2 回_ ドラッグします
1. 2 つの **[!UICONTROL 購入]** イベントの間の時計アイコンを選択し、「30 日以内」を選択します
1. この時点でのセグメント定義で **「1 つ以上の購入イベントを持つオーディエンスを含めると、30 日以内に 1 つ以上の購入イベントを持つ」と書かれていることを確認** ます。
   ![30 日以内に 2 回購入 ](assets/segment-twoPurchases.png)
1. 次に、イベントフィルターを `sku` に変更します
1. 「SKU」フィールドを 2 番目の購入イベントにドラッグします
   ![SKU を使用した 30 日以内の 2 回の購入 ](assets/segment-twoPurchases-addSku.png)
1. ここで、イベントフィルターをクリアします
1. 「変数を参照 **[!UICONTROL セクションに、2 つの購入イベント用のフォルダーがあるこ]** が表示されます。 クリックして検索 **[!UICONTROL 購入 1]**\
   ![SKU を使用して 30 日以内に 2 回の購入をおこない、最初の購入を参照する ](assets/segment-twoPurchases-browsePurchaseOne.png)
1. **[!UICONTROL 製品リスト項目]** フォルダーにドリルダウンして「**[!UICONTROL SKU]**」フィールドを選択し、「**[!UICONTROL equals]**」オペランドの右側にドラッグします。 領域の上にマウスポインターを置いたら、「比較するオペランドに追加」セクションにドロップします
1. セグメント `Bought same product within 30 days` に名前を付ける
1. オーディエンス定義が **「1 つ以上の購入イベントを持つオーディエンスを含め、30 日以内に 1 つ以上の購入イベントを持ち、（（SKU が購入 1 SKU と等しい））」であることを確認し** す。
1. 「**[!UICONTROL 保存]** ボタンを選択します

   ![ 過去 30 日間のセグメントで同じ製品を購入 ](assets/segment-boughtSameProduct.png)

## マルチエンティティセグメントの作成

以前のレッスンで `Luma Offline Purchase Events Schema` と `Luma Product Catalog Schema` の関係を作成した方法を思い出してください。 マルチエンティティのセグメント化を使用してスキーマで関係を使用できるように、これを行いました。

高度なマルチエンティティのセグメント化機能により、複数の XDM クラスを使用してセグメントを作成し、スキーマを拡張できます。 その結果、セグメントビルダーは、プロファイルデータストア本来の方法と同じように、追加のフィールドにアクセスできます

`Luma Product Catalog Schema` ーザーと `Luma Offline Purchase Events Schema` ーザーの間に構築した関係を適用して、次のセグメントを作成します。

1. 左ナビゲーションの **[!UICONTROL セグメント]** に移動します
1. 「**[!UICONTROL セグメントを作成]**」ボタンを選択します
1. 「**[!UICONTROL イベント]**」タブを選択します
1. リストをフィルターして `purchases` します
1. **[!UICONTROL 購入]** イベントタイプをキャンバスにドラッグします
1. イベントの上にある時計ドロップダウンを選択し、「過去 30 日以内 **[!UICONTROL を選択し]** す。
1. **[!UICONTROL イベント]** リストを `category` にフィルタリングし、「**[!UICONTROL 製品カテゴリ]**」フィールドを **[!UICONTROL 購入]** にドラッグします
1. 演算子を **[!UICONTROL で始まる]** に変更し、テキストボックスに `men` と入力します
1. **[!UICONTROL 名前]** として、`Purchased a Men's product in the last 30 days` と入力します
1. オーディエンス定義 `(Include audience who have at least 1 Purchases event where ((Product Category starts with men)) ) and occurs in last 30 day(s)` を確認
1. 「**[!UICONTROL 保存]** ボタンを選択します

   ![ 過去 30 日間のセグメントで同じ製品を購入 ](assets/segment-purchasedMens.png)

## バッチおよびストリーミングのセグメント化

左側のナビゲーションで **[!UICONTROL セグメント]** をクリックし、3 つのセグメントを確認します。

* 2 つのセグメントはバッチセグメントで、1 つはストリーミングセグメントです。
* Platform は、可能な限りストリーミングセグメント化をデフォルトで使用し、条件を満たすと同時に顧客をセグメントに選定します。 セグメント定義がストリーミングに対して複雑すぎる場合は、自動的にバッチに変換されます。 この場合、購入イベントのルックバックウィンドウが 7 日を超えていたため、2 つのセグメントはデフォルトでバッチに設定されました。 ストリーミング制限の完全な現在のリストについては、[ ドキュメント ](https://experienceleague.adobe.com/docs/experience-platform/segmentation/ui/streaming-segmentation.html?lang=ja) を参照してください。
* バッチジョブは毎日スケジュールで実行されます。このスケジュールはオフに切り替えることができます。

![ 過去 30 日間のセグメントで同じ製品を購入 ](assets/segment-review.png)

## その他のリソース

* [ セグメント化サービスのドキュメント ](https://experienceleague.adobe.com/docs/experience-platform/segmentation/home.html?lang=ja)
* [Segmentation Service API リファレンス ](https://www.adobe.io/experience-platform-apis/references/segmentation/)

セグメント化、特にセグメントのアクティブ化には、より多くの機能があります。 これらのトピックについては、別のチュートリアルで説明します。

すべての演習を完了しました。 [ 結論 ](conclusion.md) に進んでください。
