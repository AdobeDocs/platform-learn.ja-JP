---
title: Platform Web SDK データを使用したイベント転送の設定
description: Experience Platform Web SDK data を使用したイベント転送プロパティの使用方法を説明します。 このレッスンは、「Web SDK を使用した Adobe Experience Cloud 実装のチュートリアル」の一部です。
feature: Web SDK,Tags,Event Forwarding
jira: KT-15414
exl-id: 5a306609-2c63-42c1-8beb-efa412b8efe4
source-git-commit: 7ccbaaf4db43921f07c971c485e1460a1a7f0334
workflow-type: tm+mt
source-wordcount: '1872'
ht-degree: 4%

---

# Platform Web SDK データを使用したイベント転送の設定

Adobe Experience Platform Web SDK データでイベント転送を使用する方法について説明します。

イベント転送は、データ収集で使用できる新しいタイプのプロパティです。 イベント転送を使用すると、従来のクライアントサイドブラウザーではなく、Adobe Experience Platform Edge NetworkからサードパーティのAdobe以外のベンダーにデータを直接送信できます。 イベント転送の利点について詳しくは、[&#x200B; イベント転送の概要 &#x200B;](https://experienceleague.adobe.com/ja/docs/experience-platform/tags/event-forwarding/overview) を参照してください。


![Web SDKとイベント転送の図 &#x200B;](assets/dc-websdk-eventforwarding.png)

Adobe Experience Platformでイベント転送を使用するには、まず次の 3 つのオプションの 1 つ以上を使用して、データをAdobe Experience Platform Edge Networkに送信する必要があります。

* [Adobe Experience Platform Web SDK](overview.md)
* [Adobe Experience Platform モバイル SDK](https://developer.adobe.com/client-sdks/home/)
  <!--* [Server-to-Server API](https://experienceleague.adobe.com/ja/docs/audience-manager/user-guide/api-and-sdk-code/dcs/dcs-apis/dcs-s2s)-->


>[!NOTE]
>Platform Web SDKおよび Platform Mobile SDKは、タグを介したデプロイメントは必要ありませんが、これらの SDK のデプロイにタグを使用することをお勧めします。

このチュートリアルの前のレッスンを完了したら、web SDKを使用して Platform Edge Networkにデータを送信する必要があります。 データが Platform Edge Networkに送信されたら、イベント転送を有効にし、イベント転送プロパティを使用して、Adobe以外のソリューションにデータを送信できます。

## 学習目標

このレッスンでは、次の内容を学習します。

* イベント転送プロパティの作成
* イベント転送プロパティを Platform Web SDK データストリームにリンクする
* タグプロパティのデータ要素とルール、およびイベント転送のプロパティデータ要素とルールの違いについて
* イベント転送データ要素の作成
* イベント転送ルールの設定
* イベント転送プロパティが正常にデータを送信できたことを検証します


## 前提条件

* イベント転送を含むソフトウェアライセンス。 イベント転送は、データ収集の有料機能です。 詳しくは、Adobe アカウントチームにお問い合わせください。
* Experience Cloud組織でイベント転送が有効になっている。
* イベント転送のユーザー権限。 （[Admin Console](https://adminconsole.adobe.com/) のAdobe Experience Platform Launch製品で、&lbrace;Platforms[!UICONTROL &#x200B; > &#x200B;]Edge[!UICONTROL &#x200B; およびすべての &#x200B;] プロパティ権限 [!UICONTROL &#x200B; の権限項目 &#x200B;]。 付与されると、データ収集インターフェイスの左側のナビゲーションに [!UICONTROL &#x200B; イベント転送 &#x200B;] が表示されます。
  ![&#x200B; イベント転送のプロパティ &#x200B;](assets/event-forwarding-menu.png)

* Adobe Experience Platform Web または Mobile SDKは、Edge Networkにデータを送信するように設定されています。 このチュートリアルの次のレッスンを完了している必要があります。

   * 初期設定

      * [XDM スキーマの設定](configure-schemas.md)
      * [ID 名前空間の設定](configure-identities.md)
      * [データストリームの設定](configure-datastream.md)

   * タグの設定

      * [Web SDK 拡張機能のインストール](install-web-sdk.md)
      * [データ要素の作成](create-data-elements.md)
      * [ID の作成](create-identities.md)
      * [タグルールの作成](create-tag-rule.md)
      * [Adobe Experience Platform Debugger での検証](validate-with-debugger.md)


## イベント転送プロパティの作成

まず、イベント転送プロパティを作成します。

1. [&#x200B; データ収集インターフェイス &#x200B;](https://experience.adobe.com/#/data-collection) を開きます。
1. 左側のナビゲーションから **[!UICONTROL イベント転送]** を選択します
1. 「**[!UICONTROL 新しいプロパティ]**」を選択します。
   ![&#x200B; イベント転送のプロパティ &#x200B;](assets/event-forwarding-new.png)

1. プロパティに名前を付けます。 この場合、`Server-Side - Web SDK Course`

1. 「**[!UICONTROL 保存]**」を選択します。
   ![&#x200B; イベント転送プロパティの保存 &#x200B;](assets/event-forwarding-save.png)

## データストリームの設定

イベント転送で Platform Edge Networkに送信するデータを使用するには、新しく作成したイベント転送プロパティを、Adobe ソリューションにデータを送信するために使用されるのと同じデータストリームにリンクする必要があります。

データストリームで Target を設定するには：

1. [&#x200B; データ収集 &#x200B;](https://experience.adobe.com/#/data-collection){target="blank"} インターフェイスに移動
1. 左側のナビゲーションで「**[!UICONTROL データストリーム]**」を選択します
1. 以前に作成した `Luma Web SDK: Development Environment` データストリームを選択します

   ![Luma Web SDK データストリームを選択します &#x200B;](assets/datastream-luma-web-sdk-development.png)。

1. 「**[!UICONTROL サービスを追加]**」を選択します。
   ![&#x200B; データストリームへのサービスの追加 &#x200B;](assets/event-forwarding-datastream-addService.png)
1. **[!UICONTROL サービス]** として「**[!UICONTROL イベント転送]**」を選択します

1. **[!UICONTROL プロパティ ID]** ドロップダウンで、イベント転送プロパティに付けた名前（この場合は `Server-Side - Web SDK Course`）を選択します

1. **[!UICONTROL 環境 ID]** ドロップダウンで、イベント転送環境のリンク先のタグ環境（この場合は `Development`）を選択します

   >[!TIP]
   >
   >    Adobe組織外のイベント転送環境にデータを送信するには、「**[!UICONTROL ID を手動で入力]**」を選択して、ID を貼り付けます。 この ID は、イベント転送プロパティの作成時に提供されます。

1. 「**[!UICONTROL 保存]**」を選択します。

   ![&#x200B; イベント転送データストリームの有効化 &#x200B;](assets/event-forwarding-datastream-enable.png)

公開フローを通じて変更を昇格させる準備が整ったら、ステージングと実稼動のデータストリームに対してこれらの手順を繰り返します。

## Platform Edge NetworkからAdobe以外のソリューションへのデータの転送

この演習では、イベント転送データ要素を設定し、イベント転送ルールを設定し、[Webhook.site](https://webhook.site/) と呼ばれるサードパーティのツールを使用して検証する方法について説明します。

>[!NOTE]
>
>Webhook は、異なるシステムを半リアルタイムで統合する方法です。 [Webhook.site](https://webhook.site/) は、受信したすべての HTTP リクエストやメールを（視覚的なカスタムアクションビルダー（WebhookScript）を使用して）簡単に検査、テスト、自動化できるサードパーティツールです。

>[!IMPORTANT]
>
>先に進むには、データ要素を既に作成して XDM オブジェクトにマッピングし、タグルールを設定して、ライブラリ内でこれらの変更をタグ環境にビルドしている必要があります。 まだ設定されていない場合は、**前提条件** 節の [&#x200B; タグの設定 &#x200B;](setup-event-forwarding.md#prerequisites) の手順を参照してください。 これらの手順では、データが Platform Edge Networkに送信され、そこからイベント転送プロパティを設定して、Adobe以外のソリューションにデータを転送できます。


### イベント転送データ要素の作成

Platform Web SDK タグ拡張機能を使用して以前に設定した XDM オブジェクトは、イベント転送プロパティのデータ要素のデータソースになります。 イベント転送用のデータソースとして、タグプロパティに既に設定したのと同じデータを使用します。

>[!IMPORTANT]
>
>イベント転送で XDM フィールドを参照する場合と他のコンテキストで参照する場合では、重要な構文の違いが 1 つあります。 イベント転送プロパティのデータを参照するには、データ要素のパスに `arc.event` のプレフィックスを含める必要があります。
>
> * `arc` は、Adobe Response Context の略語です。
> * 例：`arc.event.xdm.web.webPageDetails.URL`
>
>このパスが正しく指定されていない場合、データは収集されません。

この演習では、ブラウザービューポートの高さとExperience Cloud ID を、XDM オブジェクトから Webhook に転送します。 XDM フィールドパスは、「XDM スキーマの設定 [&#x200B; のレッスンで作成した XDM スキーマに &#x200B;](configure-schemas.md) って決定されます。

>[!TIP]
>
>また、Web ブラウザーのネットワークツールを使用し、`/ee` リクエストをフィルタリングし、ビーコン [!UICONTROL **ペイロード**] を開き、探している変数にドリルダウンして、XDM オブジェクトパスを見つけることもできます。 次に、マウスで右クリックして「プロパティパスをコピー」を選択します。 ブラウザ ビューポートの高さの例を次に示します。
>&#x200B;> ![イベント転送 XDM パス &#x200B;](assets/event-forwarding-xdm-path.png)

1. 最近作成した **[!UICONTROL イベント転送]** プロパティに移動します

1. 左側のナビゲーションで「**[!UICONTROL データ要素]**」を選択します。

1. 選択して **[!UICONTROL 新しいデータ要素を作成]** します

   ![&#x200B; イベント転送の新しいデータ要素 &#x200B;](assets/event-forwarding-new-dataelement.png)

1. **[!UICONTROL 名前]** データ要素 `environment.browserDetails.viewportHeight`

1. **[!UICONTROL Extension]** の下で、`CORE` のままにします

1. **[!UICONTROL データ要素タイプ]** の下で、`Path` を選択します

1. ブラウザービューポートの高さ `arc.event.xdm.environment.browserDetails.viewportHeight` を含む XDM オブジェクトパスを入力

1. 「**[!UICONTROL 保存]**」を選択します

   ![&#x200B; イベント転送 ECID パス &#x200B;](assets/event-forwarding-browser-viewpoirt-height.png)


1. 別のデータ要素の作成

1. **[!UICONTROL 名前]** it `ecid`

1. **[!UICONTROL Extension]** の下で、`CORE` のままにします

1. **[!UICONTROL データ要素タイプ]** の下で、`Path` を選択します

1. Experience Cloud ID `arc.event.xdm.identityMap.ECID.0.id` を含む XDM オブジェクトパスを入力

1. 「**[!UICONTROL 保存]**」を選択します

   ![&#x200B; イベント転送 ECID パス &#x200B;](assets/event-forwarding-ecid.png)

   >[!CAUTION]
   >
   > パスに `arc.event.` のプレフィックスを必ず含めてください。 また、XDM オブジェクトフィールド名と同じ大文字と小文字を使用してください。ECID 名前空間はすべて大文字にする必要があります。


   >[!TIP]
   >
   >独自の web サイトで作業する場合、web ブラウザーのネットワークツールで XDM オブジェクトパスを見つけ、`/ee` リクエストをフィルタリングし、ビーコン [!UICONTROL **ペイロード**] を開いて、探している変数にドリルダウンできます。 次に、マウスで右クリックして「プロパティパスをコピー」を選択します。 ブラウザ ビューポートの高さの例を次に示します。
   > ![&#x200B; イベント転送 XDM パス &#x200B;](assets/event-forwarding-xdm-path.png)

### Adobe Cloud Connector 拡張機能のインストール

サードパーティの場所にデータを送信するには、まず [!UICONTROL Adobe Cloud Connector] 拡張機能をインストールします。

1. 左側のナビゲーションの **[!UICONTROL 拡張機能]** を選択します

1. 「**[!UICONTROL カタログ]**」タブを選択します

1. **[!UICONTROL Adobe Cloud Connector]** を検索し、「**[!UICONTROL インストール]**」を選択します

   ![&#x200B; イベント転送 ECID パス &#x200B;](assets/event-forwarding-adobe-cloud-connector.png)

拡張機能の設定は必要ありません。 この拡張機能を使用すると、Adobe以外のソリューションにデータを転送できるようになりました。

### イベント転送ルールの作成

タグプロパティでルールを設定する場合と、イベント転送プロパティでルールを設定する場合では、主に次の点が異なります。

* **[!UICONTROL イベント &#x200B;] および [!UICONTROL &#x200B; 条件]**:

   * **タグ**：すべてのルールは、ルールで指定する必要があるイベント（例：`Library Loaded - Page Top`）によってトリガーされます。 条件はオプションです。
   * **イベント転送**:Platform Edge Networkに送信されるすべてのイベントが、データを転送するトリガーであると想定されます。 したがって、イベント転送ルールで選択する必要がある [!UICONTROL &#x200B; イベント &#x200B;] はありません。 イベント転送ルールをトリガーとするイベントを管理するには、条件を設定する必要があります。

* **データ要素のトークン化**:

   * **タグ**：ルールで使用される場合、データ要素名の先頭と末尾に `%` を付けて、データ要素名をトークン化します。 例：`%viewportHeight%`。

   * **イベント転送**：ルールで使用する場合、データ要素名の先頭に `{{`、末尾に `}}` を付けてデータ要素名をトークン化します。 例：`{{viewportHeight}}`。

* **一連のルールアクション**:

   * イベント転送ルールのアクション セクションは常に順番に実行されます。 ルールを保存する際は、アクションの順序が正しいことを確認してください。 この実行シーケンスは、タグの場合のように非同期で実行することはできません。

<!--
  * **Tags**: Rule actions can easily be reordered using drag-and-drop functionality.
  * **Event forwarding**: Rule actions are always executed sequentially. Make sure the order of actions is correct when you save a rule.
-->

Webhook にデータを転送するルールを設定するには、まず個人用 Webhook を取得する必要があります。

1. [Webhook.site](https://webhook.site) に移動します

1. **一意の URL** を検索します。これをイベント転送ルールの URL リクエストとして使用します

1. **[!UICONTROL クリップボードにコピー]** を選択

1. Webhook でキャプチャされたイベント転送データをリアルタイムで検証できるので、このウィンドウは開いたままにしておきます

   ![Webhook URL をコピー &#x200B;](assets/event-forwarding-webhook.png)

1. 左側のナビゲーションから **[!UICONTROL データ収集]**/**[!UICONTROL イベント転送]**/**[!UICONTROL ルール]** に戻ります

1. 「**[!UICONTROL 新規ルールの作成]**」を選択します

   ![&#x200B; イベント転送の新しいルール &#x200B;](assets/event-forwarding-new-rules.png)

1. `all events - ad cloud connector - webhook` という名前を付けます

1. アクションの追加

1. **[!UICONTROL Extension]** で、**[!UICONTROL Adobe Cloud Connector]** を選択します

1. **[!UICONTROL アクションタイプ]** の下で、「**[!UICONTROL Make Fetch Call]**」を選択します。

1. Webhook URL を「**[!UICONTROL URL]**」フィールドに貼り付けます

   ![Webhook URL をコピー &#x200B;](assets/event-forwarding-rule.png)

1. **[クエリパラメーター]** の下で、前に作成した両方のデータ要素を追加します。

1. **[!UICONTROL の]** キー `viewPortHeight` 列タイプ。 **[!UICONTROL 値]** 列で、データ要素セレクターアイコンに入力するか選択して、`{{environment.browserDetails.viewportHeight}}` データ要素を入力します

1. 「[!UICONTROL **+さらに追加**]」を選択して、別のクエリパラメーターを追加します

1. **[!UICONTROL の]** キー `ecid` 列タイプ。 「値」列で、`{{ecid}}` データ要素を入力します

1. 「**[!UICONTROL 変更を保持]**」を選択します

   ![&#x200B; クエリパラメーターの追加 &#x200B;](assets/event-forwarding-rule-query-parameter.png)

1. ルールは次のようになります

1. 「**[!UICONTROL 保存]**」を選択します

   ![&#x200B; イベント転送ルールの保存 &#x200B;](assets/event-forwarding-rule-save.png)

### ライブラリの作成とビルド

ライブラリを作成し、通常のタグプロパティの場合と同様に、イベント転送の開発環境に対するすべての変更を作成します。

>[!NOTE]
>
>ステージングプロパティと実稼動イベント転送プロパティをデータストリームにリンクしていない場合は、ライブラリを作成する唯一のオプションとして開発環境が表示されます。

![&#x200B; イベント転送ルールの保存 &#x200B;](assets/event-forwarding-initial-build.png)

## イベント転送ルールの検証

これで、Platform Debugger と Webhook.site を使用してイベント転送プロパティを検証できます。

1. [Luma デモサイト &#x200B;](validate-with-debugger.md#use-the-experience-platform-debugger-to-map-to-your-tag-property) で、データストリームのイベント転送プロパティのマッピング先の Web SDK タグプロパティに [&#x200B; タグライブラリの切り替え &#x200B;](https://luma.enablementadobe.com/content/luma/us/en/men.html) の手順に従います。

1. ページをリロードする前に、Experience Platform Debugger で左側のナビゲーションから **[!UICONTROL ログ]** を開きます

1. 「**[!UICONTROL Edge]**」タブを選択し、「**[!UICONTROL 接続]** を選択して、Platform Edge Network リクエストを表示します

   ![&#x200B; イベント転送 Edge ネットワークセッション &#x200B;](assets/event-forwarding-edge-session.png)

1. ページをリロードします。

1. Platform Edge Networkから WebHook に送信されるサーバーサイドリクエストを可視化する追加のリクエストが表示されます

1. 検証の対象となるリクエストは、完全に構築された URL がEdge Network から送信されることを示すものです

   ![&#x200B; イベント転送デバッガー &#x200B;](assets/event-forwarding-debugger.png)


1. viewPortHeight および ecid クエリ文字列パラメーターに注意してください

   ![&#x200B; イベント転送の検証クエリ文字列 &#x200B;](assets/event-forwarding-validate-data.png)

1. XDM オブジェクトに表示されるデータと一致します

   ![&#x200B; イベント転送の一致するデータ &#x200B;](assets/event-forwarding-matching-data.png)

1. 最後に、開いている Webhook ウィンドウを表示して、[Webhook.site](https://webhook.site) でもデータの一致を検証します

   ![&#x200B; イベント転送 Webhook サイトデータ &#x200B;](assets/event-forwarding-webhook-data.png)

おめでとうございます。イベント転送が設定されました。

>[!NOTE]
>
>Adobe Experience Platform Web SDKの学習にご協力いただき、ありがとうございます。 ご不明な点がある場合や、一般的なフィードバックを共有したい場合、または今後のコンテンツに関するご提案がある場合は、この [Experience League Community Discussion の投稿でお知らせください &#x200B;](https://experienceleaguecommunities.adobe.com/t5/adobe-experience-platform-data/tutorial-discussion-implement-adobe-experience-cloud-with-web/td-p/444996?profile.language=ja)
