---
title: 「upsert」を使用した特定のプロファイル属性の更新
description: Adobe Experience Platformの「アップサート」機能を使用して、プロファイルの特定の属性を更新する方法を説明します。
feature: Profiles, Data Ingestion
role: Architect, Data Architect, Data Engineer, Developer
level: Experienced
doc-type: Technical Video
last-substantial-update: 2023-07-05T00:00:00Z
jira: KT-11949
exl-id: 7c3d2ed8-4018-418f-9c0b-11a715072cc4
source-git-commit: 286c85aa88d44574f00ded67f0de8e0c945a153e
workflow-type: tm+mt
source-wordcount: '89'
ht-degree: 0%

---

# `upsert` を使用した特定のプロファイル属性の更新

Adobe Experience Platformの `upsert` 機能を使用して、プロファイルの特定の属性を更新する方法について説明します。 通常、特定の属性のみを持つレコードを Platform に取り込むと、値が更新されますが、他の属性も `null` の値で更新されます。 `Upsert` では、目的の属性のみを更新して、残りのフィールドは現在の値を保持できます。

>[!VIDEO](https://video.tv.adobe.com/v/3443442/?learn=on&enablevpops&captions=jpn)
