---
title: Adobe Experience Platformタグプロパティの作成と拡張機能のインストール
description: Adobe Experience Platformタグプロパティの作成と拡張機能のインストール
role: Developer
level: Intermediate
recommendations: noDisplay,noCatalog
kt: 10447
hide: true
hidefromtoc: true
exl-id: 7403059f-b34c-48e0-9efe-b2db7a9afb27
source-git-commit: cc7a77c4dd380ae1bc23dc75608e8e2224dfe78c
workflow-type: tm+mt
source-wordcount: '685'
ht-degree: 2%

---

# Adobe Experience Platformタグプロパティの作成と拡張機能のインストール

これで、ページ上のコードはデータとイベントをデータレイヤーにプッシュするので、マーケターはデータレイヤーからデータを読み取り、このデータをAdobe Experience Platformに送信する番です。 これには通常、2 つの JavaScript ライブラリが必要です。

* Adobeクライアントデータレイヤー：前の手順では、データレイヤー配列を作成し、オブジェクトをその配列にプッシュしました。 データにアクセスするには、Adobeクライアントデータレイヤー JavaScript ライブラリを読み込む必要があります。このライブラリでは、データレイヤーの変更やイベントを通知する方法と、データにアクセスする簡単な方法が提供されます。
* Adobe Experience Platform Web SDK:この JavaScript ライブラリは、Adobe Experience Platform Edge Network と通信します。 SDK は、ID、同意、データ収集、パーソナライゼーション、オーディエンスなどを処理します。

これらの個々のライブラリを Web サイトに読み込んで直接使用できますが、 [Adobe Experience Platformタグ](https://experienceleague.adobe.com/docs/experience-platform/tags/home.html?lang=ja). タグを使用すると、1 つのスクリプトをHTMLに埋め込み、タグユーザーインターフェイスを使用して、AdobeクライアントデータレイヤーとAdobe Experience Platform Web SDK の両方をデプロイできます。 また、タグを使用すると、データ送信などのルールを作成できます。 このチュートリアルでは、この目的でタグを使用し、タグの動作の基本を理解していることを前提としています。

## タグ内にプロパティを作成する

まだの場合、 [タグ内にプロパティを作成する](https://experienceleague.adobe.com/docs/experience-platform/tags/admin/companies-and-properties.html#create-or-configure-a-property).

## Adobeクライアントデータレイヤー拡張機能のインストール

Adobe機能カタログに移動し、拡張機能を探して、それぞれの [!UICONTROL インストール] 」ボタンをクリックします。 設定画面が表示されます。

![Adobeクライアントデータレイヤー拡張機能のインストール](../../../assets/implementation-strategy/acdl-extension-installation.png)

このチュートリアルでは、デフォルト値を変更する必要はありません。 「[!UICONTROL 保存]」をクリックします。

## Adobe Experience Platform Web SDK 拡張機能のインストール

次に、拡張機能カタログ内の拡張機能を探し、それぞれの [!UICONTROL インストール] 」ボタンをクリックします。 設定画面が表示されます。

![Adobe Experience Platform Web SDK 拡張機能のインストール](../../../assets/implementation-strategy/web-sdk-extension-installation.png)

In [データストリームの作成](../configure-the-server/create-a-datastream.md)では、Adobe Experience Platform Edge Network が参照するデータストリームを作成し、受信データの送信先を決定しました。 Adobe Experience Platform Web SDK から Edge Network にリクエストを送信する場合、Edge Network で参照するデータストリームを指定する必要があります。

これをおこなうには、 [!UICONTROL Datastream] 「 」フィールドを選択し、以前に作成したデータストリームを選択します。 同じデータストリーム環境が表示されます。 [データストリームの作成](../configure-the-server/create-a-datastream.md).

![データストリーム選択](../../../assets/implementation-strategy/web-sdk-datastream-selection.png)

詳しくは、 [データストリームの作成](../configure-the-server/create-a-dataset.md)の場合、これらのデータセット環境はタグ環境と関係があります。 Adobe Experience Platform Web SDK 拡張機能のインストールを完了したら、その拡張機能を含むタグライブラリを作成し、そのライブラリをタグ開発環境に公開します。 タグライブラリが Web ページに読み込まれ、Adobe Experience Platform Web SDK 拡張機能が Edge Network にリクエストを送信すると、拡張機能には [!UICONTROL 開発環境] datastream 環境 ID。 次に、Edge Network はこの ID を使用して [!UICONTROL 開発環境] datastream 環境を作成し、適切なAdobe製品にデータを転送します。

現時点では、1 つの開発データストリーム環境、1 つのステージングデータストリーム環境、1 つの実稼動データストリーム環境のみが存在します。 拡張機能の設定ユーザーインターフェイスには、事前に選択され、変更できないすべての内容が表示されるのは、そのためです。 ただし、datastream ユーザーインターフェイスを使用して、複数のデータストリーム開発環境（ユーザー向けと同僚向けの環境など）を作成することは可能です。 複数の開発データストリーム環境がある場合、このタグプロパティに使用する開発データストリーム環境を選択できます。

最後に、下にスクロールしてオフにします。 [!UICONTROL クリックデータ収集を有効にする]. デフォルトでは、SDK は自動的にリンクを追跡します。 ただし、このチュートリアルでは、カスタムリンク情報を使用して独自のリンククリックを追跡する方法を示します。

をクリックします。 [!UICONTROL 保存] ボタンをクリックして、Adobe Experience Platform Web SDK 拡張機能のインストールを完了します。

適切な拡張機能がインストールされている。 次に、ルールとデータ要素を作成します。
