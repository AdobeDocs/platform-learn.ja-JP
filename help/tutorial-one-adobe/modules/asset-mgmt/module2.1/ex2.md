---
title: AEM CS 環境のセットアップ
description: AEM CS 環境のセットアップ
kt: 5342
doc-type: tutorial
exl-id: 62715072-0257-4d07-af1a-8becbb793459
source-git-commit: 15adbf950115f0b6bb6613e69a60b310f25de058
workflow-type: tm+mt
source-wordcount: '1178'
ht-degree: 1%

---

# 1.1.2 AEM CS 環境のセットアップ

## 1.1.2.1 GitHub リポジトリの設定

[https://github.com](https://github.com){target="_blank"} に移動します。 「**ログイン**」をクリックします。

![AEMCS](./images/aemcssetup1.png)

資格情報を入力します。 「**ログイン**」をクリックします。

![AEMCS](./images/aemcssetup2.png)

ログインすると、GitHub ダッシュボードが表示されます。

![AEMCS](./images/aemcssetup3.png)

[https://github.com/adobe-rnd/aem-boilerplate-xcom](https://github.com/adobe-rnd/aem-boilerplate-xcom){target="_blank"} に移動します。 その後、これが表示されます。 「**このテンプレートを使用**」をクリックし、「**新しいリポジトリを作成**」をクリックします。

![AEMCS](./images/aemcssetup4.png)

**リポジトリ名** には、`citisignal-aem-accs` を使用します。 表示を **プライベート** に設定します。 **リポジトリを作成** をクリックします。

![AEMCS](./images/aemcssetup5.png)

数秒後に、リポジトリが作成されます。

![AEMCS](./images/aemcssetup6.png)

次に、[https://github.com/apps/aem-code-sync](https://github.com/apps/aem-code-sync){target="_blank"} に移動します。 **インストール** または **設定** をクリックします。

![AEMCS](./images/aemcssetup7.png)

GitHub ユーザーアカウントの横にある **続行** ボタンをクリックします。

![AEMCS](./images/aemcssetup8.png)

GitHub ユーザーアカウントの横にある **設定** をクリックします。

![AEMCS](./images/aemcssetup8a.png)

**リポジトリのみを選択** をクリックし、作成したリポジトリを追加します。

![AEMCS](./images/aemcssetup9.png)

下にスクロールして、「**保存**」をクリックします。

![AEMCS](./images/aemcssetup9a.png)

この確認が表示されます。

![AEMCS](./images/aemcssetup10.png)

## 1.1.2.2 更新ファイル fstab.yaml

GitHub リポジトリで、をクリックしてファイル `fstab.yaml` を開きます。

![AEMCS](./images/aemcssetup11.png)

**編集** アイコンをクリックします。

![AEMCS](./images/aemcssetup12.png)

ここで、3 行目のフィールド **url** の値を更新する必要があります。

![AEMCS](./images/aemcssetup13.png)

GitHub リポジトリの設定と組み合わせて、特定のAEM Sites CS 環境の URL で現在の値を置き換える必要があります。

URL の現在の値：`https://author-p130360-e1272151.adobeaemcloud.com/bin/franklin.delivery/adobe-rnd/aem-boilerplate-xcom/main`。

URL には、更新が必要な 3 つの部分があります

`https://XXX/bin/franklin.delivery/YYY/ZZZ/main`

XXX は、AEM CS オーサー環境の URL に置き換える必要があります。

YYY は GitHub ユーザーアカウントに置き換える必要があります。

ZZZ は、前の演習で使用した GitHub リポジトリの名前に置き換える必要があります。

AEM CS オーサー環境の URL は、[https://my.cloudmanager.adobe.com](https://my.cloudmanager.adobe.com){target="_blank"} で確認できます。 **プログラム** をクリックして開きます。

![AEMCS](./images/aemcs6.png)

次に、「**環境**」タブの 3 つのドット **...** をクリックし、「**詳細を表示**」をクリックします。

![AEMCS](./images/aemcs9.png)

**オーサー** 環境の URL など、環境の詳細が表示されます。 URL をコピーします。

![AEMCS](./images/aemcs10.png)

XXX = `author-p166717-e1786231.adobeaemcloud.com`

GitHub ユーザーアカウント名の場合は、ブラウザーの URL で簡単に見つけることができます。 この例では、ユーザーアカウント名は `woutervangeluwe` です。

YYY = `woutervangeluwe`

![AEMCS](./images/aemcs11.png)

GitHub リポジトリ名については、GitHub で開いたブラウザーウィンドウでも見つけることができます。 この場合、リポジトリ名は `citisignal` です。

ZZZ = `citisignal-aem-accs`

![AEMCS](./images/aemcs12.png)

これらの 3 つの値を組み合わせると、この新しい URL が表示されます。この URL はファイル `fstab.yaml` で設定する必要があります。

`https://author-p166717-e1786231.adobeaemcloud.com/bin/franklin.delivery/woutervangeluwe/citisignal-aem-accs/main`

「**変更をコミット…**」をクリックします。

![AEMCS](./images/aemcs13.png)

「**変更をコミット**」をクリックします。

![AEMCS](./images/aemcs14.png)

ファイル `fstab.yaml` が更新されました。

## 1.1.2.3 CitiSignal アセットおよびサイトのアップロード

[https://my.cloudmanager.adobe.com](https://my.cloudmanager.adobe.com){target="_blank"} に移動します。 **プログラム** をクリックして開きます。

![AEMCS](./images/aemcs6.png)

次に、オーサー環境の URL をクリックします。

![AEMCS](./images/aemcssetup18.png)

**Adobeでログイン** をクリックします。

![AEMCS](./images/aemcssetup19.png)

その後、オーサー環境が表示されます。

![AEMCS](./images/aemcssetup20.png)

URL は次のようになります：`https://author-p166717-e1786231.adobeaemcloud.com/ui#/aem/aem/start.html?appId=aemshell`

次に、AEMの **CRX パッケージマネージャー** 環境にアクセスする必要があります。 それには、URL から `ui#/aem/aem/start.html?appId=aemshell` を削除し、`crx/packmgr` に置き換えます。つまり、URL は次のようになります。
`https://author-p166717-e1786231.adobeaemcloud.com/crx/packmgr`。
**Enter** キーを押して、パッケージマネージャー環境を読み込みます

![AEMCS](./images/aemcssetup22.png)

次に、「**パッケージをアップロード**」をクリックします。

![AEMCS](./images/aemcssetup21.png)

**参照** をクリックして、アップロードするパッケージを探します。

アップロードするパッケージは **citisignal-assets.zip** と呼ばれ、次の場所でダウンロードできます。[https://one-adobe-tech-insiders.s3.us-west-2.amazonaws.com/one-adobe/citisignal_aem_accs.zip](https://one-adobe-tech-insiders.s3.us-west-2.amazonaws.com/one-adobe/citisignal_aem_accs.zip){target="_blank"}

![AEMCS](./images/aemcssetup23.png)

パッケージ `citisignal_aem_accs.zip` を選択し、「**開く** をクリックします。

![AEMCS](./images/aemcssetup24.png)

次に、「**OK**」をクリックします。

![AEMCS](./images/aemcssetup25.png)

その後、パッケージがアップロードされます。 次に、アップロードしたパッケージの **インストール** をクリックします。

![AEMCS](./images/aemcssetup27.png)

**インストール** をクリックします。

![AEMCS](./images/aemcssetup28.png)

数分後、パッケージがインストールされます。

![AEMCS](./images/aemcssetup29.png)

これで、このウィンドウを閉じることができます。

## CitiSignal アセッ 1.1.2.4 の公開

[https://my.cloudmanager.adobe.com](https://my.cloudmanager.adobe.com){target="_blank"} に移動します。 **プログラム** をクリックして開きます。

![AEMCS](./images/aemcs6.png)

次に、オーサー環境の URL をクリックします。

![AEMCS](./images/aemcssetup18.png)

**Adobeでログイン** をクリックします。

![AEMCS](./images/aemcssetup19.png)

その後、オーサー環境が表示されます。 **Assets** をクリックします。

![AEMCS](./images/aemcsassets1.png)

**ファイル** をクリックします。

![AEMCS](./images/aemcsassets2.png)

フォルダ **CitiSignal** をクリックして選択し、[ 公開の管理 ]&#x200B;**をクリック** ます。

![AEMCS](./images/aemcsassets3.png)

「**次へ**」をクリックします。

![AEMCS](./images/aemcsassets4.png)

「**公開**」をクリックします。

![AEMCS](./images/aemcsassets5.png)

アセットが公開されました。

## 1.1.2.5 CitiSignal web サイトの公開

画面の左上隅にある **Adobe Experience Manager** の商品名をクリックし、**Assets** の横にある **矢印** をクリックします。

![AEMCS](./images/aemcssetup30a.png)

次に、「**サイト**」をクリックします。

![AEMCS](./images/aemcssetup30.png)

その後、パッケージをインストールする前に作成した **CitiSignal** web サイトが表示されます。

![AEMCS](./images/aemcssetup31.png)

以前に作成した GitHub リポジトリにサイトをリンクするには、**Edge Delivery Services Configuration** を作成する必要があります。

その最初の手順は、**クラウド設定** を作成することです。

これを行うには、画面の左上隅にある **Adobe Experience Manager** の製品名をクリックし、**ツール** アイコンをクリックして **一般** を選択します。 **設定ブラウザー** をクリックして開きます。

![AEMCS](./images/aemcssetup31a.png)

この画像が表示されます。 **作成** をクリックします。

![AEMCS](./images/aemcssetup31b.png)

「**タイトル**」フィールドと「**名前**」フィールドを `CitiSignal` に設定します。 **クラウド設定** のチェックボックスを有効にします。

「**作成**」をクリックします。

![AEMCS](./images/aemcssetup31c.png)

これで完了です。

![AEMCS](./images/aemcssetup31d.png)

次に、作成した **クラウド設定** のいくつかのフィールドを更新する必要があります。

これを行うには、画面の左上隅にある **Adobe Experience Manager** の製品名をクリックし、「**ツール**」アイコンをクリックして「**クラウドサービス**」を選択します。 クリックして、**Edge Delivery Services Configuration** を開きます。

![AEMCS](./images/aemcssetup32.png)

**CitiSignal** を選択し、**作成** をクリックして、**設定** を選択します。

![AEMCS](./images/aemcssetup31e.png)

ここで、「組織」フィールドと **サイト名** フィールドに入力する必要が **り** す。 これをおこなうには、まず GitHub リポジトリの URL を参照します。

![AEMCS](./images/aemcssetup31f.png)

- **組織**:GitHub 組織名を使用します。この例では、`woutervangeluwe` です
- **サイト名**:GitHub リポジトリの名前を使用します。この名前は `citisignal-aem-accs` にする必要があります。

**保存して閉じる** をクリックします。

![AEMCS](./images/aemcssetup33.png)

これで完了です。 新しく作成したEdge Cloud Configuration の前にあるチェックボックスを有効にし、「**公開**」をクリックします。

![AEMCS](./images/aemcssetup34.png)

## 1.1.2.6 ファイル paths.json の更新

GitHub リポジトリで、をクリックしてファイル `paths.json` を開きます。

![AEMCS](./images/aemcssetupjson1.png)

**編集** アイコンをクリックします。

![AEMCS](./images/aemcssetupjson2.png)

次に、3、4、5、6、7、10 行目の `aem-boilerplate-commerce` で、置き換えテキスト `CitiSignal` を更新する必要があります。

「**変更をコミット**」をクリックします。

![AEMCS](./images/aemcssetupjson3.png)

「**変更をコミット**」をクリックします。

![AEMCS](./images/aemcssetupjson4.png)

ファイル `paths.json` が更新されました。

## 1.1.2.7 CitiSignal web サイトの公開

画面左上隅の商品名 **0&rbrace;Adobe Experience Manager&rbrace; をクリックし、「** Sites **」を選択します。**

![AEMCS](./images/aemcssetup38.png)

次に、**CitiSignal** の前にあるチェックボックスをクリックします。 次に、「**公開を管理**」をクリックします。

![AEMCS](./images/aemcssetup39.png)

「**次へ**」をクリックします。

![AEMCS](./images/aemcssetup40.png)

**子を含める設定** をクリックします。

![AEMCS](./images/aemcssetup41.png)

チェックボックス **子を含める** をクリックして選択し、他のチェックボックスをクリックして選択解除します。 「**OK**」をクリックします。

![AEMCS](./images/aemcssetup42.png)

「**公開**」をクリックします。

![AEMCS](./images/aemcssetup43.png)

その後、あなたはここに送り返されます。 **CitiSignal** をクリックし、**index** の前にあるチェックボックスを選択して、**編集** をクリックします。

![AEMCS](./images/aemcssetup44.png)

Web サイトは **ユニバーサルエディター** で開きます。

![AEMCS](./images/aemcssetup45.png)

XXX を GitHub ユーザーアカウント（この例では `main--citisignal-aem-accs--XXX.aem.page`）に置き換えた後、`main--citisignal-aem-accs--XXX.aem.live` や `woutervangeluwe` に移動して、web サイトにアクセスできるようになりました。

この例では、完全な URL は次のようになります。
`https://main--citisignal-aem-accs--woutervangeluwe.aem.page` や `https://main--citisignal-aem-accs--woutervangeluwe.aem.live`。

最初に公開する必要があるので、すべてのアセットが正しく表示されるまでには時間がかかる場合があります。

次の画面が表示されます。

![AEMCS](./images/aemcssetup46.png)

## 1.1.2.8 テストページのパフォーマンス

[https://pagespeed.web.dev/](https://pagespeed.web.dev/){target="_blank"} に移動します。 URL を入力し、「**分析**」をクリックします。

![AEMCS](./images/aemcssetup48.png)

次に、モバイルとデスクトップの両方のビジュアライゼーションで、web サイトのスコアが高くなることがわかります。

**モバイル**:

![AEMCS](./images/aemcssetup49.png)

**デスクトップ**:

![AEMCS](./images/aemcssetup50.png)

次の手順：[ カスタムブロックの開発 ](./ex3.md){target="_blank"}

[Adobe Experience Manager Cloud ServiceとEdge Delivery Services](./aemcs.md){target="_blank"} に戻る

[ すべてのモジュールに戻る ](./../../../overview.md){target="_blank"}
