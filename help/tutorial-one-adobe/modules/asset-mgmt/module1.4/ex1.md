---
title: アセットと dynamic media テンプレートの作成
description: アセットと dynamic media テンプレートの作成
kt: 5342
doc-type: tutorial
exl-id: 3867f23b-9b88-4971-a892-5821800e39ac
source-git-commit: 8f746831d4a1481f8ccc14539273c4b16ca5170b
workflow-type: tm+mt
source-wordcount: '2241'
ht-degree: 1%

---

# 1.4.1 アセットと dynamic media テンプレートの作成

>[!IMPORTANT]
>
>この演習を行うには、AEM Assets Dynamic Media が有効になっている、動作中のAEM Assets CS オーサー環境にアクセスできる必要があります。
>
>そのような環境がない場合は、[Adobe Experience Manager Cloud ServiceおよびEdge Delivery Services](./../../../modules/asset-mgmt/module2.1/aemcs.md){target="_blank"} に移動します。 指示に従うと、そのような環境にアクセスできます。

>[!IMPORTANT]
>
>以前にAEM CS プログラムをAEM Assets CS 環境で設定している場合は、AEM CS サンドボックスが休止状態になっている可能性があります。 このようなサンドボックスの休止解除には 10～15 分かかるので、後で待つ必要がないように、今すぐ休止解除プロセスを開始することをお勧めします。

## Dynamic Media の会社 1.4.1.1 作成するには

