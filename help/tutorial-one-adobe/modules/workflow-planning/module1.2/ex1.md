---
title: Workfrontの概要
description: Workfrontの概要
kt: 5342
doc-type: tutorial
exl-id: 0867d7fd-4d12-46d8-a5ae-bb8db1575635
source-git-commit: 19291afe2d8101fead734fa20212a3db76369522
workflow-type: tm+mt
source-wordcount: '824'
ht-degree: 2%

---

# 1.2.1 WorkfrontとAEM Assets CS メタデータの統合

>[!IMPORTANT]
>
>この演習を完了するには、動作しているAEM Assets CS オーサー環境にアクセスできる必要があります。
>
>考慮すべき 2 つのオプションがあります。
>
>- GenStudio for CSC テクニカルイネーブルメントワークショップに参加している場合、インストラクターがAEM Assets CS オーサー環境を作成します。 名前と進め方をチェックしてください。
>
>- One Adobeのチュートリアルパスをすべて使用している場合は、[Adobe Experience Manager Cloud ServiceとEdge Delivery Services](./../../../modules/asset-mgmt/module2.1/aemcs.md){target="_blank"} の演習にアクセスしてください。 指示に従うと、そのような環境にアクセスできます。

>[!IMPORTANT]
>
>以前にAEM CS プログラムをAEM Assets CS 環境で設定している場合は、AEM CS サンドボックスが休止状態になっている可能性があります。 このようなサンドボックスの休止解除には 10～15 分かかるので、後で待つ必要がないように、今すぐ休止解除プロセスを開始することをお勧めします。

