---
title: Platform Web SDK を使用したAdobe Experience Platformへのデータのストリーミング
description: Web SDK を使用して web データをAdobe Experience Platformにストリーミングする方法を説明します。 このレッスンは、「Web SDK を使用した Adobe Experience Cloud 実装のチュートリアル」の一部です。
jira: KT-15407
exl-id: 4d749ffa-e1c0-4498-9b12-12949807b369
source-git-commit: a8431137e0551d1135763138da3ca262cb4bc4ee
workflow-type: tm+mt
source-wordcount: '2107'
ht-degree: 7%

---

# Web SDK を使用したExperience Platformへのデータのストリーミング

Platform Web SDK を使用して Adobe Experience Platform に web データをストリーミングする方法について説明します。

Experience Platformは、Adobe Real-time Customer Data Platform、Adobe Customer Journey Analytics、Adobe Journey Optimizerなど、すべての新しいExperience Cloudアプリケーションのバックボーンです。 これらのアプリケーションは、web データ収集の最適な方法として Platform Web SDK を使用するように設計されています。

![Web SDK とAdobe Experience Platformの図](assets/dc-websdk-aep.png)

Experience Platformは、以前に作成したのと同じ XDM スキーマを使用して、Luma web サイトからイベントデータを取得します。 そのデータが Platform Edge Networkに送信されると、データストリーム設定はデータをExperience Platformに転送できます。

## 学習目標

このレッスンを最後まで学習すると、以下の内容を習得できます。

* Adobe Experience Platform内でのデータセットの作成
* Web SDK データをAdobe Experience Platformに送信するようにデータストリームを設定します
* リアルタイム顧客プロファイル用のストリーミング web データを有効にする
* データが Platform データセットとリアルタイム顧客プロファイルの両方に到達したことを検証します
* Platform へのサンプルロイヤルティプログラムデータの取り込み
* シンプルな Platform オーディエンスの作成

## 前提条件

このレッスンを完了するには、まず次の操作を行う必要があります。

* Real-time Customer Data Platform、Journey Optimizer、Customer Journey AnalyticsなどのAdobe Experience Platform アプリケーションにアクセスできる
* このチュートリアルの初期設定とタグの設定の節で前のレッスンを完了します。

>[!NOTE]
>
>Platform アプリケーションがない場合は、このレッスンをスキップするか、先に読み進めることができます。

## データセットの作成