[https://my.cloudmanager.adobe.com](https://my.cloudmanager.adobe.com){target="_blank"} に移動します。 選択する組織は `--aepImsOrgName--` です。

![AEM Assets Dynamic Media](./images/aaemassdmcomp1.png)

**Dynamic Media 会社** までスクロールします。 **+** アイコンをクリックして、Dynamic Media の新しい会社を作成します。

![AEM Assets Dynamic Media](./images/aaemassdmcomp2.png)

次の情報を入力します。

- **会社名**: `--aepUserLdap---CitiSignal`。
- **会社地域**：最も近い地域を選択します。
- **会社の管理者メール**：管理者メールを入力します。

「**作成**」をクリックします。

![AEM Assets Dynamic Media](./images/aaemassdmcomp3.png)

この画像が表示されます。

![AEM Assets Dynamic Media](./images/aaemassdmcomp4.png)

次のようなメールが届きます。このメールには、一時パスワードが記載されています。 パスワードを変更する場合や、メールを受信しなかった場合にパスワードを取得する場合は、**Adobe Dynamic Media Classic デスクトップアプリ** をインストールしてください。 インストール手順については、[https://experienceleague.adobe.com/en/docs/dynamic-media-classic/using/intro/dynamic-media-classic-desktop-app](https://experienceleague.adobe.com/en/docs/dynamic-media-classic/using/intro/dynamic-media-classic-desktop-app) を参照してください。

手順に従い、アプリケーションをシステムにインストールしたら、ここに戻ります。

**Adobe Dynamic Media Classic デスクトップアプリ** を開きます。 パスワードを知っている場合は、ここに入力し、手順に従って最初のログイン時に変更してください。

パスワードがわからない場合は、**パスワードを忘れた場合** リンクをクリックし、指示に従ってパスワードをリセットしてください。その後、ここに戻ってログインします。

![AEM Assets Dynamic Media](./images/aaemassdmcomp5.png)

ログインに成功すると、次のような画面が表示されます。

![AEM Assets Dynamic Media](./images/aaemassdmcomp6.png)

## AEM1.4.1.2Dynamic Media を設定するには

[https://my.cloudmanager.adobe.com](https://my.cloudmanager.adobe.com){target="_blank"} に移動します。 選択する組織は `--aepImsOrgName--` です。

クリックすると、Cloud Manager プログラムが開きます。このプログラムは `--aepUserLdap-- - CitiSignal AEM+ACCS` と呼ばれます。

![AEM Assets Dynamic Media](./images/accsaemassets1.png)

環境をクリックします。

![AEM Assets Dynamic Media](./images/accsaemassets3.png)

環境の URL をクリックします。

![AEM Assets Dynamic Media](./images/accsaemassets2.png)

**ツール**/**クラウドサービス**/**Dynamic Media 設定** に移動します。

![AEM Assets Dynamic Media](./images/accsaemassets4.png)

「**グローバル**」を選択し（「グローバル」チェックボックスをオフ）、「**作成**」をクリックします。

![AEM Assets Dynamic Media](./images/accsaemassets5.png)

次の情報を入力します。

- **タイトル**:`--aepUserLdap-- - CitiSignal` というタイトルを使用します。
- **メール**：メールアドレスを入力します。
- **パスワード**:Dynamic Media アカウントのパスワードを入力します
- **地域**:Dynamic Media 会社を作成する際に選択した地域を選択します。この例では、「**ヨーロッパ** です。

**Dynamic Media に接続** をクリックします。

![AEM Assets Dynamic Media](./images/accsaemassets6.png)

この画像が表示されます。 以下を設定します。

- **会社**: `--aepUserLdap-- - CitiSignal` を選択します。
- **Assetsを公開** を **即時** に設定します。
- 「すべてのコンテンツを同期 **するチェックボックスをオン** します。

「**保存**」をクリックします。

![AEM Assets Dynamic Media](./images/accsaemassets7.png)

これで、Dynamic Media の設定が完了しました。 「**OK**」をクリックします。

![AEM Assets Dynamic Media](./images/accsaemassets8.png)

## 1.4.1.3 アセットを書き出す

このファイル [citisignal-fiber-max-is-coming.psd](./assets/citisignal-fiber-max-is-coming.psd){target="_blank"} をダウンロードし、Adobe Photoshopで開きます。

この画像が表示されます。 CitiSignal は、ニューヨーク、パリ、ドバイの 3 都市で Fiber Max の展開を計画しています。

特定のレイヤーを表示または非表示にすることで、デザイナーが作成した画像を表示できます。

Photoshop PSD テンプレートから画像ファイルを書き出す手順は次のとおりです。 必要に応じて、完成した画像をこちら [citignal-dm-email-assets.zip](./assets/citisignal-dm-email-assets.zip){target="_blank"} からダウンロードして、デスクトップにファイルを解凍することもできます。

これはニューヨークの物だ。

![AEM Assets Dynamic Media](./images/aemdm1.png)

これはドバイのバージョンです。

![AEM Assets Dynamic Media](./images/aemdm2.png)

これはパリのバージョンです。

![AEM Assets Dynamic Media](./images/aemdm3.png)

CitiSignal が Fiber Max をロールアウトする他の都市も多くなる可能性があるため、将来、このファイルに新しいレイヤーが作成される可能性があります。 今のところ、先に述べた 3 つの都市に焦点を当てています。

これらのバリエーションをAEM Assets Dynamic Media と組み合わせて使用するには、各都市のレイヤーを背景ファイルなしで個別に画像として書き出し、別の書き出しは、都市を含まない背景レイヤーに行う必要があります。

これで、1 つのレイヤーのみの表示/非表示が切り替わりました。 最初に表示するレイヤーは **Paris** レイヤーで、その他のレイヤーはすべて非表示にする必要があります。

そのレイヤーを書き出すには、**ファイル**/**書き出し**/**別名で書き出し** に移動します。

![AEM Assets Dynamic Media](./images/aemdm4.png)

この画像が表示されます。 ファイルタイプ **PNG** を選択し、**透明度** が有効になっていることを確認して、「**書き出し**」をクリックします。

![AEM Assets Dynamic Media](./images/aemdm5.png)

ファイル名を `citisignal-fiber-max-is-coming-paris.png` に変更し、**書き出し** をクリックします。

![AEM Assets Dynamic Media](./images/aemdm6.png)

次に表示するレイヤーは **ドバイ** レイヤーで、他のすべてのレイヤーは非表示にする必要があります。

そのレイヤーを書き出すには、**ファイル**/**書き出し**/**別名で書き出し** に移動します。

![AEM Assets Dynamic Media](./images/aemdm4a.png)

この画像が表示されます。 ファイルタイプ **PNG** を選択し、**透明度** が有効になっていることを確認して、「**書き出し**」をクリックします。

![AEM Assets Dynamic Media](./images/aemdm5a.png)

ファイル名を `citisignal-fiber-max-is-coming-dubai.png` に変更し、**書き出し** をクリックします。

![AEM Assets Dynamic Media](./images/aemdm6a.png)

次に表示するレイヤーは **New York** レイヤーで、その他のレイヤーはすべて非表示にする必要があります。

そのレイヤーを書き出すには、**ファイル**/**書き出し**/**別名で書き出し** に移動します。

![AEM Assets Dynamic Media](./images/aemdm4b.png)

この画像が表示されます。 ファイルタイプ **PNG** を選択し、**透明度** が有効になっていることを確認して、「**書き出し**」をクリックします。

![AEM Assets Dynamic Media](./images/aemdm5b.png)

ファイル名を `citisignal-fiber-max-is-coming-newyork.png` に変更し、**書き出し** をクリックします。

![AEM Assets Dynamic Media](./images/aemdm6b.png)

次に表示するレイヤーは **背景** レイヤーで、その他のレイヤーはすべて非表示にする必要があります。

そのレイヤーを書き出すには、**ファイル**/**書き出し**/**別名で書き出し** に移動します。

![AEM Assets Dynamic Media](./images/aemdm4c.png)

この画像が表示されます。 ファイルタイプ **PNG** を選択し、**透明度** が有効になっていることを確認して、「**書き出し**」をクリックします。

![AEM Assets Dynamic Media](./images/aemdm5c.png)

ファイル名を `citisignal-fiber-max-is-coming-background` に変更し、**書き出し** をクリックします。

![AEM Assets Dynamic Media](./images/aemdm6c.png)

その後、選択した書き出し場所でこれらのファイルを使用できるようになります。

![AEM Assets Dynamic Media](./images/aemdm7.png)

## 1.4.1.4 AEM Assets CS へのアセットのアップロード

[https://experience.adobe.com/](https://experience.adobe.com/){target="_blank"} に移動します。 **Experience Manager Assets** に移動します。

![AEM Assets Dynamic Media](./images/aemdm8.png)

リポジトリを選択します。これは、`--aepUserLdap-- - CitiSignal AEM + ACCS` という名前にする必要があります。

![AEM Assets Dynamic Media](./images/aemdm9.png)

**Assets** に移動し、「**フォルダーを作成**」をクリックします。

![AEM Assets Dynamic Media](./images/aemdm10.png)

フォルダーには、名前 `--aepUserLdap-- - CitiSignal Dynamic Media` を使用します。 「**作成**」をクリックします。

![AEM Assets Dynamic Media](./images/aemdm11.png)

ダブルクリックして、作成したフォルダーを開きます。

![AEM Assets Dynamic Media](./images/aemdm12.png)

**Assetsを追加** をクリックします。

![AEM Assets Dynamic Media](./images/aemdm13.png)

**参照** をクリックし、「**ファイルを参照** を選択します。

![AEM Assets Dynamic Media](./images/aemdm15.png)

前の手順で書き出した 4 つの PNG ファイルを選択します。

![AEM Assets Dynamic Media](./images/aemdm16.png)

**アップロード** をクリックします。

![AEM Assets Dynamic Media](./images/aemdm17.png)

画像をAEM Assets CS で使用できるようになりました。

![AEM Assets Dynamic Media](./images/aemdm18.png)

数分待ってから **Adobe Dynamic Media Classic デスクトップアプリ** を開くと、アップロードされた画像が Dynamic Media 内でも使用できるようになります。

![AEM Assets Dynamic Media](./images/aemdm19.png)

## Dynamic Media テンプレートを設定 1.4.1.5 るには

左側のメニューで、**Dynamic Media Assets** に移動します。 クリックしてフォルダー `--aepUserLdap-- - CitiSignal Dynamic Media` を開きます。 次に、「**テンプレートを作成**」をクリックします。

![AEM Assets Dynamic Media](./images/aemdm20.png)

次の情報を入力します。

- **テンプレート名**: `--aepUserLdap-- - CitiSignal Fiber Max Launch Email Assets`
- **キャンバスの幅**: `600px`
- **キャンバスの高さ**: `600px`

「**作成**」をクリックします。

![AEM Assets Dynamic Media](./images/aemdm21.png)

この画像が表示されます。 **画像を追加** アイコンをクリックします。

![AEM Assets Dynamic Media](./images/aemdm22.png)

ファイル **citisignal-fiber-max-is-coming_citisignal-background.png** をキャンバスにドラッグして、キャンバスに収まるようにします。

![AEM Assets Dynamic Media](./images/aemdm23.png)

次に、ファイル **citisignal-fiber-max-is-coming_citisignal-newyork.png** をキャンバスにドラッグして、キャンバスに収まるようにします。

![AEM Assets Dynamic Media](./images/aemdm24.png)

次に、ファイル **citignal-fiber-max-is-coming_citignal-dubai.png** をキャンバスにドラッグして、キャンバスに収まるようにします。

![AEM Assets Dynamic Media](./images/aemdm25.png)

次に、ファイル **citisignal-fiber-max-is-coming_citisignal-paris.png** をキャンバスにドラッグし、キャンバスに合わせます。

![AEM Assets Dynamic Media](./images/aemdm26.png)

これで、テンプレートの 3 つのバリエーションすべてが同時に個別のレイヤーとして作成されます。 **レイヤー** アイコンをクリックすると、特定のレイヤーの表示/非表示を切り替えることができます。このアイコンは、現在、すべてのレイヤーが表示されていることを示します。

![AEM Assets Dynamic Media](./images/aemdm27.png)

いくつかのレイヤーを非表示にすると、画像の外観を制御できます。 この例では、「パリ **のレイヤーと背景レイヤーのみ** 表示されています。

![AEM Assets Dynamic Media](./images/aemdm28.png)

次に、テキストレイヤーを追加する必要があります。 **テキストレイヤー** アイコンをクリックします。

![AEM Assets Dynamic Media](./images/aemdm29.png)

この画像が表示されます。

![AEM Assets Dynamic Media](./images/aemdm30.png)

自由にテキストフィールドを適合させる方法を選択してください。次に例を示します。 後の段階で挿入した実際のテキストが正常に表示されるように、オプション **スマートテキストのサイズ変更** を必ず有効にしてください。

![AEM Assets Dynamic Media](./images/aemdm31.png)

2 つ目のテキストレイヤーを追加して、次のように表示します。 後の段階で挿入した実際のテキストが正常に表示されるように、オプション **スマートテキストのサイズ変更** を必ず有効にしてください。

![AEM Assets Dynamic Media](./images/aemdm32.png)

最初のテキストレイヤーを選択します。 3 つのドット **...** をクリックし、「**編集**」を選択します。

![AEM Assets Dynamic Media](./images/aemdm33.png)

この画像が表示されます。 下にスクロールします。

![AEM Assets Dynamic Media](./images/aemdm34.png)

**スイッチャー** アイコンをクリックして、フィールド **テキスト** を有効にします。 **パラメーター名** を `title` に変更します。

![AEM Assets Dynamic Media](./images/aemdm35.png)

2 番目のテキストレイヤーを選択します。 3 つのドット **...** をクリックし、「**編集**」を選択します。

![AEM Assets Dynamic Media](./images/aemdm36.png)

この画像が表示されます。 下にスクロールします。

![AEM Assets Dynamic Media](./images/aemdm37.png)

**スイッチャー** アイコンをクリックして、フィールド **テキスト** を有効にします。 **パラメーター名** を `body` に変更します。

![AEM Assets Dynamic Media](./images/aemdm38.png)

**パリ** のレイヤーを選択します。 3 つのドット **...** をクリックし、「**編集**」をクリックします。

![AEM Assets Dynamic Media](./images/aemdm39.png)

**Paramaters** に移動します。 「**非表示**」フィールドを有効にし、**パラメーター名** を `city_paris` と入力します。 「**保存**」をクリックします。

![AEM Assets Dynamic Media](./images/aemdm40.png)

**ドバイ** のレイヤーを選択します。 3 つのドット **...** をクリックし、「**編集**」をクリックします。

![AEM Assets Dynamic Media](./images/aemdm41.png)

**Paramaters** に移動します。 「**非表示**」フィールドを有効にし、**パラメーター名** を `city_dubai` と入力します。 「**保存**」をクリックします。

![AEM Assets Dynamic Media](./images/aemdm42.png)

**ニューヨーク** の画層を選択します。 3 つのドット **...** をクリックし、「**編集**」をクリックします。

![AEM Assets Dynamic Media](./images/aemdm43.png)

**Paramaters** に移動します。 「**非表示**」フィールドを有効にし、**パラメーター名** を `city_ny` と入力します。 「**保存**」をクリックします。

![AEM Assets Dynamic Media](./images/aemdm44.png)

「**プレビュー**」をクリックします。

![AEM Assets Dynamic Media](./images/aemdm45.png)

**すべてのパラメーターを含める** スイッチャーを有効にし、スクリーンショットに示されているように入力変数を変更します。 指定された入力に基づいて画像が動的に変更されているのが確認できます。 **city_paris**、**city_dubai** および **city_ny** フィールドの場合、値 0 はこの画像が非表示にされないことを意味し、値 1 はこの画像が非表示になることを意味します。

![AEM Assets Dynamic Media](./images/aemdm46.png)

一部の変数を変更すると、別の画像が表示されるようになります。

![AEM Assets Dynamic Media](./images/aemdm47.png)

変数を増やすと、別の画像が表示されるようになります。

このテンプレートをAdobe Journey Optimizerで使用し、このユースケースの要件を満たすには、Adobe Experience Platformのリアルタイム顧客プロファイルの一部であるフィールドに基づいて、表示する必要があるファイルのパスを動的に変更するために使用されるレイヤーをもう 1 つ追加する必要があります。

dataprep 中、顧客の **最も近いロールアウト都市** を保存するためのフィールドをAdobe Experience Platform スキーマ内に作成しました。 フィールドのパスは `--aepTenantId--.individualCharacteristics.fiber_rollout.closest_rollout_city` です。

>[!NOTE]
>
>Adobe Experience Platform スキーマの以下のスクリーンショットは情報提供のみを目的としています。 これを自分で視覚化するためにAEPに移動する必要はありません。

![AEM Assets Dynamic Media](./images/aemdm50.png)

次の演習では、そのフィールドを使用して、どの顧客に表示する画像を動的に選択します。

それには、新しい画像レイヤーを追加する必要があります。

まず、ロールアウト都市用の画像を含む他のレイヤーを非表示にします。

![AEM Assets Dynamic Media](./images/aemdm51.png)

次に、**画像** に移動し、都市のランダム画像を選択してキャンバスに追加し、キャンバス全体に合っていることを確認します。 次の演習では、パスがAJOによって動的に変更されるので、選択する市区町村の画像は関係ありません。

![AEM Assets Dynamic Media](./images/aemdm52.png)


![AEM Assets Dynamic Media](./images/aemdm53.png)

**パラメーター** に移動します。

**スイッチャー** アイコンをクリックして、「非表示 **フィールドを有効に** ます。 **パラメーター名** を `dynamic_city_hide` に変更します。

**スイッチャー** アイコンをクリックして、「非表示 **フィールドを有効に** ます。 **パラメーター名** を `dynamic_city_image` に変更します。

「**保存**」をクリックします。

![AEM Assets Dynamic Media](./images/aemdm54.png)

「**プレビュー**」をクリックします。

![AEM Assets Dynamic Media](./images/aemdm55.png)

この画像が表示されます。 スイッチャーアイコンを有効にして **すべてのパラメーターを含める** します。 スクリーンショットに示されているように、いくつかの入力変数を変更します。 指定された入力に基づいて画像が動的に変更されているのが確認できます。 静的フィールド **city_paris**、**city_dubai** および **city_ny** は 1 に設定する必要があります。つまり、これらの画像は非表示になります。

フィールド **dynamic_city_hide** は、表示されることを意味する 0 に設定する必要があります。

フィールド **dynamic_city_image** に、パリの画像への URL が設定されました。これは次のようになります。`vangeluwCitiSignalDM/citisignal-fiber-max-is-coming_citisignal-paris-1`

![AEM Assets Dynamic Media](./images/aemdm56.png)

URL で **paris** という単語を選択します。

![AEM Assets Dynamic Media](./images/aemdm57.png)

**paris** を `newyork` に変更し、UI の別の場所をクリックして、画像がニューヨーク市の画像に変更されることを確認します。

![AEM Assets Dynamic Media](./images/aemdm58.png)

「**newyork**」という単語を選択して「`dubai`」に変更し、UI の別の場所をクリックして、ドバイの街の画像に対する変更を確認します。

最後に、「**公開**」をクリックします。

![AEM Assets Dynamic Media](./images/aemdm60.png)

この画像が表示されます。 **はい** をクリックします。

![AEM Assets Dynamic Media](./images/aemdm61.png)

これで、Dynamic Media テンプレートが正常に設定され、公開されました。 次の演習では、このテンプレートをAdobe Journey Optimizerのメールキャンペーンと組み合わせて使用します。

## 次の手順

次の手順：[Adobe Journey Optimizerで dynamic media テンプレートを使用する ](./ex2.md){target="_blank"}

[Adobe Experience Manager Assetsと Dynamic Media](./aemassetsdm.md){target="_blank"} に戻る

[ すべてのモジュールに戻る ](./../../../overview.md){target="_blank"}
