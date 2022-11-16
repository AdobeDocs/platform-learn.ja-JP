---
title: Adobe Experience Cloud Debugger でのタグ環境の切り替え
description: Experience Cloud Debuggerを使用して様々なタグ埋め込みコードを読み込む方法を説明します。 このレッスンは、「 Web サイトでのExperience Cloudの実装」チュートリアルの一部です。
exl-id: 29972a00-e5e0-4fe0-a71c-c2ca106938be
source-git-commit: cc7a77c4dd380ae1bc23dc75608e8e2224dfe78c
workflow-type: tm+mt
source-wordcount: '625'
ht-degree: 40%

---

# タグ環境をExperience Cloud Debugger

このレッスンでは、 [Adobe Experience Cloud Debugger 拡張機能](https://chrome.google.com/webstore/detail/adobe-experience-cloud-de/ocdmogmohccmeicdhlhhgepeaijenapj) を、 [Luma デモサイト](https://luma.enablementadobe.com/content/luma/us/en.html) を独自のプロパティに追加します。

この手法は環境の切り替えと呼ばれ、後で独自の Web サイトでタグを使用する際に役立ちます。 実稼動用 Web サイトをブラウザーに読み込むには、 *開発* タグ環境を使用します。 これにより、通常のコードリリースとは独立し、自信を持ってタグを変更し、検証できます。  結局、マーケティングタグリリースを通常のコードリリースから分離できることは、顧客がタグを最初に使用する主な理由の 1 つです。

>[!NOTE]
>
>Adobe Experience Platform Launch は、データ収集テクノロジーのスイートとして Adobe Experience Platform に統合されています。 このコンテンツを使用する際に注意が必要な、いくつかの用語の変更がインターフェイスにロールアウトされました。
>
> * platform launch（クライアント側）が **[[!DNL tags]](https://experienceleague.adobe.com/docs/experience-platform/tags/home.html?lang=ja)**
> * platform launchサーバー側が **[[!DNL event forwarding]](https://experienceleague.adobe.com/docs/experience-platform/tags/event-forwarding/overview.html)**
> * エッジ設定が **[[!DNL datastreams]](https://experienceleague.adobe.com/docs/experience-platform/edge/fundamentals/datastreams.html?lang=ja)**


## 学習内容

このレッスンを最後まで学習すると、以下の内容を習得できます。

* デバッガーを使用した代替タグ環境の読み込み
* デバッガーを使用して、代替タグ環境を読み込んだことを検証する。

## 開発環境 URL の取得

1. タグプロパティで、 `Environments` ページ

1. **[!UICONTROL 開発]**&#x200B;行で、インストールアイコン![インストールアイコン](images/launch-installIcon.png)をクリックして、モーダルを開きます。

1. コピーアイコン![コピーアイコン](images/launch-copyIcon.png)をクリックして、埋め込みコードをクリップボードにコピーします。

1. **[!UICONTROL 閉じる]**&#x200B;をクリックしてモーダルを閉じます。

   ![インストールアイコン](images/launch-copyInstallCode.png)

## Luma デモサイトのタグ URL を置き換えます。

1. Chrome ブラウザーで [Luma デモサイト](https://luma.enablementadobe.com/content/luma/us/en.html)を開きます。

1. ![デバッガーアイコン](images/icon-debugger.png) アイコンをクリックして、[Experience Cloud デバッガー拡張機能](https://chrome.google.com/webstore/detail/adobe-experience-cloud-de/ocdmogmohccmeicdhlhhgepeaijenapj)を開きます。

   ![デバッガーアイコンをクリックする](images/switchEnvironments-openDebugger.png)

1. 現在実装されているタグプロパティは、「概要」タブに表示されます。

   ![Debugger に表示されるタグ環境](images/switchEnvironments-debuggerOnWeRetail-prod.png)

1. 「ツール」タブに移動します。
1. **[!UICONTROL Launch 埋め込みコードを置換]**&#x200B;セクションまでスクロールします。
1. Luma サイトの「Chrome」タブがデバッガーの背後にあることを確認します（このチュートリアルのタブやデータ収集インターフェイスのタブではなく）。  クリップボードにある埋め込みコードを入力フィールドに貼り付けます。
1. 「luma.enablementadobe.com 全体で適用」機能をオンにして、Luma サイトのすべてのページがタグプロパティにマッピングされるようにします。
1. 「**[!UICONTROL 保存]**」ボタンをクリックします。

   ![Debugger に表示されるタグ環境](images/switchEnvironments-debugger-save.png)

1. Luma サイトを再読み込みし、デバッガーの「概要」タブを確認します。Launch セクションには、使用中の開発プロパティが表示されます。プロパティ名がユーザーと一致し、環境が「開発」となっていることを確認します。

   ![Debugger に表示されるタグ環境](images/switchEnvironments-debuggerOnWeRetail.png)

>[!NOTE]
>
>デバッガーはこの設定を保存し、Luma サイトに戻るたびにタグ埋め込みコードを置き換えます。 他の開いているタブでアクセスする他のサイトには影響しません。デバッガーによる埋め込みコードの置き換えを停止するには、デバッガーの「ツール」タブの埋め込みコードの横にある&#x200B;**[!UICONTROL 削除]**&#x200B;をクリックします。

チュートリアルを続ける際には、この方法を使用して、Luma サイトを独自のタグプロパティにマッピングし、タグの実装を検証します。 実稼動用 Web サイトでタグの使用を開始する場合、同じ方法を使用して変更を検証できます。

[次：「Adobe Experience Platform ID サービスの追加」>](id-service.md)