[https://experience.adobe.com/](https://experience.adobe.com/){target="_blank"} に移動します。 クリックして **Workfront** を開きます。

![Workfront計画 ](./../module1.1/images/wfpl1.png)

その後、これが表示されます。

![WF](./images/wfb1.png)

## AEM Assets統合を設定 1.2.1.1 るには

**メニュー** アイコンをクリックし、「**設定**」を選択します。

![WF](./images/wfb2.png)

左側のメニューで、下にスクロールして **ドキュメント** を表示し、**Experience Manager Assets** をクリックします。 「**+ Experience Manager統合を追加**」をクリックします。

![WF](./images/wfb3.png)

統合の名前には、`--aepUserLdap-- - CitiSignal AEM` を使用します。

**Experience Manager リポジトリ** ドロップダウンを開き、AEM CS インスタンス（`--aepUserLdap-- - CitiSignal`）を選択します。

![WF](./images/wfb5.png)

**メタデータ** で、次のマッピングを設定します。

| Workfront フィールド | Experience Manager Assets フィールド |
| --------------- | ------------------------------ | 
| **ドキュメント** > **名前** | **wm:documentName** |
| **プロジェクト** > **名前** | **wm:projectName** |
| **プロジェクト** > **説明** | **wm:projectDescription** |
| **ドキュメント要求** > **ステータス** | **wm:wm:documentStatus** |
| **タスク** > **名前** | **wm:taskName** |
| **タスク** > **説明** | **wm:taskDescription** |
| **プロジェクト** > **ID** | **wm:projectId** |

**オブジェクトメタデータを同期** のスイッチを有効にします。

「**保存**」をクリックします。

![WF](./images/wfb6.png)

これで、WorkfrontからAEM Assets CS への統合が設定されました。

![WF](./images/wfb7.png)

## AEM Assets1.2.1.2 のメタデータ統合の設定

次に、AEM Assets CS を設定して、WorkfrontのアセットのメタデータフィールドがAEM Assets CS と共有されるようにする必要があります。

その場合は、[https://experience.adobe.com/](https://experience.adobe.com/) にアクセスしてください。 **Experience Manager Assets** をクリックします。

![WF](./images/wfbaem1.png)

「」をクリックしてAEM Assets環境を選択します。これは、`--aepUserLdap-- - CitiSignal dev` という名前にする必要があります。

![WF](./images/wfbaem2.png)

この画像が表示されます。 左側のメニューで、**Assets** に移動します。

![WF](./images/wfbaem3.png)

次に、「**フォルダーを作成**」をクリックします。

![WF](./images/wfbaem3a.png)

フォルダーに `--aepUserLdap-- - CitiSignal Fiber Launch Assets` という名前を付け、「作成 **をクリック** ます。

![WF](./images/wfbaem4.png)

次に、左側のメニューで **メタデータForms** に移動し、「作成 **をクリックし** す。

![WF](./images/wfbaem5.png)

`--aepUserLdap-- - Metadata Form` という名前を使用して、「作成 **をクリックし** す。

![WF](./images/wfbaem6.png)

フォームに 7 つの新しい **1 行のテキスト** フィールドを追加し、最初のフィールドを選択します。 次に、最初のフィールドの **メタデータプロパティ** フィールドの横にある **スキーマ** アイコンをクリックします。

![WF](./images/wfbaem7.png)

このポップアップが表示されます。 検索フィールドに「`wm:project`」と入力し、「**プロジェクト名**」フィールドを選択します。 「**選択**」をクリックします。

![WF](./images/wfbaem11.png)

フィールドのラベルを `Project Name` に変更します。 「**保存**」をクリックします。

![WF](./images/wfbaem12.png)

2 番目のフィールドに移動し、「**メタデータプロパティ** フィールドの横にある **スキーマ** アイコンをクリックします。

![WF](./images/wfbaem12a.png)

検索フィールドに「`wm:project`」と入力し、「**プロジェクト説明**」フィールドを選択します。 「**選択**」をクリックします。

![WF](./images/wfbaem8.png)

フィールドのラベルを `Project Description` に変更します。

![WF](./images/wfbaem9.png)

次に、3 番目のフィールドを選択し、「**メタデータプロパティ** フィールドの横にある **スキーマ** アイコンを再度クリックします。

![WF](./images/wfbaem10b.png)

その後、このポップアップが再び表示されます。 検索フィールドに「`wm:project`」と入力し、「**プロジェクト ID**」フィールドを選択します。 「**選択**」をクリックします。

![WF](./images/wfbaem10.png)

フィールドのラベルを `Project ID` に変更します。

![WF](./images/wfbaem10a.png)

次に、4 番目のフィールドを選択し、**メタデータプロパティ** フィールドの横にある **スキーマ** アイコンをもう一度クリックします。

![WF](./images/wfbaem11a.png)

その後、このポップアップが再び表示されます。 検索フィールドに「`wm:document`」と入力し、「**プロジェクト ID**」フィールドを選択します。 「**選択**」をクリックします。

![WF](./images/wfbaem101.png)

フィールドのラベルを `Document Status` に変更します。

![WF](./images/wfbaem102.png)

次に、5 番目のフィールドを選択し、「**メタデータプロパティ** フィールドの横にある **スキーマ** アイコンをもう一度クリックします。

![WF](./images/wfbaem103.png)

その後、このポップアップが再び表示されます。 検索フィールドに「`wm:document`」と入力し、「**プロジェクト ID**」フィールドを選択します。 「**選択**」をクリックします。

![WF](./images/wfbaem104.png)

フィールドのラベルを `Document Name` に変更します。

![WF](./images/wfbaem105.png)

次に、6 番目のフィールドを選択し、「**メタデータプロパティ** フィールドの横にある **スキーマ** アイコンをもう一度クリックします。

![WF](./images/wfbaem106.png)

その後、このポップアップが再び表示されます。 検索フィールドに「`wm:task`」と入力し、「**タスク名**」フィールドを選択します。 「**選択**」をクリックします。

![WF](./images/wfbaem107.png)

フィールドのラベルを `Task Name` に変更します。

![WF](./images/wfbaem108.png)

次に、7 番目のフィールドを選択し、「**メタデータプロパティ** フィールドの横にある **スキーマ** アイコンをもう一度クリックします。

![WF](./images/wfbaem109.png)

その後、このポップアップが再び表示されます。 検索フィールドに「`wm:task`」と入力し、「**タスクの説明**」フィールドを選択します。 「**選択**」をクリックします。

![WF](./images/wfbaem110.png)

フィールドのラベルを `Task Description` に変更します。

![WF](./images/wfbaem111.png)

フォームの **タブ名** を `--aepUserLdap-- - Workfront Metadata` に変更します。

![WF](./images/wfbaem13.png)

**保存** および **閉じる** をクリックします。

![WF](./images/wfbaem13a.png)

これで **メタデータフォーム** が設定されました。

![WF](./images/wfbaem14.png)

次に、メタデータフォームを作成済みのフォルダーに割り当てる必要があります。 メタデータフォームのチェックボックスをオンにして、「**フォルダーに割り当て**」をクリックします。

![WF](./images/wfbaem15.png)

`--aepUserLdap-- - CitiSignal Fiber Launch Assets` という名前のフォルダーを選択します。 **割り当て** をクリックします。

![WF](./images/wfbaem16.png)

メタデータフォームがフォルダーに正常に割り当てられました。

![WF](./images/wfbaem17.png)

次の手順：Workfrontで [1.2.2 を校正する ](./ex2.md){target="_blank"}

[Adobe Workfrontによるワークフロー管理 ](./workfront.md){target="_blank"} に戻る

[ すべてのモジュールに戻る ](./../../../overview.md){target="_blank"}
