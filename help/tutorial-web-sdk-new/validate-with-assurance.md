---
title: Experience Platform保証を使用した Web SDK の実装の検証
description: Adobe Experience Platform Assurance を使用して Platform Web SDK の実装を検証する方法について説明します。 このレッスンは、「 Adobe Experience Cloudと Web SDK の実装」チュートリアルの一部です。
feature: Web SDK,Tags,Assurance
source-git-commit: 4361d8e688ff2c2f3b5472f2cfff246efa627c7f
workflow-type: tm+mt
source-wordcount: '262'
ht-degree: 0%

---

# Experience Platform保証を使用した Web SDK の実装の検証


## アシュランスセッションを開始する

Adobe Experience Platform Assurance は、Adobe Experience Cloudがデータを収集したりエクスペリエンスを提供する方法を調査、配達確認、シミュレーションおよび検証する際に役立つ製品です。

詳細を表示： [Adobe保証](https://experienceleague.adobe.com/docs/experience-platform/assurance/home.html?lang=en).

Edge Trace を有効にするたびに、アシュランスセッションがバックグラウンドで開始されます。

アシュランスセッションを表示するには、

1. Edge Trace を有効にすると、上部に発信リンクアイコンが表示されます。 アイコンを選択してアシュランスを開きます。 ブラウザーに新しいタブが開きます。

   ![アシュランスセッションを開始](assets/validate-debugger-start-assurnance.png)

1. イベント応答ハンドルというイベントを含むAdobeを選択します。
1. 右側にメニューが表示されます。 を選択します。 `+` ～の隣に署名する `[!UICONTROL ACPExtensionEvent]`
1. 選択によるドリルダウン `[!UICONTROL payload > 0 > payload > 0 > namespace]`. 最後の `0` は、 `ECID`. は、の下に表示される値によってわかります。 `namespace` 一致 `ECID`

   ![アシュランス検証 ECID](assets/validate-assurance-ecid.png)

   >[!CAUTION]
   >
   >ウィンドウの幅が原因で、ECID 値が切り捨てられている場合があります。 インターフェイスのハンドルバーを選択し、左にドラッグして ECID 全体を表示します。

今後のレッスンでは、アシュランスを使用して、データストリームで有効なAdobeアプリケーションに到達する、完全に処理されたペイロードを検証します。

ページで XDM オブジェクトが実行されるようになりました。また、データ収集の検証方法を知っていれば、Platform Web SDK を使用して個々のAdobeアプリケーションを設定する準備が整いました。