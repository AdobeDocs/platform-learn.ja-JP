---
title: ベンダータグのイベント転送への移動の検討
description: サーバーサイドのデータ配布用にクライアントサイドのベンダータグを評価する方法を説明します。
feature: Event Forwarding, Tags, Integrations
role: Admin, Developer, Architect, Data Engineer
level: Intermediate, Experienced
jira: KT-9921
exl-id: f8fd351a-435c-4cc1-b987-ed2ead20d4d6
source-git-commit: 7edf8fc46943ae2f1e6e2e20f4d589d7959310c8
workflow-type: tm+mt
source-wordcount: '1279'
ht-degree: 4%

---

# クライアントサイドベンダータグのイベント転送への移動の検討

クライアントサイドベンダータグをブラウザーやデバイスからサーバーに移動することを検討すべき説得力のある理由がいくつかあります。 この記事では、イベント転送プロパティに移動する可能性のあるクライアントサイドベンダータグを評価する方法について説明します。

この評価が必要になるのは、クライアントサイドのベンダータグを削除して、イベント転送プロパティのサーバーサイドのデータ配信に置き換えることを検討している場合のみです。 この記事は、[&#x200B; データ収集 &#x200B;](https://experienceleague.adobe.com/docs/data-collection.html?lang=ja) および [&#x200B; イベント転送 &#x200B;](https://experienceleague.adobe.com/docs/experience-platform/tags/event-forwarding/overview.html?lang=ja) の基本に精通していることを前提としています。

>[!NOTE]
>
>Adobe Experience Platform Launch は、Adobe Experience Platform のデータ収集テクノロジースイートとしてリブランドされています。 その結果、製品ドキュメント全体でいくつかの用語が変更されました。用語の変更点の一覧については、次の[ドキュメント](https://experienceleague.adobe.com/docs/experience-platform/tags/term-updates.html?lang=ja)を参照してください。

ブラウザーベンダーはサードパーティ cookie の取り扱い方法を変えています。 Advertisingやマーケティングのベンダーやテクノロジーでは、多くの場合、クライアントサイドタグの使用が必要です。 これらの課題は、お客様がサーバーサイドのデータ配信を追加する理由として説得力のある 2 つしかありません。

>[!NOTE]
>
>この記事で `Tag`、クライアントサイドのコードとは、通常、訪問者がサイトやアプリを操作している間にブラウザーまたはデバイスでデータ収集に使用される、ベンダーのJavaScriptを指します。 ここで `Website` または `site` は、web サイト、web アプリケーション、またはモバイルデバイス用のアプリケーションを指します。 これらの目的のための「タグ」は、多くの場合、ピクセルとも呼ばれます。

## ユースケースとデータ {#use-cases-data}

最初の手順は、クライアントサイドのベンダータグで実装されたユースケースを定義することです。 例えば、Facebook（Meta）ピクセルについて考えてみましょう。 イベント転送拡張機能を使用して、サイトから [Meta Conversions API](https://exchange.adobe.com/apps/ec/109168/meta-conversions-api) に移行するということは、最初に特定のユースケースをドキュメント化することを意味します。

現在のクライアントサイドベンダーコードの場合：

- 公開されてクライアントサイドタグに渡される特定のイベントとその他のデータポイントはどれですか？
- そのデータ転送はいつ、どこで行われますか。

この評価を文書化するには、リスト、スプレッドシート、図、またはイベントのシーケンスのレコードを作成すると便利です。自分で使用する場合であっても同様です。 データソースのラベルを必ず含めてください。このラベルはどこから取得されるのでしょうか。 宛先 – どこに行きますか？ そして変換：ソースとデスティネーションの間で変換はどうなりますか。

この例では、訪問者がFacebook広告を表示した後にサイトとやり取りする際の、Facebook ピクセルを使用したコンバージョンをトラッキングしています。 また、別のソーシャルプラットフォームで関連広告を表示した後に、サイトとやり取りすることもできます。 これらのコンバージョンをFacebook広告ツールおよびレポートで確認するには、必要なデータがFacebookに送信される必要があります。 このデータには、ダウンロード、登録、いいね、購入などのコンバージョンイベントが含まれる場合があります。

### データ {#data}

既存のクライアントサイドタグを使用してサイト上で実行または実行する場合、ユースケースのデータはどうなりますか？ ベンダータグなしでクライアントで必要なデータを取得して、イベント転送に送信することはできますか？ [&#x200B; タグ &#x200B;](https://experienceleague.adobe.com/docs/experience-platform/tags/home.html?lang=ja) またはその他のタグ管理システムを使用する場合、ほとんどの訪問者インタラクションデータを収集および配布に使用できます。 しかし、ユースケースに必要なデータは、クライアントサイドのベンダータグがなくても、必要なときに、必要な場所で、必要な形式で利用できますか？ 考慮すべきデータに関するその他の質問を次に示します。

- すべてのイベントにベンダーユーザー ID は必要ですか？
- その場合、クライアントサイドタグなしでどのように収集または生成できますか？
- ベンダーは特に実行時にクライアントサイドのコードを必要としますか？
- その他の必要なデータは何ですか？ そのデータはどこから取得されますか？

ほとんどのクライアントサイドベンダータグは、特定のユースケースに対して多くのデータポイントを必要としませんが、これらの評価中にユースケースと必要なデータに注意すると便利です。

## ベンダー API {#vendor-apis}

実装する具体的なユースケース、必要なデータおよびソースから宛先へのイベントのシーケンスについて確認しました。 このユースケースがイベント転送に適しているかどうかを判断するために、ベンダー API の詳細を調査できるようになりました。

>[!IMPORTANT]
>
>多くのベンダーがサーバー間の転送に API を有効にしていますが、現在これらの目的に適合する API を持たないベンダーも多くあります。

### API の調査 {#investigate-apis}

ベンダー API エンドポイントを調査する手順を次に示します。

ベンダーは、イベントデータのサーバー間の転送のために設計された API を持っていますか？ まず、これらの特定の API エンドポイントの要件を見つけます。

- 必要なデータを送信するための API エンドポイントが存在するか。 ユースケースをサポートするエンドポイントを見つけるには、ベンダーの開発者または API ドキュメントを参照してください。
- イベントデータのストリーミングを許可しますか、それともバッチデータのみを許可しますか？
- どの認証方法をサポートしていますか。 トークン、HTTP、OAuth クライアント資格情報のバージョンなど。 イベント転送でサポートされるメソッドについては、[&#x200B; こちら &#x200B;](https://experienceleague.adobe.com/docs/experience-platform/tags/event-forwarding/secrets.html?lang=ja) を参照してください。
- API の更新オフセットはどれくらいですか？ この制限は、イベント転送の最小値と互換性がありますか？ 詳細 [&#x200B; こちら &#x200B;](https://experienceleague.adobe.com/docs/experience-platform/tags/event-forwarding/secrets.html?lang=ja#:~:text=you%20can%20configure%20the%20Refresh%20Offset%20value%20for%20the%20secret).
- 関連するエンドポイントに必要なデータ
- エンドポイントを呼び出すたびに、ベンダー固有のユーザー識別子が必要ですか？
- その識別子が必要な場合、クライアントサイドのコードを使用せずに、どこでどのように生成または取得できますか？

つまり、

- ベンダーはユースケースに必要な API エンドポイントを提供していますか？
- イベント転送と互換性のある認証方法はありますか？
- イベント転送の実装に必要なすべてのデータに（クライアントサイドから、または他の API 呼び出しから）アクセスできますか？

このタグは、これらの質問に対して「はい」と答えられる場合、イベント転送プロパティでクライアントからサーバーに移動するのに適した候補です。

ベンダーがユースケースをサポートする API エンドポイントを持っていない場合、明らかに、ベンダータグがクライアントサイドのベンダータグの代わりにイベント転送を使用するための良い候補ではありません。

API が用意されていて、API 呼び出しごとに一意の訪問者またはユーザー ID も必要な場合は、どうすればよいですか？ サイトでベンダーのクライアントサイドコード（タグ）が実行されていない場合、その ID にはどのようにアクセスできますか？

一部のベンダーは、サードパーティ cookie を使用せずに新世界向けにシステムを変更しています。 これらの変更には、[UUID](https://developer.mozilla.org/en-US/docs/Glossary/UUID) やその他の [&#x200B; 顧客が生成した ID](https://experienceleague.adobe.com/docs/experience-platform/edge/identity/first-party-device-ids.html?lang=ja) など、別の一意の識別子の使用が含まれます。 ベンダーがお客様から生成された ID を許可している場合は、Web または Mobile SDK を使用してクライアントから Platform Edge Networkに ID を送信するか、イベント転送での API 呼び出しから ID を取得する可能性があります。 イベント転送ルールでそのベンダーにデータを送信する場合は、必要に応じて単にその識別子を含めます。

独自のクライアントサイドタグによってのみ生成またはアクセスできるデータ（ベンダー固有の一意の ID など）がベンダーから必要な場合、そのベンダータグは移動に適した候補ではない可能性が高くなります。 _適切な API を使用せずにデータ収集をイベント転送に移動するという考えで、クライアントサイドタグをリバースエンジニアリングすることは推奨されません_。

[Adobe Experience Platform Cloud Connector](https://experienceleague.adobe.com/docs/experience-platform/tags/extensions/adobe/cloud-connector/overview.html?lang=ja) 拡張機能は、サーバー間イベントデータ転送に適した API を持つベンダーに対して、必要に応じて HTTP リクエストを行うことができます。 ベンダー固有の拡張機能は素晴らしいことで、現在、より多くの拡張機能が活発に開発されていますが、追加のベンダー拡張機能を待たずに、Cloud Connector 拡張機能を使用して現在イベント転送ルールを実装できます。

## ツール {#tools}

[Postman](https://www.postman.com/) などのツールや、Visual Studio Code [Thunder Client](https://marketplace.visualstudio.com/items?itemName=rangav.vscode-thunder-client) または [HTTP Client](https://marketplace.visualstudio.com/items?itemName=mkloubert.vscode-http-client) などのテキストエディター拡張機能を使用すると、ベンダー API エンドポイントの調査とテストが簡単になります。

## 次の手順 {#next-steps}

この記事では、ベンダーのクライアントサイドタグを評価し、イベント転送プロパティでサーバーサイドに移動する可能性がある一連の手順を説明しました。 関連トピックについて詳しくは、次のリンクを参照してください。

- Adobe Experience Platformの [Tag Management](https://experienceleague.adobe.com/docs/experience-platform/tags/home.html?lang=ja)
- サーバーサイド処理の [&#x200B; イベント転送 &#x200B;](https://experienceleague.adobe.com/docs/experience-platform/tags/event-forwarding/overview.html?lang=ja)
- データ収集での [&#x200B; 用語の更新 &#x200B;](https://experienceleague.adobe.com/docs/experience-platform/tags/term-updates.html?lang=ja)
