---
title: Frame.io とWorkfront Fusion
description: Frame.io とWorkfront Fusion
role: Developer
level: Beginner
jira: KT-5342
doc-type: Tutorial
exl-id: 37de6ceb-833e-4e75-9201-88bddd38a817
source-git-commit: da6917ec8c4e863e80eef91280e46b20816a5426
workflow-type: tm+mt
source-wordcount: '2674'
ht-degree: 0%

---

# 1.2.5 Frame.io とWorkfront Fusion

前の演習では、シナリオ `--aepUserLdap-- - Firefly + Photoshop` を設定し、シナリオをトリガーにする受信 Webhook と、シナリオが正常に完了した際の Webhook 応答を設定しました。 次に、Postmanを使用してそのシナリオをトリガーにしました。 Postmanはテストに最適なツールですが、実際のシナリオでは、ビジネスユーザーはPostmanを使用してシナリオをトリガーすることはありません。 代わりに、別のアプリケーションを使用し、他のアプリケーションがWorkfront Fusion でシナリオをアクティブ化することを想定します。 この演習では、Frame.io を使用してまさにこれが行われます。

>[!NOTE]
>
>この演習を正常に完了するには、Frame.io アカウントの管理者ユーザーである必要があります。 以下の演習は Frame.io V3 用に作成され、後の段階で Frame.io V4 用に更新される予定です。

## 1.2.5.1 Frame.io へのアクセス

