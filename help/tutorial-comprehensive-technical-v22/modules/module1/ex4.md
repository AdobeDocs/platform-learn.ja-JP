---
title: Foundation - Adobe Experience Platformデータ収集と Web SDK 拡張機能のセットアップ — クライアント側 Web データ収集
description: Foundation - Adobe Experience Platformデータ収集と Web SDK 拡張機能のセットアップ — クライアント側 Web データ収集
kt: 5342
audience: Data Engineer, Data Architect
doc-type: tutorial
activity: develop
exl-id: c4ebca8d-93e0-4056-8553-c0d7e342beca
source-git-commit: cc7a77c4dd380ae1bc23dc75608e8e2224dfe78c
workflow-type: tm+mt
source-wordcount: '632'
ht-degree: 2%

---

# 1.4 クライアント側の Web データ収集

## 1.4.1 リクエスト内のデータの検証

### Adobe Experience Platform Debugger のインストール

Experience Platformデバッガーは、Web ページに実装されているAdobeテクノロジーを確認するのに役立つ、Chrome および Firefox ブラウザーで使用できる拡張機能です。 使用するブラウザーのバージョンをダウンロードします。

- [Firefox 拡張機能](https://addons.mozilla.org/ja/firefox/addon/adobe-experience-platform-dbg/)

- [Chrome 拡張機能](https://chrome.google.com/webstore/detail/adobe-experience-platform/bfnnokhpnncpkdmbokanobigaccjkpob)

以前のAdobe Experience Cloud Debugger とは異なるデバッガーを使用したことがない場合は、この 5 分間の概要ビデオを視聴できます。

>[!VIDEO](https://video.tv.adobe.com/v/32156?quality=12&learn=on)

匿名モードでデモ Web サイトを読み込む場合、Experience Platformデバッガーが匿名モードでも使用できることを確認する必要があります。 これをおこなうには、に移動します。 **chrome://extensions** ブラウザーで、Debugger 拡張機能をExperience Platformします。

次の 2 つの設定が有効になっていることを確認します。

- 開発者モード
- 匿名で許可

![EXP ニュースホームページ](./images/ext1.png)

### デモ Web サイトを開きます。

に移動します。 [https://builder.adobedemo.com/projects](https://builder.adobedemo.com/projects). Adobe IDでログインすると、次の内容が表示されます。 Web サイトプロジェクトをクリックして開きます。

![DSN](../module0/images/web8.png)

の **スクリーン** ページ、クリック **実行**.

![DSN](./images/web2.png)

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

### Experience Platformデバッガーを使用して、Edge への呼び出しを確認する

デモ Web サイトが開いていることを確認し、「 DebuggerExperience Platform」拡張機能アイコンをクリックします。

![EXP ニュースホームページ](./images/ext2.png)

デバッガーが開き、 Adobe Experience Platformデータ収集プロパティで作成した実装の詳細が表示されます。 編集した拡張機能とルールをデバッグしていることに注意してください。

次をクリック： **[!UICONTROL ログイン]** ボタンをクリックして認証します。 Adobe Experience Platformデータ収集インターフェイスで既に「ブラウザー」タブを開いている場合、認証手順は自動的に実行され、ユーザー名とパスワードを再入力する必要はありません。

![AEP デバッガー](./images/validate2.png)

デモ Web サイトの「リロード」ボタンを押して、デバッガーをその特定のタブに接続します。

![AEP デバッガー](./images/validate2a.png)

デバッガーが **[!UICONTROL ホームに接続]** 上の図のように、次にクリックします。 **[!UICONTROL ロック]** アイコンをクリックして、Debugger をデモ Web サイトにロックします。 これをおこなわないと、デバッガーは切り替え続けて、フォーカスされているブラウザータブの実装の詳細を表示します。これは紛らわしくなる可能性があります。

![AEP デバッガー](./images/validate3.png)

次に、デモ Web サイト ( **メン** カテゴリページに表示されます。

![AEP Debugger AEP Web SDK 拡張機能](./images/validate4.png)

今すぐクリック **[!UICONTROL Experience PlatformWeb SDK]** 左側のナビゲーションで、 **[!UICONTROL ネットワークリクエスト]**.

各リクエストには **[!UICONTROL イベント]** 行

![AEP Debugger AEP Web SDK 拡張機能](./images/validate5.png)

クリックして **[!UICONTROL イベント]** 行 表示方法 **web.webpagedetails.pageViews** イベント、およびその他の標準の変数 ( **Web SDK ExperienceEvent XDM** 形式

![イベント値](./images/validate8.png)

これらのタイプの要求の詳細は、「ネットワーク」タブにも表示されます。 次を含むリクエストのフィルター **相互作用** をクリックして、Web SDK から送信されたリクエストを特定します。 XDM ペイロードの詳細はすべて、リクエストペイロードヘッダーにあります。

![「ネットワーク」タブ](./images/validate9.png)

次の手順： [1.5 Adobe AnalyticsとAdobe Audience Managerの実装](./ex5.md)

[モジュール 1 に戻る](./data-ingestion-launch-web-sdk.md)

[すべてのモジュールに戻る](./../../overview.md)
