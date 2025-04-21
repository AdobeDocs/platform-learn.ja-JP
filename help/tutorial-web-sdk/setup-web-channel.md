---
title: Platform Web SDKを使用したJourney Optimizer web チャネルの設定
description: Platform Web SDKを使用してJourney Optimizer web チャネルを実装する方法について説明します。 このレッスンは、「Web SDK を使用した Adobe Experience Cloud 実装のチュートリアル」の一部です。
solution: Data Collection,Experience Platform,Journey Optimizer
feature-set: Journey Optimizer
feature: Web Channel,Web SDK
jira: KT-15411
exl-id: ab83ce56-7f54-4341-8750-b458d0db0239
source-git-commit: e0359d1bade01f79d0f7aff6a6e69f3e4d0c3b62
workflow-type: tm+mt
source-wordcount: '2563'
ht-degree: 1%

---


# Web SDKを使用したJourney Optimizer web チャネルの設定

Adobe Experience Platform Web SDKを使用してAdobe Journey Optimizer[web チャネル ](https://experienceleague.adobe.com/en/docs/journey-optimizer/using/web/get-started-web) を実装する方法について説明します。 このレッスンでは、基本的な web チャネルの前提条件、設定の詳細な手順、ロイヤルティステータスに基づくユースケースを詳しく説明します。

このレッスンに従うと、Journey Optimizerのユーザーは、Journey Optimizer web デザイナーを使用した高度なオンラインパーソナライゼーションのために web チャネルを使用できるようになります。

![Web SDKとAdobe Analyticsの図 ](assets/dc-websdk-ajo.png)

## 学習内容

このレッスンを終了すると、次の操作を実行できます。

* Web チャネルエクスペリエンスを提供する際の Web SDKの機能と重要性を理解します。
* サンプルの Luma ロイヤルティ報酬ユースケースを利用して、web チャネルキャンペーンを最初から最後まで作成するプロセスを説明します。
* インターフェイス内でキャンペーンのプロパティ、アクション、スケジュールを設定します。
* Adobe Experience Cloud Visual Editing Helper 拡張機能の機能とメリットを説明します。
* Web デザイナーを使用して、画像、ヘッダー、その他の要素などの web ページコンテンツを編集する方法を説明します。
* オファーの決定コンポーネントを使用して Web ページにオファーを挿入する方法を説明します。
* Web チャネルキャンペーンの品質と成功を確保するためのベストプラクティスを確認します。

## 前提条件

このセクションのレッスンを完了するには、まず次の操作を行う必要があります。

* データ要素とルールの設定を含む、Platform web SDKの初期設定に関するすべてのレッスンを実施します。
* Adobe Experience Platform Web SDK タグ拡張機能のバージョンが 2.16 以上であることを確認します。
* Journey Optimizer Web Designer を使用して web チャネルエクスペリエンスを作成する場合は、Google ChromeまたはMicrosoft® Edge ブラウザーを使用していることを確認してください。
* また、[Adobe Experience Cloud Visual Editing Helper ブラウザー拡張機能 ](https://chromewebstore.google.com/detail/adobe-experience-cloud-vi/kgmjjkfjacffaebgpkpcllakjifppnca) をダウンロードして有効にしたことも確認します。
* ブラウザーでサードパーティ Cookie が許可されていることを確認します。 ブラウザーで広告ブロッカーを無効にする必要がある場合もあります。

  >[!CAUTION]
  >
  > Journey Optimizer Web Designer では、次のいずれかの理由により、特定の web サイトが確実に開かない場合があります。
  > 
  > 1. Web サイトには、厳格なセキュリティポリシーがあります。
  > 1. web サイトは iframe 内に埋め込まれます。
  > 1. 顧客の QA またはステージサイトは、外部からアクセスできません（内部サイトです）。

* Web エクスペリエンスを作成し、Adobe Experience Manager Assets Essentials ライブラリのコンテンツを含める場合は、[ このコンテンツを公開するためのサブドメインを設定 ](https://experienceleague.adobe.com/en/docs/journey-optimizer/using/web/configure-web-channel/web-delegated-subdomains) する必要があります。
* コンテンツ実験機能を使用する場合は、web データセットもレポート設定に含まれていることを確認してください。
* 現在、web プロパティで web チャネルキャンペーンのオーサリングと配信を可能にする、次の 2 種類の実装がサポートされています。
   * クライアント側のみ：Web サイトを変更するには、Adobe Experience Platform Web SDKを実装する必要があります。
   * ハイブリッドモード：Platform Edge Network Server API を使用して、パーソナライゼーションサーバーサイドをリクエストできます。 次に、API からの応答がAdobe Experience Platform Web SDKに提供され、クライアントサイドで変更をレンダリングします。 詳しくは、Adobe Experience Platform Edge Network Server API ドキュメントを参照してください。 ハイブリッドモードの追加の詳細と実装サンプルについては、このブログ投稿を参照してください。

  >[!NOTE]
  >
  >サーバーサイドのみの実装は、現在、サポートされていません。




## 用語

まず、web チャネルキャンペーンで使用される用語を理解する必要があります。

* **Web チャネル**:web を介したコンテンツの通信または配信の媒体。 このガイドのコンテキストでは、Adobe Journey Optimizer内で Platform Web SDKを使用してパーソナライズされたコンテンツが web サイトの訪問者に配信されるメカニズムを指します。
* **web サーフェス**：コンテンツが配信される URL で識別される web プロパティを参照します。 1 つまたは複数の web ページを含めることができます。
* **Journey Optimizer Web Designer**: ユーザーが web チャネルエクスペリエンスをデザインできる、Journey Optimizer内の特定のツールまたはインターフェイスです。
* **Adobe Experience Cloud Visual Editing Helper**: web チャネルエクスペリエンスの視覚的な編集とデザインを支援するブラウザー拡張機能。
* **データストリーム**:web チャネルエクスペリエンスを確実に配信できるようにする、Adobe Experience Platform サービス内の設定です。
* **結合ポリシー**：インバウンドキャンペーンの正確なアクティブ化と公開を確実にする設定。
* **オーディエンス**：特定の条件を満たすユーザーまたはサイト訪問者の特定のセグメント。
* **Web デザイナー**：コードを深く掘り下げることなく、web エクスペリエンスの視覚的な編集やデザインを支援するインターフェイスやツール。
* **式エディター**：ユーザーがデータ属性やその他の条件に基づいて、web コンテンツにパーソナライゼーションを追加できる Web デザイナー内のツール。
* **オファー決定コンポーネント**：意思決定管理に基づいて、特定の訪問者に表示するのに最適なオファーを決定するのに役立つ Web デザイナー内のコンポーネント。
* **コンテンツ実験**：様々なコンテンツのバリエーションをテストして、インバウンドクリック数など、目的の指標に関して最も効果が高いコンテンツを見つける方法。
* **処理**：コンテンツ実験のコンテキストでは、処理とは、別の実験に対してテストされるコンテンツの特定のバリエーションを指します。
* **シミュレーション**：ライブオーディエンスに対してアクティブ化する前に web チャネルのエクスペリエンスを視覚化するプレビューメカニズム。

## データストリームの設定

Adobe Experience Platform サービスは既にデータストリームに追加されています。 次に、「Adobe Journey Optimizer」オプションを有効にして、web チャネルエクスペリエンスを提供できるようにする必要があります。

データストリームでAdobe Journey Optimizerを設定するには：

1. [ データ収集 ](https://experience.adobe.com/#/data-collection){target="blank"} インターフェイスに移動します。
1. 左側のナビゲーションで「**[!UICONTROL データストリーム]**」を選択します。
1. 以前に作成した Luma Web SDK データストリームを選択します。

   ![ データストリームを選択 ](assets/web-channel-select-datastream.png)

1. Adobe Experience Platform サービス内で **[!UICONTROL 編集]** を選択します。

   ![ データストリームを編集 ](assets/web-channel-edit-datastream.png)

1. 「**[!UICONTROL Adobe Journey Optimizer]**」ボックスをオンにします。

   ![ 「AJO」チェックボックスをオン ](assets/web-channel-check-ajo-box.png)

1. 「**[!UICONTROL 保存]**」を選択します。

これにより、Journey OptimizerのインバウンドイベントがAdobe Experience Platform Edge Networkで正しく処理されます。

## 結合ポリシーの設定

「**[!UICONTROL Active-On-Edge結合ポリシー]**」オプションが有効になっている結合ポリシーが定義されていることを確認します。 この結合ポリシーオプションは、Journey Optimizer インバウンドチャネルで使用され、エッジでのインバウンドキャンペーンの正確なアクティブ化と公開を確保します。

結合ポリシーでオプションを設定するには：

1. Experience PlatformまたはJourney Optimizer インターフェイスの **[!UICONTROL 顧客]** / **[!UICONTROL プロファイル]** ページに移動します。
1. 「**[!UICONTROL 結合ポリシー]**」タブを選択します。
1. ポリシーを選択し（通常は [!UICONTROL  デフォルトの時間ベース ] ポリシーを使用するのが最適です）、「**[!UICONTROL 設定]**」ステップの **[!UICONTROL Edge上でアクティブ化結合ポリシー]** オプションを切り替えます。

   ![ 結合ポリシーを切り替え ](assets/web-channel-active-on-edge-merge-policy.png)

## コンテンツ実験用の web データセットの設定

Web チャネルキャンペーン内でコンテンツ実験を使用するには、使用する web データセットがレポート設定にも含まれていることを確認する必要があります。 Journey Optimizer レポートシステムは、データセットを読み取り専用で使用して、標準のコンテンツ実験レポートを生成します。

[ コンテンツ実験レポート用のデータセットの追加について詳しくは、この節を参照してください ](https://experienceleague.adobe.com/en/docs/journey-optimizer/using/reporting/channel-report/reporting-configuration#add-datasets)。

## ユースケースの概要 – ロイヤルティ報酬

このレッスンでは、サンプルのロイヤルティ報酬のユースケースを使用して、web SDKを使用した web チャネルエクスペリエンスの実装を詳細に説明します。

この使用例を使用すると、Journey Optimizer キャンペーンと Web デザイナーを活用して、Journey Optimizerが最適なインバウンドエクスペリエンスを顧客に提供するのにどのように役立つかをより深く理解できます。

このチュートリアルは実装者向けなので、このレッスンにはJourney Optimizerでの実質的なインターフェイス作業が含まれていることは注目に値します。 このようなインターフェイスタスクは通常マーケターが処理しますが、web チャネルキャンペーンの作成を通常担当していない実装者でも、insightをプロセスに参加させることが有益な場合があります。

### ロイヤルティ報酬キャンペーンの作成

サンプルロイヤルティデータを取り込んでセグメントを作成したら、Adobe Journey Optimizerでロイヤルティ報酬 web チャネルキャンペーンを作成します。

サンプルキャンペーンを作成するには：

1. [Journey Optimizer](https://experience.adobe.com/journey-optimizer/home){target="_blank"} インターフェイスを開きます

   >[!NOTE]
   >
   > スキーマ、データセット、オーディエンスも、すべて一般的なExperience Platformの構成要素なので、Journey Optimizer インターフェイスで構築できます。

1. 左側のナビゲーションで **[!UICONTROL ジャーニー管理]** / **[!UICONTROL キャンペーン]** に移動します
1. 右上の **[!UICONTROL キャンペーンを作成]** をクリックします。
1. 「**[!UICONTROL プロパティ]**」セクションで、キャンペーンを実行する方法を指定します。ロイヤルティ報酬のユースケースについては、「**スケジュール済み**」を選択します。

   ![ スケジュール済みキャンペーン ](assets/web-channel-campaign-properties-scheduled.png)

1. 「**[!UICONTROL アクション]**」セクションで、「**[!UICONTROL Web チャネル]**」を選択します。 **[!UICONTROL Web サーフェス]** として、「**[!UICONTROL ページ URL]**」を選択します。

   >[!NOTE]
   >
   >Web サーフェスは、コンテンツが配信される URL で識別される web プロパティを参照します。 単一ページの URL に対応するか、複数のページを含めることができ、1 つまたは複数の web ページに変更を適用できます。

1. 「**[!UICONTROL ページ URL]** web サーフェス」オプションを選択して、このキャンペーンで 1 ページにエクスペリエンスをデプロイします。 Luma ページ `https://luma.enablementadobe.com/content/luma/us/en.html` の URL を入力します

1. Web サーフェスを定義したら、「**[!UICONTROL 作成]**」を選択します。

   ![Web サーフェスを選択 ](assets/web-channel-web-surface.png)

1. 次に、新しい web チャネルキャンペーンにいくつかの追加の詳細を追加します。 まず、キャンペーンに名前を付けます。 `Luma Loyalty Rewards – Gold Status` と呼んで。 オプションで、キャンペーンに説明を追加できます。 また、**[!UICONTROL タグ]** を追加して、キャンペーン全体の分類を改善します。

   ![ キャンペーンに名前を付ける ](assets/web-channel-campaign-name.png)

1. デフォルトでは、キャンペーンはすべてのサイト訪問者に対してアクティブです。 このユースケースでは、ゴールドステータス報酬メンバーにのみエクスペリエンスが表示されます。 これを有効にするには、「**[!UICONTROL オーディエンスを選択]**」をクリックし、`Luma Loyalty Rewards – Gold Status` オーディエンスを選択します。

1. **[!UICONTROL ID 名前空間]** フィールドで、選択したセグメント内の個人を識別する名前空間を選択します。 Luma サイトにキャンペーンをデプロイするので、ECID 名前空間を選択できます。 `Luma Loyalty Rewards – Gold Status` オーディエンス内のプロファイルのうち、様々な ID の中で ECID 名前空間が欠落しているものは、web チャネルキャンペーンのターゲットになりません。

   ![ID タイプを選択 ](assets/web-channel-indentity-type.png)

1. **[!UICONTROL キャンペーン開始]** オプションを使用してキャンペーンを今日の日付に開始し、**[!UICONTROL キャンペーン終了]** オプションを使用して 1 週間以内に終了するようにスケジュールします。

   ![ キャンペーンスケジュール ](assets/web-channel-campaign-schedule.png)

>[!NOTE]
>
>Web チャネルキャンペーンの場合、訪問者がページを開くと、web エクスペリエンスが表示されることに注意してください。 したがって、Adobe Journey Optimizerの他のタイプのキャンペーンとは異なり、「アクショントリガーー **[!UICONTROL セクションは設定]** きません。

### ロイヤルティ報酬コンテンツを試す

上にスクロールすると、「**[!UICONTROL アクション]**」セクションで実験を作成して、`Luma Loyalty Rewards – Gold Status` しいオーディエンスに対してどのコンテンツがより効果的かをテストできます。 キャンペーン設定のコンポーネントとして、2 つの処理を作成してテストします。

コンテンツ実験を作成するには：

1. **[!UICONTROL 実験を作成]** をクリックします。

   ![ 実験を作成 ](assets/web-channel-create-content-experiment.png)

1. 最初に **[!UICONTROL 成功指標]** を選択します。 これは、コンテンツの有効性を判断するための指標です。 **[!UICONTROL ユニークインバウンドクリック数]** を選択して、web エクスペリエンスCTAでより多くのクリック数を生成するコンテンツ処理を確認します。

   ![ 成功指標を選択 ](assets/web-channel-content-experiment-metric.png)

1. Web チャネルを使用して実験を設定し、**[!UICONTROL インバウンドクリック数]**、**[!UICONTROL ユニークインバウンドクリック数]**、**[!UICONTROL ページビュー数]** または **[!UICONTROL ユニークページビュー数]** の指標を選択する場合、**[!UICONTROL クリックアクション]** ドロップダウンを使用すると、特定のページでのクリック数とビュー数を正確に追跡および監視できます。

1. 必要に応じて、2 つの処理のどちらも受け取らない **[!UICONTROL 除外]** を指定できます。 今のところ、これをオフのままにします。

1. また、オプションで「均等に配分 **[!UICONTROL を選択]** ます。 このオプションを選択すると、処理の分割が常に均等に分割されます。

[Adobe Journey Optimizer web チャネルでのコンテンツ実験の詳細を説明します ](https://experienceleague.adobe.com/ja/docs/journey-optimizer/using/content-management/content-experiment/get-started-experiment)。

### Visual Helper を使用したコンテンツの編集

次に、web チャネルエクスペリエンスを作成します。 それには、Adobe Experience Cloud **[!UICONTROL Visual Helper]** を使用します。 このツールは、Google ChromeおよびMicrosoft® Edgeと互換性のあるブラウザー拡張機能です。 エクスペリエンスを作成する前に、拡張機能をダウンロードしていることを確認してください。 また、web ページに Web SDKが含まれていることを確認します。

1. キャンペーンの **[!UICONTROL アクション]** タブ内で、「**[!UICONTROL コンテンツを編集]** をクリックします。 サーフェスとして 1 ページの URL を入力したので、コンポーザーで作業を開始する準備が整っています。

   ![コンテンツの編集](assets/web-channel-edit-content.png)

1. ここで、「**[!UICONTROL Web ページを編集]**」をクリックしてオーサリングを開始します。

   ![Web ページを編集 ](assets/web-channel-edit-web-page.png)

1. まず、web コンポーザーを使用していくつかの要素を編集します。 コンテキストメニューを使用して、Luma ヒーロー画像ヘッダーを編集します。 右側のコンテキストパネルのスタイルを調整します。

   ![ コンテキスト編集の追加 ](assets/web-channel-some-contextual-edit.png)

1. また、**[!UICONTROL 式エディター]** を使用して、コンテナにパーソナライゼーションを追加します。

   ![パーソナライゼーションの追加](assets/web-channel-add-basic-personalization.png)

1. クリック数に関してエクスペリエンスが適切に追跡されていることを確認します。 コンテキストメニューから **[!UICONTROL クリック追跡要素]** を選択します。

   ![ クリック追跡 ](assets/web-channel-click-tracking.png)

1. **[!UICONTROL オファーの決定コンポーネント]** を使用すると、web ページにオファーを挿入できます。 このコンポーネントは、**[!UICONTROL 意思決定管理]** を使用して、Luma 訪問者に提供する最適なオファーを選択します。


### HTML デザインの変更

ロイヤルティ報酬キャンペーンのコンポーネントとしてサイトにさらに高度な変更やカスタム変更を加える場合は、いくつかの方法を使用できます。

**[!UICONTROL コンポーネント]** パネルを使用して、HTMLまたは他のコンテンツを Luma サイトに直接追加します。

![ コンポーネントパネルを参照 ](assets/web-channel-components-pane.png)

新しいHTML コンポーネントをページ上部に追加します。 デザインインターフェイスまたは **[!UICONTROL コンテキスト]** パネルから、コンポーネント内のHTMLを編集します。

![ カスタムHTMLの追加 ](assets/web-channel-add-html-component.png)

または、**[!UICONTROL 変更]** パネルからHTMLの編集内容を追加します。 このパネルを使用すると、ページ上のコンポーネントを選択し、Designer インターフェイスから編集できます。

エディター内で、`Luma Loyalty Rewards – Gold Status` オーディエンスのHTMLを追加します。 「**[!UICONTROL 検証]**」を選択します。

![HTMLの検証 ](assets/web-channel-add-custom-html-validate.png)

次に、新しいカスタム HTML コンポーネントでフィット感と操作性を確認します。

![ カスタムHTMLのレビュー ](assets/web-channel-review-custom-html.png)

**[!UICONTROL CSS セレクタータイプ]** の変更を使用して、特定のコンポーネントを編集します。

![CSS を変更 ](assets/web-channel-css-selector.png)

**ページデータタイプ** の変更を使用して、カス `<head>` ムコードを追加します。

![ ヘッドを修正 ](assets/web-channel-page-head-modification.png)

**[!UICONTROL Visual Helper]** を使用すると、可能性は無限にあります。

### ロイヤルティ報酬コンテンツのシミュレート

キャンペーンをアクティブ化する前に、変更された web ページのプレビューを確認します。 Web チャネルエクスペリエンスをシミュレートするには、テストプロファイルを設定する必要があります。

エクスペリエンスをシミュレートするには：

1. キャンペーン内で「**[!UICONTROL コンテンツをシミュレート]**」を選択します。

   ![ コンテンツをシミュレート ](assets/web-channel-simulate-content.png)

1. シミュレーションを受けるテストプロファイルを選択します。 適切な処理を受けるには、テストプロファイルが `Luma Loyalty Rewards – Gold Status` オーディエンスに含まれている必要があります。

1. テストプロファイルのプレビューが表示されます。

### ロイヤルティ報酬キャンペーンのアクティブ化

最後に、web チャネルキャンペーンをアクティブ化します。

1. 「**アクティブ化するレビュー**」を選択します。

1. 最後に、キャンペーンの詳細を確認するプロンプトが表示されます。 **[!UICONTROL アクティブ化]** を選択します。 キャンペーンがサイト上でライブになるまでに最大 15 分かかることがあります。

### ロイヤルティ報酬 QA

「ゴールドステータス」のユーザーをシミュレートしてキャンペーンに適格にするために使用できるログインがいくつかあります。

1. `cleavlandeuler@emailsim.io`/`test`
1. `leftybeagen@emailsim.io`/`test`
1. `jenimartinho@emailsim.io`/`test`

ベストプラクティスとして、キャンペーン固有の KPI について、キャンペーンのライブレポートとグローバルレポートの「**[!UICONTROL Web]**」タブを監視します。 このキャンペーンの場合は、エクスペリエンスインプレッション数とクリック率を監視します。

![Web レポートの表示 ](assets/web-channel-web-report.png)

### Adobe Experience Platform Debuggerを使用した web チャネル検証

Adobe Experience Platform Debugger拡張機能はChromeと Firefox の両方で使用でき、web ページを分析してAdobe Experience Cloud ソリューションの実装に関する問題を特定します。

Luma サイトでデバッガーを使用すると、実稼動環境での web チャネルエクスペリエンスを検証できます。 これは、ロイヤルティ報酬のユースケースを立ち上げて実行し、すべてが正しく設定されていることを確認した後のベストプラクティスです。

[ こちらのガイドを使用して、ブラウザーでデバッガーを設定する方法を説明します ](https://experienceleague.adobe.com/en/docs/platform-learn/data-collection/debugger/overview)。

デバッガーを使用して検証を開始するには：

1. Web チャネルエクスペリエンスを持つ Luma Web ページに移動します。
   <!--
    ![ADD SCREENSHOT](#)
    -->
1. Web ページで、**[!UICONTROL Adobe Experience Platform Debugger]** を開きます。
   <!--
    ![ADD SCREENSHOT](#)
    -->
1. **概要** に移動します。 **[!UICONTROL データストリーム ID]** が、Adobe Journey Optimizerを有効にした **[!UICONTROL 4}Adobe Data Collection} の]** データストリーム ]**と一致することを確認します。**[!UICONTROL 
   <!--
    ![ADD SCREENSHOT](#)
    -->
1. その後、様々な Luma ロイヤルティアカウントでサイトにログインし、デバッガーを使用して、Adobe Experience Platform Edge Networkに送信されるリクエストを検証できます。
   <!--
    ![ADD SCREENSHOT](#)
    -->
1. **[!UICONTROL ソリューション]** で、**[!UICONTROL Experience Platform Web SDK]** に移動します。
   <!--
    ![ADD SCREENSHOT](#)
    -->
1. 「**設定**」タブ内で、「デバッグを有効にする **[!UICONTROL を切り替え]** ます。 これにより、**[!UICONTROL Adobe Experience Platform Assurance]** セッション内のセッションのログが有効になります。
   <!--
    ![ADD SCREENSHOT](#)
    -->
1. 様々な Luma ロイヤルティアカウントでサイトにログインし、デバッガーを使用して、**[!UICONTROL Adobe Experience Platform Edge network]** に送信されるリクエストを検証します。 ログトラッキングのために、これらのリクエストはすべて ]**0}Assurance} に取り込む必要があります。**[!UICONTROL 
<!--
   ![ADD SCREENSHOT](#)
-->

[次へ： ](setup-decision-management.md)

>[!NOTE]
>
>Adobe Experience Platform Web SDKの学習にご協力いただき、ありがとうございます。 ご不明な点がある場合や、一般的なフィードバックを共有したい場合、または今後のコンテンツに関するご提案がある場合は、この [Experience League Community Discussion の投稿でお知らせください ](https://experienceleaguecommunities.adobe.com/t5/adobe-experience-platform-data/tutorial-discussion-implement-adobe-experience-cloud-with-web/td-p/444996)
