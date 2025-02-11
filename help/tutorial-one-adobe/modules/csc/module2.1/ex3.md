---
title: AEM CS 環境のセットアップ
description: AEM CS 環境のセットアップ
kt: 5342
doc-type: tutorial
exl-id: 62715072-0257-4d07-af1a-8becbb793459
source-git-commit: 18151b91d18ebb53fc485151effd12a6fdc2b6b8
workflow-type: tm+mt
source-wordcount: '992'
ht-degree: 1%

---

# 2.1.3 AEM CS 環境のセットアップ

## 2.1.3.1 GitHub リポジトリのセットアップ

[https://github.com](https://github.com){target="_blank"} に移動します。 「**ログイン**」をクリックします。

![AEMCS](./images/aemcssetup1.png){zoomable="yes"}

資格情報を入力します。 「**ログイン**」をクリックします。

![AEMCS](./images/aemcssetup2.png){zoomable="yes"}

ログインすると、GitHub ダッシュボードが表示されます。

![AEMCS](./images/aemcssetup3.png){zoomable="yes"}

[https://github.com/AdobeDevXSC/citisignal-one](https://github.com/AdobeDevXSC/citisignal-one){target="_blank"} に移動します。 その後、これが表示されます。 「**このテンプレートを使用**」をクリックし、「**新しいリポジトリを作成**」をクリックします。

![AEMCS](./images/aemcssetup4.png){zoomable="yes"}

**リポジトリ名** には、`citisignal` を使用します。 表示を **プライベート** に設定します。 **リポジトリを作成** をクリックします。

![AEMCS](./images/aemcssetup5.png){zoomable="yes"}

数秒後に、リポジトリが作成されます。

![AEMCS](./images/aemcssetup6.png){zoomable="yes"}

次に、[https://github.com/apps/aem-code-sync](https://github.com/apps/aem-code-sync){target="_blank"} に移動します。 **設定** をクリックします。

![AEMCS](./images/aemcssetup7.png){zoomable="yes"}

GitHub アカウントをクリックします。

![AEMCS](./images/aemcssetup8.png){zoomable="yes"}

**リポジトリのみを選択** をクリックし、作成したリポジトリを追加します。 次に、「**インストール**」をクリックします。

![AEMCS](./images/aemcssetup9.png){zoomable="yes"}

この確認が表示されます。

![AEMCS](./images/aemcssetup10.png){zoomable="yes"}

## 2.1.3.2 ファイル fstab.yaml の更新

GitHub リポジトリで、をクリックしてファイル `fstab.yaml` を開きます。

![AEMCS](./images/aemcssetup11.png){zoomable="yes"}

**編集** アイコンをクリックします。

![AEMCS](./images/aemcssetup12.png){zoomable="yes"}

ここで、4 行目のフィールド **url** の値を更新する必要があります。

![AEMCS](./images/aemcssetup13.png){zoomable="yes"}

GitHub リポジトリの設定と組み合わせて、特定のAEM CS 環境の URL で現在の値を置き換える必要があります。

URL の現在の値：`https://author-p131639-e1282833.adobeaemcloud.com/bin/franklin.delivery/adobedevxsc/citisignal-one/main`。

URL には、更新が必要な 3 つの部分があります

`https://XXX/bin/franklin.delivery/YYY/ZZZ/main`

XXX はAEM CS オーサー環境の URL に置き換える必要があります。

YYY は GitHub ユーザーアカウントに置き換える必要があります。

ZZZ は、前の演習で使用した GitHub リポジトリの名前に置き換える必要があります。

AEM CS オーサー環境の URL は、[https://my.cloudmanager.adobe.com](https://my.cloudmanager.adobe.com){target="_blank"} で確認できます。 **プログラム** をクリックして開きます。

![AEMCS](./images/aemcs6.png){zoomable="yes"}

次に、「**環境**」タブの 3 つのドット **...** をクリックし、「**詳細を表示**」をクリックします。

![AEMCS](./images/aemcs9.png){zoomable="yes"}

**オーサー** 環境の URL など、環境の詳細が表示されます。 URL をコピーします。

![AEMCS](./images/aemcs10.png){zoomable="yes"}

XXX = `author-p148073-e1511503.adobeaemcloud.com`

GitHub ユーザーアカウント名の場合は、ブラウザーの URL で簡単に見つけることができます。 この例では、ユーザーアカウント名は `woutervangeluwe` です。

YYY = `woutervangeluwe`

![AEMCS](./images/aemcs11.png){zoomable="yes"}

GitHub リポジトリ名については、GitHub で開いたブラウザーウィンドウでも見つけることができます。 この場合、リポジトリ名は `citisignal` です。

ZZZ = `citisignal`

![AEMCS](./images/aemcs12.png){zoomable="yes"}

これらの 3 つの値を組み合わせると、この新しい URL が表示されます。この URL はファイル `fstab.yaml` で設定する必要があります。

`https://author-p148073-e1511503.adobeaemcloud.com/bin/franklin.delivery/woutervangeluwe/citisignal/main`

「**変更をコミット…**」をクリックします。

![AEMCS](./images/aemcs13.png){zoomable="yes"}

「**変更をコミット**」をクリックします。

![AEMCS](./images/aemcs14.png){zoomable="yes"}

ファイル `fstab.yaml` が更新されました。

## 2.1.3.3 CitiSignal アセットのアップロード

[https://my.cloudmanager.adobe.com](https://my.cloudmanager.adobe.com){target="_blank"} に移動します。 **プログラム** をクリックして開きます。

![AEMCS](./images/aemcs6.png){zoomable="yes"}

次に、オーサー環境の URL をクリックします。

![AEMCS](./images/aemcssetup18.png){zoomable="yes"}

**Adobeでログイン** をクリックします。

![AEMCS](./images/aemcssetup19.png){zoomable="yes"}

その後、オーサー環境が表示されます。

![AEMCS](./images/aemcssetup20.png){zoomable="yes"}

URL は次のようになります：`https://author-p148073-e1511503.adobeaemcloud.com/ui#/aem/aem/start.html?appId=aemshell`

次に、AEMの **CRX パッケージマネージャー** 環境にアクセスする必要があります。 それには、URL から `ui#/aem/aem/start.html?appId=aemshell` を削除し、`crx/packmgr` に置き換えます。つまり、URL は次のようになります。
`https://author-p148073-e1511503.adobeaemcloud.com/crx/packmgr`。
**Enter** キーを押して、パッケージマネージャー環境を読み込みます

![AEMCS](./images/aemcssetup22.png){zoomable="yes"}

次に、「**パッケージをアップロード**」をクリックします。

![AEMCS](./images/aemcssetup21.png){zoomable="yes"}

**参照** をクリックして、アップロードするパッケージを探します。

アップロードするパッケージは **citisignal-assets.zip** と呼ばれ、次の場所でダウンロードできます。[https://tech-insiders.s3.us-west-2.amazonaws.com/one-adobe/citisignal-assets.zip](https://tech-insiders.s3.us-west-2.amazonaws.com/one-adobe/citisignal-assets.zip){target="_blank"}

![AEMCS](./images/aemcssetup23.png){zoomable="yes"}

パッケージを選択して **開く** をクリックします。

![AEMCS](./images/aemcssetup24.png){zoomable="yes"}

次に、「**OK**」をクリックします。

![AEMCS](./images/aemcssetup25.png){zoomable="yes"}

その後、パッケージがアップロードされます。

![AEMCS](./images/aemcssetup26.png){zoomable="yes"}

次に、アップロードしたパッケージの **インストール** をクリックします。

![AEMCS](./images/aemcssetup27.png){zoomable="yes"}

**インストール** をクリックします。

![AEMCS](./images/aemcssetup28.png){zoomable="yes"}

数分後、パッケージがインストールされます。

![AEMCS](./images/aemcssetup29.png){zoomable="yes"}

これで、このウィンドウを閉じることができます。


## 2.1.3.4 Publish CitiSignal アセット

[https://my.cloudmanager.adobe.com](https://my.cloudmanager.adobe.com){target="_blank"} に移動します。 **プログラム** をクリックして開きます。

![AEMCS](./images/aemcs6.png){zoomable="yes"}

次に、オーサー環境の URL をクリックします。

![AEMCS](./images/aemcssetup18.png){zoomable="yes"}

**Adobeでログイン** をクリックします。

![AEMCS](./images/aemcssetup19.png){zoomable="yes"}

その後、オーサー環境が表示されます。 **サイト** をクリックします。

![AEMCS](./images/aemcsassets1.png){zoomable="yes"}

**ファイル** をクリックします。

![AEMCS](./images/aemcsassets2.png){zoomable="yes"}

フォルダ **CitiSignal** をクリックして選択し、[ 公開の管理 ]**をクリック** ます。

![AEMCS](./images/aemcsassets3.png){zoomable="yes"}

「**次へ**」をクリックします。

![AEMCS](./images/aemcsassets4.png){zoomable="yes"}

「**公開**」をクリックします。

![AEMCS](./images/aemcsassets5.png){zoomable="yes"}

アセットが公開されました。

## 2.1.3.5 CitiSignal のウェブサイトを作成する

[https://my.cloudmanager.adobe.com](https://my.cloudmanager.adobe.com){target="_blank"} に移動します。 **プログラム** をクリックして開きます。

![AEMCS](./images/aemcs6.png){zoomable="yes"}

次に、オーサー環境の URL をクリックします。

![AEMCS](./images/aemcssetup18.png){zoomable="yes"}

**Adobeでログイン** をクリックします。

![AEMCS](./images/aemcssetup19.png){zoomable="yes"}

その後、オーサー環境が表示されます。 **サイト** をクリックします。

![AEMCS](./images/aemcssetup30.png){zoomable="yes"}

**作成** をクリックし、**テンプレートからのサイト** をクリックします。

![AEMCS](./images/aemcssetup31.png){zoomable="yes"}

**インポート** をクリックします。

![AEMCS](./images/aemcssetup32.png){zoomable="yes"}

次に、事前設定済みのテンプレートをサイトに読み込む必要があります。 テンプレートは [ こちら ](./../../../assets/aem/citisignal-edge-delivery-services-template-0.0.4.zip){target="_blank"} からダウンロードできます。 ファイルをデスクトップに保存します。

次に、ファイル `citisignal-edge-delivery-services-template-0.0.4.zip` を選択し、「**開く** をクリックします。

![AEMCS](./images/aemcssetup33.png){zoomable="yes"}

その後、これが表示されます。 アップロードしたテンプレートをクリックして選択し、「**次へ**」をクリックします。

![AEMCS](./images/aemcssetup34.png){zoomable="yes"}

ここで、いくつかの詳細を入力する必要があります。

- サイトのタイトル：**CitiSignal** を使用
- サイト名：**citisignal-one** を使用
- GitHub URL：以前に使用していた GitHub リポジトリの URL をコピーします

![AEMCS](./images/aemcssetup35.png){zoomable="yes"}

これで完了です。 「**作成**」をクリックします。

![AEMCS](./images/aemcssetup36.png){zoomable="yes"}

現在、サイトを作成しています。 これには数分かかることがあります。 「**OK**」をクリックします。

![AEMCS](./images/aemcssetup37.png){zoomable="yes"}

数分後に画面を更新すると、新しく作成した CitiSignal Web サイトが表示されます。

![AEMCS](./images/aemcssetup38.png){zoomable="yes"}

## 2.1.3.6 Publishシティシグナルのウェブサイト

次に、**CitiSignal** の前にあるチェックボックスをクリックします。 次に、「**公開を管理**」をクリックします。

![AEMCS](./images/aemcssetup39.png){zoomable="yes"}

「**次へ**」をクリックします。

![AEMCS](./images/aemcssetup40.png){zoomable="yes"}

**子を含める設定** をクリックします。

![AEMCS](./images/aemcssetup41.png){zoomable="yes"}

チェックボックス **子を含める** をクリックして選択し、他のチェックボックスをクリックして選択解除します。 「**OK**」をクリックします。

![AEMCS](./images/aemcssetup42.png){zoomable="yes"}

「**公開**」をクリックします。

![AEMCS](./images/aemcssetup43.png){zoomable="yes"}

その後、あなたはここに送り返されます。 **CitiSignal**/**us**/**en** に移動します。 **index** の前にあるチェックボックスをクリックし、「**編集**」をクリックします。

![AEMCS](./images/aemcssetup44.png){zoomable="yes"}

Web サイトは **ユニバーサルエディター** で開きます。

![AEMCS](./images/aemcssetup45.png){zoomable="yes"}

XXX を GitHub ユーザーアカウント（この例では `woutervangeluwe`）に置き換えた後、`main--citisignal--XXX.aem.page/us/en` や `main--citisignal--XXX.aem.live/us/en` に移動して、web サイトにアクセスできるようになりました。

この例では、完全な URL は次のようになります。
`https://main--citisignal--woutervangeluwe.aem.page/us/en` や `https://main--citisignal--woutervangeluwe.aem.live/us/en`。

最初に公開する必要があるので、すべてのアセットが正しく表示されるまでには時間がかかる場合があります。

次の画面が表示されます。

![AEMCS](./images/aemcssetup46.png){zoomable="yes"}

数分後、アセットはすべて正しく読み込まれます。

![AEMCS](./images/aemcssetup47.png){zoomable="yes"}

## 2.1.3.7 テストページのパフォーマンス

[https://pagespeed.web.dev/](https://pagespeed.web.dev/){target="_blank"} に移動します。 URL を入力し、「**分析**」をクリックします。

![AEMCS](./images/aemcssetup48.png){zoomable="yes"}

次に、モバイルとデスクトップの両方のビジュアライゼーションで、web サイトのスコアが高くなることがわかります。

**モバイル**:

![AEMCS](./images/aemcssetup49.png){zoomable="yes"}

**デスクトップ**:

![AEMCS](./images/aemcssetup50.png){zoomable="yes"}

次の手順：[2.1.4 カスタムブロックの設定 ](./ex4.md){target="_blank"}

[ モジュール 2.1 に戻る ](./aemcs.md){target="_blank"}

[ すべてのモジュールに戻る ](./../../../overview.md){target="_blank"}
