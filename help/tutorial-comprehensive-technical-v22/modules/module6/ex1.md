---
title: リアルタイム CDP — セグメントの構築とアクション — セグメントの構築
description: リアルタイム CDP — セグメントの構築とアクション — セグメントの構築
kt: 5342
audience: Data Architect, Orchestration Engineer, Marketer
doc-type: tutorial
activity: develop
exl-id: c0778e81-4282-433d-9e02-37e32bf370ef
source-git-commit: cc7a77c4dd380ae1bc23dc75608e8e2224dfe78c
workflow-type: tm+mt
source-wordcount: '660'
ht-degree: 2%

---

# 6.1 セグメントの作成

この演習では、Adobe Experience Platformのセグメントビルダーを使用してセグメントを作成します。

## 6.1.1 コンテキスト

今日の世界では、顧客の行動に対応するには、リアルタイムが必要です。 リアルタイムで顧客の行動に対応する方法の 1 つは、セグメントがリアルタイムで認定される条件に対して、セグメントを使用することです。 この演習では、使用している Web サイト上の実際のアクティビティを考慮して、セグメントを作成する必要があります。

## 6.1.2 反応したい動作の特定

に移動します。 [https://builder.adobedemo.com/projects](https://builder.adobedemo.com/projects). Adobe IDでログインすると、次の内容が表示されます。 Web サイトプロジェクトをクリックして開きます。

![DSN](../module0/images/web8.png)

これで、以下のフローに従って Web サイトにアクセスできます。 クリック **統合**.

![DSN](../module0/images/web1.png)

の **統合** このページでは、演習 0.1 で作成したデータ収集プロパティを選択する必要があります。

![DSN](../module0/images/web2.png)

次に、デモ Web サイトが開いているのがわかります。 URL を選択して、クリップボードにコピーします。

![DSN](../module0/images/web3.png)

新しい匿名ブラウザーウィンドウを開きます。

![DSN](../module0/images/web4.png)

前の手順でコピーしたデモ Web サイトの URL を貼り付けます。 その後、Adobe IDを使用してログインするように求められます。

![DSN](../module0/images/web5.png)

アカウントのタイプを選択し、ログインプロセスを完了します。

![DSN](../module0/images/web6.png)

Web サイトが匿名ブラウザーウィンドウに読み込まれます。 デモ Web サイトの URL を読み込むには、新しい匿名ブラウザーウィンドウを使用する必要があります。

![DSN](../module0/images/web7.png)

この例では、特定の製品を表示している特定の顧客に応答します。
次の **Luma** homepage, go to **メン**&#x200B;をクリックし、製品をクリックします。 **PROTEUS FITNESS JACKSHIRT**.

![データ取得](./images/homenadia.png)

誰かが **PROTEUS FITNESS JACKSHIRT**&#x200B;を使用すると、アクションを実行できます。 最初に実行する操作は、セグメントを定義することです。

![データ取得](./images/homenadiapp.png)

## 6.1.3 セグメントの作成

に移動します。 [Adobe Experience Platform](https://experience.adobe.com/platform). ログイン後、Adobe Experience Platformのホームページに移動します。

![データ取得](../module2/images/home.png)

続行する前に、 **サンドボックス**. 選択するサンドボックスの名前はです ``--aepSandboxId--``. これを行うには、 **[!UICONTROL 実稼動版]** 画面の上の青い線で表示されます。 適切な [!UICONTROL サンドボックス]画面が変更され、専用の [!UICONTROL サンドボックス].

![データ取得](../module2/images/sb1.png)

左側のメニューで、に移動します。 **セグメント** その後、 **参照** ここでは、既存のすべてのセグメントの概要を確認できます。 をクリックします。 **セグメントを作成** ボタンをクリックして、新しいセグメントの作成を開始します。

![セグメント化](./images/menuseg.png)

前述のように、製品を表示したすべての顧客からセグメントを作成する必要があります **PROTEUS FITNESS JACKSHIRT**.

このセグメントを構築するには、イベントを追加する必要があります。 すべてのイベントは、 **イベント** アイコン **セグメント** メニューバー

次に、最上位レベルが表示されます **XDM ExperienceEvent** ノード。

次のページを訪問した顧客を検索するには、 **PROTEUS FITNESS JACKSHIRT** 製品をクリック **XDM ExperienceEvent**.

![セグメント化](./images/findee.png)

下にスクロールして **製品リスト項目** をクリックします。

![セグメント化](./images/see.png)

選択 **名前** をクリックし、 **名前** オブジェクトを左から **製品リスト項目** メニューから **イベント** 」セクションに入力します。

![セグメント化](./images/eewebpdtlname1.png)

比較パラメーターは次のようにする必要があります。 **次と等しい** 入力フィールドに、 `PROTEUS FITNESS JACKSHIRT`.

![セグメント化](./images/pv.png)

お使いの **イベントルール** 次のようになります。 セグメントビルダーに要素を追加するたびに、 **推定を更新** 」ボタンを使用して、セグメント内の母集団の新しい推定を取得します。

![セグメント化](./images/ldap4.png)

最後に、セグメントに名前を付けて保存します。

命名規則として、次を使用します。

- `--demoProfileLdap-- - Interest in PROTEUS FITNESS JACKSHIRT`

セグメント名は次のようになります。
`vangeluw - Interest in PROTEUS FITNESS JACKSHIRT`

次に、 **保存して閉じる** 」ボタンをクリックしてセグメントを保存します。

![セグメント化](./images/segmentname.png)

これで、セグメントの概要ページに戻ります。

![セグメント化](./images/savedsegment.png)

次のステップ： [6.2 宛先を使用した DV360 の宛先の設定方法の確認](./ex2.md)

[モジュール 11 に戻る](./real-time-cdp-build-a-segment-take-action.md)

[すべてのモジュールに戻る](../../overview.md)
