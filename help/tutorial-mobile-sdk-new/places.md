---
title: 場所を使用
description: モバイルアプリで Places ジオロケーションサービスを使用する方法について説明します。
hide: true
exl-id: adc2952f-cb01-4e06-9629-49fb95f22ca5
source-git-commit: 4a12f8261cf1fb071bc70b6a04c34f6c16bcce64
workflow-type: tm+mt
source-wordcount: '1692'
ht-degree: 4%

---

# 場所を使用

アプリで Places ジオロケーションサービスを使用する方法について説明します。

Adobe Experience Platform Data Collection Places Service は、位置認識を持つモバイルアプリで位置コンテキストを理解できる位置情報サービスです。 このサービスは、柔軟な目標地点 (POI) データベースに加えて、豊富で使いやすい SDK インターフェイスを使用しています。

## 前提条件

* パッケージの依存関係はすべて、Xcode プロジェクトに配置されます。
* AppDelegate に登録された拡張機能。
* 開発 appId を使用するように MobileCore を設定しました。
* SDK が読み込まれました。
* 上記の変更を含むアプリが正常にビルドされ、実行されました。

## 学習内容

このレッスンでは、次の操作を行います

* Places サービスで目標地点を定義する方法を説明します。
* Places 拡張機能でタグプロパティを更新します。
* スキーマを更新して位置情報イベントをキャプチャします。
* アシュランスで設定を検証します。
* アプリを更新して、Places 拡張機能を登録します。
* アプリに Places サービスから位置情報トラッキングを実装します。


## セットアップ

Places サービスをアプリ内および Mobile SDK 内で動作させるには、いくつかの設定をおこなう必要があります。

### 場所を定義

Places サービスで目標地点を定義します。

