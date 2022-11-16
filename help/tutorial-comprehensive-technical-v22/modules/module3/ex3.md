---
title: Foundation — リアルタイム顧客プロファイル — 独自のリアルタイム顧客プロファイルを視覚化 — API
description: Foundation — リアルタイム顧客プロファイル — 独自のリアルタイム顧客プロファイルを視覚化 — API
kt: 5342
audience: Data Engineer, Data Architect, Marketer
doc-type: tutorial
activity: develop
exl-id: eecc2ff7-c5f9-45c9-b06b-3aa523543a54
source-git-commit: cc7a77c4dd380ae1bc23dc75608e8e2224dfe78c
workflow-type: tm+mt
source-wordcount: '2628'
ht-degree: 2%

---

# 3.3 自身のリアルタイム顧客プロファイルの視覚化 — API

この演習では、PostmanとAdobe I/Oを使用して、Adobe Experience Platformの API に対してクエリを実行し、独自のリアルタイム顧客プロファイルを表示します。

## Story

リアルタイム顧客プロファイルでは、すべてのプロファイルデータが、既存のセグメントメンバーシップと共にイベントデータと共に表示されます。 表示されるデータは、Adobe・アプリケーションや外部ソリューションなど、どこからでも取得できます。 これは、過去最高のエクスペリエンスシステムであるAdobe Experience Platformで最も強力なビューです。

リアルタイム顧客プロファイルは、すべてのAdobeアプリケーションで利用できますが、コールセンターや店舗内顧客アプリなどの外部ソリューションでも利用できます。 これをおこなう方法は、これらの外部ソリューションをAdobe Experience Platform API に接続することです。

## 3.3.1 識別子

Web サイトのプロファイルビューアパネルでは、複数の ID を検索できます。 すべての ID は名前空間にリンクされます。

![顧客プロファイル](./images/identities.png)

X 線パネルには、ID と名前空間の 4 つの異なる組み合わせが表示されます。

| ID | 名前空間 |
|:-------------:| :---------------:|
| Experience Cloud ID (ECID) | 12507560687324495704459439363261812234 |
| 電子メール ID | woutervangeluwe+06022022-01@gmail.com |
| モバイル番号 ID | +32473622044+06022022-01 |

次の手順では、これらの識別子を記憶しておきます。

これらの ID を考慮して、Postmanに移動します。

## 3.3.2Adobe I/Oプロジェクトの設定

この演習では、Adobe I/Oを完全に集中的に使用して、Platform の API に対するクエリをおこないます。 次の手順に従って、Adobe I/Oを設定してください。

