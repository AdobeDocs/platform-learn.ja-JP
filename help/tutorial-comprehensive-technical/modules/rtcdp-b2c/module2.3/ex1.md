---
title: Real-time CDP - セグメントを作成してアクションを実行 – セグメントを作成
description: Real-time CDP - セグメントを作成してアクションを実行 – セグメントを作成
kt: 5342
doc-type: tutorial
source-git-commit: 6962a0d37d375e751a05ae99b4f433b0283835d0
workflow-type: tm+mt
source-wordcount: '663'
ht-degree: 2%

---

# 2.3.1 セグメントの作成

この演習では、Adobe Experience Platformのセグメントビルダーを使用してセグメントを作成します。

## 2.3.1.1 コンテキスト

今日の世界では、顧客の行動にリアルタイムで対応する必要があります。 顧客の行動にリアルタイムで対応する方法の 1 つは、セグメントがリアルタイムで適格であるという条件で、セグメントを使用することです。 この演習では、使用している web サイトでの実際のアクティビティを考慮して、セグメントを作成する必要があります。

## 2.3.1.2 反応したい行動を特定する

[https://builder.adobedemo.com/projects](https://builder.adobedemo.com/projects) に移動します。 Adobe IDでログインすると、このが表示されます。 Web サイトプロジェクトをクリックして開きます。

![DSN](./../../../modules/gettingstarted/gettingstarted/images/web8.png)

次のフローに従って、web サイトにアクセスできるようになりました。 **統合** をクリックします。

![DSN](./../../../modules/gettingstarted/gettingstarted/images/web1.png)

**統合** ページでは、演習 0.1 で作成したデータ収集プロパティを選択する必要があります。

![DSN](./../../../modules/gettingstarted/gettingstarted/images/web2.png)

その後、デモ Web サイトが開きます。 URL を選択してクリップボードにコピーします。

![DSN](./../../../modules/gettingstarted/gettingstarted/images/web3.png)

新しい匿名ブラウザーウィンドウを開きます。

![DSN](./../../../modules/gettingstarted/gettingstarted/images/web4.png)

前の手順でコピーしたデモ Web サイトの URL を貼り付けます。 その後、Adobe IDを使用してログインするように求められます。

![DSN](./../../../modules/gettingstarted/gettingstarted/images/web5.png)

アカウントタイプを選択し、ログインプロセスを完了します。

![DSN](./../../../modules/gettingstarted/gettingstarted/images/web6.png)

次に、匿名ブラウザーウィンドウに web サイトが読み込まれます。 デモごとに、新しい匿名ブラウザーウィンドウを使用して、デモ Web サイトの URL を読み込む必要があります。

![DSN](./../../../modules/gettingstarted/gettingstarted/images/web7.png)

この例では、特定の顧客に応答して特定の製品を表示します。
**Luma** のホームページで **Men** に移動し、製品 **PROTEUS FITNESS JACKSHIRT** をクリックします。

![データ取得](./images/homenadia.png)

そのため、誰かが **PROTEUS FITNESS JACKSHIRT** の製品ページにアクセスしたら、アクションを起こすことができるようになります。 アクションを実行する最初のことは、セグメントを定義することです。

![データ取得](./images/homenadiapp.png)

## 2.3.1.3 セグメントの作成

[Adobe Experience Platform](https://experience.adobe.com/platform) に移動します。 ログインすると、Adobe Experience Platformのホームページが表示されます。

![データ取得](./../../../modules/datacollection/module1.2/images/home.png)

続行する前に、**サンドボックス** を選択する必要があります。 選択するサンドボックスの名前は ``--aepSandboxName--`` です。 これを行うには、画面上部の青い線のテキスト **[!UICONTROL 実稼動製品]** をクリックします。 適切な [!UICONTROL  サンドボックス ] を選択すると、画面が変更され、専用の [!UICONTROL  サンドボックス ] が表示されます。

![データ取得](./../../../modules/datacollection/module1.2/images/sb1.png)

左側のメニューで、**セグメント** に移動し、**参照** に移動すると、既存のすべてのセグメントの概要を確認できます。 「**セグメントを作成**」ボタンをクリックして、新しいセグメントの作成を開始します。

![セグメント化](./images/menuseg.png)

前述のように、製品 **PROTEUS FITNESS JACKSHIRT** を表示したすべての顧客からセグメントを構築する必要があります。

このセグメントを作成するには、イベントを追加する必要があります。 **セグメント** メニューバーの「**イベント**」アイコンをクリックすると、すべてのイベントを検索できます。

次に、最上位の **XDM ExperienceEvent** ノードを確認します。

**PROTEUS FITNESS JACKSHIRT** 製品を訪問したお客様を見つけるには、「**XDM ExperienceEvent**」をクリックします。

![セグメント化](./images/findee.png)

**製品リスト項目** までスクロールして、クリックします。

![セグメント化](./images/see.png)

**名前** を選択し、左側の **製品リスト項目** メニューから **名前** オブジェクトをセグメントビルダーキャンバスの「**イベント**」セクションにドラッグ&amp;ドロップします。

![セグメント化](./images/eewebpdtlname1.png)

比較パラメーターは **次に等しい** とし、入力フィールドに「`PROTEUS FITNESS JACKSHIRT`」と入力します。

![セグメント化](./images/pv.png)

**イベントルール** は次のようになります。 セグメントビルダーに要素を追加するたびに、「**推定を更新**」ボタンをクリックして、セグメント内の母集団の新しい推定を取得できます。

![セグメント化](./images/ldap4.png)

最後に、セグメントに名前を付けて保存します。

命名規則として、次を使用します。

- `--aepUserLdap-- - Interest in PROTEUS FITNESS JACKSHIRT`

セグメント名は次のようになります。
`vangeluw - Interest in PROTEUS FITNESS JACKSHIRT`

次に、「**保存して閉じる** ボタンをクリックして、セグメントを保存します。

![セグメント化](./images/segmentname.png)

セグメントの概要ページに戻ります。

![セグメント化](./images/savedsegment.png)

次の手順：[2.3.2 宛先を使用して DV360 の宛先を設定する方法を確認する ](./ex2.md)

[モジュール 2.3 に戻る](./real-time-cdp-build-a-segment-take-action.md)

[すべてのモジュールに戻る](../../../overview.md)
