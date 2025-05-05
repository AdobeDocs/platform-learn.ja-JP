---
title: データガバナンスフレームワークの適用
seo-title: Apply the data governance framework | Getting Started with Adobe Experience Platform for Data Architects and Data Engineers
breadcrumb-title: データガバナンスフレームワークの適用
description: このレッスンでは、サンドボックスに取り込んだデータにデータガバナンスフレームワークを適用します。
role: Data Architect
feature: Data Governance
jira: KT-4348
thumbnail: 4348-apply-data-governance-framework.jpg
exl-id: 3cc3c794-5ffd-41bf-95d8-be5bca2e3a0f
source-git-commit: 286c85aa88d44574f00ded67f0de8e0c945a153e
workflow-type: tm+mt
source-wordcount: '621'
ht-degree: 5%

---

# データガバナンスフレームワークの適用

<!--15min-->

このレッスンでは、サンドボックスに取り込んだデータにデータガバナンスフレームワークを適用します。

Adobe Experience Platform データガバナンスを使用すると、顧客データを管理し、データの使用に適用される規制、制限、ポリシーへのコンプライアンスを確保できます。データの使用の制御など、様々なレベルで、Experience Platform内で重要な役割を果たします。

演習を開始する前に、データガバナンスに関する次の短いビデオをご覧ください。
>[!VIDEO](https://video.tv.adobe.com/v/41322?learn=on&enablevpops&captions=jpn)

>[!VIDEO](https://video.tv.adobe.com/v/34106?learn=on&enablevpops&captions=jpn)

<!--
## Permissions required

In the [Configure Permissions](configure-permissions.md) lesson, you set up all the access controls required to complete this lesson, specifically:

* Permission items **[!UICONTROL Data Governance]** > **[!UICONTROL Manage Usage Labels]**, **[!UICONTROL Manage Data Usage Policies]** and **[!UICONTROL View Data Usage Policies]**
* Permission items **[!UICONTROL Data Management]** > **[!UICONTROL View Datasets]** and **[!UICONTROL Manage Datasets]**
* Permission item **[!UICONTROL Sandboxes]** > `Luma Tutorial`
* User-role access to the `Luma Tutorial Platform` Product Profile
-->

## ビジネスシナリオ

Luma は、ロイヤルティデータがサードパーティと共有されないことをロイヤルティプログラムのメンバーに約束します。 このシナリオは、レッスンの残りの部分で実装します。

## データガバナンスラベルの適用

データガバナンスプロセスの最初の手順は、データにガバナンスラベルを適用することです。 その前に、使用可能なラベルを簡単に見てみましょう。

1. Platform ユーザーインターフェイスの左側のナビゲーションで **[!UICONTROL ポリシー]** を選択します
1. アカウントのすべてのラベルを表示するには、「**[!UICONTROL ラベル]**」タブに移動します。

すぐに使用できるラベルが多数あり、「[!UICONTROL &#x200B; ラベルを作成 &#x200B;] ボタンを使用して独自のラベルを作成できます。 主なタイプは 3 つあります。[!UICONTROL &#x200B; 契約ラベル &#x200B;]、[!UICONTROL ID ラベル &#x200B;]、および [!UICONTROL &#x200B; 機密ラベル &#x200B;] で、データが制限される一般的な理由に対応しています。 各ラベルには、[!UICONTROL &#x200B; わかりやすい名前 &#x200B;] と、タイプと数値の略語である短い [!UICONTROL &#x200B; 名前 &#x200B;] が含まれています。 例えば、[!DNL C1] のラベルは「サードパーティの書き出しなし」のためのものであり、これはロイヤルティポリシーに必要なものです。

![ データガバナンスラベル ](assets/governance-policies.png)

次に、使用を制限するデータにラベルを付けます。

1. Platform ユーザーインターフェイスの左側のナビゲーションで **[!UICONTROL データセット]** を選択します
1. `Luma Loyalty Dataset` を開きます
1. 「**[!UICONTROL データガバナンス]**」タブに移動します
1. ラベルは、個々のフィールドに適用することも、データセット全体に適用することもできます。 ラベルをデータセット全体に適用します。 鉛筆アイコンをクリックします。 このアイコンが表示されない場合は、ブラウザーを広げるか、中央のパネルを右にスクロールしてみてください。
   ![データガバナンス](assets/governance-dataset.png)
1. モーダルで、「**[!UICONTROL 契約ラベル]**」セクションを展開し、「**[!UICONTROL C2]**」ラベルを確認します
1. 「**[!UICONTROL 変更を保存]**」ボタンを選択します
   ![データガバナンス](assets/governance-applyLabel.png)
1. [!UICONTROL &#x200B; 継承されたラベルを表示 &#x200B;] 切替スイッチをオンにして、メインの **[!UICONTROL データガバナンス]** 画面に戻ると、データセット内のすべてのフィールドにどのようにラベルが適用されているかを確認できます。
   ![データガバナンス](assets/governance-labelsAdded.png)


<!--adding extra, unnecessary fields from field groups makes it harder to see which fields really need labels-->
<!--Are there any best practices for applying governance labels-->

## データガバナンスポリシーの作成

データにラベルが付いたので、ポリシーを作成できます。

1. Platform ユーザーインターフェイスの左側のナビゲーションで **[!UICONTROL ポリシー]** を選択します
1. 「参照」タブには、C2 ラベルをマーケティングアクション [!UICONTROL &#x200B; サードパーティへの書き出し &#x200B;] に関連付ける、「サードパーティの書き出し制限」という標準ポリシーが既に存在します。まさに必要なポリシーです。
1. ポリシーを選択してから、**[!UICONTROL ポリシーのステータス]** 切り替えスイッチで有効にします
   ![データガバナンス](assets/governance-enablePolicy.png)

「**[!UICONTROL ポリシーを作成]**」ボタンを選択して、独自のポリシーを作成できます。 これにより、複数のラベルとマーケティングアクション制限を組み合わせることができるウィザードが開きます。

## ガバナンスポリシーの適用

ガバナンスポリシーの実施は、明らかにこのフレームワークの主要なコンポーネントです。 データがアクティブ化され、Platform から送信されると、ダウンストリームで適用が行われます。特に、Real-Time Customer Data Platformでは、ライセンスが取得される場合とされない場合があります。 いずれにしても、このチュートリアルの範囲外です。 ただし、ポリシーの適用方法について詳しくは、このビデオをご覧ください。関連する部分までキューに入れました。 また、ポリシーに違反した場合の動作も示します。

>[!VIDEO](https://video.tv.adobe.com/v/33631/?t=151&quality=12&learn=on&enablevpops)


## その他のリソース

* [ データガバナンスに関するドキュメント ](https://experienceleague.adobe.com/docs/experience-platform/data-governance/home.html?lang=ja)
* [ データセットサービス API リファレンス ](https://www.adobe.io/experience-platform-apis/references/dataset-service/)
* [ ガバナンスポリシーサービス API リファレンス ](https://www.adobe.io/experience-platform-apis/references/policy-service/)

次に、[ クエリサービス ](run-queries.md) に進みます。
