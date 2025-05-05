---
title: Platform Web SDK を使用した同意の設定
description: Experience PlatformWeb SDK タグ拡張機能のプライバシー設定の指定方法について説明します。 このレッスンは、「Web SDK を使用した Adobe Experience Cloud 実装のチュートリアル」の一部です。
feature: Web SDK,Tags,Consent
jira: KT-15413
exl-id: 502a7467-3699-4b2b-93bf-6b6069ea2090
source-git-commit: 8602110d2b2ddc561e45f201e3bcce5e6a6f8261
workflow-type: tm+mt
source-wordcount: '1604'
ht-degree: 1%

---

# Platform Web SDK を使用した同意の設定

Adobe Experience Platform Web SDK タグ拡張機能のプライバシー設定の指定方法について説明します。 訪問者による同意管理プラットフォーム（CMP）のバナーとのインタラクションに基づいて同意を設定します。

>[!NOTE]
> 
>このチュートリアルでは、デモ目的で [Klaro](https://klaro.org/) を CMP として使用します。 Klaro または Web サイトで使用する CMP を使用して進めることができます。


## 学習目標

このレッスンを終了すると、次の操作を実行できます。

* タグを使用した CMP の読み込み
* Experience PlatformWeb SDK タグ拡張機能のプライバシー設定
* 訪問者のアクションに基づいてExperience PlatformWeb SDK に同意を設定します

## 前提条件

タグの知識と、ルールやデータ要素の作成、環境へのライブラリのビルド、Experience Platformデバッガーを使用したタグライブラリの切り替えの手順を理解している必要があります。

プライバシー設定の設定と同意を設定するためのルールの作成を開始する前に、同意管理プラットフォームスクリプトが web サイトに挿入され、正しく機能していることを確認します。 CMP は、サイト開発者の助けを借りてソースコード内に直接読み込むか、タグ自体を介して読み込むことができます。 このレッスンでは、後者のアプローチを示します。

>[!NOTE]
> 
>1. 同意管理プラットフォーム（CMP）は、web サイトやアプリなどのオンラインソースから訪問者データを収集、共有または販売する前に、訪問者の同意オプションを法的にドキュメント化および管理するために組織で使用されます。
>
>2. CMP を挿入する方法として推奨されるのは、ソースコードを直接実行してからタグマネージャースクリプトを実行する方法です。

### Klaro の設定

タグ設定に進む前に、このチュートリアルの Klaro で使用する同意管理プラットフォームの詳細を確認してください。

1. [Klaro](https://klaro.org/) にアクセスしてアカウントを設定します。
1. **プライバシーマネージャー** に移動し、指示に従ってインスタンスを作成します。
1. **統合コード** を使用して、タグプロパティに Klaro を挿入します（手順は次の演習で説明します）。
1. **スキャン** の節はスキップしてください。これは、このチュートリアル用に作成したものではなく、Luma デモ web サイト上にハードコードされているタグプロパティを検出するからです。
1. `aep web sdk` という名前のサービスを追加し、「サービスのデフォルト状態 **をオンに切り替え** す。 オンにすると、デフォルトの同意値は `true` になり、オフにすると `false` になります。 この設定は、web アプリケーションに対する（訪問者の同意の前の）デフォルトの同意状態を決定する場合に便利です。 例：
   * CCPA の場合、通常、デフォルトの同意は `true` に設定されています。 このチュートリアル全体を通して、このシナリオを **暗黙のオプトイン** として参照します
   * GDPR の場合、デフォルトの同意は一般的に `false` に設定されています。 このチュートリアル全体を通して、このシナリオを **暗黙のオプトアウト** として参照します。

<!--
    This consent value can be verified by returning the JavaScript object ```klaro.getManager().consents``` in the browser's developer console.
-->
    >[!NOTE]
    >
    > 通常、上記の手順は、OneTrust や TrustArc など CMP を処理するチームまたは個人が実行し、注意を払います。

## CMP の挿入

>[!WARNING]
>
>同意管理プラットフォームを実装するベストプラクティスは、通常、タグマネージャーを読み込む前に CMP を読み込む __ です。 このチュートリアルを容易にするために、CMP _をタグマネージャーと共に_ 読み込みます。 このレッスンは、Platform Web SDK の同意機能の使用方法を示すように設計されており、Klaro やその他の CMP を正しく設定するためのガイドとしては使用しないでください。


Klaro の設定が完了したら、次の設定でタグルールを作成します。

* [!UICONTROL &#x200B; 名前 &#x200B;]: `all pages - library load - Klaro`
* [!UICONTROL &#x200B; イベント &#x200B;]:[!UICONTROL &#x200B; ライブラリが読み込まれました（ページのトップ） &#x200B;][!UICONTROL &#x200B; 詳細オプション &#x200B;]/[!UICONTROL &#x200B; 順序 &#x200B;] が 1 に設定されました
* [!UICONTROL &#x200B; 操作 &#x200B;]: [!UICONTROL &#x200B; カスタムコード &#x200B;]、[!UICONTROL &#x200B; 言語 &#x200B;]: CMP スクリプトの読み込みHTML。

![CMP ルールの挿入 ](assets/consent-cmp-inject-rule-1.png)

カスタムコードブロックは次のようになります。

![CMP ルールの挿入 ](assets/consent-cmp-inject-rule-2.png)

次に、このルールを保存して開発ライブラリに作成します。タグライブラリを Luma サイトから独自のサイトに切り替えて、同意バナーが表示されていることを検証します。 以下のような CMP バナーが web サイトに表示されます。 現在の訪問者の同意権限を確認するには、ブラウザーのコンソールで次のスニペットを使用します。

```javascript
    klaro.getManager().consents 
```

![ 同意バナー ](assets/consent-cmp-banner.png)

デバッグモードに入るには、Adobe Experience Platform debugger で次のチェックボックスを使用します。

![ タグデバッグモード ](assets/consent-rule-debugging.png)

また、訪問者の同意値がここに保存されるので、このチュートリアルを進めながら、Cookie とローカルストレージを複数回消去する必要がある場合もあります。 これは、次のようにして実行できます。

![ 貯蔵のクリア ](assets/consent-clearning-cookies.png)

## 同意シナリオ

GDPR、CCPA などのプライバシー上の行為は、同意実装の設計方法において重要な役割を果たします。 このレッスンでは、2 つの最も目立つプライバシー行為の下で、訪問者が同意バナーとやり取りする方法を調べます。
![ 同意シナリオ ](assets/consent-scenarios.jpeg)


### シナリオ 1：暗黙のオプトイン

黙示的なオプトインとは、企業がデータを収集する前に訪問者の同意を得る必要がない（または「オプトイン」）ことを意味し、web サイトへのすべての訪問者はデフォルトでオプトインとして扱われます。 ただし、訪問者は同意バナーを通じて cookie を拒否することでオプトアウトできます。 このユースケースは CCPA に似ています。

次に、このシナリオの同意を設定して実装します。

1. Experience PlatformWeb SDK タグ拡張機能の **[!UICONTROL プライバシー]** セクションで、**[!UICONTROL デフォルトの同意]** が **[!UICONTROL 受信]** に設定されていることを確認します。


   ![ 同意 AEP 拡張機能のプライバシー設定 ](assets/consent-web-sdk-privacy-in.png)

   >[!NOTE]
   > 
   >動的ソリューションの場合は、「データ要素を提供」オプションを選択し、```klaro.getManager().consents``` の値を返すデータ要素を渡します
   >
   >このオプションは、CMP がタグ埋め込みコード *before* のソースコードに挿入されている場合に使用され、Experience PlatformWeb SDK 拡張機能の読み込みが開始される前に、デフォルトの同意を使用できるようにします。 この例では、CMP がタグでロードされタグの前にロードされていないので、このオプションを使用できません。



2. この変更を保存し、タグライブラリにビルドします
3. Luma デモサイトでタグライブラリを読み込みます
4. Luma サイトでタグデバッグを有効にし、ページをリロードします。 ブラウザーの開発者コンソールで、defaultConsent が **[!UICONTROL In]** と等しいことがわかります
5. この設定では、訪問者が Cookie を拒否してオプトアウトしない限り、Experience PlatformWeb SDK 拡張機能は引き続きネットワークリクエストを送信します。

   ![ 同意の暗黙のオプトイン ](assets/consent-Implied-optin-default.png)



訪問者がオプトアウト（トラッキング cookie を拒否）を決定した場合、同意を **[!UICONTROL オプトアウト]** に変更する必要があります。 次の手順に従って、同意設定を変更します。

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

1. 訪問者が **拒否する** をクリックしたときにトリガーとなるルールを作成します。  このルールに `all pages - click consent banner - set consent "out"` という名前を付ける

1. **[!UICONTROL イベント]** として、**[!UICONTROL CSS セレクターに一致する要素]**`#klaro .cn-decline` で **[!UICONTROL クリック]** を使用します

   ![ ルール条件ユーザーが「I decline」をクリックする ](assets/consent-optOut-clickEvent.png)

1. Experience Platform Web SDK[!UICONTROL Set consent][!UICONTROL action type] を使用して、同意を「out」に設定します。

   ![ 同意ルールのオプトアウトアクション ](assets/consent-rule-optout-action.png)

1. **[!UICONTROL ライブラリおよびビルドに保存]** を選択します。

   ![ ライブラリを保存して構築する ](assets/consent-rule-optout-saveAndBuild.png)

これで、訪問者がオプトアウトすると、上記の方法で設定されたルールが起動し、Web SDK の同意が **[!UICONTROL Out]** に設定されます。

Luma デモサイトに移動して検証し、Cookie を拒否し、オプトアウト後に Web SDK リクエストが実行されないことを確認します。

### シナリオ 2：暗黙のオプトアウト


暗黙オプトアウトとは、訪問者をデフォルトでオプトアウトとして扱い、cookie を設定しないようにすることを意味します。 Web SDK リクエストは、訪問者が同意バナーを通じて cookie を受け入れて手動でオプトインすることを決定しない限り、実行されません。 GDPR が適用される EU 地域では、このようなユースケースに対処する必要が生じる場合があります。

次に、暗黙のオプトアウトシナリオの設定を行う方法を示します。

1. Klaro で、`aep web sdk` サービスの **サービスのデフォルト状態** をオフにして、更新された設定を保存します。

1. Experience PlatformWeb SDK 拡張機能の **[!UICONTROL プライバシー]** セクションで、デフォルトの同意を、必要に応じて **[!UICONTROL Out]** または **[!UICONTROL Pending]** に設定します。

   ![ 同意 AEP 拡張機能のプライバシー設定 ](assets/consent-implied-opt-out.png)

1. **保存** 更新した設定をタグライブラリに追加し、再構築します。

   この設定を使用すると、Experience PlatformWeb SDK は、同意権限が **[!UICONTROL In]** に変わらない限り、リクエストを実行しないようにします。 これは、訪問者がオプトインして手動で Cookie を受け入れた結果として発生する可能性があります。

1. Debugger で、Luma サイトがタグプロパティにマッピングされ、タグの console-logging がオンになっていることを確認します。
1. ブラウザーの開発者コンソールを使用して **アプリケーション**/**ストレージ** の **サイトデータを消去** します

1. Luma サイトをリロードすると、`defaultConsent` が **[!UICONTROL Out]** に設定され、Web SDK リクエストがおこなわれていないことがわかります

   ![ 同意の暗黙のオプトアウト ](assets/consent-implied-out-cmp.png)

訪問者がオプトイン （トラッキング cookie を受け入れる）を決定した場合、同意を変更し、**[!UICONTROL イン]** に設定する必要があります。 これをルールで行う方法を次に示します。

1. 訪問者が **問題ありません** をクリックしたときにトリガーとなるルールを作成します。  このルールに `all pages - click consent banner - set consent "in"` という名前を付ける

1. **[!UICONTROL イベント]** として、**[!UICONTROL CSS セレクターに一致する要素]**`#klaro .cm-btn-success` で **[!UICONTROL クリック]** を使用します

   ![ ルール条件ユーザーが「OK」をクリックする ](assets/consent-optIn-clickEvent.png)

1. **[!UICONTROL In]** として、Experience PlatformWeb SDK[!UICONTROL Extension]、**[!UICONTROL Action Type]** の **[!UICONTROL 同意の設定]**、**[!UICONTROL 一般的な同意]** を使用してアクションを追加します。

   ![ 同意ルールのオプトインアクション ](assets/consent-rule-optin-action.png)

   ここで注意すべきことの 1 つは、この [!UICONTROL &#x200B; 同意を設定 &#x200B;] アクションが、最初に送信されて ID を確立するリクエストになることです。 このため、最初のリクエスト自体で ID を同期することが重要な場合があります。 ID マップは、ID タイプデータ要素を渡すことで、[!UICONTROL &#x200B; 同意を設定 &#x200B;] アクションに追加できます。

1. **[!UICONTROL ライブラリおよびビルドに保存]** を選択します。

   ![ 同意ルールのオプトアウト ](assets/consent-rule-optin-saveAndBuild.png)

1. **[!UICONTROL 保存]** ルールをライブラリに保存し、再構築します。

このルールを設定したら、訪問者がオプトインしたときにイベントコレクションが開始されます。

![ 同意Post訪問者オプション ](assets/consent-post-user-optin.png)


Web SDK の同意について詳しくは、[ 顧客同意環境設定のサポート ](https://experienceleague.adobe.com/ja/docs/experience-platform/edge/consent/supporting-consent) を参照してください。


[!UICONTROL &#x200B; 同意を設定 &#x200B;] アクションについて詳しくは、[ 同意を設定 ](https://experienceleague.adobe.com/ja/docs/experience-platform/tags/extensions/client/web-sdk/action-types#set-consent) を参照してください。

[次へ： ](setup-event-forwarding.md)

>[!NOTE]
>
>Adobe Experience Platform Web SDK の学習に時間を費やしていただき、ありがとうございます。 ご不明な点がある場合や、一般的なフィードバックを投稿したい場合、または今後のコンテンツに関するご提案がある場合は、この [Experience League コミュニティ ディスカッションの投稿でお知らせください ](https://experienceleaguecommunities.adobe.com/t5/adobe-experience-platform-data/tutorial-discussion-implement-adobe-experience-cloud-with-web/td-p/444996?profile.language=ja)
