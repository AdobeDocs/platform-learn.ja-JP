---
title: Platform Web SDKの ID の作成
description: XDM で ID を作成する方法、および ID マップデータ要素を使用してユーザー ID を取得する方法を説明します。 このレッスンは、「Web SDK を使用した Adobe Experience Cloud 実装のチュートリアル」の一部です。
feature: Web SDK, Tags, Identities
jira: KT-15402
exl-id: 7ca32dc8-dd86-48e0-8931-692bcbb2f446
source-git-commit: 7ccbaaf4db43921f07c971c485e1460a1a7f0334
workflow-type: tm+mt
source-wordcount: '875'
ht-degree: 3%

---

# ID の作成

Adobe Experience Platform Web SDK を使用して ID を取得する方法について説明します。未認証と認証済みの両方の ID データを [Luma デモサイト ](https://luma.enablementadobe.com/content/luma/us/en.html) でキャプチャします。 ID マップと呼ばれる Platform Web SDK データ要素タイプを使用して認証済みデータを収集するために、前の手順で作成したデータ要素を使用する方法を説明します。

このレッスンでは、Adobe Experience Platform Web SDK タグ拡張機能で使用できる ID マップデータ要素に焦点を当てます。 認証済みユーザー ID と認証ステータスを含むデータ要素を XDM にマッピングします。

## 学習目標

このレッスンを終了すると、次の操作を実行できます。

* Experience Cloud ID （ECID）とファーストパーティデバイス ID （FPID）の関係について
* 未認証 ID と認証済み ID の違いについて
* ID マップデータ要素の作成

## 前提条件

データレイヤーとは何かを理解し、[Luma デモサイト ](https://luma.enablementadobe.com/content/luma/us/en.html){target="_blank"} データレイヤーに慣れ、タグでデータ要素を参照する方法を理解しました。 チュートリアルの前のレッスンを完了している必要があります。

* [XDM スキーマの設定](configure-schemas.md)
* [ID 名前空間の設定](configure-identities.md)
* [データストリームの設定](configure-datastream.md)
* [タグプロパティにインストールされている web SDK拡張機能](install-web-sdk.md)
* [データ要素の作成](create-data-elements.md)


## Experience Cloud ID

[Experience Cloud ID （ECID） ](https://experienceleague.adobe.com/en/docs/experience-platform/identity/features/ecid) は、Adobe Experience PlatformおよびAdobe Experience Cloud アプリケーションで使用される共有 ID 名前空間です。 ECID は、顧客 ID の基盤を提供するもので、デジタルプロパティのデフォルト ID です。 ECID は常に存在するので、認証されていないユーザーの行動をトラッキングするための理想的な識別子です。

<!-- FYI I commented this out because it was breaking the build - Jack
>[!TIP]
>
> When you use the Experience Platform Web SDK to set up Adobe applications on your digital properties, the ECID is generated at the Adobe Edge server level. As such, ECID is not viewable on the client-side network request payload. You can view the ECID by seeing the Preview tab of the network request, or by using the [Adobe Experience Platform Debugger Edge Trace](set-up-analytics.md#experience-cloud-id-validation).
>![View ECID](assets/validate-dev-console-ecid.png)
-->

詳しくは、Platform Web SDKを使用して [ECID をトラッキングする方法 ](https://experienceleague.adobe.com/en/docs/experience-platform/edge/identity/overview) を参照してください。

ECID は、ファーストパーティ cookie と Platform Edge Networkを組み合わせて設定されます。 デフォルトでは、ファーストパーティ ID Cookie は Web SDKによってクライアントサイドで設定されます。 Cookie の有効期間に関するブラウザーの制限を考慮して、代わりに独自のファーストパーティ ID Cookie をサーバーサイドで設定することを選択できます。 これらの ID Cookie は、ファーストパーティデバイス ID （FPID）と呼ばれます。

>[!IMPORTANT]
>
>ID サービス機能はExperience Cloud Web SDKに組み込まれているので、Adobe Experience Platform Web SDKを実装する場合、[Platform ID サービス拡張機能 ](https://exchange.adobe.com/apps/ec/100160/adobe-experience-cloud-id-launch-extension) は必要ありません。

## ファーストパーティデバイス ID （FPID）

FPID はファーストパーティ cookie です _ユーザーは独自の web サーバーを使用して設定します_ Adobeでは、Web SDKで設定されたファーストパーティ cookie を使用する代わりに、その後、ECID を作成するために使用します）。 ブラウザーのサポートは様々ですが、ファーストパーティ cookie は、DNS CNAME やJavaScript コードによって設定される場合とは異なり、DNS A レコード（IPv4 の場合）または AAAA レコード（IPv6 の場合）を利用するサーバーによって設定される場合に、より耐久性がある傾向があります。

FPID cookie を設定すると、その値を取得し、イベントデータが収集されたときにAdobeに送信できます。 収集された FPID は、Platform Edge Networkで ECID を生成するためのシードとして使用されます。この ECID は、引き続きAdobe Experience Cloud アプリケーションのデフォルトの識別子となります。

このチュートリアルでは FPID は使用しませんが、独自の web SDK実装で FPID を使用することをお勧めします。 詳しくは、[Platform Web SDKのファーストパーティデバイス ID](https://experienceleague.adobe.com/en/docs/experience-platform/edge/identity/first-party-device-ids) を参照してください。

>[!CAUTION]
>
> FPID は、web サーバーで設定された cookie を使用して ECID を生成する別の方法です。 認証済みユーザーの識別には使用されません。

## 認証済み Id

上記のように、Platform Web SDKを使用すると、デジタルプロパティへのすべての訪問者に、Adobeによって ECID が割り当てられます。 ECID は、未認証のデジタル行動を追跡するためのデフォルト ID です。

また、Platform で [ID グラフ ](https://experienceleague.adobe.com/en/docs/platform-learn/tutorials/identities/understanding-identity-and-identity-graphs) を作成し、Target で [ サードパーティ ID](https://experienceleague.adobe.com/en/docs/target/using/audiences/visitor-profiles/3rd-party-id) を設定できるように、認証済みユーザー ID を送信することもできます。 認証済み ID の設定は、[!UICONTROL ID マップ &#x200B;] データ要素タイプを使用して行われます。

[!UICONTROL ID マップ &#x200B;] データ要素を作成するには：

1. **[!UICONTROL データ要素]** に移動し、「**[!UICONTROL データ要素を追加]**」を選択します。

1. **[!UICONTROL Name]** データ要素 `identityMap.loginID`

1. **[!UICONTROL 拡張機能]** として、「`Adobe Experience Platform Web SDK`」を選択します

1. **[!UICONTROL データ要素タイプ]** として、「`Identity map`」を選択します

1. これにより、**[!UICONTROL データ収集インターフェイス]** 内の右側に画面エリアが表示され、ID を設定するように求められます。

   ![ データ収集インターフェイス ](assets/identity-identityMap-setup.png)

1. **[!UICONTROL 名前空間]** として、`lumaCrmId`ID の設定 [ のレッスンで以前作成した ](configure-identities.md) 名前空間を選択します。 ドロップダウンに表示されない場合は、と入力します。

1. **[!UICONTROL 名前空間]** を選択したら、ID を設定する必要があります。 `user.profile.attributes.username` データ要素の作成 [ のレッスンで前に作成した ](create-data-elements.md#create-data-elements-to-capture-the-data-layer) データ要素を選択します。これは、ユーザーが Luma サイトにログインしたときに ID を取得します。

   <!--  >[!TIP]
    >
    >You can verify the **[!UICONTROL Luma CRM ID]** is collected in a data element on the web property by going to the [Luma Demo site](https://luma.enablementadobe.com/content/luma/us/en.html), logging in, [switching the tag environment](validate-with-debugger.md#use-the-experience-platform-debugger-to-map-to-your-tag-property) to your own, and typing `_satellite.getVar("user.profile.attributes.username")` in the web browser developer console.
    >
    >   ![Data Element  ID ](assets/identity-data-element-customer-id.png)
    -->

1. **[!UICONTROL 認証状態]** として、「**[!UICONTROL 認証済み]**」を選択します
1. **[!UICONTROL プライマリ]** を選択

1. 「**[!UICONTROL 保存]**」を選択します

   ![ データ収集インターフェイス ](assets/identity-id-namespace.png)

>[!TIP]
>
> Adobeでは、`Luma CRM Id` などの人物を表す ID を [!UICONTROL &#x200B; プライマリ &#x200B;] ID として送信することをお勧めします。
>
> ID マップに人物識別子（例：`Luma CRM Id`）が含まれる場合、その人物識別子は [!UICONTROL &#x200B; プライマリ &#x200B;] ID になります。 それ以外の場合は、`ECID` が [!UICONTROL &#x200B; プライマリ &#x200B;] ID になります。




<!--
1. Once the data element is configured in **[!UICONTROL Data Collection interface]**, it can be tested on the Luma web property like any other Data Element. Enter the following script in the browser developer console
   
   
   ```
   _satellite.getVar('identityMap.loginID')
   ```  

   ![Data Collection interface](assets/identity-consoleIdentityDataElement.png)
   
   >[!NOTE]
   >
   >ECID identifier will NOT populate in the Data Element, as this is configured already with Platform Web SDK.   
-->

これらの手順の最後で、次のデータ要素が作成されているはずです。

| コア拡張機能のデータ要素 | Platform Web SDK Extension のデータ要素 |
-----------------------------|-------------------------------
| `cart.orderId` | `data.variable` |
| `cart.productInfo` | `identityMap.loginID` |
| `cart.productInfo.purchase` | `xdm.variable.content` |
| `page.pageInfo.hierarchie1` | |
| `page.pageInfo.pageName` | |
| `page.pageInfo.server` | |
| `product.category` | |
| `product.productInfo.sku` | |
| `product.productInfo.title` | |
| `user.profile.attributes.loggedIn` | |
| `user.profile.attributes.username` | |

これらのデータ要素を配置すると、タグにルールを作成することで、Platform Edge Networkへのデータ送信を開始する準備が整います。

>[!NOTE]
>
>Adobe Experience Platform Web SDKの学習にご協力いただき、ありがとうございます。 ご不明な点がある場合や、一般的なフィードバックを共有したい場合、または今後のコンテンツに関するご提案がある場合は、この [Experience League Community Discussion の投稿でお知らせください ](https://experienceleaguecommunities.adobe.com/t5/adobe-experience-platform-data/tutorial-discussion-implement-adobe-experience-cloud-with-web/td-p/444996)