1. データ収集 UI で、「 」を選択します。 **[!UICONTROL 場所]**.
1. 選択 ![その他](https://spectrum.adobe.com/static/icons/workflow_18/Smock_MoreSmallList_18_N.svg).
1. コンテキストメニューから、「 」を選択します。 **[!UICONTROL ライブラリを管理]**.
   ![ライブラリの管理](assets/places-manage-libraries.png)
1. Adobe Analytics の **[!UICONTROL ライブラリを管理]** ダイアログ、選択 **[!UICONTROL 新規]**.
1. Adobe Analytics の **[!UICONTROL ライブラリを作成]** ダイアログを入力 **[!UICONTROL 名前]**&#x200B;例： `Luma`.
1. 選択 **[!UICONTROL 確認]**.
   ![ライブラリを作成](assets/places-create-library.png)
1. を閉じるには、以下を実行します。 **[!UICONTROL ライブラリを管理]** ダイアログ、選択 **[!UICONTROL 閉じる]**.
1. 戻る **[!UICONTROL POI 管理]**&#x200B;を選択します。 **[!UICONTROL POI をインポート]**.
1. 選択 **[!UICONTROL 開始]** （内） **[!UICONTROL 場所を読み込み]** ダイアログ。
1. 選択 **[!DNL Luma]** ライブラリのリストから、
1. 「**[!UICONTROL 次へ]**」を選択します。
   ![ライブラリを選択](assets/places-import-select-library.png)
1. をダウンロードします。 [Luma POI ZIP ファイル](assets/luma_pois.csv.zip) コンピュータ上の場所に抽出します。
1. Adobe Analytics の **[!UICONTROL 場所を読み込み]** ダイアログで、抽出した `luma_pois.csv` ～について申し出る **[!UICONTROL CSV ファイルを選択 — ファイルをドラッグ&amp;ドロップします]**. 次のようになります。 **[!UICONTROL 検証成功]** - **[!UICONTROL CSV ファイルが正常に検証されました]**.
1. 選択 **[!UICONTROL 読み込みを開始]**. 次のようになります。 **[!UICONTROL 成功]** - **[!UICONTROL 6 個の新しい POI が正常に追加されました]**.
1. 「**[!UICONTROL 完了]**」を選択します。
1. In **[!UICONTROL POI 管理]**&#x200B;を探すと、6 つの新しい Luma ストアがリストに追加されています。 切り替え可能な ![リスト](https://spectrum.adobe.com/static/icons/workflow_18/Smock_ViewList_18_N.svg) リストと ![マップ](https://spectrum.adobe.com/static/icons/workflow_18/Smock_MapView_18_N.svg) マップビュー。
   ![場所リスト](assets/places-list.png).


### Places 拡張機能のインストール

1. に移動します。 **[!UICONTROL タグ]** モバイルタグプロパティを見つけて、プロパティを開きます。
1. 選択 **[!UICONTROL 拡張機能]**.
1. 選択 **[!UICONTROL カタログ]**.
1. を検索します。 **[!UICONTROL 場所]** 拡張子。
1. 拡張機能のインストール.

   ![判定拡張機能の追加](assets/tag-places-extension.png)

1. Adobe Analytics の **[!UICONTROL 拡張機能のインストール]** ダイアログ：
   1. 選択 **[!DNL Luma]** から **[!UICONTROL ライブラリを選択]** リスト。
   1. 作業用ライブラリが選択されていることを確認します（例： ）。 **[!UICONTROL 初期ビルド]**.
   1. 選択 **[!UICONTROL ライブラリに保存してビルドする]** から **[!UICONTROL ライブラリに保存]**.
      ![Places 拡張機能のインストール](assets/places-install-extension.png).

1. ライブラリが再構築されました。


### スキーマの検証

スキーマが [スキーマを作成](create-schema.md)は、POI および位置情報データを収集するために必要なフィールドグループとクラスを組み込みます。

1. データ収集インターフェイスに移動して、「 」を選択します。 **[!UICONTROL スキーマ]** をクリックします。
1. 選択 **[!UICONTROL 参照]** 上部のバーから。
1. スキーマを選択して開きます。
1. スキーマエディターで、「 」を選択します。 **[!UICONTROL 消費者エクスペリエンスイベント]**.
1. 次のように表示されます。 **[!UICONTROL placeContext]** オブジェクトを、POI の操作と位置情報データを取り込むためのオブジェクトとフィールドで指定します。
   ![スキーマの場所](assets/schema-places-context.png).


### タグプロパティを更新する

タグの Places 拡張機能は、位置情報イベントを監視する機能を提供し、これらのイベントに基づいてアクションをトリガー化できます。 この機能を使用して、アプリケーションに実装する必要のある API コーディングを最小限に抑えることができます。

**データ要素**

最初に複数のデータ要素を作成します。

1. データ収集 UI でタグプロパティに移動します。
1. 選択 **[!UICONTROL データ要素]** をクリックします。
1. 「**[!UICONTROL データ要素を追加]**」を選択します。
1. Adobe Analytics の **[!UICONTROL データ要素を作成]** 画面（例： ） `Name - Entered`.
1. 選択 **[!UICONTROL 場所]** から **[!UICONTROL 拡張]** リスト。
1. 選択 **[!UICONTROL 名前]** から **[!UICONTROL データ要素タイプ]** リスト。
1. 選択 **[!UICONTROL 現在の POI]** underthen **[!UICONTROL TARGET]**.
1. 選択 **[!UICONTROL ライブラリに保存]**.
   ![データ要素](assets/tags-create-data-element.png)

1. 次の表の情報を使用して手順 4 ～ 8 を繰り返し、追加のデータ要素を作成します。

   | 名前 | 拡張機能 | データ要素タイプ | TARGET |
   |---|---|---|---|
   | `Name - Exited` | Places | 名前 | 前回の離脱 POI |
   | `Category - Current` | Places | カテゴリ | 現在の POI |
   | `Category - Exited` | Places | カテゴリ | 前回の離脱 POI |
   | `City - Current` | Places | 市区町村 | 現在の POI |
   | `City - Exited` | Places | 市区町村 | 前回の離脱 POI |

   次のリストのデータ要素が必要です。

   ![データ要素のリスト](assets/tags-data-elements-list.png)

**ルール**

次に、これらのデータ要素を使用するルールを定義します。

1. タグプロパティで、「 」を選択します。 **[!UICONTROL ルール]** をクリックします。
1. 選択 **[!UICONTROL ルールを追加]**.
1. Adobe Analytics の **[!UICONTROL ルールを作成]** 画面で、ルールの名前を入力します。例： `POI - Entry`.
1. 選択 ![追加](https://spectrum.adobe.com/static/icons/workflow_18/Smock_AddCircle_18_N.svg) underthen **[!UICONTROL イベント]**.
   1. 選択 **[!UICONTROL 場所]** から **[!UICONTROL 拡張]** リストと選択 **[!UICONTROL POI を入力]** から **[!UICONTROL イベントタイプ]** リスト。
   1. 「**[!UICONTROL 変更を保持]**」を選択します。
      ![タグイベント](assets/tags-event-mobile-core.png).
1. 選択 ![追加](https://spectrum.adobe.com/static/icons/workflow_18/Smock_AddCircle_18_N.svg) underthen **[!UICONTROL アクション]**.
   1. 選択 **[!UICONTROL Mobile Core]** から **[!UICONTROL 拡張]** リスト、選択 **[!UICONTROL データを添付]** から **[!UICONTROL アクションタイプ]** リスト。 このアクションは、ペイロードデータを添付します。
   1. Adobe Analytics の **[!UICONTROL JSON ペイロード]**、次のペイロードを貼り付けます。

      ```json
      {
          "xdm": {
              "eventType": "location.entry",
              "placeContext": {
                  "geo": {
                      "city": "{%%City - Current%%}"
                  },
                  "POIinteraction": {
                      "poiDetail": {
                          "name": "{%%Name - Current%%}",
                          "category": "{%%Category - Current%%}"
                      },
                      "poiEntries": {
                          "value": 1
                      }
                  }
              }
          }
      }
      ```

      また、 `{%% ... %%}` JSON のデータ要素プレースホルダー値を選択するには、 ![データ](https://spectrum.adobe.com/static/icons/workflow_18/Smock_Data_18_N.svg). ポップアップダイアログでは、作成したデータ要素を選択できます。

   1. 「**[!UICONTROL 変更を保持]**」を選択します。
      ![タグアクション](assets/tags-action-mobile-core.png)

1. 選択 ![追加](https://spectrum.adobe.com/static/icons/workflow_18/Smock_AddCircle_18_N.svg) の横 **[!UICONTROL Mobile Core — データを添付]** アクション。
   1. 選択 **[!UICONTROL Adobe Experience Platform Edge Network]** から **[!UICONTROL 拡張]** リストと選択 **[!UICONTROL イベントを Edge ネットワークに転送する]**. このアクションは、イベントと追加のペイロードデータが Platform Edge ネットワークに確実に転送されるようにします。
   1. 「**[!UICONTROL 変更を保持]**」を選択します。

1. ルールを保存するには、「 **[!UICONTROL ライブラリに保存]**.

   ![規則](assets/tags-rule-poi-entry.png)

別のルールを作成しましょう

1. Adobe Analytics の **[!UICONTROL ルールを作成]** 画面で、ルールの名前を入力します。例： `POI - Exit`.
1. 選択 ![追加](https://spectrum.adobe.com/static/icons/workflow_18/Smock_AddCircle_18_N.svg) underthen **[!UICONTROL イベント]**.
   1. 選択 **[!UICONTROL 場所]** から **[!UICONTROL 拡張]** リストと選択 **[!UICONTROL POI を入力]** から **[!UICONTROL イベントタイプ]** リスト。
   1. 「**[!UICONTROL 変更を保持]**」を選択します。
1. 選択 ![追加](https://spectrum.adobe.com/static/icons/workflow_18/Smock_AddCircle_18_N.svg) underthen **[!UICONTROL アクション]**.
   1. 選択 **[!UICONTROL Mobile Core]** から **[!UICONTROL 拡張]** リスト、選択 **[!UICONTROL データを添付]** から **[!UICONTROL アクションタイプ]** リスト。
   1. Adobe Analytics の **[!UICONTROL JSON ペイロード]**、次のペイロードを貼り付けます。

      ```json
      {
          "xdm": {
              "eventType": "location.exit",
              "placeContext": {
                  "geo": {
                      "city": "{%%City - Exited%%}"
                  },
                  "POIinteraction": {
                      "poiExits": {
                          "value": 1
                      },
                      "poiDetail": {
                          "name": "{%%Name - Exited%%}",
                          "category": "{%%Category - Exited%%}"
                      }
                  }
              }
          }
      }
      ```

   1. 「**[!UICONTROL 変更を保持]**」を選択します。

1. 選択 ![追加](https://spectrum.adobe.com/static/icons/workflow_18/Smock_AddCircle_18_N.svg) の横 **[!UICONTROL Mobile Core — データを添付]** アクション。
   1. 選択 **[!UICONTROL Adobe Experience Platform Edge Network]** から **[!UICONTROL 拡張]** リストと選択 **[!UICONTROL イベントを Edge ネットワークに転送する]**.
   1. 「**[!UICONTROL 変更を保持]**」を選択します。

1. ルールを保存するには、「 **[!UICONTROL ライブラリに保存]**.

   ![規則](assets/tags-rule-poi-exit.png)


タグ内のすべての変更が確実に公開されるようにするには

1. 選択 **[!UICONTROL 初期ビルド]** をビルドするライブラリとして使用します。
1. 選択 **[!UICONTROL ビルド]**.
   ![ライブラリの作成](assets/tags-build-library.png)




## アシュランスでの設定の検証

アシュランスで設定を検証するには、次の手順に従います。

1. Assurance UI に移動します。
1. 左側のパネルでまだ使用できない場合は、「 」を選択します。 **[!UICONTROL 設定]** 左側のパネルで、「 」を選択します。 ![追加](https://spectrum.adobe.com/static/icons/workflow_18/Smock_AddCircle_18_N.svg) 次の **[!UICONTROL イベント]** および **[!UICONTROL マップとシミュレーション]** underthen **[!UICONTROL PLACES SERVICE]**.
1. 「**[!UICONTROL 保存]**」を選択します。
1. 選択 **[!UICONTROL マップとシミュレーション]** をクリックします。
1. マップを POI の 1 つの場所に移動します。
1. 選択 ![ギア](https://spectrum.adobe.com/static/icons/workflow_18/Smock_Gears_18_N.svg) POI の負荷をシミュレートします。 POI は、円とピンを使用して識別されます。
1. POI を選択します。
1. ポップアップから、 ![ギア](https://spectrum.adobe.com/static/icons/workflow_18/Smock_Gears_18_N.svg) **[!UICONTROL エントリイベントをシミュレート]**.
   ![エントリイベントをシミュレート](assets/places-simulate.png)
1. 選択 **[!UICONTROL イベント]** 左側のパネルから、シミュレーションしたイベントが表示されます。
   ![AJO 判定の検証](assets/places-events.png)


## アプリに Places を実装します

前のレッスンで説明したように、モバイルタグ拡張機能のインストールでは設定のみが提供されます。 次に、Places SDK をインストールして登録する必要があります。 これらの手順が明確でない場合は、 [SDK のインストール](install-sdks.md) 」セクションに入力します。

>[!NOTE]
>
>以下を完了した場合、 [SDK のインストール](install-sdks.md) 」セクションに移動した場合は、Places SDK が既にインストールされているので、この手順をスキップできます。
>

1. Xcode で、 [AEP Places](https://github.com/adobe/aepsdk-places-ios) は、パッケージの依存関係にパッケージのリストに追加されます。 詳しくは、 [Swift Package Manager](install-sdks.md#swift-package-manager).
1. に移動します。 **[!DNL Luma]** > **[!DNL Luma]** > **[!DNL AppDelegate]** 」をクリックします。
1. 確認 `AEPPlaces` は、インポートのリストの一部です。

   ```swift
   import AEPPlaces
   ```

1. 確認 `Places.self` は、登録する拡張機能の配列の一部です。

   ```swift
   let extensions = [
       AEPIdentity.Identity.self,
       Lifecycle.self,
       Signal.self,
       Edge.self,
       AEPEdgeIdentity.Identity.self,
       Consent.self,
       UserProfile.self,
       Places.self,
       Messaging.self,
       Optimize.self,
       Assurance.self
   ]
   ```

1. に移動します。 **[!DNL Luma]** > **[!DNL Luma]** > **[!DNL Utils]** > **[!UICONTROL MobileSDK]** Xcode プロジェクトナビゲーターで、 `func processRegionEvent(regionEvent: PlacesRegionEvent, forRegion region: CLRegion) async` 関数に置き換えます。 次のコードを追加します。

   ```swift
   // Process geolocation event
   Places.processRegionEvent(regionEvent, forRegion: region)
   ```

   この [`Places.processRegionEvent`](https://developer.adobe.com/client-sdks/documentation/places/api-reference/#processregionevent) API は、位置情報を Places サービスに通信します。

1. に移動します。 **[!DNL Luma]** > **[!DNL Luma]** > **[!DNL Views]** > **[!DNL Location]** > **[!DNL GeofenceSheet]** Xcode のプロジェクトナビゲーター内。

   1. 「入力」ボタンに、次のコードを入力します。

   ```swift
   // Simulate geofence entry event
   Task {
       await MobileSDK.shared.processRegionEvent(regionEvent: .entry, forRegion: region)
   }
   ```

   1. 「終了」ボタンに、次のコードを入力します。

   ```swift
   // Simulate geofence exit event
   Task {
       await MobileSDK.shared.processRegionEvent(regionEvent: .exit, forRegion: region)
   }
   ```

## アプリを使用した検証

1. デバイスまたはシミュレーターでアプリを開きます。

1. 次に移動： **[!UICONTROL 場所]** タブをクリックします。

1. マップを移動（ドラッグ）して、青い中央の円が POI の 1 つ（例：ロンドン）の上にあることを確認します。

1. タップ <img src="assets/geobutton.png" width="20" /> カテゴリと名前が、ピン付きの赤い位置のラベルに表示されるまでです。

1. POI のラベルをタップすると、 **[!UICONTROL 近くの POI]** シート。

   <img src="assets/appgeolocation.png" width="300" />

1. を押します。 **[!UICONTROL 入口]** または **[!UICONTROL 終了]** ボタンを使用して、アプリからのジオフェンスエントリおよびジオフェンスの終了イベントをシミュレートします。

   <img src="assets/appentryexit.png" width="300" />

1. Assurance UI にイベントが表示されます。



## 次の手順

これで、アプリ内の位置情報機能に機能を追加するためのすべてのツールが用意できました。 イベントを Edge ネットワークに転送したとき、アプリを次のように設定したら、 [Experience Platform](platform.md)に設定すると、アプリで使用されているプロファイルに対してエクスペリエンスイベントが表示されます。

このチュートリアルのJourney Optimizerの節では、エクスペリエンスイベントを使用してジャーニーをトリガー化できます ( [プッシュ通知](journey-optimizer-inapp.md) および [アプリ内メッセージ](journey-optimizer-push.md) (Journey Optimizer))。 例えば、アプリユーザーが物理ストアのジオフェンスに入ったときに、製品プロモーションを含むプッシュ通知をアプリユーザーに送信する通常の例です。

アプリの機能の実装は、主に Places サービス、タグプロパティで定義したデータ要素およびルールによって実行されています。 そのため、アプリ内のコードを最小限に抑えます。 または、 [`Edge.sendEvent`](https://developer.adobe.com/client-sdks/documentation/edge-network/api-reference/#sendevent) API( [イベント](events.md) （詳しくは、を参照）、 `placeContext` オブジェクト。

>[!SUCCESS]
>
>これで、Experience PlatformMobile SDK の Places 拡張機能を使用して、アプリの位置情報サービスを有効にしました。
>
>Adobe Experience Platform Mobile SDK の学習に時間を割いていただき、ありがとうございます。 ご質問がある場合、一般的なフィードバックを共有する場合、または今後のコンテンツに関する提案がある場合は、このドキュメントで共有します [Experience Leagueコミュニティディスカッション投稿](https://experienceleaguecommunities.adobe.com/t5/adobe-experience-platform-data/tutorial-discussion-implement-adobe-experience-cloud-in-mobile/td-p/443796).

次へ： **[データをAdobe Analyticsにマッピング](analytics.md)**
