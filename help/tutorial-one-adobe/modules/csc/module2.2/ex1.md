---
title: Workfrontの概要
description: Workfrontの概要
kt: 5342
doc-type: tutorial
exl-id: 7ed76d37-5d3e-49c7-b3d3-ebcfe971896d
source-git-commit: ec79d3fcfe971faee584a221eb55ddcb015a1e50
workflow-type: tm+mt
source-wordcount: '768'
ht-degree: 2%

---

# 2.2.1 Workfrontの概要

[https://experienceplatform.my.workfront.com/](https://experienceplatform.my.workfront.com/){target="_blank"} に移動して、Adobe Workfrontにログインします。

次に、これを確認します。

![WF](./images/wfb1.png)

## 2.2.1.1 AEM Assets統合の設定

9 つのドット **ハンバーガー** アイコンをクリックし、「**設定**」を選択します。

![WF](./images/wfb2.png)

左側のメニューで、下にスクロールして **ドキュメント** を表示し、**Experience Manager Assets** をクリックします。

![WF](./images/wfb3.png)

「**+Experience Manager統合を追加**」をクリックします。

![WF](./images/wfb4.png)

統合の名前には、`--aepUserLdap-- - Citi Signal AEM` を使用します。

**0}Experience Managerリポジトリー } ドロップダウンを開き、AEM CS インスタンス（`--aepUserLdap-- - Citi Signal`）を選択します。**

![WF](./images/wfb5.png)

**メタデータ** で、次のマッピングを設定します。

| Workfront フィールド | Experience Manager Assets フィールド |
| --------------- | ------------------------------ | 
| **ドキュメント** > **名前** | **wm:documentName** |
| **プロジェクト** > **説明** | **wm:projectDescription** |
| **タスク** > **名前** | **wm:taskName** |
| **タスク** > **説明** | **wm:taskDescription** |

**オブジェクトメタデータを同期** のスイッチを有効にします。

「**保存**」をクリックします。

![WF](./images/wfb6.png)

これで、WorkfrontからAEM Assets CS への統合が設定されました。

![WF](./images/wfb7.png)

## 2.2.1.2 AEM Assetsとのメタデータ統合の設定

次に、AEM AssetsのアセットのメタデータフィールドがAEMと共有されるように、Workfrontを設定する必要があります。

