---
title: タグルールの作成
description: タグルールを使用して、XDM オブジェクトを使用して Platform Edge Network にイベントを送信する方法を説明します。 このレッスンは、「 Adobe Experience Cloudと Web SDK の実装」チュートリアルの一部です。
feature: Tags
source-git-commit: f08866de1bd6ede50bda1e5f8db6dbd2951aa872
workflow-type: tm+mt
source-wordcount: '1153'
ht-degree: 1%

---

# タグルールの作成

タグルールを使用して、XDM オブジェクトを使用して Platform Edge Network にイベントを送信する方法を説明します。 タグルールは、タグプロパティに何らかの処理を指示するイベント、条件およびアクションを組み合わせたものです。

>[!NOTE]
>
> デモの目的で、このレッスンの演習は、 [ID の作成](create-identities.md) 手順： [Luma デモサイト](https://luma.enablementadobe.com/content/luma/us/en.html).


## 学習内容

このレッスンを最後まで学習すると、次のことが可能になります。

* タグ内のルールを管理するための命名規則を使用する
* タグルールで「Update Variable」アクションタイプと「Send Event」アクションタイプを使用して XDM イベントを送信します
* 開発ライブラリへのタグルールの公開


## 前提条件

データ収集タグと [Luma デモサイト](https://luma.enablementadobe.com/content/luma/us/en.html)で、このチュートリアルの前のレッスンで、以下の作業を完了している必要があります。

* [XDM スキーマの設定](configure-schemas.md)
* [ID 名前空間の設定](configure-identities.md)
* [データストリームの設定](configure-datastream.md)
* [タグプロパティにインストールされる Web SDK 拡張機能](install-web-sdk.md)
* [データ要素の作成](create-data-elements.md)
* [ID の作成](create-identities.md)

## 命名規則

タグ内のルールの管理を強化するには、標準の命名規則に従うことをお勧めします。 このチュートリアルでは、次の 3 つの部分で構成される命名規則を使用します。

* [**場所**] - [**イベント**] - [**ツール**] (**シーケンス**)

そこで

1. **場所** は、ルールが実行されるサイトのページです
1. **イベント** は、ルールのトリガーです
1. **ツール** は、そのルールのアクションステップで使用される特定のアプリケーションまたはアプリケーションです
1. **シーケンス** は、他のルールとの関連でルールを実行する順序です
<!-- minor update -->

## タグルールを作成

タグでは、ルールは、様々な条件でアクション（呼び出しの実行）を実行するために使用されます。 Platform Web SDK Tags 拡張機能には、このレッスンで使用する 2 つのアクションが含まれています。

* **[!UICONTROL 変数を更新]** データ要素を XDM フィールドにマッピングします。
* **[!UICONTROL イベントの送信]** は XDM オブジェクトを Network EdgeExperience Platformに送信します。

### 変数を更新

この最初のルールを「グローバル設定」として作成し、Platform Web SDK の **[!UICONTROL 変数を更新]** アクション。 次に、最初のルールの後にトリガー順に 2 つ目のルールを作成し、を使用して XDM オブジェクトを Platform Edge Network に送信します。 **[!UICONTROL イベントの送信]** アクション。 このチュートリアルの後半で、訪問者がいるページのタイプに基づいて異なる XDM フィールドを送信します（例えば、製品ページの製品 SKU）。 これを実現するには、次を含むルールを順に並べます。 **[!UICONTROL 変数を更新]** を使用するルールの前のアクション **[!UICONTROL イベントの送信]** アクション。

タグルールを作成するには：

1. このチュートリアルで使用するタグプロパティを開きます。

1. に移動します。 **[!UICONTROL ルール]** 左のナビゲーションで

1. を選択します。 **[!UICONTROL 新規ルールの作成]** ボタン

   ![ルールの作成](assets/rules-create.png)

1. ルール名を設定します。`all pages global content variables - page bottom - AA (order 1)`

1. Adobe Analytics の **[!UICONTROL イベント]** セクション、選択 **[!UICONTROL 追加]**

   ![ルールに名前を付けてイベントを追加する](assets/rule-name-new.png)

1. 以下を使用します。 **[!UICONTROL Core 拡張機能]** を選択し、 `Page Bottom` として **[!UICONTROL イベントタイプ]**

1. の下 **[!UICONTROL 名前]** フィールドに名前を付けます。 `Core - Page Bottom - order 1`. これは、意味のある名前でトリガーを説明するのに役立ちます。

1. 選択 **[!UICONTROL 詳細]** ドロップダウンと入力 `1` in **[!UICONTROL 注文]**

   >[!NOTE]
   >
   > 入力する数が多いほど、後でトリガーする操作の全体的な順序になります。

1. 選択 **[!UICONTROL 変更を保持]** メインのルール画面に戻るには
   ![「Select Page Bottom」トリガー](assets/create-tag-rule-trigger-bottom.png)

1. Adobe Analytics の **[!UICONTROL アクション]** セクション、選択 **[!UICONTROL 追加]**

1. を **[!UICONTROL 拡張]**&#x200B;を選択します。 **[!UICONTROL Adobe Experience Platform Web SDK]**

1. を **[!UICONTROL アクションタイプ]**&#x200B;を選択します。 **[!UICONTROL 変数を更新]**

1. を **[!UICONTROL データ要素]**&#x200B;を選択し、 `xdm.variable.content` 次の場所で作成した [データ要素の作成](create-data-elements.md) レッスン

   ![変数スキーマを更新](assets/create-rule-update-variable.png)

次に、 [!UICONTROL データ要素] から [!UICONTROL スキーマ] XDM オブジェクトで使用されます。

>[!NOTE]
> 
> 個々のプロパティまたはオブジェクト全体にマップできます。 この例では、個々のプロパティにマッピングします。


1. 下にスクロールして、 **`web`** object

1. 選択して開きます。

1. 次のデータ要素を、対応する `web` XDM 変数

   * **`web.webPageDetials.name`**&#x200B;コピー先：`%page.pageInfo.pageName%`
   * **`web.webPageDetials.server`**&#x200B;コピー先：`%page.pageInfo.server%`
   * **`web.webPageDetials.siteSection`**&#x200B;コピー先：`%page.pageInfo.hierarchie1%`

   ![変数コンテンツを更新](assets/create-rule-xdm-variable-content.png)

1. 次に、 `identityMap` オブジェクトを選択して選択します。

1. にマッピング `identityMap.loginID` データ要素

   ![変数 ID マップを更新](assets/create-rule-variable-identityMap.png)

1. 次に、「 eventType 」フィールドを見つけて選択します。

1. 値を入力 `web.webpagedetails.pageViews`

   >[!WARNING]
   >
   > このドロップダウンには、 **`xdm.eventType`** 変数を使用して、XDM オブジェクトに格納します。 このフィールドには自由形式のラベルを入力することもできますが、 **しない** というのも、プラットフォームに対する悪影響が少ないからです。

   >[!TIP]
   >
   > に入力する値を理解するには、以下を実行します。 `eventType` 」フィールドに値を入力するには、スキーマページに移動して、 `eventType` 「 」フィールドを使用して、右側のパネルに推奨値を表示します。

   ![変数 ID マップを更新](assets/create-tag-rule-eventType.png)


1. 選択 **[!UICONTROL 変更を保持]** その後 **[!UICONTROL 保存]** ルールの作成を終了するための次の画面のルール

### イベントを送信

これで変数を設定したので、2 つ目のルールを作成して、 **[!UICONTROL イベントを送信]** アクションタイプ。

1. 右側で、「 」を選択して、 **[!UICONTROL ルールを追加]** 別の規則を作成するには

1. ルール名を設定します。`all pages send event - page bottom - AA (order 50)`

1. Adobe Analytics の **[!UICONTROL イベント]** セクション、選択 **[!UICONTROL 追加]**

1. 以下を使用します。 **[!UICONTROL Core 拡張機能]** を選択し、 `Page Bottom` として **[!UICONTROL イベントタイプ]**

1. の下 **[!UICONTROL 名前]** フィールドに名前を付けます。 `Core - Page Bottom - order 50`. これは、意味のある名前でトリガーを説明するのに役立ちます。

1. 選択 **[!UICONTROL 詳細]** ドロップダウンと入力 `50` in **[!UICONTROL 注文]**. これにより、最初に「トリガー」に設定したルールの後に、2 番目のルールトリガーが確実に適用されます。 `1`.

1. 選択 **[!UICONTROL 変更を保持]** メインのルール画面に戻るには
   ![「Select Page Bottom」トリガー](assets/create-tag-rule-trigger-bottom-send.png)

1. Adobe Analytics の **[!UICONTROL アクション]** セクション、選択 **[!UICONTROL 追加]**

1. を **[!UICONTROL 拡張]**&#x200B;を選択します。  **[!UICONTROL Adobe Experience Platform Web SDK]**

1. を  **[!UICONTROL アクションタイプ]**&#x200B;を選択します。  **[!UICONTROL イベントを送信]**

1. を **[!UICONTROL XDM]**&#x200B;を選択し、 `xdm.variable.content` 前のレッスンで作成したデータ要素

1. 選択 **[!UICONTROL 変更を保持]** メインのルール画面に戻るには

   ![「イベントを送信」アクションの追加](assets/create-rule-send-event-action.png)
1. 選択 **[!UICONTROL 保存]** ルールを保存するには

   ![ルールの保存](assets/create-rule-save-rule.png)

## ライブラリでのルールの公開

次に、ルールを開発環境に公開して、機能することを確認できます。

ライブラリを作成するには：

1. に移動します。 **[!UICONTROL 公開フロー]** 左のナビゲーションで

1. 選択 **[!UICONTROL ライブラリを追加]**

   ![「ライブラリを追加」を選択します。](assets/rule-publish-library.png)
1. の **[!UICONTROL 名前]**，と入力します。 `Luma Web SDK Tutorial`
1. の **[!UICONTROL 環境]**&#x200B;を選択します。 `Development`
1. 選択  **[!UICONTROL 変更されたリソースをすべて追加]**

   >[!NOTE]
   >
   >    Adobe Experience Platform Web SDK 拡張機能および `all pages global content variables - page bottom - AA (order 50)` ルールには、前のレッスンで作成したタグコンポーネントが表示されます。 Core 拡張機能には、すべての Web タグプロパティで必要となる基本 JavaScript が含まれています。

1. 選択 **[!UICONTROL 開発用に保存およびビルド]**

   ![ライブラリの作成とビルド](assets/create-tag-rule-library-changes.png)

ライブラリのビルドには数分かかる場合があり、完了すると、ライブラリ名の左側に緑の点が表示されます。

![ビルドが完了しました](assets/create-rule-development-success.png)

ご覧のように [!UICONTROL 公開フロー] 画面、公開プロセスには、このチュートリアルの範囲外の多くの点があります。 このチュートリアルでは、開発環境で 1 つのライブラリを使用するだけです。

これで、Adobe Experience Platform Debuggerを使用して、リクエスト内のデータを検証する準備が整いました。

[次へ ](validate-with-debugger.md)

>[!NOTE]
>
>Adobe Experience Platform Web SDK の学習に時間を割いていただき、ありがとうございます。 ご質問がある場合、一般的なフィードバックを共有したい場合、または今後のコンテンツに関する提案がある場合は、こちらで共有してください [Experience Leagueコミュニティディスカッション投稿](https://experienceleaguecommunities.adobe.com/t5/adobe-experience-platform-launch/tutorial-discussion-implement-adobe-experience-cloud-with-web/td-p/444996)
