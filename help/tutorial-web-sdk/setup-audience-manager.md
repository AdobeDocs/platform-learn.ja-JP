---
title: Platform Web SDK でのAudience Managerの設定
description: Platform Web SDK を使用してAdobe Audience Managerを設定し、Cookie の宛先を使用して実装を検証する方法について説明します。 このレッスンは、「 Adobe Experience Cloudと Web SDK の実装」チュートリアルの一部です。
solution: Data Collection, Audience Manager
exl-id: 45db48e9-73cf-4a9c-88f4-b5872a8224d3
source-git-commit: cc7a77c4dd380ae1bc23dc75608e8e2224dfe78c
workflow-type: tm+mt
source-wordcount: '1388'
ht-degree: 4%

---

# Platform Web SDK でのAudience Managerの設定

Platform Web SDK を使用してAdobe Audience Managerを設定し、Cookie の宛先を使用して実装を検証する方法について説明します。

[Adobe Audience Manager](https://experienceleague.adobe.com/docs/audience-manager.html) は、サイト訪問者に関する商業的に関連性のある情報を収集し、マーケティング可能なセグメントを作成し、ターゲットを絞った広告やコンテンツを適切なオーディエンスに提供するために必要なあらゆる情報を提供するAdobe Experience Cloudソリューションです。


## 学習内容

このレッスンを最後まで学習すると、以下の内容を習得できます。

* データストリームを設定してAudience Managerを有効にする
* Audience Managerでの Cookie の宛先の有効化
* Adobe Experience Platform Debugger でAudience Managerの選定を確認して、オーディエンスの実装を検証します

## 前提条件

このレッスンを完了するには、まず次の手順を実行する必要があります。

* このチュートリアルの「初期設定」および「タグの設定」節の前のレッスンを完了していること。
* Adobe Audience Managerへのアクセス権と、特性、セグメントおよび宛先の作成、読み取り、書き込みをおこなうための適切な権限を持っています。 詳しくは、 [Audience Managerの役割に基づくアクセス制御](https://experienceleague.adobe.com/docs/audience-manager-learn/tutorials/setup-and-admin/user-management/setting-permissions-with-role-based-access-control.html?lang=en).

## データストリームの設定

Platform Web SDK を使用したAudience Manager実装は、 [サーバー側転送 (SSF)](https://experienceleague.adobe.com/docs/analytics/admin/admin-tools/server-side-forwarding/ssf.html?lang=ja). サーバー側転送は、Adobe AnalyticsリクエストデータをAudience Managerに渡します。 Platform Web SDK の実装は、Platform Edge Network に送信された XDM データをAudience Managerに渡します。 Audience Managerは datastream で有効になっています。

1. に移動します。 [データ収集](https://experience.adobe.com/#/data-collection){target=&quot;blank&quot;} インターフェイス
1. 左側のナビゲーションで、「 **[!UICONTROL データストリーム]**
1. 以前に作成したを選択 `Luma Web SDK` datastream

   ![Luma Web SDK データストリームを選択します。](assets/datastream-luma-web-sdk.png)

1. 選択 **[!UICONTROL サービスを追加]**

   ![データストリームにサービスを追加する](assets/aam-datastream-addService.png)
1. 選択 **[!UICONTROL Adobe Audience Manager]** を **[!UICONTROL サービス]**
1. 確認 **[!UICONTROL Cookie の宛先が有効になっています]** および **[!UICONTROL URL の宛先が有効になっています]** が選択されています
1. 選択 **[!UICONTROL 保存]**

   ![Audience Managerデータストリーム設定を確認し、保存します。](assets/aam-datastream-save.png)

## データソースの作成

次に、 [データソース](https://experienceleague.adobe.com/docs/audience-manager/user-guide/features/data-sources/datasources-list-and-settings.html?lang=ja)を使用すると、Audience Manager内のデータを整理するための基本的なツールです。

1. 次に移動： [Audience Manager](https://experience.adobe.com/#/audience-manager/) インターフェイス
1. 選択 **[!UICONTROL オーディエンスデータ]** 上部ナビゲーションから
1. を選択します。 **[!UICONTROL データソース]** ドロップダウンメニューから
1. を選択します。 **[!UICONTROL 新規追加]** ボタンをクリックします。

   ![Adobe Experience PlatformAudience Managerデータソース](assets/data-sources-list.jpg)

1. データソースにわかりやすい名前と説明を付けます。 初期設定では、この名前を`Platform Web SDK tutorial`.
1. 設定 **[!UICONTROL ID Type]** から **[!UICONTROL Cookie]**
1. 内 **[!UICONTROL データ書き出しコントロール]** セクション、選択 **[!UICONTROL 制限なし]**

   ![Adobe Experience PlatformAudience Managerデータソースの設定](assets/data-source-details.png)

1. **[!UICONTROL 保存]** データソース


## 特性の作成

データソースを保存したら、 [trait](https://experienceleague.adobe.com/docs/audience-manager/user-guide/features/traits/traits-overview.html?lang=ja). 特性は、Audience Manager内の 1 つ以上のシグナルの組み合わせです。 ホームページ訪問者用の特性を作成します。

>[!NOTE]
>
>データストリームで有効になっている場合、すべての XDM データがAudience Managerに送信されますが、未使用シグナルレポートで使用できるようになるまで、データには 24 時間かかる場合があります。 この演習で説明するように、Audience Managerですぐに使用する XDM データの明示的な特性を作成します。

1. 選択 **[!UICONTROL オーディエンスデータ]** >  **[!UICONTROL 特性]**
1. 選択 **[!UICONTROL 新規追加]** >  **[!UICONTROL ルールベース]** trait

   ![Adobe Experience PlatformAudience Managerルールベースの特性](assets/rule-based-trait.jpg)

1. 特性のわかりやすい名前と説明を入力します。 `Luma homepage view`
1. を選択します。 **[!UICONTROL データソース]** 前の節で作成した内容。
1. **[!UICONTROL フォルダーを選択]** 右側のパネルに特性を保存する場所です。 次の方法でフォルダーを作成できます。 **「+」アイコンの選択** 既存の親フォルダーの横に表示されます。 この新しいフォルダーに名前を付けることができます `Platform Web SDK tutorial`.
1. を展開します。 **[!UICONTROL 特性式]** キャレットと選択 **[!UICONTROL 式ビルダー]** ホームページの訪問を示すキー値ペアを指定する必要があります。
1. を開きます。 [Luma のホームページ](https://luma.enablementadobe.com/content/luma/us/en.html) （タグプロパティにマッピング）および **Platform Web SDK Debugger** ページを更新します。
1. Platform Web SDK のネットワークリクエストとイベントの詳細を確認して、ホームページのキーと名前の値を見つけます。
   ![Adobe Experience PlatformAudience ManagerXDM データ](assets/xdm-keyvalue.jpg)
1. Audience ManagerUI の式ビルダーに戻り、キーに「 」と入力します。 **`web.webPageDetails.name`** そして、 **`content:luma:us:en`**. この手順により、ホームページを読み込むたびに特性を実行できます。
1. **[!UICONTROL 保存]** 特性。


## セグメントの作成

次に、 **セグメント**&#x200B;をクリックし、新しく定義した特性をこのセグメントに割り当てます。

1. 選択 **[!UICONTROL オーディエンスデータ]** 上部のナビゲーションで「 」を選択し、 **[!UICONTROL セグメント]**
1. 選択 **[!UICONTROL 新規追加]** （ページの左上）をクリックして、セグメントビルダーを開きます。
1. セグメントにわかりやすい名前と説明（例： ）を付けます。 `Platform Web SDK - Homepage visitors`
1. **[!UICONTROL フォルダーを選択]** セグメントが保存される場所を右側のパネルに示します。 次の方法でフォルダーを作成できます。 **「+」アイコンの選択** 既存の親フォルダーの横に表示されます。 この新しいフォルダーに名前を付けることができます `Platform Web SDK tutorial`.
1. 統合コードを追加します。この場合は、乱数セットです。 1. **[!UICONTROL データソース]** セクション、選択 **[!UICONTROL Audience Manager]** および前に作成したデータソース
1. を展開します。 **[!UICONTROL 特性]** セクションで、作成した特性を検索します。
1. 選択 **[!UICONTROL 特性を追加]**.
1. 選択 **[!UICONTROL 保存]** ページの下部に

   ![Adobe Experience PlatformAudience Manager特性の追加](assets/add-trait-segment.jpg)

   ![Adobe Experience PlatformAudience Manager特性の追加](assets/saved-segment.jpg)

## 宛先の作成

次に、 **Cookie ベースの宛先** の使用 **宛先ビルダー**. Destination Builder を使用すると、Cookie、URL、サーバー間の各宛先を作成および管理できます。

1. 次を選択して Destination Builder を開く **[!UICONTROL 宛先]** 内 **オーディエンスデータ** 上部のナビゲーションのメニュー
1. 選択 **[!UICONTROL 宛先を作成]**
1. 名前と説明を入力します。 `Platform Web SDK tutorial`
1. を **[!UICONTROL カテゴリ]**&#x200B;を選択します。 **[!UICONTROL カスタム]**
1. を **[!UICONTROL タイプ]**&#x200B;を選択します。 **[!UICONTROL Cookie]**

   ![Adobe Experience PlatformAudience Manager特性の追加](assets/destination-settings.jpg)

1. を開きます。 **[!UICONTROL 設定]** セクションを使用して、Cookie の宛先に関する詳細を入力します。
1. cookie にわかりやすい名前を付けます。 `platform_web_sdk_tutorial`
1. を **[!UICONTROL Cookie ドメイン]**、統合を計画しているサイトのドメインを追加します。このチュートリアルでは、Luma ドメインを入力します。 `luma.enablementadobe.com`
1. を **[!UICONTROL にデータを公開]** オプション、選択 **[!UICONTROL 選択したドメインのみ]**
1. ドメインを選択します（まだ追加されていない場合）
1. を **[!UICONTROL データフォーマット]**&#x200B;を選択します。 **[!UICONTROL 単一キー]** クッキーに鍵を渡してください。 このチュートリアルでは、 `segment` をキー値として使用します。
1. 最後に、 **[!UICONTROL 保存]** をクリックして、宛先の設定の詳細を保存します。

   ![Audience Managerの宛先の設定セクション](assets/aam-destination-config-dw.png)

<!--
   ![Adobe Experience Platform Audience Manager Add Trait](assets/aam-destination-config.jpg)


   ![Adobe Experience Platform Audience Manager Add Trait](assets/cookie-destination-config.jpg)
-->

1. 内 **[!UICONTROL Segment Mappings]** セクションで、 **[!UICONTROL セグメントの検索と追加]** 以前に作成した `Platform Web SDK - Homepage visitors` を選択し、 **[!UICONTROL 追加]**.


1. セグメントを追加すると、ポップアップが開き、Cookie に期待される値を指定する必要があります。 この演習では、値&quot;hpvisitor&quot;を入力します。

1. 選択 **[!UICONTROL 保存]**

1. 選択 **[!UICONTROL 完了]**

   ![Adobe Experience PlatformAudience Manager特性の追加](assets/luma-cookie-segment-dw.png)

セグメントマッピング期間を有効にするには、数時間かかります。 完了したら、Audience Managerインターフェイスを更新し、 **マッピングされたセグメント** リストが更新されました。

## セグメントの検証

セグメントの初期作成から数時間後に、セグメントが正しく動作していることを検証できます。

まず、セグメントの条件を満たしていることを確認します。

1. を開きます。 [Luma デモサイトのホームページ](https://luma.enablementadobe.com/content/luma/us/en.html) をタグプロパティにマッピングし、新しく作成したセグメントの対象として認定されます。
1. ブラウザーの **開発者ツール**  > **ネットワーク** タブ
1. 次を使用して、Platform Web SDK リクエストにフィルターを適用する `interact` をテキストフィルターとして使用する
1. 呼び出しを選択し、 **プレビュー** タブに応答の詳細を表示します
1. を展開します。 **ペイロード** をクリックして、Audience Managerで以前に設定した、期待される cookie の詳細を表示します。 この例では、期待される cookie 名が表示されます `platform_web_sdk_tutorial`.

   ![Adobe Experience PlatformAudience Manager特性の追加](assets/segment-validate-response.jpg)

1. を開きます。 **アプリ** タブをクリックして、 **Cookie** から **ストレージ** メニュー
1. を選択します。 **`https://luma.enablementadobe.com`** ドメインを開き、cookie がリストに適切に書き込まれていることを確認します。

   ![Adobe Experience PlatformAudience Manager特性の追加](assets/validate-cookie.jpg)


最後に、セグメントインターフェイスでセグメントをAudience Managerし、 **Segment Populations** は増分されました。

![Adobe Experience PlatformAudience Manager特性の追加](assets/segment-population.jpg)


このレッスンを完了すると、Platform Web SDK がAudience Managerにデータを渡す方法を確認でき、Cookie の宛先を使用してセグメント固有のファーストパーティ Cookie を設定できるようになります。

[次へ： ](setup-target.md)

>[!NOTE]
>
>Adobe Experience Platform Web SDK の学習に時間を割いていただき、ありがとうございます。 ご質問がある場合、一般的なフィードバックを共有したい場合、または今後のコンテンツに関する提案がある場合は、こちらで共有してください [Experience Leagueコミュニティディスカッション投稿](https://experienceleaguecommunities.adobe.com/t5/adobe-experience-platform-launch/tutorial-discussion-implement-adobe-experience-cloud-with-web/td-p/444996)
