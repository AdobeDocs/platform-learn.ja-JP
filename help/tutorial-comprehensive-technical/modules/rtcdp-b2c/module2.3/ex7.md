---
title: Real-time CDP – 宛先 SDK
description: Real-time CDP – 宛先 SDK
kt: 5342
doc-type: tutorial
exl-id: 5606ca2f-85ce-41b3-80f9-3c137f66a8c0
source-git-commit: 3a19e88e820c63294eff38bb8f699a9f690afcb9
workflow-type: tm+mt
source-wordcount: '1049'
ht-degree: 6%

---

# 2.3.7 宛先 SDK

## Adobe I/Oプロジェクトの設定

この演習では、Adobe I/Oを再度使用して、Adobe Experience Platform API に対してクエリを実行します。まだAdobe I/Oプロジェクトを設定していない場合は、[ モジュール 2.1 の演習 3](../module2.1/ex3.md) に戻り、その指示に従います。

## Adobe I/Oに対するPostman認証

この演習では、Postmanを再度使用して、Adobe Experience Platform API に対してクエリを実行します。Postman アプリケーションをまだ設定していない場合は、[ モジュール 2.1 の演習 3](../module2.1/ex3.md) に戻って、その指示に従ってください。

## エンドポイントと形式の定義

この演習では、セグメントが選定されたときに選定イベントをそのエンドポイントにストリーミングできるように、を設定するエンドポイントが必要です。 この演習では、[https://webhook.site/](https://webhook.site/) を使用してサンプルエンドポイントを使用します。 [https://webhook.site/](https://webhook.site/) に移動すると、これに類似したものが表示されます。 **クリップボードにコピー** をクリックして、URL をコピーします。 次の演習では、この URL を指定する必要があります。 この例の URL は `https://webhook.site/e0eb530c-15b4-4a29-8b50-e40877d5490a` です。

![データ取得](./images/webhook1.png)

形式については、セグメントの選定または選定解除と共に顧客識別子などのメタデータをストリーミングする標準テンプレートを使用します。 テンプレートは特定のエンドポイントの想定に合わせてカスタマイズできますが、この演習では標準テンプレートを再利用します。これにより、次のようなペイロードがエンドポイントにストリーミングされます。

```json
{
  "profiles": [
    {
      "identities": [
        {
          "type": "ecid",
          "id": "64626768309422151580190219823409897678"
        }
      ],
      "AdobeExperiencePlatformSegments": {
        "add": [
          "f58c723c-f1e5-40dd-8c79-7bb4ab47f041"
        ],
        "remove": []
      }
    }
  ]
}
```

## サーバーとテンプレートの設定の作成

Adobe Experience Platformで独自の宛先を作成する最初の手順は、サーバーとテンプレートの設定を作成することです。

これを行うには、**Destination Authoring API** の **Destination server and templates** に移動し、クリックしてリクエスト **設定 – 宛先サーバーPOSTを作成** を開きます。 その後、これが表示されます。 **ヘッダー** の下で、キー **x-sandbox-name** の値を手動で更新し、`--aepSandboxName--` に設定する必要があります。 値 **{{SANDBOX_NAME}}** を選択します。

![データ取得](./images/sdkpm1.png)

`--aepSandboxName--` で置き換えます。

![データ取得](./images/sdkpm2.png)

次に、**本文** に移動します。 プレースホルダー **{{body}}** を選択します。

![データ取得](./images/sdkpm3.png)

ここで、プレースホルダー **{{body}}** を以下のコードで置き換える必要があります。

```json
{
    "name": "Custom HTTP Destination",
    "destinationServerType": "URL_BASED",
    "urlBasedDestination": {
        "url": {
            "templatingStrategy": "PEBBLE_V1",
            "value": "yourURL"
        }
    },
    "httpTemplate": {
        "httpMethod": "POST",
        "requestBody": {
            "templatingStrategy": "PEBBLE_V1",
            "value": "{\n    \"profiles\": [\n    {%- for profile in input.profiles %}\n        {\n            \"identities\": [\n            {%- for idMapEntry in profile.identityMap -%}\n            {%- set namespace = idMapEntry.key -%}\n                {%- for identity in idMapEntry.value %}\n                {\n                    \"type\": \"{{ namespace }}\",\n                    \"id\": \"{{ identity.id }}\"\n                }{%- if not loop.last -%},{%- endif -%}\n                {%- endfor -%}{%- if not loop.last -%},{%- endif -%}\n            {% endfor %}\n            ],\n            \"AdobeExperiencePlatformSegments\": {\n                \"add\": [\n                {%- for segment in profile.segmentMembership.ups | added %}\n                    \"{{ segment.key }}\"{%- if not loop.last -%},{%- endif -%}\n                {% endfor %}\n                ],\n                \"remove\": [\n                {#- Alternative syntax for filtering segments by status: -#}\n                {% for segment in removedSegments(profile.segmentMembership.ups) %}\n                    \"{{ segment.key }}\"{%- if not loop.last -%},{%- endif -%}\n                {% endfor %}\n                ]\n            }\n        }{%- if not loop.last -%},{%- endif -%}\n    {% endfor %}\n    ]\n}"
        },
        "contentType": "application/json"
    }
}
```

上記のコードを貼り付けた後、フィールド **urlBasedDestination.url.value** を手動で更新し、前の手順で作成した Webhook の URL （この例で `https://webhook.site/e0eb530c-15b4-4a29-8b50-e40877d5490a` 成）に設定する必要があります。

![データ取得](./images/sdkpm4.png)

フィールド **urlBasedDestimention.url.value** を更新すると、次のようになります。 「**送信**」をクリックします。

![データ取得](./images/sdkpm5.png)

「**送信**」をクリックすると、サーバーテンプレートが作成され、応答の一部として **instanceId** という名前のフィールドが表示されます。 次の手順で必要になるので、書き留めてください。 この例では、**instanceId** は
`eb0f436f-dcf5-4993-a82d-0fcc09a6b36c`。

![データ取得](./images/sdkpm6.png)

## 宛先設定の作成

Postmanの **Destination Authoring API** で、**Destination configurations}** に移動し、クリックしてリクエスト **設定 – 宛先POSTを作成** を開きます。 その後、これが表示されます。 **ヘッダー** の下で、キー **x-sandbox-name** の値を手動で更新し、`--aepSandboxName--` に設定する必要があります。 値 **{{SANDBOX_NAME}}** を選択します。

