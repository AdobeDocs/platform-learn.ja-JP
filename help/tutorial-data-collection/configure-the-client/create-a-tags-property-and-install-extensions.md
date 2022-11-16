---
title: Adobe Experience Platformタグプロパティの作成と拡張機能のインストール
description: Adobe Experience Platformタグプロパティの作成と拡張機能のインストール
exl-id: d0fe82b5-a036-4e13-bae1-d1fee78d0084
source-git-commit: cc7a77c4dd380ae1bc23dc75608e8e2224dfe78c
workflow-type: tm+mt
source-wordcount: '688'
ht-degree: 2%

---

# Adobe Experience Platformの作成 [!DNL Tags] プロパティとインストール拡張機能

これで、ページ上のコードはデータとイベントをデータレイヤーにプッシュするので、マーケターはデータレイヤーからデータを読み取り、このデータをAdobe Experience Platformに送信する番です。 これには通常、2 つの JavaScript ライブラリが必要です。

* Adobeクライアントデータレイヤー：前の手順では、データレイヤー配列を作成し、オブジェクトをその配列にプッシュしました。 このデータにアクセスするには、Adobeクライアントデータレイヤー JavaScript ライブラリを読み込む必要があります。 このライブラリは、イベントとデータレイヤーの変更に関する通知と、データへのシンプルなアクセスを提供します。
* Adobe Experience Platform Web SDK:この JavaScript ライブラリは、 [Adobe Experience Platform Edge Network](https://business.adobe.com/products/experience-platform/experience-platform-edge-network.html). SDK は、ID、同意、データ収集、パーソナライゼーション、オーディエンスなどを処理します。

これらの個々のライブラリを Web サイトに読み込んで直接使用できますが、 [Adobe Experience Platformタグ](https://experienceleague.adobe.com/docs/experience-platform/tags/home.html?lang=ja). タグを使用すると、1 つのスクリプトをHTMLに埋め込み、タグユーザーインターフェイスを使用して、AdobeクライアントデータレイヤーとAdobe Experience Platform Web SDK の両方をデプロイできます。 また、タグを使用すると、データ送信などのルールを作成できます。 このチュートリアルでは、この目的でタグを使用し、タグの動作の基本を理解していることを前提としています。

## タグ内にプロパティを作成する

1. [タグでプロパティを作成する](https://experienceleague.adobe.com/docs/experience-platform/tags/admin/companies-and-properties.html#create-or-configure-a-property).

## Adobeクライアントデータレイヤー拡張機能のインストール

次のAdobeクライアントデータレイヤー拡張機能をインストールします。

1. 選択 **[!UICONTROL 拡張機能]** （このチュートリアルで使用するタグプロパティの左側のナビゲーション）。
1. を選択します。 **[!UICONTROL カタログ]** リンクをクリックし、「データレイヤー」を検索します。
1. 結果にAdobeクライアントデータレイヤーが表示されたら、 **[!UICONTROL インストール]** 」ボタンをクリックします。 設定画面が表示されます。 このチュートリアルでは、デフォルト値を変更する必要はありません。
1. 「**[!UICONTROL 保存]**」をクリックします。
   ![Adobeクライアントデータレイヤー拡張機能のインストール](../assets/acdl-extension-installation.png)


## Adobe Experience Platform Web SDK 拡張機能のインストール

次に、Adobe Experience Platform Web SDK 拡張機能をインストールします。

1. 拡張機能カタログ内の拡張機能を検索し、それぞれの **[!UICONTROL インストール]** 」ボタンをクリックします。 設定画面が表示されます。
   ![Adobe Experience Platform Web SDK 拡張機能のインストール](../assets/web-sdk-extension-installation.png)
1. 内 [!UICONTROL Datastream] 「 」フィールドで、以前に作成したデータストリームを選択します。 同じデータストリーム環境が表示されます。 [データストリームの作成](../configure-the-server/create-a-datastream.md).
   ![データストリーム選択](../assets/web-sdk-datastream-selection.png)
1. 設定画面で、を探してオフにします。 **[!UICONTROL クリックデータ収集を有効にする]**. デフォルトでは、SDK は自動的にリンクを追跡します。 ただし、このチュートリアルでは、カスタムリンク情報を使用して独自のリンククリックを追跡する方法を示します。
1. をクリックします。 **[!UICONTROL 保存]** ボタンをクリックして、Adobe Experience Platform Web SDK 拡張機能のインストールを完了します。

>[!TIP]
>
>データセット環境は、タグ環境と関係があります。 Adobe Experience Platform Web SDK 拡張機能のインストールを完了したら、その拡張機能を含むタグライブラリを作成し、そのライブラリをタグ開発環境に公開します。 タグライブラリが Web ページに読み込まれ、Adobe Experience Platform Web SDK 拡張機能が Edge Network にリクエストを送信すると、拡張機能には [!UICONTROL 開発環境] datastream 環境 ID。 次に、Edge Network はこの ID を使用して [!UICONTROL 開発環境] datastream 環境を作成し、適切なAdobe製品にデータを転送します。
>
>現時点では、1 つの開発データストリーム環境、1 つのステージングデータストリーム環境、1 つの実稼動データストリーム環境のみが存在します。 datastream ユーザーインターフェイスを使用して、複数のデータストリーム開発環境（自分用と同僚用など）を作成できます。 複数の開発データストリーム環境がある場合、このタグプロパティに使用する開発データストリーム環境を選択できます。


適切な拡張機能がインストールされている。 次に、ルールとデータ要素を作成します。

[次へ： ](create-rules-for-tracking-page-view-and-commerce-events.md)

>[!NOTE]
>
>データ収集に関する学習に時間を割いていただき、ありがとうございます。 ご質問がある場合、一般的なフィードバックを共有したい場合、または今後のコンテンツに関する提案がある場合は、こちらで共有してください [Experience Leagueコミュニティディスカッション投稿](https://experienceleaguecommunities.adobe.com/t5/adobe-experience-platform-launch/tutorial-discussion-use-adobe-experience-platform-data/m-p/543877)
