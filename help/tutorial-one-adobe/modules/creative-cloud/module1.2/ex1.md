---
title: Workfront Fusion の概要
description: Workfront Fusion とAdobe I/Oを使用して、Adobe Fireflyサービス API をクエリする方法を説明します
role: Developer
level: Beginner
jira: KT-5342
doc-type: Tutorial
exl-id: 42e260e0-8af0-4d71-b634-48c1966bd912
source-git-commit: e6a549441d425801f2a554da9af803dca646009e
workflow-type: tm+mt
source-wordcount: '698'
ht-degree: 1%

---

# 1.2.1 Workfront Fusion の概要

Workfront Fusion とAdobe I/Oを使用して、Adobe Fireflyサービス API を照会する方法を説明します。

## 1.2.1.1 新しいシナリオの作成

1. [https://experience.adobe.com/](https://experience.adobe.com/) に移動します。 **Workfront Fusion** を開きます。

   ![WF Fusion](./images/wffusion1.png)

1. **シナリオ** に移動します。

   ![WF Fusion](./images/wffusion2.png)

1. **新しいシナリオを作成** を選択します。

   ![WF Fusion](./images/wffusion2a.png)

1. フォルダーに `--aepUserLdap--` という名前を付け、「**保存**」を選択します。

   ![WF Fusion](./images/wffusion2b.png)

1. フォルダーを選択し、「**新しいシナリオを作成**」を選択します。

   ![WF Fusion](./images/wffusion3.png)

1. 空のシナリオが表示されるので、「**ツール**」を選択し、「**複数の変数を設定**」を選択します。

   ![WF Fusion](./images/wffusion4.png)

1. **clock** アイコンを、新しく追加された **複数の変数を設定** の上に移動します。

   ![WF Fusion](./images/wffusion5.png)

   画面は次のようになります。

   ![WF Fusion](./images/wffusion6.png)

1. 疑問符を右クリックし、「**モジュールを削除**」を選択します。

   ![WF Fusion](./images/wffusion7.png)

1. 次に、「複数の変数を設定 **を右クリックし** 「**設定**」を選択します。

   ![WF Fusion](./images/wffusion8.png)

## 1.2.1.2 Adobe I/O認証を設定する

次に、Adobe I/Oに対して認証するために必要な変数を設定する必要があります。前の演習では、Adobe I/Oプロジェクトを作成しました。 この時点で、そのAdobe I/Oプロジェクトの変数をWorkfront Fusion で定義する必要があります。

以下の変数を定義する必要があります。

| キー | 値 |
|:-------------:| :---------------:| 
| `CONST_client_id` | Adobe I/Oプロジェクトのクライアント ID |
| `CONST_client_secret` | Adobe I/Oプロジェクトのクライアント秘密鍵 |
| `CONST_scope` | Adobe I/Oプロジェクトの範囲 |

1. これらの変数を見つけるには、[https://developer.adobe.com/console/projects](https://developer.adobe.com/console/projects) に移動して、`--aepUserLdap-- Firefly` という名前のAdobe I/Oプロジェクトを開きます。

   ![WF Fusion](./images/wffusion9.png)

1. プロジェクトで、「**OAuth サーバー間**」を選択して、上記のキーの値を確認します。

   ![WF Fusion](./images/wffusion10.png)

1. 上記のキーと値を使用して、**複数の変数を設定** オブジェクトを設定できます。 **項目を追加** を選択します。

   ![WF Fusion](./images/wffusion11.png)

1. **変数名**:**CONST_client_id** とその **変数値** を入力し、「**追加**」を選択します。

   ![WF Fusion](./images/wffusion12.png)

1. **項目を追加** を選択します。

   ![WF Fusion](./images/wffusion13.png)

1. **変数名**:**CONST_client_secret** とその **変数値** を入力し、「**追加**」を選択します。

   ![WF Fusion](./images/wffusion14.png)

1. **項目を追加** を選択します。

   ![WF Fusion](./images/wffusion15.png)

1. **変数名**:**CONST_scope** とその **変数値** を入力し、「**追加**」を選択します。

   ![WF Fusion](./images/wffusion16.png)

1. **OK** を選択します。

   ![WF Fusion](./images/wffusion17.png)

1. **複数の変数を設定** にポインタを合わせ、大きな **+** アイコンを選択して別のモジュールを追加します。

   ![WF Fusion](./images/wffusion18.png)

   画面は次のようになります。

   ![WF Fusion](./images/wffusion19.png)

1. 検索バーに「**http**」と入力します。 **HTTP** を選択して開きます。

   ![WF Fusion](./images/wffusion21.png)

1. 「**リクエストを行う**」を選択します。

   ![WF Fusion](./images/wffusion20.png)

   | キー | 値 |
   |:-------------:| :---------------:| 
   | `URL` | `https://ims-na1.adobelogin.com/ims/token/v3` |
   | `Method` | `POST` |
   | `Body Type` | `x-www-form-urlencoded` |

1. **項目を追加** を選択します。

   ![WF Fusion](./images/wffusion22.png)

1. 次の各値の項目を追加します。

   | キー | 値 |
   |:-------------:| :---------------:| 
   | `client_id` | `CONST_client_id` 用の事前定義済みの変数 |
   | `client_secret` | `CONST_client_secret` 用の事前定義済みの変数 |
   | `scope` | `CONST_scope` 用の事前定義済みの変数 |
   | `grant_type` | `client_credentials` |

1. `client_id` の設定：

   ![WF Fusion](./images/wffusion23.png)

1. `client_secret` の設定。

   ![WF Fusion](./images/wffusion25.png)

1. `scope` の設定。

   ![WF Fusion](./images/wffusion26.png)

1. `grant_type` の設定。

   ![WF Fusion](./images/wffusion28.png)

1. 下にスクロールして、「応答を解析 **チェックボックスをオンに** ます。 **OK** を選択します。

   ![WF Fusion](./images/wffusion27.png)

1. 画面は次のようになります。 **1 回実行** を選択します。

   ![WF Fusion](./images/wffusion29.png)

   シナリオが実行されると、画面は次のようになります。

   ![WF Fusion](./images/wffusion30.png)

1. **複数の変数を設定** オブジェクトの **疑問符** アイコンを選択して、そのオブジェクトが実行されたときに何が起こったかを確認します。

   ![WF Fusion](./images/wffusion31.png)

1. **HTTP - リクエストを行う** オブジェクトの **疑問符** アイコンを選択して、そのオブジェクトが実行されたときに何が起こったかを確認します。 **OUTPUT** で、Adobe I/Oから返される **access_token** を確認します。

   ![WF Fusion](./images/wffusion32.png)

1. **HTTP - リクエストを行う** にポインタを合わせ、「**+**」アイコンを選択して別のモジュールを追加します。

   ![WF Fusion](./images/wffusion33.png)

1. 検索バーで `tools` を検索します。 **ツール** を選択します。

   ![WF Fusion](./images/wffusion34.png)

1. 「**複数の変数を設定**」を選択します。

   ![WF Fusion](./images/wffusion35.png)

1. **項目を追加** を選択します。

   ![WF Fusion](./images/wffusion36.png)

1. **変数名** を `bearer_token` に設定します。 動的な **変数値** として「`access_token`」を選択します。 「**追加**」を選択します。

   ![WF Fusion](./images/wffusion37.png)

1. 画面は次のようになります。 **OK** を選択します。

   ![WF Fusion](./images/wffusion38.png)

1. **もう一度実行** を選択します。

   ![WF Fusion](./images/wffusion39.png)

1. シナリオを実行したら、最後の **複数の変数を設定** オブジェクトの **疑問符** アイコンを選択します。 access_token が変数 `bearer_token` に格納されていることがわかります。

   ![WF Fusion](./images/wffusion40.png)

1. 次に、最初のオブジェクトを右クリックし **複数の値を設定**、「名前を変更 **を選択し** す。

   ![WF Fusion](./images/wffusion41.png)

1. 名前を **定数を初期化** に設定します。 **OK** を選択します。

   ![WF Fusion](./images/wffusion42.png)

1. 2 番目のオブジェクトの名前を **Adobe I/Oに認証** に変更します。 **OK** を選択します。

   ![WF Fusion](./images/wffusion43.png)

1. 3 番目のオブジェクトの名前を **ベアラートークンを設定** に変更します。 **OK** を選択します。

   ![WF Fusion](./images/wffusion44.png)

   画面は次のようになります。

   ![WF Fusion](./images/wffusion45.png)

1. 次に、シナリオの名前を `--aepUSerLdap-- - Adobe I/O Authentication` に変更します。

   ![WF Fusion](./images/wffusion46.png)

1. 「**保存**」を選択します。

   ![WF Fusion](./images/wffusion47.png)

## 次の手順

[Workfront Fusion 内でのAdobeAPI の使用 ](./ex2.md){target="_blank"} を参照してください。

[Adobe Fireflyサービスの自動化 ](./automation.md){target="_blank"} に戻る

[ すべてのモジュール ](./../../../overview.md){target="_blank"} に戻る