[https://app.frame.io/projects](https://app.frame.io/projects){target="_blank"} に移動します。

**+ アイコンをクリックして** Frame.io で独自のプロジェクトを作成します。

![ フレーム IO](./images/frame1.png)

`--aepUserLdap--` という名前を入力し、「**プロジェクトを作成**」をクリックします。

![ フレーム IO](./images/frame2.png)

その後、左側のメニューにプロジェクトが表示されます。
前の演習の 1 つで、[citisignal-fiber.psd](./../../../assets/ff/citisignal-fiber.psd){target="_blank"} をデスクトップにダウンロードしました。 そのファイルを選択し、作成したプロジェクトフォルダーにドラッグ&amp;ドロップします。

![ フレーム IO](./images/frame3.png)

## 1.2.5.2 Workfront Fusion と Frame.io

前の演習では、シナリオ `--aepUserLdap-- - Firefly + Photoshop` を作成しました。これは、カスタム Webhook で開始し、Webhook 応答で終了しました。 その後、Postmanを使用して Webhook の使用をテストしましたが、明らかに、そのようなシナリオのポイントは、外部アプリケーションによって呼び出されることです。 前に述べたように、Frame.io がその演習になりますが、Frame.io と `--aepUserLdap-- - Firefly + Photoshop` の間に、別のWorkfront Fusion シナリオが必要です。 次に、そのシナリオを設定します。

[https://experience.adobe.com/](https://experience.adobe.com/){target="_blank"} に移動します。 **Workfront Fusion** を開きます。

![WF Fusion](./images/wffusion1.png)

左側のメニューで、**シナリオ** に移動し、フォルダー `--aepUserLdap--` を選択します。 「**新しいシナリオを作成**」をクリックします。

![ フレーム IO](./images/frame4.png)

`--aepUserLdap-- - Frame IO Custom Action` という名前を使用します。

![ フレーム IO](./images/frame5.png)

キャンバスで **疑問符オブジェクト** をクリックします。 検索ボックスにテキスト `webhook` を入力し、「**Webhook**」をクリックします。

![ フレーム IO](./images/frame6.png)

**カスタム Webhook** をクリックします。

![ フレーム IO](./images/frame7.png)

**追加** をクリックして、新しい Webhook URL を作成します。

![ フレーム IO](./images/frame8.png)

**Webhook 名** には、`--aepUserLdap-- - Frame IO Custom Action Webhook` を使用します。 「**保存**」をクリックします。

![ フレーム IO](./images/frame9.png)

この画像が表示されます。 次の手順で必要になるので、この画面は開いたままにしておきます。 次の手順で、「**アドレスをクリップボードにコピー**」をクリックして、Webhook URL をコピーする必要があります。

![ フレーム IO](./images/frame10.png)

[https://developer.frame.io/](https://developer.frame.io/){target="_blank"} に移動します。 **デベロッパーツール** をクリックし、「**カスタムアクション**」を選択します。

![ フレーム IO](./images/frame11.png)

**カスタムアクションを作成** をクリックします。

![ フレーム IO](./images/frame12.png)

次の値を入力します。

- **NAME**：使用 `--aepUserLdap-- - Frame IO Custom Action Fusion`
- **説明**:`--aepUserLdap-- - Frame IO Custom Action Fusion` を使用します
- **EVENT**:`fusion.tutorial` を使用します。
- **URL**:Workfront Fusion で作成したばかりの Webhook の URL を入力します
- **TEAM**：適切な Frame.io チーム（この場合は「One Adobe Tutorial **を選択します**。

「**送信**」をクリックします。

![ フレーム IO](./images/frame15.png)

この画像が表示されます。

![ フレーム IO](./images/frame14.png)

[https://app.frame.io/projects](https://app.frame.io/projects){target="_blank"} に戻ります。 ページを更新します。

![ フレーム IO](./images/frame16.png)

ページを更新したら、アセット **citisignal-fiber.psd** の 3 ドット **...** をクリックします。 表示されるメニューに、前の手順で作成したカスタムアクションが表示されます。 「カスタムアクション」 `--aepUserLdap-- - Frame IO Custom Action Fusion` タンをクリックします。

![ フレーム IO](./images/frame17.png)

その後、同様の **Success!ポップアップ**。 このポップアップは、Frame.io とWorkfront Fusion 間のやり取りの結果です。

![ フレーム IO](./images/frame18.png)

画面をWorkfront Fusion に戻します。 **正常に決定されました** がカスタム Webhook オブジェクトに表示されます。 「**OK**」をクリックします。

![ フレーム IO](./images/frame19.png)

**Run Once** をクリックしてテストモードを有効にし、Frame.io との通信を再度テストします。

![ フレーム IO](./images/frame20.png)

Frame.io に戻り、カスタムアクション `--aepUserLdap-- - Frame IO Custom Action Fusion` ードをもう一度クリックします。

![ フレーム IO](./images/frame21.png)

画面をWorkfront Fusion に戻します。 緑のチェックマークと、バブルが **1** と表示されています。 バブルをクリックして詳細を確認します。

![ フレーム IO](./images/frame22.png)

バブルの詳細ビューには、Frame.io から受信したデータが表示されます。 様々な ID が表示されます。例えば、「**resource.id**」フィールドには、アセットの Frame.io 内の一意の ID **citisignal-fiber.psd** が表示されます。

![ フレーム IO](./images/frame23.png)

Frame.io とWorkfront Fusion の通信が確立されたので、設定を続行できます。

## 1.2.5.3 Frame.io へのカスタムフォーム応答の提供

Frame.io でカスタムアクションが呼び出されると、Frame.io はWorkfront Fusion から応答を受け取ることを想定します。 前の演習で作成したシナリオを思い出すと、標準のPhotoshop PSD ファイルを更新するには多数の変数が必要です。 これらの変数は、使用したペイロードで定義されます。

```json
{
    "psdTemplate": "citisignal-fiber.psd",
    "xlsFile": "placeholder",
    "prompt":"misty meadows",
    "cta": "Buy this now!",
    "button": "Click here to buy!"
}
```

したがって、シナリオ `--aepUserLdap-- - Firefly + Photoshop` が正常に実行されるには、**prompt**、**cta**、**button**&#x200B;**psdTemplate** などのフィールドが必要です。

最初の 3 つのフィールド **prompt**、**cta**、**button** には、ユーザーがカスタムアクションを呼び出す際に Frame.io で収集する必要があるユーザー入力が必要です。 そのため、Workfront Fusion 内でまず行う必要があるのは、これらの変数が使用可能かどうかを確認することです。使用可能でない場合は、Workfront Fusion は Frame.io に返信してそれらの変数の入力を求めます。 これを実現するには、Frame.io のフォームを使用します。

Workfront Fusion に戻り、シナリオ `--aepUserLdap-- - Frame IO Custom Action` ードを開きます。 **カスタム Webhook** オブジェクトにポインタを合わせて、「**+**」アイコンをクリックすると、別のモジュールが追加されます。

![ フレーム IO](./images/frame24.png)

`Flow Control` を検索し、「**フロー制御**」をクリックします。

![ フレーム IO](./images/frame25.png)

**Router** をクリックして選択します。

![ フレーム IO](./images/frame26.png)

この画像が表示されます。

![ フレーム IO](./images/frame27.png)

**をクリックするオブジェクト** クリックし、「**Webhook** を選択します。

![ フレーム IO](./images/frame28.png)

**Webhook 応答** を選択します。

![ フレーム IO](./images/frame29.png)

この画像が表示されます。

![ フレーム IO](./images/frame30.png)

以下の JSON コードをコピーして、「**本文** フィールドに貼り付けます。


```json
{
  "title": "What do you want Firefly to generate?",
  "description": "Enter your Firefly prompt.",
  "fields": [
    {
      "type": "text",
      "label": "Prompt",
      "name": "Prompt",
      "value": ""
    },
    {
      "type": "text",
      "label": "CTA Text",
      "name": "CTA Text",
      "value": ""
    },
    {
      "type": "text",
      "label": "Button Text",
      "name": "Button Text",
      "value": ""
    }
  ]
}
```

アイコンをクリックして、JSON コードをクリーンアップし美しくします。 次に、「**OK**」をクリックします。

![ フレーム IO](./images/frame31.png)

「**保存**」をクリックして変更を保存します。

![ フレーム IO](./images/frame32.png)

次に、フィルターを設定して、プロンプトがない場合にのみシナリオのこのパスが実行されるようにする必要があります。 **レンチ** アイコンをクリックし、「**フィルターを設定**」を選択します。

![ フレーム IO](./images/frame33.png)

次のフィールドを設定します。

- **ラベル**:`Prompt isn't available` を使用します。
- **条件**:`{{1.data.Prompt}}` を使用します。
- **基本演算子**：選択 **存在しません**。

>[!NOTE]
>
>Workfront Fusion の変数は、次の構文を使用して手動で指定できます。`{{1.data.Prompt}}` 変数内の数値は、シナリオ内のモジュールを参照します。 この例では、シナリオの最初のモジュールが **Webhook** と呼ばれ、シーケンス番号が **1** であることがわかります。 これは、変数 `{{1.data.Prompt}}` が、シーケンス番号 1 のモジュールからフィールド **data.Prompt** にアクセスすることを意味します。 シーケンス番号は異なる場合があるので、変数をコピー/貼り付ける際には注意し、常に使用するシーケンス番号が正しいことを確認してください。

「**OK**」をクリックします。

![ フレーム IO](./images/frame34.png)

この画像が表示されます。 最初に **保存** アイコンをクリックし、次に **1 回実行** をクリックして、シナリオをテストします。

![ フレーム IO](./images/frame35.png)

この画像が表示されます。

![ フレーム IO](./images/frame36.png)

Frame.io に戻り、アセット **citisignal-fiber.psd** のカスタムアクション `--aepUserLdap-- - Frame IO Custom Action Fusion` ージをもう一度クリックします。

![ フレーム IO](./images/frame37.png)

Frame.io 内にプロンプトが表示されます。 まだフィールドに入力せず、フォームも送信しません。 このプロンプトは、先ほど設定したWorkfront Fusion からの応答に基づいて表示されます。

![ フレーム IO](./images/frame38.png)

Workfront Fusion に戻り、「**Webhook response**」モジュールのバブルをクリックします。 **INPUT** の下に、フォームの JSON ペイロードを含む本文が表示されます。 もう一度 **実行** をクリックします。

![ フレーム IO](./images/frame40.png)

このメッセージが再び表示されます。

![ フレーム IO](./images/frame41.png)

Frame.io に戻り、指示に従ってフィールドに入力します。 「**送信**」をクリックします。

![ フレーム IO](./images/frame39.png)

すると、「Success **が表示されます。ポップアップ**。

![ フレーム IO](./images/frame42.png)

Workfront Fusion に戻り、「**カスタム Webhook** モジュールのバブルをクリックします。 操作 1 の **OUTPUT** の下に、**Button Text**、**CTA Text** **、&lbrace;Prompt** などのフィールドを含む新しい **data** オブジェクトが表示されるようになりました。 シナリオで利用できるこれらのユーザー入力変数を使用すれば、設定を続行するのに十分です。

![ フレーム IO](./images/frame43.png)

## 1.2.5.4 Frame.io からファイルの場所を取得

前に述べたように、このシナリオを機能させるには、**prompt**、**cta**、**button**&#x200B;**psdTemplate** などのフィールドが必要です。 最初の 3 つのフィールドは既に使用可能になっていますが、使用する **psdTemplate** はまだ見つかりません。 **psdTemplate** は、ファイル **citisignal-fiber.psd** が Frame.io でホストされているので、Frame.io の場所を参照するようになりました。 ファイルの場所を取得するには、Workfront Fusion で Frame.io 接続を設定して使用する必要があります。

Workfront Fusion に戻り、シナリオ `--aepUserLdap-- - Frame IO Custom Action` ードを開きます。 **にカーソルを合わせますか？モジュール**、「**+**」アイコンをクリックして別のモジュールを追加し、`frame` を検索します。 **Frame.io** をクリックします。

![ フレーム IO](./images/frame44.png)

**Frame.io （レガシー）** をクリックします。

![ フレーム IO](./images/frame45.png)

**アセットを取得** をクリックします。

![ フレーム IO](./images/frame46.png)

Frame.io 接続を使用するには、まず設定する必要があります。 「**追加**」をクリックします。

![ フレーム IO](./images/frame47.png)

**接続タイプ** ドロップダウンを開きます。

![ フレーム IO](./images/frame48.png)

**Frame.io API キー** を選択し、名前 `--aepUserLdap-- - Frame.io Token` を入力します。

![ フレーム IO](./images/frame49.png)

API トークンを取得するには、[https://developer.frame.io/](https://developer.frame.io/){target="_blank"} にアクセスしてください。 **デベロッパーツール** をクリックし、「**トークン**」を選択します。

![ フレーム IO](./images/frame50.png)

**トークンの作成** をクリックします。

![ フレーム IO](./images/frame51.png)

**説明**`--aepUserLdap-- - Frame.io Token` を使用して、「**すべての範囲を選択**」をクリックします。

![ フレーム IO](./images/frame52.png)

下にスクロールして、「送信 **をクリックし** す。

![ フレーム IO](./images/frame53.png)

これで、トークンが作成されました。 **コピー** をクリックして、クリップボードにコピーします。

![ フレーム IO](./images/frame54.png)

Workfront Fusion のシナリオに戻ります。 トークンを「Your Frame.io API Key **フィールドにペースト** ます。 「**OK**」をクリックします。接続はWorkfront Fusion でテストされます。

![ フレーム IO](./images/frame55.png)

接続が正常にテストされた場合は、**接続** に自動的に表示されます。 これで接続が正常に完了しました。設定を完了して、ファイルの場所を含む Frame.io からすべてのアセットの詳細を取得する必要があります。 これを行うには、**アセット ID** を指定する必要があります。

![ フレーム IO](./images/frame56.png)

**アセット ID** は、最初の **カスタム Webhook** 通信の一環として Frame.io からWorkfront Fusion に共有され、「**resource.id**」フィールドにあります。 **resource.id** を選択して「**OK**」をクリックします。

![ フレーム IO](./images/frame57.png)

これが表示されます。 変更を保存し、「**1 回実行**」をクリックしてシナリオをテストします。

![ フレーム IO](./images/frame58.png)

Frame.io に戻り、アセット **citisignal-fiber.psd** のカスタムアクション `--aepUserLdap-- - Frame IO Custom Action Fusion` ージをもう一度クリックします。

![ フレーム IO](./images/frame37.png)

Frame.io 内にプロンプトが表示されます。 まだフィールドに入力せず、フォームも送信しません。 このプロンプトは、先ほど設定したWorkfront Fusion からの応答に基づいて表示されます。

![ フレーム IO](./images/frame38.png)

Workfront Fusion に戻ります。 もう一度 **実行** をクリックします。

![ フレーム IO](./images/frame59.png)

Frame.io に戻り、指示に従ってフィールドに入力します。 「**送信**」をクリックします。

![ フレーム IO](./images/frame39.png)

Workfront Fusion に戻り、「**Frame.io - アセットを取得** モジュールのバブルをクリックします。

![ フレーム IO](./images/frame60.png)

特定のアセット **citisignal-fiber.psd** に関する多くのメタデータを表示できるようになりました。

![ フレーム IO](./images/frame61.png)

このユースケースに必要な特定の情報は、ファイル **citisignal-fiber.psd** の場所 URL です。これを見つけるには、フィールド **Original** までスクロールします。

![ フレーム IO](./images/frame62.png)

これで、このシナリオが機能するために必要なすべてのフィールド（**prompt**、**cta**、**button** および **psdTemplate**）が使用可能になりました。

## 1.2.5.5 Workfrontを呼び出しシナリオ

前の演習では、シナリオ `--aepUserLdap-- - Firefly + Photoshop` を設定しました。 次に、そのシナリオに小さな変更を加える必要があります。

別のタブでシナリオ `--aepUserLdap-- - Firefly + Photoshop` を開き、最初の **Adobe Photoshop - PSDの編集内容を適用** モジュールをクリックします。 これで、入力ファイルがMicrosoft Azure の動的な場所を使用するように設定されていることがわかります。 このユースケースでは、入力ファイルはMicrosoft Azure に保存されなくなり、代わりに Frame.io ストレージを使用するので、これらの設定を変更する必要があります。

![ フレーム IO](./images/frame63.png)

**ストレージ** を **外部** に変更し、**ファイルの場所** を受信した **カスタム Webhook** モジュールから取得した **psdTemplate** 変数のみを使用するように変更します。 「**OK**」をクリックし、「**保存**」をクリックして変更を保存します。

![ フレーム IO](./images/frame64.png)

**カスタム Webhook** モジュールをクリックし、「**アドレスをクリップボードにコピー**」をクリックします。 他のシナリオで使用する必要があるので、URL をコピーする必要があります。

![ フレーム IO](./images/frame65.png)

シナリオ `--aepUserLdap-- - Frame IO Custom Action` ージに戻ります。 **Frame.io - アセットを取得** モジュールにポインタを合わせて、「**+**」アイコンをクリックします。

![ フレーム IO](./images/frame66.png)

`http` と入力し、「**HTTP**」をクリックします。

![ フレーム IO](./images/frame67.png)

「**リクエストを行う**」を選択します。

![ フレーム IO](./images/frame68.png)

カスタム Webhook の URL を「**URL**」フィールドに貼り付けます。 **メソッド** を POST**に設定します。

![ フレーム IO](./images/frame69.png)

**本文タイプ** を **Raw** に、**コンテンツタイプ** を **JSON （application/json）** に設定します。
以下の JSON ペイロードを「コンテンツをリクエスト **フィールドに貼り付け**&#x200B;**応答を解析** のチェックボックスを有効にします。

```json
{
    "psdTemplate": "citisignal-fiber.psd",
    "xlsFile": "placeholder",
    "prompt":"misty meadows",
    "cta": "Buy this now!",
    "button": "Click here to buy!"
}
```

これで静的ペイロードが設定されましたが、以前に収集した変数を使用して動的にする必要があります。

![ フレーム IO](./images/frame70.png)

**psdTemplate** フィールドについては、静的変数 **citisignal-fiber.psd** を変数 **Original** に置き換えます。

![ フレーム IO](./images/frame71.png)

**prompt**、**cta** および **button** フィールドについては、Frame.io からの受信 Webhook リクエストによってシナリオに挿入された動的変数で静的変数を置き換えます。これらのフィールドは、**data.Prompt**、**data.CTA Text** および **data.Button Text** です。

「**OK**」をクリックします。

![ フレーム IO](./images/frame72.png)

「**保存**」をクリックして変更を保存します。

![ フレーム IO](./images/frame73.png)

## 1.2.5.6 Frame.io に新しいアセットを保存

他のWorkfront Fusion シナリオを呼び出すと、結果は、使用可能な新しいPhotoshop PSD テンプレートになります。 そのPSD ファイルを Frame.io に再度保存する必要があります。これは、このシナリオの最後の手順です。

「**HTTP - リクエストを行う**」モジュールにポインタを合わせて、「**+**」アイコンをクリックします。

![ フレーム IO](./images/frame74.png)

**Frame.io （レガシー）** を選択します。

![ フレーム IO](./images/frame75.png)

**アセットを作成** を選択します。

![ フレーム IO](./images/frame76.png)

Frame.io 接続が自動的に選択されます。

![ フレーム IO](./images/frame77.png)

次のオプションを選択します。

- **チーム ID**：適切なチーム ID （この場合は `One Adobe Tutorial`）を選択します。
- **プロジェクト ID**:`--aepUserLdap--` を使用します。
- **フォルダー ID**:`root` を使用します。
- **タイプ**:`File` を使用します。

![ フレーム IO](./images/frame78.png)

フィールド **Name** には、**timestamp** などの変数を使用できます（または、より理にかなった値に変更します）。 定義済みの変数 **タイムスタンプ** は、「**日付と時刻** タブにあります。

![ フレーム IO](./images/frame79.png)

フィールド **Source URL** について、以下の JSON コードを使用します。

```json
{{6.data.newPsdTemplate}}
```

>[!NOTE]
>
>Workfront Fusion の変数は、次の構文を使用して手動で指定できます。`{{6.data.newPsdTemplate}}` 変数内の数値は、シナリオ内のモジュールを参照します。 この例では、シナリオの 6 番目のモジュールが **HTTP - リクエストを行う** と呼ばれ、シーケンス番号が **6** であることがわかります。 これは、変数 `{{6.data.newPsdTemplate}}` が、シーケンス番号 6 のモジュールからフィールド **data.newPsdTemplate** にアクセスすることを意味します。 シーケンス番号は異なる場合があるので、変数をコピー/貼り付ける際には注意し、常に使用するシーケンス番号が正しいことを確認してください。

「**OK**」をクリックします。

![ フレーム IO](./images/frame80.png)

「**保存**」をクリックして変更を保存します。

![ フレーム IO](./images/frame81.png)

最後に、フィルターを設定して、プロンプトが使用可能な場合にのみシナリオのこのパスが実行されるようにする必要があります。 **レンチ** アイコンをクリックし、「**フィルターを設定**」を選択します。

![ フレーム IO](./images/frame82.png)

次のフィールドを設定します。

- **ラベル**:`Prompt is available` を使用します。
- **条件**:`{{1.data.Prompt}}` を使用します。
- **基本演算子**: **exists** を選択します。

>[!NOTE]
>
>Workfront Fusion の変数は、次の構文を使用して手動で指定できます。`{{1.data.Prompt}}` 変数内の数値は、シナリオ内のモジュールを参照します。 この例では、シナリオの最初のモジュールが **Webhook** と呼ばれ、シーケンス番号が **1** であることがわかります。 これは、変数 `{{1.data.Prompt}}` が、シーケンス番号 1 のモジュールからフィールド **data.Prompt** にアクセスすることを意味します。 シーケンス番号は異なる場合があるので、変数をコピー/貼り付ける際には注意し、常に使用するシーケンス番号が正しいことを確認してください。

「**OK**」をクリックします。

![ フレーム IO](./images/frame83.png)

「**保存**」をクリックして変更を保存します。

![ フレーム IO](./images/frame84.png)

## 1.2.5.7 エンドツーエンドのユースケースのテスト

シナリオ `--aepUserLdap-- - Frame IO Custom Action` ージで「**1 回実行**」をクリックします。

![ フレーム IO](./images/frame85.png)

Frame.io に戻り、アセット **citisignal-fiber.psd** のカスタムアクション `--aepUserLdap-- - Frame IO Custom Action Fusion` ージをもう一度クリックします。

![ フレーム IO](./images/frame37.png)

Frame.io 内にプロンプトが表示されます。 まだフィールドに入力せず、フォームも送信しません。 このプロンプトは、先ほど設定したWorkfront Fusion からの応答に基づいて表示されます。

![ フレーム IO](./images/frame38.png)

Workfront Fusion に戻ります。 シナリオ `--aepUserLdap-- - Frame IO Custom Action` ージで「**1 回実行**」をクリックします。

![ フレーム IO](./images/frame86.png)

Workfront Fusion で、シナリオ `--aepUserLdap-- - Firefly + Photoshop` を開き、そのシナリオで **1 回実行** をクリックします。

![ フレーム IO](./images/frame87.png)

Frame.io に戻り、指示に従ってフィールドに入力します。 「**送信**」をクリックします。

![ フレーム IO](./images/frame39.png)

1～2 分後に、Frame.io に新しいアセットが自動的に表示されます。 新しいアセットをダブルクリックして開きます。

![ フレーム IO](./images/frame88.png)

これで、すべてのユーザー入力変数が自動的に適用されたことを明確に確認できます。

![ フレーム IO](./images/frame89.png)

この演習を正常に完了しました。

## 次の手順

[1.2.6 Frame.io から Fusion に移動して、AEM Assetsに移動します ](./ex6.md){target="_blank"}

[Workfront Fusion のCreative Workflow Automation に戻る ](./automation.md){target="_blank"}

[ すべてのモジュール ](./../../../overview.md){target="_blank"} に戻る

