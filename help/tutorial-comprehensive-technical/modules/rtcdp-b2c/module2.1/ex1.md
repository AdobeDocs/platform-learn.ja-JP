---
title: 基盤 – リアルタイム顧客プロファイル - Web サイトで不明なものから既知のものまで
description: 基盤 – リアルタイム顧客プロファイル - Web サイトで不明なものから既知のものまで
kt: 5342
doc-type: tutorial
source-git-commit: 2cdc145d7f3933ec593db4e6f67b60961a674405
workflow-type: tm+mt
source-wordcount: '917'
ht-degree: 2%

---

# 2.1.1 ウェブサイト上で不明から既知へ

## コンテキスト

未知のものから既知のものへのジャーニーは、獲得から定着までのカスタマージャーニーと同様に、最近のブランドの間で最も重要なトピックの 1 つです。

Adobe Experience Platformはこの道のりで大きな役割を果たします。 プラットフォームは、「記録のエクスペリエンスシステム」と呼ばれるコミュニケーションの頭脳です。

Platform は、既知の顧客だけでなく、顧客という言葉が広い環境です。 Web サイト上の未知訪問者も、Platform の観点からは顧客なので、未知訪問者としての行動もすべて Platform に送信されます。 このアプローチのおかげで、この訪問者が最終的に既知の顧客になると、ブランドはその瞬間の前に何が起こったかを視覚化できます。 これは、アトリビューションとエクスペリエンスの最適化の観点から役立ちます。

## カスタマージャーニーフロー

[https://builder.adobedemo.com/projects](https://builder.adobedemo.com/projects) に移動します。 Adobe IDでログインすると、このが表示されます。 Web サイトプロジェクトをクリックして開きます。

![DSN](../../gettingstarted/gettingstarted/images/web8.png)

**Screens** ページで、「**実行** をクリックします。

![DSN](../../gettingstarted/gettingstarted/images/web2.png)

その後、デモ Web サイトが開きます。 URL を選択してクリップボードにコピーします。

![DSN](../../gettingstarted/gettingstarted/images/web3.png)

新しい匿名ブラウザーウィンドウを開きます。

![DSN](../../gettingstarted/gettingstarted/images/web4.png)

前の手順でコピーしたデモ Web サイトの URL を貼り付けます。 その後、Adobe IDを使用してログインするように求められます。

![DSN](../../gettingstarted/gettingstarted/images/web5.png)

アカウントタイプを選択し、ログインプロセスを完了します。

![DSN](../../gettingstarted/gettingstarted/images/web6.png)

次に、匿名ブラウザーウィンドウに web サイトが読み込まれます。 デモごとに、新しい匿名ブラウザーウィンドウを使用して、デモ Web サイトの URL を読み込む必要があります。

![DSN](../../gettingstarted/gettingstarted/images/web7.png)

画面の左上隅にあるAdobeロゴアイコンをクリックして、プロファイルビューアを開きます。

![デモ](../../datacollection/module1.2/images/pv1.png)

現在は不明なこの顧客のプライマリ ID として **0} ユーザー ID} を持つプロファイルビューアパネルとリアルタイムExperience Cloudプロファイルをご覧ください。**

![デモ](../../datacollection/module1.2/images/pv2.png)

また、顧客の行動に基づいて収集されたすべてのエクスペリエンスイベントを表示することもできます。 リストは現在空ですが、すぐに変更されます。

![デモ](../../datacollection/module1.2/images/pv3.png)

**男性** 製品カテゴリに移動します。 次に、製品 **Montana Wind Jacket** をクリックしてください。

![デモ](../../datacollection/module1.2/images/pv4.png)

製品の詳細ページが表示されます。 モジュール 1 で確認した Web SDK 実装を使用して、タイプ **製品表示** のエクスペリエンスイベントがAdobe Experience Platformに送信されるようになりました。

![デモ](../../datacollection/module1.2/images/pv5.png)

