---
title: CSC Bootcamp - モバイルアプリコンテンツの作成
description: CSC Bootcamp - モバイルアプリコンテンツの作成
doc-type: multipage-overview
exl-id: db4e91da-2077-4133-aca9-e3413990f4be
source-git-commit: 143da6340b932563a3309bb46c1c7091e0ab2ee2
workflow-type: tm+mt
source-wordcount: '1145'
ht-degree: 0%

---

# モバイルアプリコンテンツの作成

## ヘッドレスコンテンツ配信とは

ヘッドレスコンテンツ管理システムでは、バックエンドとフロントエンドが切り離されるようになりました。 ヘッドレス CMS は、バックエンドのみのコンテンツ管理システムであり、API を介してコンテンツにアクセスできるようにするコンテンツリポジトリーとして明示的に設計および構築され、任意のデバイスで表示できるようになるため、ヘッドレス部分はコンテンツバックエンドです。

独立して開発および維持されるフロントエンドは、コンテンツ配信 API （通常は JSON 形式）を使用して、ヘッドレスなバックエンドからコンテンツを取得します。 例えば、Web アプリとして、またはこの場合はモバイルアプリケーションとして使用できます。

通常、ヘッドレス CMS バックエンドでは、モデルやスキーマに基づいてコンテンツを構造化する必要があります。 これにより、クライアントアプリケーションがエクスペリエンスのレンダリングに適したコンテンツを容易に要求できるようになります。 AEMなどの一部の CMS では、構造化されたコンテンツと非構造化コンテンツの両方を JSON 形式で公開できます。

このトポロジの主な特徴は、ヘッドレス CMS が JSON 形式で提供するコンテンツは、デザインやレイアウトの情報がない、純粋なコンテンツであることです。 ヘッドレス CMS の実装では、切り離されたフロントエンドアプリケーションによってすべての書式設定とレイアウトが維持されます。

ヘッドレス CMS トポロジの主なメリットは、クライアント側のフロントエンド実装が異なる複数のチャネルでコンテンツを再利用できることです。 これにより、フロントエンドの開発プロセスがより効率的になります。 ただし、フロントエンドエクスペリエンスの開発プロセスがコードと IT 中心になり、IT が基本的にエクスペリエンスに責任を持つようになる可能性があることも意味します。

## ヘッドレスコンテンツ配信はAEMでどのように機能しますか？

AEM as a Cloud Serviceは、次の 3 つの強力な機能を提供することで、ヘッドレス実装モデルの柔軟なツールになっています。

![ ヘッドレスコンテンツ配信 ](./images/prod-app-headless.png)

1. コンテンツモデル
   - コンテンツモデルはコンテンツの構造化表現です。
   - コンテンツモデルは、情報アーキテクトによってAEM コンテンツフラグメントモデルエディターで定義されます。
   - コンテンツモデルはコンテンツフラグメントの基盤となります。
1. コンテンツフラグメント
   - コンテンツフラグメントは、コンテンツモデルに基づいて作成されます。
   - AEM コンテンツフラグメントエディターを使用してコンテンツ作成者によって作成される。
   - コンテンツフラグメントはAEM Assetsに保存され、Assets管理 UI で管理されます。
