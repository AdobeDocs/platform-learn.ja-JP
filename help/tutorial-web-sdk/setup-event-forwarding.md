---
title: Platform Web SDK データを使用したイベント転送の設定
description: Experience Platform Web SDK data を使用したイベント転送プロパティの使用方法を説明します。 このレッスンは、Web SDK を使用したAdobe Experience Cloudの実装チュートリアルの一部です。
feature: Web SDK,Tags,Event Forwarding
jira: KT-15414
exl-id: 5a306609-2c63-42c1-8beb-efa412b8efe4
source-git-commit: 8602110d2b2ddc561e45f201e3bcce5e6a6f8261
workflow-type: tm+mt
source-wordcount: '1873'
ht-degree: 4%

---

# Platform Web SDK データを使用したイベント転送の設定

Adobe Experience Platform Web SDK データでイベント転送を使用する方法を説明します。

イベント転送は、データ収集で使用できる新しいタイプのプロパティです。 イベント転送を使用すると、従来のクライアントサイドブラウザーではなく、Adobe Experience Platform Edge NetworkからサードパーティのAdobe以外のベンダーにデータを直接送信できます。 イベント転送の利点について詳しくは、を参照してください [イベント転送の概要](https://experienceleague.adobe.com/en/docs/experience-platform/tags/event-forwarding/overview).


![Web SDK とイベント転送の図](assets/dc-websdk-eventforwarding.png)

Adobe Experience Platformでイベント転送を使用するには、まず次の 3 つのオプションの 1 つ以上を使用して、データをAdobe Experience Platform Edge Networkに送信する必要があります。

* [Adobe Experience Platform Web SDK](overview.md)
* [Adobe Experience Platform モバイル SDK](https://developer.adobe.com/client-sdks/home/)
  <!--* [Server-to-Server API](https://experienceleague.adobe.com/en/docs/audience-manager/user-guide/api-and-sdk-code/dcs/dcs-apis/dcs-s2s)-->


>[!NOTE]
>Platform Web SDK および Platform Mobile SDK は、タグを介したデプロイメントは必要ありませんが、これらの SDK をデプロイするためにタグを使用することをお勧めします。

このチュートリアルの前のレッスンを完了したら、Web SDK を使用して Platform Edge Networkにデータを送信する必要があります。 データが Platform Edge Networkになったら、イベント転送を有効にし、イベント転送プロパティを使用して、Adobe以外のソリューションにデータを送信できます。

## 学習目標

このレッスンでは、次の内容を学習します。

* イベント転送プロパティの作成
* イベント転送プロパティを Platform Web SDK データストリームにリンクする
* タグプロパティのデータ要素とルール、およびイベント転送のプロパティデータ要素とルールの違いについて
* イベント転送データ要素の作成
* イベント転送ルールの設定
* イベント転送プロパティが正常にデータを送信できたことを検証します


## 前提条件

* イベント転送を含むソフトウェアライセンス。 イベント転送は、データ収集の有料機能です。 詳しくは、Adobeアカウントチームにお問い合わせください。
* Experience Cloud組織でイベント転送が有効になっている。
* イベント転送のユーザー権限。 （中） [Admin Console](https://adminconsole.adobe.com/)のAdobe Experience Platform Launch製品で、次に対する権限項目[!UICONTROL プラットフォーム] > [!UICONTROL Edge] およびすべて [!UICONTROL プロパティ権限]）に設定します。 付与されると、次のように表示されます [!UICONTROL イベントの転送] データ収集インターフェイスの左側のナビゲーションで、次の操作を行います。
  ![イベント転送のプロパティ](assets/event-forwarding-menu.png)

* Adobe Experience Platform Web SDK または Mobile SDK は、Edge Networkにデータを送信するように設定されています。 このチュートリアルの次のレッスンを完了している必要があります。

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

1. を開きます [データ収集インターフェイス](https://experience.adobe.com/#/data-collection)
1. を選択 **[!UICONTROL イベントの転送]** 左側のナビゲーションから
1. 「**[!UICONTROL 新しいプロパティ]**」を選択します。
   ![イベント転送のプロパティ](assets/event-forwarding-new.png)

1. プロパティに名前を付けます。 この場合、 `Server-Side - Web SDK Course`

1. 「**[!UICONTROL 保存]**」を選択します。
   ![イベント転送プロパティの保存](assets/event-forwarding-save.png)

## データストリームの設定

イベント転送で Platform Edge Networkに送信するデータを使用するには、新しく作成したイベント転送プロパティを、Adobeソリューションにデータを送信するために使用されるのと同じデータストリームにリンクする必要があります。

データストリームで Target を設定するには：

1. に移動 [データ収集](https://experience.adobe.com/#/data-collection){target="blank"} インターフェイス
1. 左側のナビゲーションで「」を選択します **[!UICONTROL データストリーム]**
1. 以前に作成したを選択します `Luma Web SDK: Development Environment` データストリーム

   ![Luma Web SDK データストリームを選択](assets/datastream-luma-web-sdk-development.png)

1. 「**[!UICONTROL サービスを追加]**」を選択します。
   ![データストリームへのサービスの追加](assets/event-forwarding-datastream-addService.png)
1. を選択 **[!UICONTROL イベントの転送]** as the **[!UICONTROL サービス]**

1. の下 **[!UICONTROL プロパティ ID]** ドロップダウンで、イベント転送プロパティに付けた名前を選択します（この場合は） `Server-Side - Web SDK Course`

1. の下 **[!UICONTROL 環境 ID]** ドロップダウンで、イベント転送環境のリンク先のタグ環境（この場合は）を選択します `Development`

   >[!TIP]
   >
   >    Adobe組織外のイベント転送環境にデータを送信するには、次を選択します。 **[!UICONTROL ID を手動で入力]** ID を貼り付けます。 この ID は、イベント転送プロパティの作成時に提供されます。

1. 「**[!UICONTROL 保存]**」を選択します。

   ![イベント転送データストリームの有効化](assets/event-forwarding-datastream-enable.png)

公開フローを通じて変更を昇格させる準備が整ったら、ステージングと実稼動のデータストリームに対してこれらの手順を繰り返します。

## Platform Edge NetworkからAdobe以外のソリューションにデータを転送

この演習では、イベント転送データ要素を設定し、イベント転送ルールを設定し、というサードパーティのツールを使用して検証する方法について説明します [Webhook.site](https://webhook.site/).

>[!NOTE]
>
>Webhook は、異なるシステムを半リアルタイムで統合する方法です。 [Webhook.site](https://webhook.site/) は、受信する HTTP リクエストやメールを（視覚的なカスタムアクションビルダー（WebhookScript）を使用して）簡単に検査、テストおよび自動化できるサードパーティツールです。

>[!IMPORTANT]
>
>先に進むには、データ要素を既に作成して XDM オブジェクトにマッピングし、タグルールを設定して、ライブラリ内でこれらの変更をタグ環境にビルドしている必要があります。 まだ参照していない場合は、を参照してください **タグの設定** の手順 [前提条件](setup-event-forwarding.md#prerequisites) セクション。 これらの手順では、データが Platform Edge Networkに送信され、そこからAdobe転送プロパティを設定して、イベント以外のソリューションにデータを転送できます。


### イベント転送データ要素の作成

Platform Web SDK タグ拡張機能を使用して以前に設定した XDM オブジェクトは、イベント転送プロパティのデータ要素のデータソースになります。 イベント転送用のデータソースとして、タグプロパティに既に設定したのと同じデータを使用します。

>[!IMPORTANT]
>
>イベント転送で XDM フィールドを参照する場合と他のコンテキストで参照する場合では、重要な構文の違いが 1 つあります。 イベント転送プロパティのデータを参照するには、データ要素のパスに以下を含める必要があります `arc.event` プレフィックス：
>
> * `arc` は、Adobe Response Context の略語です。
> * 例：`arc.event.xdm.web.webPageDetails.URL`
>
>このパスが正しく指定されていない場合、データは収集されません。

この演習では、ブラウザービューポートの高さとExperience Cloud ID を、XDM オブジェクトから Webhook に転送します。 XDM フィールドパスは、次の期間に作成された XDM スキーマによって決定されます [XDM スキーマの設定](configure-schemas.md) レッスン：

>[!TIP]
>
>また、Web ブラウザーのネットワークツール、フィルタリングを使用して、XDM オブジェクトパスを見つけることもできます `/ee` リクエスト，ビーコンを開く [!UICONTROL **ペイロード**] 検索する変数にドリルダウンします。 次に、マウスで右クリックして「プロパティパスをコピー」を選択します。 ブラウザ ビューポートの高さの例を次に示します。
> ![イベント転送 XDM パス](assets/event-forwarding-xdm-path.png)

1. に移動します **[!UICONTROL イベントの転送]** 最近作成したプロパティ

1. 左側のナビゲーションで「」を選択します **[!UICONTROL データ要素]**

1. を選択： **[!UICONTROL 新しいデータ要素の作成]**

   ![イベント転送新しいデータ要素](assets/event-forwarding-new-dataelement.png)

1. **[!UICONTROL 名前]** データ要素 `environment.browserDetails.viewportHeight`

1. 次の下 **[!UICONTROL 拡張機能]**、移動する `CORE`

1. 次の下 **[!UICONTROL データ要素タイプ]**&#x200B;を選択 `Path`

1. ブラウザービューポートの高さを含む XDM オブジェクトパスを入力 `arc.event.xdm.environment.browserDetails.viewportHeight`

1. 「**[!UICONTROL 保存]**」を選択します

   ![イベント転送 ECID パス](assets/event-forwarding-browser-viewpoirt-height.png)


1. 別のデータ要素の作成

1. **[!UICONTROL 名前]** 0.45511884 `ecid`

1. 次の下 **[!UICONTROL 拡張機能]**、移動する `CORE`

1. 次の下 **[!UICONTROL データ要素タイプ]**&#x200B;を選択 `Path`

1. Experience Cloud ID を含む XDM オブジェクトパスを入力 `arc.event.xdm.identityMap.ECID.0.id`

1. 「**[!UICONTROL 保存]**」を選択します

   ![イベント転送 ECID パス](assets/event-forwarding-ecid.png)

   >[!CAUTION]
   >
   > 必ずを含めてください。 `arc.event.` パスのプレフィックス。 また、XDM オブジェクトフィールド名と同じ大文字と小文字を使用してください。ECID 名前空間はすべて大文字にする必要があります。


   >[!TIP]
   >
   >独自の web サイトで作業する場合、web ブラウザーのネットワークツールを使用して XDM オブジェクトパスを見つけ、フィルタリングできます。 `/ee` リクエスト，ビーコンを開く [!UICONTROL **ペイロード**] 検索する変数にドリルダウンします。 次に、マウスで右クリックして「プロパティパスをコピー」を選択します。 ブラウザ ビューポートの高さの例を次に示します。
   > ![イベント転送 XDM パス](assets/event-forwarding-xdm-path.png)

### Adobe Cloud Connector 拡張機能のインストール

サードパーティの場所にデータを送信するには、まず [!UICONTROL Adobeクラウドコネクタ] 拡張機能。

1. を選択 **[!UICONTROL 拡張機能]** 左側のナビゲーション

1. 「」を選択します **[!UICONTROL カタログ]** タブ

1. を検索 **[!UICONTROL Adobeクラウドコネクタ]**&#x200B;を選択 **[!UICONTROL インストール]**

   ![イベント転送 ECID パス](assets/event-forwarding-adobe-cloud-connector.png)

拡張機能の設定は必要ありません。 この拡張機能を使用すると、Adobe以外のソリューションにデータを転送できるようになりました。

### イベント転送ルールの作成

タグプロパティでルールを設定する場合と、イベント転送プロパティでルールを設定する場合では、主に次の点が異なります。

* **[!UICONTROL イベント] &amp; [!UICONTROL 条件]**:

   * **タグ**：すべてのルールが、ルールで指定する必要があるイベント（例：）によってトリガーされます。 `Library Loaded - Page Top`. 条件はオプションです。
   * **イベントの転送**:Platform Edge Networkに送信されるすべてのイベントがデータを転送するトリガーであると想定します。 したがって、はありません [!UICONTROL イベント] イベント転送ルールで選択する必要があります。 イベント転送ルールをトリガーとするイベントを管理するには、条件を設定する必要があります。

* **データ要素のトークン化**:

   * **タグ**：データ要素名はでトークン化されます `%` ルール内で使用されるデータ要素名の先頭と末尾。 例：`%viewportHeight%`。

   * **イベントの転送**：データ要素名はでトークン化されます `{{` 最初に、および `}}` ルール内で使用される際に、データ要素名の末尾に付加されます。 例：`{{viewportHeight}}`。

* **ルールアクションのシーケンス**:

   * イベント転送ルールのアクション セクションは常に順番に実行されます。 ルールを保存する際は、アクションの順序が正しいことを確認してください。 この実行シーケンスは、タグの場合のように非同期で実行することはできません。

<!--
  * **Tags**: Rule actions can easily be reordered using drag-and-drop functionality.
  * **Event forwarding**: Rule actions are always executed sequentially. Make sure the order of actions is correct when you save a rule.
-->

Webhook にデータを転送するルールを設定するには、まず個人用 Webhook を取得する必要があります。

1. に移動 [Webhook.site](https://webhook.site)

1. 検索 **一意の URL**&#x200B;これをイベント転送ルールの URL リクエストとして使用します

1. を選択 **[!UICONTROL クリップボードにコピー]**

1. Webhook でキャプチャされたイベント転送データをリアルタイムで検証できるので、このウィンドウは開いたままにしておきます

   ![Webhook URL をコピー](assets/event-forwarding-webhook.png)

1. 戻る **[!UICONTROL データ収集]** > **[!UICONTROL イベントの転送]** > **[!UICONTROL ルール]** 左側のナビゲーションから

1. を選択 **[!UICONTROL 新しいルールの作成]**

   ![イベント転送の新しいルール](assets/event-forwarding-new-rules.png)

1. 名前をつける `all events - ad cloud connector - webhook`

1. アクションの追加

1. 次の下 **[!UICONTROL 拡張機能]**&#x200B;を選択 **[!UICONTROL Adobeクラウドコネクタ]**

1. 次の下 **[!UICONTROL アクションタイプ]**&#x200B;を選択 **[!UICONTROL 取得呼び出しを行う]**

1. Webhook URL をに貼り付けます **[!UICONTROL URL]** フィールド

   ![Webhook URL をコピー](assets/event-forwarding-rule.png)

1. 次の下 **[クエリパラメーター]**&#x200B;を選択した場合は、前に作成した両方のデータ要素を追加します。

1. 日 **[!UICONTROL キー]** の列タイプ `viewPortHeight`. 日 **[!UICONTROL 値]** 列、を入力 `{{environment.browserDetails.viewportHeight}}` データ要素：に入力するか、データ要素セレクターアイコンから選択

1. を選択 [!UICONTROL **+さらに追加**] 別のクエリパラメーターを追加するには

1. 日 **[!UICONTROL キー]** の列タイプ `ecid`. 「値」列に、 `{{ecid}}` データ要素

1. を選択 **[!UICONTROL 変更を保持]**

   ![クエリパラメーターを追加](assets/event-forwarding-rule-query-parameter.png)

1. ルールは次のようになります

1. 「**[!UICONTROL 保存]**」を選択します

   ![イベント転送ルールの保存](assets/event-forwarding-rule-save.png)

### ライブラリの作成とビルド

ライブラリを作成し、通常のタグプロパティの場合と同様に、イベント転送の開発環境に対するすべての変更を作成します。

>[!NOTE]
>
>ステージングプロパティと実稼動イベント転送プロパティをデータストリームにリンクしていない場合は、ライブラリを作成する唯一のオプションとして開発環境が表示されます。

![イベント転送ルールの保存](assets/event-forwarding-initial-build.png)

## イベント転送ルールの検証

これで、Platform Debugger と Webhook.site を使用してイベント転送プロパティを検証できます。

1. 次の手順に従います [タグライブラリの切り替え](validate-with-debugger.md#use-the-experience-platform-debugger-to-map-to-your-tag-property) 日 [Luma デモサイト](https://luma.enablementadobe.com/content/luma/us/en/men.html) を、データストリームのイベント転送プロパティのマッピング先の Web SDK タグプロパティに追加します。

1. ページをリロードする前に、Experience Platformーデバッガーでを開きます **[!UICONTROL ログ]** 左側のナビゲーションから

1. 「」を選択します **[!UICONTROL Edge]** tab キーを押してから、 **[!UICONTROL 接続]** platform Edge Networkリクエストを表示するには：

   ![イベント転送 Edge ネットワークセッション](assets/event-forwarding-edge-session.png)

1. ページをリロードします。

1. Platform Edge Networkから WebHook に送信されるサーバーサイドリクエストを可視化する追加のリクエストが表示されます

1. 検証の対象となるリクエストは、Edge ネットワークによって送信される完全に構築された URL を示すものです

   ![イベント転送デバッガー](assets/event-forwarding-debugger.png)


1. viewPortHeight および ecid クエリ文字列パラメーターに注意してください

   ![イベント転送の検証クエリ文字列](assets/event-forwarding-validate-data.png)

1. XDM オブジェクトに表示されるデータと一致します

   ![イベント転送の一致データ](assets/event-forwarding-matching-data.png)

1. 最後に、でデータの一致を検証します。 [Webhook.site](https://webhook.site) また、開いている Webhook ウィンドウを表示します

   ![イベント転送 Webhook サイトデータ](assets/event-forwarding-webhook-data.png)

おめでとうございます。イベント転送が設定されました。

[次へ： ](conclusion.md)

>[!NOTE]
>
>Adobe Experience Platform Web SDK の学習に時間を費やしていただき、ありがとうございます。 ご質問がある場合、一般的なフィードバックを共有したい場合、または将来のコンテンツに関するご提案がある場合は、このページでお知らせください [Experience League コミュニティ ディスカッションの投稿](https://experienceleaguecommunities.adobe.com/t5/adobe-experience-platform-data/tutorial-discussion-implement-adobe-experience-cloud-with-web/td-p/444996)
