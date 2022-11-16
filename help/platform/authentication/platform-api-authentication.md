---
title: Experience Platform API の認証とアクセス
description: Adobe Experience Platform API へアクセスする方法を学習します。
role: Developer
feature: API
kt: 3688
thumbnail: 28832.jpeg
exl-id: c1774670-436e-46dd-9c9b-177bfee5f749
source-git-commit: cc7a77c4dd380ae1bc23dc75608e8e2224dfe78c
workflow-type: tm+mt
source-wordcount: '377'
ht-degree: 11%

---

# 認証とアクセス [!DNL Experience Platform] API

Adobe Experience Platform API を呼び出すには、まずExperience Platform開発者アカウントへのアクセス権を取得する必要があります。

開発者アカウントへのアクセス方法の詳細な手順については、 [Experience PlatformAPI 認証のチュートリアル](https://experienceleague.adobe.com/docs/experience-platform/landing/platform-apis/api-authentication.html?lang=ja).

## PostmanへのExperience PlatformAPI の作成と書き出し

[Postman](https://www.getpostman.com/) は、開発者がAdobe Experience Platform API をすばやく簡単に操作できるツールです。

Adobe Developer Console&#39;s **Postmanの詳細を書き出し** 機能を使用すると、Experience PlatformAPI へのアクセスと操作に必要なすべてのアカウントの詳細を 1 つのPostman環境ファイルに簡単に書き出せるので、Adobe DeveloperコンソールからPostmanに値をコピーして貼り付ける必要がありません。

>[!VIDEO](https://video.tv.adobe.com/v/28832/?quality=12&learn=on)

## Postmanでのアクセストークンの生成

以下を使用： [AdobeIdentity Management Service API](https://github.com/adobe/experience-platform-postman-samples/tree/master/apis/ims) 非実稼動用にAdobe Experience Platform API にアクセスするためのアクセストークンを取得するには：

>[!VIDEO](https://video.tv.adobe.com/v/29698/?quality=12&learn=on)

>[!WARNING]
>
> Adobe I/Oアクセストークンの生成Postmanコレクションで述べたように、指定された生成方法は、非実稼動環境での使用に適しています。 ローカル署名は、サードパーティのホストから JavaScript ライブラリを読み込み、リモート署名は秘密鍵をAdobeが所有し、操作する Web サービスに送信します。 Adobeはこの秘密鍵を保存しませんが、実稼働鍵は誰とも共有しないでください。

## Postmanを使用したAdobe I/OAPI の操作

を使用したAdobe I/OAPI の操作の調査 [Adobeが提供するExperience PlatformAPI Postmanコレクション](https://github.com/adobe/experience-platform-postman-samples/tree/master/apis/experience-platform)そして、 [Adobe I/O環境変数](#export-adobe-io-integration-details-to-postman) および [生成されたアクセストークン](#generate-an-access-token-with-postman).

>[!VIDEO](https://video.tv.adobe.com/v/29704/?quality=12&learn=on)

Adobeが提供するPostmanコレクションは、すべてのAdobe I/OAPI に対して存在するわけではありませんが、提供されているコレクションは [Experience PlatformAPI Postmanコレクション](https://github.com/adobe/experience-platform-postman-samples/tree/master/apis/experience-platform) を使用すると、これらの使用例に対して独自のPostmanコレクションを定義する方法のガイドとして利用できます。

## その他のリソース

* [Adobe I/Oコンソール](https://console.adobe.io)
* [Adobe Experience Platform Postmanのサンプル](https://github.com/adobe/experience-platform-postman-samples)
   * [Adobe I/Oアクセストークン生成Postmanコレクション](https://github.com/adobe/experience-platform-postman-samples/tree/master/apis/ims)
   * [Adobe Experience Platform APIs Postmanコレクション](https://github.com/adobe/experience-platform-postman-samples/tree/master/apis/experience-platform)
* [Postmanをダウンロード](https://www.getpostman.com/)
