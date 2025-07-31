---
title: Platform Web SDKを使用したAudience Managerの設定
description: Platform Web SDKを使用してAdobe Audience Managerを設定し、cookie の宛先を使用して実装を検証する方法について説明します。 このレッスンは、「Web SDK を使用した Adobe Experience Cloud 実装のチュートリアル」の一部です。
solution: Data Collection, Audience Manager
jira: KT-15409
exl-id: 45db48e9-73cf-4a9c-88f4-b5872a8224d3
source-git-commit: 7ccbaaf4db43921f07c971c485e1460a1a7f0334
workflow-type: tm+mt
source-wordcount: '1339'
ht-degree: 4%

---

# Platform Web SDKを使用したAudience Managerの設定

Adobe Experience Platform Web SDK を使用して Adobe Audience Manager を設定し、cookie の宛先を使用して実装を検証する方法について説明します。

[Adobe Audience Manager](https://experienceleague.adobe.com/ja/docs/audience-manager) は、サイト訪問者に関する商業的に関連性のある情報を収集し、市場性のあるセグメントを作成し、ターゲット広告やコンテンツを適切なオーディエンスに提供するために必要なすべてを提供するAdobe Experience Cloud ソリューションです。

![Web SDKとAdobe Audience Managerの図 ](assets/dc-websdk-aam.png)

## 学習目標

このレッスンを最後まで学習すると、以下の内容を習得できます。

* データストリームの設定によるAudience Managerの有効化
* Audience Managerでの cookie の宛先の有効化
* Adobe Experience Platform Debuggerでのオーディエンスの選定を確認して、Audience Manager実装を検証します。

## 前提条件

このレッスンを完了するには、まず次の操作を行う必要があります。

* このチュートリアルの初期設定とタグの設定の節で前のレッスンを完了します。
* Adobe Audience Managerへのアクセス権と、特性、セグメントおよび宛先を作成、読み取りおよび書き込むための適切な権限を持っています。 詳しくは、[Audience Managerの役割ベースのアクセス制御 ](https://experienceleague.adobe.com/ja/docs/audience-manager-learn/tutorials/setup-and-admin/user-management/setting-permissions-with-role-based-access-control) を参照してください。

## データストリームの設定

Platform Web SDKを使用したAudience Managerの実装は、[ サーバーサイド転送（SSF） ](https://experienceleague.adobe.com/ja/docs/analytics/admin/admin-tools/manage-report-suites/edit-report-suite/report-suite-general/server-side-forwarding/ssf) を使用した実装とは異なります。 サーバーサイド転送は、Adobe Analytics リクエストデータをAudience Managerに渡します。 Platform Web SDKの実装は、Platform Edge Networkに送信された XDM データをAudience Managerに渡します。 Audience Managerがデータストリームで有効になっています。

1. [ データ収集 ](https://experience.adobe.com/#/data-collection){target="blank"} インターフェイスに移動
1. 左側のナビゲーションで「**[!UICONTROL データストリーム]**」を選択します
1. 以前に作成した `Luma Web SDK: Development Environment` データストリームを選択します

   ![Luma Web SDK データストリームを選択します ](assets/datastream-luma-web-sdk-development.png)。

1. 「**[!UICONTROL サービスを追加]**」を選択します。
   ![ データストリームへのサービスの追加 ](assets/aam-datastream-addService.png)
1. **[!UICONTROL Adobe Audience Manager]** を **[!UICONTROL サービス]** として選択
1. **[!UICONTROL Cookie 宛先が有効]** および **[!UICONTROL URL 宛先が有効]** が選択されていることを確認します
1. 「**[!UICONTROL 保存]**」を選択します
   ![Audience Manager データストリームの設定を確認して保存します ](assets/aam-datastream-save.png)。

## データソースの作成

次に、Audience Manager内でデータを整理するための基本ツールである [Data Source](https://experienceleague.adobe.com/ja/docs/audience-manager/user-guide/features/data-sources/datasources-list-and-settings) を作成します。

1. [Audience Manager](https://experience.adobe.com/#/audience-manager/) インターフェイスに移動
1. 上部ナビゲーションから **[!UICONTROL オーディエンスデータ]** を選択します
1. ドロップダウンメニューから **[!UICONTROL データソース]** を選択します
1. データソースページの上部にある「**[!UICONTROL 新規追加]**」ボタンを選択します

   ![Adobe Experience Platform Audience Managerのデータソース ](assets/data-sources-list.jpg)

1. Data Sourceにわかりやすい名前と説明を付けます。 初期設定では、この `Platform Web SDK tutorial` に名前を付けることができます。
1. **[!UICONTROL ID タイプ]** を **[!UICONTROL Cookie]** に設定
1. 「**[!UICONTROL データのエクスポート・コントロール]**」セクションで、「制限なし **[!UICONTROL を選択します]**

   ![Adobe Experience Platform Audience Manager Data Sourceのセットアップ ](assets/data-source-details.png)

1. データSourceの **[!UICONTROL 保存]**


## 特性の作成

データSourceを保存した後、[trait](https://experienceleague.adobe.com/ja/docs/audience-manager/user-guide/features/traits/traits-overview) を設定します。 特性は、Audience Managerの 1 つ以上のシグナルを組み合わせたものです。 ホームページ訪問者の特性を作成します。

>[!NOTE]
>
>データストリームですべての XDM データが有効な場合は、すべての XDM データがAudience Managerに送信されますが、未使用のシグナル レポートで使用できるようになるまで 24 時間かかる場合があります。 この演習で説明しているように、Audience Managerですぐに使用する XDM データの明示的な特性を作成します。

1. **[!UICONTROL オーディエンスデータ]**/**[!UICONTROL 特性]** を選択します。
1. **[!UICONTROL 新規追加]**/**[!UICONTROL ルールベース]** 特性を選択します

   ![Adobe Experience Platform Audience Managerのルールベースの特性 ](assets/rule-based-trait.jpg)

1. 特性にわかりやすい名前と説明を付けます。`Luma homepage view`
1. 前の節で作成した **[!UICONTROL データSource]** を選択します。
1. 右側のパネルで特性を保存する **[!UICONTROL フォルダーを選択]** します。 既存の親フォルダーの横にある **「+」アイコンを選択** てフォルダーを作成することもできます。 この新しいフォルダーに `Platform Web SDK tutorial` という名前を付けることができます。
1. **[!UICONTROL 特性式]** キャレットを展開し、「**[!UICONTROL 式ビルダー]**」を選択します。ホームページの訪問を示すキーと値のペアを指定する必要があります。
1. [Luma ホームページ ](https://luma.enablementadobe.com/content/luma/us/en.html) （タグプロパティにマッピング）と **Adobe Experience Platform Debugger** を開き、ページを更新します。
1. Platform Web SDKのネットワークリクエストとイベントの詳細を調べて、ホームページのキーと名前の値を見つけます。
   ![Adobe Experience Platform Audience Manager XDM データ ](assets/xdm-keyvalue.jpg)
1. Audience Manager UI の式ビルダーに戻り、キーを **`web.webPageDetails.name`**、値を **`content:luma:us:en`** と入力します。 この手順により、ホームページを読み込むたびに特性を実行するようにします。
1. 特性を **[!UICONTROL 保存]** します。


## セグメントの作成

次の手順では、**セグメント** を作成し、新しく定義した特性をこのセグメントに割り当てます。

1. 上部ナビゲーションで「**[!UICONTROL オーディエンスデータ]**」を選択し、「**[!UICONTROL セグメント]**」を選択します。
1. ページの左上にある「**[!UICONTROL 新規追加]**」を選択して、セグメントビルダーを開きます
1. セグメントにわかりやすい名前と説明（例：`Platform Web SDK - Homepage visitors`）を付けます
1. **[!UICONTROL フォルダーを選択]** します。セグメントは、右側のパネルに保存されます。 既存の親フォルダーの横にある **「+」アイコンを選択** てフォルダーを作成することもできます。 この新しいフォルダーに `Platform Web SDK tutorial` という名前を付けることができます。
1. 統合コードを追加します。この場合は、数字のランダムセットです。
1. 「**[!UICONTROL データSource]**」セクションで、「**[!UICONTROL Audience Manager]**」と先ほど作成したデータソースを選択します
1. 「**[!UICONTROL 特性]**」セクションを展開し、作成した特性を検索します
1. **[!UICONTROL 特性を追加]** を選択します。
1. ページ下部の「**[!UICONTROL 保存]**」を選択します

   ![Adobe Experience Platform Audience Manager特性の追加 ](assets/add-trait-segment.jpg)

   ![Adobe Experience Platform Audience Manager特性の追加 ](assets/saved-segment.jpg)

## 宛先の作成

次に、**宛先ビルダー** を使用して **Cookie ベースの宛先を作成** ます。 宛先ビルダーを使用すると、Cookie、URL およびサーバー間の宛先を作成および管理できます。

1. 上部のナビゲーションの **[!UICONTROL オーディエンスデータ]** メニュー内の **宛先** を選択して、宛先ビルダーを開きます
1. 「**[!UICONTROL 宛先を作成]**」を選択します
1. 名前と説明、`Platform Web SDK tutorial` を入力します
1. **[!UICONTROL カテゴリ]** として、「**[!UICONTROL カスタム]**」を選択します
1. **[!UICONTROL Type]** として、**[!UICONTROL Cookie]** を選択します

   ![Adobe Experience Platform Audience Manager特性の追加 ](assets/destination-settings.jpg)

1. 「**[!UICONTROL 設定]**」セクションを開き、cookie の宛先に関する詳細を入力します
1. Cookie にわかりやすい名前を付けます。`platform_web_sdk_tutorial`
1. **[!UICONTROL Cookie ドメイン]** として、統合を計画しているサイトのドメインを追加します。チュートリアルでは、Luma ドメインを入力します `luma.enablementadobe.com`
1. **[!UICONTROL データの公開先]** オプションとして、「選択したドメインのみ **[!UICONTROL を選択します]**
1. まだ追加していない場合は、ドメインを選択します
1. **[!UICONTROL データ形式]** として、「**[!UICONTROL 単一のキー]** を選択し、cookie にキーを設定します。 このチュートリアルでは、`segment` をキー値として使用します。
1. 最後に、「**[!UICONTROL 保存]**」を選択して、宛先設定の詳細を保存します。

   ![Audience Manager宛先設定セクション ](assets/aam-destination-config-dw.png)

<!--
   ![Adobe Experience Platform Audience Manager Add Trait](assets/aam-destination-config.jpg)


   ![Adobe Experience Platform Audience Manager Add Trait](assets/cookie-destination-config.jpg)
-->

1. 「**[!UICONTROL セグメントマッピング]**」セクションでは、**[!UICONTROL セグメントの検索と追加]** 機能を使用して、以前に作成した `Platform Web SDK - Homepage visitors` グメントを検索し、**[!UICONTROL 追加]** を選択します。


1. セグメントを追加すると、ポップアップが開き、Cookie に対する期待値を指定する必要があります。 この演習では、「hpvisitor」という値を入力します。

1. 「**[!UICONTROL 保存]**」を選択します

1. 「**[!UICONTROL 完了]**」を選択します。
   ![Adobe Experience Platform Audience Manager特性の追加 ](assets/luma-cookie-segment-dw.png)

セグメントマッピング期間をアクティブ化するには数時間かかります。 完了したら、Audience Manager インターフェイスを更新し、**マッピングされたセグメント** リストが更新されていることを確認します。

## セグメントの検証

セグメントの最初の作成から数時間後に、セグメントが正しく動作していることを検証できます。

まず、セグメントに適合できることを確認します

1. [Luma デモサイトのホームページ ](https://luma.enablementadobe.com/content/luma/us/en.html) を開き、タグプロパティにマッピングして、新しく作成したセグメントに適合するようにします。
1. ブラウザーの **開発者ツール**/「**ネットワーク**」タブを開きます。
1. `interact` をテキストフィルターとして使用して、Platform Web SDK リクエストをフィルタリングします
1. 呼び出しを選択し、「**プレビュー**」タブを開くと、応答の詳細が表示されます
1. **payload** を展開して、以前にAudience Managerで設定したように、期待される Cookie の詳細を表示します。 この例では、予期される cookie 名 `platform_web_sdk_tutorial` が表示されます。

   ![Adobe Experience Platform Audience Manager特性の追加 ](assets/segment-validate-response.jpg)

1. **アプリケーション** タブを開き、**ストレージ** メニューから **Cookie** を開きます。
1. **`https://luma.enablementadobe.com`** ドメインを選択し、cookie がリストに適切に書き込まれていることを確認します

   ![Adobe Experience Platform Audience Manager特性の追加 ](assets/validate-cookie.jpg)


最後に、Audience Manager インターフェイスでセグメントを開き、**セグメント母集団** が増加していることを確認します。

![Adobe Experience Platform Audience Manager特性の追加 ](assets/segment-population.jpg)


このレッスンを完了すると、Platform Web SDKがAudience Managerにどのようにデータを渡すかを確認し、Cookie の送信先を使用してセグメント固有のファーストパーティ Cookie を設定できるようになります。

>[!NOTE]
>
>Adobe Experience Platform Web SDKの学習にご協力いただき、ありがとうございます。 ご不明な点がある場合や、一般的なフィードバックを共有したい場合、または今後のコンテンツに関するご提案がある場合は、この [Experience League Community Discussion の投稿でお知らせください ](https://experienceleaguecommunities.adobe.com/t5/adobe-experience-platform-data/tutorial-discussion-implement-adobe-experience-cloud-with-web/td-p/444996?profile.language=ja)