Adobe Experience Platformに正常に取り込まれたすべてのデータは、データレイク内にデータセットとして保持されます。 A [データセット](https://experienceleague.adobe.com/ja/docs/experience-platform/catalog/datasets/overview) は、データのコレクション用のストレージおよび管理構成体で、通常は、スキーマ（列）とフィールド（行）を含むテーブルです。 データセットには、保存するデータの様々な側面を記述したメタデータも含まれます。

Luma web イベントデータのデータセットを設定しましょう。


1. に移動します [Experience Platform](https://experience.adobe.com/platform/) または [Journey Optimizer](https://experience.adobe.com/journey-optimizer/) インターフェイス
1. このチュートリアルに使用する開発用サンドボックスに属していることを確認します
1. 開く **[!UICONTROL データ管理/ データセット]** 左側のナビゲーションから
1. を選択 **[!UICONTROL データセットを作成]**

   ![スキーマを作成](assets/experience-platform-create-dataset.png)

1. 「」を選択します **[!UICONTROL スキーマからのデータセットの作成]** オプション

   ![スキーマからのデータセットの作成](assets/experience-platform-create-dataset-schema.png)

1. 「」を選択します `Luma Web Event Data` で作成されたスキーマ [以前のレッスン](configure-schemas.md) を選択してから、 **[!UICONTROL 次]**

   ![データセット、スキーマを選択](assets/experience-platform-create-dataset-schema-selection.png)

1. を指定 **[!UICONTROL 名前]** およびオプション **[!UICONTROL 説明]** （データセット用）。 この演習では、を使用します `Luma Web Event Data`を選択してから、 **[!UICONTROL 終了]**

   ![データセット名 ](assets/experience-platform-create-dataset-schema-name.png)

これで、Platform Web SDK 実装からデータの収集を開始するようにデータセットが設定されました。

## データストリームの設定

次に、を設定できます [!UICONTROL データストリーム] にデータを送信する [!UICONTROL Adobe Experience Platform]. データストリームは、タグプロパティ、Platform Edge Network、Experience Platformデータセットの間のリンクです。

1. を開きます [データ収集](https://experience.adobe.com/#/data-collection){target="blank"} インターフェイス
1. を選択 **[!UICONTROL データストリーム]** 左側のナビゲーションから
1. で作成したデータストリームを開きます。 [データストリームの設定](configure-datastream.md) レッスン、 `Luma Web SDK`

   ![Luma Web SDK データストリームを選択](assets/datastream-luma-web-sdk-development.png)

1. を選択 **[!UICONTROL サービスを追加]**
   ![データストリームへのサービスの追加](assets/experience-platform-addService.png)
1. を選択 **[!UICONTROL Adobe Experience Platform]** as the **[!UICONTROL サービス]**
1. を選択 `Luma Web Event Data` as the **[!UICONTROL イベントデータセット]**

1. 「**[!UICONTROL 保存]**」を選択します。

   ![データストリーム設定](assets/experience-platform-datastream-config.png)

でトラフィックを生成する場合 [Luma デモサイト](https://luma.enablementadobe.com/content/luma/us/en.html) タグプロパティにマッピングされたデータが、Experience Platformのデータセットに入力されます。

## データセットの検証

この手順は、データがデータセットに取り込まれていることを確認するために重要です。 データセットに送信されたデータの検証には、2 つの側面があります。

* を使用した検証 [!UICONTROL Experience Platformデバッガー]
* を使用した検証 [!UICONTROL データセットをプレビュー]
* を使用した検証 [!UICONTROL クエリサービス]

### Experience Platform Debugger

これらの手順は、での手順と多少異なります [デバッガレッスン](validate-with-debugger.md). ただし、データはデータストリームで有効にした後にのみ Platform に送信されるので、さらにサンプルデータを生成する必要があります。

1. を開きます [Luma デモサイト](https://luma.enablementadobe.com/content/luma/us/en.html) を選択し、 [!UICONTROL Experience Platformデバッガー] 拡張機能アイコン

1. タグプロパティをマッピングするようにデバッガーを設定します。 *あなたの* 開発環境（「」を参照） [デバッガーでの検証](validate-with-debugger.md) レッスン

   ![デバッガーに表示される Launch 開発環境](assets/experience-platform-debugger-dev.png)

1. 資格情報（`test@adobe.com`／`test`）を使用して Luma サイトにログインします。

1. [Luma のホームページ](https://luma.enablementadobe.com/content/luma/us/en.html)に戻ります。

1. デバッガーによって表示される Platform Web SDK ネットワークビーコン内で、「イベント」行を選択してポップアップで詳細を展開します

   ![デバッガーの Web SDK](assets/experience-platform-debugger-dev-eventType.png)

1. ポップアップ内で「identityMap」を検索します。 authenticatedState、id、および primary の 3 つのキーを持つ lumaCrmId が表示されます
   ![デバッガーの Web SDK](assets/experience-platform-debugger-dev-idMap.png)

これで、にデータを入力する必要があります `Luma Web Event Data` データセットで、「データセットをプレビュー」検証の準備が整いました。

### データセットのプレビュー

データが Platform のデータレイクに到達したことを確認するには、を使用する簡単なオプションがあります **[!UICONTROL データセットをプレビュー]** 機能 Web SDK データは、データレイクにマイクロバッチされ、Platform インターフェイスで定期的に更新されます。 生成したデータが表示されるまで、10～15 分かかる場合があります。

1. が含まれる [Experience Platform](https://experience.adobe.com/platform/) インタフェース、選択 **[!UICONTROL データ管理/ データセット]** 左側のナビゲーションでを開きます **[!UICONTROL データセット]** ダッシュボード。

   ダッシュボードリストは、組織で使用可能なすべてのデータセットを管理します。リストに表示された各データセットに関する詳細（名前、データセットが適用されるスキーマ、最新の取得実行のステータスなど）が表示されます。

1. を選択 `Luma Web Event Data` データセットを開いて **[!UICONTROL データセットアクティビティ]** 画面。

   ![データセット Luma Web イベント](assets/experience-platform-dataset-validation-lumaSDK.png)

   アクティビティ画面には、消費されるメッセージの割合を視覚化したグラフと、成功および失敗したバッチのリストが含まれます。

1. から **[!UICONTROL データセットアクティビティ]** 画面、選択 **[!UICONTROL データセットをプレビュー]** 画面の右上隅付近で、最大 100 行のデータをプレビューできます。 データセットが空の場合、プレビューリンクは非アクティブになります。

   ![データセットプレビュー](assets/experience-platform-dataset-preview.png)

   プレビューウィンドウの右側に、データセットのスキーマの階層表示が表示されます。

   ![データセットプレビュー 1](assets/experience-platform-dataset-preview-1.png)


### データのクエリ

1. が含まれる [Experience Platform](https://experience.adobe.com/platform/) インタフェース、選択 **[!UICONTROL データ管理 > Queroes]** 左側のナビゲーションでを開きます **[!UICONTROL クエリ]** 画面。
1. を選択 **[!UICONTROL クエリを作成]**
1. まず、クエリを実行して、データレイク内のテーブルのすべての名前を表示します。 Enter `SHOW TABLES` クエリエディターで、再生アイコンをクリックしてクエリを実行します。
1. 結果で、テーブルの名前が次のようになります `luma_web_event_data`
1. 次に、テーブルを参照する単純なクエリでテーブルをクエリします（デフォルトでは、クエリは 100 件の結果に制限されます）。 `SELECT * FROM "luma_web_event_data"`
1. しばらくすると、web データのサンプルレコードが表示されます。

>[!ERROR]
>
>「テーブルがプロビジョニングされていません」というエラーが発生した場合は、テーブルの名前を再度確認します。 また、データのマイクロバッチがまだデータレイクに到達していない可能性もあります。 10～15 分後にもう一度試してください。

>[!INFO]
>
>  Adobe Experience Platformのクエリサービスについて詳しくは、 [データの調査](https://experienceleague.adobe.com/en/docs/platform-learn/tutorials/queries/explore-data) を参照してください。


## リアルタイム顧客プロファイルのデータセットとスキーマを有効にする

Real-time Customer Data PlatformおよびJourney Optimizerのお客様に対して、次の手順では、リアルタイム顧客プロファイルのデータセットとスキーマを有効にします。 Web SDK からのデータストリーミングは、Platform に流入する多数のデータソースの 1 つになり、web データを他のデータソースと結合して 360 度の顧客プロファイルを作成する必要があります。 リアルタイム顧客プロファイルについて詳しくは、次の短いビデオをご覧ください。

>[!VIDEO](https://video.tv.adobe.com/v/27251?learn=on&captions=eng)

>[!CAUTION]
>
>独自の web サイトとデータを操作する場合は、リアルタイム顧客プロファイルに対してデータを有効にする前に、データのより堅牢な検証をお勧めします。


**データセットを有効にするには：**

1. 作成したデータセットを開きます。 `Luma Web Event Data`

1. 「」を選択します **[!UICONTROL プロファイルの切り替え]** 電源を入れる

   ![プロファイルの切り替え](assets/setup-experience-platform-profile.png)

1. 次の操作を確認します **[!UICONTROL Enable （有効）]** データセット

   ![プロファイルの有効化切り替え](assets/setup-experience-platform-profile-enable.png)

**スキーマを有効にするには：**

1. 作成したスキーマを開きます。 `Luma Web Event Data`

1. 「」を選択します **[!UICONTROL プロファイルの切り替え]** 電源を入れる

   ![プロファイルの切り替え](assets/setup-experience-platform-profile-schema.png)

1. を選択 **[!UICONTROL このスキーマのデータには、identityMap フィールドにプライマリ ID が含まれます。]**

   >[!IMPORTANT]
   >
   >    リアルタイムプライマリプロファイルに送信されるすべてのレコードに顧客 ID が必要です。 通常、ID フィールドは、スキーマ内でラベル付けされます。 ただし、ID マップを使用する場合、ID フィールドはスキーマ内に表示されません。 このダイアログは、プライマリ ID を念頭に置いており、データの送信時に ID マップでプライマリ ID を指定することを確認するためのものです。 ご存知のように、Web SDK は、Experience CloudID （ECID）をデフォルトのプライマリ ID として使用し、認証済み ID を利用可能な場合はプライマリ ID として使用する ID マップを使用します。


1. を選択 **[!UICONTROL Enable （有効）]**

   ![プロファイルの有効化切り替え](assets/setup-experience-platform-profile-schema-enable.png)

1. を選択 **[!UICONTROL 保存]** 更新したスキーマを保存するには、次の手順を実行します

これで、プロファイルに対してスキーマも有効になります。

>[!IMPORTANT]
>
>    プロファイルに対してスキーマを有効にすると、サンドボックス全体をリセットまたは削除しない限り、スキーマを無効または削除することはできません。 また、この時点より後にフィールドをスキーマから削除することはできません。
>
>   
> 独自のデータを操作する場合は、次の順序で作業を行うことをお勧めします。
> 
> * まず、データセットにデータを取り込みます。
> * データ取り込みプロセス中に発生した問題（データの検証やマッピングの問題など）に対処します。
> * プロファイル用のデータセットとスキーマの有効化
> * 必要に応じて、データを再度取り込みます。


### プロファイルの検証

Platform インターフェイス（またはJourney Optimizer インターフェイス）で顧客プロファイルを検索して、データがリアルタイム顧客プロファイルに到達したことを確認できます。 名前が示すように、プロファイルはリアルタイムで入力されるため、データセット内のデータの検証のように遅延はありません。

最初に、サンプルデータをさらに生成する必要があります。 このレッスンの前の手順を繰り返し、タグプロパティにマッピングされたときに Luma web サイトにログインします。 Platform Web SDK リクエストをInspectして、でデータが送信されることを確認します。 `lumaCRMId`.

1. が含まれる [Experience Platform](https://experience.adobe.com/platform/) インタフェース、選択 **[!UICONTROL 顧客]** > **[!UICONTROL プロファイル]** 左側のナビゲーションで

1. として **[!UICONTROL ID 名前空間]** use `lumaCRMId`
1. の値をコピー&amp;ペースト `lumaCRMId` Experience Platformデバッガーで調べた呼び出しで渡されます（ここでは）。 `112ca06ed53d3db37e4cea49cc45b71e`.

   ![プロファイル](assets/experience-platform-validate-dataset-profile.png)

1. プロファイルに有効な値がある場合： `lumaCRMId`プロファイル ID がコンソールに入力されます。

   ![プロファイル](assets/experience-platform-validate-dataset-profile-set.png)

1. 完全な **[!UICONTROL 顧客プロファイル]** 各 ID に対して、 **[!UICONTROL プロファイル ID]** メインウィンドウで。

   >[!NOTE]
   >
   >プロファイル ID のハイパーリンクを選択できます。行を選択すると、右側のメニューが開き、プロファイル ID のハイパーリンクを選択できます
   > ![顧客プロファイル](assets/experience-platform-select-profileId.png)

   ここでは、にリンクされているすべての ID を確認できます `lumaCRMId`、例： `ECID`.

   ![顧客プロファイル](assets/experience-platform-validate-dataset-custProfile.png)

これで、Experience Platform（およびReal-Time CDPの Platform Web SDK が有効になりました。 Journey Optimizer! とCustomer Journey Analytics!）。

### ロイヤルティスキーマの作成とサンプルデータの取り込み

この演習は、Real-time Customer Data PlatformおよびJourney Optimizerのお客様が修了すると想定されています。

Web SDK データを Platform に取り込むと、Adobe Experience Platformに取り込んだ他のデータソースによってデータを強化できます。 例えば、ユーザーが Luma サイトにログインすると、ID グラフがExperience Platformに作成され、他のすべてのプロファイル対応データセットを結合してリアルタイム顧客プロファイルを作成できる場合があります。 これを実際に確認するには、サンプルのロイヤルティデータを含む別のデータセットをAdobe Experience Platformですばやく作成して、Real-time Customer Data PlatformとJourney Optimizerでリアルタイム顧客プロファイルを使用できるようにします。 あなたはすでに同様の演習をしたので、指示は簡単になります。

ロイヤルティスキーマを作成します。

1. 新しいスキーマの作成
1. を選択 **[!UICONTROL 個人プロファイル]** as the [!UICONTROL 基本クラス]
1. スキーマに名前を付ける `Luma Loyalty Schema`
1. を追加 [!UICONTROL ロイヤルティの詳細] フィールドグループ
1. を追加 [!UICONTROL 人口統計の詳細] フィールドグループ
1. 「」を選択します `Person ID` フィールドに入力し、 [!UICONTROL ID] および [!UICONTROL プライマリ ID] の使用 `Luma CRM Id` [!UICONTROL ID 名前空間].
1. のスキーマを有効にする [!UICONTROL Profile]. 「プロファイル」切替スイッチが見つからない場合は、左上のスキーマ名をクリックしてみてください。
1. スキーマの保存

   ![ロイヤルティスキーマ](assets/web-channel-loyalty-schema.png)

データセットを作成してサンプルデータを取り込むには：

1. から新しいデータセットを作成 `Luma Loyalty Schema`
1. データセットに名前を付ける `Luma Loyalty Dataset`
1. のデータセットを有効にする [!UICONTROL Profile]
1. サンプルファイルをダウンロードします。 [luma-loyalty-forWeb.json](assets/luma-loyalty-forWeb.json)
1. ファイルをデータセットにドラッグ&amp;ドロップします
1. データが正常に取り込まれていることを確認します

   ![ロイヤルティスキーマ](assets/web-channel-loyalty-dataset.png)

### オーディエンスの作成

オーディエンスは、プロファイルを共通の特性に基づいてグループ化します。 Web キャンペーンで使用できるクイックオーディエンスを作成します。

1. Experience PlatformまたはJourney Optimizerのインターフェイスで、に移動します。 **[!UICONTROL 顧客]** > **[!UICONTROL オーディエンス]** 左側のナビゲーションで
1. を選択 **[!UICONTROL オーディエンスを作成]**
1. を選択 **[!UICONTROL ルールを作成]**
1. を選択 **[!UICONTROL 作成]**

   ![オーディエンスの作成](assets/web-campaign-create-audience.png)

1. を選択 **[!UICONTROL 属性]**
1. の検索 **[!UICONTROL ロイヤルティ]** > **[!UICONTROL 層]** フィールドにドラッグし、 **[!UICONTROL 属性]** セクション
1. オーディエンスを次のユーザーとして定義 `tier` 等しい `gold`
1. オーディエンスに名前を付ける `Luma Loyalty Rewards – Gold Status`
1. を選択 **[!UICONTROL Edge]** as the **[!UICONTROL 評価方法]**
1. を選択 **[!UICONTROL 保存]**

   ![オーディエンスの定義](assets/web-campaign-define-audience.png)

これは非常に単純なオーディエンスなので、エッジ評価方法を使用できます。 エッジオーディエンスはエッジで評価されるので、Web SDK が Platform 定義に対して行うのと同じリクエストで、オーディエンスEdge Networkを評価し、ユーザーが適格かどうかを直ちに確認できます。


[次へ： ](setup-analytics.md)

>[!NOTE]
>
>Adobe Experience Platform Web SDK の学習に時間を費やしていただき、ありがとうございます。 ご質問がある場合、一般的なフィードバックを共有したい場合、または将来のコンテンツに関するご提案がある場合は、このページでお知らせください [Experience League コミュニティ ディスカッションの投稿](https://experienceleaguecommunities.adobe.com/t5/adobe-experience-platform-data/tutorial-discussion-implement-adobe-experience-cloud-with-web/td-p/444996)
