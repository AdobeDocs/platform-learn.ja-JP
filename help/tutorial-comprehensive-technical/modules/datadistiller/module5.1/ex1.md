---
title: クエリサービス – 前提条件
description: クエリサービス – 前提条件
kt: 5342
doc-type: tutorial
exl-id: b8a404d1-7796-46e3-b245-553acdc753ae
source-git-commit: d9d9a38c1e160950ae755e352a54667c8a7b30f7
workflow-type: tm+mt
source-wordcount: '167'
ht-degree: 0%

---

# 5.1.1 前提条件

## PSQL コマンドラインユーティリティのインストール

Adobe Experience Platformのドキュメントに記載されている手順に従って、psql クライアントをインストールします。
[PSQL インストールガイド &#x200B;](https://experienceleague.adobe.com/docs/experience-platform/query/clients/psql.html?lang=ja)

PSQL をインストールしたら、ターミナルウィンドウで次のコマンドを実行して **PATH** を更新する必要が生じる場合があります。

macOSの場合（以下のコマンドの XX を、インストールした PSQL のバージョン番号に置き換えます）:

`export PATH=/Library/PostgreSQL/XX/bin:$PATH`

## Power BIのインストール

Windows ユーザーのみ

[Microsoft Power BIのインストール &#x200B;](https://experienceleague.adobe.com/docs/experience-platform/query/clients/power-bi.html?lang=ja)

このドキュメントで説明しているように、正確なバージョンの **npgsql** をインストールしてください。インストールしないと、Adobe Experience Platform クエリサービスにPower BIを接続できません。

## Tableau のインストール

Windows またはMac ユーザーの場合

[Tableau Desktop をインストール &#x200B;](https://experienceleague.adobe.com/docs/experience-platform/query/clients/tableau.html?lang=ja) します。ドキュメントを参照してください。

Tableau では、14 日間の試用期間が自動的に提供されます。

この 14 日を超えて Tableau を使用する場合は、ライセンスキーが必要になります。

次の手順：[5.1.2 はじめに &#x200B;](./ex2.md)

[モジュール 5.1 に戻る](./query-service.md)

[すべてのモジュールに戻る](../../../overview.md)