Provile ビューアパネルを開き、**エクスペリエンスイベント** を確認します。

![デモ](../../datacollection/module1.2/images/pv6.png)

**女性** カテゴリページに戻り、別の製品をクリックします。 別のエクスペリエンスイベントがAdobe Experience Platformに送信された。

![デモ](../../datacollection/module1.2/images/pv7.png)

プロファイルビューアパネルを開きます。 **製品表示** タイプの 2 つのエクスペリエンスイベントが表示されます。 ビヘイビアーは匿名ですが、すべてのクリックをトラッキングしてAdobe Experience Platformに保存できます。 匿名の顧客が認識されると、すべての匿名の行動を既知のプロファイルに自動的に結合できます。

![デモ](../../datacollection/module1.2/images/pv8.png)

登録/ログインページに移動します。 **アカウントを作成** をクリックします。

![デモ](../../datacollection/module1.2/images/pv9.png)

詳細を入力して **登録** をクリックすると、前のページにリダイレクトされます。

![デモ](../../datacollection/module1.2/images/pv10.png)

プロファイルビューアパネルを開き、リアルタイム顧客プロファイルに移動します。 プロファイルビューアパネルには、新しく追加されたメール識別子や電話識別子など、すべての個人データが表示されます。

![デモ](../../datacollection/module1.2/images/pv11.png)

プロファイルビューアパネルで、「エクスペリエンスイベント」に移動します。 以前に表示した 2 つの製品がプロファイルビューアパネルに表示されます。 これらの両方のイベントが、「既知の」プロファイルにも接続されるようになりました。

![デモ](../../datacollection/module1.2/images/pv12.png)

データをAdobe Experience Platformに取り込み、そのデータを ECID やメールアドレスなどの識別子にリンクしました。 このジャーニーの目標は、実行しようとしている内容のビジネスコンテキストを理解することです。 次の演習では、すべてのデータ取り込みを可能にするために必要なすべての設定を開始します。

### モバイルアプリの操作

既知の顧客になった後、モバイルアプリを使用し始めます。 iPhoneでモバイルアプリを開き、アプリにログインします。

アプリがインストールされていない場合、またはインストール方法が思い出せない場合は、こちらをご覧ください。[0.5 モバイルアプリを使用する ](../../gettingstarted/gettingstarted/ex5.md)

指示に従ってアプリをインストールすると、Luma ブランドが読み込まれたアプリのランディングページが表示されます。 画面の左上にあるアカウントアイコンをクリックします。

![デモ](./images/app_hp.png)

ログイン画面で、デスクトップ web サイトで使用したメールアドレスでログインします。 **ログイン** をクリックします。

![デモ](./images/app_acc.png)

アプリのホーム画面に移動し、クリックして製品を開きます。

![デモ](./images/app_hp.png)

製品の詳細ページが表示されます。

![デモ](./images/app_carst.png)

アプリのホーム画面に移動し、画面を左にスワイプして、プロファイルビューアパネルを表示します。 その後、「**エクスペリエンスイベント**」セクションに、先ほど表示した製品と、以前に web サイトセッションで表示したすべての製品表示が表示されます。

![デモ](./images/app_after_carst.png)

デスクトップコンピューターに戻り、ホームページを更新します。その後、製品もそこに表示されます。

![デモ](./images/lb_x_aftermobile.png)

データをAdobe Experience Platformに取り込み、そのデータを ECID やメールアドレスなどの識別子にリンクしました。 この演習の目的は、実行しようとしている内容のビジネスコンテキストを理解することです。 これで、リアルタイムのクロスデバイス顧客プロファイルを効果的に作成できました。 次の演習では、Adobe Experience Platformでプロファイルを視覚化します。

次の手順：[2.1.2 独自のリアルタイム顧客プロファイルの視覚化 – UI](./ex2.md)

[モジュール 2.1 に戻る](./real-time-customer-profile.md)

[すべてのモジュールに戻る](../../../overview.md)
