---
title: Adobe Experience Cloud Debugger を使用したタグ環境の切り替え
description: タグを使用して、様々なExperience Cloud Debugger埋め込みコードを読み込む方法を説明します。 このレッスンは、web サイトでのExperience Cloudの実装チュートリアルの一部です。
exl-id: 29972a00-e5e0-4fe0-a71c-c2ca106938be
source-git-commit: 2483409b52562e13a4f557fe5bdec75b5afb4716
workflow-type: tm+mt
source-wordcount: '588'
ht-degree: 24%

---

# Experience Cloud Debuggerを使用したタグ環境の切り替え

このレッスンでは、[Adobe Experience Platform Debugger拡張機能 ](https://chromewebstore.google.com/detail/adobe-experience-platform/bfnnokhpnncpkdmbokanobigaccjkpob) を使用して、[Luma デモサイト ](https://luma.enablementadobe.com/content/luma/us/en.html) でハードコードされたタグプロパティを独自のプロパティに置き換えます。

この手法は環境の切り替えと呼ばれるもので、後で自分の web サイトでタグを使用する際に役立ちます。 実稼動 web サイトをブラウザーに読み込むことができますが、その際には *開発* タグ環境を使用します。 これにより、通常のコードリリースとは別に、タグの変更を自信を持って行い、検証することができます。  結局のところ、マーケティングタグリリースと通常のコードリリースの分離は、顧客がそもそもタグを使用する主な理由の 1 つです。

>[!NOTE]
>
>Adobe Experience Platform Launch は、データ収集テクノロジーのスイートとして Adobe Experience Platform に統合されています。 このコンテンツを使用する際に注意する必要があるインターフェイスで、いくつかの用語がロールアウトされました。
>
> * Platform launch（クライアントサイド）が **[[!DNL tags]](https://experienceleague.adobe.com/docs/experience-platform/tags/home.html?lang=ja)** になりました
> * Platform launchサーバーサイドが **[[!DNL event forwarding]](https://experienceleague.adobe.com/docs/experience-platform/tags/event-forwarding/overview.html?lang=ja)** になりました
> * Edgeの設定が **[[!DNL datastreams]](https://experienceleague.adobe.com/docs/experience-platform/edge/fundamentals/datastreams.html?lang=ja)** になりました

## 学習内容

このレッスンを最後まで学習すると、以下の内容を習得できます。

* デバッガーを使用して、代替タグ環境を読み込みます
* デバッガーを使用して、代替タグ環境が読み込まれていることを検証します

## 開発環境 URL の取得

1. タグプロパティで、`Environments` ページを開きます

1. **[!UICONTROL 開発]** 行で、「インストール」アイコン ![ 「インストール」アイコン ](images/launch-installIcon.png) をクリックしてモーダルを開きます

1. コピーアイコン![コピーアイコン](images/launch-copyIcon.png)をクリックして、埋め込みコードをクリップボードにコピーします。

1. 「**[!UICONTROL 閉じる]**」をクリックしてモーダルを閉じます

   ![インストールアイコン](images/launch-copyInstallCode.png)

## Luma デモサイトのタグ URL を置換

1. Chrome ブラウザーで [Luma デモサイト](https://luma.enablementadobe.com/content/luma/us/en.html)を開きます。

1. [ デバッガーアイコン ](https://chromewebstore.google.com/detail/adobe-experience-platform/bfnnokhpnncpkdmbokanobigaccjkpob) アイコンをクリックして、![Experience Platformデバッガー拡張機能を開 ](images/icon-debugger.png) ます

   ![デバッガーアイコンをクリックする](images/switchEnvironments-openDebugger.png)

1. 現在実装されているタグプロパティは、「概要」タブに表示されます

   ![Debugger に表示されるタグ環境 ](images/switchEnvironments-debuggerOnWeRetail-prod.png)

1. 「ツール」タブに移動します。
1. 「Launch 埋め込みコードの置換 **[!UICONTROL のセクションまでスクロールします]**
1. Luma サイトを含む「Chrome」タブが、（このチュートリアルのタブやデータ収集インターフェイスのタブではなく）デバッガーの背後にフォーカスされていることを確認します。  クリップボードにある埋め込みコードを入力フィールドに貼り付けます。
1. 「luma.enablementadobe.com 全体で適用」機能をオンにして、Luma サイト上のすべてのページがタグプロパティにマッピングされるようにします
1. 「**[!UICONTROL 保存]** ボタンをクリックします

   ![Debugger に表示されるタグ環境 ](images/switchEnvironments-debugger-save.png)

1. Luma サイトを再読み込みし、デバッガーの「概要」タブを確認します。Launch セクションには、使用中の開発プロパティが表示されます。プロパティ名がユーザーと一致し、環境が「開発」となっていることを確認します。

   ![Debugger に表示されるタグ環境 ](images/switchEnvironments-debuggerOnWeRetail.png)

>[!NOTE]
>
>Debugger は、Luma サイトに戻るたびにこの設定を保存し、タグ埋め込みコードを置き換えます。 他の開いているタブでアクセスする他のサイトには影響しません。埋め込みコードがデバッガーで置き換えられないようにするには、デバッガーの「ツール」タブで埋め込みコードの横にある **[!UICONTROL 削除]** ボタンをクリックします。

チュートリアルを続ける際は、この手法を使用して、Luma サイトを独自のタグプロパティにマッピングし、タグ実装を検証します。 実稼動 web サイトでタグの使用を開始する場合は、これと同じ方法を使用して変更を検証できます。

[次に「Adobe Experience Platform ID サービスを追加」します。](id-service.md)