![データ取得](./images/sdkpm7.png)

`--aepSandboxName--` で置き換えます。

![データ取得](./images/sdkpm8.png)

次に、**本文** に移動します。 プレースホルダー **{{body}}** を選択します。

![データ取得](./images/sdkpm9.png)

ここで、プレースホルダー **{{body}}** を以下のコードで置き換える必要があります。

```json
{
    "name": "--aepUserLdap-- - Webhook",
    "description": "Exports segment qualifications and identities to a custom webhook via Destination SDK.",
    "status": "TEST",
    "customerAuthenticationConfigurations": [
        {
            "authType": "BEARER"
        }
    ],
    "customerDataFields": [
        {
            "name": "endpointsInstance",
            "type": "string",
            "title": "Select Endpoint",
            "description": "We could manage several instances across the globe for REST endpoints that our customers are provisioned for. Select your endpoint in the dropdown list.",
            "isRequired": true,
            "enum": [
                "US",
                "EU",
                "APAC",
                "NZ"
            ]
        }
    ],
    "uiAttributes": {
        "documentationLink": "https://experienceleague.adobe.com/docs/experience-platform/destinations/home.html?lang=en",
        "category": "streaming",
        "connectionType": "Server-to-server",
        "frequency": "Streaming"
    },
    "identityNamespaces": {
        "ecid": {
            "acceptsAttributes": true,
            "acceptsCustomNamespaces": false
        }
    },
    "segmentMappingConfig": {
        "mapExperiencePlatformSegmentName": true,
        "mapExperiencePlatformSegmentId": true,
        "mapUserInput": false
    },
    "aggregation": {
        "aggregationType": "BEST_EFFORT",
        "bestEffortAggregation": {
            "maxUsersPerRequest": "1000",
            "splitUserById": false
        }
    },
    "schemaConfig": {
        "profileRequired": false,
        "segmentRequired": true,
        "identityRequired": true
    },
    "destinationDelivery": [
        {
            "authenticationRule": "NONE",
            "destinationServerId": "yourTemplateInstanceID"
        }
    ]
}
```

![データ取得](./images/sdkpm11.png)

上記のコードを貼り付けた後、フィールド **destinationDelivery を手動で更新する必要があります。 destinationServerId**。この例で `eb0f436f-dcf5-4993-a82d-0fcc09a6b36c` 成した、前の手順で作成した宛先サーバーテンプレートの **instanceId** に設定する必要があります。 次に、「**送信** をクリックします。

![データ取得](./images/sdkpm10.png)

この応答が表示されます。

![データ取得](./images/sdkpm12.png)

これで、宛先がAdobe Experience Platformに作成されました。 そこへ行って、それを調べてみよう。

