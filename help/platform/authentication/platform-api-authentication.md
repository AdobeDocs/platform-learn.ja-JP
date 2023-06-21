---
title: Experience Platform API の認証とアクセス
description: Adobe Experience Platform API へアクセスする方法を学習します。
role: Developer
feature: API
kt: 3688
thumbnail: 28832.jpeg
last-substantial-update: 2023-06-21T00:00:00Z
exl-id: c1774670-436e-46dd-9c9b-177bfee5f749
source-git-commit: 60f509ef55ce121f572466a8f13953dba982a0ce
workflow-type: tm+mt
source-wordcount: '260'
ht-degree: 16%

---

# 認証とアクセス [!DNL Experience Platform] API

Adobe Experience Platform API にリクエストを送信するには、Experience Platform開発者アカウントが必要です。

## Adobe Developer Console でプロジェクトを作成し、Postman環境を書き出す

[[!DNL Postman]](https://www.postman.com/) は、開発者がAdobe Experience Platform API をすばやく簡単に操作できるツールです。

Adobe Developer Console&#39;s **Postmanの詳細を書き出し** 機能を使用すると、Experience PlatformAPI へのアクセスと操作に必要なすべてのアカウントの詳細を 1 つのPostman環境ファイルに簡単に書き出せるので、Adobe DeveloperコンソールからPostmanに値をコピーして貼り付ける必要がありません。

>[!VIDEO](https://video.tv.adobe.com/v/28832/?quality=12&learn=on)

>[!IMPORTANT]
>
>API 資格情報を作成した後、会社のシステム管理者は、資格情報をExperience Platformの役割に関連付ける必要があります。


## Postmanでのアクセストークンの生成

以下を使用： [AdobeIdentity Management Service API](https://github.com/adobe/experience-platform-postman-samples/tree/master/apis/ims) をクリックして、Adobe Experience Platform API にアクセスするためのアクセストークンを取得します。

>[!VIDEO](https://video.tv.adobe.com/v/29698/?quality=12&learn=on)


## Postmanを使用したExperience PlatformAPI の操作

を使用したAdobe Experience Platform API の操作の調査 [Adobeが提供するExperience PlatformAPI Postmanコレクション](https://github.com/adobe/experience-platform-postman-samples/tree/master/apis/experience-platform)そして、 [Adobe Developer Console 環境変数](#export-adobe-io-integration-details-to-postman) および [生成されたアクセストークン](#generate-an-access-token-with-postman).

>[!VIDEO](https://video.tv.adobe.com/v/29704/?quality=12&learn=on)


## その他のリソース

* [Adobe 開発者コンソール](https://developer.adobe.com/console/home)
* [Adobe Experience Platform Postmanのサンプル](https://github.com/adobe/experience-platform-postman-samples)
   * [アクセストークン生成用のIdentity Management System Postmanコレクション](https://github.com/adobe/experience-platform-postman-samples/tree/master/apis/ims)
   * [Adobe Experience Platform API Postmanコレクション](https://github.com/adobe/experience-platform-postman-samples/tree/master/apis/experience-platform)
* [Postmanをダウンロード](https://www.postman.com/)
