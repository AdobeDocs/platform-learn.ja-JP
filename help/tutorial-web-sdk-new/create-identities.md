---
title: ID の作成
description: XDM で ID を作成し、ID マップデータ要素を使用してユーザー ID を取得する方法について説明します。 このレッスンは、「 Adobe Experience Cloudと Web SDK の実装」チュートリアルの一部です。
feature: Tags
source-git-commit: aff41fd5ecc57c9c280845669272e15145474e50
workflow-type: tm+mt
source-wordcount: '858'
ht-degree: 1%

---

# ID の作成

Experience PlatformWeb SDK を使用して ID を取得する方法について説明します。 未認証 ID データと認証 ID データの両方を [Luma デモサイト](https://luma.enablementadobe.com/content/luma/us/en.html). ID マップと呼ばれる Platform Web SDK データ要素タイプで、認証済みデータを収集するために前の手順で作成したデータ要素を使用する方法について説明します。

このレッスンでは、 Adobe Experience Platform Web SDK タグ拡張機能で使用できる ID マップデータ要素に焦点を当てます。 認証済みユーザー ID と認証ステータスを含むデータ要素を XDM にマッピングします。

## 学習内容

このレッスンを最後まで学習すると、次のことが可能になります。

* Experience CloudID(ECID) とファーストパーティデバイス ID の違いについて
* 未認証 ID と認証済み ID の違いについて
* ID マップデータ要素の作成

## 前提条件

データレイヤーとは何かを把握し、 [Luma デモサイト](https://luma.enablementadobe.com/content/luma/us/en.html){target="_blank"} データレイヤーを参照し、タグ内のデータ要素を参照する方法を理解している必要があります。 このチュートリアルの前のレッスンで、以下の内容を習得している必要があります。

* [XDM スキーマの設定](configure-schemas.md)
* [ID 名前空間の設定](configure-identities.md)
* [データストリームの設定](configure-datastream.md)
* [タグプロパティにインストールされる Web SDK 拡張機能](install-web-sdk.md)
* [データ要素の作成](create-data-elements.md)


## Experience Cloud ID

The [Experience CloudID (ECID)](https://experienceleague.adobe.com/docs/experience-platform/identity/ecid.html?lang=en) は、Adobe Experience PlatformおよびAdobe Experience Cloudアプリケーションで使用される共有 id 名前空間です。 ECID は、顧客 ID の基盤を提供し、デジタルプロパティのデフォルト ID です。 これにより、ECID が常に存在するので、認証されていないユーザー行動の追跡に最適な識別子になります。

<!-- FYI I commented this out because it was breaking the build - Jack
>[!TIP]
>
> When you use the Experience Platform Web SDK to set up Adobe applications on your digital properties, the ECID is generated at the Adobe Edge server level. As such, ECID is not viewable on the client-side network request payload. You can view the ECID by seeing the Preview tab of the network request, or by using the [Adobe Experience Platform Debugger Edge Trace](set-up-analytics.md#experience-cloud-id-validation).
>![View ECID](assets/validate-dev-console-ecid.png)
-->

詳しくは、 [ECID は Platform Web SDK を使用して追跡されます](https://experienceleague.adobe.com/docs/experience-platform/edge/identity/overview.html?lang=en).

ECID は、ファーストパーティ Cookie と Platform Edge ネットワークの組み合わせを使用して設定されます。 デフォルトでは、ファーストパーティ Cookie は Web SDK によって設定されます。 cookie の有効期間に関するブラウザーの制限を考慮するには、代わりに、独自のファーストパーティ cookie の設定と管理を選択できます。 これらはファーストパーティデバイス ID(FPID) と呼ばれます。

>[!IMPORTANT]
>
>The [Experience CloudID サービス拡張機能](https://exchange.adobe.com/experiencecloud.details.100160.adobe-experience-cloud-id-launch-extension.html) は、Adobe Experience Platform Web SDK を実装する際には必要ありません。ID サービス機能は、Platform Web SDK に組み込まれているからです。

## ファーストパーティデバイス ID(FPID)

FPID はファーストパーティ Cookie です。 _独自の Web サーバーを使用して設定_ この Cookie は、Web SDK によって設定されるファーストパーティ cookie を使用する代わりに、を使用して ECID を設定します。 ファーストパーティ cookie は、DNS CNAME または JavaScript コードとは対照的に、DNS A レコード（IPv4 の場合）または AAAA レコード（IPv6 の場合）を利用するサーバーを使用して設定される場合に最も効果的です。

FPID Cookie が設定されると、その値を取得し、イベントデータの収集時にAdobeに送信できます。 収集された FPID は、Platform Edge Network 上で ECID を生成するシードとして使用されます。これは、引き続きAdobe Experience Cloudアプリケーションのデフォルトの識別子になります。

詳細を表示： [Platform Web SDK のファーストパーティデバイス ID](https://experienceleague.adobe.com/docs/experience-platform/edge/identity/first-party-device-ids.html?lang=ja)

>[!CAUTION]
>
> FPID は、Web サーバーで設定された Cookie を使用して ECID を生成する別の方法です。 認証済みユーザーを識別するためには使用されません。

## 認証済み ID

上記のように、デジタルプロパティへのすべての訪問者には、Platform Web SDK を使用する際に、Adobe別に ECID が割り当てられます。 これにより、ECID が、未認証のデジタル行動を追跡するためのデフォルトの ID になります。

また、認証済みユーザー ID を送信して、Platform が [ID グラフ](https://experienceleague.adobe.com/docs/platform-learn/tutorials/identities/understanding-identity-and-identity-graphs.html?lang=ja)の場合、Target はサードパーティを設定できます。 これは、 [!UICONTROL ID マップ] データ要素のタイプ。

次の手順で [!UICONTROL ID マップ] データ要素：

1. に移動します。 **[!UICONTROL データ要素]** を選択し、 **[!UICONTROL データ要素を追加]**

1. **[!UICONTROL 名前]** データ要素 `identityMap.loginID`

1. を **[!UICONTROL 拡張]**&#x200B;を選択します。 `Adobe Experience Platform Web SDK`

1. を **[!UICONTROL データ要素タイプ]**&#x200B;を選択します。 `Identity map`

1. これにより、 **[!UICONTROL データ収集インターフェイス]** を使用して id を設定します。

   ![データ収集インターフェイス](assets/identity-identityMap-setup.png)

1. を  **[!UICONTROL 名前空間]**&#x200B;を選択し、 `lumaCrmId` 以前に [ID の設定](configure-identities.md) レッスン。

   >[!NOTE]
   >
   >    見えない場合は、 `lumaCrmId` 名前空間で、デフォルトの実稼動サンドボックスでも作成したことを確認してください。 デフォルトの実稼動サンドボックスで作成された名前空間のみが、「名前空間」ドロップダウンに現在表示されます。

1. 次の期間の後に **[!UICONTROL 名前空間]** が選択されている場合は、ID を設定する必要があります。 を選択します。 `user.profile.attributes.username` 以前に [データ要素の作成](create-data-elements.md#create-data-elements-to-capture-the-data-layer) レッスン：ユーザーが Luma サイトにログインしたときに ID を取り込みます。

   <!--  >[!TIP]
    >
    >You can verify the **[!UICONTROL Luma CRM ID]** is collected in a data element on the web property by going to the [Luma Demo site](https://luma.enablementadobe.com/content/luma/us/en.html), logging in, [switching the tag environment](validate-with-debugger.md#use-the-experience-platform-debugger-to-map-to-your-tag-property) to your own, and typing `_satellite.getVar("user.profile.attributes.username")` in the web browser developer console.
    >
    >   ![Data Element  ID ](assets/identity-data-element-customer-id.png)
    -->

1. を **[!UICONTROL 認証済み状態]**&#x200B;を選択します。 **[!UICONTROL 認証済み]**
1. 選択 **[!UICONTROL プライマリ]**

1. 「**[!UICONTROL 保存]**」を選択します

   ![データ収集インターフェイス](assets/identity-id-namespace.png)

>[!TIP]
>
> Adobeでは、人物を表す ID（例： ）を送信することをお勧めします。 `Luma CRM Id`、 [!UICONTROL プライマリ] ID。
>
> ID マップに人物識別子 ( 例： `Luma CRM Id`) の場合、ユーザー ID が [!UICONTROL プライマリ] ID。 それ以外の場合は、 `ECID` が [!UICONTROL プライマリ] ID。




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

これらの手順の最後に、次のデータ要素を作成する必要があります。

| CORE 拡張機能のデータ要素 | Platform Web SDK のデータ要素 |
-----------------------------|-------------------------------
| `cart.orderId` | `identityMap.loginID` |
| `page.pageInfo.hierarchie1` | `xdm.variable.content` |
| `page.pageInfo.pageName` | |
| `page.pageInfo.server` | |
| `user.profile.attributes.loggedIn` | |
| `user.profile.attributes.username` | |

これらのデータ要素が配置されたら、タグでルールを作成して、XDM オブジェクトを介して Platform Edge Network へのデータ送信を開始する準備が整いました。

[次へ： ](create-tag-rule.md)

>[!NOTE]
>
>Adobe Experience Platform Web SDK の学習に時間を割いていただき、ありがとうございます。 ご質問がある場合、一般的なフィードバックを共有したい場合、または今後のコンテンツに関する提案がある場合は、こちらで共有してください [Experience Leagueコミュニティディスカッション投稿](https://experienceleaguecommunities.adobe.com/t5/adobe-experience-platform-launch/tutorial-discussion-implement-adobe-experience-cloud-with-web/td-p/444996)