1. 配信用のコンテンツ API
   - AEM GraphQL API は、コンテンツフラグメント配信をサポートします。
   - AEM Assets REST API は、コンテンツフラグメントの CRUD 操作をサポートします。
   - ダイレクトコンテンツ配信は、コンテンツフラグメントコアコンポーネントの [JSON 書き出し ](https://experienceleague.adobe.com/docs/experience-manager-core-components/using/components/content-fragment-component.html?lang=ja) を使用して実行することもできます。

## 演習

このブートキャンプでは、「コンテンツ」の部分に焦点を当てます。結局のところ、それは私たちが求めているコンテンツサプライチェーンです。 コンテンツモデルと必要な配信 API はすでに予測しているので、重要なことに集中できます。

まず、コンテンツモデルを見てみましょう。ヘッドレス CMS との「契約」なので、どのようなコンテンツがどのような形式で提供されるのかがわかります。

- [https://author-p105462-e991028.adobeaemcloud.com/](https://author-p105462-e991028.adobeaemcloud.com/) のAEM オーサーに移動し、提供された資格情報を使用してログインします。

- AEMのスタートメニューから、ツール \> 一般\> コンテンツフラグメントモデルを選択します

![ コンテンツフラグメントモデルメニュー ](./images/prod-app-cfm.png)

- 次の画面では、ヘッドレスコンテンツを使用しているすべてのサイトの概要を確認できます。 これにより、相互に干渉されるのを恐れることなく、複数のヘッドレスサイトに対してガバナンスを維持できます。 ここでは、アドビの Adobike サイトを使用しているので、そのモデルを選択します。

![ 様々なヘッドレスサイト ](./images/prod-app-cfm-folder.png)

- このフォルダーには、使用している技術的なヘッドレスコンテンツが Adobike の web サイトに表示されます。 詳しく知りたい場合は、 お気軽にご連絡ください。 今のところ、手の前のタスクに焦点を当てましょう：モバイルアプリ。 モバイルアプリのホームページ カードの上にマウスポインターを置き、鉛筆アイコンをクリックしてコンテンツモデルを開きます。

![ モバイルアプリのホームページのコンテンツモデル ](./images/prod-app-created-cfm.png)

- コンテンツフラグメントモデルエディターで、特定のコンテンツモデルの詳細を表示できます。 この場合、モバイルアプリのホームページに Adobike のロゴ、見出し、オプションの無料テキスト、オプションの特集製品が存在することがわかります。 これらの項目はすべて設定と更新が簡単なので、コンテンツモデルに追加の要素が必要な場合は、CMS 側での開発者の干渉なしで設定できます。

![ 詳細コンテンツモデル ](./images/prod-app-cfm-details.png)

>[!WARNING]
>
> モバイルアプリは、正しい要素を表示するために特定の情報の受信に依存するので、**コンテンツモデルの変更は、さらに下流に影響を与えることに注意してください**。 フィールドの更新や削除を行う場合は特に注意が必要です。フィールドの追加による影響はありません。

これで、コンテンツが存在すべき内容がわかったので、コンテンツフラグメントを作成できます。

- 左上隅のAEM ロゴをクリックしてナビゲーションを開き、ナビゲーション \> コンテンツフラグメントに移動します。

![ コンテンツフラグメントメニューオプション ](./images/prod-cf-ui.png)

- 次のインターフェイスでは、AEM内の既存のコンテンツすべての概要を確認できます。 左側のフィルターを使用すると、特定のコンテンツフラグメントを検索する場合に絞り込むことができます。 新しいコンテンツフラグメントを作成するには、右上の「作成」ボタンをクリックします。

![ コンテンツフラグメント作成ボタン ](./images/prod-app-create-cf.png)

- 開いたモーダルに、一部のフィールドがまだ編集されていないことがわかります。 これは論理的です。フラグメントを作成した場所に基づいて、様々なモデルが使用可能になります。
  ![ コンテンツフラグメントの作成 ](./images/prod-app-create-cf-details.png)
   - まず、「場所」フィールドの横にあるフォルダーアイコンをクリックして、フラグメントを作成する場所を選択します。 フォルダー「adobike」\> 「en」 \> 「mobile-app」をクリックしてコンテンツツリーを展開し、「選択」ボタンをクリックして選択を確認します。

     ![ 正しい場所を選択してください ](./images/prod-app-folder.png)
   - 「コンテンツフラグメントモデル」フィールドが編集可能になりました。 フィールドの横にある矢印をクリックしてドロップダウンを開き、以前に確認したコンテンツモデルを選択します（「モバイルアプリのホームページ」）。
   - 次に、コンテンツフラグメントに意味のあるタイトルを付けます（ヒント：コンテンツを簡単に見つけるには、チーム番号を含めます）。 「名前」フィールドが自動的に入力されることに注意してください。これは、生命を容易にするためであり、システムがフラグメントを識別するために使用する名前なので、触れないでください。
   - 最後に、「作成して開く」ボタンをクリックします。これは、名前が「コンテンツフラグメントを作成し、すぐに編集できる」ことを示しています。

- ここでは、モバイルアプリに表示するコンテンツをチームが決定できます。 ![ コンテンツフラグメントの詳細 ](./images/prod-cf-details.png)
   - 後でモバイルアプリでコンテンツを確認できるように、チーム名を選択してください。
   - 画像アセットを選択するには、フォルダーアイコンをクリックして、AEM Assetsで正しい画像を参照します。
   - おすすめ商品の場合、商品ルックアップアイコンをクリックして「Adobike 1」Commerce商品を簡単に選択できるので、コマース関連の詳細がアプリに読み込まれます。
   - 作成したすべてのコンテンツを保存して変更を公開する作業が完了したら、「保存」ボタンをクリックしてください。

     ![ 変更を公開 ](./images/prod-app-publish.png)

コンテンツを含んだモバイルアプリが予想できたので、キャンペーンを配信する準備が整いました。


次の手順：[ フェーズ 3 – 配信：モバイルアプリの検証 ](../delivery/app.md)

[フェーズ 2 に戻る – 実稼動：ソーシャルメディア広告の作成](./social.md)

[すべてのモジュールに戻る](../../overview.md)
