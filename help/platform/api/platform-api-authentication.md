---
title: Experience Platform API の認証とアクセス
description: Adobe Experience Platform API へアクセスする方法を学習します。
feature: API
role: Developer
level: Beginner,Intermediate
doc-type: Technical Video
duration: 226
last-substantial-update: 2023-06-21T00:00:00Z
jira: KT-3688
exl-id: c1774670-436e-46dd-9c9b-177bfee5f749
source-git-commit: 311b296d67cf39867e7c9f3fd9f0458dfefcfdfd
workflow-type: tm+mt
source-wordcount: '282'
ht-degree: 7%

---

# API の認証とアクセ [!DNL Experience Platform]

Adobe Experience Platform API の使用を開始する方法を説明します。 最初の手順は、Adobe Developer Consoleでプロジェクトを作成し、資格情報を取得することです。 このチュートリアルでは、Adobe Developer Consoleでプロジェクトを作成し、Postman環境ファイルを書き出して、Experience Platform API リクエストの作成を開始する手順について説明します。

[[!DNL Postman]](https://www.postman.com/) は、デベロッパーがAdobe Experience Platform API を素早く簡単に操作するのに役立つサードパーティアプリケーションです。

[Adobe Developer Consoleの ](https://developer.adobe.com/console/home)**Postmanの詳細をエクスポート** 機能を使用すると、1 つのPostman環境ファイルで、Experience Platform API へのアクセスと操作に必要なアカウントの詳細を簡単にエクスポートでき、Adobe Developer ConsoleからPostmanに値をコピー&amp;ペーストする必要がなくなります。

>[!IMPORTANT]
>
>[Adobe Developer Console](https://developer.adobe.com/console/home) にアクセスするには、[Adobe Admin Console](https://helpx.adobe.com/jp/enterprise/using/admin-roles.html) で [ システム管理者 ](https://helpx.adobe.com/jp/enterprise/using/manage-developers.html#:~:text=Add%20developers%20to%20a%20single%20product%20profile&text=In%20the%20Admin%20Console%2C%20navigate,in%20the%20upper%2Dright%20corner.) または [ 開発者 ](https://adminconsole.adobe.com) である必要があります。
>
> システム管理者は、API 認証情報を作成した後、認証情報をExperience Platformのロールに関連付ける必要があります。
>
>手順について詳しくは、[ 開発者の追加と API 資格情報への権限の付与チュートリアル ](../admin/add-developers.md) を参照してください。


>[!VIDEO](https://video.tv.adobe.com/v/31656/?learn=on&enablevpops&captions=jpn)

<!-- CARDS
* generate-an-access-token.md
* use-apis-with-postman.md
-->
<!-- START CARDS HTML - DO NOT MODIFY BY HAND -->
<div class="columns">
    <div class="column is-half-tablet is-half-desktop is-one-third-widescreen" aria-label="Generate an Experience Platform API access token with Postman">
        <div class="card" style="height: 100%; display: flex; flex-direction: column; height: 100%;">
            <div class="card-image">
                <figure class="image x-is-16by9">
                    <a href="generate-an-access-token.md" title="Postmanを使用したExperience Platform API アクセストークンの生成" target="_blank" rel="referrer">
                        <img class="is-bordered-r-small" src="https://video.tv.adobe.com/v/34080/?format=jpeg&nocache=1752259602830&captions=jpn" alt="Postmanを使用したExperience Platform API アクセストークンの生成"
                             style="width: 100%; aspect-ratio: 16 / 9; object-fit: cover; overflow: hidden; display: block; margin: auto;">
                    </a>
                </figure>
            </div>
            <div class="card-content is-padded-small" style="display: flex; flex-direction: column; flex-grow: 1; justify-content: space-between;">
                <div class="top-card-content">
                    <p class="headline is-size-6 has-text-weight-bold">
                        <a href="generate-an-access-token.md" target="_blank" rel="referrer" title="Postmanを使用したExperience Platform API アクセストークンの生成">Postmanを使用したExperience Platform API アクセストークンの生成 </a>
                    </p>
                    <p class="is-size-6">PostmanでExperience Platform API アクセストークンを生成する方法を説明します</p>
                </div>
                <a href="generate-an-access-token.md" target="_blank" rel="referrer" class="spectrum-Button spectrum-Button--outline spectrum-Button--primary spectrum-Button--sizeM" style="align-self: flex-start; margin-top: 1rem;">
                    <span class="spectrum-Button-label has-no-wrap has-text-weight-bold"> 詳細情報 </span>
                </a>
            </div>
        </div>
    </div>
    <div class="column is-half-tablet is-half-desktop is-one-third-widescreen" aria-label="Use Experience Platform APIs with Postman">
        <div class="card" style="height: 100%; display: flex; flex-direction: column; height: 100%;">
            <div class="card-image">
                <figure class="image x-is-16by9">
                    <a href="use-apis-with-postman.md" title="PostmanでのExperience Platform API の使用" target="_blank" rel="referrer">
                        <img class="is-bordered-r-small" src="https://video.tv.adobe.com/v/34079/?format=jpeg&nocache=1752259602844&captions=jpn" alt="PostmanでのExperience Platform API の使用"
                             style="width: 100%; aspect-ratio: 16 / 9; object-fit: cover; overflow: hidden; display: block; margin: auto;">
                    </a>
                </figure>
            </div>
            <div class="card-content is-padded-small" style="display: flex; flex-direction: column; flex-grow: 1; justify-content: space-between;">
                <div class="top-card-content">
                    <p class="headline is-size-6 has-text-weight-bold">
                        <a href="use-apis-with-postman.md" target="_blank" rel="referrer" title="PostmanでのExperience Platform API の使用">PostmanでのExperience Platform API の使用 </a>
                    </p>
                    <p class="is-size-6">Adobe Experience Platformが提供するPostman コレクションを使用してAdobe API を調べます</p>
                </div>
                <a href="use-apis-with-postman.md" target="_blank" rel="referrer" class="spectrum-Button spectrum-Button--outline spectrum-Button--primary spectrum-Button--sizeM" style="align-self: flex-start; margin-top: 1rem;">
                    <span class="spectrum-Button-label has-no-wrap has-text-weight-bold"> 詳細情報 </span>
                </a>
            </div>
        </div>
    </div>
</div>
<!-- END CARDS HTML - DO NOT MODIFY BY HAND -->
