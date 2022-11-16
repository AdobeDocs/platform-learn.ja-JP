---
title: リアルタイム CDP — セグメントを構築してアクションを実行する — S3 宛先にセグメントを送信する
description: リアルタイム CDP — セグメントを構築してアクションを実行する — S3 宛先にセグメントを送信する
kt: 5342
audience: Data Architect, Orchestration Engineer, Marketer
doc-type: tutorial
activity: develop
exl-id: 5b0bcd69-7131-48a3-bd3e-773ba95cc42b
source-git-commit: cc7a77c4dd380ae1bc23dc75608e8e2224dfe78c
workflow-type: tm+mt
source-wordcount: '909'
ht-degree: 4%

---

# 6.4 措置をとる：セグメントを S3 の宛先に送信する

また、Adobe Experience Platformは、SalesforceMarketing Cloud、OracleEloqua、OracleResponsys、Adobe Campaignなどの電子メールマーケティングの宛先に対してオーディエンスを共有できます。

これらの各電子メールマーケティングの宛先の専用の宛先の一部として FTP または SFTP を使用するか、AWS S3 を使用してAdobe Experience Platformとこれらの電子メールマーケティングの宛先との間で顧客のリストを交換できます。

このモジュールでは、AWS S3 バケットを使用して、このような宛先を設定します。

## 6.4.1 S3 バケットの作成

