---
title: データ取得イベントへのサブスクライブ
seo-title: Subscribe to data ingestion events | Getting Started with Adobe Experience Platform for Data Architects and Data Engineers
breadcrumb-title: データ取得イベントへのサブスクライブ
description: このレッスンでは、Adobe Developerコンソールとオンライン Webhook 開発ツールを使用して Webhook を設定し、データ取得イベントをサブスクライブします。 これらのイベントを使用して、後続のレッスンでのデータ取得ジョブのステータスを監視します。
role: Data Engineer
feature: Data Management
kt: 4348
thumbnail: 4348-subscribe-to-data-ingestion-events.jpg
exl-id: f4b90832-4415-476f-b496-2f079b4fcbbc
source-git-commit: cc7a77c4dd380ae1bc23dc75608e8e2224dfe78c
workflow-type: tm+mt
source-wordcount: '516'
ht-degree: 6%

---

# データ取得イベントへのサブスクライブ

<!--25min-->

このレッスンでは、Adobe Developerコンソールとオンライン Webhook 開発ツールを使用して Webhook を設定し、データ取得イベントをサブスクライブします。 これらのイベントを使用して、後続のレッスンでのデータ取得ジョブのステータスを監視します。

**データエンジニア** では、このチュートリアル以外で、データ取得イベントにサブスクライブする必要があります。
**データアーキテクト** _このレッスンをスキップ_ そして、 [バッチ取得レッスン](ingest-batch-data.md).

## 必要な権限

内 [権限の設定](configure-permissions.md) レッスンでは、このレッスンを完了するために必要なすべてのアクセス制御を設定します。具体的には、次の設定を行います。

<!--* Developer-role access to the `Luma Tutorial Platform` product profile (for API)
-->

>[!IMPORTANT]
>
> データ取り込みイベントによってトリガーされるこれらの通知は、 _すべてのサンドボックス_&#x200B;を `Luma Tutorial`. また、アカウント内の他のデータ取り込みイベントからの通知が表示される場合もあります。


## ウェブフックの設定

この練習では、webhook.site というオンラインツールを使用して Webhook を作成します（他の Webhook 開発ツールを自由に置き換えてください）。

1. 別のブラウザータブで、Web サイトを開きます。 [https://webhook.site/](https://webhook.site/)
1. 一意の URL が割り当てられています。この URL は、後でデータ取得レッスンで戻る際にブックマークにする必要があります。

   ![Webhook.site](assets/ioevents-webhook-home.png)
1. を選択します。 **編集** 上部のナビゲーションのボタン
1. 応答の本文に、と入力します。 `$request.query.challenge$`. このレッスンで後で設定するAdobe I/Oイベント通知は、Webhook にチャレンジを送信します。この通知を応答の本文に含める必要があります。
1. を選択します。 **保存** ボタン

   ![応答を編集](assets/ioevents-webhook-editResponse.png)

## 設定

1. 別のブラウザータブで、 [Adobe Developer Console](https://console.adobe.io/)
1. を開きます。 `Luma Tutorial API Project`
1. を選択します。 **[!UICONTROL プロジェクトに追加]** ボタンをクリックし、 **[!UICONTROL イベント]**

   ![イベントを追加](assets/ioevents-addEvents.png)
1. 選択してリストをフィルター **[!UICONTROL Experience Platform]**
1. 選択 **[!UICONTROL プラットフォーム通知]**
1. を選択します。 **[!UICONTROL 次へ]** ボタン
   ![通知を追加する](assets/ioevents-addNotifications.png)
1. すべてのイベントを選択
1. を選択します。 **[!UICONTROL 次へ]** ボタン
   ![購読を選択](assets/ioevents-addSubscriptions.png)
1. 資格情報を設定する次の画面で、 **[!UICONTROL 次へ]** 再びボタンを押す
   ![秘密鍵証明書画面をスキップ](assets/ioevents-clickNext.png)
1. を **[!UICONTROL イベント登録名]**&#x200B;を入力して、 `Platform notifications`
1. 下にスクロールし、を選択して開きます。 **[!UICONTROL ウェブフック]** セクション
1. を **[!UICONTROL ウェブフック URL]**」で、 **固有の URL** webhook からのフィールド
1. を選択します。 **[!UICONTROL 設定済みイベントを保存]** ボタン
   ![イベントの保存](assets/ioevents-addWebhook.png)
1. 設定が保存されるまで待つと、 `Platform notifications` イベントは Webhook の詳細とエラーメッセージを含むアクティブです
   ![設定が保存されました](assets/ioevents-webhookConfigured.png)
1. webhook.site タブに戻ると、Webhook への最初のリクエストが表示されます。これは、開発者コンソール設定の検証結果です。
   ![webhook.site での最初のリクエスト](assets/ioevents-webhook-firstRequest.png)

現時点では、データを取り込む際の次のレッスンで、これらの通知に関する詳細を確認できます。

## その他のリソース

* [Webhook.site](https://webhook.site/)
* [データ取得通知のドキュメント](https://experienceleague.adobe.com/docs/experience-platform/ingestion/quality/subscribe-events.html)
* [イベントイベントの使用のAdobe I/Oに関するドキュメント](https://www.adobe.io/apis/experienceplatform/events/docs.html)

よし、ようやく始めよう [データの取り込み](ingest-batch-data.md)!
