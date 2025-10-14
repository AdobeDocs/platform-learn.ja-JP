---
title: GenStudio for Performance Marketing Amazon AWS S3 バケットの作成
description: GenStudio for Performance Marketing Amazon AWS S3 バケットの作成
role: Developer
level: Beginner
jira: KT-5342
doc-type: Tutorial
exl-id: 044677e4-7ca3-4dfe-9067-640983681ea7
source-git-commit: 1f9a868c5e4ef4aa0e09d7f5d73a951006ee6c5a
workflow-type: tm+mt
source-wordcount: '502'
ht-degree: 7%

---

# 1.6.2 AWS S3 バケットの作成

## 1.6.2.1 S3 バケットの作成

[https://console.aws.amazon.com](https://console.aws.amazon.com) に移動し、サインインします。

>[!NOTE]
>
>AWS アカウントをまだお持ちでない場合は、個人のメールアドレスを使用して新しいAWS アカウントを作成してください。

![ETL](./images/awshome.png)

ログインすると、**AWS Management Console** にリダイレクトされます。

![ETL](./images/awsconsole.png)

検索バーで、「**s3**」を検索します。 最初の検索結果「**S3 - Scalable Storage in the Cloud**」をクリックします。

![ETL](./images/awsconsoles3.png)

**Amazon S3** ホームページが表示されます。 **バケットを作成** をクリックします。

![ETL](./images/s3home.png)

**バケットを作成** 画面で、`--aepUserLdap---gspem-dam` という名前を使用します。

![ETL](./images/bucketname.png)

他のすべてのデフォルト設定はそのままにしておきます。 下にスクロールして、**バケットを作成** をクリックします。

![ETL](./images/createbucket.png)

その後、バケットが作成され、Amazon S3 のホームページにリダイレクトされます。

![ETL](./images/S3homeb.png)

## S3 バケットにアクセスするための権限の設定

次の手順では、S3 バケットへのアクセスを設定します。

その場合は、[https://console.aws.amazon.com/iam/home](https://console.aws.amazon.com/iam/home) にアクセスしてください。

AWS リソースへのアクセスは、Amazon Identity and Access Management （IAM）によって制御されます。

このページが表示されます。

![ETL](./images/iam.png)

左側のメニューで、「**ユーザー**」をクリックします。 その後、**ユーザー** 画面が表示されます。 **ユーザーを作成** をクリックします。

![ETL](./images/iammenu.png)

次に、ユーザーを設定します。

- ユーザー名：使用 `s3_--aepUserLdap--_gspem_dam`

「**次へ**」をクリックします。

![ETL](./images/configuser.png)

その後、この権限画面が表示されます。 「**ポリシーを直接添付**」をクリックします。

![ETL](./images/perm1.png)

検索語句 **s3** を入力すると、関連するすべての S3 ポリシーが表示されます。 ポリシー **AmazonS3FullAccess** を選択します。 下にスクロールして、「**次へ**」をクリックします。

![ETL](./images/perm2.png)

設定を確認します。 **ユーザーを作成** をクリックします。

![ETL](./images/review.png)

その後、これが表示されます。 **ユーザーを表示** をクリックします。

![ETL](./images/review1.png)

**セキュリティ資格情報** をクリックしてから、**アクセスキーを作成** をクリックします。

![ETL](./images/cred.png)

**AWS以外で実行中のアプリケーション** を選択します。 下にスクロールして、「**次へ**」をクリックします。

![ETL](./images/creda.png)

**アクセスキーを作成** をクリックします

![ETL](./images/credb.png)

その後、これが表示されます。 「**表示**」をクリックして、秘密アクセスキーを表示します。

![ETL](./images/cred1.png)

**秘密アクセスキー** を表示しています。

>[!IMPORTANT]
>
>コンピューターのテキストファイルに資格情報を保存します。
>
> - アクセスキー ID : ...
> - 秘密アクセスキー：...
>
> 「完了 **をクリックすると** 資格情報が再び表示されなくなります。

「**完了**」をクリックします。

![ETL](./images/cred2.png)

これで、AWS S3 バケットが正常に作成され、このバケットにアクセスする権限を持つユーザーが作成されました。

## 1.6.2.2 Assetsを S3 バケットにアップロード

検索バーで、「**s3**」を検索します。 最初の検索結果「**S3 - Scalable Storage in the Cloud**」をクリックします。

![ETL](./images/bucket1.png)

クリックして、新しく作成した S3 バケットを開きます。これは `--aepUserLdap---gspem-dam` という名前にする必要があります。

![ETL](./images/bucket2.png)

**アップロード** をクリックします。

![ETL](./images/bucket3.png)

この画像が表示されます。

![ETL](./images/bucket4.png)

CitiSignal 画像ファイルは [&#x200B; こちら &#x200B;](./images/package.zip){target="_blank"} からダウンロードできます。

ファイルをデスクトップに書き出します。

![ETL](./images/bucket5.png)

**フォルダーを追加** をクリックします。

![ETL](./images/bucket6.png)

ダウンロードフォルダー **package** からフォルダー **assets** を選択します。 **アップロード** をクリックします。

![ETL](./images/bucket7.png)

この画像が表示されます。 もう一度 **フォルダーを追加** をクリックします。

![ETL](./images/bucket8.png)

ダウンロードフォルダー **package** から、フォルダー **サムネール** を選択します。 **アップロード** をクリックします。

![ETL](./images/bucket9.png)

この画像が表示されます。 **アップロード** をクリックします。

![ETL](./images/bucket10.png)

アップロードが完了しました。 「**閉じる**」をクリックします。

![ETL](./images/bucket11.png)

これで、S3 バケットにこのフォルダー構造が作成されました。

![ETL](./images/bucket12.png)

## 次の手順

[&#x200B; 外部 DAM アプリの作成 &#x200B;](./ex3.md){target="_blank"} に移動します。

[GenStudio for Performance Marketing – 拡張機能 &#x200B;](./genstudioext.md){target="_blank"} に戻る

[&#x200B; すべてのモジュール &#x200B;](./../../../overview.md){target="_blank"} に戻る