に移動します。 [https://console.aws.amazon.com](https://console.aws.amazon.com) 前に作成したAmazonアカウントでログインします。

![ETL](./images/awshome.png)

ログイン後、 **AWS Management Console**.

![ETL](./images/awsconsole.png)

内 **サービスを検索** メニュー、検索 **s3**. 最初の検索結果をクリックします。 **S3 — クラウド内のスケーラブルストレージ**.

![ETL](./images/awsconsoles3.png)

次に、 **Amazon S3** homepage. クリック **バケットを作成**.

![ETL](./images/s3home.png)

内 **バケットを作成** 画面では、次の 2 つを設定する必要があります。

- 名前：名前を使用 `aepmodulertcdp--demoProfileLdap--`. 例えば、この演習では、バケット名はです。 **aepmodulertcdpvangeluw**
- 地域：地域を使用 **EU （フランクフルト） eu-central-1**

![ETL](./images/bucketname.png)

その他のデフォルト設定は、そのままにします。 下にスクロールして、 **バケットを作成**.

![ETL](./images/createbucket.png)

バケットが作成され、Amazon S3 のホームページにリダイレクトされます。

![ETL](./images/S3homeb.png)

## 6.4.2 S3 バケットにアクセスする権限の設定

次の手順では、S3 バケットへのアクセスを設定します。

それには、に移動します。 [https://console.aws.amazon.com/iam/home](https://console.aws.amazon.com/iam/home).

AWSリソースへのアクセスは、Amazon Identity and Access Management(IAM) によって制御されます。

これで、このページが表示されます。

![ETL](./images/iam.png)

左側のメニューで、 **ユーザー**. 次に、 **ユーザー** 画面 クリック **ユーザーを追加**.

![ETL](./images/iammenu.png)

次に、ユーザーを設定します。

- ユーザー名：use `s3_--demoProfileLdap--_rtcdp` 名前として、この例では、名前は `s3_vangeluw_rtcdp`.
- AWSのアクセスタイプ：選択 **アクセスキー — プログラムによるアクセス**.

クリック **次へ：権限**.

![ETL](./images/configuser.png)

次に、この権限設定画面が表示されます。 クリック **既存のポリシーを直接添付**.

![ETL](./images/perm1.png)

検索語句を入力 **s3** 関連するすべての S3 ポリシーを表示します。 ポリシーを選択 **AmazonS3FullAccess**. クリック **次へ：タグ**.

![ETL](./images/perm2.png)

の **タグ** 画面が表示されたら、何も設定する必要はありません。 クリック **次へ：レビュー**.

![ETL](./images/perm3.png)

設定を確認します。 「**ユーザーを作成**」をクリックします。

![ETL](./images/review.png)

これでユーザーが作成され、S3 環境にアクセスするための資格情報が表示されます。 認証情報は、この時点でしか表示されません。記録してください。

![ETL](./images/cred.png)

クリック **表示** 秘密鍵を確認するには、次の手順を実行します。

![ETL](./images/cred1.png)

>[!IMPORTANT]
>
>資格情報をコンピューターのテキストファイルに保存します。
>
> - アクセスキー ID :...
> - 秘密アクセスキー：...
>
> 次に **閉じる** 認証情報は二度と表示されません。

「**閉じる**」をクリックします。

![ETL](./images/close.png)

これで、AWS S3 バケットが正常に作成され、このバケットにアクセスする権限を持つユーザーが作成されました。

## 6.4.3 Adobe Experience Platformでの宛先の設定

に移動します。 [Adobe Experience Platform](https://experience.adobe.com/platform). ログイン後、Adobe Experience Platformのホームページに移動します。

![データ取得](../module2/images/home.png)

続行する前に、 **サンドボックス**. 選択するサンドボックスの名前はです ``--aepSandboxId--``. これを行うには、 **[!UICONTROL 実稼動版]** 画面の上の青い線で表示されます。 適切な [!UICONTROL サンドボックス]画面が変更され、専用の [!UICONTROL サンドボックス].

![データ取得](../module2/images/sb1.png)

左側のメニューで、に移動します。 **宛先**&#x200B;を選択し、 **カタログ**. 次に、 **宛先カタログ**.

![RTCDP](./images/rtcdpmenudest.png)

クリック **クラウドストレージ**」、「 **設定** ボタン ( または **セグメントのアクティブ化**（環境に応じて） **Amazon S3** カード。

![RTCDP](./images/rtcdp2.png)

環境によっては、 **+新しい宛先を設定** をクリックして、宛先の作成を開始します。

![RTCDP](./images/rtcdp2a.png)

選択 **新規アカウント** をアカウントタイプとして設定します。 前の手順で指定した S3 資格情報を使用してください。

| アクセスキー ID | 秘密アクセスキー |
|:-----------------------:| :-----------------------:|
| アキア…... | Cm5Ln...... |

クリック **宛先に接続**.

![RTCDP](./images/rtcdpsfs3.png)

この宛先が接続されたことを示す視覚的な確認が表示されます。

![RTCDP](./images/rtcdpsfs3connected.png)

Adobe Experience Platformが S3 バケットに接続できるように、名前とフォルダーを指定する必要があります。

命名規則として、次を使用してください。

| アクセスキー ID | 秘密アクセスキー |
|:-----------------------:| :-----------------------:|
| 名前 | `AWS - S3 - --demoProfileLdap--` |
| 説明 | `AWS - S3 - --demoProfileLdap--` |
| バケット名 | `aepmodulertcdp--demoProfileLdap--` |
| フォルダーパス | / |

「**次へ**」をクリックします。

![RTCDP](./images/rtcdpsfs3connect2.png)

オプションで、新しい宛先にデータガバナンスポリシーを添付できるようになりました。 「**次へ**」をクリックします。

![RTCDP](./images/rtcdpsfs3connect2gov.png)

セグメントのリストで、演習 1 で作成したセグメントを検索して選択します。 「**次へ**」をクリックします。

![RTCDP](./images/s3a.png)

これが見えます 必要に応じて、 **鉛筆** アイコン **スケジュールを作成**.

![RTCDP](./images/s3bb.png)

選択するスケジュールを定義します。 選択 **増分ファイルの書き出し** 頻度を **毎時** 毎 **3 時間**. 「**作成**」をクリックします。

![RTCDP](./images/s3bbc.png)

その後、これを取得します。 「**次へ**」をクリックします。

![RTCDP](./images/s3bbca.png)

AWS S3 への書き出しの属性を選択できるようになりました。 クリック **新しいフィールドを追加** フィールドを確認します。 `--aepTenantId--.identification.core.ecid` が追加され、 **重複排除キー**.

必要に応じて、他のフィールドを必要な数だけ追加できます。

すべてのフィールドを追加したら、「 **次へ**.

![RTCDP](./images/s3c.png)

設定を確認します。 クリック **完了** をクリックして設定を完了します。

![RTCDP](./images/s3g.png)

その後、宛先のアクティベーション画面に戻り、セグメントがこの宛先に追加されたのが表示されます。

![RTCDP](./images/s3j.png)

セグメントエクスポートをさらに追加する場合は、 **セグメントのアクティブ化** をクリックして、プロセスを再起動し、さらにセグメントを追加します。

![RTCDP](./images/s3k.png)

次のステップ： [6.5 措置をとる：セグメントをAdobe Targetに送信](./ex5.md)

[モジュール 6 に戻る](./real-time-cdp-build-a-segment-take-action.md)

[すべてのモジュールに戻る](../../overview.md)
