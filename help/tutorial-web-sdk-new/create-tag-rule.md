---
title: タグルールの作成
description: タグルールを使用して、XDM オブジェクトを使用して Platform Edge Network にイベントを送信する方法を説明します。 このレッスンは、「 Adobe Experience Cloudと Web SDK の実装」チュートリアルの一部です。
feature: Tags
source-git-commit: 695c12ab66df33af00baacabc3b69eaac7ada231
workflow-type: tm+mt
source-wordcount: '833'
ht-degree: 3%

---

# タグルールの作成

タグルールを使用して、XDM オブジェクトを使用して Platform Edge Network にイベントを送信する方法を説明します。 タグルールは、タグプロパティに何らかの処理を指示するイベント、条件およびアクションを組み合わせたものです。

>[!NOTE]
>
> デモの目的で、このレッスンの演習は、 [データ要素の作成](create-data-elements.md) 手順： [Luma デモサイト](https://luma.enablementadobe.com/content/luma/us/en.html).


## 学習内容

このレッスンを最後まで学習すると、以下の内容を習得できます。

* タグ内のルールを管理するための命名規則を使用する
* XDM イベントを送信するタグルールの作成
* 開発ライブラリへのタグルールの公開


## 前提条件

データ収集タグと [Luma デモサイト](https://luma.enablementadobe.com/content/luma/us/en.html)で、このチュートリアルの前のレッスンで、以下の作業を完了している必要があります。

* [権限の設定](configure-permissions.md)
* [XDM スキーマの設定](configure-schemas.md)
* [ID 名前空間の設定](configure-identities.md)
* [データストリームの設定](configure-datastream.md)
* [タグプロパティにインストールされる Web SDK 拡張機能](install-web-sdk.md)
* [データ要素の作成](create-data-elements.md)

## 命名規則

タグ内のルールの管理を強化するには、標準の命名規則に従うことをお勧めします。 このチュートリアルでは、次の 3 つの部分で構成される命名規則を使用します。

* [場所] - [イベント] - [ツール]

そこで

1. 場所は、ルールが起動するサイトの 1 つ以上のページです
1. イベントは、ビーコンを起動するトリガーです。
1. ツールは、そのルールのアクションステップで使用される特定のアプリケーションまたはアプリケーションです


## タグルールを作成

タグでは、ルールは、様々な条件でアクション（呼び出しの実行）を実行するために使用されます。 この最初のルールを使用し、Web SDK の [!UICONTROL イベントの送信] アクション。 このチュートリアルの後半で、訪問者がいるページのタイプに基づいて、異なるバージョンの XDM オブジェクトを送信します。 そのため、ルール条件を使用して、他のタイプのページを除外します。

タグルールを作成するには：

1. このチュートリアルで使用するタグプロパティを開きます。
1. に移動します。 **[!UICONTROL ルール]** 左のナビゲーションで
1. を選択します。 **[!UICONTROL 新規ルールの作成]** ボタン
   ![ルールの作成](assets/rules-create.png)
1. ルール名を設定します。`all pages - library load - AA & AT`

   >[!NOTE]
   >
   > このルールは、今後のレッスンでAdobe Analyticsと Target で特定の方法で使用されますが、その理由はそのためです `AA & AT` は名前の最後に使用されます。

1. Adobe Analytics の **[!UICONTROL イベント]** セクション、選択 **[!UICONTROL 追加]**
   ![ルールに名前を付けてイベントを追加する](assets/rule-name.png)
1. 以下を使用します。 **[!UICONTROL Core 拡張機能]** を選択し、 `Library Loaded (Page Top)` として **[!UICONTROL イベントタイプ]**.

   この設定は、タグライブラリがページに読み込まれるたびにルールが起動することを意味します。
1. 選択 **[!UICONTROL 変更を保持]** メインのルール画面に戻るには
   ![「Library Loaded」イベントの追加](assets/rule-event-pagetop.png)
1. Adobe Analytics の **[!UICONTROL 条件]** セクションで、 **[!UICONTROL 追加]** ボタン
   ![条件を追加](assets/rules-add-conditions.png)
1. 選択 **[!UICONTROL 論理タイプ]** `Exception`, **[!UICONTROL 拡張]** `Core`、および **[!UICONTROL 条件タイプ]** `Path Without Query String`
1. URL パスを入力 `/content/luma/us/en/user/cart.html` （内） **[!UICONTROL パスが次と等しい]** フィールドおよび **[!UICONTROL 名前]** it `Core - cart page`
1. 選択 **[!UICONTROL 変更を保持]**
   ![条件を追加](assets/rule-condition-exception.png)
1. 次の URL パスに対して、さらに 3 つの例外を追加します。

   * **`Core - checkout page`** for `/content/luma/us/en/user/checkout.html`
   * **`Core - thank you page`** for `/content/luma/us/en/user/checkout/order/thank-you.html`
   * **`Core - product page`** 対象： `/products/` Regex スイッチをオンにして

   ![条件を追加](assets/rule-condition-exception-all.png)

1. Adobe Analytics の **[!UICONTROL アクション]** セクション、選択 **[!UICONTROL 追加]**
1. 選択 **[!UICONTROL Adobe Experience Platform Web SDK]** として **[!UICONTROL 拡張]**
1. 選択 **[!UICONTROL イベントの送信]** として **[!UICONTROL アクションタイプ]**
1. 選択 **[!UICONTROL web.webpagedetails.pageViews]** として **[!UICONTROL タイプ]**.

   >[!WARNING]
   >
   > このドロップダウンには、 **`xdm.eventType`** 変数を使用して、XDM オブジェクトに格納します。 このフィールドには自由形式のラベルを入力することもできますが、 **しない** というのも、Platform との間には避けたい効果があるからです。

1. を **[!UICONTROL XDM データ]**&#x200B;を選択し、 `xdm.content` 前のレッスンで作成したデータ要素
1. 選択 **[!UICONTROL 変更を保持]** メインのルール画面に戻るには

   ![「イベントを送信」アクションの追加](assets/rule-set-action-xdm.png)
1. 選択 **[!UICONTROL 保存]** ルールを保存するには

   ![ルールの保存](assets/rule-save.png)

## ライブラリでのルールの公開

次に、ルールを開発環境に公開して、動作することを確認できるようにします。

ライブラリを作成するには：

1. に移動します。 **[!UICONTROL 公開フロー]** 左のナビゲーションで
1. 選択 **[!UICONTROL ライブラリを追加]**

   ![「ライブラリを追加」を選択します。](assets/rule-publish-library.png)
1. の **[!UICONTROL 名前]**，と入力します。 `Luma Web SDK Tutorial`
1. の **[!UICONTROL 環境]**&#x200B;を選択します。 `Development`
1. 選択  **[!UICONTROL 変更されたリソースをすべて追加]**

   >[!NOTE]
   >
   >    Adobe Experience Platform Web SDK 拡張機能および `all pages - library load - AA & AT` ルールには、前のレッスンで作成したタグコンポーネントが表示されます。 Core 拡張機能には、すべての Web タグプロパティで必要となる基本 JavaScript が含まれています。

1. 選択 **[!UICONTROL 開発用に保存およびビルド]**

   ![ライブラリの作成とビルド](assets/rule-publish-add-all-changes.png)

ライブラリのビルドには数分かかる場合があり、完了すると、ライブラリ名の左側に緑の点が表示されます。

![ビルドが完了しました](assets/rule-publish-success.png)

ご覧のように [!UICONTROL 公開フロー] 画面、公開プロセスには、このチュートリアルの範囲外の多くの点があります。 このチュートリアルでは、開発環境で 1 つのライブラリを使用するだけです。

これで、Adobe Experience Platform Debuggerを使用して、リクエスト内のデータを検証する準備が整いました。

[次へ ](validate-with-debugger.md)

>[!NOTE]
>
>Adobe Experience Platform Web SDK の学習に時間を割いていただき、ありがとうございます。 ご質問がある場合、一般的なフィードバックを共有する場合、または今後のコンテンツに関する提案がある場合は、このドキュメントで共有します [Experience Leagueコミュニティディスカッション投稿](https://experienceleaguecommunities.adobe.com/t5/adobe-experience-platform-launch/tutorial-discussion-implement-adobe-experience-cloud-with-web/td-p/444996)
