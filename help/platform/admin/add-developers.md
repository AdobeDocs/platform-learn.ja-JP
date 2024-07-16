---
title: Adobe Experience Platform ベースのアプリケーションに開発者を追加
description: Adobe Experience Platform ベースのアプリケーションにデベロッパーを追加し、API 資格情報に権限を付与する方法について説明します
feature: Access Control
role: Admin, Developer
level: Beginner
jira: KT-14689
last-substantial-update: 2023-12-15T00:00:00Z
exl-id: 4bd28867-b664-4a45-8892-91af821cbbcc
source-git-commit: eae0910e2475ce20f7afd289005b6a8869eaa210
workflow-type: tm+mt
source-wordcount: '156'
ht-degree: 0%

---

# 開発者を追加し、API 資格情報に権限を付与します。

Real-time Customer Data PlatformやJourney OptimizerなどのAdobe Experience Platform ベースのアプリケーションに開発者を追加する方法について説明します。 開発者は、まずAdmin Consoleに追加されます。 Developer Consoleで Platform プロジェクトを作成すると、API 資格情報に Platform またはJourney Optimizer インターフェイスで権限が割り当てられます。 詳しくは、[ アクセス制御ドキュメント ](https://experienceleague.adobe.com/docs/experience-platform/access-control/home.html?lang=ja) を参照してください。

>[!VIDEO](https://video.tv.adobe.com/v/3426407?learn=on)

>[!ADMIN]
>
>デベロッパーを追加し、API 資格情報に権限を割り当てることができるのは、システム管理者のみです。 製品管理者は、これらのタスクを完了できません。

>[!TIP]
>
>また、デベロッパーを **ユーザー** として Platform の `AEP-Default-All-Users` 製品プロファイルに追加し、Admin Consoleインターフェイスで API 資格情報と同じロールに追加することをお勧めします。 これにより、必要に応じてインターフェイスを使用できます。 詳しくは、[ ユーザーの追加 ](add-users.md) を参照してください。
