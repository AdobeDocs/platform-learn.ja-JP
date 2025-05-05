---
title: Experience Platform API の認証とアクセス
description: Adobe Experience Platform API へアクセスする方法を学習します。
feature: API
role: Developer
level: Beginner
jira: KT-3688
thumbnail: 28832.jpeg
last-substantial-update: 2023-06-21T00:00:00Z
exl-id: c1774670-436e-46dd-9c9b-177bfee5f749
source-git-commit: 286c85aa88d44574f00ded67f0de8e0c945a153e
workflow-type: tm+mt
source-wordcount: '263'
ht-degree: 10%

---

# API の認証とアクセ [!DNL Experience Platform]

Adobe Experience Platform API の使用を開始する方法を説明します。 このチュートリアルでは、認証資格情報を作成し、Experience Platform API リクエストの作成を開始する手順について説明します。

## Adobe Developer Consoleでプロジェクトを作成し、Postmanを書き出します{#export-integration-details-to-postman}

[[!DNL Postman]](https://www.postman.com/) は、デベロッパーがAdobe Experience Platform API を素早く簡単に操作するのに役立つサードパーティアプリケーションです。

[Adobe Developer Consoleの ](https://developer.adobe.com/console/home)**Postmanの詳細をエクスポート** 機能を使用すると、1 つのPostman環境ファイルで、Experience Platform API へのアクセスと操作に必要なアカウントの詳細を簡単にエクスポートでき、Adobe Developer ConsoleからPostmanに値をコピー&amp;ペーストする必要がなくなります。

>[!IMPORTANT]
>
>[Adobe Developer Console](https://developer.adobe.com/console/home) にアクセスするには、[Adobe Admin Console](https://adminconsole.adobe.com) で [ システム管理者 ](https://helpx.adobe.com/jp/enterprise/using/admin-roles.html) または [ 開発者 ](https://helpx.adobe.com/jp/enterprise/using/manage-developers.html#:~:text=Add%20developers%20to%20a%20single%20product%20profile&amp;text=In%20the%20Admin%20Console%2C%20navigate,in%20the%20upper%2Dright%20corner.) である必要があります。
>
> システム管理者は、API 認証情報を作成した後、認証情報をExperience Platformのロールに関連付ける必要があります。

>[!VIDEO](https://video.tv.adobe.com/v/31656/?learn=on&enablevpops&captions=jpn)

## Postmanでのアクセストークンの生成{#generate-an-access-token-with-postman}

[Adobe Identity Management Service API](https://github.com/adobe/experience-platform-postman-samples/tree/master/apis/ims) を使用して、Adobe Experience Platform API にアクセスするためのアクセストークンを取得します。

>[!VIDEO](https://video.tv.adobe.com/v/34080/?learn=on&enablevpops&captions=jpn)


## Postmanを使用したExperience Platform API の操作

[Adobe Experience Platform環境変数 ](#export-integration-details-to-postman) および [ 生成されたアクセストークン ](#generate-an-access-token-with-postman) に基づいて、[Adobeが提供するExperience Platform API Postman コレクション ](https://github.com/adobe/experience-platform-postman-samples/tree/master/apis/experience-platform) を使用してAdobe Developer Console API とのやり取りを調べます。

>[!VIDEO](https://video.tv.adobe.com/v/34079/?learn=on&enablevpops&captions=jpn)


## これらのビデオで参照されるリソース

* [Adobe 開発者コンソール](https://developer.adobe.com/console/home)
* [Adobe Experience Platform Postman サンプル ](https://github.com/adobe/experience-platform-postman-samples)
   * [ アクセストークンを生成するためのIdentity Management System Postman コレクション ](https://github.com/adobe/experience-platform-postman-samples/tree/master/apis/ims)
   * [Adobe Experience Platform API Postman コレクション ](https://github.com/adobe/experience-platform-postman-samples/tree/master/apis/experience-platform)
* [Postmanのダウンロード ](https://www.postman.com/)
