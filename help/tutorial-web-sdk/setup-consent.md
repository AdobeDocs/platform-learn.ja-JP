---
title: Platform Web SDK を使用した同意の設定
description: Web SDK タグ拡張機能のプライバシー設定のExperience Platform方法について説明します。 このレッスンは、「 Adobe Experience Cloudと Web SDK の実装」チュートリアルの一部です。
feature: Web SDK,Tags,Consent
exl-id: 502a7467-3699-4b2b-93bf-6b6069ea2090
source-git-commit: a8c7b94bafcde421d5f95ea53c7ecebb648319ab
workflow-type: tm+mt
source-wordcount: '1602'
ht-degree: 0%

---

# Platform Web SDK を使用した同意の設定

Web SDK タグ拡張機能のプライバシー設定のExperience Platform方法について説明します。 訪問者が同意管理プラットフォーム (CMP) のバナーとやり取りすることに基づいて同意を設定します。

>[!NOTE]
> 
>デモ用に、このチュートリアルではを使用します。 [クラロ](https://heyklaro.com/){target="_blank"} CMP として。 Klaro や、Web サイトで使用する CMP を使用して、フォローを進めていただければ幸いです。


## 学習内容

このレッスンを最後まで学習すると、次のことが可能になります。

* タグを使用して CMP を読み込む
* Experience PlatformWeb SDK タグ拡張機能でプライバシー設定を指定する
* 訪問者のアクションに基づいて、Experience PlatformWeb SDK に同意を設定する

## 前提条件

タグと、ルール、データ要素の作成、ライブラリの環境への構築、およびExperience Platformデバッガーを使用したタグライブラリの切り替えの手順について理解しておく必要があります。

プライバシー設定の設定を始め、同意の設定に関するルールを作成する前に、Web サイトに同意管理プラットフォームスクリプトが挿入され、正しく動作していることを確認してください。 CMP は、サイト開発者の助けを借りてソースコードに直接読み込むことも、タグ自体を介して読み込むこともできます。 このレッスンでは、後者のアプローチを示します。
>[!NOTE]
> 
>1. 組織は、同意管理プラットフォーム (CMP) を使用して、Web サイトやアプリなどのオンラインソースから訪問者データを収集、共有、販売する前に、訪問者の同意選択内容を法的に文書化し、管理します。
>
>2. CMP を挿入する際の推奨される方法は、タグマネージャースクリプトの前にソースコードを介して直接おこなう方法です。

### Klaro の設定

タグ設定に進む前に、このチュートリアル Klaro で使用する同意管理プラットフォームの詳細を確認してください。

1. 訪問 [クラロ](https://heyklaro.com/) アカウントを設定します。
1. に移動します。 **プライバシーマネージャー** 手順に従ってインスタンスを作成します。
1. 以下を使用します。 **統合コード** タグプロパティに Klaro を挿入する方法（手順は次の演習で説明します）。
1. スキップ **スキャン** セクションに追加する必要があります。これは、このチュートリアル用に作成したタグではなく、Luma デモ Web サイトでハードコードされたタグプロパティを検出するためです。
1. 次の名前のサービスを追加 `aep web sdk` をオンにし、オンに切り替えます。 **サービスのデフォルトの状態**. オンにすると、デフォルトの同意値は次のようになります。 `true`、それ以外の場合は `false`. この設定は、Web アプリケーションに対して（訪問者の同意前の）デフォルトの同意状態を決定する場合に便利です。 以下に例を示します。
   * CCPA の場合、デフォルトの同意は一般的に次のように設定されます。 `true`. このシナリオを次のように参照します： **暗黙のオプトイン** このチュートリアル全体
   * GDPR の場合、デフォルトの同意は一般に `false`. このシナリオを次のように参照します： **暗黙のオプトアウト** このチュートリアル全体を通して

<!--
    This consent value can be verified by returning the JavaScript object ```klaro.getManager().consents``` in the browser's developer console.
-->
    >[！注意 ]
    >
    > 通常、上記の手順は、OneTrust や TrustArc などの CMP の処理を担当するチームまたは個人がおこない、慎重におこないます。

## CMP を挿入する

>[!WARNING]
>
>同意管理プラットフォームを実装するベストプラクティスは、通常、CMP を読み込むことです _前_ タグマネージャーの読み込み中。 このチュートリアルを容易にするために、CMP を読み込みます _次を使用_ タグマネージャー このレッスンは、Platform Web SDK の同意機能の使用方法を示すように設計されており、Klaro やその他の CMP を正しく設定するためのガイドとして使用しないでください。


Klaro の設定が完了したら、次の設定を含むタグルールを作成します。

* [!UICONTROL 名前]：`all pages - library load - Klaro`
* [!UICONTROL イベント]: [!UICONTROL 読み込まれたライブラリ（ページ上部）] 次を使用 [!UICONTROL 詳細オプション] > [!UICONTROL 注文] 1 に設定
* [!UICONTROL アクション]: [!UICONTROL カスタムコード], [!UICONTROL 言語]:CMP スクリプトを読み込むHTML。

![CMP ルールを挿入](assets/consent-cmp-inject-rule-1.png)

カスタムコードブロックは次のようになります。

![CMP ルールを挿入](assets/consent-cmp-inject-rule-2.png)

次に、このルールを保存して開発ライブラリにビルドし、タグライブラリを Luma サイトから独自のタグライブラリに切り替えて、同意バナーが表示されることを検証します。 Web サイトには、次のような CMP バナーが表示されます。 また、現在の訪問者の同意権限を確認するには、ブラウザーのコンソールで次のスニペットを使用できます。

```javascript
    klaro.getManager().consents 
```

![同意バナー](assets/consent-cmp-banner.png)

デバッグモードに入るには、Adobe Experience Platform Debugger で次のチェックボックスを使用します。

![タグデバッグモード](assets/consent-rule-debugging.png)

また、訪問者の同意値が格納されるので、このチュートリアルの実行中に、Cookie とローカルストレージを複数回クリアする必要が生じる場合があります。 次のように簡単に実行できます。

![ストレージをクリア中](assets/consent-clearning-cookies.png)

## 同意シナリオ

GDPR、CCPA などのプライバシー行為は、同意の実装を設計する方法にとって重要な役割を果たします。 このレッスンでは、最も目立つ 2 つのプライバシー行為に基づいて、訪問者が同意バナーをどのように操作するかを調べます。
![同意シナリオ](assets/consent-scenarios.jpeg)


### シナリオ 1：暗黙のオプトイン

暗黙のオプトインは、ビジネスがデータを収集する前に訪問者の同意（または「オプトイン」）を取得する必要がないことを意味します。したがって、Web サイトへのすべての訪問者はデフォルトでオプトインとして扱われます。 ただし、訪問者は、同意バナーから Cookie を拒否することでオプトアウトできます。 この使用例は、CCPA に似ています。

次に、このシナリオに対する同意を設定および実装します。

1. Adobe Analytics の **[!UICONTROL プライバシー]** Experience PlatformWeb SDK タグ拡張のセクションで、  **[!UICONTROL デフォルトの同意]** が **[!UICONTROL In]** :


   ![同意 AEP 拡張機能のプライバシー設定](assets/consent-web-sdk-privacy-in.png)

   >[!NOTE]
   > 
   >動的ソリューションの場合、「データ要素を指定」オプションを選択し、 ```klaro.getManager().consents```
   >
   >このオプションは、CMP がソースコードに挿入される場合に使用されます。 *前* タグの埋め込みコードを使用して、Experience PlatformWeb SDK 拡張機能の読み込みを開始する前にデフォルトの同意を利用できるようにします。 この例では、CMP がタグで読み込まれ、タグの前ではなくなるので、このオプションを使用できません。



2. この変更をタグライブラリに保存してビルドします。
3. Luma デモサイトにタグライブラリを読み込む
4. Luma サイトでのタグのデバッグを有効にし、ページをリロードします。 ブラウザーの開発者コンソールで、defaultConsent が **[!UICONTROL In]**
5. この設定を使用すると、Experience Platformの Web SDK 拡張機能は、訪問者が cookie を拒否してオプトアウトしない限り、引き続きネットワークリクエストをおこないます。

   ![同意暗黙のオプトイン](assets/consent-Implied-optin-default.png)



訪問者がオプトアウト（トラッキング cookie を拒否）した場合は、 **[!UICONTROL 出力]**. 次の手順に従って、同意設定を変更します。

<!--
1. Create a data element to store the consent value of the visitor. Let's call it `klaro consent value`. Use the code snippet to create a custom code type data element:
    
    ```javascript
    return klaro.getManager().consents["aep web sdk"]
    ```

    ![Data Element consent value](assets/consent-data-element-value.png)


1. Create another custom code data element, `consent confirmed`, with the following snippet which returns ```true``` only after a visitor confirms consent:

    
    ```javascript
    return klaro.getManager().confirmed
    ```

    ![Data Element consent confirmed](assets/consent-data-element-confirmed.png)
-->

1. 訪問者がクリックしたときにトリガーを設定するルールを作成する **断る**.  このルールの名前を次のように設定します。 `all pages - click consent banner - set consent "out"`

1. を **[!UICONTROL イベント]**，使用 **[!UICONTROL クリック]** オン **[!UICONTROL CSS セレクターに一致する要素]** `#klaro .cn-decline`

   ![ルール条件のユーザーが「拒否」をクリックする](assets/consent-optOut-clickEvent.png)

1. 次に、Experience PlatformWeb SDK を使用します。 [!UICONTROL 同意の設定] [!UICONTROL アクションタイプ] 同意を「out」に設定するには、次のようにします。

   ![同意ルールのオプトアウトアクション](assets/consent-rule-optout-action.png)

1. 選択 **[!UICONTROL ライブラリに保存してビルドする]**:

   ![ライブラリを保存してビルドする](assets/consent-rule-optout-saveAndBuild.png)

現在は、訪問者がオプトアウトした場合に、上記の方法で設定されたルールが実行され、Web SDK の同意が次のように設定されます。 **[!UICONTROL 出力]**.

Luma デモサイトに移動して cookie を拒否し、オプトアウト後に Web SDK リクエストが実行されないことを確認して検証します。

### シナリオ 2：暗黙のオプトアウト


暗黙的なオプトアウトとは、訪問者がデフォルトでオプトアウト済みとして扱われ、cookie を設定しないことを意味します。 Web SDK リクエストは、訪問者が同意バナーを通じて Cookie を受け入れ、手動でオプトインすることにした場合を除き、実行しないでください。 GDPR が適用される欧州連合地域では、このような使用例に対処する必要が生じる場合があります。

暗黙のオプトアウトシナリオの設定方法を次に示します。

1. Klaro で、 **サービスのデフォルトの状態** の `aep web sdk` 変換サービスを実行し、更新した設定を保存します。

1. In **[!UICONTROL プライバシー]** Experience PlatformWeb SDK 拡張機能のセクションで、デフォルトの同意をに設定します。 **[!UICONTROL 出力]** または **[!UICONTROL 保留中]** 必要に応じて。

   ![同意 AEP 拡張機能のプライバシー設定](assets/consent-implied-opt-out.png)

1. **保存** 設定をタグライブラリに更新し、再構築します。

   この設定を使用すると、Experience PlatformWeb SDK は、同意権限がに変更されない限り、リクエストが実行されないようにします。 **[!UICONTROL In]**. これは、訪問者がオプトインによって手動で Cookie を受け入れた結果として発生する可能性があります。

1. デバッガーで、Luma サイトがタグプロパティにマッピングされ、タグコンソールログがオンになっていることを確認します。
1. ブラウザーの開発者コンソールを使用して、次の操作をおこないます。 **サイトデータを消去** in **アプリ** > **ストレージ**

1. Luma サイトをリロードすると、次のようになります。 `defaultConsent` が **[!UICONTROL 出力]** Web SDK リクエストはおこなわれていません

   ![同意暗黙のオプトアウト](assets/consent-implied-out-cmp.png)

訪問者がオプトイン（トラッキング cookie を受け入れる）を決定した場合は、同意を変更し、 **[!UICONTROL In]**. ルールを使用してこれをおこなう方法を次に示します。

1. 訪問者がクリックしたときにトリガーを設定するルールを作成する **それで結構です**.  このルールの名前を次のように設定します。 `all pages - click consent banner - set consent "in"`

1. を **[!UICONTROL イベント]**，使用 **[!UICONTROL クリック]** オン **[!UICONTROL CSS セレクターに一致する要素]** `#klaro .cm-btn-success`

   ![ルール条件のユーザーが「That&#39;s ok」をクリックする](assets/consent-optIn-clickEvent.png)

1. Experience PlatformWeb SDK を使用したアクションの追加 [!UICONTROL 拡張], **[!UICONTROL アクションタイプ]** / **[!UICONTROL 同意の設定]**, **[!UICONTROL 一般的な同意]** as **[!UICONTROL In]**.

   ![同意ルールのオプトインアクション](assets/consent-rule-optin-action.png)

   ここで注意すべきことの 1 つは、 [!UICONTROL 同意の設定] アクションは、送信され、id を確立する最初のリクエストになります。 このため、最初のリクエスト自体で ID を同期することが重要な場合があります。 ID マップは、 [!UICONTROL 同意の設定] id タイプのデータ要素を渡すアクションを実行する。

1. 選択 **[!UICONTROL ライブラリに保存してビルドする]**:

   ![同意ルールのオプトアウト](assets/consent-rule-optin-saveAndBuild.png)

1. **[!UICONTROL 保存]** ルールをライブラリに追加し、再構築します。

このルールを設定したら、訪問者がオプトインしたときにイベントの収集を開始する必要があります。

![同意投稿訪問者オプション](assets/consent-post-user-optin.png)


Web SDK での同意について詳しくは、 [顧客の同意設定のサポート](https://experienceleague.adobe.com/docs/experience-platform/edge/consent/supporting-consent.html?lang=en).


詳しくは、 [!UICONTROL 同意の設定] アクション： [同意の設定](https://experienceleague.adobe.com/docs/experience-platform/edge/extension/action-types.html?lang=en#set-consent).

[次へ： ](setup-event-forwarding.md)

>[!NOTE]
>
>Adobe Experience Platform Web SDK の学習に時間を割いていただき、ありがとうございます。 ご質問がある場合、一般的なフィードバックを共有する場合、または今後のコンテンツに関する提案がある場合は、このドキュメントで共有します [Experience Leagueコミュニティディスカッション投稿](https://experienceleaguecommunities.adobe.com/t5/adobe-experience-platform-launch/tutorial-discussion-implement-adobe-experience-cloud-with-web/td-p/444996)
