---
title: AEM CS 環境のセットアップ
description: AEM CS 環境のセットアップ
kt: 5342
doc-type: tutorial
exl-id: 62715072-0257-4d07-af1a-8becbb793459
source-git-commit: 7537cd4d4ca6bc25afcb8f61a736498b0c297850
workflow-type: tm+mt
source-wordcount: '1045'
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

## 1.1.2.3 CitiSignal アセットのアップロード

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

アップロードするパッケージは **citisignal-assets.zip** と呼ばれ、次の場所でダウンロードできます。[https://tech-insiders.s3.us-west-2.amazonaws.com/one-adobe/citisignal-assets.zip](https://tech-insiders.s3.us-west-2.amazonaws.com/one-adobe/citisignal-assets.zip){target="_blank"}

![AEMCS](./images/aemcssetup23.png)

パッケージを選択して **開く** をクリックします。

![AEMCS](./images/aemcssetup24.png)

次に、「**OK**」をクリックします。

![AEMCS](./images/aemcssetup25.png)

その後、パッケージがアップロードされます。

![AEMCS](./images/aemcssetup26.png)

次に、アップロードしたパッケージの **インストール** をクリックします。

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

フォルダ **CitiSignal** をクリックして選択し、[ 公開の管理 ]**をクリック** ます。

![AEMCS](./images/aemcsassets3.png)

「**次へ**」をクリックします。

![AEMCS](./images/aemcsassets4.png)

「**公開**」をクリックします。

![AEMCS](./images/aemcsassets5.png)

アセットが公開されました。

## 1.1.2.5 Create CitiSignal web サイト

[https://my.cloudmanager.adobe.com](https://my.cloudmanager.adobe.com){target="_blank"} に移動します。 **プログラム** をクリックして開きます。

![AEMCS](./images/aemcs6.png)

次に、オーサー環境の URL をクリックします。

![AEMCS](./images/aemcssetup18.png)

**Adobeでログイン** をクリックします。

![AEMCS](./images/aemcssetup19.png)

その後、オーサー環境が表示されます。 **サイト** をクリックします。

![AEMCS](./images/aemcssetup30.png)

**作成** をクリックし、**テンプレートからのサイト** をクリックします。

![AEMCS](./images/aemcssetup31.png)

**インポート** をクリックします。

![AEMCS](./images/aemcssetup32.png)

次に、事前設定済みのテンプレートをサイトに読み込む必要があります。 テンプレートは [ こちら ](./../../../assets/aem/citisignal-aem-sites-commerce-with-edge-delivery-services-template-0.4.0.zip){target="_blank"} からダウンロードできます。 ファイルをデスクトップに保存します。

次に、ファイル `citisignal-aem-sites-commerce-with-edge-delivery-services-template-0.4.0.zip` を選択し、「**開く** をクリックします。

![AEMCS](./images/aemcssetup33.png)

その後、これが表示されます。 アップロードしたテンプレートをクリックして選択し、「**次へ**」をクリックします。

![AEMCS](./images/aemcssetup34.png)

ここで、いくつかの詳細を入力する必要があります。

- サイトのタイトル：**CitiSignal** を使用
- サイト名：**CitiSignal** を使用
- GitHub URL：以前に使用していた GitHub リポジトリの URL をコピーします

![AEMCS](./images/aemcssetup35.png)

これで完了です。 「**作成**」をクリックします。

![AEMCS](./images/aemcssetup36.png)

現在、サイトを作成しています。 これには数分かかることがあります。 「**OK**」をクリックします。

![AEMCS](./images/aemcssetup37.png)

数分後に画面を更新すると、新しく作成した CitiSignal Web サイトが表示されます。

![AEMCS](./images/aemcssetup38.png)

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

次の手順：[ カスタムブロックの開発 ](./ex4.md){target="_blank"}

[Adobe Experience Manager Cloud ServiceとEdge Delivery Services](./aemcs.md){target="_blank"} に戻る

[ すべてのモジュールに戻る ](./../../../overview.md){target="_blank"}
