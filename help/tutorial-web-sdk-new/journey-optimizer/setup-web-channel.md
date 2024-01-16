---
title: Platform Web SDK での Web チャネルのセットアップ
description: Platform Web SDK を使用して Web チャネルを実装する方法について説明します。 このレッスンは、「 Adobe Experience Cloudと Web SDK の実装」チュートリアルの一部です。
solution: Data Collection,Experience Platform,Journey Optimizer
feature-set: Journey Optimizer
feature: Web Channel,Web SDK
source-git-commit: f08866de1bd6ede50bda1e5f8db6dbd2951aa872
workflow-type: tm+mt
source-wordcount: '2463'
ht-degree: 1%

---


# Platform Web SDK での Web チャネルのセットアップ

Platform Web SDK を使用して Web チャネルを実装する方法について説明します。 このガイドでは、基本的な Web チャネルの前提条件、設定の詳細な手順、ロイヤルティステータスに基づく使用例の詳細について説明します。

このガイドに従うことで、Journey Optimizerのユーザーは、Journey Optimizer Web Designer を使用して、高度なオンラインパーソナライゼーション用の Web チャネルを効果的に適用する装備が整います。

## 学習内容

このレッスンを最後まで学習すると、次のことが可能になります。

* Web チャネルエクスペリエンスを提供する際の Web SDK の機能と重要性を理解します。
* サンプルの Luma Loyalty Rewards 使用例を使用して、Web チャネルキャンペーンを最初から最後まで作成するプロセスを理解します。
* インターフェイス内でキャンペーンのプロパティ、アクションおよびスケジュールを設定します。
* Adobe Experience Cloud Visual Editing Helper 拡張機能の機能とメリットについて説明します。
* Web デザイナーを使用して、画像、ヘッダー、その他の要素を含む Web ページコンテンツを編集する方法について説明します。
* オファー決定コンポーネントを使用して、Web ページにオファーを挿入する方法を説明します。
* Web チャネルキャンペーンの品質と成功を確保するためのベストプラクティスを確認します。

## 前提条件

この節のレッスンを完了するには、まず以下をおこなう必要があります。

* AEP Web SDK のバージョンが 2.16 以降であることを確認します。
* Journey Optimizer Web デザイナーを使用して Web チャネルエクスペリエンスを作成する場合は、Google Chrome またはMicrosoft® Edge ブラウザーを使用していることを確認します。
* また、Adobe Experience Cloud Visual Editing Helper ブラウザー拡張機能もダウンロード済みであることを確認します。 Web チャネルエクスペリエンスを作成する前に、ブラウザーのツールバーで Visual Editing Helper ブラウザー拡張を有効にします。
   * Journey Optimizer Web デザイナーでは、次のいずれかの理由で、特定の Web サイトを確実に開くことができない場合があります。
      1. このウェブサイトは厳しいセキュリティポリシーを有しています。
      1. Web サイトは iframe 内に埋め込まれます。
      1. お客様の QA またはステージサイトは、外部からアクセスできません（内部サイトです）。
