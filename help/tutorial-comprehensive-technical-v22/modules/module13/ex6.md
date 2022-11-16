---
title: Microsoft Azure イベントハブへのセグメントのアクティベーション — アクション
description: Microsoft Azure イベントハブへのセグメントのアクティベーション — アクション
kt: 5342
audience: Data Engineer, Data Architect, Data Analyst
doc-type: tutorial
activity: develop
exl-id: 989dd2e4-597b-4b80-8b17-41aa6929ed64
source-git-commit: cc7a77c4dd380ae1bc23dc75608e8e2224dfe78c
workflow-type: tm+mt
source-wordcount: '560'
ht-degree: 0%

---

# 13.6 エンドツーエンドのシナリオ

## 13.6.1 Azure Event Hub の起動トリガー

セグメント認定時にAdobe Experience Platform Real-time CDP によって Azure Event Hub に送信されたペイロードを表示するには、シンプルな Azure Event Hubトリガー機能を開始する必要があります。 この関数は、Visual Studio Code のコンソールにペイロードを「ダンプ」します。 しかし、この関数は、専用の API とプロトコルを使用して、あらゆる種類の環境とのインターフェイスに、あらゆる方法で拡張できることに注意してください。

### Visual Studio Code を起動してプロジェクトを開始

Visual Studio Code プロジェクトを開いて実行していることを確認します

Visual Studio Code で Azure 関数を開始/停止/再起動するには、次の演習を参照してください。

- [演習 13.5.4 - Azure プロジェクトの開始](./ex5.md)
- [演習 13.5.5 - Azure プロジェクトの停止](./ex5.md)

Visual Studio コード **ターミナル** には、次のような内容を指定する必要があります。

```code
[2022-02-23T05:03:41.429Z] Worker process started and initialized.
[2022-02-23T05:03:41.484Z] Debugger attached.
[2022-02-23T05:03:46.401Z] Host lock lease acquired by instance ID '000000000000000000000000D90C881B'.
```

![6-01-vsc-ready.png](./images/vsc31.png)

## 13.6.2 Luma の Web サイトの読み込み

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

## 13.6.3 機器セグメントに対する関心の対象となる

次に移動： **機器** ページを 1 回開き、 **再読み込みまたは更新しない**. このアクションにより、 `--demoProfileLdap-- - Interest in Equipment` セグメント。

![6-04-luma-telco-nav-sports.png](./images/luma1.png)

確認するには、プロファイルビューアパネルを開きます。 これで、 `--demoProfileLdap-- - Interest in Equipment`. セグメントメンバーシップがまだプロファイルビューアパネルで更新されていない場合は、「再読み込み」ボタンをクリックします。

![6-05-luma-telco-nav-broadband.png](./images/luma2.png)

Visual Studio Code に戻り、 **端末** 」タブに、特定の **ECID**. このアクティベーションペイロードは、 `--demoProfileLdap-- - Interest in Equipment` セグメント。

セグメントペイロードを詳しく見ると、 `--demoProfileLdap-- - Interest in Equipment` ステータスが **実現**.

セグメントのステータス： **実現** は、プロファイルがセグメントに入ったときを示します。 また、 **既存** 「ステータス」は、プロファイルが引き続きセグメント内に存在することを意味します。

![6-06-vsc-activation-realized.png](./images/luma3.png)

## 13.6.4 機器ページへの 2 回目のアクセス

次の項目を強く更新 **機器** ページ。

![6-07-back-to-sports.png](./images/luma1.png)

次に、Visual Studio Code に戻り、 **端末** タブをクリックします。 セグメントはまだ存在しますが、現在はステータスが「 」となっています。 **既存** つまり、プロファイルは引き続きセグメント内に存在します。

![6-08-vsc-activation-existing.png](./images/luma4.png)

## 13.6.5 スポーツページに 3 回目でアクセスする

もし **スポーツ** ページが 3 回目になると、セグメントの視点からの状態の変更がないので、アクティベーションはおこなわれません。

セグメントのアクティベーションは、セグメントのステータスが変更された場合にのみ発生します。

![6-09-segment-state-change.png](./images/6-09-segment-state-change.png)

次のステップ： [概要とメリット](./summary.md)

[モジュール 13 に戻る](./segment-activation-microsoft-azure-eventhub.md)

[すべてのモジュールに戻る](./../../overview.md)
