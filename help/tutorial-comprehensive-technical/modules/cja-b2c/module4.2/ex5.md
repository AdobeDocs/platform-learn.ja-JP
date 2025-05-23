---
title: BigQuery Source コネクタを使用したAdobe Experience PlatformでのGoogle Analyticsデータの取得と分析 – Customer Journey Analyticsを使用したGoogle Analyticsデータの分析
description: BigQuery Source コネクタを使用したAdobe Experience PlatformでのGoogle Analyticsデータの取得と分析 – Customer Journey Analyticsを使用したGoogle Analyticsデータの分析
kt: 5342
doc-type: tutorial
exl-id: bd42d049-e2f6-45a3-82fe-e2ee530a76d7
source-git-commit: 1c91cb2129f827fd39dc065baf5d8ea067a5731a
workflow-type: tm+mt
source-wordcount: '3100'
ht-degree: 2%

---

# 4.2.5 Customer Journey Analyticsを使用したGoogle Analyticsデータの分析

## 目標

- BigQuery データセットをCustomer Journey Analytics（CJA）に接続
- ロイヤルティデータでGoogle Analyticsを接続して結合します。
- CJA UI の理解

## 4.2.5.1 接続の作成

[analytics.adobe.com](https://analytics.adobe.com) に移動して、Customer Journey Analyticsにアクセスします。

![ デモ ](./images/1a.png)

Customer Journey Analyticsホームページで、「**連携**」に移動します。

ここでは、CJA と Platform の間で行われたすべての異なる接続を確認できます。 これらの接続の目標は、Adobe Analyticsのレポートスイートと同じです。 ただし、データの収集は完全に異なります。 すべてのデータは、Adobe Experience Platform データセットから取得されます。

**新しい接続を作成** をクリックします。

![ デモ ](./images/conn3.png)

その後、**接続を作成** UI が表示されます。

![ デモ ](./images/5.png)

名前には、`--aepUserLdap-- - GA + Loyalty Data Connection` を使用します。

使用する正しいサンドボックスを選択する必要があります。 サンドボックスメニューで、`--aepSandboxName--` すサンドボックスを選択します。 この例では、使用するサンドボックスは **テクニカルインサイダー** です。

**毎日のイベントの平均数** を **100 万未満** に設定します。

これで、データセットメニューでデータセットの追加を開始できます。 「**データセットを追加**」をクリックします。

![ デモ ](./images/6.png)

追加するデータセットは次のとおりです。
- `Demo System - Profile Dataset for CRM (Global v1.1)`
- `Demo System - Event Dataset for BigQuery (Global v1.1)`

両方のデータセットを検索し、チェックボックスをオンにして、「**次へ**」をクリックします。

![ デモ ](./images/d1.png)

次の画面が表示されます。

![ デモ ](./images/8.png)

データセット `Demo System - Event Dataset for BigQuery (Global v1.1)` の場合は、**ユーザー ID** を **loyaltyId** に変更し、**データソースタイプ** を **web データ** に設定します。 **すべての新しいデータをインポート** と **すべての既存データをバックフィル** の両方のオプションを有効にします。

![ デモ ](./images/d2.png)

データセット `Demo System - Event Dataset for BigQuery (Global v1.1)` の場合は、**ユーザー ID** が **crmId** に設定されていることを確認し、**データソースタイプ** を **web データ** に設定します。 **すべての新しいデータをインポート** と **すべての既存データをバックフィル** の両方のオプションを有効にします。 「**データセットを追加**」をクリックします。

![ デモ ](./images/d3.png)

君はここにいるよ。 「**保存**」をクリックします。

![ デモ ](./images/d4.png)

**接続** を作成した後、CJA でデータを使用できるようになるまで数時間かかる場合があります。

使用可能な接続のリストに接続が表示されます。

![ デモ ](./images/d5.png)

## 4.2.5.2 データビューの作成

接続が完了したら、影響を与えるビジュアライゼーションに進むことができます。 Adobe Analyticsと CJA の違いは、ビジュアライゼーションの前にデータをクリーンアップして準備するために、CJA にデータビューが必要である点です。

データビューは、Adobe Analyticsの仮想レポートスイートの概念に似ています。コンテキスト対応の訪問の定義、フィルタリングおよびコンポーネントの呼び出し方法を定義します。

接続ごとに少なくとも 1 つのデータビューが必要です。 ただし、一部のユースケースでは、異なるチームに異なるインサイトを与えるために、同じ接続に対して複数のデータビューを持つことが素晴らしいことです。

会社をデータ駆動型にしたい場合は、各チームでのデータの表示方法を調整する必要があります。 次に例を示します。

- UX デザインチーム専用の UX 指標
- デジタル分析チームが 1 か国語しか話せるように、Google Analyticsの KPI と指標にはCustomer Journey Analyticsと同じ名前を使用します。
- 1 つのマーケットのみ、1 つのブランド、またはモバイルデバイスのみのインスタンスデータを表示するようにフィルタリングされたデータビュー。

**接続** 画面で、作成した接続の前にあるチェックボックスをオンにします。 **データビューを作成** をクリックします。

![ デモ ](./images/exta.png)

**データビューを作成** ワークフローにリダイレクトされます。

![ デモ ](./images/extc.png)

これで、データビューの基本的な定義を設定できます。 タイムゾーン、セッションタイムアウト、データビューフィルタリング（Adobe Analyticsの仮想レポートスイートに似たセグメント化部分）などがあります。

前の演習で作成した **接続** が既に選択されています。 接続名は `--aepUserLdap-- - GA + Loyalty Data Connection` です。

次に、データビューに次の命名規則に従った名前を付けます：`--aepUserLdap-- - GA + Loyalty Data View`。

説明に同じ値を入力します：`--aepUserLdap-- - GA + Loyalty Data View`。

分析またはビジュアライゼーションを行う前に、すべてのフィールド、ディメンション、指標とそのアトリビューション設定を含むデータビューを作成する必要があります。

| フィールド | 命名規則 |
| ----------------- |-------------|  
| 名前の接続 | `--aepUserLdap-- - GA + Loyalty Data View` | vangeluw - GA + ロイヤルティデータビュー |
| 説明 | `--aepUserLdap-- - GA + Loyalty Data View` |
| 外部 ID | `--aepUserLdap--GA` |

**保存して続行** をクリックします。

![ デモ ](./images/22.png)

「**保存**」をクリックします。

![ デモ ](./images/22a.png)

データビューにコンポーネントを追加できるようになりました。 ご覧のように、一部の指標およびディメンションは自動的に追加されます。

![ デモ ](./images/24.png)

データビューに以下のコンポーネントを追加します。 また、フィールド名をわかりやすい名前に更新します。 それには、指標またはディメンションを選択し、右側のメニューの **コンポーネント名** フィールドを更新します。

| コンポーネントタイプ | コンポーネントの元の名前 | 表示名 | コンポーネントパス |
| -----------------| -----------------|-----------------|-----------------|
| 指標 | commerce.checkouts.value | チェックアウト | `commerce.checkouts.value` |
| 指標 | commerce.productListRemovals.value | 買い物かごからの削除 | `commerce.productListRemovals.value` |
| 指標 | commerce.productListAdds | 買い物かご追加 | `commerce.productListAdds` |
| 指標 | commerce.productViews.value | 製品表示 | `commerce.productViews.value` |
| 指標 | commerce.purchases.value | 購入 | `commerce.purchases.value` |
| 指標 | web.webPageDetails.pageViews | ページビュー数 | `web.webPageDetails.pageViews` |
| 指標 | ポイント | ロイヤルティポイント | `_experienceplatform.loyaltyDetails.points` |
| ディメンション | レベル | ロイヤルティレベル | `_experienceplatform.loyaltyDetails.level` |
| ディメンション | channel.mediaType | トラフィックMedium | `channel.mediaType` |
| ディメンション | channel.typeAtSource | Traffic Source | `channel.typeAtSource` |
| ディメンション | トラッキングコード | マーケティングチャネル | `marketing.trackingCode` |
| ディメンション | gaid | GOOGLE ANALYTICSID | `_experienceplatform.identification.core.gaid` |
| ディメンション | web.webPageDetails.name | ページタイトル | `web.webPageDetails.name` |
| ディメンション | ベンダー | ブラウザー | `environment.browserDetails.vendor` |
| ディメンション | タイプ | Device Type | `device.type` |
| ディメンション | loyaltyId | ロイヤルティ ID | `_experienceplatform.identification.core.loyaltyId` |
| ディメンション | commerce.order.payments.transactionID | トランザクション ID | `commerce.order.payments.transactionID` |
| ディメンション | eventType | イベントタイプ | `eventType` |
| ディメンション | タイムスタンプ | タイムスタンプ | `timestamp` |
| ディメンション | `_id` | 識別子 | `_id` |

次のようなメッセージが表示されます。

![ デモ ](./images/25b.png)

次に、**アトリビューションまたは永続性設定** を変更して、これらのコンポーネントの一部について人物およびセッションのコンテキストを変更する必要があります。

以下のコンポーネントの **アトリビューション設定** を変更してください。

| コンポーネント |
| -----------------|
| Traffic Source |
| マーケティングチャネル |
| ブラウザー |
| トラフィックMedium |
| Device Type |
| GOOGLE ANALYTICSID |

それには、コンポーネントを選択し、**カスタム属性モデルを使用** をクリックして、**モデル** を **最新** に、**有効期限** を **人物レポートウィンドウ** に設定します。 上記のすべてのコンポーネントに対してこれを繰り返します。

![ デモ ](./images/27a.png)

前述のすべてのコンポーネントのアトリビューション設定を変更したら、このビューが表示されます。 **保存して続行** をクリックします。

![ デモ ](./images/27.png)

**設定** 画面では、変更は必要ありません。 「**保存して終了**」をクリックします。

![ デモ ](./images/27b.png)

これで、Adobe Analytics Analysis Workspace内でGoogle Analyticsデータを分析する準備が整いました。 次の演習に移りましょう。

## 4.2.5.3 プロジェクトの作成

Customer Journey Analyticsーで、**Workspace** に移動します。 「**プロジェクトを作成**」をクリックします。

![ デモ ](./images/pro1.png)

**空のWorkspace プロジェクト** を選択し、「**作成**」をクリックします。

![ デモ ](./images/pro2.png)

これで、空のプロジェクトが作成されました。

![ デモ ](./images/pro4.png)

まず、プロジェクトを保存し、名前を付けます。 次のコマンドを使用して保存できます。

| OS | ショートカット |
| ----------------- |-------------| 
| Windows | コントロール + S |
| Mac | Command + S |

ポップアップが表示されます。 次の命名規則を使用してください。

| 名前 | 説明 |
| ----------------- |-------------| 
| `--aepUserLdap-- – GA + Loyalty Workspace` | `--aepUserLdap-- – GA + Loyalty Workspace` |

次に、「**保存** をクリックします。

![ デモ ](./images/prsave.png)

次に、画面の右上隅で正しいデータビューを選択していることを確認します。 これは、前の演習で作成した、命名規則 `--aepUserLdap-- - GA + Loyalty Data View` のデータビューです。

![ デモ ](./images/prdvlist.png)

### 4.2.5.3.1 フリーフォームテーブル

フリーフォームテーブルは、Excel 内でピボットテーブルとして機能します（多かれ少なかれ）。 左側のバーから何かを選択し、フリーフォームにドラッグ&amp;ドロップすると、テーブルレポートが得られます。

フリーフォームテーブルはほぼ無制限です。 何でも（ほぼ）実行できますが、Google Analyticsと比較すると非常に価値があります（このツールにはいくつかの分析制限があるので）。 これは、Google Analyticsデータを別の分析ツールに読み込む理由の 1 つです。

SQL、BigQuery を使用する必要がある例と、Google AnalyticsUI やGoogle Data Studio 内では実行できない簡単な質問に回答する時間がある例を 2 つ示します。

- マーケティングチャネルで分割された Safari ブラウザーからチェックアウトに到着するユーザーは何人ですか？ チェックアウト指標が Safari ブラウザーでフィルタリングされていることを確認してください。 チェックアウト列の上に変数 Browser = Safari をドラッグ&amp;ドロップしました。

- アナリストの場合、ソーシャルマーケティングチャネルのコンバージョンは低いことがわかります。 ラストタッチアトリビューションをデフォルトとして使用していますが、ファーストタッチはどうですか？ 任意の指標の上にマウスポインターを置くと、指標設定が表示されます。 ここで、必要なアトリビューションモデルを選択できます。 アトリビューションは、（データスタジオではなく） GA でスタンドアロンアクティビティとして実行できますが、アトリビューション分析に関連しない他の指標やディメンションを同じテーブル内に含めることはできません。

CJA のAnalysis Workspaceを使用して、この質問やいくつかの質問に答えましょう。

まず、パネルの右側で適切な日付範囲（**Today**）を選択します。 **適用** をクリックします。

![ デモ ](./images/pro11.png)

>[!NOTE]
>
>**データ接続** と **データビュー** を作成したばかりの場合は、数時間待つ必要がある可能性があります。 大量のデータレコードがある場合、CJA は履歴データをバックフィルするためにある程度の時間を必要とします。

いくつかのディメンションと指標をドラッグ&amp;ドロップして、マーケティングチャネルを分析します。 まず、ディメンション **マーケティングチャネル** を使用し、**フリーフォームテーブル** のキャンバスにドラッグ&amp;ドロップします。 （指標メニューに指標がすぐには表示されない場合は、「**すべて表示**」をクリックします）

![ デモ ](./images/pro14.png)

次の画面が表示されます。

![ デモ ](./images/pro14a.png)

次に、フリーフォームテーブルに指標を追加する必要があります。 次の指標を追加する必要があります：**人物**、**セッション**、**製品表示**、**チェックアウト**、**購入**、**コンバージョン率** （計算指標）。

その前に、計算指標 **コンバージョン率** を作成する必要があります。 それには、指標の横の「**+**」アイコンをクリックします。

![ デモ ](./images/procalc1.png)

計算指標の名前として、**コンバージョン率** を使用し、**外部 ID** には **conversionRate** を使用します。 次に、指標 **購入** および **セッション** をキャンバスにドラッグします。 **形式** を **パーセント** に、**小数点以下の桁数** を **2** に設定します。 最後に、「**保存** をクリックします。

![ デモ ](./images/procalc2.png)

「**保存**」をクリックします。

![ デモ ](./images/procalc2a.png)

次に、これらの指標をすべて **フリーフォームテーブル** で使用するには、1 つずつ **フリーフォームテーブル** にドラッグ&amp;ドロップします。 以下の例を参照してください。

![ デモ ](./images/pro16.png)

最終的に、次のようなテーブルになります。

![ デモ ](./images/pro16a.png)

前述のように、**フリーフォームテーブル** は、詳細な分析を実行するために必要な自由を提供します。 例えば、他のDimensionを選択して、テーブル内の特定の指標を分類できます。

例えば、ディメンションに移動し、「**ブラウザー**」変数を検索して選択します。

![ デモ ](./images/new1.png)

次に、このDimensionで使用可能な値の概要を確認できます。

![ デモ ](./images/new2.png)

Dimension **Safari** を選択し、指標の上にドラッグ&amp;ドロップします（例：**チェックアウト**。 次の画面が表示されます。

![ デモ ](./images/new3.png)

Safari を使用してチェックアウトページに到着するユーザーの数（マーケティングチャネルで分割）

次に、アトリビューションの質問に答えます。

テーブルで **購入** 指標を見つけます。

![ デモ ](./images/pro20.png)

指標の上にマウスポインターを置くと、**設定** アイコンが表示されます。 クリックします。

![ デモ ](./images/pro21.png)

コンテキストメニューが表示されます。 **デフォルト以外の属性モデル** のチェックボックスをオンにします。

![ デモ ](./images/pro22.png)

表示されるポップアップで、アトリビューションモデルとルックバックウィンドウ（SQL で達成するのはかなり複雑）を簡単に変更できます。

![ デモ ](./images/pro23.png)

アトリビューションモデルとして **ファーストタッチ** を選択します。

![ デモ ](./images/pro24.png)

ルックバックウィンドウの **ユーザー** を選択します。

![ デモ ](./images/pro25.png)

次に、「**適用** をクリックします。

![ デモ ](./images/pro26.png)

これで、その特定の指標のアトリビューションモデルがファーストタッチになったことがわかります。

![ デモ ](./images/pro27.png)

変数、セグメント、ディメンション、日付範囲のタイプに制限なく、必要なだけ分類を実行できます。

さらに特別なのは、Adobe Experience Platformのデータセットを結合して、Google Analyticsのデジタル行動データを強化する機能です。 例えば、オフライン、コールセンター、ロイヤルティ、CRM データなどです。

この機能を紹介するために、オフラインデータとオンラインデータを組み合わせた最初の分類を設定します。 ディメンション **ロイヤルティレベル** を選択し、任意の **マーケティングチャネル** （例：**オーガニック検索** にドラッグ&amp;ドロップします。

![ デモ ](./images/pro28.png)

次に、**オーガニック検索** を使用して、**ロイヤルティレベル** である **ブロンズ** でサイトにアクセスした顧客が使用している **デバイスタイプ** を分析します。 Dimension **デバイスタイプ** を取得し、**ブロンズ** にドラッグ&amp;ドロップします。 次の画面が表示されます。

![ デモ ](./images/pro29.png)

最初の分類にロイヤルティレベルが使用されていることがわかります。 このディメンションは、BigQuery コネクタに使用したデータセットとは異なるデータセットと異なるスキーマから取得されます。 ユーザー ID **ロイヤルティ ID** （デモシステム - BigQuery のイベントスキーマ（グローバル v1.1））と **ロイヤルティ ID** （デモシステム – ロイヤルティのプロファイルスキーマ（グローバル v1.1））が一致します。 そのため、Google Analyticsのエクスペリエンスイベントとロイヤルティスキーマのプロファイルデータを組み合わせることができます。

行をセグメントや特定の日付範囲で分割し続けて（特定のテレビキャンペーンを反映するために）、Customer Journey Analyticsに質問し、外出先で回答を得ることができます。

SQL とサードパーティのビジュアライゼーションツールを使用して同じ結果を得るのは、非常に困難です。 特に、質問をしたり、その場で答えを得ようとしたりする場合。 Customer Journey Analyticsにはこの課題はなく、データアナリストはデータを柔軟かつリアルタイムでクエリできます。

## 4.2.5.3.2 ファネル分析またはフォールアウト分析

ファネルは、カスタマージャーニーの主な手順を理解するための優れたメカニズムです。 これらの手順は、オフラインインタラクション（コールセンターからなど）からも実行でき、同じファネル内でデジタルタッチポイントと組み合わせることができます。

Customer Journey Analyticsを使用すると、その他の様々な操作を実行できます。 モジュール 13 を思い出していただければ、右クリックして次の操作を行うことができます。

- フォールアウトステップ後のユーザーの移動先を分析します
- ファネルの任意のポイントからセグメントを作成
- 折れ線グラフのビジュアライゼーションの任意のステージでトレンドを確認


もう 1 つできることがわかりますか。今月のカスタマージャーニーは先月に対してどのようにファネルされていますか？ モバイルとデスクトップのどちらを使用するべきですか？

以下に、2 つのパネルを作成します。

- ファネル分析（1 月）
- ファネル分析（2 月）

ファネルを異なる期間（1 月と 2 月）にデバイスタイプで分割して比較していることがわかります。

このタイプのGoogle Analyticsは、分析 UI 内では使用できないか、非常に制限されています。 したがって、CJA は、Google Analyticsによって取り込まれるデータに大きな価値を再び付加します。

初めてのフォールアウトビジュアライゼーションの作成 現在のパネルを閉じて、新しいパネルから開始してください。

パネルの右側を見て、矢印をクリックしてパネルを閉じます。

![ デモ ](./images/pro33.png)

次に、**+** をクリックして新しいパネルを作成します。

![ デモ ](./images/pro35.png)

次に、**フォールアウト** ビジュアライゼーションを選択します。

![ デモ ](./images/pro36.png)

アナリストとして、メインの e コマースファネルに何が起こっているのかを理解したい場合を考えてみましょう。ホーム /内部検索/製品の詳細/ チェックアウト /購入。

まず、ファネルにいくつかの新しい手順を追加します。 それには、**ページ名** ディメンションを開きます。

![ デモ ](./images/pro37.png)

次に、訪問したすべての使用可能なページが表示されます。

![ デモ ](./images/pro38.png)

**ホーム** を最初の手順にドラッグ&amp;ドロップします。

![ デモ ](./images/pro39.png)

2 番目の手順として、**検索結果を保存** を使用します

![ デモ ](./images/pro40.png)

次に、e コマースアクションを追加する必要があります。 Dimensionで、Dimension **イベントタイプ** ディメンションを検索します。 をクリックして、ディメンションを開きます。

![ デモ ](./images/pro41.png)

**Product_Detail_Views** を選択し、次の手順にドラッグ&amp;ドロップします。

![ デモ ](./images/pro43.png)

**Product_Checkouts** を選択し、次の手順にドラッグ&amp;ドロップします。

![ デモ ](./images/pro44.png)

フォールアウトビジュアライゼーションのサイズを変更します。

![ デモ ](./images/pro45.png)

これで、フォールアウトビジュアライゼーションの準備が整いました。

インサイトの分析とドキュメント化を開始するには、常に **テキスト** ビジュアライゼーションを使用することをお勧めします。 **テキスト** ビジュアライゼーションを追加するには、左側のメニューの **グラフ** アイコンをクリックして、使用可能なすべてのビジュアライゼーションを表示します。 次に、**テキスト** ビジュアライゼーションをキャンバスにドラッグ&amp;ドロップします。 次の画像のようにサイズを変更して移動します。

![ デモ ](./images/pro48.png)

再度、ダッシュボードに合わせてサイズを変更します。

![ デモ ](./images/pro49.png)

フォールアウトビジュアライゼーションでは、分類も可能です。 **デバイスタイプ** ディメンションを開いて使用し、値の一部を 1 つずつビジュアライゼーションにドラッグ&amp;ドロップします。

![ デモ ](./images/pro50.png)

最終的に、より高度なビジュアライゼーションが得られます。

![ デモ ](./images/pro51.png)

Customer Journey Analyticsを使用すると、その他の様々な操作を実行できます。 フォールアウト内の任意の場所を右クリックすると、次の操作を実行できます。

- フォールアウトステップからのユーザーの移動先を分析します
- ファネルの任意のポイントからセグメントを作成
- 折れ線グラフのビジュアライゼーションの任意のステップのトレンド
- ファネルを様々な期間と視覚的に比較します。

例えば、フォールアウトの任意のステップを右クリックすると、これらの分析オプションの一部が表示されます。

![ デモ ](./images/pro52.png)

## 4.2.5.3.3 フロー分析とビジュアライゼーション

Google Analyticsを使用して詳細なフロー分析を行う場合は、SQL を使用してデータを抽出し、ビジュアライゼーション部分にサードパーティのソリューションを使用する必要があります。 Customer Journey Analyticsがそれを助けます。

この手順では、次の質問に答えるためにフロー分析を設定します。特定のランディングページが現れる前に、主に貢献するチャネルは何か。  2 回のドラッグ&amp;ドロップと 1 回のクリックで、アナリストは、マーケティングチャネルの 2 回の最後のタッチで、ランディングページに向かうユーザーのフローを発見できます。

Customer Journey Analyticsが回答に役立つその他の質問：

- 特定のランディングページの前のチャネルの主な組み合わせは何ですか？
- Product_Checkout に到着したユーザーがセッションを終了する理由は何ですか？ 前のステップは何でしたか？

これらの質問に答えるために、空のパネルから始めましょう。 現在のパネルを閉じて、**+** をクリックします。

![ デモ ](./images/pro53.png)

次に、**フロー** ビジュアライゼーションを選択します。

![ デモ ](./images/pro54.png)

次に、マルチパスのマーケティングチャネルフロー分析を設定します。 **マーケティングチャネル** ディメンションを **入口Dimension** 領域にドラッグ&amp;ドロップします。

![ デモ ](./images/pro55.png)

これで、最初のエントリパスが表示されます。

![ デモ ](./images/pro56.png)

ドリル・ダウンする最初のパスをクリックします。

![ デモ ](./images/pro58.png)

これで、次のパス（マーケティングチャネル）が表示されます。

![ デモ ](./images/pro59.png)

3 回目のドリルダウンを行いましょう。 新しいパス内の最初のオプション **リファラル** をクリックします。

![ デモ ](./images/pro60.png)

次のようなビジュアライゼーションが表示されます。

![ デモ ](./images/pro61.png)

物事を複雑にしよう。 2 つのマーケティングパスの後のランディングページを分析するとします。 これを行うには、セカンダリディメンションを使用して最後のパスを変更します。 **ページ名** ディメンションを見つけて、次のようにドラッグ&amp;ドロップします。

![ デモ ](./images/pro62n.png)

次の項目が表示されます。

![ デモ ](./images/pro63n.png)

別のフロー分析を行いましょう。 今度は、特定の出口の後に何が起こったかを分析します。 他の分析ソリューションでは、SQL/ETL と、サードパーティのビジュアライゼーションツールを使用して同じことを実現する必要があります。

新しい **フロービジュアライゼーション** をパネルに取り込みます。

![ デモ ](./images/pro64.png)

すると、次のようになります。

![ デモ ](./images/pro64a.png)

Dimension **イベントタイプ** を見つけて、**終了ディメンション** 領域にドラッグ&amp;ドロップします。

![ デモ ](./images/pro65.png)

これで、どの **イベントタイプ** パスがお客様を出口に導いたかを確認できます。

![ デモ ](./images/pro66.png)

チェックアウトアクションからの終了前に何が起こったかを調査しましょう。 **Product_Checkouts** パスをクリックします。

![ デモ ](./images/pro67.png)

インサイトに富まないデータを含む新しいアクションパスが表示されます。

![ デモ ](./images/pro68.png)

さらに分析しましょう。 Dimension **ページ名** を検索し、新しく生成されたパスにドラッグ&amp;ドロップします。

![ デモ ](./images/pro69.png)

これで、高度なフロー分析が数分で完了しました。 異なるパスをクリックすると、これらのパスが出口から前のステップにどのように接続するかを確認できます。

![ デモ ](./images/pro70.png)

これで、ファネルを分析し、デジタルだけでなくオフラインタッチポイント全体での顧客の行動の道筋を探るための強力なキットが得られました。

忘れずに変更を保存してください。

## 4.2.5.4 プロジェクトの共有

>[!IMPORTANT]
>
>以下のコンテンツは参考情報として提供されています。他のユーザーとプロジェクトを共有する必要は **ありません**。

お知らせ – このプロジェクトを同僚と共有して、共同作業したり、ビジネス上の質問を一緒に分析したりできます。

![ デモ ](./images/pro99.png)

![ デモ ](./images/pro100.png)

次の手順：[ 概要とメリット ](./summary.md)

[モジュール 4.2 に戻る](./customer-journey-analytics-bigquery-gcp.md)

[すべてのモジュールに戻る](./../../../overview.md)