* ブラウザーでサードパーティ Cookie が許可されていることを確認します。 ブラウザーでの広告ブロッカーも無効にする必要が生じる場合があります。
* Web エクスペリエンスを作成し、Adobe Experience Manager Assets Essentialsライブラリからコンテンツを含める場合は、このコンテンツを公開するためのサブドメインを設定する必要があります。 [詳細情報](https://experienceleague.adobe.com/docs/journey-optimizer/using/web/web-delegated-subdomains.html?lang=en)。
* コンテンツ実験機能を使用する場合は、Web データセットがレポート設定にも含まれていることを確認します。
* 現在、Web プロパティで Web チャネルキャンペーンのオーサリングと配信を有効にする際に、次の 2 種類の実装がサポートされています。
   * クライアント側のみ：Web サイトを変更するには、Adobe Experience Platform Web SDK を実装する必要があります。
   * ハイブリッドモード：AEP Edge Network Server API を利用して、パーソナライゼーションサーバーサイドをリクエストできます。 次に、API からの応答がAdobe Experience Platform Web SDK に提供され、クライアント側で変更をレンダリングできます。 詳しくは、 Adobe Experience Platform Edge Network Server API のドキュメントを参照してください。 ハイブリッドモードの追加の詳細と実装例については、このブログ投稿を参照してください。

>[!NOTE]
>
>サーバー側のみの実装は、現在サポートされていません。

## 用語

まず、Web チャネルキャンペーンで使用される用語を理解する必要があります。

* **Web チャネル**:Web を介した通信またはコンテンツ配信のためのメディア。 このガイドのコンテキストでは、Adobe Journey Optimizer内で、Platform Web SDK を使用して Web サイトの訪問者にパーソナライズされたコンテンツを配信するメカニズムを指します。
* **ウェブサーフェス**：コンテンツが配信される URL で識別される Web プロパティを指します。 1 つまたは複数の Web ページを網羅できます。
* **Journey Optimizer Web Designer**:Journey Optimizer内の特定のツールまたはインターフェイス。ユーザーは Web チャネルエクスペリエンスをデザインできます。
* **Adobe Experience Cloud Visual Editing Helper**:Web チャネルエクスペリエンスの視覚的な編集とデザインに役立つブラウザー拡張機能。
* **Datastream**:Adobe Experience Platformサービス内の設定で、Web チャネルのエクスペリエンスを確実に配信できるようにします。
* **結合ポリシー**：インバウンドキャンペーンの正確なアクティベーションと公開を確実におこなう設定。
* **対象ユーザ**：特定の条件を満たすユーザーまたはサイト訪問者の特定のセグメント。
* **Web デザイナー**：コードを深く掘り下げることなく、Web エクスペリエンスの視覚的な編集やデザインを支援するインターフェイスまたはツールです。
* **式エディター**：場合によってはデータ属性や他の条件に基づいて、Web コンテンツにパーソナライゼーションを追加できる Web デザイナー内のツール。
* **オファー決定コンポーネント**：決定管理に基づいて、特定の訪問者に表示するのに最適なオファーを決定するのに役立つ、Web デザイナーのコンポーネント。
* **コンテンツ実験**：様々なコンテンツのバリエーションをテストし、インバウンドクリック数など、目的の指標に関してどのコンテンツのバリエーションが最も効果が高いかを調べるためのメソッド。
* **治療**：コンテンツ実験のコンテキストでは、扱いとは、テスト対象のコンテンツの特定のバリエーションを指します。
* **シミュレーション**：ライブオーディエンスに対してアクティブ化する前に、Web チャネルのエクスペリエンスを視覚化するプレビューメカニズム。

## データストリームの設定

データストリームがAdobe Experience Platformサービス内で定義され、「 Adobe Journey Optimizer 」オプションが有効になっていることを確認します。 Platform Web SDK で Web チャネルエクスペリエンスを配信する前に、この設定をおこなう必要があります。

データストリーム内のAdobe Journey Optimizerを設定するには、次の手順に従います。

1. データ収集インターフェイスに移動します。
1. 左側のナビゲーションで、「 **データストリーム**.
1. 前に作成した Luma Web SDK データストリームを選択します。

   ![データストリームを選択](../assets/web-channel-select-datastream.png)

1. 選択 **編集** をAdobe Experience Platform Service 内に追加します。

   ![データストリームを編集](../assets/web-channel-edit-datastream.png)

1. 次を確認します。 **Adobe Journey Optimizer** ボックス。

   ![AJO ボックスをオンにする](../assets/web-channel-check-ajo-box.png)

1. 「**保存**」を選択します。

これにより、Journey OptimizerのインバウンドイベントがAdobe Experience Platform Edge で正しく処理されます。

## 結合ポリシーを設定する

結合ポリシーが **エッジ上でのアクティブな結合ポリシー** オプションが有効です。 この結合ポリシーオプションは、Journey Optimizerのインバウンドチャネルで採用され、インバウンドキャンペーンの正確なアクティベーションと公開をエッジで確実におこなえます。

結合ポリシーでオプションを設定するには：

1. 次に移動： **顧客/プロファイル** インターフェイス。
1. ナビゲーション内で、 **結合ポリシー**.
1. ポリシーを選択し、 **エッジ上でのアクティブな結合ポリシー** オプションを **設定** 手順

   ![結合ポリシーを切り替え](..//assets/web-channel-active-on-edge-merge-policy.png)

## コンテンツ実験用の Web データセットの設定

Web チャネルキャンペーン内でコンテンツ実験を使用するには、使用する Web データセットもレポート設定に含める必要があります。 Journey Optimizerのレポートシステムは、データセットを読み取り専用で使用し、OOTB コンテンツ実験レポートに入力します。

[コンテンツ実験レポート用のデータセットの追加について詳しくは、この節を参照してください。](https://experienceleague.adobe.com/docs/journey-optimizer/using/campaigns/content-experiment/reporting-configuration.html?lang=en#add-datasets).

## ユースケースの概要 — ロイヤルティ報酬

このレッスンでは、Web SDK を使用した Web チャネルエクスペリエンスの実装の詳細を説明するために、Loyalty Rewards の使用例の例を使用します。

この使用例では、Journey Optimizerキャンペーンと Web デザイナーを活用して、Journey Optimizerが顧客に最適なインバウンドエクスペリエンスを提供する方法をより深く理解できます。

>[!NOTE]
>
>このチュートリアルは実装者を対象としているので、このレッスンでは AJO での大幅な UI 作業を含むことに注意する必要があります。 このような UI タスクは通常マーケターが処理しますが、最終的に Web チャネルキャンペーンの作成に責任を負わない場合でも、実装者がプロセスに関するインサイトを得ると便利です。

### ロイヤルティ報酬キャンペーンの作成

まず、Adobe Journey Optimizerで Loyalty Rewards Web チャネルキャンペーンを作成します。

サンプルキャンペーンを作成するには：

1. 左のナビゲーションで、ジャーニー管理/キャンペーンに移動します。
1. クリック **キャンペーンを作成** を右上に表示します。
1. 「**プロパティ**」セクションで、キャンペーンを実行する方法を指定します。「ロイヤルティ報酬」の使用例では、 **Scheduled**.

   ![予定キャンペーン](../assets/web-channel-campaign-properties-scheduled.png)

1. Adobe Analytics の **アクション** セクションで、 **Web チャネル**. この段階で、Web サーフェスも選択します。

>[!NOTE]
>
>Web サーフェスは、コンテンツが配信される URL で識別される Web プロパティを指します。 1 つのページの URL に対応させたり、複数のページを囲んだりでき、1 つまたは複数の Web ページに変更を適用できます。

を選択します。 **ページ URL** このキャンペーンの 1 つのページにエクスペリエンスをデプロイするための Web サーフェスオプション。 Luma ページの URL を入力します。

1. Web サーフェスを定義したら、「 」を選択します。 **作成**.

   ![Web サーフェスを選択](../assets/web-channel-web-surface.png)

1. 次に、新しい Web チャネルキャンペーンに詳細を追加します。 まず、キャンペーンに名前を付けます。 呼び出し&#39;*Luma ロイヤリティー報酬 — ゴールドステータス — 2023 年 10 月*&#39;. オプションで、キャンペーンに説明を追加できます。 また、 **タグ** ：キャンペーンの分類全体を改善します。

   ![キャンペーンに名前を付ける](../assets/web-channel-campaign-name.png)

1. デフォルトでは、このキャンペーンはすべてのサイト訪問者に対してアクティブになっています。 この使用例の目的では、ゴールドステータスの報酬メンバーのみがエクスペリエンスを表示する必要があります。 これを有効にするには、 **オーディエンスを選択** をクリックし、「*Luma ロイヤリティー報酬 — ゴールドステータス*&#39;オーディエンス。

1. Adobe Analytics の **ID 名前空間** 「 」フィールドで、選択したセグメント内の個人を識別するための名前空間を選択します。 Luma サイトにキャンペーンをデプロイするので、ECID 名前空間を選択できます。 「 」内のプロファイル&#x200B;*Luma ロイヤリティー報酬 — ゴールドステータス*「 」オーディエンスの様々な ID の中に ECID 名前空間がない場合、web チャネルキャンペーンのターゲットになりません。

   ![ID タイプを選択](../assets/web-channel-indentity-type.png)

1. キャンペーンの開始を 12 月 1 日 (PT) にスケジュールするには、 **キャンペーン開始** オプションを選択し、12 月 31 日に終了する場合は、 **キャンペーン終了** オプション。

   ![キャンペーンスケジュール](../assets/web-channel-campaign-schedule.png)

>[!NOTE]
>
>Web チャネルキャンペーンの場合、訪問者がページを開くと Web エクスペリエンスが表示されます。 したがって、Adobe Journey Optimizerの他のタイプのキャンペーンとは異なり、 **アクショントリガー** セクションは設定できません。

### ロイヤルティ報酬コンテンツの実験

Adobe Analytics の **アクション** セクションに、「 」に対してどのコンテンツが適しているかをテストする実験を作成することもできます&#x200B;*Luma ロイヤリティー報酬 — ゴールドステータス*&#39;オーディエンス。 キャンペーン設定のコンポーネントとして、2 つのトリートメントを作成し、テストしてみましょう。

コンテンツ実験を作成するには：

1. クリック **実験を作成**.

   ![実験を作成](../assets/web-channel-create-content-experiment.png)

1. 最初に、 **成功指標**. これは、コンテンツの効果を判断するための指標です。 選択 **個別インバウンドクリック数**&#x200B;を使用して、web エクスペリエンス CTA でどのコンテンツ処理がより多くのクリックを生み出しているかを確認します。

   ![成功指標を選択](../assets/web-channel-content-experiment-metric.png)

1. Web チャネルを使用して実験を設定し、 **インバウンドクリック数**, **個別インバウンドクリック数**, **ページビュー数**&#x200B;または **個別ページビュー数** 指標、 **クリックアクション** ドロップダウンを使用すると、特定のページのクリック数やビュー数を正確に追跡および監視できます。

1. オプションで、 **除外** 2 つの治療のどちらも受けていません 現時点では、このチェックボックスをオフにしておきます。

1. また、オプションで、次を選択します。 **等しく分布**. 治療の分割が常に均等に分割されるようにするには、このオプションを選択します。

[Adobe Journey Optimizer Web Channel でのコンテンツ実験の詳細](https://experienceleague.adobe.com/docs/journey-optimizer/using/campaigns/content-experiment/get-started-experiment.html?lang=en).

### Visual Helper を使用してコンテンツを編集する

次に、Web チャネルのエクスペリエンスを作成します。 これをおこなうには、Adobe Experience Cloud **Visual Helper**. このツールは、Google Chrome およびMicrosoft® Edge と互換性のあるブラウザー拡張機能です。 エクスペリエンスを構築する前に、拡張機能をダウンロードしていることを確認してください。 また、Web ページに Web SDK が含まれていることを確認します。

1. 内 **アクション** キャンペーンの「 」タブで、「 **コンテンツを編集**. 単一ページの URL をサーフェスとして入力したので、コンポーザーで作業を開始する準備が整いました。

   ![コンテンツの編集](../assets/web-channel-edit-content.png)

1. 今すぐクリック **Web ページを編集** をクリックしてオーサリングを開始します。

   ![Web ページを編集](../assets/web-channel-edit-web-page.png)

1. まず、Web コンポーザーを使用して一部の要素を編集します。 コンテキストメニューを使用して、Luma ヒーロー画像ヘッダーを編集します。 右側のコンテキストパネルのスタイルを調整します。

   ![コンテキスト編集の追加](../assets/web-channel-some-contextual-edit.png)

1. また、 **式エディター**.

   ![パーソナライゼーションの追加](../assets/web-channel-add-basic-personalization.png)

1. クリックに対してエクスペリエンスが適切に追跡されるようにします。 選択 **追跡要素をクリック** を選択します。

   ![クリック追跡](../assets/web-channel-click-tracking.png)

1. 以下を使用します。 **オファーの決定コンポーネント** をクリックして、web ページにオファーを挿入します。 このコンポーネントは、 **決定管理** :Luma 訪問者に配信する最適なオファーを選択します。


### HTMLデザインの変更

より高度な変更や、ロイヤリティー報酬キャンペーンのコンポーネントとしてサイトにカスタムの変更を加える場合は、いくつかの方法を使用できます。

以下を使用します。 **コンポーネント** ウィンドウを使用して、HTMLまたは他のコンテンツを Luma サイトに直接追加します。

![コンポーネントパネルの参照](../assets/web-channel-components-pane.png)

新しいHTMLコンポーネントをページ上部に追加します。 デザインインターフェイスからHTMLを編集するか、または **コンテキスト** ウィンドウ

![カスタムHTMLを追加](../assets/web-channel-add-html-component.png)

または、 **変更** ウィンドウ このウィンドウでは、ページ上のコンポーネントを選択し、デザイナーインターフェイスから編集できます。

エディター内で、「*Luma ロイヤリティー報酬 — ゴールドステータス*&#39;オーディエンス。 「**ターゲットの承認**」をクリックします。

![検証HTML](../assets/web-channel-add-custom-html-validate.png)

次に、新しいカスタムHTMLコンポーネントをフィットアンドフィールで確認します。

![カスタムHTMLの確認](../assets/web-channel-review-custom-html.png)

を使用して特定のコンポーネントを編集する **CSS セレクターのタイプ** 変更。

![CSS を変更](../assets/web-channel-css-selector.png)

を使用してカスタムコードを追加する **ページ `<head>` type** 変更。

![ヘッドを修正](../assets/web-channel-page-head-modification.png)

可能性は、 **Visual Helper**.

### ロイヤルティ報酬の内容をシミュレート

キャンペーンをアクティブ化する前に、変更された Web ページのプレビューを確認してください。 Web チャネルエクスペリエンスをシミュレートするには、テストプロファイルを設定する必要があります。

エクスペリエンスをシミュレートするには：

1. 選択 **コンテンツをシミュレート** キャンペーン内で使用できます。

   ![コンテンツをシミュレート](../assets/web-channel-simulate-content.png)

1. シミュレーションを受け取るテストプロファイルを選択します。 テストプロファイルは、*Luma ロイヤリティー報酬 — ゴールドステータス*&#39;適切な治療を受けるオーディエンス。

1. テストプロファイルのプレビューが表示されます。

### ロイヤルティ報酬キャンペーンの有効化

最後に、Web チャネルキャンペーンを有効化します。

1. 選択 **有効化するレビュー**.

1. 最終的に、キャンペーンの詳細を確認するメッセージが表示されます。 選択 **有効化**. キャンペーンがサイト上で有効になるまでに最大 15 分かかる場合があります。

### ロイヤルティ報酬 QA

ベストプラクティスとして、 **Web** キャンペーン固有の KPI に関する、キャンペーンのライブレポートおよびグローバルレポートの「 」タブ。 このキャンペーンの場合は、エクスペリエンスのインプレッション数を監視し、クリック率を示します。

![Web レポートを表示](../assets/web-channel-web-report.png)

### Adobe Experience Platform Debuggerを使用した Web チャネルの検証

Chrome と Firefox の両方で使用できるAdobe Experience Platform Debugger拡張機能は、Web ページを分析して、Adobe Experience Cloudソリューションの実装に関する問題を特定します。

Luma サイトのデバッガーを使用して、実稼動環境での Web チャネルエクスペリエンスを検証できます。 これは、ロイヤルティ報酬の使用例が起動および実行された後に、すべてが正しく設定されるようにするベストプラクティスです。

[こちらのガイドを使用して、ブラウザーでデバッガーを設定する方法を説明します。](https://experienceleague.adobe.com/docs/platform-learn/data-collection/debugger/overview.html?lang=en).

デバッガーを使用して検証を開始するには、次の手順に従います。

1. Web チャネルエクスペリエンスを含む Luma Web ページに移動します。
   <!--
    ![ADD SCREENSHOT](#)
    -->
1. Web ページで、 **Adobe Experience Platform debugger**.
   <!--
    ![ADD SCREENSHOT](#)
    -->
1. に移動します。 **概要**. 次を確認します。 **Datastream ID** が **datastream** in **Adobeデータ収集** Adobe Journey Optimizerを有効にした
   <!--
    ![ADD SCREENSHOT](#)
    -->
1. その後、様々な Luma ロイヤリティーアカウントを使用してサイトにログインし、デバッガーを使用してAdobe Experience Platform Edge ネットワークに送信されるリクエストを検証できます。
   <!--
    ![ADD SCREENSHOT](#)
    -->
1. の下 **ソリューション** に移動します。 **Experience PlatformWeb SDK**.
   <!--
    ![ADD SCREENSHOT](#)
    -->
1. 内 **設定** タブ、切り替えオン **デバッグを有効にする**. これにより、 **Adobe Experience Platform Assurance** セッション。
   <!--
    ![ADD SCREENSHOT](#)
    -->
1. 様々な Luma ロイヤリティーアカウントを使用してサイトにログインし、デバッガーを使用して **Adobe Experience Platform Edge ネットワーク**. これらのリクエストはすべて、 **アシュランス** ログ追跡用。
<!--
   ![ADD SCREENSHOT](#)
-->