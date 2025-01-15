---
title: Fireflyサービスの概要
description: Fireflyサービスの概要
kt: 5342
doc-type: tutorial
exl-id: 42e260e0-8af0-4d71-b634-48c1966bd912
source-git-commit: a0c16a47372d322a7931578adca30a246b537183
workflow-type: tm+mt
source-wordcount: '703'
ht-degree: 2%

---

# 1.2.1 Workfront Fusion の概要

この演習では、Workfront Fusion とAdobe I/Oを使用して、Adobe Fireflyサービス API をクエリします。

## 1.2.1.1 新しいシナリオの作成

[https://experience.adobe.com/](https://experience.adobe.com/) に移動します。 クリックして **Workfront Fusion** を開きます。

![WF Fusion](./images/wffusion1.png)

この画像が表示されます。 **シナリオ** に移動します。

![WF Fusion](./images/wffusion2.png)

「**新しいシナリオを作成**」をクリックします。

![WF Fusion](./images/wffusion3.png)

その後、空のシナリオが表示されます。 **ツール** アイコンをクリックし、「**複数の変数を設定**」を選択します。

![WF Fusion](./images/wffusion4.png)

ここで、**clock** アイコンを、新しく追加された **複数の変数を設定** に移動する必要があります。

![WF Fusion](./images/wffusion5.png)

その後、これが表示されます。

![WF Fusion](./images/wffusion6.png)

次に、疑問符を右クリックし、「**モジュールを削除**」を選択します。

![WF Fusion](./images/wffusion7.png)

次に、「**複数の変数を設定**」オブジェクトを右クリックし、「**設定**」を選択します。

![WF Fusion](./images/wffusion8.png)

## 1.2.1.2 Adobe I/O認証を設定する

次に、Adobe I/Oに対して認証するために必要な変数を設定する必要があります。前の演習では、Adobe I/Oプロジェクトを作成しました。 この時点で、そのAdobe I/Oプロジェクトの変数をWorkfront Fusion で定義する必要があります。

以下の変数を定義する必要があります。

| キー | 値 |
|:-------------:| :---------------:| 
| `CONST_client_id` | Adobe I/Oプロジェクトのクライアント ID |
| `CONST_client_secret` | Adobe I/Oプロジェクトのクライアント秘密鍵 |
| `CONST_scope` | Adobe I/Oプロジェクトの範囲 |

これらの変数を見つけるには、[https://developer.adobe.com/console/projects](https://developer.adobe.com/console/projects) に移動して、`--aepUserLdap-- Firefly` という名前のAdobe I/Oプロジェクトを開きます。

![WF Fusion](./images/wffusion9.png)

プロジェクトで、「**OAuth サーバー間**」をクリックして、上記のキーの値を確認します。

![WF Fusion](./images/wffusion10.png)

上記のキーと値を使用して、**複数の変数を設定** オブジェクトを設定できます。 **項目を追加** をクリックします。

![WF Fusion](./images/wffusion11.png)

**変数名**:**CONST_client_id** とその **変数値** を入力し、「**追加**」をクリックします。

![WF Fusion](./images/wffusion12.png)

**項目を追加** をクリックします。

![WF Fusion](./images/wffusion13.png)

**変数名**:**CONST_client_secret** とその **変数値** を入力し、「**追加**」をクリックします。

![WF Fusion](./images/wffusion14.png)

**項目を追加** をクリックします。

![WF Fusion](./images/wffusion15.png)

**変数名**:**CONST_scope** とその **変数値** を入力し、「**追加**」をクリックします。

![WF Fusion](./images/wffusion16.png)

「**OK**」をクリックします。

![WF Fusion](./images/wffusion17.png)

**複数の変数を設定** オブジェクトの上にマウスポインターを置き、大きな **+** アイコンをクリックして別のモジュールを追加します。

![WF Fusion](./images/wffusion18.png)

この画像が表示されます。

![WF Fusion](./images/wffusion19.png)

検索バーに「**http**」と入力します。 **HTTP** を選択して開きます。

![WF Fusion](./images/wffusion21.png)

次に、「**リクエストを行う**」を選択します。

![WF Fusion](./images/wffusion20.png)

| キー | 値 |
|:-------------:| :---------------:| 
| `URL` | `https://ims-na1.adobelogin.com/ims/token/v3` |
| `Method` | `POST` |
| `Body Type` | `x-www-form-urlencoded` |

**項目を追加** をクリックします。

![WF Fusion](./images/wffusion22.png)

次の各値の項目を追加します。

| キー | 値 |
|:-------------:| :---------------:| 
| `client_id` | `CONST_client_id` 用の事前定義済みの変数 |
| `client_secret` | `CONST_client_secret` 用の事前定義済みの変数 |
| `scope` | `CONST_scope` 用の事前定義済みの変数 |
| `grant_type` | `client_credentials` |

`client_id` の設定。

![WF Fusion](./images/wffusion23.png)

`client_secret` の設定。

![WF Fusion](./images/wffusion25.png)

`scope` の設定。

![WF Fusion](./images/wffusion26.png)

`grant_type` の設定。

![WF Fusion](./images/wffusion28.png)

設定の概要。 下にスクロールして、「応答を解析 **のチェックボックスをオンに** ます。 「**OK**」をクリックします。

![WF Fusion](./images/wffusion27.png)

この画像が表示されます。 **1 回実行** をクリックします。

![WF Fusion](./images/wffusion29.png)

シナリオが実行されると、次の画面が表示されます。

![WF Fusion](./images/wffusion30.png)

**複数の変数を設定** オブジェクトの **疑問符** アイコンをクリックして、そのオブジェクトが実行されたときに何が起こったかを確認します。

![WF Fusion](./images/wffusion31.png)

**HTTP - リクエストを行う** オブジェクトの **疑問符** アイコンをクリックして、そのオブジェクトが実行されたときに何が起こったかを確認します。 **OUTPUT** には、Adobe I/Oから返される **access_token** が表示されます。

![WF Fusion](./images/wffusion32.png)

**HTTP - リクエストを行う** オブジェクトにポインタを合わせて、「**+**」アイコンをクリックし、別のモジュールを追加します。

![WF Fusion](./images/wffusion33.png)

検索バーで `tools` を検索します。 **ツール** を選択します。

![WF Fusion](./images/wffusion34.png)

「**複数の変数を設定**」を選択します。

![WF Fusion](./images/wffusion35.png)

**項目を追加** を選択します。

![WF Fusion](./images/wffusion36.png)

**変数名** を `bearer_token` に設定します。 動的な **変数値** として「`access_token`」を選択します。 **追加** をクリックします。

![WF Fusion](./images/wffusion37.png)

これで完了です。 「**OK**」をクリックします。

![WF Fusion](./images/wffusion38.png)

もう一度 **実行** をクリックします。

![WF Fusion](./images/wffusion39.png)

シナリオが実行されたら、最後の **複数の変数を設定** オブジェクトの **疑問符** アイコンをクリックします。 access_token が変数 `bearer_token` に保存されていることがわかります。

![WF Fusion](./images/wffusion40.png)

次に、最初のオブジェクトを右クリックし **複数の値を設定**、「名前を変更 **を選択し** す。

![WF Fusion](./images/wffusion41.png)

名前を **定数を初期化** に設定します。 「**OK**」をクリックします。

![WF Fusion](./images/wffusion42.png)

2 番目のオブジェクトの名前を変更し、名前を **Adobe I/Oに対して認証** に設定します。 「**OK**」をクリックします。

![WF Fusion](./images/wffusion43.png)

3 番目のオブジェクトの名前を変更し、名前を **ベアラートークンを設定** に設定します。 「**OK**」をクリックします。

![WF Fusion](./images/wffusion44.png)

これで完了です。

![WF Fusion](./images/wffusion45.png)

次に、シナリオの名前を `--aepUSerLdap-- - Adobe I/O Authentication` に変更します。

![WF Fusion](./images/wffusion46.png)

「**保存**」をクリックします。

![WF Fusion](./images/wffusion47.png)

次の手順：[1.2.2 Workfront Fusion 内でAdobeAPI を使用する ](./ex2.md)

[モジュール 1.2 に戻る](./automation.md)

[すべてのモジュールに戻る](./../../../overview.md)
