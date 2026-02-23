---
title: 最初のフォームを作成
description: 最初のフォームを作成
kt: 5342
doc-type: tutorial
source-git-commit: 8f59b9fdadc9c5aeadb1d4ecccd75090c339b43e
workflow-type: tm+mt
source-wordcount: '608'
ht-degree: 10%

---

# 1.3.1 最初のフォームを作成する

>[!IMPORTANT]
>
>この演習を行うには、AEM Assets Dynamic Media が有効になっている、動作中のAEM Assets CS オーサー環境にアクセスできる必要があります。
>
>そのような環境がない場合は、[Adobe Experience Manager Cloud ServiceおよびEdge Delivery Services](./../../../modules/asset-mgmt/module2.1/aemcs.md){target="_blank"} に移動します。 指示に従うと、そのような環境にアクセスできます。

>[!IMPORTANT]
>
>以前にAEM CS プログラムをAEM Assets CS 環境で設定している場合は、AEM CS サンドボックスが休止状態になっている可能性があります。 このようなサンドボックスの休止解除には 10～15 分かかるので、後で待つ必要がないように、今すぐ休止解除プロセスを開始することをお勧めします。

## 1.3.1.1 -

[https://my.cloudmanager.adobe.com](https://my.cloudmanager.adobe.com){target="_blank"} に移動します。 選択する組織は `--aepImsOrgName--` です。 環境を開きます。

![AEM Forms](./images/aemforms1.png)

**Forms** に移動します。

![AEM Forms](./images/aemforms2.png)

**Formsとドキュメント** に移動します。

![AEM Forms](./images/aemforms3.png)

**作成** をクリックして、「**アダプティブフォーム**」を選択します。

![AEM Forms](./images/aemforms4.png)

「**Edge Delivery Services**」を選択し、「**空白のページ**」を選択します。 「**作成**」をクリックします。

![AEM Forms](./images/aemforms5.png)

この画像が表示されます。 次のフィールドに入力します。

- **タイトル**: `Fiber Max Interest Form`
- **名前**: フィールド **タイトル** に基づいて自動的に入力される必要があります。
- **Github URL**:web サイトにリンクされている Github リポジトリーへのパスを指定します

「**作成**」をクリックします。

![AEM Forms](./images/aemforms6.png)

「**作成**」をクリックすると、**ユニバーサルエディター** が自動的に開き、次のようなメッセージが表示されます。 アイコンをクリックして **コンテンツツリー** を開きます。

![AEM Forms](./images/aemforms7.png)

**コンテンツツリー** で、オブジェクト **アダプティブフォーム** を選択します。

![AEM Forms](./images/aemforms8.png)

次に、「**+**」アイコンをクリックして新しい要素を追加し、「**テキスト入力**」を選択します。

![AEM Forms](./images/aemforms9.png)

**コンテンツツリー** で、「**テキスト入力**」フィールドを選択します。

![AEM Forms](./images/aemforms10.png)

**基本** ビューに移動します。 これが表示されます。

次のフィールドに入力します。

- **名前**: `first-name`
- **タイトル**: `First Name`

次に、**検証** に移動します。

![AEM Forms](./images/aemforms11.png)

これを必須フィールドにするには、スイッチを切り替えます。 次のフィールドに入力します。

- **エラーメッセージ**: `Enter your first name`
- **パターン**: `[A-Za-z][A-Za-z ]+`
- **パターンのエラーメッセージ**: `Letters only!`

![AEM Forms](./images/aemforms12.png)

**コンテンツツリー** で、「**アダプティブフォーム**」フィールドを選択します。 **+** アイコンをクリックし、「**テキスト入力**」を選択します。

![AEM Forms](./images/aemforms13.png)

**コンテンツツリー** で、新しく作成したフィールド **テキスト入力** を選択します。 **プロパティ** に移動します。

![AEM Forms](./images/aemforms14.png)

**基本** ビューに移動します。 これが表示されます。

次のフィールドに入力します。

- **名前**: `last-name`
- **タイトル**: `Last Name`

次に、**検証** に移動します。

![AEM Forms](./images/aemforms15.png)

これを必須フィールドにするには、スイッチを切り替えます。 次のフィールドに入力します。

- **エラーメッセージ**: `Enter your last name`
- **パターン**: `[A-Za-z][A-Za-z ]+`
- **パターンのエラーメッセージ**: `Letters only!`

![AEM Forms](./images/aemforms16.png)

**コンテンツツリー** で、「**アダプティブフォーム**」フィールドを選択します。 **+** アイコンをクリックし、「**テキスト入力**」を選択します。

![AEM Forms](./images/aemforms17.png)

**コンテンツツリー** で、新しく作成したフィールド **テキスト入力** を選択します。 **プロパティ** に移動します。

![AEM Forms](./images/aemforms18.png)

**基本** ビューに移動します。 これが表示されます。

次のフィールドに入力します。

- **名前**: `email`
- **タイトル**: `Email`

次に、**検証** に移動します。

![AEM Forms](./images/aemforms19.png)

これを必須フィールドにするには、スイッチを切り替えます。 次のフィールドに入力します。

- **エラーメッセージ**: `Enter your email address`
- **パターン**: `^[^@]+@[^@]+\.[^@]+$`
- **パターンのエラーメッセージ**: `Please verify your email address!`

![AEM Forms](./images/aemforms20.png)

**コンテンツツリー** で、「**アダプティブフォーム**」フィールドを選択します。 **+** アイコンをクリックし、「**テキスト入力**」を選択します。

![AEM Forms](./images/aemforms21.png)

**コンテンツツリー** で、新しく作成したフィールド **テキスト入力** を選択します。

![AEM Forms](./images/aemforms22.png)

**基本** ビューに移動します。 これが表示されます。

次のフィールドに入力します。

- **名前**: `city`
- **タイトル**: `city`

次に、**検証** に移動します。

![AEM Forms](./images/aemforms23.png)

これを必須フィールドにするには、スイッチを切り替えます。 次のフィールドに入力します。

- **エラーメッセージ**: `Enter your city`
- **パターン**: `[A-Za-z][A-Za-z ]+`
- **パターンのエラーメッセージ**: `Letters only!`

![AEM Forms](./images/aemforms24.png)

「**公開**」をクリックします。

![AEM Forms](./images/aemforms25.png)

もう一度 **公開** をクリックします。

![AEM Forms](./images/aemforms26.png)

クリックしてフォームを開きます。

![AEM Forms](./images/aemforms27.png)

その後、フォームに入力できますが、まだ送信できません。

![AEM Forms](./images/aemforms28.png)

## 次の手順

次の手順：[-](./ex1.md){target="_blank"}

Edge Delivery Servicesで [Adobe Experience Manager Formsに戻る ](./aemforms.md){target="_blank"}

[ すべてのモジュールに戻る ](./../../../overview.md){target="_blank"}