[Adobe Experience Platform](https://experience.adobe.com/platform) に移動します。 ログインすると、Adobe Experience Platformのホームページが表示されます。

![データ取得](./../../../modules/datacollection/module1.2/images/home.png)

続行する前に、**サンドボックス** を選択する必要があります。 選択するサンドボックスの名前は ``--aepSandboxName--`` です。 これを行うには、画面上部の青い線のテキスト **[!UICONTROL 実稼動製品]** をクリックします。 適切な [!UICONTROL  サンドボックス ] を選択すると、画面が変更され、専用の [!UICONTROL  サンドボックス ] が表示されます。

![データ取得](./../../../modules/datacollection/module1.2/images/sb1.png)

左側のメニューで、**宛先** に移動し、「**カタログ** をクリックして、カテゴリ **ストリーミング** まで下にスクロールします。 今すぐそこに利用可能な宛先が表示されます。

![データ取得](./images/destsdk1.png)

## セグメントの宛先へのリンク

**宛先**/**カタログ** で、宛先の **設定** をクリックして、新しい宛先へのセグメントの追加を開始します。

![データ取得](./images/destsdk2.png)

**1234** などのダミーのベアラートークンを入力します。 **宛先に接続** をクリックします。

![データ取得](./images/destsdk3.png)

その後、これが表示されます。 宛先の名前として、`--aepUserLdap-- - Webhook` を使用します。 任意のエンドポイント（この例では **EU**）を選択します。 「**次へ**」をクリックします。

![データ取得](./images/destsdk4.png)

オプションで、データガバナンスポリシーを選択できます。 「**次へ**」をクリックします。

![データ取得](./images/destsdk5.png)

先ほど作成した `--aepUserLdap-- - Interest in PROTEUS FITNESS JACKSHIRT` という名前のセグメントを選択します。 「**次へ**」をクリックします。

![データ取得](./images/destsdk6.png)

その後、これが表示されます。 必ず **SOURCE FIELD** `--aepTenantId--.identification.core.ecid` をフィールド `Identity: ecid` にマッピングしてください。 「**次へ**」をクリックします。

![データ取得](./images/destsdk7.png)

「**完了**」をクリックします。

![データ取得](./images/destsdk8.png)

宛先がライブになりました。新しいセグメント選定は、カスタム Webhook に今すぐストリーミングされます。

![データ取得](./images/destsdk9.png)

## セグメントのアクティベーションのテスト

[https://builder.adobedemo.com/projects](https://builder.adobedemo.com/projects) に移動します。 Adobe IDでログインすると、このが表示されます。 Web サイトプロジェクトをクリックして開きます。

![DSN](../../gettingstarted/gettingstarted/images/web8.png)

次のフローに従って、web サイトにアクセスできるようになりました。 **統合** をクリックします。

![DSN](../../gettingstarted/gettingstarted/images/web1.png)

**統合** ページでは、演習 0.1 で作成したデータ収集プロパティを選択する必要があります。

![DSN](../../gettingstarted/gettingstarted/images/web2.png)

その後、デモ Web サイトが開きます。 URL を選択してクリップボードにコピーします。

![DSN](../../gettingstarted/gettingstarted/images/web3.png)

新しい匿名ブラウザーウィンドウを開きます。

![DSN](../../gettingstarted/gettingstarted/images/web4.png)

前の手順でコピーしたデモ Web サイトの URL を貼り付けます。 その後、Adobe IDを使用してログインするように求められます。

![DSN](../../gettingstarted/gettingstarted/images/web5.png)

アカウントタイプを選択し、ログインプロセスを完了します。

![DSN](../../gettingstarted/gettingstarted/images/web6.png)

次に、匿名ブラウザーウィンドウに web サイトが読み込まれます。 デモごとに、新しい匿名ブラウザーウィンドウを使用して、デモ Web サイトの URL を読み込む必要があります。

![DSN](../../gettingstarted/gettingstarted/images/web7.png)

**Luma** のホームページで **Men** に移動し、製品 **PROTEUS FITNESS JACKSHIRT** をクリックします。

![データ取得](./images/homenadia.png)

これで、**PROTEUS FITNESS JACKSHIRT** の製品ページにアクセスしました。つまり、この演習で以前に作成したセグメントの資格が得られます。

![データ取得](./images/homenadiapp.png)

プロファイルビューアを開き、**セグメント** に移動すると、セグメントが選定されていることがわかります。

![データ取得](./images/homenadiapppb.png)

次に、[https://webhook.site/](https://webhook.site/) で開いている Webhook に戻ると、Adobe Experience Platformから送信され、セグメントの選定イベントを含む、新しい受信リクエストが表示されます。

![データ取得](./images/destsdk10.png)

次の手順：[ 概要とメリット ](./summary.md)

[モジュール 2.3 に戻る](./real-time-cdp-build-a-segment-take-action.md)

[すべてのモジュールに戻る](../../../overview.md)
