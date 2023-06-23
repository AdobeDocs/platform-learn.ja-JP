---
title: Experience Platform API の認証とアクセス
description: Adobe Experience Platform API へアクセスする方法を学習します。
role: Developer
feature: API
jira: KT-3688
thumbnail: 28832.jpeg
last-substantial-update: 2023-06-21T00:00:00Z
exl-id: c1774670-436e-46dd-9c9b-177bfee5f749
source-git-commit: 90f7621536573f60ac6585404b1ac0e49cb08496
workflow-type: tm+mt
source-wordcount: '334'
ht-degree: 17%

---

# 認証とアクセス [!DNL Experience Platform] API

Adobe Experience Platform API の使用を開始する方法を説明します。 このチュートリアルでは、認証資格情報を作成し、Experience PlatformAPI リクエストの作成を開始するプロセスについて説明します。

## Adobe Developer Console でプロジェクトを作成し、Postman環境を書き出す{#export-integration-details-to-postman}

[[!DNL Postman]](https://www.postman.com/) は、開発者がAdobe Experience Platform API をすばやく簡単に操作できるようにするサードパーティアプリケーションです。

[Adobe Developer Console&#39;s](https://developer.adobe.com/console/home) **Postmanの詳細を書き出し** 機能を使用すると、Experience PlatformAPI へのアクセスと操作に必要なアカウントの詳細を 1 つのPostman環境ファイルに簡単に書き出せるので、Adobe DeveloperコンソールからPostmanに値をコピー&amp;ペーストする必要がありません。

>[!IMPORTANT]
>
>次の手順で [Adobe Developer Console](https://developer.adobe.com/console/home)の場合、 [システム管理者](https://helpx.adobe.com/jp/enterprise/using/admin-roles.html) または [開発者](https://helpx.adobe.com/enterprise/using/manage-developers.html#:~:text=Add%20developers%20to%20a%20single%20product%20profile&amp;text=In%20the%20Admin%20Console%2C%20navigate,in%20the%20upper%2Dright%20corner.) 内 [Adobe Admin Console](https://adminconsole.adobe.com).
>
> API 資格情報を作成した後、システム管理者は資格情報をExperience Platformの役割に関連付ける必要があります。

>[!VIDEO](https://video.tv.adobe.com/v/28832/?quality=12&learn=on)




## Postmanでのアクセストークンの生成{#generate-an-access-token-with-postman}

以下を使用： [AdobeIdentity Management Service API](https://github.com/adobe/experience-platform-postman-samples/tree/master/apis/ims) をクリックして、Adobe Experience Platform API にアクセスするためのアクセストークンを取得します。

>[!VIDEO](https://video.tv.adobe.com/v/29698/?quality=12&learn=on)


## Postmanを使用したExperience PlatformAPI の操作

を使用したAdobe Experience Platform API の操作の調査 [Adobeが提供するExperience PlatformAPI Postmanコレクション](https://github.com/adobe/experience-platform-postman-samples/tree/master/apis/experience-platform)そして、 [Adobe Developer Console 環境変数](#export-integration-details-to-postman) および [生成されたアクセストークン](#generate-an-access-token-with-postman).

>[!VIDEO](https://video.tv.adobe.com/v/29704/?quality=12&learn=on)


## これらのビデオで参照されているリソース

* [Adobe 開発者コンソール](https://developer.adobe.com/console/home)
* [Adobe Experience Platform Postmanのサンプル](https://github.com/adobe/experience-platform-postman-samples)
   * [アクセストークン生成用のIdentity Management System Postmanコレクション](https://github.com/adobe/experience-platform-postman-samples/tree/master/apis/ims)
   * [Adobe Experience Platform API Postmanコレクション](https://github.com/adobe/experience-platform-postman-samples/tree/master/apis/experience-platform)
* [Postmanをダウンロード](https://www.postman.com/)
