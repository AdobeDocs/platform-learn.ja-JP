---
title: ファーストパーティデバイス ID の生成
description: ファーストパーティデバイス ID の生成方法について説明します
feature: Web SDK
level: Experienced
jira: KT-9728
thumbnail: KT-9728.jpeg
exl-id: 2e3c1f71-e224-4631-b680-a05ecd4c01e7
source-git-commit: fd60f7ad338c81f5b32e7951d5a00b49c5aa1756
workflow-type: tm+mt
source-wordcount: '704'
ht-degree: 0%

---

# ファーストパーティデバイス ID の生成

Adobe Experience Cloud アプリケーションは、従来、次のような様々なテクノロジーを使用してデバイス id を保存する cookie を生成してきました。

1. サードパーティ Cookie
1. ドメイン名の CNAME 設定を使用してAdobeサーバーによって設定されたファーストパーティ cookie
1. JavaScriptによって設定されたファーストパーティ cookie

最近のブラウザーの変更により、これらのタイプの cookie の有効期間が制限されます。 ファーストパーティ cookie は、DNS CNAME ではなく、DNS A/AAAA レコードを使用して顧客が所有するサーバーを使用して設定されている場合に最も効果的です。 [&#x200B; ファーストパーティデバイス ID （FPID）機能 &#x200B;](https://experienceleague.adobe.com/ja/docs/experience-platform/web-sdk/identity/first-party-device-ids) により、Adobe Experience Platform Web SDK を実装しているお客様は、DNS A/AAAA レコードを使用して、サーバーからの Cookie でデバイス ID を使用できます。 その後、これらの ID をAdobeに送信し、シードとして使用してExperience CloudID （ECID）を生成できます。ECID は、Adobe Experience Cloud アプリケーションの主な識別情報です。

次に、機能の仕組みの簡単な例を示します。

![&#x200B; ファーストパーティデバイス ID （FPID）とExperience CloudID （ECID） &#x200B;](../assets/kt-9728.png)

1. エンドユーザーのブラウザーが、顧客の web サーバーまたは CDN から web ページをリクエストします。
1. 顧客が web サーバーまたは CDN でデバイス ID （FPID）を生成します（web サーバーはドメイン名の DNS A/AAAA レコードに結び付ける必要があります）。
1. お客様は、ファーストパーティ cookie を設定して、エンドユーザーのブラウザーに FPID を保存します。
1. お客様のAdobe Experience Platform Web SDK 実装が、Platform Edge Networkに対してリクエストを行い、次のいずれかを行います。
   1. FPID を ID マップに含めます。
   1. Web SDK リクエストの CNAME を設定し、FPID cookie の名前を使用してデータストリームを設定します。
1. Experience PlatformEdge Networkは FPID を受け取り、それを使用してExperience CloudID （ECID）を生成します。
1. Platform Web SDK 応答は、ECID をエンドユーザーのブラウザーに送り返します。
1. `idMigrationEnabled=true` の場合、Platform Web SDK は、JavaScriptを使用して、ECID を `AMCV_` Cookie としてエンドユーザーのブラウザーに保存します。
1. `AMCV_` cookie の有効期限が切れた場合、プロセスは繰り返されます。 同じファーストパーティデバイス ID が使用可能であれば、以前と同じ ECID 値を使用して新しい `AMCV_` Cookie が作成されます。

>[!NOTE]
>
>FPID を使用するために、`idMigrationEnabled` を `true` に設定する必要はありません。 ただし、`idMigrationEnabled=false` では `AMCV_` Cookie が表示されない場合があり、ネットワーク応答で ECID 値を探す必要があります。


このチュートリアルでは、PHP スクリプティング言語を使用した特定の例を使用して、次の方法を示します。

* UUIDv4 の生成
* Cookie への UUIDv4 値の書き込み
* ID マップに cookie の値を含める
* ECID 生成の検証

ファーストパーティデバイス ID に関連するドキュメントについては、製品ドキュメントを参照してください。

## UUIDv4 の生成

PHP には UUID 生成用のネイティブライブラリがないので、これらのコード例は、他のプログラミング言語を使用した場合に必要となる可能性の高いものよりも広範囲です。 この例では、広くサポートされているサーバー側言語である PHP が選択されました。


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

次のコードは、上記の関数に対してリクエストを実行し、UUID を生成します。 その後、組織によって決定された cookie フラグを設定します。 cookie が既に生成されている場合、有効期限が延長されます。

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
>ファーストパーティデバイス ID を含む cookie には、任意の名前を付けることができます。

## Id マップに Cookie 値を含める

最後のステップは、PHP を使用して Cookie 値を ID マップにエコーすることです。


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
>ID マップで使用される ID 名前空間シンボルは、`FPID` と呼ぶ必要があります。
>
> `FPID` は、予約済みの id 名前空間で、id 名前空間のインターフェイスリストには表示されません。


## ECID 生成の検証

同じ ECID がファーストパーティデバイス ID から生成されることを確認し、実装を検証します。

1. FPID cookie を生成します。
1. Platform Web SDK を使用して、Platform Edge Networkにリクエストを送信します。
1. `AMCV_<IMSORGID@AdobeOrg>` という形式の cookie が生成されます。 この cookie には ECID が含まれています。
1. 生成された Cookie の値をメモし、`FPID` Cookie を除く、サイトのすべての Cookie を削除します。
1. 別のリクエストを Platform Edge Networkに送信します。
1. `AMCV_<IMSORGID@AdobeOrg>` cookie の値が、削除された `AMCV_` cookie の `ECID` 値と同じであることを確認します。 特定の FPID の cookie 値が同じ場合、ECID のシーディングプロセスは成功しました。

この機能について詳しくは、[&#x200B; ドキュメント &#x200B;](https://experienceleague.adobe.com/docs/experience-platform/edge/identity/first-party-device-ids.html?lang=ja) を参照してください。
