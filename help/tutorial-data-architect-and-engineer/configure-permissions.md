---
title: 権限の設定
seo-title: Configure permissions | Getting Started with Adobe Experience Platform for Data Architects and Data Engineers
breadcrumb-title: 権限の設定
description: このレッスンでは、AdobeのAdmin Consoleを使用してAdobe Experience Platformユーザー権限を設定します。
role: Data Architect, Data Engineer
feature: Access Control
kt: 4348
thumbnail: 4348-configure-permissions.jpg
exl-id: ca01f99e-f10c-4bf0-bef2-b011ac29a565
source-git-commit: cc7a77c4dd380ae1bc23dc75608e8e2224dfe78c
workflow-type: tm+mt
source-wordcount: '1471'
ht-degree: 3%

---

# 権限の設定

<!--30min-->

このレッスンでは、次を使用してAdobe Experience Platformのユーザー権限を設定します。 [!DNL Adobe's Admin Console].

アクセス制御は、Experience Platformの主要なプライバシー機能です。ユーザーが職務機能を実行するのに必要な最小限の権限に制限することをお勧めします。 詳しくは、 [アクセス制御に関するドキュメント](https://experienceleague.adobe.com/docs/experience-platform/access-control/home.html?lang=ja) を参照してください。

データアーキテクトとデータエンジニアは、Adobe Experience Platformのパワーユーザーで、このチュートリアルを完了し、後で日常業務を完了するには、多くの権限が必要になります。 データアーキテクトは、 *その他の Platform ユーザー* マーケター、アナリスト、データサイエンティストなどの会社の このレッスンを完了する際に、これらの機能を使用して会社の他のユーザーを管理する方法について考えてみましょう。

**データアーキテクト** 多くの場合、このチュートリアル以外の他のユーザーに対する権限を設定します。

>[!IMPORTANT]
>
>Adobe Experience Cloud製品のシステム管理者は、このレッスンの手順の一部を完了する必要があります。この手順は、セクションの見出しで呼び出されます。 システム管理者でない場合は、会社の担当者に連絡し、これらのタスクの完了を依頼してください。

## Admin Console

この [!DNL Admin Console] は、すべてのAdobe Experience Cloud製品へのユーザーアクセスを管理するためのインターフェイスです。 詳しくは、 [Adobe Admin Consoleドキュメント](https://helpx.adobe.com/jp/enterprise/using/admin-console.html) を参照してください。 鍵はここにある [!DNL Admin Console] 概念：

* A **製品プロファイル** は、特定のAdobe製品に関連付けられた権限、役割、サンドボックス環境の組み合わせです。 1 つの製品に対して複数の製品プロファイルをAdobeできます。 例えば、「マーケター」プロファイルでは、通常のマーケターが実稼動 Platform 環境で主要なタスクを完了するために必要な権限に権限を制限し、「データアーキテクト」プロファイルを使用して、複数の Platform 環境で様々な権限を付与できます。 このレッスンでは、データアーキテクトおよびデータエンジニアがサンドボックス環境でこのチュートリアルを完了するために必要なすべての権限を持つ「Luma チュートリアル」製品プロファイルを作成します。
* An **統合** は、 *プロジェクト* (Adobe Developer Console) Adobe Developerコンソールは、AdobeAPI の認証と設定の中心となります。 統合は、開発者コンソールで設定し、 [!DNL Postman] レッスン。

Platform に存在する役割の概要を次に示します。

* **ユーザー** の製品プロファイルは、製品プロファイルで割り当てられた権限に従って、Platform のユーザーインターフェイスでタスクを完了できます。
* **開発者** の製品プロファイルは、製品プロファイルの権限に応じて、Platform の API を使用してタスクを完了できます。
* **製品プロファイル管理者** 編集可能 *特定のプロファイルの* 権限を追加し、ユーザー、開発者、および追加のプロファイル管理者を追加します。
* **製品管理者** ～を管理できる *すべての製品プロファイル* Platform の場合は、新しい製品プロファイルを追加します。
* **システム管理者** 製品管理者を追加し、すべてのAdobe Experience Cloud製品の基本的な権限を管理できます。

## Experience Platform製品プロファイルの作成（システム管理者または製品管理者が必要）

この演習では、ユーザーまたは会社のシステム管理者がAdobe Experience Platformの製品プロファイルを作成し、その製品プロファイルの管理者として追加します。

>[!NOTE]
>
>このチュートリアルを担当する同僚を支援するシステム管理者の場合は、同僚を *製品管理者* Adobe Experience Platform 製品管理者は、これらの手順を自分で完了し、将来他のExperience Platformユーザーを管理できます。

製品プロファイルを作成するには：

1. にログインします。 [Adobe Admin Console](https://adminconsole.adobe.com)
1. 選択 **[!UICONTROL 製品]** 上部ナビゲーションで
1. 選択 **[!UICONTROL Adobe Experience Platform]** 左側のナビゲーション ( 場合によっては、 **[!UICONTROL Experience Cloud]** セクション )
1. 既にExperience Platformインスタンスに複数のプロファイルが存在する場合があります。 を選択します。 **[!UICONTROL 新しいプロファイル]** 別のボタンを追加する
   ![「新しいプロファイルを追加」を選択します。](assets/adminconsole-newProfile.png)
1. プロファイルに名前を付ける `Luma Tutorial Platform` （会社の複数の担当者がこのチュートリアルを受け取る場合は、チュートリアル参加者の名前を末尾に追加します）、 **[!UICONTROL 次へ]** ボタン
   ![プロファイルに Luma Tutorial Platform という名前を付けます。](assets/adminconsole-nameProfile.png)
1. 製品ライセンスの詳細に応じて、次の情報が表示される場合と表示されない場合があります。 **[!UICONTROL サービス]** 画面 このチュートリアルではこれらのサービスを使用しないので、チェックを外します **[!UICONTROL すべてのサービスを有効にする]** から *削除* すべてのサービスと選択 **[!UICONTROL 保存]**.
   ![サービスを無効にする](assets/adminconsole-createProfile-services.png)

次に、チュートリアル参加者を新しく作成した製品プロファイルの管理者として追加します。 If *あなた* はチュートリアルの参加者です。次に進んでください： [Experience Platform製品プロファイルの設定](#configure-experience-platform-product-profile):

1. を選択します。 `Luma Tutorial Platform` 製品プロファイル：

   ![プロファイルを開く](assets/adminconsole-newProfileInList.png)

1. を選択します。 **[!UICONTROL 管理者]** タブをクリックし、 **[!UICONTROL 管理者を追加]** ボタン：

   ![「管理者」タブに移動し、「管理者の追加」を選択します。](assets/adminconsole-addAdmin.png)

1. ワークフローを完了し、チュートリアル参加者を管理者として追加します。

これらの手順を完了すると、 `Luma Tutorial Platform` プロファイルは 1 人の管理者で設定されます。
![Platform プロファイルが作成されました](assets/adminconsole-platform-profileCreated.png)

## Experience Platform製品プロファイルの設定

これで、 `Luma Tutorial Platform` 製品プロファイル：チュートリアルの完了に必要な権限と役割を設定できます。

### 権限の追加

次に、個々の権限項目をプロファイルに追加します。

1. を開きます。 `Luma Tutorial Platform` 製品プロファイル
1. 「**[!UICONTROL 権限]**」タブを選択します。
1. の下 **[!UICONTROL サンドボックス]**、 **[!UICONTROL Prod]** サンドボックスをプロファイルに追加します。 次にアクセスする必要があります： [!DNL Prod] サンドボックスを追加します。 次のレッスンでチュートリアルサンドボックスを追加したら、 [!DNL Prod] 製品プロファイルのサンドボックス。
1. の下 [!UICONTROL データ取り込み]、 [!UICONTROL ソースの管理] および [!UICONTROL ソースを表示] 権限項目。
1. 次の権限項目をすべて追加します。
   1. [!UICONTROL データモデリング]
   1. [!UICONTROL データ管理]
   1. [!UICONTROL プロファイル管理]
   1. [!UICONTROL ID 管理]
   1. [!UICONTROL サンドボックス管理]
   1. [!UICONTROL クエリサービス]
   1. [!UICONTROL データ収集]
   1. [!UICONTROL データガバナンス]
   1. [!UICONTROL ダッシュボード]
   1. [!UICONTROL アラート]

1. すべての権限項目を追加したら、必ず **[!UICONTROL 保存]** ボタン

### 自分をユーザーとして追加する

この時点で、 `Luma Tutorial Platform` は *のみ* Experience Platform製品プロファイルを使用する場合、Experience Platformのユーザーインターフェイスにログインできません。 それには、 *ユーザー* 製品プロファイル内の 幸いにも、あなたは *admin* 製品プロファイルの「 *ユーザー*!

1. 次に移動： **[!UICONTROL ユーザー]** タブ
1. を選択します。 **[!UICONTROL ユーザーを追加]** ボタン
   ![ユーザーを追加を選択](assets/adminconsole-addUser.png)
1. ワークフローを完了し、自分を製品プロファイルにユーザーとして追加する

### 自分を開発者として追加する

Platform API を使用するには、自分を開発者として追加します。

1. 次に移動： **[!UICONTROL 開発者]** タブ
1. を選択します。 **[!UICONTROL 開発者を追加]** ボタン
   ![ユーザーを追加を選択](assets/adminconsole-addDeveloper.png)
1. ワークフローを完了して、自分を製品プロファイルに開発者として追加する

## データ収集製品プロファイルの作成（システム管理者または製品管理者が必要）

この演習では、ユーザーまたは会社のシステム管理者が、データ収集用の製品プロファイル ( 旧称Adobe Experience Platform Launch) を作成し、製品プロファイル管理者として追加します。

>[!NOTE]
>
>このチュートリアルを同僚の手助けをするシステム管理者の場合は、これらを *製品管理者* データ収集用。 製品管理者は、これらの手順を自分で完了し、将来的にデータ収集の他のユーザーを管理できます。

製品プロファイルを作成するには：

1. 内 [!DNL Adobe Admin Console] Adobe Experience Platform Data Collection 製品に移動します。
1. という名前の新しいプロファイルを追加します。 `Luma Tutorial Data Collection` （会社の複数の担当者がこのチュートリアルを受け取る場合は、チュートリアル参加者の名前を最後に追加します）。
1. をオフにする **[!UICONTROL プロパティ]** > **[!UICONTROL 自動インクルード]** 設定
1. この時点でプロパティや権限を割り当てない
1. チュートリアル参加者をこのプロファイルの管理者として追加

これらの手順を完了すると、 `Luma Tutorial Data Collection` プロファイルは 1 人の管理者で設定されます。
![データ収集プロファイルが作成されました](assets/adminconsole-dc-profileCreated.png)

## データ収集製品プロファイルの設定

これで、 `Luma Tutorial Data Collection` 製品プロファイル：チュートリアルの完了に必要な権限と役割を設定できます。

### 権限の追加

次に、個々の権限項目をプロファイルに追加します。

1. 内 [Adobe Admin Console](https://adminconsole.adobe.com)に移動します。 **[!UICONTROL 製品]** > **[!UICONTROL データ収集]**
1. を開きます。 `Luma Tutorial Data Collection` profile
1. 次に移動： **[!UICONTROL 権限]** タブ
1. 開く **[!UICONTROL プラットフォーム]**
1. 利用可能なすべてのプラットフォームが選択されていることを確認します（ライセンスに応じて異なるオプションが表示される場合があります）。
1. **[!UICONTROL 保存]** 変更
   ![プラットフォームの追加](assets/adminconsole-launch-addPlatforms.png)
1. 開く **[!UICONTROL プロパティ]**
1. 次を確認します。 **[!UICONTROL 自動インクルード]** トグルオフにして、どのプロパティにもアクセスできなくします（後で追加します）
1. **[!UICONTROL 保存]** 変更
   ![プロパティを削除](assets/adminconsole-launch-removeProperties.png)
1. 開く **[!UICONTROL プロパティ権限]**
1. 選択 **[!UICONTROL すべて追加]** すべてのプロパティ権限を追加するには
1. **[!UICONTROL 保存します。]**
   ![プロパティを削除](assets/adminconsole-launch-addPropertyRights.png)
1. 開く **[!UICONTROL 会社権限]**
1. 追加 **[!UICONTROL プロパティを管理]**
1. 選択 **[!UICONTROL 保存]**

   ![プロパティを削除](assets/adminconsole-launch-companyRights.png)


### 自分をユーザーとして追加する

次に、自分をデータ収集プロファイルに追加します。

1. 次に移動： **[!UICONTROL ユーザー]** タブ
1. を選択します。 **[!UICONTROL ユーザーを追加]** ボタン
   ![ユーザーを追加を選択](assets/adminconsole-launch-addUser.png)
1. ワークフローを完了し、自分を製品プロファイルにユーザーとして追加する

データ収集の開発者として自分自身を追加する必要はありません。

これで、チュートリアルの完了に必要な権限のほとんどが揃いました。 内部で行うツイークは、さらに 2 つだけです。 [!DNL Adobe Admin Console]次の 1 つを含む [サンドボックスの作成](create-a-sandbox.md)!
