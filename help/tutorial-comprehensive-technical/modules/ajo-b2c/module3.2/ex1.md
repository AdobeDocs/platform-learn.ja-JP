---
title: Adobe Journey Optimizer – 外部天気 API、SMS アクションなど – イベントを定義
description: Adobe Journey Optimizer – 外部天気 API、SMS アクションなど
kt: 5342
doc-type: tutorial
source-git-commit: c6ba1f751f18afe39fb6b746a62bc848fa8ec9bf
workflow-type: tm+mt
source-wordcount: '805'
ht-degree: 2%

---

# 3.2.1 イベントの定義

[Adobe Experience Cloud](https://experience.adobe.com) に移動して、Adobe Journey Optimizerにログインします。 **Journey Optimizer** をクリックします。

![ACOP](./../../../modules/ajo-b2c/module3.1/images/acophome.png)

Journey Optimizerの **ホーム** ビューにリダイレクトされます。 最初に、正しいサンドボックスを使用していることを確認します。 使用するサンドボックスは `--aepSandboxId--` です。 サンドボックスを切り替えるには、「**実稼動製品（VA7）」をクリックし** リストからサンドボックスを選択します。 この例では、サンドボックスの名前は **AEP イネーブルメント FY22** です。 その後、サンドボックス `--aepSandboxId--` ージの **ホーム** ビューに移動します。

![ACOP](./../../../modules/ajo-b2c/module3.1/images/acoptriglp.png)

左側のメニューで、下にスクロールして、**設定** をクリックします。 次に、「イベント **の下にある** 管理 **ボタンをクリック** ます。

![ACOP](./images/acopmenu.png)

次に、使用可能なすべてのイベントの概要が表示されます。 「**イベントを作成**」をクリックして、独自のイベントの作成を開始します。

![ACOP](./images/emptyevent.png)

新しい空のイベントウィンドウがポップアップ表示されます。

![ACOP](./images/emptyevent1.png)

イベントの名前として、`--demoProfileLdap--GeofenceEntry` を使用します。 この例では、イベント名は `vangeluwGeofenceEntry` です。

説明を `Geofence Entry Event` に設定します。

![デモ](./images/evname.png)

次に、**タイプ** が **単一** に設定されていることを確認し、**イベント ID タイプ** の選択で「**システム生成**」を選択します。

![ACOP](./images/eventidtype.png)

次に、スキーマを選択する必要があります。 ここに示すスキーマはすべて、Adobe Experience Platform スキーマです。

![デモ](./images/evschema.png)

すべてのスキーマが表示されているわけではないことに注意してください。 Adobe Experience Platformでは、さらに多くのスキーマを使用できます。
このリストに表示するには、スキーマに非常に特定のフィールドグループがリンクされている必要があります。 ここに表示するために必要なフィールドグループは `Orchestration eventID` です。

これらのスキーマがAdobe Experience Platformでどのように定義されているかを簡単に見てみましょう。

左側のメニューで、**スキーマ** に移動し、新しいブラウザータブで開きます。 **スキーマ** で、**参照** に移動して、使用可能なスキーマのリストを表示します。
スキーマ `Demo System - Event Schema for Website (Global v1.1)` を開きます。

![データ取得](./images/schemas.png)

スキーマを開くと、フィールドグループ `Orchestration eventID` がスキーマの一部であることがわかります。
このフィールドグループには、`_experience.campaign.orchestration.eventID` と `originJourneyID` の 2 つのフィールドしかありません。

![データ取得](./images/schemageo.png)

このフィールドグループとこの特定の eventID フィールドがスキーマに含まれると、そのスキーマはAdobe Journey Optimizerで使用できるようになります。

Adobe Journey Optimizerのイベント設定に戻ります。

![デモ](./images/evschema.png)

このユースケースでは、ジオフェンスイベントをリッスンして顧客が特定の場所にいるかどうかを把握します。そのため、ここでスキーマ `Demo System - Event Schema for Website (Global v1.1)` をイベントのスキーマとして選択します。

![デモ](./images/evschema1.png)

その後、Adobe Journey Optimizerによって、一部の必須フィールドが自動的に選択されますが、Adobe Journey Optimizerで使用できるようになったフィールドは編集できます。

**鉛筆** アイコンをクリックして、フィールドを編集します。

![デモ](./images/editfields.png)

フィールドを選択できるスキーマ階層を含むポップアップウィンドウが表示されます。

![デモ](./images/popup.png)

ECID やオーケストレーション eventID などのフィールドは必須であり、事前に選択されています。

ただし、マーケターは、ジャーニーにコンテキストを提供するすべてのデータポイントに柔軟にアクセスできる必要があります。 次のフィールドも最小限に抑えて選択してください（場所コンテキストノード内）。

- 市区町村

完了したら、「**OK**」をクリックします。

![デモ](./images/popupok.png)

Adobe Journey Optimizerには、顧客を識別するための ID も必要です。 Adobe Journey OptimizerはAdobe Experience Platformにリンクされているので、ジャーニーのプライマリ ID がスキーマの ID として自動的に取得されます。
また、プライマリID はAdobe Experience Platformの完全な ID グラフを自動的に考慮し、使用可能なすべての ID、デバイス、チャネルにわたるすべての行動を同じプロファイルにリンクして、Adobe Journey Optimizerがコンテキストに応じて、関連性と一貫性を持つようにします。

![デモ](./images/eventidentifier.png)

**保存** をクリックして、カスタムイベントを保存します。

![デモ](./images/save.png)

その後、イベントは、使用可能なイベントのリストに含まれます。

![デモ](./images/eventlist.png)

最後に、カスタムイベントの `Orchestration eventID` を復元する必要があります。

イベントのリストでイベントをクリックして、もう一度開きます。
イベントで、「フィールド **の横にある** ペイロードを表示 **アイコンをクリック** ます。

![デモ](./images/eventlist1.png)

**ペイロードを表示** アイコンをクリックすると、このイベントのサンプル XDM ペイロードが開きます。

![デモ](./images/fieldseyepayload.png)

行 `eventID` が表示されるまで **ペイロード** を下にスクロールします。

![デモ](./images/fieldseyepayloadev.png)

最後に、設定をテストするために必要になるので、`eventID` を書き留めてください。

この例では、`eventID` は `fa42ab7982ba55f039eacec24c1e32e5c51b310c67f0fa559ab49b89b63f4934` です。

作成しているジャーニーをトリガーにするイベントを定義しました。 ジャーニーがトリガーされると、市区町村などのジオフェンスフィールドや、選択したその他のフィールド（国、緯度、経度など）がジャーニーで利用できるようになります。

ユースケースの説明で説明しているように、天気に応じたコンテキストプロモーションを提供する必要があります。 天気情報を取得するには、その場所の天気情報を提供する外部データソースを定義する必要があります。 **OpenWeather** サービスを使用して、2 の一部としてどのような情報を提供するかを確認します。

次の手順：[3.2.2 外部データソースを定義する ](./ex2.md)

[モジュール 3.2 に戻る](journey-orchestration-external-weather-api-sms.md)

[すべてのモジュールに戻る](../../../overview.md)
