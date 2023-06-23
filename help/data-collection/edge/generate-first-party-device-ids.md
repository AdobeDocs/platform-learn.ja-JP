---
title: ファーストパーティデバイス ID を生成
description: ファーストパーティデバイス ID の生成方法について説明します
feature: Web SDK
jira: KT-9728
thumbnail: KT-9728.jpeg
exl-id: 2e3c1f71-e224-4631-b680-a05ecd4c01e7
source-git-commit: 90f7621536573f60ac6585404b1ac0e49cb08496
workflow-type: tm+mt
source-wordcount: '687'
ht-degree: 3%

---

# ファーストパーティデバイス ID を生成

Adobe Experience Cloudアプリケーションは、次のような様々なテクノロジーを使用して、デバイス id を保存するために cookie を従来生成していました。

1. サードパーティ Cookie
1. ドメイン名の CNAME 設定を使用してAdobeサーバーによって設定されるファーストパーティ Cookie
1. JavaScript によって設定されるファーストパーティ cookie

最近のブラウザーの変更によって、これらのタイプの cookie の期間が制限されます。 ファーストパーティ cookie は、DNS CNAME とは異なり、DNS A/AAA レコードを使用する顧客所有のサーバーを使用して設定される場合に最も効果的です。 ファーストパーティデバイス ID(FPID) 機能を使用すると、Adobe Experience Platform Web SDK を実装して、DNS A/AAA レコードを使用するサーバーから Cookie にデバイス ID を使用できます。 その後、これらの ID をAdobeに送信し、Experience CloudID(ECID) を生成するシードとして使用できます。ECID は、Adobe Experience Cloudアプリケーションの主な識別子のままです。

機能の仕組みの簡単な例を次に示します。

![ファーストパーティデバイス ID(FPID) とExperience CloudID(ECID)](../assets/kt-9728.png)

1. エンドユーザーのブラウザーが、顧客の Web サーバーまたは CDN から Web ページをリクエストします。
1. お客様が Web サーバーまたは CDN でデバイス ID(FPID) を生成します（Web サーバーは、ドメイン名の DNS A/AAAA レコードに関連付ける必要があります）。
1. お客様は、エンドユーザーのブラウザーに FPID を保存するファーストパーティ Cookie を設定します。
1. お客様のAdobe Experience Platform Web SDK 実装は、ID マップに FPID を含む、Platform Edge ネットワークにリクエストを送信します。
1. Experience PlatformEdge Network は FPID を受け取り、それを使用してExperience CloudID(ECID) を生成します。
1. Platform Web SDK の応答は、ECID をエンドユーザーのブラウザーに返します。
1. この `idMigrationEnabled=true`に設定する場合、Platform Web SDK は JavaScript を使用して ECID を `AMCV_` エンドユーザーのブラウザーの cookie。
1. イベントでは、 `AMCV_` cookie の有効期限が切れると、プロセスが繰り返されます。 同じファーストパーティデバイス ID が使用できる限り、新しい `AMCV_` cookie は、以前と同じ ECID 値で作成されます。

>[!NOTE]
>
>この `idMigrationEnabled` をに設定する必要はありません。 `true` を使用します。 を使用 `idMigrationEnabled=false` 表示されない `AMCV_` cookie を使用する必要がありますが、は、ネットワーク応答で ECID 値を探す必要があります。


このチュートリアルでは、PHP スクリプト言語を使用した具体的な例を使用して、次の方法を示します。

* UUIDv4 の生成
* Cookie への UUIDv4 値の書き込み
* ID マップに cookie の値を含めます
* ECID 生成の検証

ファーストパーティデバイス ID に関するその他のドキュメントは、製品ドキュメントを参照してください。

## UUIDv4 の生成

PHP には UUID 生成用のネイティブライブラリがないので、これらのコード例は、別のプログラミング言語を使用した場合に必要となるよりも広範囲に及びます。 PHP は、広くサポートされているサーバ側の言語なので、この例で使用されました。


次の関数が呼び出されると、ランダムな UUID version-4 が生成されます。

```
<?php
    
    function guidv4($data)
    {
        $data = $data ?? random_bytes(16);

        $data[6] = chr(ord($data[6]) & 0x0f | 0x40); // set version to 0100
        $data[8] = chr(ord($data[8]) & 0x3f | 0x80); // set bits 6-7 to 10

        return vsprintf('%s%s-%s-%s-%s-%s%s%s', str_split(bin2hex($data), 4));
    }

?>
```

## Cookie への UUIDv4 値の書き込み

次のコードは、UUID を生成するために、上記の関数にリクエストを送信します。 その後、組織で決定された Cookie フラグを設定します。 Cookie が既に生成されている場合は、有効期限が延長されます。

```
<?php

    if(!isset($_COOKIE['FPID'])) {
        $cookie_value = guidv4(openssl_random_pseudo_bytes(16));        
        $arr_cookie_options = array (
        'expires' => time() + 60*60*24*30*13,
        'path' => '/',
        'domain' => 'mysiteurl.com',
        'secure' => true,
        'httponly' => true,
        'samesite' => 'lax'
        );
        setcookie($cookie_name, $cookie_value, $arr_cookie_options);
        $_COOKIE[$cookie_name] = $cookie_value;
    }
    else {
        $cookie_value = $_COOKIE[$cookie_name];
        $arr_cookie_options = array (
        'expires' => time() + 60*60*24*30*13,
        'path' => '/',
        'domain' => 'mysiteurl.com',
        'secure' => true,
        'httponly' => true,
        'samesite' => 'lax'
        );
        setcookie($cookie_name, $cookie_value, $arr_cookie_options);
    }

?>
```

>[!NOTE]
>
>ファーストパーティデバイス ID を含む Cookie には、任意の名前を指定できます。

## ID マップに Cookie の値を含める

最後の手順は、PHP を使用して cookie の値を ID マップにエコーすることです。


```
{
    "identityMap": {
        "FPID": [
                    {
                        "id": "<? echo $_COOKIE[$cookie_name] ?>",
                        "authenticatedState": "ambiguous",
                        "primary": true
                    }
                ]
        }
}
```

>[!IMPORTANT]
>
>ID マップで使用される ID 名前空間シンボルは、と呼び出す必要があります。 `FPID`.
>
> `FPID` は、id 名前空間のインターフェイスリストに表示されない、予約済み id 名前空間です。


## ECID の生成を検証

実装を検証するには、ファーストパーティのデバイス ID から同じ ECID が生成されていることを確認します。

1. FPID Cookie を生成します。
1. Platform Web SDK を使用して、Platform Edge Network にリクエストを送信します。
1. 形式を持つ Cookie `AMCV_<IMSORGID@AdobeOrg>` が生成されます。 この cookie には ECID が含まれます。
1. 生成された cookie の値をメモしておき、サイトの `FPID` cookie.
1. 別のリクエストを Platform Edge Network に送信します。
1. 値を `AMCV_<IMSORGID@AdobeOrg>` cookie が同じ `ECID` の値 `AMCV_` cookie が削除されました。 指定された FPID の cookie の値が同じ場合、ECID のシード処理が成功していました。

この機能について詳しくは、 [ドキュメント](https://experienceleague.adobe.com/docs/experience-platform/edge/identity/first-party-device-ids.html?lang=ja).
