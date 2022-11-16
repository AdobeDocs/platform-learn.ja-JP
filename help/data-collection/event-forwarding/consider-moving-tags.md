---
title: ベンダータグをイベント転送に移動することを検討します
description: サーバー側のデータ配布のためのクライアント側のベンダータグを評価する方法について説明します。
feature: Event Forwarding, Tags, Integrations
solution: Data Collection
kt: 9921
level: Intermediate, Experienced
role: Admin, Developer, Architect
exl-id: f8fd351a-435c-4cc1-b987-ed2ead20d4d6
source-git-commit: cc7a77c4dd380ae1bc23dc75608e8e2224dfe78c
workflow-type: tm+mt
source-wordcount: '1369'
ht-degree: 5%

---

# クライアントサイドベンダータグのイベント転送への移動の検討

クライアント側のベンダータグをブラウザーやデバイスからサーバーに移動することを検討するには、いくつかのやむを得ない理由があります。 この記事では、潜在的にイベント転送プロパティに移動するためにクライアント側のベンダータグを評価する方法について説明します。

この評価が必要なのは、クライアント側のベンダータグを削除し、イベント転送プロパティでサーバー側のデータ配布に置き換えることを検討している場合のみです。 この記事は、の基本を理解していることを前提としています。 [データ収集](https://experienceleague.adobe.com/docs/data-collection.html)、および [イベント転送](https://experienceleague.adobe.com/docs/experience-platform/tags/event-forwarding/overview.html).

>[!NOTE]
>
>Adobe Experience Platform Launch は、Adobe Experience Platform のデータ収集テクノロジースイートとしてリブランドされています。 その結果、製品ドキュメント全体でいくつかの用語の変更がロールアウトされました。 用語の変更点の一覧については、次の[ドキュメント](https://experienceleague.adobe.com/docs/experience-platform/tags/term-updates.html)を参照してください。

ブラウザーベンダーは、サードパーティ cookie の処理方法を変更しています。 広告やマーケティングのベンダーやテクノロジーでは、多くの場合、クライアント側タグを使用する必要があります。 これらの課題は、お客様がサーバー側のデータ配信を追加している理由の 2 つに過ぎません。

>[!NOTE]
>
>`Tag` この記事では、通常、クライアントサイドコードを示します。訪問者がサイトやアプリを操作する際に、ブラウザーやデバイスでのデータ収集に使用されるベンダーの JavaScript を使用します。 `Website` または `site` ここでは、web サイト、web アプリケーションまたはモバイルデバイス用のアプリケーションを指します。 これらの目的の「タグ」は、多くの場合、ピクセルとも呼ばれます。

## 使用例とデータ {#use-cases-data}

最初の手順は、クライアント側のベンダータグで実装されるユースケースを定義することです。 例えば、Facebook(Meta) ピクセルについて考えてみましょう。 サイトからに移動する [Facebook Conversions API](https://exchange.adobe.com/apps/ec/105509/facebook-conversions-api-extension) イベント転送拡張機能を使用する場合は、特定の使用例を最初にドキュメント化することを意味します。

現在のクライアント側ベンダーコードの場合：

- クライアント側タグに公開および渡される特定のイベントやその他のデータポイントは何ですか？
- そのデータ転送は、いつどこでおこなわれますか？

この評価を記録するデータやイベントのシーケンスを、たとえ自分で使用する場合でも、リスト、スプレッドシート、図、またはその他の記録を作成すると便利です。 データソースのラベルを必ず含めてください。ラベルはどこから取得されますか。 目的地 — どこへ行くのか？ 変換 — ソースと宛先の間で何が起こるか。

この例では、訪問者がFacebook広告を表示した後にサイトとやり取りした際に、Facebookピクセルを使用してコンバージョンを追跡しています。 また、別のソーシャルプラットフォームで関連する広告を表示した後で、サイトとやり取りすることもできます。 これらのコンバージョンをFacebookの広告ツールおよびレポートで確認するには、必要なデータをFacebookに送信する必要があります。 このデータには、ダウンロード、登録、「いいね！」、購入などのコンバージョンイベントが含まれる場合があります。

### データ {#data}

既存のクライアント側タグを使用すると、サイトで実行または実行される際に、ユースケースのデータはどうなりますか？ ベンダータグを付けずに、クライアントで必要なデータを取り込むことができるので、イベント転送に送信できますか？ を使用する場合 [タグ](https://experienceleague.adobe.com/docs/experience-platform/tags/home.html) または他のタグ管理システムでは、ほとんどの訪問者のインタラクションデータを収集および配信に使用できます。 しかし、ユースケースに必要なデータは、クライアント側のベンダータグを使用せずに、必要なとき、必要なとき、必要なとき、必要な形式で利用できますか？ その他の考慮すべきデータに関する質問を次に示します。

- すべてのイベントにベンダーユーザー ID が必要ですか？
- その場合、クライアント側タグを使用せずに、どのようにして収集または生成できますか。
- ベンダーは実行時に特にクライアント側コードを必要としますか。
- その他に必要なデータは何ですか？ そのデータはどこから得られますか？

ほとんどのクライアント側ベンダータグは、特定の使用例に対して多くのデータポイントを必要としませんが、これらの評価の際には、使用例と必要なデータをメモしておくと役に立ちます。

## ベンダー API {#vendor-apis}

これで、実装する具体的なユースケース、必要なデータ、ソースから宛先へのイベントのシーケンスがわかりました。 このユースケースがイベント転送に適しているかどうかを判断するために、ベンダー API の詳細を調査できるようになりました。

>[!IMPORTANT]
>
>多くのベンダーはサーバー間転送で API を有効にしていますが、現在、これらの目的に適した API を持っていないベンダーも多数あります。

### API の調査 {#investigate-apis}

ベンダー API エンドポイントを調査するために実行できる手順を以下に示します。

ベンダーは、イベントデータのサーバー間転送を目的として設計された API を持っていますか。 まず、これらの特定の API エンドポイントの要件を見つけます。

- 必要なデータを送信するために API エンドポイントは存在しますか。 使用例をサポートするエンドポイントを見つけるには、ベンダーの開発者または API のドキュメントを参照してください。
- イベントデータのストリーミングを許可していますか、それともバッチデータのみを許可していますか。
- どの認証方法をサポートしていますか？ トークン、HTTP、OAuth クライアント資格情報のバージョン、その他のバージョンは？ 詳しくは、 [ここ](https://experienceleague.adobe.com/docs/experience-platform/tags/event-forwarding/secrets.html) イベント転送でサポートされるメソッドの場合。
- API の更新オフセットは何ですか？ その制限はイベント転送の最小値と互換性がありますか。 詳細 [ここ](https://experienceleague.adobe.com/docs/experience-platform/tags/event-forwarding/secrets.html#:~:text=you%20can%20configure%20the%20Refresh%20Offset%20value%20for%20the%20secret).
- 関連するエンドポイントに必要なデータは何ですか？
- エンドポイントへの呼び出しごとに、ベンダー固有のユーザー識別子が必要か。
- その識別子が必要な場合、クライアント側のコードなしで、どこで、どのように生成または取り込むことができますか。

つまり、

- ベンダーは、アドビのユースケースで必要な API エンドポイントを提供していますか？
- イベント転送に対して互換性のある認証方法を使用しているか。
- イベント転送の実装に必要なすべてのデータに（クライアント側から、または他の API 呼び出しから）アクセスできますか？

これらの質問に対して「はい」と答えられる場合、このタグは、イベント転送プロパティでクライアントからアドビのサーバーに移行するのに適した候補です。

ベンダーがアドビの使用例をサポートする API エンドポイントを持っていない場合、明らかに、ベンダータグは、クライアント側のベンダータグの代わりにイベント転送を使用するのに適した候補ではありません。

API を持っているが、API 呼び出しごとに一意の訪問者 ID やユーザー ID が必要な場合はどうなりますか？ サイトでベンダーのクライアント側コード（タグ）を実行していない場合、どうすればその ID にアクセスできますか？

一部のベンダーは、サードパーティ Cookie を使用せずに新しい世界に合わせてシステムを変更しています。 これらの変更には、代替の一意の識別子 ( [UUID](https://developer.mozilla.org/en-US/docs/Glossary/UUID) またはその他 [顧客生成 ID](https://experienceleague.adobe.com/docs/experience-platform/edge/identity/first-party-device-ids.html). ベンダーが顧客生成 ID を許可している場合、Web または Mobile SDK を使用してクライアントから Platform Edge Network に送信するか、イベント転送の API 呼び出しから取得することができます。 イベント転送ルールでそのベンダーにデータを送信する場合は、必要に応じてその識別子を含めるだけです。

ベンダーが独自のクライアント側タグでのみ生成またはアクセスできるデータ（ベンダー固有の一意の ID など）を必要とする場合、そのベンダータグは移動に適した候補とはならない可能性が高くなります。 _適切な API を使用せずにデータ収集をイベント転送に移動するという考えでクライアント側タグのリバースエンジニアリングを試みることはお勧めしません。_

この [Adobe Experience Platform Cloud Connector](https://experienceleague.adobe.com/docs/experience-platform/tags/extensions/adobe/cloud-connector/overview.html) 拡張機能は、必要に応じて、サーバー間イベントデータ転送に適した API を持つベンダーと共に HTTP リクエストを実行できます。 ベンダー固有の拡張機能は非常に役に立ち、現在、より多くの拡張機能がアクティブな開発中ですが、追加のベンダー拡張機能を待たずに、Cloud Connector 拡張機能を使用して今日のイベント転送ルールを実装できます。

## ツール {#tools}

ベンダー API エンドポイントの調査とテストは、 [Postman](https://www.postman.com/)、または Visual Studio Code などのテキストエディター拡張機能 [Thunder クライアント](https://marketplace.visualstudio.com/items?itemName=rangav.vscode-thunder-client)または [HTTP クライアント](https://marketplace.visualstudio.com/items?itemName=mkloubert.vscode-http-client).

## 次の手順 {#next-steps}

この記事では、ベンダーのクライアント側タグを評価し、イベント転送プロパティでサーバー側に移動する可能性のある一連の手順を説明しました。 関連トピックについて詳しくは、次のリンクを参照してください。

- [タグ管理](https://experienceleague.adobe.com/docs/experience-platform/tags/home.html) Adobe Experience Platform
- [イベント転送](https://experienceleague.adobe.com/docs/experience-platform/tags/event-forwarding/overview.html) （サーバーサイド処理用）
- [用語の更新](https://experienceleague.adobe.com/docs/experience-platform/tags/term-updates.html) データ収集
