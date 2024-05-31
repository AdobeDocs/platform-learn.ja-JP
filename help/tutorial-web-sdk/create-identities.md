---
title: Platform Web SDK の ID の作成
description: XDM で ID を作成する方法、および ID マップデータ要素を使用してユーザー ID を取得する方法を説明します。 このレッスンは、「Web SDK を使用した Adobe Experience Cloud 実装のチュートリアル」の一部です。
feature: Web SDK, Tags, Identities
jira: KT-15402
exl-id: 7ca32dc8-dd86-48e0-8931-692bcbb2f446
source-git-commit: c5318809bfd475463bac3c05d4f35138fb2d7f28
workflow-type: tm+mt
source-wordcount: '875'
ht-degree: 3%

---

# ID の作成

Adobe Experience Platform Web SDK を使用して ID を取得する方法について説明します。で未認証と認証済みの両方の ID データを取得 [Luma デモサイト](https://luma.enablementadobe.com/content/luma/us/en.html). ID マップと呼ばれる Platform Web SDK データ要素タイプを使用して認証済みデータを収集するために、前の手順で作成したデータ要素を使用する方法を説明します。

このレッスンでは、Adobe Experience Platform Web SDK タグ拡張機能で使用できる ID マップデータ要素に焦点を当てます。 認証済みユーザー ID と認証ステータスを含むデータ要素を XDM にマッピングします。

## 学習目標

このレッスンを終了すると、次の操作を実行できます。

* Experience Cloud ID （ECID）とファーストパーティデバイス ID （FPID）の関係について
* 未認証 ID と認証済み ID の違いについて
* ID マップデータ要素の作成

## 前提条件

データレイヤーとは何かを理解し、 [Luma デモサイト](https://luma.enablementadobe.com/content/luma/us/en.html){target="_blank"} データレイヤーを使用し、タグでデータ要素を参照する方法を理解する。 チュートリアルの前のレッスンを完了している必要があります。

* [XDM スキーマの設定](configure-schemas.md)
* [ID 名前空間の設定](configure-identities.md)
* [データストリームの設定](configure-datastream.md)
* [タグプロパティにインストールされている Web SDK 拡張機能](install-web-sdk.md)
* [データ要素の作成](create-data-elements.md)


## Experience Cloud ID

この [Experience CloudID （ECID）](https://experienceleague.adobe.com/en/docs/experience-platform/identity/features/ecid) は、Adobe Experience PlatformおよびAdobe Experience Cloud アプリケーション全体で使用される共有 id 名前空間です。 ECID は、顧客 ID の基盤を提供するもので、デジタルプロパティのデフォルト ID です。 ECID は常に存在するので、認証されていないユーザーの行動をトラッキングするための理想的な識別子です。

<!-- FYI I commented this out because it was breaking the build - Jack
>[!TIP]
>
> When you use the Experience Platform Web SDK to set up Adobe applications on your digital properties, the ECID is generated at the Adobe Edge server level. As such, ECID is not viewable on the client-side network request payload. You can view the ECID by seeing the Preview tab of the network request, or by using the [Adobe Experience Platform Debugger Edge Trace](set-up-analytics.md#experience-cloud-id-validation).
>![View ECID](assets/validate-dev-console-ecid.png)
-->

詳細を見る方法 [ECID は、Platform Web SDK を使用してトラッキングされます](https://experienceleague.adobe.com/en/docs/experience-platform/edge/identity/overview).

ECID は、ファーストパーティ cookie と Platform Edge Networkを組み合わせて設定されます。 デフォルトでは、ファーストパーティ ID Cookie は Web SDK によってクライアントサイドで設定されます。 Cookie の有効期間に関するブラウザーの制限を考慮して、代わりに独自のファーストパーティ ID Cookie をサーバーサイドで設定することを選択できます。 これらの ID Cookie は、ファーストパーティデバイス ID （FPID）と呼ばれます。

>[!IMPORTANT]
>
>この [Experience CloudID サービス拡張機能](https://exchange.adobe.com/apps/ec/100160/adobe-experience-cloud-id-launch-extension) id サービス機能はAdobe Experience Platform Web SDK に組み込まれているので、Platform Web SDK を実装する場合は必要ありません。

## ファーストパーティデバイス ID （FPID）

FPID はファーストパーティ cookie です _独自の web サーバーを使用して設定します_ このAdobeは、Web SDK で設定されたファーストパーティ Cookie を使用する代わりに、を使用して ECID を作成します。 ブラウザーのサポートは様々ですが、ファーストパーティ cookie は、DNS CNAME や JavaScript コードによって設定される場合とは異なり、DNS A レコード（IPv4 の場合）または AAAA レコード（IPv6 の場合）を活用するサーバーによって設定される場合に、より耐久性がある傾向があります。

FPID cookie を設定すると、その値を取得し、イベントデータが収集されたときにAdobeに送信できます。 収集された FPID は、Platform アプリケーションで ECID を生成するためのシードとして使用されます。この ECID は、引き続きAdobe Experience Cloud Edge Networkのデフォルトの識別子となります。

このチュートリアルでは FPID は使用しませんが、独自の Web SDK 実装で FPID を使用することをお勧めします。 詳細を読む： [Platform Web SDK のファーストパーティデバイス ID](https://experienceleague.adobe.com/en/docs/experience-platform/edge/identity/first-party-device-ids)

>[!CAUTION]
>
> FPID は、web サーバーで設定された cookie を使用して ECID を生成する別の方法です。 認証済みユーザーの識別には使用されません。

## 認証済み Id

上記のように、Platform Web SDK を使用する場合、デジタルプロパティへのすべての訪問者には、Adobeによって ECID が割り当てられます。 ECID 未認証のデジタル行動をトラッキングするデフォルト ID。

また、Platform が以下を作成できるように、認証済みユーザー ID を送信することもできます [ID グラフ](https://experienceleague.adobe.com/en/docs/platform-learn/tutorials/identities/understanding-identity-and-identity-graphs) Target で設定可能 [サードパーティ Id](https://experienceleague.adobe.com/en/docs/target/using/audiences/visitor-profiles/3rd-party-id). 認証済み ID の設定は、 [!UICONTROL ID マップ] データ要素タイプ。

を作成するには [!UICONTROL ID マップ] データ要素：

1. に移動 **[!UICONTROL データ要素]** を選択して、 **[!UICONTROL データ要素を追加]**

1. **[!UICONTROL 名前]** データ要素 `identityMap.loginID`

1. として **[!UICONTROL 拡張機能]**&#x200B;を選択 `Adobe Experience Platform Web SDK`

1. として **[!UICONTROL データ要素タイプ]**&#x200B;を選択 `Identity map`

1. 内で画面領域の右側が表示されます **[!UICONTROL データ収集インターフェイス]** id を設定するには：

   ![データ収集インターフェイス](assets/identity-identityMap-setup.png)

1. として  **[!UICONTROL 名前空間]**&#x200B;を選択し、 `lumaCrmId` で以前に作成した名前空間 [Id の設定](configure-identities.md) レッスン： ドロップダウンに表示されない場合は、と入力します。

1. 後 **[!UICONTROL 名前空間]** を選択しました。ID を設定する必要があります。 「」を選択します `user.profile.attributes.username` で以前に作成したデータ要素 [データ要素の作成](create-data-elements.md#create-data-elements-to-capture-the-data-layer) ユーザーが Luma サイトにログインしたときの ID をキャプチャするレッスン。

   <!--  >[!TIP]
    >
    >You can verify the **[!UICONTROL Luma CRM ID]** is collected in a data element on the web property by going to the [Luma Demo site](https://luma.enablementadobe.com/content/luma/us/en.html), logging in, [switching the tag environment](validate-with-debugger.md#use-the-experience-platform-debugger-to-map-to-your-tag-property) to your own, and typing `_satellite.getVar("user.profile.attributes.username")` in the web browser developer console.
    >
    >   ![Data Element  ID ](assets/identity-data-element-customer-id.png)
    -->

1. として **[!UICONTROL 認証状態]**&#x200B;を選択 **[!UICONTROL 認証済み]**
1. を選択 **[!UICONTROL プライマリ]**

1. を選択 **[!UICONTROL 保存]**

   ![データ収集インターフェイス](assets/identity-id-namespace.png)

>[!TIP]
>
> Adobeでは、次のような、人物を表す ID を送信することをお勧めします `Luma CRM Id`、として [!UICONTROL プライマリ] id。
>
> ID マップに人物識別子が含まれる場合（例： `Luma CRM Id`）に設定した場合、人物識別子はになります [!UICONTROL プライマリ] id。 そうでない場合、 `ECID` がになります [!UICONTROL プライマリ] id。




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

| コア拡張機能のデータ要素 | Platform Web SDK 拡張機能のデータ要素 |
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

[次へ： ](create-tag-rule.md)

>[!NOTE]
>
>Adobe Experience Platform Web SDK の学習に時間を費やしていただき、ありがとうございます。 ご質問がある場合、一般的なフィードバックを共有したい場合、または将来のコンテンツに関するご提案がある場合は、このページでお知らせください [Experience League コミュニティ ディスカッションの投稿](https://experienceleaguecommunities.adobe.com/t5/adobe-experience-platform-data/tutorial-discussion-implement-adobe-experience-cloud-with-web/td-p/444996)
