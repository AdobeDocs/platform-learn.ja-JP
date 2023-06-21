---
title: 開発者コンソールとPostmanの設定
seo-title: Set up Developer Console and Postman | Getting Started with Adobe Experience Platform for Data Architects and Data Engineers
breadcrumb-title: 開発者コンソールとPostmanの設定
description: このレッスンでは、Adobe Developer Console でプロジェクトを設定し、 [!DNL Postman] コレクションを使用して、Platform API の使用を開始できるようにします。
role: Data Architect, Data Engineer
feature: API
kt: 4348
thumbnail: 4348-set-up-developer-console-and-postman.jpg
exl-id: 72b541fa-3ea1-4352-b82b-c5b79ff98491
source-git-commit: 35242a037bc79f18e90399c47e47064634d26a37
workflow-type: tm+mt
source-wordcount: '1320'
ht-degree: 2%

---

# 開発者コンソールの設定および [!DNL Postman]

<!--30min-->

このレッスンでは、Adobe Developer Console でプロジェクトを設定し、ダウンロードします [!DNL Postman] コレクションを作成して、Platform API の使用を開始できるようにします。

このチュートリアルの API の演習を完了するには、 [お使いのオペレーティングシステム用のPostmanアプリをダウンロードします。](https://www.postman.com/downloads/) Experience PlatformAPI を使用するためには必要ありませんが、Postmanでは API ワークフローが容易になります。Adobe Experience Platformでは、API 呼び出しの実行とその動作方法の学習に役立つ、数十のPostmanコレクションが提供されています。 このチュートリアルの残りの部分では、Postmanの操作に関する知識を前提としています。 不明な点は、 [Postmanドキュメント](https://learning.postman.com/).

Platform は、API を使用して最初に構築されます。 すべての主要タスクに対してインターフェイスオプションも存在しますが、ある時点で Platform API を使用する必要が生じる場合があります。 例えば、データを取り込むには、サンドボックス間で項目を移動したり、ルーチンタスクを自動化したり、ユーザーインターフェイスが構築される前に新しい Platform 機能を使用したりします。

**データアーキテクト** および **データエンジニア** このチュートリアル以外で、Platform API を使用する必要が生じる場合があります。

## 必要な権限

内 [権限の設定](configure-permissions.md) レッスンでは、このレッスンを完了するために必要なすべてのアクセス制御を設定します。

<!--
* Permission item Sandboxes > `Luma Tutorial`
* Developer-role access to the `Luma Tutorial Platform` product profile
-->

## Adobe Developer Console の設定

Adobe Developerコンソールは、AdobeAPI および SDK へのアクセス、ほぼリアルタイムのイベントのリッスン、Runtime での関数の実行、App Builder アプリケーションの構築をおこなう開発者の宛先です。 この変数を使用してExperience PlatformAPI にアクセスします。 詳しくは、 [Adobe Developer Console ドキュメント](https://www.adobe.io/apis/experienceplatform/console/docs.html)

1. ローカルマシン上に、という名前のフォルダーを作成します。 `Luma Tutorial Assets` 」を参照してください。

1. を開きます。 [Adobe Developer Console](https://console.adobe.io){target="_blank"}

1. ログインし、正しい組織に属していることを確認します。

1. 選択 **[!UICONTROL 新規プロジェクトを作成]** in [!UICONTROL クイックスタート] メニュー

   ![新規プロジェクトを作成](assets/adobeio-createNewProject.png)


1. 新しく作成されたプロジェクトで、 **[!UICONTROL プロジェクトを編集]** ボタン
1. を **[!UICONTROL プロジェクトタイトル]** から `Luma Tutorial API Project` （会社の複数の担当者がこのチュートリアルを受け取る場合は、名前を末尾に追加します）
1. 「**[!UICONTROL 保存]**」を選択します

   ![Adobe Developer Console プロジェクト API 設定](assets/adobeio-renameProject.png)


1. 選択 **[!UICONTROL API を追加]**

   ![Adobe Developer Console プロジェクト API 設定](assets/adobeio-addAPI.png)

1. 選択してリストをフィルター **[!UICONTROL Adobe Experience Platform]**

1. 使用可能な API のリストで、 **[!UICONTROL Experience PlatformAPI]** を選択し、 **[!UICONTROL 次へ]**.

   ![Adobe Developer Console プロジェクト API 設定](assets/adobeio-AEPAPI.png)

1. 選択 **[!UICONTROL OAuth サーバー間]** 資格情報として「 」を選択し、 **[!UICONTROL 次へ]**.
   ![OAuth サーバー間を選択](assets/adobeio-choose-auth.png)

1. を選択します。 `AEP-Default-All-Users` 製品プロファイルを選択し、 **[!UICONTROL 設定済み API を保存]**

   ![製品プロファイルを選択](assets/adobeio-selectProductProfile.png)

1. これで、開発者コンソールプロジェクトが作成されました。

1. 内 **[!UICONTROL 試す]** 「 」セクションで、「 」を選択します。 **[!UICONTROL Postman用のダウンロード]** 次に、 **[!UICONTROL OAuth サーバー間]** をダウンロードするには [!DNL Postman] 環境 json ファイル。 保存する `oauth_server_to_server.postman_environment.json` の `Luma Tutorial Assets` フォルダー。


   ![Adobe Developer Console プロジェクト API 設定](assets/adobeio-io-api.png)

## システム管理者に API 資格情報を役割に追加してもらう

API 資格情報を使用してExperience Platformとやり取りするには、システム管理者に API 資格情報を前のレッスンで作成した役割に割り当ててもらう必要があります。  システム管理者でない場合は、次のように送信します。

1. この [!UICONTROL 名前] の API 資格情報 (`Credential in Luma Tutorial API Project`)
1. この [!UICONTROL テクニカルアカウントの電子メール] 資格情報（システム管理者が資格情報を見つけるのに役立ちます）

   ![[!UICONTROL 名前] および [!UICONTROL テクニカルアカウントの電子メール] の資格情報](assets/postman-credentialDetails.png)

システム管理者の手順は次のとおりです。

1. ログイン [Adobe Experience Platform](https://platform.adobe.com)
1. 選択 **[!UICONTROL 権限]** 左側のナビゲーションで、 [!UICONTROL 役割] screen
1. を開きます。 `Luma Tutorial Platform` 役割
   ![ロールを開く](assets/postman-openRole.png)
1. を選択します。 **[!UICONTROL API 資格情報]** タブ
1. 選択 **[!UICONTROL API 資格情報を追加]**
   ![資格情報を追加](assets/postman-addCredential.png)
1. 次を検索： `Credential in Luma Tutorial API Project` 秘密鍵証明書、フィルタリング [!UICONTROL テクニカルアカウントの電子メール] リストが長い場合は、チュートリアル参加者が提供します。
1. 秘密鍵証明書を選択
1. 「**[!UICONTROL 保存]**」を選択します


   ![資格情報を追加](assets/postman-findCredential.png)

## Postmanの設定

>[!CAUTION]
>
>Postmanインターフェイスは定期的に更新されます。 このチュートリアルのスクリーンショットは、Postman v10.15.1 for Macで撮影したものですが、インターフェイスオプションが変更された可能性があります。


1. ダウンロードとインストール [[!DNL Postman]](https://www.postman.com/downloads/)
1. 開く [!DNL Postman] ワークスペースの作成
   ![環境のインポート](assets/postman-createWorkspace.png)

1. ダウンロードした JSON 環境ファイルをインポートします。 `oauth_server_to_server.postman_environment.json`
   ![環境のインポート](assets/postman-importEnvironment.png)
1. In [!DNL Postman]、ドロップダウンで環境を選択します

1. アイコンを選択して環境変数を表示します。

   ![環境の変更](assets/postman-changeEnvironment.png)


### サンドボックス名とテナント ID の追加

この `SANDBOX_NAME` および `TENANT_ID` および `CONTAINER_ID` 変数は、Adobe Developer Console の書き出しには含まれないので、手動で追加します。

1. In [!DNL Postman]、 **環境変数**
1. を選択します。 **編集** 環境名の右にリンク
1. 内 **新しい変数フィールドを追加**&#x200B;を入力して、 `SANDBOX_NAME`
1. 両方の値フィールドに、 `luma-tutorial`：前のレッスンでサンドボックスに付けた名前。 サンドボックスに別の名前（例：luma-tutorial-ignatiusjreilly）を使用した場合は、必ずその値を使用してください。
1. 内 **新しい変数フィールドを追加**&#x200B;を入力して、 `TENANT_ID`
1. Web ブラウザーに切り替え、Experience Platformのインターフェイスに移動して URL の一部を抽出し、会社のテナント ID を検索します *@記号の後*. 例えば、テナント ID がの場合、 `techmarketingdemos` でも、君のは違う。

   ![Platform インターフェイス URL からのテナント ID の取得](assets/postman-getTenantId.png)

1. この値をコピーして、 [!DNL Postman] 環境を管理画面
1. テナント ID を両方の値フィールドに貼り付けます
1. 内 **新しい変数フィールドを追加**&#x200B;を入力して、 `CONTAINER_ID`
1. 入力 `global` 両方の値フィールド

   >[!NOTE]
   >
   >`CONTAINER_ID` は、チュートリアルの間に値が複数回変更されるフィールドです。 条件 `global` が使用されている場合、API は Platform アカウント内でAdobeが指定した要素とやり取りします。 条件 `tenant` が使用されている場合、API は独自のカスタム要素とやり取りします。

1. 「**保存**」を選択します

   ![環境変数として追加された SANDBOX_NAME、TENANT_ID、CONTAINER_ID の各フィールド](assets/postman-addEnvFields.png)



## API 呼び出しの実行

### アクセストークンの取得

Adobeは、 [!DNL Postman] コレクションを参照してください。Experience Platformの API を調べるのに役立ちます。 これらのコレクションは、 [Adobe Experience Platform Postmanのサンプル GitHub リポジトリ](https://github.com/adobe/experience-platform-postman-samples). このチュートリアル全体でこのを何度も使用するので、後で独自の会社にExperience Platformを実装する際には、このリポジトリをブックマークする必要があります。

最初のコレクションはAdobeIdentity Managementサービス (IMS)API と連携します。 これは、Postman内からアクセストークンを取得する便利な方法です。

アクセストークンを生成するには：

1. をダウンロードします。 [Identity Management Service API コレクション](https://github.com/adobe/experience-platform-postman-samples/blob/master/apis/ims/Identity%20Management%20Service.postman_collection.json) を `Luma Tutorial Assets` フォルダー
1. コレクションの読み込み先 [!DNL Postman]
1. リクエストを選択 **oAuth:アクセストークンをリクエスト** リクエストと選択 **送信**
1. 以下を受け取る必要があります。 `200 OK` レスポンスにアクセストークンを含むレスポンス

   ![トークンのリクエスト](assets/postman-requestToken.png)

1. アクセストークンは、 **ACCESS_TOKEN** 環境変数 [!DNL Postman] 環境。

   ![Postman](assets/postman-config.png)


### Platform API の操作

次に、Platform API 呼び出しを作成して、すべてが正しく設定されていることを確認します。

を開きます。 [Experience Platform [!DNL Postman] GitHub のコレクション](https://github.com/adobe/experience-platform-postman-samples/tree/master/apis/experience-platform). 様々な Platform API に対し、このページには多数のコレクションがあります。 私はそれをブックマークすることを強くお勧めします。

次に、最初の API 呼び出しを作成します。

1. をダウンロードします。 [スキーマレジストリ API コレクション](https://raw.githubusercontent.com/adobe/experience-platform-postman-samples/master/apis/experience-platform/Schema%20Registry%20API.postman_collection.json) を `Luma Tutorial Assets` フォルダー
1. インポート先 [!DNL Postman]
1. 開く **スキーマレジストリ API/スキーマ/リストスキーマ**
1. 以下を見る： **パラメーター** および **ヘッダー** タブに、前に入力した環境変数の一部が含まれていることを確認します。
1. なお、 **ヘッダー/値を承認フィールド** が `application/vnd.adobe.xed-id+json`. スキーマレジストリ API では、次のいずれかが必要です [指定された Accept ヘッダー値](https://experienceleague.adobe.com/docs/experience-platform/xdm/api/getting-started.html?lang=en#accept) 応答で異なる形式を提供する
1. 選択 **送信** を使用して、最初の Platform API 呼び出しをおこないます。

うまくいけば `200 OK` 次の図に示すように、サンドボックス内で使用可能なAdobe提供の XDM スキーマのリストを含む応答。

![Postmanでの最初の API 呼び出し](assets/postman-firstAPICall.png)

呼び出しが成功しなかった場合は、API 呼び出しのエラー応答の詳細を使用してデバッグに時間をかけ、上記の手順を確認します。 問題が発生した場合は、 [コミュニティフォーラム](https://experienceleaguecommunities.adobe.com/t5/adobe-experience-platform/ct-p/adobe-experience-platform-community?profile.language=ja) または、このページの右側にあるリンクを使用して「問題をログに記録」します。

Platform の権限、サンドボックス、 [!DNL Postman] を設定し、 [スキーマ内のモデルデータ](model-data-in-schemas.md)!