その場合は、[https://experience.adobe.com/](https://experience.adobe.com/) にアクセスしてください。 **Experience Manager Assets** をクリックします。

![WF](./images/wfbaem1.png)

「」をクリックしてAEM Assets環境を選択します。これは、`--aepUserLdap-- - Citi Signal dev` という名前にする必要があります。

![WF](./images/wfbaem2.png)

この画像が表示されます。 左側のメニューで、**Assetsに移動し** 「**フォルダーを作成**」をクリックします。

![WF](./images/wfbaem3.png)

フォルダーに `--aepUserLdap-- - Workfront Assets` という名前を付け、「作成 **をクリック** ます。

![WF](./images/wfbaem4.png)

次に、左側のメニューで **メタデータForms** に移動し、「作成 **をクリックし** す。

![WF](./images/wfbaem5.png)

`--aepUserLdap-- - Metadata Form` という名前を使用して、「作成 **をクリックし** す。

![WF](./images/wfbaem6.png)

フォームに 3 つの新しい **1 行のテキスト** フィールドを追加し、最初のフィールドを選択します。 次に、「メタデータプロパティ **フィールドの横にある** スキーマ **アイコンをクリック** ます。

![WF](./images/wfbaem7.png)

検索フィールドに「`wm:project`」と入力し、「**プロジェクト説明**」フィールドを選択します。 「**選択**」をクリックします。

![WF](./images/wfbaem8.png)

フィールドのラベルを **プロジェクトの説明** に変更します。

![WF](./images/wfbaem9.png)

次に、「2 番目の **1 行のテキスト**」フィールドを選択し、「**メタデータプロパティ** フィールドの横にある **スキーマ** アイコンを再度クリックします。

![WF](./images/wfbaem10b.png)

その後、このポップアップが再び表示されます。 検索フィールドに「`wm:project`」と入力し、「**プロジェクト ID**」フィールドを選択します。 「**選択**」をクリックします。

![WF](./images/wfbaem10.png)

フィールドのラベルを **プロジェクト ID** に変更します。

![WF](./images/wfbaem10a.png)

3 番目の **1 行のテキスト** フィールドを選択し、もう一度 **メタデータプロパティ** フィールドの横にある **スキーマ** アイコンをクリックします。

![WF](./images/wfbaem11a.png)

その後、このポップアップが再び表示されます。 検索フィールドに「`wm:project`」と入力し、「**プロジェクト名**」フィールドを選択します。 「**選択**」をクリックします。

![WF](./images/wfbaem11.png)

フィールドのラベルを **プロジェクト名** に変更します。 「**保存**」をクリックします。

![WF](./images/wfbaem12.png)

フォームの **タブ名** を `--aepUserLdap-- - Workfront Metadata` に変更します。 **保存** および **閉じる** をクリックします。

![WF](./images/wfbaem13.png)

これで **メタデータフォーム** が設定されました。

![WF](./images/wfbaem14.png)

次に、メタデータフォームを作成済みのフォルダーに割り当てる必要があります。 メタデータフォームのチェックボックスをオンにして、「**フォルダーに割り当て**」をクリックします。

![WF](./images/wfbaem15.png)

`--aepUserLdap-- - Workfront Assets` という名前のフォルダーを選択します。 **割り当て** をクリックします。

![WF](./images/wfbaem16.png)

メタデータフォームがフォルダーに正常に割り当てられました。

![WF](./images/wfbaem17.png)

## 2.2.1.2 AEM Sites統合の設定

>[!NOTE]
>
>このプラグインは現在 **アーリーアクセス** モードであり、まだ一般公開されていません。
>
>このプラグインは、を使用しているWorkfront インスタンスに既にインストールされている場合があります。 既にインストールされている場合は、以下の手順を確認できますが、設定を変更する必要はありません。

[https://experience.adobe.com/#/@experienceplatform/aem/extension-manager/universal-editor](https://experience.adobe.com/#/@experienceplatform/aem/extension-manager/universal-editor){target="_blank"} に移動します。

このプラグインの **toggle** が **有効** に設定されていることを確認します。 次に、「**歯車** アイコンをクリックします。

![WF](./images/wfb8.png)

**拡張機能設定** ポップアップが表示されます。 このプラグインを使用するために、以下のフィールドを設定します。

| キー | 値 |
| --------------- | ------------------------------ | 
| **`IMS_ENV`** | **PROD** |
| **`WORKFRONT_INSTANCE_URL`** | **https://experienceplatform.my.workfront.com** |
| **`SHOW_CUSTOM_FORMS`** | **&#39;{&quot;previewUrl&quot;: true, &quot;publishUrl&quot;: true}&#39;** |

「**保存**」をクリックします。

![WF](./images/wfb8.png)

Workfront UI に戻り、9 つのドット **ハンバーガー** アイコンをクリックします。 **設定** を選択します。

![WF](./images/wfb9.png)

左側のメニューで **カスタムForms** に移動し、「**フォーム**」を選択します。 「**+新規カスタムフォーム**」をクリックします。

![WF](./images/wfb10.png)

**タスク** を選択し、「**続行**」をクリックします。

![WF](./images/wfb11.png)

空のカスタムフォームが表示されます。 フォーム名 `Content Fragment & Integration ID` を入力します。

![WF](./images/wfb12.png)

新しい **1 行のテキスト** フィールドをキャンバスにドラッグ&amp;ドロップします。

![WF](./images/wfb13.png)

新しいフィールドを次のように設定します。

- **ラベル**:**コンテンツフラグメント**
- **名前**: **`aem_workfront_integration_content_fragment`**

![WF](./images/wfb14.png)

キャンバスに新しい **1 行のテキスト** フィールドを追加し、次のように新しいフィールドを設定します。

- **ラベル**: **統合 ID**
- **名前**: **`aem_workfront_integration_id`**

「**適用**」をクリックします。

![WF](./images/wfb15.png)

次に、2 番目のカスタムフォームを設定する必要があります。 「**+新規カスタムフォーム**」をクリックします。

![WF](./images/wfb10.png)

**タスク** を選択し、「**続行**」をクリックします。

![WF](./images/wfb11.png)

空のカスタムフォームが表示されます。 フォーム名 `Preview & Publish URL` を入力します。

![WF](./images/wfb16.png)

新しい **1 行のテキスト** フィールドをキャンバスにドラッグ&amp;ドロップします。

![WF](./images/wfb17.png)

新しいフィールドを次のように設定します。

- **ラベル**: **プレビュー URL**
- **名前**: **`aem_workfront_integration_preview_url`**

![WF](./images/wfb18.png)

キャンバスに新しい **1 行のテキスト** フィールドを追加し、次のように新しいフィールドを設定します。

- **ラベル**: **Publishの URL**
- **名前**: **`aem_workfront_integration_publish_url`**

「**適用**」をクリックします。

![WF](./images/wfb19.png)

その後、2 つのカスタムフォームを使用できるようになります。

![WF](./images/wfb20.png)

次の手順：Workfrontで [2.2.2 を校正する ](./ex2.md){target="_blank"}

[ モジュール 2.2 に戻る ](./workfront.md){target="_blank"}

[ すべてのモジュールに戻る ](./../../../overview.md){target="_blank"}
