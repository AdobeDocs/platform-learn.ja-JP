---
title: AJO Translation Services を使用したキャンペーンの作成
description: AJO Translation Services を使用したキャンペーンの作成
kt: 5342
doc-type: tutorial
source-git-commit: 3b3c62499bfed86ab13a657a816424879cab4f42
workflow-type: tm+mt
source-wordcount: '1644'
ht-degree: 10%

---

# 3.2.2 キャンペーンの作成

[https://experience.adobe.com/](https://experience.adobe.com/) に移動します。 **Journey Optimizer** をクリックします。

![ 翻訳 ](./images/ajolp1.png)

Journey Optimizerの **ホーム** ビューにリダイレクトされます。 最初に、正しいサンドボックスを使用していることを確認します。 使用するサンドボックスは `--aepSandboxName--` です。

![ACOP](./images/ajolp2.png)

## 3.2.2.1 ヘッダーフラグメントを作成する

左側のメニューで、「**フラグメント**」をクリックします。 フラグメントは、Journey Optimizer内の再利用可能なコンポーネントで、重複を回避し、メールメッセージのヘッダーやフッターの変更など、すべてのメッセージに影響を与える将来の変更を容易にします。

**フラグメントを作成** をクリックします。

![ACOP](./images/fragm1.png)

`--aepUserLdap-- - CitiSignal - Header` という名前を入力し、**タイプ：ビジュアルフラグメント** を選択します。 「**作成**」をクリックします。

![ACOP](./images/fragm2.png)

その後、これが表示されます。 左側のメニューには、メールの構造（行と列）を定義するために使用できる構造コンポーネントがあります。

メニューからキャンバスに **1:1 列** をドラッグ&amp;ドロップします。 これがロゴ画像のプレースホルダーになります。

![Journey Optimizer](./images/fragm3.png)

次に、コンテンツコンポーネントを使用して、これらのブロック内にコンテンツを追加できます。 **画像** コンポーネントを最初の行の最初のセルにドラッグ&amp;ドロップします。 **参照** をクリックします。

![Journey Optimizer](./images/fragm4.png)

ポップアップが開き、AEM Assets Media Libraryが表示されます。 フォルダー **citi-signal-images** に移動し、画像 **CitiSignal-Logo-White.png** をクリックして選択し、**選択** をクリックします。

>[!NOTE]
>
>AEM Assetsライブラリに Citi Signal 画像が表示されない場合は、[ こちら ](../../../assets/ajo/CitiSignal-images.zip) で見つけることができます。 デスクトップにダウンロードし、フォルダー **citi-signal-images** を作成し、そのフォルダー内のすべての画像をアップロードします。

![Journey Optimizer](./images/fragm5.png)

その後、これが表示されます。 画像は白で、まだ表示されていません。 画像を正しく表示するための背景色を定義する必要があります。 **スタイル** をクリックし、「**背景色** ボックスをクリックします。

![Journey Optimizer](./images/fragm6.png)

ポップアップで、**16 進数** カラーコードを **#8821F4** に変更し、「**100%**」フィールドをクリックしてフォーカスを変更します。 次に、画像に適用された新しい色を確認します。

![Journey Optimizer](./images/fragm7.png)

今のイメージも少し大きいです。 **幅** スイッチャーを **40%** にスライドして幅を変更します。

![Journey Optimizer](./images/fragm8.png)

これで、ヘッダーフラグメントの準備が整いました。 「**保存**」をクリックし、矢印をクリックして前の画面に戻ります。

![Journey Optimizer](./images/fragm9.png)

フラグメントを使用するには、公開する必要があります。 「**公開**」をクリックします。

![Journey Optimizer](./images/fragm10.png)

数分後、フラグメントのステータスが **ライブ** に変更されたことがわかります。
次に、メールメッセージのフッター用に新しいフラグメントを作成する必要があります。 **フラグメントを作成** をクリックします。

![Journey Optimizer](./images/fragm11.png)

## 3.2.2.2 フッターフラグメントの作成

**フラグメントを作成** をクリックします。

![Journey Optimizer](./images/fragm11.png)

`--aepUserLdap-- - CitiSignal - Footer` という名前を入力し、**タイプ：ビジュアルフラグメント** を選択します。 「**作成**」をクリックします。

![Journey Optimizer](./images/fragm12.png)

その後、これが表示されます。 左側のメニューには、メールの構造（行と列）を定義するために使用できる構造コンポーネントがあります。

メニューからキャンバスに **1:1 列** をドラッグ&amp;ドロップします。 これがフッターコンテンツのプレースホルダーになります。

![Journey Optimizer](./images/fragm13.png)

次に、コンテンツコンポーネントを使用して、これらのブロック内にコンテンツを追加できます。 **HTML** コンポーネントを最初の行の最初のセルにドラッグ&amp;ドロップします。 コンポーネントをクリックして選択し、「**&lt;/>**」アイコンをクリックしてHTMLソースコードを編集します。

![Journey Optimizer](./images/fragm14.png)

その後、これが表示されます。

![Journey Optimizer](./images/fragm15.png)

以下のHTMLコードフラグメントをコピーして、Journey Optimizerの **HTMLを編集** ウィンドウに貼り付けます。

```html
<!--[if mso]><table cellpadding="0" cellspacing="0" border="0" width="100%"><tr><td style="text-align: center;" ><![endif]-->
<table style="width: auto; display: inline-block;">
  <tbody>
    <tr class="component-social-container">
      <td style="padding: 5px">
        <a style="text-decoration: none;" href="https://www.facebook.com" data-component-social-icon-id="facebook">
        
        </a>
      </td>
      <td style="padding: 5px">
        <a style="text-decoration: none;" href="https://x.com" data-component-social-icon-id="twitter">
        
        </a>
      </td>
      <td style="padding: 5px">
        <a style="text-decoration: none;" href="https://www.instagram.com" data-component-social-icon-id="instagram">
         
        </a>
      </td>
    </tr>
  </tbody>
</table>
<!--[if mso]></td></tr></table><![endif]-->
```

これで完了です。 7、12、17 行目で、AEM Assets ライブラリのアセットを使用して画像ファイルを挿入する必要があります。

![Journey Optimizer](./images/fragm16.png)

カーソルが 7 行目にあることを確認し、左側のメニューで **Assets** をクリックします。 **アセットセレクターを開く** をクリックして、画像を選択します。

![Journey Optimizer](./images/fragm17.png)

フォルダー **citi-signal-images** を開き、クリックして画像 **Icon_Facebook.png** を選択します。 「**選択**」をクリックします。

![Journey Optimizer](./images/fragm18.png)

カーソルが 12 行目にあることを確認し、**アセットセレクターを開く** をクリックして画像を選択します。

![Journey Optimizer](./images/fragm19.png)

フォルダー **citi-signal-images** を開き、クリックして画像 **Icon_X.png** を選択します。 「**選択**」をクリックします。

![Journey Optimizer](./images/fragm20.png)

カーソルが 17 行目にあることを確認し、**アセットセレクターを開く** をクリックして画像を選択します。

![Journey Optimizer](./images/fragm21.png)

フォルダー **citi-signal-images** を開き、クリックして画像 **Icon_Instagram.png** を選択します。 「**選択**」をクリックします。

![Journey Optimizer](./images/fragm22.png)

その後、これが表示されます。 「**保存**」をクリックします。

![Journey Optimizer](./images/fragm23.png)

その後、エディターに戻ります。 背景と画像ファイルがすべて白になっているため、アイコンはまだ表示されません。 背景色を変更するには、「**スタイル**」に移動し、「**背景色**」チェックボックスをクリックします。

![Journey Optimizer](./images/fragm24.png)

**16 進数** のカラーコードを **#000000** に変更します。

![Journey Optimizer](./images/fragm25.png)

中央揃えに変更します。

![Journey Optimizer](./images/fragm26.png)

フッターに他の部分を追加しましょう。 **画像** コンポーネントを、作成したHTMLコンポーネントの上にドラッグ&amp;ドロップします。 **参照** をクリックします。

![Journey Optimizer](./images/fragm27.png)

をクリックして画像ファイル **`CitiSignal_Footer_Logo.png`** を選択し、**選択** をクリックします。

![Journey Optimizer](./images/fragm28.png)

「**スタイル**」に移動し、「**背景色**」チェックボックスをクリックして、もう一度黒に変更します。 **16 進数** のカラーコードを **#000000** に変更します。

![Journey Optimizer](./images/fragm29.png)

幅を **20%** に変更し、線形が中央揃えに設定されていることを確認します。

![Journey Optimizer](./images/fragm30.png)

次に、**テキスト** コンポーネントを、作成したHTMLコンポーネントの下にドラッグ&amp;ドロップします。 **参照** をクリックします。

![Journey Optimizer](./images/fragm31.png)

プレースホルダーテキストを置き換えて、以下のテキストをコピー&amp;ペーストします。

```
1234 N. South Street, Anywhere, US 12345

Unsubscribe

©2024 CitiSignal, Inc and its affiliates. All rights reserved.
```

中央揃えにする **テキストの配置** を設定します。

![Journey Optimizer](./images/fragm32.png)

**フォントカラー** を白、**#FFFFFF** に変更します。

![Journey Optimizer](./images/fragm33.png)

**背景色** を黒、**#000000** に変更します。

![Journey Optimizer](./images/fragm34.png)

フッターでテキスト **登録解除** を選択し、メニューバーの **リンク** アイコンをクリックします。 **タイプ** を **外部オプトアウト/購読解除** に設定し、URL を **https://aepdemo.net/unsubscribe.html** に設定します（購読解除リンクの空白の URL を持つことはできません）。

![Journey Optimizer](./images/fragm35.png)

これで完了です。 これで、フッターの準備が整いました。 「**保存**」をクリックし、矢印をクリックして前のページに戻ります。

![Journey Optimizer](./images/fragm36.png)

**Publish** をクリックしてフッターを公開し、メールで使用できるようにします。

![Journey Optimizer](./images/fragm37.png)

数分後、フッターのステータスが **ライブ** に変更されます。

![Journey Optimizer](./images/fragm38.png)

## 3.2.2.3 ファイバージャーニーの作成

次に、ジャーニーを作成します。 受信エクスペリエンスイベントに依存するイベントベースのジャーニーとは異なり、このジャーニーは、既存のオーディエンスの読み取りに重点を置き、ニュースレター、1 回限りのプロモーション、特定のキャンペーンなどの一意のコンテンツで、1 回だけオーディエンス全体をターゲットにします。

メニューで、**ジャーニーに移動し** 「**ジャーニーを作成**」をクリックします。

![Journey Optimizer](./images/campaign1.png)

ジャーニー作成画面で、「**名前** を `--aepUserLdap-- - Fiber` に設定します。 「**保存**」をクリックします。

![Journey Optimizer](./images/campaign2.png)

**オーケストレーション** メニューで、**オーディエンスを読み取り** オブジェクトをキャンバスにドラッグ&amp;ドロップします。

![Journey Optimizer](./images/campaign2a.png)

**編集** アイコンをクリックして、オーディエンスを選択します。

![Journey Optimizer](./images/campaign2b.png)

**オーディエンス** には、前の手順で作成したオーディエンス（`--aepUserLdap-- - CitiSignal Eligible for Fiber`）を選択します。 「**保存**」をクリックします。

![Journey Optimizer](./images/campaign2c.png)

この画像が表示されます。 **名前空間** を **メール** に設定します。 「**保存**」をクリックします。

![Journey Optimizer](./images/campaign3.png)

**アクション** の下の **メール** アクションをキャンバスにドラッグ&amp;ドロップします。

![Journey Optimizer](./images/campaign4.png)

**カテゴリ** を **マーケティング** に設定し、「**メール** の **設定** を選択します。 「**コンテンツを編集**」をクリックします。

![Journey Optimizer](./images/campaign5.png)

その後、これが表示されます。 **件名** の横にある **編集** アイコンをクリックします。

![Journey Optimizer](./images/campaign6.png)

件名を次のように設定します。

```
{{profile.person.name.firstName}}, here's your Fiber offer!
```

「**保存**」をクリックします。

![Journey Optimizer](./images/campaign5a.png)

この画像が表示されます。 次に、「**メール本文を編集**」をクリックします。

![Journey Optimizer](./images/campaign5b.png)

「**ゼロからデザイン**」を選択します。

![Journey Optimizer](./images/campaign7.png)

その後、これが表示されます。 左側のメニューには、メールの構造（行と列）を定義するために使用できる構造コンポーネントがあります。

キャンバス上に **1:1 列** を 2 回ドラッグ&amp;ドロップします。これにより、次の構造が得られます。

![Journey Optimizer](./images/campaign8.png)

左側のメニューで、**フラグメント** に移動します。 先ほど作成したヘッダーをキャンバスの最初のコンポーネントにドラッグします。 先ほど作成したフッターをキャンバスの最後のコンポーネントにドラッグします。

![Journey Optimizer](./images/campaign9.png)

左側のメニューで「**+**」アイコンをクリックします。 **コンテンツ** に移動して、キャンバスへのコンテンツの追加を開始します。

![Journey Optimizer](./images/campaign10.png)

**テキスト** コンポーネントを 2 行目にドラッグ&amp;ドロップします。

![Journey Optimizer](./images/campaign11.png)

そのコンポーネントのデフォルトのテキストを選択します **ここにテキストを入力してください。を** して、次のテキストに置き換えます。 整列を **中央整列** に変更します。

```javascript
Hi {{profile.person.name.firstName}}

As a CitiSignal member, you're part of a dynamic community that's constantly evolving to meet your needs. We're committed to delivering innovative solutions that enhance your digital lifestyle and keep you ahead of the curve.

Stay connected.
```

![Journey Optimizer](./images/campaign12.png)

**画像** コンポーネントを 3 行目と 4 行目にドラッグ&amp;ドロップします。 3 行目の **参照** をクリックします。

![Journey Optimizer](./images/campaign13.png)

フォルダー **citi-signal-images** を開き、画像 **Offer_AirPods.jpg** をクリックして選択し、**選択** をクリックします。

![Journey Optimizer](./images/campaign14.png)

4 行目の画像プレースホルダーにある **参照** をクリックします。

![Journey Optimizer](./images/campaign15.png)

フォルダー **citi-signal-images** を開き、画像 **Offer_Phone.jpg** をクリックして選択し、「**選択**」をクリックします。

![Journey Optimizer](./images/campaign16.png)

**テキスト** コンポーネントを 3 行目と 4 行目にドラッグ&amp;ドロップします。

![Journey Optimizer](./images/campaign17.png)

3 行目のコンポーネントでデフォルトのテキストを選択します **ここにテキストを入力してください。を** して、次のテキストに置き換えます。

```javascript
Get AirPods for free:

Experience seamless connectivity like never before with CitiSignal. Sign up for select premium plans and receive a complimentary pair of Apple AirPods. Stay connected in style with our unbeatable offer.
```

4 行目のコンポーネントでデフォルトのテキストを選択します **ここにテキストを入力してください。を** して、次のテキストに置き換えます。

```javascript
We'll pay off your phone:

Make the switch to CitiSignal and say goodbye to phone payments! Switching to CitiSignal has never been more rewarding. Say farewell to hefty phone bills as we help pay off your phone, up to 800$!
```

![Journey Optimizer](./images/campaign18.png)

これで、基本的なニュースレターのメールの準備が整いました。 「**保存**」をクリックします。

キャンペーンダッシュボードに戻るには、左上隅の件名行のテキストの横にある **矢印** をクリックします。

![Journey Optimizer](./images/campaign19.png)

**アクティブ化するレビュー** をクリックします。

![Journey Optimizer](./images/campaign20.png)

その後、このエラーが発生する場合があります。 その場合は、オーディエンスが評価されるまで最大 24 時間待ってから、もう一度キャンペーンをアクティブ化する必要がある可能性があります。 また、後で実行するようにキャンペーンのスケジュールを更新する必要がある場合もあります。

**アクティブ化** をクリックします。

![Journey Optimizer](./images/campaign21.png)

アクティブ化すると、キャンペーンを実行するようにスケジュールされます。

![Journey Optimizer](./images/campaign22.png)

これで、キャンペーンがアクティブ化されました。ニュースレターのメールメッセージは、スケジュールで定義したとおりに送信されます。キャンペーンは、最後のメールが送信されると停止します。

また、前に作成したデモプロファイルに使用したメールアドレスにもメールが届きます。

![Journey Optimizer](./images/campaign23.png)

この演習は完了しました。

## 次の手順

[3.2.3 ...](./ex3.md) に移動します。

[ モジュール 3.2](./ajotranslationsvcs.md){target="_blank"} に戻ります。

[ すべてのモジュール ](./../../../overview.md){target="_blank"} に戻る