に移動します。 [https://developer.adobe.com/console/home](https://developer.adobe.com/console/home)

![Adobe I/Oの新規統合](../module3/images/iohome.png)

画面の右上隅で正しいAdobe Experience Platformインスタンスを選択していることを確認します。 インスタンスは `--envName--`.

![Adobe I/Oの新規統合](../module3/images/iocomp.png)

「**新規プロジェクトを作成**」をクリックします。

![Adobe I/Oの新規統合](../module3/images/adobe_io_new_integration.png) または
![Adobe I/Oの新規統合](../module3/images/adobe_io_new_integration1.png)

選択 **+プロジェクトに追加** を選択し、 **API**.

![Adobe I/Oの新規統合](../module3/images/adobe_io_access_api.png)

次の内容が表示されます。

![Adobe I/Oの新規統合](../module3/images/api1.png)

次をクリック： **Adobe Experience Platform** アイコン

![Adobe I/Oの新規統合](../module3/images/api2.png)

クリック **Experience PlatformAPI**.

![Adobe I/Oの新規統合](../module3/images/api3.png)

「**次へ**」をクリックします。

![Adobe I/Oの新規統合](../module3/images/next.png)

セキュリティキーペアを生成するAdobe I/Oか、既存のペアをアップロードするかを選択できるようになりました。

選択 **オプション 1 — キーペアを生成する**.

![Adobe I/Oの新規統合](../module3/images/api4.png)

クリック **キーペアを生成**.

![Adobe I/Oの新規統合](../module3/images/generate.png)

スピナーが約 30 秒間表示されます。

![Adobe I/Oの新規統合](../module3/images/spin.png)

これが表示され、生成された鍵のペアが zip ファイルとしてダウンロードされます。 **config.zip**.

ファイルを解凍します。 **config.zip** デスクトップには、2 つのファイルが含まれています。

![Adobe I/Oの新規統合](../module3/images/zip.png)

- **certificate_pub.crt** は公開鍵証明書です。 セキュリティの観点から言えば、これは、オンラインアプリケーションとの統合をセットアップするために自由に使用される証明書です。
- **private.key** は秘密鍵です。 これは誰とも共有してはいけません 秘密鍵は、API 実装に対する認証に使用するもので、秘密鍵と見なされます。 秘密鍵を他のユーザーと共有すると、ユーザーは実装にアクセスし、API を悪用して悪意のあるデータを Platform に取り込み、Platform に設定されたすべてのデータを抽出することができます。

![Adobe I/Oの新規統合](../module3/images/config.png)

必ず **config.zip** ファイルを安全な場所に保存してください。次の手順で使用し、今後Adobe I/OおよびAdobe Experience Platform API にアクセスする際に必要になります。

「**次へ**」をクリックします。

![Adobe I/Oの新規統合](../module3/images/next.png)

次に、 **製品プロファイル** を設定します。

必要な製品プロファイルを選択します。

**FYI**:Adobe Experience Platformインスタンスでは、製品プロファイルの名前が異なります。 適切なアクセス権を持つ製品プロファイルを 1 つ以上選択する必要があります。このプロファイルはAdobe Admin Consoleで設定されています。

![Adobe I/Oの新規統合](../module3/images/api9.png)

クリック **設定済み API を保存**.

![Adobe I/Oの新規統合](../module3/images/saveconfig.png)

スピナーが数秒間表示されます。

![Adobe I/Oの新規統合](../module3/images/api10.png)

次に、統合が表示されます。

![Adobe I/Oの新規統合](../module3/images/api11.png)

次をクリック： **Postman用のダウンロード** ボタンを押し、 **サービスアカウント (JWT)** Postman環境をダウンロードするには（環境がダウンロードされるまで待ちます。これには数秒かかる場合があります）。

![Adobe I/Oの新規統合](../module3/images/iopm.png)

下にスクロールして、 **サービスアカウント (JWT)**( Adobe Experience Platformとの統合の設定に使用されるすべての統合の詳細を検索できる場所 )

![Adobe I/Oの新規統合](../module3/images/api12.png)

IO プロジェクトには現在、汎用名が付けられています。 統合にわかりやすい名前を付ける必要があります。 クリック **プロジェクト 1** （または類似の名前）を示すように

![Adobe I/Oの新規統合](../module3/images/api13.png)

クリック **プロジェクトを編集**.

![Adobe I/Oの新規統合](../module3/images/api14.png)

統合の「名前」と「説明」を入力します。 命名規則として、 `AEP API --demoProfileLdap--`. ldap を ldap に置き換えます。
例えば、ldap が vangeluw の場合、統合の名前と説明は AEP API vangeluw になります。

入力 `AEP API --demoProfileLdap--` を **プロジェクトタイトル**. 「**保存**」をクリックします。

![Adobe I/Oの新規統合](../module3/images/api15.png)

これで、Adobe I/Oの統合が完了しました。

![Adobe I/Oの新規統合](../module3/images/api16.png)

## 3.3.3Adobe I/Oに対するPostman認証

に移動します。 [https://www.getpostman.com/](https://www.getpostman.com/).

クリック **はじめに**.

![Adobe I/Oの新規統合](../module3/images/getstarted.png)

次に、 Postmanをダウンロードしてインストールします。

![Adobe I/Oの新規統合](../module3/images/downloadpostman.png)

Postmanのインストール後、アプリケーションを起動します。

Postmanには、次の 2 つの概念があります。環境とコレクション。

- 環境には、多かれ少なかれ一貫性のあるすべての環境変数が含まれます。 環境では、アドビの Platform 環境の IMSOrg や、秘密鍵などのセキュリティ資格情報が表示されます。 環境ファイルは、前の練習でのAdobe I/O設定時にダウンロードしたファイルで、次のような名前になります。 **service.postman_environment.json**.

- コレクションには、使用できる多数の API リクエストが含まれています。 2 つのコレクションを使用します
   - 1AdobeI/0 に対する認証用のコレクション
   - 1 このモジュールの演習用コレクション
   - Real-Time CDPモジュールの演習用の 1 つのコレクション（宛先のオーサリング用）

ファイルをダウンロードしてください [postman.zip](../../assets/postman/postman_profile.zip) をローカルデスクトップに追加します。

この **postman.zip** ファイルには、次のファイルが含まれます。

- `_Adobe I-O - Token.postman_collection.json`
- `_Adobe Experience Platform Enablement.postman_collection.json`
- `Destination_Authoring_API.json`

を解凍します。 **postman.zip** これら 3 つのファイルをファイルに保存し、デスクトップ上のフォルダーに、Adobe I/OからダウンロードしたPostman環境と共に保存します。次の 4 つのファイルをそのフォルダーに格納する必要があります。

![Adobe I/Oの新規統合](../module3/images/pmfolder.png)

Postmanに戻ります。 「**Import**」をクリックします。

![Adobe I/Oの新規統合](../module3/images/postmanui.png)

クリック **ファイルをアップロード**.

![Adobe I/Oの新規統合](../module3/images/choosefiles.png)

デスクトップ上の、ダウンロードした 4 つのファイルを抽出したフォルダーに移動します。 これら 4 つのファイルを同時に選択し、 **開く**.

![Adobe I/Oの新規統合](../module3/images/selectfiles.png)

クリック後 **開く**&#x200B;をクリックすると、Postmanに、読み込もうとしている環境とコレクションの概要が表示されます。 「**Import**」をクリックします。

![Adobe I/Oの新規統合](../module3/images/impconfirm.png)

これで、API を使用してAdobe Experience Platformとの対話を開始するためにPostmanで必要なすべてが揃いました。

まず、適切に認証されていることを確認します。 認証するには、アクセストークンをリクエストする必要があります。

リクエストを実行する前に、適切な環境が選択されていることを確認してください。 右上隅にある Environment-dropdown リストを確認することで、現在選択されている環境を確認できます。

選択した環境には、次のような名前を付ける必要があります。

![Postman](../module3/images/envselemea.png)

次をクリック： **目** アイコンをクリックし、 **編集** をクリックして、環境ファイルの秘密鍵を更新します。

![Postman](../module3/images/gear.png)

これが見えます フィールドを除くすべてのフィールドは、事前入力されます **PRIVATE_KEY**.

![Postman](../module3/images/pk2.png)

秘密鍵は、Adobe I/Oプロジェクトの作成時に生成されています。 このファイルは、という名前の zip ファイルとしてダウンロードされました。 **config.zip**. その zip ファイルをデスクトップに展開します。

![Postman](../module3/images/pk3.png)

フォルダーを開く **config** をクリックし、ファイルを開きます。 **private.key** を選択します。

![Postman](../module3/images/pk4.png)

次に、これに似たものが表示されます。すべてのテキストをクリップボードにコピーします。

![Postman](../module3/images/pk5.png)

Postmanに戻り、変数の横のフィールドに秘密鍵を貼り付けます **PRIVATE_KEY**（両方の列） **初期値** および **現在の値**. 「**保存**」をクリックします。

![Postman](../module3/images/pk6.png)

これで、Postman環境とコレクションが設定され、機能します。 PostmanからAdobe I/Oへの認証が可能になりました。

これをおこなうには、通信の暗号化と復号化を処理する外部ライブラリを読み込む必要があります。 このライブラリを読み込むには、という名前でリクエストを実行する必要があります。 **初期化：RS256 用の暗号ライブラリの読み込み**. このリクエストを **_Adobe I/O — トークンコレクション** 画面の中央に表示されます。

![Postman](../module3/images/iocoll.png)

![Postman](../module3/images/cryptolib.png)

青をクリック **送信** 」ボタンをクリックします。 数秒後、応答が **本文** Postmanのセクション：

![Postman](../module3/images/cryptoresponse.png)

現在は暗号ライブラリが読み込まれているので、Adobe I/Oを認証できます。

内 **\_Adobe I/O — トークンコレクション**、名前を持つリクエストを選択します **IMS:JWT 生成+認証**. この場合も、画面の中央にリクエストの詳細が表示されます。

![Postman](../module3/images/ioauth.png)

青をクリック **送信** 」ボタンをクリックします。 数秒後、応答が **本文** Postmanのセクション：

![Postman](../module3/images/ioauthresp.png)

設定が成功した場合は、次の情報を含む同様の応答が表示されます。

| キー | 値 |
|:-------------:| :---------------:| 
| token_type | **無記名者** |
| access_token | **eyJ4NXUiJpbXNfbmEx...QT7mqZkumN1tdsPEioOEl4087Dg** |
| expires_in | **86399973** |

Adobe I/Oから **無記名者**-token。特定の値（この非常に長い access_token）と有効期限ウィンドウを含みます。

受け取ったトークンは、24 時間有効になりました。 つまり、24 時間後にPostmanを使用してAdobe I/Oを認証する場合、このリクエストを再度実行して新しいトークンを生成する必要があります。

## 3.3.4 リアルタイム顧客プロファイル API、スキーマ：プロファイル

次に、最初のリクエストを Platform のリアルタイム顧客プロファイル API に送信します。

Postmanで、コレクションを探します。 **Adobe Experience Platform有効化 (_E)**.

![Postman](./images/coll_enablement.png)

In **1. 統合プロファイルサービス**、名前の最初のリクエストを選択します **UPS -GETID および NS 別エンティティプロファイル**.

![Postman](./images/upscall.png)

このリクエストには、次の 3 つの必須変数があります。

| キー | 値 | 定義 |
|:-------------:| :---------------:| :---------------:| 
| entityId | **id** | 特定の顧客 ID |
| entityIdNS | **名前空間** | ID に適用できる特定の名前空間 |
| schema.name | **_xdm.context.profile** | 情報を受け取る特定のスキーマ |

そのため、Adobe Experience Platformの API に対して、独自の ECID のすべてのプロファイル情報を返すように求める場合は、次のように要求を設定する必要があります。

| キー | 値 |
|:-------------:| :---------------:| 
| entityId | **yourECID** |
| entityIdNS | **ecid** |
| schema.name | **_xdm.context.profile** |

![Postman](./images/callecid.png)

また、 **ヘッダー**  — リクエストのフィールド。 に移動します。 **ヘッダー**. 次の内容が表示されます。

![Postman](./images/callecidheaders.png)

| キー | 値 |
| ----------- | ----------- |
| x-sandbox-name | `--aepSandboxId--` |

>[!NOTE]
>
>使用しているAdobe Experience Platformサンドボックスの名前を指定する必要があります。 x-sandbox-name は次のようになっている必要があります。 `--aepSandboxId--`.

クリック **送信** をクリックして、リクエストを Platform に送信します。

Platform から即座に応答が返され、次のような内容が表示されます。

![Postman](./images/callecidresponse.png)

Platform からの完全な応答は次のとおりです。

```javascript
{
    "A28iM3aJBJRbEQpOnUh5HOM9": {
        "entityId": "A28iM3aJBJRbEQpOnUh5HOM9",
        "mergePolicy": {
            "id": "e632ccb8-882a-4b5e-8375-96a1ba3df1aa"
        },
        "sources": [
            "61fe23c5be4b5f19485dc379",
            "profile-streaming-segment",
            "61fe23cfa07c1219489b3ba4"
        ],
        "tags": [
            "1644130566774:1542:232:va7",
            "0a1e9dd4-940a-46ec-9114-7e371cf5c4d0",
            "aep_ups_partitioned_profile_cdc_low_lag_sla_0:106:1090888313",
            "a6fed09e-2c56-403e-8692-4e99e4779dfa:IRL1",
            "1644419616318:2989:31:va7",
            "aep_ups_profile_change_event_prod_va7:71:7946633524-8361f22c-c09e-4364-b24b-b57435c4d14f"
        ],
        "identityGraph": [
            "BUF9zMKLrXq72p4HpbsHv1SSBnr0LTAxQGdtYWlsLmNvbQ",
            "GkicrkFjgmCjUg",
            "GtCbrkFjgkSOFg",
            "A2-AP9zOsakzNTe9Rqwf7Wse",
            "BkFuK4QcJpSPByuSBnr0LTAx",
            "A28jSB484ziuECF3fEoXmFlF",
            "A28iM3aJBJRbEQpOnUh5HOM9"
        ],
        "entity": {
            "_experienceplatform": {
                "individualCharacteristics": {},
                "loyaltyDetails": {
                    "level": "Basic",
                    "points": 0
                },
                "identification": {
                    "core": {
                        "phoneNumber": "+32473622044+06022022-01",
                        "email": "woutervangeluwe+06022022-01@gmail.com",
                        "loyaltyId": "5415776",
                        "ecid": "12019606991718502754997192487345616673",
                        "crmId": "1478212"
                    }
                }
            },
            "personalEmail": {
                "address": "woutervangeluwe+06022022-01@gmail.com"
            },
            "_repo": {
                "createDate": "2022-02-06T06:56:06.424Z"
            },
            "testProfile": true,
            "homeAddress": {
                "postalCode": "1831",
                "city": "Diegem",
                "street1": "Culliganlaan 2F"
            },
            "mobilePhone": {
                "number": "+32473622044+06022022-01"
            },
            "segmentMembership": {
                "ups": {
                    "bc999ded-b6d7-40d4-87a7-d3a280b950e3": {
                        "lastQualificationTime": "2022-02-09T20:38:33Z",
                        "status": "exited"
                    },
                    "23b1cd4e-d62f-44bd-8392-3095a33109c4": {
                        "lastQualificationTime": "2022-02-09T20:38:33Z",
                        "status": "exited"
                    },
                    "f0807704-a1c8-4ac4-85dd-60db2fbf18f1": {
                        "lastQualificationTime": "2022-02-09T20:38:33Z",
                        "status": "existing"
                    }
                }
            },
            "person": {
                "name": {
                    "lastName": "Van Geluwe",
                    "firstName": "Wouter"
                },
                "gender": "female",
                "birthDate": "1982-07-08"
            },
            "userActivityRegions": {
                "IRL1": {
                    "captureTimestamp": "2022-02-09T15:21:11Z"
                }
            },
            "identityMap": {
                "email": [
                    {
                        "id": "woutervangeluwe+06022022-01@gmail.com"
                    }
                ],
                "crmid": [
                    {
                        "id": "1478212"
                    }
                ],
                "ecid": [
                    {
                        "id": "12507560687324495704459439363261812234"
                    },
                    {
                        "id": "12019606991718502754997192487345616673"
                    },
                    {
                        "id": "38335942889672702722192106363935964471"
                    }
                ],
                "phone": [
                    {
                        "id": "+32473622044+06022022-01"
                    }
                ],
                "loyaltyid": [
                    {
                        "id": "5415776"
                    }
                ]
            }
        },
        "lastModifiedAt": "2022-02-09T20:38:36Z"
    }
}
```

現在、この ECID に対して Platform で使用できるすべてのプロファイルデータです。

ECID を使用して Platform のリアルタイム顧客プロファイルからプロファイルデータをリクエストする必要はありません。任意の名前空間内の任意の ID を使用して、このデータをリクエストできます。

Postmanに戻り、コールセンターであるとして、の名前空間を指定して Platform にリクエストを送信します。 **電話** およびお使いの携帯電話番号。

したがって、特定の電話に関するすべてのプロファイル情報を Platform の API に返すように求める場合は、次のように要求を設定する必要があります。

| キー | 値 |
|:-------------:| :---------------:| 
| entityId | **あなたの電話番号** |
| entityIdNS | **phone** （ecid を電話で置き換える） |
| schema.name | **_xdm.context.profile** |

電話番号に次のような特殊記号が含まれている場合 **+**&#x200B;をクリックし、右クリックして「 **EncodeURIComponent**.

![Postman](./images/encodephone.png)

その後、次の情報が表示されます。

![Postman](./images/callmobilenr.png)

また、 **ヘッダー**  — リクエストのフィールド。 に移動します。 **ヘッダー**. 次の内容が表示されます。

![Postman](./images/callecidheaders.png)

| キー | 値 |
| ----------- | ----------- |
| x-sandbox-name | `--aepSandboxId--` |

>[!NOTE]
>
>使用しているAdobe Experience Platformサンドボックスの名前を指定する必要があります。 x-sandbox-name は次のようになっている必要があります。 `--aepSandboxId--`.

青をクリック **送信** ボタンをクリックし、応答を確認します。

![Postman](./images/callmobilenrresponse.png)

E メールアドレスに対しても、の名前空間を指定して同じ処理を行います。 **電子メール** お使いのメールアドレス。

したがって、特定の電子メールアドレスに関するすべてのプロファイル情報を Platform の API に返すように求める場合は、次のようにリクエストを設定する必要があります。

| キー | 値 |
|:-------------:| :---------------:| 
| entityId | **youremail** |
| entityIdNS | **電子メール** （電話を電子メールに置き換える） |
| schema.name | **_xdm.context.profile** |

電子メールアドレスに次のような特殊記号が含まれる場合 **+**&#x200B;をクリックし、右クリックして **EncodeURIComponent**.

![Postman](./images/encodeemail.png)

その後、次の情報が表示されます。

![Postman](./images/callemail.png)

また、 **ヘッダー**  — リクエストのフィールド。 に移動します。 **ヘッダー**. 次の内容が表示されます。

![Postman](./images/callecidheaders.png)

| キー | 値 |
| ----------- | ----------- |
| x-sandbox-name | `--aepSandboxId--` |

>[!NOTE]
>
>使用しているAdobe Experience Platformサンドボックスの名前を指定する必要があります。 x-sandbox-name は次のようになっている必要があります。 `--aepSandboxId--`.

青をクリック **送信** ボタンをクリックし、応答を確認します。

![Postman](./images/callemailresponse.png)

これは、ブランドに提供される非常に重要な柔軟性です。 つまり、複数の名前空間や ID の複雑さを理解する必要なく、あらゆる環境が、独自の ID と名前空間を使用して Platform にリクエストを送信できます。

次に例を示します。

- コールセンターは、名前空間を使用して Platform からデータをリクエストします **phone**
- ロイヤリティシステムは、名前空間を使用して Platform からデータをリクエストします **電子メール**
- オンラインアプリケーションは名前空間を使用する場合があります **ecid**

コールセンターは、ロイヤルティシステムで使用される識別子の種類を必ずしも把握しているわけではなく、ロイヤリティシステムは、オンラインアプリケーションで使用される識別子の種類を必ずしも把握していません。 個々のシステムは、必要な情報を必要に応じて取得するために、持ち、理解した情報を使用できます。

## 3.3.5 リアルタイム顧客プロファイル API、スキーマ：プロファイルと ExperienceEvent

Platform API に対してプロファイルデータを問い合わせた後、ExperienceEvent データに対しても同じ操作をおこなうようにします。

Postmanで、コレクションを探します。 **Adobe Experience Platform有効化 (_E)**.

![Postman](./images/coll_enablement.png)

In **1. 統合プロファイルサービス**、名前を持つ 2 つ目のリクエストを選択します。 **UPS -GETプロファイルと EE （エンティティ ID および NS 別）**.

![Postman](./images/upseecall.png)

このリクエストには、次の 4 つの必須変数があります。

| キー | 値 | 定義 |
|:-------------:| :---------------:|  :---------------:| 
| schema.name | **_xdm.context.experienceevent** | 情報を受け取る特定のスキーマ。 この場合、ExperienceEvent スキーマに対してマッピングされたデータを探します。 |
| relatedSchema.name | **_xdm.context.profile** | ExperienceEvent スキーマに対してマッピングされたデータを探す際に、そのデータを受け取る ID を指定する必要があります。 ID にアクセスできるスキーマはプロファイルスキーマなので、ここでの relatedSchema はプロファイルスキーマです。 |
| relatedEntityId | **id** | 特定の顧客 ID |
| relatedEntityIdNS | **名前空間** | ID に適用できる特定の名前空間 |

したがって、Platform の API に対して、独自の ecid のすべてのプロファイル情報を返すように求める場合は、次のようにリクエストを設定する必要があります。

| キー | 値 |
|:-------------:| :---------------:| 
| schema.name | **_xdm.context.experienceevent** |
| relatedSchema.name | **_xdm.context.profile** |
| relatedEntityId | **yourECID** |
| relatedEntityIdNS | **ecid** |

![Postman](./images/eecallecid.png)

また、 **ヘッダー**  — リクエストのフィールド。 に移動します。 **ヘッダー**. 次の内容が表示されます。

![Postman](./images/eecallecidheaders.png)

| キー | 値 |
| ----------- | ----------- |
| x-sandbox-name | `--aepSandboxId--` |

>[!NOTE]
>
>使用しているAdobe Experience Platformサンドボックスの名前を指定する必要があります。 x-sandbox-name は次のようになっている必要があります。 `--aepSandboxId--`.

クリック **送信** をクリックして、リクエストを Platform に送信します。

Platform から即座に応答が返され、次のような内容が表示されます。

![Postman](./images/eecallecidresponse.png)

以下は、Platform からの完全な応答です。 この例では、この顧客の ECID にリンクされている 8 つの ExperienceEvents があります。 以下に示すように、前の演習での Launch の設定の直接の結果なので、以下を見て、リクエスト上の様々な変数を確認します。

また、X 線パネルに ExperienceEvent 情報が表示される場合、以下のペイロードを使用して、製品名（下のペイロードでは productName を検索）や製品画像 URL（下のペイロードでは productImageUrl を検索）などの情報を解析および取得します。

```javascript
{
    "_page": {
        "orderby": "timestamp",
        "start": "d686ab8a-2d0c-4722-9ff5-bfc1020b0b55-0",
        "count": 31,
        "next": ""
    },
    "children": [
        {
            "relatedEntityId": "A28iM3aJBJRbEQpOnUh5HOM9",
            "entityId": "d686ab8a-2d0c-4722-9ff5-bfc1020b0b55-0",
            "timestamp": 1644127126596,
            "entity": {
                "environment": {
                    "ipV4": "213.118.129.117",
                    "type": "browser",
                    "browserDetails": {
                        "viewportHeight": 969,
                        "viewportWidth": 1920,
                        "userAgent": "Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/98.0.4758.80 Safari/537.36"
                    }
                },
                "web": {
                    "webPageDetails": {
                        "pageViews": {
                            "value": 1
                        },
                        "name": "vangeluw-OCUC",
                        "URL": "https://builder.adobedemo.com/run/vangeluw-OCUC"
                    },
                    "webReferrer": {
                        "URL": "https://adobe.okta.com/"
                    }
                },
                "_experienceplatform": {
                    "interactionDetails": {
                        "core": {
                            "channel": "web"
                        }
                    },
                    "demoEnvironment": {
                        "brandName": "vangeluw-OCUC"
                    },
                    "identification": {
                        "core": {
                            "ecid": "12507560687324495704459439363261812234"
                        }
                    }
                },
                "implementationDetails": {
                    "name": "https://ns.adobe.com/experience/alloy/reactor",
                    "version": "2.8.0+2.9.0",
                    "environment": "browser"
                },
                "identityMap": {
                    "ECID": [
                        {
                            "id": "12507560687324495704459439363261812234",
                            "authenticatedState": "ambiguous",
                            "primary": true
                        }
                    ]
                },
                "eventType": "web.webpagedetails.pageViews",
                "_id": "d686ab8a-2d0c-4722-9ff5-bfc1020b0b55-0",
                "placeContext": {
                    "localTime": "2022-02-06T06:58:46.596+01:00",
                    "localTimezoneOffset": -60
                },
                "device": {
                    "screenOrientation": "landscape",
                    "screenWidth": 1920,
                    "screenHeight": 1080
                },
                "timestamp": "2022-02-06T05:58:46.596Z"
            },
            "lastModifiedAt": "2022-02-06T05:59:48Z"
        },
        {
            "relatedEntityId": "A28iM3aJBJRbEQpOnUh5HOM9",
            "entityId": "919a46bf-a591-4c32-9201-b72250d5f5d9-0",
            "timestamp": 1644127129876,
            "entity": {
                "environment": {
                    "ipV4": "213.118.129.117",
                    "type": "browser",
                    "browserDetails": {
                        "viewportHeight": 969,
                        "viewportWidth": 1920,
                        "userAgent": "Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/98.0.4758.80 Safari/537.36"
                    }
                },
                "web": {
                    "webPageDetails": {
                        "pageViews": {
                            "value": 1
                        },
                        "name": "vangeluw-OCUC#",
                        "URL": "https://builder.adobedemo.com/run/vangeluw-OCUC#"
                    },
                    "webReferrer": {
                        "URL": "https://adobe.okta.com/"
                    }
                },
                "_experienceplatform": {
                    "interactionDetails": {
                        "core": {
                            "channel": "web"
                        }
                    },
                    "demoEnvironment": {
                        "brandName": "vangeluw-OCUC"
                    },
                    "identification": {
                        "core": {
                            "ecid": "12507560687324495704459439363261812234"
                        }
                    }
                },
                "implementationDetails": {
                    "name": "https://ns.adobe.com/experience/alloy/reactor",
                    "version": "2.8.0+2.9.0",
                    "environment": "browser"
                },
                "identityMap": {
                    "ECID": [
                        {
                            "id": "12507560687324495704459439363261812234",
                            "authenticatedState": "ambiguous",
                            "primary": true
                        }
                    ]
                },
                "eventType": "web.webpagedetails.pageViews",
                "_id": "919a46bf-a591-4c32-9201-b72250d5f5d9-0",
                "placeContext": {
                    "localTime": "2022-02-06T06:58:49.876+01:00",
                    "localTimezoneOffset": -60
                },
                "device": {
                    "screenOrientation": "landscape",
                    "screenWidth": 1920,
                    "screenHeight": 1080
                },
                "timestamp": "2022-02-06T05:58:49.876Z"
            },
            "lastModifiedAt": "2022-02-06T05:59:48Z"
        },
        {
            "relatedEntityId": "A28iM3aJBJRbEQpOnUh5HOM9",
            "entityId": "41a80489-00d4-446c-b456-8cb19c3f309a-0",
            "timestamp": 1644130597134,
            "entity": {
                "environment": {
                    "ipV4": "213.118.129.117",
                    "type": "browser",
                    "browserDetails": {
                        "viewportHeight": 1001,
                        "viewportWidth": 1920,
                        "userAgent": "Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/98.0.4758.80 Safari/537.36"
                    }
                },
                "web": {
                    "webPageDetails": {
                        "pageViews": {
                            "value": 1
                        },
                        "name": "login",
                        "URL": "https://builder.adobedemo.com/run/vangeluw-OCUC/login"
                    },
                    "webReferrer": {
                        "URL": "https://builder.adobedemo.com/run/vangeluw-OCUC/login"
                    }
                },
                "_experienceplatform": {
                    "interactionDetails": {
                        "core": {
                            "channel": "web"
                        }
                    },
                    "demoEnvironment": {
                        "brandName": "vangeluw-OCUC"
                    },
                    "identification": {
                        "core": {
                            "ecid": "12507560687324495704459439363261812234"
                        }
                    }
                },
                "implementationDetails": {
                    "name": "https://ns.adobe.com/experience/alloy/reactor",
                    "version": "2.8.0+2.9.0",
                    "environment": "browser"
                },
                "identityMap": {
                    "ECID": [
                        {
                            "id": "12507560687324495704459439363261812234",
                            "authenticatedState": "ambiguous",
                            "primary": true
                        }
                    ]
                },
                "eventType": "web.webpagedetails.pageViews",
                "_id": "41a80489-00d4-446c-b456-8cb19c3f309a-0",
                "placeContext": {
                    "localTime": "2022-02-06T07:56:37.134+01:00",
                    "localTimezoneOffset": -60
                },
                "device": {
                    "screenOrientation": "landscape",
                    "screenWidth": 1920,
                    "screenHeight": 1080
                },
                "timestamp": "2022-02-06T06:56:37.134Z"
            },
            "lastModifiedAt": "2022-02-06T06:56:38Z"
        },
        {
            "relatedEntityId": "A28jSB484ziuECF3fEoXmFlF",
            "entityId": "8ACC7B6C-2320-4865-B414-3B0CFA01F628",
            "timestamp": 1644419615000,
            "entity": {
                "environment": {
                    "ipV4": "213.118.129.117",
                    "browserDetails": {
                        "userAgent": "Mozilla/5.0 (iPhone; CPU OS 15_3 like Mac OS X; en_BE)"
                    }
                },
                "eventType": "application.login",
                "_id": "8ACC7B6C-2320-4865-B414-3B0CFA01F628",
                "_experienceplatform": {
                    "interactionDetails": {
                        "core": {
                            "channel": "mobile"
                        }
                    },
                    "demoEnvironment": {
                        "brandName": "vangeluw-2L6V"
                    },
                    "identification": {
                        "core": {
                            "ecid": "12019606991718502754997192487345616673",
                            "email": "woutervangeluwe+06022022-01@gmail.com"
                        }
                    }
                },
                "timestamp": "2022-02-09T15:13:35Z",
                "identityMap": {
                    "ECID": [
                        {
                            "id": "12019606991718502754997192487345616673",
                            "authenticatedState": "ambiguous",
                            "primary": true
                        }
                    ]
                }
            },
            "lastModifiedAt": "2022-02-09T15:13:38Z"
        },
        {
            "relatedEntityId": "A28jSB484ziuECF3fEoXmFlF",
            "entityId": "54F68CE5-E9E1-4AD0-91B1-7B607A9285C4",
            "timestamp": 1644419658000,
            "entity": {
                "environment": {
                    "ipV4": "213.118.129.117",
                    "browserDetails": {
                        "userAgent": "Mozilla/5.0 (iPhone; CPU OS 15_3 like Mac OS X; en_BE)"
                    }
                },
                "_experienceplatform": {
                    "interactionDetails": {
                        "core": {
                            "channel": "mobile"
                        }
                    },
                    "demoEnvironment": {
                        "brandName": "vangeluw-2L6V"
                    },
                    "identification": {
                        "core": {
                            "ecid": "12019606991718502754997192487345616673"
                        }
                    }
                },
                "identityMap": {
                    "ECID": [
                        {
                            "id": "12019606991718502754997192487345616673",
                            "authenticatedState": "ambiguous",
                            "primary": true
                        }
                    ]
                },
                "eventType": "commerce.productViews",
                "_id": "54F68CE5-E9E1-4AD0-91B1-7B607A9285C4",
                "commerce": {
                    "productViews": {
                        "value": 1
                    }
                },
                "productListItems": [
                    {
                        "quantity": 1,
                        "productAddMethod": "Mobile",
                        "_experienceplatform": {
                            "core": {
                                "mainCategory": "Women",
                                "productURL": "product1",
                                "imageURL": "https://contentviewer.s3.amazonaws.com/helium/wh08-white_main.jpg"
                            }
                        },
                        "priceTotal": 42,
                        "name": "Cassia Funnel Sweatshirt",
                        "SKU": "product1",
                        "currencyCode": "USD"
                    }
                ],
                "timestamp": "2022-02-09T15:14:18Z"
            },
            "lastModifiedAt": "2022-02-09T15:14:21Z"
        },
        {
            "relatedEntityId": "A2-AP9zOsakzNTe9Rqwf7Wse",
            "entityId": "bfe26684-bc3b-40c5-9fe5-5aba854c3227-0",
            "timestamp": 1644420036035,
            "entity": {
                "environment": {
                    "ipV4": "193.105.139.131",
                    "type": "browser",
                    "browserDetails": {
                        "viewportHeight": 969,
                        "viewportWidth": 1920,
                        "userAgent": "Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/98.0.4758.80 Safari/537.36"
                    }
                },
                "web": {
                    "webPageDetails": {
                        "pageViews": {
                            "value": 1
                        },
                        "name": "vangeluw-OCUC",
                        "URL": "https://builder.adobedemo.com/run/vangeluw-OCUC"
                    },
                    "webReferrer": {
                        "URL": "https://adobe.okta.com/"
                    }
                },
                "_experienceplatform": {
                    "interactionDetails": {
                        "core": {
                            "channel": "web"
                        }
                    },
                    "demoEnvironment": {
                        "brandName": "vangeluw-OCUC"
                    },
                    "identification": {
                        "core": {
                            "ecid": "38335942889672702722192106363935964471"
                        }
                    }
                },
                "implementationDetails": {
                    "name": "https://ns.adobe.com/experience/alloy/reactor",
                    "version": "2.8.0+2.9.0",
                    "environment": "browser"
                },
                "identityMap": {
                    "ECID": [
                        {
                            "id": "38335942889672702722192106363935964471",
                            "authenticatedState": "ambiguous",
                            "primary": true
                        }
                    ]
                },
                "eventType": "web.webpagedetails.pageViews",
                "_id": "bfe26684-bc3b-40c5-9fe5-5aba854c3227-0",
                "placeContext": {
                    "localTime": "2022-02-09T16:20:36.035+01:00",
                    "localTimezoneOffset": -60
                },
                "device": {
                    "screenOrientation": "landscape",
                    "screenWidth": 1920,
                    "screenHeight": 1080
                },
                "timestamp": "2022-02-09T15:20:36.035Z"
            },
            "lastModifiedAt": "2022-02-09T15:20:39Z"
        },
        {
            "relatedEntityId": "A2-AP9zOsakzNTe9Rqwf7Wse",
            "entityId": "0480c434-8fcd-4a80-b298-c561276ac989-0",
            "timestamp": 1644420037078,
            "entity": {
                "environment": {
                    "ipV4": "193.105.139.131",
                    "type": "browser",
                    "browserDetails": {
                        "viewportHeight": 969,
                        "viewportWidth": 1920,
                        "userAgent": "Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/98.0.4758.80 Safari/537.36"
                    }
                },
                "web": {
                    "webPageDetails": {
                        "pageViews": {
                            "value": 1
                        },
                        "name": "vangeluw-OCUC#",
                        "URL": "https://builder.adobedemo.com/run/vangeluw-OCUC#"
                    },
                    "webReferrer": {
                        "URL": "https://adobe.okta.com/"
                    }
                },
                "_experienceplatform": {
                    "interactionDetails": {
                        "core": {
                            "channel": "web"
                        }
                    },
                    "demoEnvironment": {
                        "brandName": "vangeluw-OCUC"
                    },
                    "identification": {
                        "core": {
                            "ecid": "38335942889672702722192106363935964471"
                        }
                    }
                },
                "implementationDetails": {
                    "name": "https://ns.adobe.com/experience/alloy/reactor",
                    "version": "2.8.0+2.9.0",
                    "environment": "browser"
                },
                "identityMap": {
                    "ECID": [
                        {
                            "id": "38335942889672702722192106363935964471",
                            "authenticatedState": "ambiguous",
                            "primary": true
                        }
                    ]
                },
                "eventType": "web.webpagedetails.pageViews",
                "_id": "0480c434-8fcd-4a80-b298-c561276ac989-0",
                "placeContext": {
                    "localTime": "2022-02-09T16:20:37.078+01:00",
                    "localTimezoneOffset": -60
                },
                "device": {
                    "screenOrientation": "landscape",
                    "screenWidth": 1920,
                    "screenHeight": 1080
                },
                "timestamp": "2022-02-09T15:20:37.078Z"
            },
            "lastModifiedAt": "2022-02-09T15:20:39Z"
        },
        {
            "relatedEntityId": "A2-AP9zOsakzNTe9Rqwf7Wse",
            "entityId": "6b1b3983-6966-4551-a711-6b6e410fd819-0",
            "timestamp": 1644420045993,
            "entity": {
                "environment": {
                    "ipV4": "193.105.139.131",
                    "type": "browser",
                    "browserDetails": {
                        "viewportHeight": 969,
                        "viewportWidth": 1920,
                        "userAgent": "Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/98.0.4758.80 Safari/537.36"
                    }
                },
                "web": {
                    "webPageDetails": {
                        "pageViews": {
                            "value": 1
                        },
                        "name": "login",
                        "URL": "https://builder.adobedemo.com/run/vangeluw-OCUC/login"
                    },
                    "webReferrer": {
                        "URL": "https://adobe.okta.com/"
                    }
                },
                "_experienceplatform": {
                    "interactionDetails": {
                        "core": {
                            "channel": "web"
                        }
                    },
                    "demoEnvironment": {
                        "brandName": "vangeluw-OCUC"
                    },
                    "identification": {
                        "core": {
                            "ecid": "38335942889672702722192106363935964471"
                        }
                    }
                },
                "implementationDetails": {
                    "name": "https://ns.adobe.com/experience/alloy/reactor",
                    "version": "2.8.0+2.9.0",
                    "environment": "browser"
                },
                "identityMap": {
                    "ECID": [
                        {
                            "id": "38335942889672702722192106363935964471",
                            "authenticatedState": "ambiguous",
                            "primary": true
                        }
                    ]
                },
                "eventType": "web.webpagedetails.pageViews",
                "_id": "6b1b3983-6966-4551-a711-6b6e410fd819-0",
                "placeContext": {
                    "localTime": "2022-02-09T16:20:45.993+01:00",
                    "localTimezoneOffset": -60
                },
                "device": {
                    "screenOrientation": "landscape",
                    "screenWidth": 1920,
                    "screenHeight": 1080
                },
                "timestamp": "2022-02-09T15:20:45.993Z"
            },
            "lastModifiedAt": "2022-02-09T15:20:47Z"
        },
        {
            "relatedEntityId": "A2-AP9zOsakzNTe9Rqwf7Wse",
            "entityId": "ae0f3551-7753-4467-8547-8fdbb66c2214-0",
            "timestamp": 1644420058565,
            "entity": {
                "environment": {
                    "ipV4": "193.105.139.131",
                    "type": "browser",
                    "browserDetails": {
                        "viewportHeight": 969,
                        "viewportWidth": 1920,
                        "userAgent": "Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/98.0.4758.80 Safari/537.36"
                    }
                },
                "web": {
                    "webPageDetails": {
                        "URL": "https://builder.adobedemo.com/run/vangeluw-OCUC/home"
                    },
                    "webReferrer": {
                        "URL": "https://adobe.okta.com/"
                    }
                },
                "_experienceplatform": {
                    "interactionDetails": {
                        "core": {
                            "channel": "web"
                        }
                    },
                    "demoEnvironment": {
                        "brandName": "vangeluw-OCUC"
                    },
                    "identification": {
                        "core": {
                            "ecid": "38335942889672702722192106363935964471",
                            "email": "woutervangeluwe+06022022-01@gmail.com"
                        }
                    }
                },
                "implementationDetails": {
                    "name": "https://ns.adobe.com/experience/alloy/reactor",
                    "version": "2.8.0+2.9.0",
                    "environment": "browser"
                },
                "identityMap": {
                    "ECID": [
                        {
                            "id": "38335942889672702722192106363935964471",
                            "authenticatedState": "ambiguous",
                            "primary": true
                        }
                    ]
                },
                "eventType": "web.login",
                "_id": "ae0f3551-7753-4467-8547-8fdbb66c2214-0",
                "placeContext": {
                    "localTime": "2022-02-09T16:20:58.565+01:00",
                    "localTimezoneOffset": -60
                },
                "device": {
                    "screenOrientation": "landscape",
                    "screenWidth": 1920,
                    "screenHeight": 1080
                },
                "timestamp": "2022-02-09T15:20:58.565Z"
            },
            "lastModifiedAt": "2022-02-09T15:20:59Z"
        },
        {
            "relatedEntityId": "A2-AP9zOsakzNTe9Rqwf7Wse",
            "entityId": "5e67a9c9-b201-4e21-bd3a-4d10475f6156-0",
            "timestamp": 1644420058653,
            "entity": {
                "environment": {
                    "ipV4": "193.105.139.131",
                    "type": "browser",
                    "browserDetails": {
                        "viewportHeight": 969,
                        "viewportWidth": 1920,
                        "userAgent": "Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/98.0.4758.80 Safari/537.36"
                    }
                },
                "web": {
                    "webPageDetails": {
                        "pageViews": {
                            "value": 1
                        },
                        "name": "home",
                        "URL": "https://builder.adobedemo.com/run/vangeluw-OCUC/home"
                    },
                    "webReferrer": {
                        "URL": "https://adobe.okta.com/"
                    }
                },
                "_experienceplatform": {
                    "interactionDetails": {
                        "core": {
                            "channel": "web"
                        }
                    },
                    "demoEnvironment": {
                        "brandName": "vangeluw-OCUC"
                    },
                    "identification": {
                        "core": {
                            "ecid": "38335942889672702722192106363935964471"
                        }
                    }
                },
                "implementationDetails": {
                    "name": "https://ns.adobe.com/experience/alloy/reactor",
                    "version": "2.8.0+2.9.0",
                    "environment": "browser"
                },
                "identityMap": {
                    "ECID": [
                        {
                            "id": "38335942889672702722192106363935964471",
                            "authenticatedState": "ambiguous",
                            "primary": true
                        }
                    ]
                },
                "eventType": "web.webpagedetails.pageViews",
                "_id": "5e67a9c9-b201-4e21-bd3a-4d10475f6156-0",
                "placeContext": {
                    "localTime": "2022-02-09T16:20:58.653+01:00",
                    "localTimezoneOffset": -60
                },
                "device": {
                    "screenOrientation": "landscape",
                    "screenWidth": 1920,
                    "screenHeight": 1080
                },
                "timestamp": "2022-02-09T15:20:58.653Z"
            },
            "lastModifiedAt": "2022-02-09T15:21:00Z"
        },
        {
            "relatedEntityId": "A2-AP9zOsakzNTe9Rqwf7Wse",
            "entityId": "33253c5a-6a7e-4858-a7d2-4e6d4a1c7901-0",
            "timestamp": 1644420061804,
            "entity": {
                "environment": {
                    "ipV4": "193.105.139.131",
                    "type": "browser",
                    "browserDetails": {
                        "viewportHeight": 969,
                        "viewportWidth": 1920,
                        "userAgent": "Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/98.0.4758.80 Safari/537.36"
                    }
                },
                "web": {
                    "webPageDetails": {
                        "pageViews": {
                            "value": 1
                        },
                        "name": "vangeluw-OCUC",
                        "URL": "https://builder.adobedemo.com/run/vangeluw-OCUC"
                    },
                    "webReferrer": {
                        "URL": "https://builder.adobedemo.com/run/vangeluw-OCUC/home"
                    }
                },
                "_experienceplatform": {
                    "interactionDetails": {
                        "core": {
                            "channel": "web"
                        }
                    },
                    "demoEnvironment": {
                        "brandName": "vangeluw-OCUC"
                    },
                    "identification": {
                        "core": {
                            "ecid": "38335942889672702722192106363935964471"
                        }
                    }
                },
                "implementationDetails": {
                    "name": "https://ns.adobe.com/experience/alloy/reactor",
                    "version": "2.8.0+2.9.0",
                    "environment": "browser"
                },
                "identityMap": {
                    "ECID": [
                        {
                            "id": "38335942889672702722192106363935964471",
                            "authenticatedState": "ambiguous",
                            "primary": true
                        }
                    ]
                },
                "eventType": "web.webpagedetails.pageViews",
                "_id": "33253c5a-6a7e-4858-a7d2-4e6d4a1c7901-0",
                "placeContext": {
                    "localTime": "2022-02-09T16:21:01.804+01:00",
                    "localTimezoneOffset": -60
                },
                "device": {
                    "screenOrientation": "landscape",
                    "screenWidth": 1920,
                    "screenHeight": 1080
                },
                "timestamp": "2022-02-09T15:21:01.804Z"
            },
            "lastModifiedAt": "2022-02-09T15:21:03Z"
        },
        {
            "relatedEntityId": "A2-AP9zOsakzNTe9Rqwf7Wse",
            "entityId": "d8e81fb7-6de9-44c1-b9c6-60d93b520209-0",
            "timestamp": 1644420071737,
            "entity": {
                "environment": {
                    "ipV4": "193.105.139.131",
                    "type": "browser",
                    "browserDetails": {
                        "viewportHeight": 969,
                        "viewportWidth": 1920,
                        "userAgent": "Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/98.0.4758.80 Safari/537.36"
                    }
                },
                "web": {
                    "webPageDetails": {
                        "pageViews": {
                            "value": 1
                        },
                        "name": "vangeluw-OCUC",
                        "URL": "https://builder.adobedemo.com/run/vangeluw-OCUC"
                    },
                    "webReferrer": {
                        "URL": "https://builder.adobedemo.com/run/vangeluw-OCUC/home"
                    }
                },
                "_experienceplatform": {
                    "interactionDetails": {
                        "core": {
                            "channel": "web"
                        }
                    },
                    "demoEnvironment": {
                        "brandName": "vangeluw-OCUC"
                    },
                    "identification": {
                        "core": {
                            "ecid": "38335942889672702722192106363935964471"
                        }
                    }
                },
                "implementationDetails": {
                    "name": "https://ns.adobe.com/experience/alloy/reactor",
                    "version": "2.8.0+2.9.0",
                    "environment": "browser"
                },
                "identityMap": {
                    "ECID": [
                        {
                            "id": "38335942889672702722192106363935964471",
                            "authenticatedState": "ambiguous",
                            "primary": true
                        }
                    ]
                },
                "eventType": "web.webpagedetails.pageViews",
                "_id": "d8e81fb7-6de9-44c1-b9c6-60d93b520209-0",
                "placeContext": {
                    "localTime": "2022-02-09T16:21:11.737+01:00",
                    "localTimezoneOffset": -60
                },
                "device": {
                    "screenOrientation": "landscape",
                    "screenWidth": 1920,
                    "screenHeight": 1080
                },
                "timestamp": "2022-02-09T15:21:11.737Z"
            },
            "lastModifiedAt": "2022-02-09T15:21:14Z"
        }
    ],
    "_links": {
        "next": {
            "href": ""
        }
    }
}
```

これは、現在、この ECID に対して Platform で使用可能なすべての ExperienceEvent データです。

Adobe Experience Platformのリアルタイムプロファイルから ExperienceEvent データをリクエストする際に、ECID を使用する必要はありません。任意の名前空間内の任意の ID を使用して、このデータをリクエストできます。

次のステップ： [3.4 セグメントの作成 — UI](./ex4.md)

[モジュール 3 に戻る](./real-time-customer-profile.md)

[すべてのモジュールに戻る](../../overview.md)
