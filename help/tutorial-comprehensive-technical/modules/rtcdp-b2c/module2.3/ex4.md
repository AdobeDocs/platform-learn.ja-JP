---
title: Real-time CDP - セグメントを作成してアクションを実行 – セグメントを S3 の宛先に送信します
description: Real-time CDP - セグメントを作成してアクションを実行 – セグメントを S3 の宛先に送信します
kt: 5342
doc-type: tutorial
source-git-commit: 6962a0d37d375e751a05ae99b4f433b0283835d0
workflow-type: tm+mt
source-wordcount: '905'
ht-degree: 5%

---

# 2.3.4 アクションの実行：セグメントを S3 の宛先に送信します

また、Adobe Experience Platformは、Salesforce Marketing Cloud、Oracle Eloqua、Oracle Responsys、Adobe Campaignなどのメールマーケティングの宛先に対してオーディエンスを共有できます。

これらの各メールマーケティングの宛先専用の宛先の一部として FTP または SFTP を使用できます。または、AWS S3 を使用して、Adobe Experience Platformとメールマーケティングの宛先の間で顧客のリストをやり取りできます。

このモジュールでは、AWS S3 バケットを使用して、このような宛先を設定します。

## 2.3.4.1 S3 バケットの作成

[https://console.aws.amazon.com](https://console.aws.amazon.com) に移動し、以前に作成したAmazon アカウントでログインします。

![ETL](./images/awshome.png)

ログインすると、**AWS Management Console** にリダイレクトされます。

![ETL](./images/awsconsole.png)

**サービスを検索** メニューで、**s3** を検索します。 最初の検索結果「**S3 - Scalable Storage in the Cloud**」をクリックします。

![ETL](./images/awsconsoles3.png)

**Amazon S3** ホームページが表示されます。 **バケットを作成** をクリックします。

![ETL](./images/s3home.png)

**バケットを作成** 画面では、次の 2 つを設定する必要があります。

- 名前：名前 `aepmodulertcdp--aepUserLdap--` を使用します。 例えば、この演習では、バケット名は **aepmodulertcdpvangeluw** です。
- 地域：地域 **EU （フランクフルト） eu-central-1** を使用します

![ETL](./images/bucketname.png)

他のすべてのデフォルト設定はそのままにしておきます。 下にスクロールして、**バケットを作成** をクリックします。

![ETL](./images/createbucket.png)

その後、バケットが作成され、Amazon S3 のホームページにリダイレクトされます。

![ETL](./images/S3homeb.png)

## 2.3.4.2 S3 バケットにアクセスする権限の設定

次の手順では、S3 バケットへのアクセスを設定します。

その場合は、[https://console.aws.amazon.com/iam/home](https://console.aws.amazon.com/iam/home) にアクセスしてください。

AWS リソースへのアクセスは、Amazon Identity and Access Management （IAM）によって制御されます。

このページが表示されます。

![ETL](./images/iam.png)

左側のメニューで、「**ユーザー**」をクリックします。 その後、**ユーザー** 画面が表示されます。 「**ユーザーを追加**」をクリックします。

![ETL](./images/iammenu.png)

次に、ユーザーを設定します。

- ユーザー名：`s3_--aepUserLdap--_rtcdp` を名前として使用します。この例では、名前は `s3_vangeluw_rtcdp` です。
- AWSのアクセスタイプ：「**アクセスキー – プログラムによるアクセス**」を選択します。

**次へ：権限** をクリックします。

![ETL](./images/configuser.png)

その後、この権限画面が表示されます。 「**既存のポリシーを直接添付**」をクリックします。

![ETL](./images/perm1.png)

検索語句 **s3** を入力すると、関連するすべての S3 ポリシーが表示されます。 ポリシー **AmazonS3FullAccess** を選択します。 **次へ：タグ** をクリックします。

![ETL](./images/perm2.png)

**タグ** 画面では、何も設定する必要はありません。 「**次へ：レビュー**」をクリックします。

![ETL](./images/perm3.png)

設定を確認します。 **ユーザーを作成** をクリックします。

![ETL](./images/review.png)

これでユーザーが作成され、S3 環境にアクセスするための資格情報が表示されます。 資格情報は今回のみ表示されますので、書き留めてください。

![ETL](./images/cred.png)

「**表示**」をクリックして、秘密アクセスキーを表示します。

![ETL](./images/cred1.png)

>[!IMPORTANT]
>
>コンピューターのテキストファイルに資格情報を保存します。
>
> - アクセスキー ID : ...
> - 秘密アクセスキー：...
>
> **閉じる** をクリックすると、資格情報が再び表示されることはありません。

「**閉じる**」をクリックします。

![ETL](./images/close.png)

これで、AWS S3 バケットが正常に作成され、このバケットにアクセスする権限を持つユーザーが作成されました。

## 2.3.4.3 Adobe Experience Platformでの出力先の設定

[Adobe Experience Platform](https://experience.adobe.com/platform) に移動します。 ログインすると、Adobe Experience Platformのホームページが表示されます。

![データ取得](./../../../modules/datacollection/module1.2/images/home.png)

続行する前に、**サンドボックス** を選択する必要があります。 選択するサンドボックスの名前は ``--aepSandboxName--`` です。 これを行うには、画面上部の青い線のテキスト **[!UICONTROL 実稼動製品]** をクリックします。 適切な [!UICONTROL  サンドボックス ] を選択すると、画面が変更され、専用の [!UICONTROL  サンドボックス ] が表示されます。

![データ取得](./../../../modules/datacollection/module1.2/images/sb1.png)

左側のメニューで **宛先** に移動し、**カタログ** に移動します。 **宛先カタログ** が表示されます。

![RTCDP](./images/rtcdpmenudest.png)

**クラウドストレージ** をクリックし、**Amazon S3** カードの **設定** ボタン（または、お使いの環境に応じて **セグメントのアクティブ化** をクリックします。

![RTCDP](./images/rtcdp2.png)

環境によっては、「**+新しい宛先を設定」をクリックして** 宛先の作成を開始する必要があります。

![RTCDP](./images/rtcdp2a.png)

アカウントタイプとして **新規アカウント** を選択します。 前の手順で付与された S3 資格情報を使用してください。

| アクセスキー ID | シークレットアクセスキー |
|:-----------------------:| :-----------------------:|
| アキア… | Cm5Ln..... |

**宛先に接続** をクリックします。

![RTCDP](./images/rtcdpsfs3.png)

その後、この宛先が接続されたことを示す視覚的な確認が表示されます。

![RTCDP](./images/rtcdpsfs3connected.png)

Adobe Experience Platformが S3 バケットに接続できるように、名前とフォルダーを指定する必要があります。

命名規則として、次を使用してください。

| アクセスキー ID | シークレットアクセスキー |
|:-----------------------:| :-----------------------:|
| 名前 | `AWS - S3 - --aepUserLdap--` |
| 説明 | `AWS - S3 - --aepUserLdap--` |
| バケット名 | `aepmodulertcdp--aepUserLdap--` |
| フォルダーパス | / |

「**次へ**」をクリックします。

![RTCDP](./images/rtcdpsfs3connect2.png)

オプションで、新しい宛先にデータガバナンスポリシーを添付できるようになりました。 「**次へ**」をクリックします。

![RTCDP](./images/rtcdpsfs3connect2gov.png)

セグメントのリストで、演習 1 で作成したセグメントを検索して選択します。 「**次へ**」をクリックします。

![RTCDP](./images/s3a.png)

その後、これが表示されます。 必要に応じて、**鉛筆** アイコンをクリックしてスケジュールを編集できます。 **スケジュールを作成**.

![RTCDP](./images/s3bb.png)

選択したスケジュールを定義します。 「**増分ファイルのエクスポート**」を選択し、頻度を **1 時間ごと****3 時間ごと** に設定します。 「**作成**」をクリックします。

![RTCDP](./images/s3bbc.png)

これで完了です。 「**次へ**」をクリックします。

![RTCDP](./images/s3bbca.png)

AWS S3 に書き出す属性を選択できるようになりました。 「**新しいフィールドを追加**」をクリックし、フィールド `--aepTenantId--.identification.core.ecid` が追加され、**重複排除キー** としてマークされていることを確認します。

オプションで、他のフィールドを必要な数だけ追加できます。

すべてのフィールドを追加したら、「**次へ**」をクリックします。

![RTCDP](./images/s3c.png)

設定を確認します。 「**終了**」をクリックして、設定を終了します。

![RTCDP](./images/s3g.png)

その後、宛先のアクティベーション画面に戻り、この宛先に追加されたセグメントが表示されます。

![RTCDP](./images/s3j.png)

セグメントの書き出しをさらに追加する場合は、「**セグメントをアクティブ化**」をクリックしてプロセスを再開し、さらにセグメントを追加します。

![RTCDP](./images/s3k.png)

次の手順：[2.3.5 対策を講じる：セグメントをAdobe Targetに送信し ](./ex5.md) す。

[モジュール 2.3 に戻る](./real-time-cdp-build-a-segment-take-action.md)

[すべてのモジュールに戻る](../../../overview.md)
