---
title: 開発者をAdobe Experience Platformベースのアプリケーションに追加する
description: Adobe Experience Platformベースのアプリケーションに開発者を追加し、API 資格情報に権限を付与する方法を説明します。
feature: Access Control
role: Admin, Developer
level: Beginner
jira: KT-14689
last-substantial-update: 2023-12-15T00:00:00Z
source-git-commit: 4d1a0ff598b822e2228d8719488b9dbb91c9870d
workflow-type: tm+mt
source-wordcount: '156'
ht-degree: 0%

---

# 開発者を追加し、API 資格情報に対する権限を付与する

Real-time Customer Data PlatformやJourney Optimizerなど、Adobe Experience Platformベースのアプリケーションに開発者を追加する方法を説明します。 開発者はまず、Admin Consoleに追加されます。 開発者コンソールで Platform プロジェクトを作成した後、その API 資格情報には、Platform またはJourney Optimizerインターフェイスでの権限が割り当てられます。 詳しくは、 [アクセス制御に関するドキュメント](https://experienceleague.adobe.com/docs/experience-platform/access-control/home.html?lang=ja).

>[!VIDEO](https://video.tv.adobe.com/v/3426407?learn=on)

>[!ADMIN]
>
>開発者を追加し、権限を API 資格情報に割り当てることができるのは、システム管理者のみです。 製品管理者はこれらのタスクを完了できません。

>[!TIP]
>
>また、開発者を **ユーザー** から `AEP-Default-All-Users` 製品プロファイルをAdmin Consoleに追加し、API 資格情報と同じ役割の Platform インターフェイスに追加します。 これにより、必要に応じてインターフェイスを使用できます。 詳しくは、 [ユーザーを追加](add-users.md) を参照してください。

