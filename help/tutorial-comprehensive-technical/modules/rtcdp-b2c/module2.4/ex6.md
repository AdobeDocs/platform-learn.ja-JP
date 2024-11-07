---
title: Microsoft Azure Event Hub へのセグメントのアクティベーション – アクション
description: Microsoft Azure Event Hub へのセグメントのアクティベーション – アクション
kt: 5342
doc-type: tutorial
source-git-commit: c6ba1f751f18afe39fb6b746a62bc848fa8ec9bf
workflow-type: tm+mt
source-wordcount: '576'
ht-degree: 0%

---

# 2.4.6 エンドツーエンドのシナリオ

## 2.4.6.1 Azure Event Hub のトリガーの開始

セグメントの選定時にAdobe Experience Platform Real-time CDP から Azure Event Hub に送信されたペイロードを表示するには、シンプルな Azure Event Hubトリガー機能を開始する必要があります。 この関数は、Visual Studio Code のコンソールにペイロードを単純に「ダンプ」します。 ただし、この関数は、専用の API とプロトコルを使用して、あらゆる種類の環境とインターフェイスするように拡張できます。

### Visual Studio Code の起動とプロジェクトの開始

Visual Studio Code プロジェクトを開いて実行していることを確認します

Visual Studio Code で Azure 関数を開始/停止/再起動するには、次の演習を参照してください。

- [演習 13.5.4 - Azure プロジェクトの開始](./ex5.md)
- [演習 13.5.5 - Azure プロジェクトの停止](./ex5.md)

Visual Studio Code の **ターミナル** には、次のような記述が必要です。

```code
[2022-02-23T05:03:41.429Z] Worker process started and initialized.
[2022-02-23T05:03:41.484Z] Debugger attached.
[2022-02-23T05:03:46.401Z] Host lock lease acquired by instance ID '000000000000000000000000D90C881B'.
```

![6-01-vsc-ready.png](./images/vsc31.png)

## 2.4.6.2 Luma web サイトを読み込む

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

## 2.4.6.3 機器セグメントへの関心の対象

**機器** ページに一度移動し、**再読み込みや更新を行わないでください**。 このアクションは、`--demoProfileLdap-- - Interest in Equipment` のセグメントの条件を満たすものです。

![6-04-luma-telco-nav-sports.png](./images/luma1.png)

確認するには、プロファイルビューアパネルを開きます。 `--demoProfileLdap-- - Interest in Equipment` のメンバーになりました。 プロファイルビューアパネルでセグメントメンバーシップがまだ更新されていない場合は、「再読み込み」ボタンをクリックします。

![6-05-luma-telco-nav-broadband.png](./images/luma2.png)

Visual Studio Code に戻り、「**TERMINAL**」タブを見ると、特定の **ECID** のセグメントのリストが表示されます。 このアクティベーションペイロードは、`--demoProfileLdap-- - Interest in Equipment` セグメントに適合するとすぐにイベントハブに配信されます。

セグメントペイロードを詳しく見ると、`--demoProfileLdap-- - Interest in Equipment` のステータスが **実現済み** であることがわかります。

セグメントステータスが **実現済み** の場合は、プロファイルがセグメントにエントリしたばかりであることを意味します。 **既存** ステータスは、プロファイルが引き続きセグメントに含まれることを意味します。

![6-06-vsc-activation-realized.png](./images/luma3.png)

## 2.4.6.4 機器のページを 2 回目に見る

**Equipment** ページをハード更新します。

![6-07-back-to-sports.png](./images/luma1.png)

次に、Visual Studio Code に戻り、「**TERMINAL**」タブを確認します。 セグメントは残っていますが、現在はステータス **既存** になっています。つまり、プロファイルは引き続きセグメントに含まれます。

![6-08-vsc-activation-existing.png](./images/luma4.png)

## 2.4.6.5 スポーツのページを 3 回目に見る

**スポーツ** ページを 3 回目に再訪問した場合、セグメントの観点から状態が変更されないので、アクティベーションは行われません。

セグメントのアクティベーションは、セグメントのステータスが変更された場合にのみ行われます。

![6-09-segment-state-change.png](./images/6-09-segment-state-change.png)

次の手順：[ 概要とメリット ](./summary.md)

[モジュール 2.4 に戻る](./segment-activation-microsoft-azure-eventhub.md)

[すべてのモジュールに戻る](./../../../overview.md)
