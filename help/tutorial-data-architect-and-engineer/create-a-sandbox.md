---
title: サンドボックスの作成
seo-title: Create a sandbox | Getting Started with Adobe Experience Platform for Data Architects and Data Engineers
breadcrumb-title: サンドボックスの作成
description: このレッスンでは、残りのチュートリアルで使用できる開発環境サンドボックスを作成します。
role: Data Architect, Data Engineer
feature: Sandboxes
jira: KT-4348
thumbnail: 4348-create-a-sandbox.jpg
exl-id: a04afada-52a1-4812-8fa2-14be72e68614
source-git-commit: 286c85aa88d44574f00ded67f0de8e0c945a153e
workflow-type: tm+mt
source-wordcount: '398'
ht-degree: 2%

---

# サンドボックスの作成

<!--25min-->

このレッスンでは、残りのチュートリアルで使用する開発環境サンドボックスを作成します。

サンドボックスは、リソースとデータを実稼動環境と混在させずに機能を試すことができる独立した環境を提供します。 詳しくは、[&#x200B; サンドボックスのドキュメント &#x200B;](https://experienceleague.adobe.com/docs/experience-platform/sandbox/home.html?lang=ja) を参照してください。

**データアーキテクト** と **データエンジニア** は、このチュートリアル以外でサンドボックスを作成する必要があります。

演習を開始する前に、この短いビデオを視聴してサンドボックスの詳細を確認してください。
>[!VIDEO](https://video.tv.adobe.com/v/3430299/?learn=on&enablevpops&captions=jpn)

## 必要な権限

[&#x200B; 権限の設定 &#x200B;](configure-permissions.md) レッスンでは、このレッスンを完了するために必要なすべてのアクセス制御を設定します。

<!--
* Permission items **[!UICONTROL Sandbox Administration]** > **[!UICONTROL View Sandboxes]** and **[!UICONTROL Manage Sandboxes]**
* Permission item **[!UICONTROL Sandboxes]** > **[!UICONTROL Prod]**
* User-role access to the `Luma Tutorial Platform` product profile
* Admin-level access to the `Luma Tutorial Platform` product profile
-->

## サンドボックスの作成

次に、サンドボックスを作成します。

1. [Adobe Experience Platform](https://experience.adobe.com/platform) インターフェイスにログインします
1. 左側のナビゲーションの **[!UICONTROL サンドボックス]** に移動します
1. 右上の **[!UICONTROL サンドボックスを作成]** を選択します
   ![&#x200B; 「サンドボックスを作成」を選択 &#x200B;](assets/sandbox-createSandbox.png)

1. **[!UICONTROL タイプ]** として「**[!UICONTROL 開発]**」を選択します
1. サンドボックス `luma-tutorial` に名前を付けます（最後に名前を追加することを検討してください）
1. チュートリアル `Luma Tutorial` ースにタイトルを付けます（最後に名前を追加することを検討してください）。
1. 「**[!UICONTROL 作成]** ボタンを選択します
   ![&#x200B; サンドボックスの作成 &#x200B;](assets/sandbox-nameSandbox.png)
   >[!NOTE]
   >
   >サンドボックスの名前とタイトルには任意の値を使用できますが、チュートリアルでこれらのラベルを参照するので、推奨される値を使用することをお勧めします。 組織にこのチュートリアルを完了するユーザーが複数ある場合は、サンドボックスのタイトルと名前の末尾に名前を追加することを検討してください（例：luma-tutorial-ignatiusjreilly）。

サンドボックスの作成には約 30 秒かかり、その間「[!UICONTROL &#x200B; 作成中 &#x200B;]」ステータスが表示されます。 サンドボックスが完全に作成されると、「[!UICONTROL &#x200B; アクティブ &#x200B;]」と表示されます。
![&#x200B; アクティブステータス &#x200B;](assets/sandbox-active.png)

サンドボックスが「[!UICONTROL &#x200B; アクティブ &#x200B;]」になるまで待ってから、次の演習に進みます。

## 役割に新しいサンドボックスを追加

サンドボックスがアクティブになったら、それを使用するために、役割に含める必要があります。 役割に追加するには（システム管理者または製品管理者権限が必要です）、

1. [!UICONTROL &#x200B; 権限 &#x200B;] 画面に移動します
1. `Luma Tutorial Platform` の役割を開きます
1. 必要に応じて _役割から `Prod` サンドボックスを_ 削除」します
1. `Luma Tutorial` サンドボックスの追加
1. 「**[!UICONTROL 保存]**」を選択します
1. [!UICONTROL &#x200B; サンドボックス &#x200B;] 行で「**[!UICONTROL 編集]**」を選択します

   ![Luma チュートリアルの追加 &#x200B;](assets/sandbox-addLumaTutorial.png)

1. ページをリロード（または Shift キーを押しながらリロード）すると、`Luma Tutorial` サンドボックスに表示されるか、サンドボックスドロップダウンに表示されます
1. まだ `Luma Tutorial` サンドボックスに入っていない場合は、切り替えます

   ![&#x200B; サンドボックスを確認 &#x200B;](assets/sandbox-confirmDropdown.png)

サンドボックスが作成され、[Developer ConsoleとPostmanの設定 &#x200B;](set-up-developer-console-and-postman.md) の準備が整いました。
