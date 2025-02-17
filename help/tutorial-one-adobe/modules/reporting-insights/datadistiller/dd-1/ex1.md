---
title: クエリサービス – 前提条件
description: クエリサービス – 前提条件
kt: 5342
doc-type: tutorial
exl-id: e9e4d478-cb8d-42a9-87a3-319e5a8b8522
source-git-commit: 1e3a8d585503eddad4c642a3b13d2b5f7ddc9943
workflow-type: tm+mt
source-wordcount: '169'
ht-degree: 1%

---

# 2.1.1 前提条件

## PSQL コマンドラインユーティリティのインストール

Adobe Experience Platformのドキュメントに記載されている手順に従って、psql クライアントをインストールします。
[PSQL インストールガイド ](https://experienceleague.adobe.com/docs/experience-platform/query/clients/psql.html)

PSQL をインストールしたら、ターミナルウィンドウで次のコマンドを実行して **PATH** を更新する必要が生じる場合があります。

macOSの場合（以下のコマンドの XX を、インストールした PSQL のバージョン番号に置き換えます）:

`export PATH=/Library/PostgreSQL/XX/bin:$PATH`

## Power BIのインストール

Windows ユーザーのみ

[Microsoft Power BIのインストール ](https://experienceleague.adobe.com/docs/experience-platform/query/clients/power-bi.html)

このドキュメントで説明しているように、正確なバージョンの **npgsql** をインストールしてください。インストールしないと、Power BIをAdobe Experience Platform クエリサービスに接続できません。

## Tableau のインストール

Windows またはMac ユーザーの場合

[Tableau Desktop をインストール ](https://experienceleague.adobe.com/docs/experience-platform/query/clients/tableau.html) します。ドキュメントを参照してください。

Tableau では、14 日間の試用期間が自動的に提供されます。

この 14 日を超えて Tableau を使用する場合は、ライセンスキーが必要になります。

## 次の手順

[2.1.2 はじめに ](./ex2.md){target="_blank"} に移動します。

[ クエリサービス ](./query-service.md){target="_blank"} に戻る

[ すべてのモジュール ](./../../../../overview.md){target="_blank"} に戻る
