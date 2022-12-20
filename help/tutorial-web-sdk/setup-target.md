---
title: Platform Web SDK でのAdobe Targetの設定
description: Platform Web SDK を使用したAdobe Targetの実装方法について説明します。 このレッスンは、「 Adobe Experience Cloudと Web SDK の実装」チュートリアルの一部です。
solution: Data Collection, Target
exl-id: 9084f572-5fec-4a26-8906-6d6dd1106d36
source-git-commit: cf0193e3aae4d6536c868f078f4773ee14e90408
workflow-type: tm+mt
source-wordcount: '3783'
ht-degree: 2%

---

# Platform Web SDK でのAdobe Targetの設定

Platform Web SDK を使用したAdobe Targetの実装方法について説明します。 エクスペリエンスを配信する方法と、追加のパラメーターを Target に渡す方法について説明します。

[Adobe Target](https://docs.adobe.com/content/help/ja-JP/experience-cloud/user-guides/home.translate.html) は、顧客のエクスペリエンスをカスタマイズおよびパーソナライズするために必要なすべてを提供するAdobe Experience Cloudアプリケーションです。web、モバイルサイト、アプリ、その他のデジタルチャネルでの売上高を最大化できます。

## 学習内容

このレッスンを最後まで学習すると、以下の内容を習得できます。

* 非同期タグ埋め込みコードで Target を使用する際にちらつきを防ぐために、Platform Web SDK の事前非表示スニペットを追加する方法を説明します。
* データストリームの設定で Target 機能を有効にします
* ページ読み込み時に視覚的なパーソナライゼーションの決定をレンダリングする（以前は「グローバル mbox」と呼ばれていました）
* XDM データを Target に渡し、Target パラメーターへのマッピングについて理解する
* プロファイルやエンティティのパラメーターなど、カスタムデータを Target に渡す
* Platform Web SDK を使用した Target 実装の検証


## 前提条件

この節のレッスンを完了するには、まず以下をおこなう必要があります。

* データ要素やルールの設定を含め、Platform Web SDK の初期設定に関するすべてのレッスンを完了していること。
* 次の項目があることを確認します。 [編集者または承認者の役割](https://experienceleague.adobe.com/docs/target/using/administer/manage-users/enterprise/properties-overview.html#section_8C425E43E5DD4111BBFC734A2B7ABC80).
* のインストール [Visual Experience Composer ヘルパー拡張機能](https://experienceleague.adobe.com/docs/target/using/experiences/vec/troubleshoot-composer/vec-helper-browser-extension.html) (Google Chrome ブラウザーを使用している場合 )
* Target でアクティビティを設定する方法を説明します。 リフレッシャーが必要な場合、このレッスンで役立つチュートリアルとガイドを次に示します。
   * [Visual Experience Composer(VEC) ヘルパー拡張の使用](https://experienceleague.adobe.com/docs/target/using/experiences/vec/troubleshoot-composer/vec-helper-browser-extension.html)
   * [Visual Experience Composer の使用](https://experienceleague.adobe.com/docs/target-learn/tutorials/experiences/use-the-visual-experience-composer.html)
   * [フォームベースの Experience Composer の使用](https://experienceleague.adobe.com/docs/target-learn/tutorials/experiences/use-the-form-based-experience-composer.html)
   * [エクスペリエンスのターゲット設定アクティビティを作成](https://experienceleague.adobe.com/docs/target-learn/tutorials/activities/create-experience-targeting-activities.html)

## ちらつきの緩和を追加

開始する前に、タグライブラリの読み込み方法に応じて、追加のちらつき処理ソリューションが必要かどうかを判断します。

>[!NOTE]
>
>このチュートリアルでは、 [Luma サイト](https://luma.enablementadobe.com/content/luma/us/en.html) これには、タグとちらつきを緩和する非同期実装が含まれています。 この節では、Platform Web SDK でのちらつきの緩和がどのように機能するかを説明します。


### 非同期実装

タグライブラリが非同期で読み込まれる場合、Target がコンテンツの入れ替えを実行する前に、ページのレンダリングが完了する可能性があります。 この動作により、Target で指定し、パーソナライズされたコンテンツに置き換えられる前に、デフォルトのコンテンツが短時間表示される、「ちらつき」と呼ばれる現象が発生する場合があります。 このちらつきを回避するには、Adobeでは、非同期タグ埋め込みコードの直前に、特別な事前非表示スニペットを追加することをお勧めします。

このスニペットは既に Luma サイトに存在しますが、このコードの動作を詳しく見てみましょう。

```html
<script>
  !function(e,a,n,t){var i=e.head;if(i){
  if (a) return;
  var o=e.createElement("style");
  o.id="alloy-prehiding",o.innerText=n,i.appendChild(o),setTimeout(function(){o.parentNode&&o.parentNode.removeChild(o)},t)}}
  (document, document.location.href.indexOf("mboxEdit") !== -1, ".body { opacity: 0 !important }", 3000);
</script>
```

事前に非表示になっているスニペットにより、選択した CSS 定義を使用して、ページの先頭に style タグが作成されます。 このスタイルタグは、Target からの応答を受信したとき、またはタイムアウトに達したときに削除されます。

事前非表示の動作は、スニペットの最後にある 2 つの設定で制御します。

* `body { opacity: 0 !important }` で、Target が読み込まれるまでの間に事前非表示に使用する CSS 定義を指定します。 デフォルトでは、ページ全体が非表示になっています。 この定義を、事前に非表示にするセレクターと、それらを非表示にする方法に合わせて更新できます。 この値は事前非表示のスタイルタグに挿入される値なので、複数の定義を含めることができます。 ナビゲーションの下のコンテンツをラッピングする、識別しやすいコンテナ要素がある場合、この設定を使用して、事前非表示をそのコンテナ要素に限定できます。
* `3000` 事前非表示のタイムアウトをミリ秒単位で指定します。 タイムアウト前に Target からの応答を受信しなかった場合、事前非表示の style タグは削除されます。 このタイムアウトに達することはまれです。

>[!NOTE]
>
>Platform Web SDK 用の事前非表示スニペットは、Target at.js ライブラリで使用されるスニペットとは少し異なります。 Platform Web SDK は、 `alloy-prehiding`. at.js の事前非表示スニペットを使用する場合は、正しく機能しない可能性があります。

事前非表示スニペットは、タグ内でも使用できます。

1. 次に移動： **[!UICONTROL 拡張機能]** タグのセクション
1. 選択 **[!UICONTROL 設定]** Adobe Experience Platform Web SDK 拡張機能の場合
1. を選択します。 **[!UICONTROL 事前に非表示になっているスニペットをクリップボードにコピーする]** ボタン

   ![非同期実装用の Target の事前非表示スニペット](assets/target-flicker-async.png)

   >[!NOTE]
   >
   >Platform Web SDK 拡張機能からコピーされたデフォルトの事前非表示スニペットには、サイトに存在しない CSS 定義（例： ）が含まれている場合があります `.personalization-container { opacity: 0 !important }`. 事前に非表示になっているスニペットを、サイトに合わせて適切に確認および変更してください。

### 同期実装

Adobeでは、Luma サイトで示すように、タグを非同期で実装することをお勧めします。 ただし、タグライブラリが同期的に読み込まれる場合は、事前に非表示になるスニペットは不要です。 代わりに、Platform Web SDK 拡張機能の設定で、事前非表示のスタイルを指定します。

同期実装の事前非表示スタイルは、次のように設定できます。

1. 次に移動： **[!UICONTROL 拡張機能]** タグのセクション
1. を選択します。 **[!UICONTROL 設定]** ボタン（Platform Web SDK 拡張機能用）
1. を選択します。 **[!UICONTROL 事前に非表示になっているスタイルを編集]** ボタン

   ![非同期実装用の Target の事前非表示スニペット](assets/target-flicker-sync.png)

1. CSS を変更して、使用するセレクターと非表示メソッドを含めます。次に例を示します。 `body { opacity: 0 !important }` ページの本文全体を事前に非表示にする場合。
1. 変更を保存し、ライブラリにビルドします。

>[!NOTE]
>
>事前非表示のスタイル設定は、同期実装でのみ使用するためのものです。 タグの非同期実装を使用している場合は、このスタイルを空白にするか、コメントアウトする必要があります。

Platform Web SDK でちらつきを制御する方法について詳しくは、ガイドの節を参照してください。 [パーソナライズされたエクスペリエンスのちらつきの管理](https://experienceleague.adobe.com/docs/experience-platform/edge/personalization/manage-flicker.html).


## データストリームの設定

Platform Web SDK から Target アクティビティを配信する前に、Target をデータストリーム設定で有効にする必要があります。

データストリームで Target を設定するには：

1. に移動します。 [データ収集](https://experience.adobe.com/#/data-collection){target=&quot;blank&quot;} インターフェイス
1. 左側のナビゲーションで、「 **[!UICONTROL データストリーム]**
1. 以前に作成したを選択 `Luma Web SDK` datastream

   ![Luma Web SDK データストリームを選択します。](assets/datastream-luma-web-sdk.png)

1. 選択 **[!UICONTROL サービスを追加]**

   ![データストリームにサービスを追加する](assets/target-datastream-addService.png)
1. 選択 **[!UICONTROL Adobe Target]** を **[!UICONTROL サービス]**
1. 必要に応じて、次のガイダンスに従って、Target 実装に関するオプションの詳細を入力します。
1. 選択 **[!UICONTROL 保存]**

   ![Target データストリーム設定](assets/target-datastream.png)

### プロパティトークン

Target Premium のお客様は、プロパティを使用してユーザー権限を管理することができます。 Target プロパティを使用すると、ユーザーが Target アクティビティを実行できる場所を境界で指定できます。 詳しくは、 [Enterprise 権限](https://experienceleague.adobe.com/docs/target/using/administer/manage-users/enterprise/properties-overview.html?lang=ja) の節を参照してください。

プロパティトークンを設定または検索するには、 **Adobe Target** > **[!UICONTROL 管理]** > **[!UICONTROL プロパティ]**. この `</>` アイコンに実装コードが表示されます。 この `at_property` 値は、データストリームで使用するプロパティトークンです。

![Target プロパティトークン](assets/target-admin-properties.png)

>[!NOTE]
>
>1 つのデータストリームにつき 1 つのプロパティトークンのみ指定できます。


### Target 環境 ID

[](https://experienceleague.adobe.com/docs/target/using/administer/environments.html) Target の環境を使用すると、開発のすべてのステージを通じて実装を管理できます。このオプションの設定では、各データストリームで使用する Target 環境を指定します。

Adobeでは、開発、ステージングおよび実稼動の各データストリームに対して、ターゲット環境 ID の設定を変更し、シンプルさを維持することをお勧めします。

環境 ID を設定または検索するには、 **Adobe Target** > **[!UICONTROL 管理]** > **[!UICONTROL 環境]**.

![ターゲット環境](assets/target-admin-environments.png)

>[!NOTE]
>
>Target 環境 ID が指定されていない場合、実稼動 Target 環境が想定されます。

### Target サードパーティ ID の名前空間

このオプションの設定では、Target サードパーティ ID に使用する ID シンボルを指定できます。 Target では、1 つの ID シンボルまたは名前空間でのプロファイルの同期のみサポートしています。 詳しくは、 [mbox3rdPartyId のリアルタイムプロファイル同期](https://experienceleague.adobe.com/docs/target/using/audiences/visitor-profiles/3rd-party-id.html) 」の節を参照してください。

ID 記号は、の ID リストにあります。 **データ収集** > **[!UICONTROL 顧客]** > **[!UICONTROL ID]**.

![ID リスト](assets/target-identities.png)

Luma サイトを使用するこのチュートリアルの目的では、ID シンボルを使用します。 `lumaCrmId` ～に関する授業中に立ち上がる [ID](configure-identities.md).


## 視覚的なパーソナライゼーションの決定をレンダリング

まず、Target およびタグインターフェイスで使用される用語を理解する必要があります。

* **アクティビティ**:1 つ以上のオーディエンスをターゲットにしたエクスペリエンスのセット。 例えば、単純な A/B テストは、2 つのエクスペリエンスを持つアクティビティにすることができます。
* **エクスペリエンス**:1 つ以上の場所または決定範囲をターゲットとする一連のアクション。
* **決定範囲**:Target エクスペリエンスが配信される場所。 古いバージョンの Target の使用に詳しい場合、決定範囲は「mbox」と同じです。
* **パーソナライズの決定**:サーバーが決定したアクションを適用する必要があります。 これらの決定は、オーディエンスの条件と Target のアクティビティの優先順位付けに基づく場合があります。
* **提案**:Platform Web SDK の応答で配信される、サーバーによる決定の結果です。 例えば、バナー画像を置き換えることは提案です。

### ページ型ルールの更新

Target がデータストリームで有効になっている場合、Target からの視覚的なパーソナライゼーションの決定は、Platform Web SDK によって配信されます。 しかし、 _これらは、自動的にはレンダリングされません_. 自動レンダリングを有効にするには、グローバルページ型ルールを変更する必要があります。

1. 内 [データ収集](https://experience.adobe.com/#/data-collection){target=&quot;blank&quot;} インターフェイスで、このチュートリアルで使用するタグプロパティを開きます。
1. を開きます。 `all pages - library load - AA & AT` ルール
1. を選択します。 `Adobe Experience Platform Web SDK - Send event` アクション
1. 有効にする **[!UICONTROL 視覚的なパーソナライゼーションの決定をレンダリング]** チェックボックスを使用

   ![視覚的なパーソナライゼーションの決定のレンダリングを有効にする](assets/target-rule-enable-visual-decisions.png)

1. 変更を保存し、ライブラリにビルドします。

レンダリングの視覚的なパーソナライゼーションの決定の設定では、Target Visual Experience Composer または「グローバル mbox」を使用して指定された変更が Platform Web SDK に自動的に適用されます。

>[!NOTE]
>
>通常、 [!UICONTROL 視覚的なパーソナライゼーションの決定をレンダリング] の設定は、完全なページ読み込みごとに 1 つのイベント送信アクションに対してのみ有効にする必要があります。 複数のイベント送信アクションでこの設定が有効になっている場合、以降のレンダリング要求は無視されます。

カスタムコードを使用して、これらの決定に対するレンダリングやアクションを自分でおこなう場合は、 [!UICONTROL 視覚的なパーソナライゼーションの決定をレンダリング] 設定が無効です。 Platform Web SDK は柔軟性が高く、この機能を使用して完全に制御できます。 詳しくは、ガイドを参照してください。 [パーソナライズされたコンテンツの手動レンダリング](https://experienceleague.adobe.com/docs/experience-platform/edge/personalization/rendering-personalization-content.html).

### Visual Experience Composer での Target アクティビティの設定

基本的な実装の手順が完了したら、Target でエクスペリエンスのターゲット設定 (XT) アクティビティを作成し、すべてが正しく機能していることを検証します。 Target のチュートリアルでは、 [エクスペリエンスのターゲット設定アクティビティの作成](https://experienceleague.adobe.com/docs/target-learn/tutorials/activities/create-experience-targeting-activities.html) サポートが必要な場合は、

>[!NOTE]
>
>Google Chrome をブラウザーとして使用している場合、 [Visual Experience Composer(VEC) ヘルパー拡張機能](https://experienceleague.adobe.com/docs/target/using/experiences/vec/troubleshoot-composer/vec-helper-browser-extension.html?lang=en) VEC での編集に適切にサイトを読み込むには、が必要です。

1. Target に移動
1. アクティビティ URL の Luma ホームページを使用して、エクスペリエンスターゲット設定 (XT) アクティビティを作成します。

   ![新しい XT アクティビティの作成](assets/target-xt-create-activity.png)

1. ページを変更します（例えば、ホームページのバナーのテキストを変更します）。

   ![Target VEC の変更](assets/target-xt-vec-modification.png)

1. 適切なレポートスイートを使用してレポートソースとしてAdobe Analyticsを選択し、目標として注文指標を選択します。

   >[!NOTE]
   >
   >Adobe Analyticsを使用しない場合は、 Target をレポートソースとして選択し、 **エンゲージメント/ページビュー数** 代わりに、 アクティビティを保存およびプレビューするには、目標指標が必要です。

1. アクティビティを保存
1. 変更に慣れた場合は、アクティビティをアクティブ化できます。 アクティブ化せずにエクスペリエンスをプレビューする場合は、 [QA プレビュー URL](https://experienceleague.adobe.com/docs/target/using/activities/activity-qa/activity-qa.html).
1. Luma のホームページを読み込むと、変更が適用されているのが確認できます。
1. 数時間後に、Adobe Analyticsで Target のアクティビティのデータとコンバージョンを確認できるようになります。 詳しくは、 Target ガイドを参照してください。 [Analytics for Target(A4T) レポート](https://experienceleague.adobe.com/docs/target/using/integrate/a4t/reporting.html?lang=en).



### デバッガーを使用した検証

アクティビティを設定すると、ページ上にコンテンツがレンダリングされます。 ただし、アクティビティがライブになっていない場合でも、イベントを送信ネットワーク呼び出しを調べて、Target が正しく設定されていることを確認することもできます。

>[!CAUTION]
>
>Google Chrome を使用し、 [Visual Experience Composer(VEC) ヘルパー拡張機能](https://experienceleague.adobe.com/docs/target/using/experiences/vec/troubleshoot-composer/vec-helper-browser-extension.html?lang=en) インストール済み、 **Target ライブラリを挿入** の設定は無効です。 この設定を有効にすると、追加の Target リクエストが発生します。

1. Adobe Experience Platform Debugger ブラウザー拡張機能を開きます。
1. 次に移動： [Luma デモサイト](https://luma.enablementadobe.com/content/luma/us/en.html) デバッガーを使用して、 [サイトのタグプロパティを独自の開発プロパティに切り替える](validate-with-debugger.md#use-the-experience-platform-debugger-to-map-to-your-tags-property)
1. ページを再読み込み
1. を選択します。 **[!UICONTROL ネットワーク]** デバッガーのツール
1. フィルター条件 **[!UICONTROL Adobe Experience Platform Web SDK]**
1. 最初の呼び出しのイベント行の値を選択

   ![Adobe Experience Platform Debugger でのネットワーク呼び出し](assets/target-debugger-network.png)

1. の下にキーがあることに注意してください。 `query` > `personalization` および  `decisionScopes` の値は `__view__`. このスコープは、Target の「グローバル mbox」と同じです。 この Platform Web SDK 呼び出しは、Target からリクエストされた決定です。

   ![__表示__ decisionScope リクエスト](assets/target-debugger-view-scope.png)

1. オーバーレイを閉じ、2 回目のネットワーク呼び出しのイベントの詳細を選択します。 この呼び出しは、Target がアクティビティを返した場合にのみ存在します。
1. Target から返されるアクティビティとエクスペリエンスに関する詳細があることに注意してください。 この Platform Web SDK 呼び出しは、Target アクティビティがユーザーにレンダリングされたという通知を送信し、インプレッションを増分します。

   ![Target アクティビティのインプレッション](assets/target-debugger-activity-impression.png)

## カスタム決定範囲の設定とレンダリング

カスタムの判定範囲（旧称「mbox」）は、Target フォームベースの Experience Composer を使用し、構造化された方法でHTMLまたは JSON コンテンツを配信するために使用できます。 これらのカスタムスコープの 1 つに配信されるコンテンツは、Platform Web SDK では自動的にはレンダリングされません。

### ページ型ルールに範囲を追加する

ページ型ルールを変更して、カスタムの決定範囲を追加します。

1. を開きます。 `all pages - library load - AA & AT` ルール
1. を選択します。 `Adobe Experience Platform Web SDK - Send Event` アクション
1. 使用するスコープを 1 つ以上追加します。 この例では、 `homepage-hero`.

   ![カスタムスコープ](assets/target-rule-custom-scope.png)

1. 変更を保存し、ライブラリにビルドします。

>[!TIP]
>
>このチュートリアルでは、デモ目的で、手動で定義した 1 つのスコープを使用します。 特定のページを対象とする複数の決定範囲を使用する場合は、ページパスに応じて条件に応じてスコープの配列を返すデータ要素の使用を検討する必要があります。 このアプローチは、実装をシンプルで拡張性の高いものにします。

### Target からの応答を処理します

これで、 `homepage-hero` 範囲を指定する場合は、応答で何らかの処理をおこなう必要があります。 Platform Web SDK タグ拡張機能は、 [!UICONTROL イベント送信完了] イベント。 [!UICONTROL イベントの送信] アクションを受け取りました。

1. という名前のルールを作成します。 `homepage - send event complete - render homepage-hero`.
1. イベントをルールに追加します。 以下を使用： **Adobe Experience Platform Web SDK** 拡張機能と **[!UICONTROL イベント送信完了]** イベントタイプ。
1. ルールを Luma ホームページに制限する条件を追加します（クエリ文字列を含まないパスは「次に等しい」です）。 `/content/luma/us/en.html`) をクリックします。
1. ルールにアクションを追加します。 以下を使用： **コア** 拡張と **カスタムコード** アクションタイプ。

   ![ホームページのヒーロールールをレンダリング](assets/target-rule-render-hero.png)

   >[!TIP]
   >
   >デフォルトの名前を使用する代わりに、ルールのイベント、条件、アクションにわかりやすい名前を付けます。 堅牢なルールコンポーネント名により、検索結果がより役に立ちます。

1. Platform Web SDK の応答から返された提案を読み取り、アクションを実行するためのカスタムコードを入力します。 この例のカスタムコードでは、ガイドで概要を説明している方法を使用して、 [パーソナライズされたコンテンツの手動レンダリング](https://experienceleague.adobe.com/docs/experience-platform/edge/personalization/rendering-personalization-content.html?lang=en#manually-rendering-content). コードは、 `homepage-hero` タグルールアクションを使用するスコープの例。

   ```javascript
   var propositions = event.propositions;
   
   var heroProposition;
   if (propositions) {
      // Find the hero proposition, if it exists.
      for (var i = 0; i < propositions.length; i++) {
         var proposition = propositions[i];
         if (proposition.scope === "homepage-hero") {
            heroProposition = proposition;
            break;
         }
      }
   }
   
   var heroHtml;
   if (heroProposition) {
      // Find the item from proposition that should be rendered.
      // Rather than assuming there a single item that has HTML
      // content, find the first item whose schema indicates
      // it contains HTML content.
      for (var j = 0; j < heroProposition.items.length; j++) {
         var heroPropositionItem = heroProposition.items[j];
         if (heroPropositionItem.schema === "https://ns.adobe.com/personalization/html-content-item") {
            heroHtml = heroPropositionItem.data.content;
            break;
         }
      }
   }
   
   if (heroHtml) {
      // Hero HTML exists. Time to render it.
      var heroElement = document.querySelector(".heroimage");
      heroElement.innerHTML = heroHtml;
      // For this example, we assume there is only a signle place to update in the HTML.
   }
   
   // Send a "display" event 
   alloy("sendEvent", {
      xdm: {
         eventType: "display",
         _experience: {
            decisioning: {
               propositions: [
                  {
                     id: heroProposition.id,
                     scope: heroProposition.scope,
                     scopeDetails: heroProposition.scopeDetails
                  }
               ]
            }
         }
      }
   });
   ```

1. 変更を保存し、ライブラリにビルドします。
1. Luma のホームページを数回読み込みます。これは、新しい `homepage-hero` Target インターフェイスの決定範囲の登録。

### フォームベースの Experience Composer を使用した Target アクティビティの設定

カスタムの決定範囲を手動でレンダリングするルールが作成されたので、Target で別のエクスペリエンスターゲット設定 (XT) アクティビティを作成できます。 今回は、フォームベースの Experience Composer を使用します。

1. 開く [Adobe Target](https://experience.adobe.com/target)
1. 前のレッスンで使用したアクティビティを非アクティブ化します
1. フォームベースの Experience Composer オプションを使用して、エクスペリエンスのターゲット設定 (XT) アクティビティを作成する

   ![新しい XT アクティビティの作成](assets/target-xt-create-form-activity.png)

1. を選択します。 **`homepage-hero`** 場所のドロップダウンと **[!UICONTROL HTMLオファーを作成]** を「コンテンツ」ドロップダウンから選択します。 場所がない場合は、その場所を入力できます。 Target は、その場所または範囲に対する要求を受け取った後で、新しい場所名を定期的に入力します。

   ![新しい XT アクティビティの作成](assets/target-xt-form-activity.png)

1. コンテンツボックスに次のコードを貼り付けます。 このコードは、異なる背景画像を持つ基本的なヒーローバナーです。

   ```html
   <div class="we-HeroImage jumbotron" style="background-image: url('/content/luma/us/en/women/_jcr_content/root/hero_image.coreimg.jpeg');">
      <div class="container cq-dd-image">
         <div class="we-HeroImage-wrapper">
            <p class="h3">New Luma Yoga Collection</p>
            <strong class="we-HeroImage-title h1">Be active with style&nbsp;</strong>
            <p>
               <a class="btn btn-primary btn-action" href="/content/luma/us/en/products.html" role="button">Shop Now</a>
            </p>
         </div>
      </div>
   </div>
   ```

1. の [!UICONTROL 目標と設定] 手順、レポートソースとしてAdobe Targetを選択し、 [!UICONTROL エンゲージメント] > [!UICONTROL ページビュー数] 目標として
1. アクティビティを保存
1. 変更に慣れた場合は、アクティビティをアクティブ化できます。 アクティブ化せずにエクスペリエンスをプレビューする場合は、 [QA プレビュー URL](https://experienceleague.adobe.com/docs/target/using/activities/activity-qa/activity-qa.html).
1. Luma のホームページを読み込むと、変更が適用されているのが確認できます。

>[!NOTE]
>
>「mbox をクリックしました」のコンバージョン目標は、自動的には機能しません。 Platform Web SDK は、カスタムスコープを自動的にレンダリングしないので、コンテンツの適用先として選択した場所へのクリック数は追跡しません。 「クリック」を使用して、各範囲に対して独自のクリック追跡を作成できます `eventType` 該当する `_experience` 詳細は `sendEvent` アクション。

### デバッガーを使用した検証

アクティビティをアクティブ化した場合は、ページ上にコンテンツがレンダリングされているのを確認します。 ただし、アクティビティがライブでない場合でも、 [!UICONTROL イベントの送信] Target がカスタムスコープのコンテンツを要求していることを確認するためのネットワーク呼び出し。

1. Adobe Experience Platform Debugger ブラウザー拡張機能を開きます。
1. 次に移動： [Luma デモサイト](https://luma.enablementadobe.com/content/luma/us/en.html) デバッガーを使用して、 [サイトのタグプロパティを独自の開発プロパティに切り替える](validate-with-debugger.md#use-the-experience-platform-debugger-to-map-to-your-tags-property)
1. ページを再読み込み
1. を選択します。 **[!UICONTROL ネットワーク]** デバッガーのツール
1. フィルター条件 **[!UICONTROL Adobe Experience Platform Web SDK]**
1. 最初の呼び出しのイベント行の値を選択

   ![Adobe Experience Platform Debugger でのネットワーク呼び出し](assets/target-debugger-network.png)

1. の下にキーがあることに注意してください。 `query` > `personalization` および  `decisionScopes` の値は `__view__` 前と同じように、今もある `homepage-hero` 範囲を含む。 この Platform Web SDK 呼び出しは、VEC と特定の `homepage-hero` 場所。

   ![__表示__ decisionScope リクエスト](assets/target-debugger-view-scope.png)

1. オーバーレイを閉じ、2 回目のネットワーク呼び出しのイベントの詳細を選択します。 この呼び出しは、Target がアクティビティを返した場合にのみ存在します。
1. Target から返されるアクティビティとエクスペリエンスに関する詳細があることに注意してください。 この Platform Web SDK 呼び出しは、Target アクティビティがユーザーにレンダリングされたという通知を送信し、インプレッションを増分します。

   ![Target アクティビティのインプレッション](assets/target-debugger-activity-impression.png)

## 追加データを Target に渡す

この節では、Target 固有のデータを渡し、XDM データが Target パラメーターにどのようにマッピングされるかを詳しく見ていきます。

XDM オブジェクトからマッピングされていない Target に役立つデータポイントがいくつかあります。 次の特殊な Target パラメーターが含まれます。

* [プロファイル属性](https://experienceleague.adobe.com/docs/target/using/implement-target/before-implement/methods/in-page-profile-attributes.html?lang=en)
* [Recommendationsエンティティの属性](https://experienceleague.adobe.com/docs/target/using/recommendations/entities/entity-attributes.html?lang=en)
* [Recommendations予約パラメーター](https://experienceleague.adobe.com/docs/target/using/recommendations/plan-implement.html?lang=en#pass-behavioral)
* カテゴリの値 [カテゴリ親和性](https://experienceleague.adobe.com/docs/target/using/audiences/visitor-profiles/category-affinity.html?lang=en)

### Target パラメーターのデータ要素の作成

まず、プロファイル属性、エンティティ属性、カテゴリ値に対して追加のデータ要素を設定し、 `data` XDM 以外のデータを渡すために使用されるオブジェクト：

* **`target.entity.id`** マッピング先 `digitalData.product.0.productInfo.sku`
* **`target.entity.name`** マッピング先 `digitalData.product.0.productInfo.title`
* **`target.user.categoryId`** 次のカスタムコードを使用して、トップレベルカテゴリのサイト URL を解析します。

   ```javascript
   var cat = location.pathname.split(/[/.]+/);
   if (cat[5] == 'products') {
      return (cat[6]);
   } else if (cat[5] != 'html') { 
      return (cat[5]);
   }
   ```

* **`data.content`** 次のカスタムコードを使用する。

   ```javascript
   var data = {
      __adobe: {
         target: {
            "entity.id": _satellite.getVar("target.entity.id"),
            "entity.name": _satellite.getVar("target.entity.name"),
            "profile.loggedIn": _satellite.getVar("user.profile.attributes.loggedIn"),
            "user.categoryId": _satellite.getVar("target.user.categoryId")
         }
      }
   }
   return data;
   ```

### ページ型ルールの更新

XDM オブジェクト外で Target の追加データを渡すには、適用可能なルールを更新する必要があります。 この例では、新しい **data.content** 汎用のページ型ルールおよび製品ページビュールールに対するデータ要素。

1. を開きます。 `all pages - library load - AA & AT` ルール
1. を選択します。 `Adobe Experience Platform Web SDK - Send event` アクション
1. を `data.content` データ要素をデータフィールドに追加します。

   ![ルールに Target データを追加](assets/target-rule-data.png)

1. 変更を保存し、ライブラリにビルドします。
1. の手順 1 ～ 4 を繰り返します。 **製品表示 — ライブラリ読み込み — AA** ルール

>[!NOTE]
>
>上記の例では、 `data` オブジェクトに含める必要があります。 タグはこの状況を適切に処理し、値が未定義のキーは除外します。 例： `entity.id` および `entity.name` 製品の詳細以外のページでは渡されませんでした。

### デバッガーを使用した検証

ルールが更新されたので、Debugger を使用して、データが正しく渡されているかどうかをAdobeで検証できます。

1. 次に移動： [Luma デモサイト](https://luma.enablementadobe.com/content/luma/us/en.html) 電子メールでログイン `test@adobe.com` およびパスワード `test`
1. 製品の詳細ページに移動します。
1. Adobe Experience Platform Debugger ブラウザー拡張機能を開き、 [タグプロパティを独自の開発プロパティに切り替える](validate-with-debugger.md#use-the-experience-platform-debugger-to-map-to-your-tags-property)
1. ページを再読み込み
1. を選択します。 **ネットワーク** ツールを使用して **Adobe Experience Platform Web SDK**
1. 最初の呼び出しのイベント行の値を選択
1. の下にキーがあることに注意してください。 `data` > `__adobe` > `target` また、製品、カテゴリ、ログイン状態に関する情報が入力されます。

   ![__表示__ decisionScope リクエスト](assets/target-debugger-data.png)

### Target インターフェイスでの検証

次に、Target インターフェイスを調べて、データが受信され、オーディエンスやアクティビティで使用できることを確認します。 XDM データは、カスタム Target パラメーターに自動的にマッピングされます。 XDM データが Target で受信され、オーディエンスを作成することで使用できることを検証できます。

1. 開く [Adobe Target](https://experience.adobe.com/target)
1. 次に移動： **[!UICONTROL オーディエンス]** セクション
1. オーディエンスを作成し、 **[!UICONTROL カスタム]** 属性タイプ
1. 検索 **[!UICONTROL パラメータ]** ～のフィールド `web`. ドロップダウンメニューに、Web ページの詳細に関連するすべての XDM フィールドが表示されます。

次に、ログイン状態のプロファイル属性が正常に渡されたことを検証します。

1. を選択します。 **[!UICONTROL 訪問者プロファイル]** 属性タイプ
1. `loggedIn` を検索します。ドロップダウンメニューで属性が使用できる場合、その属性が Target に正しく渡されていました。 新しい属性が Target UI で使用できるようになるまでに数分かかる場合があります。

Target Premium を使用している場合は、エンティティデータが正しく渡され、製品データがRecommendations製品カタログに書き込まれたことを検証することもできます。

1. 次に移動： **[!UICONTROL Recommendations]** セクション
1. 選択 **[!UICONTROL カタログ検索]** 左側のナビゲーション
1. Luma サイトで以前に訪問した製品 SKU または製品名を検索します。 商品が商品カタログに表示されます。 新しい製品がRecommendationsの製品カタログで検索できるようになるまで、数分かかる場合があります。

このレッスンが完了したら、Platform Web SDK を使用した、Adobe Targetの実装を実装する必要があります。

[次へ： ](setup-consent.md)

>[!NOTE]
>
>Adobe Experience Platform Web SDK の学習に時間を割いていただき、ありがとうございます。 ご質問がある場合、一般的なフィードバックを共有したい場合、または今後のコンテンツに関する提案がある場合は、こちらで共有してください [Experience Leagueコミュニティディスカッション投稿](https://experienceleaguecommunities.adobe.com/t5/adobe-experience-platform-launch/tutorial-discussion-implement-adobe-experience-cloud-with-web/td-p/444996)
