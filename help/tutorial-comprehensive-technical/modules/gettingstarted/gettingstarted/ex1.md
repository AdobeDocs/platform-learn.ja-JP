---
title: はじめに – Experience Leagueドキュメント用のChrome拡張機能のインストール
description: はじめに – Experience Leagueドキュメント用のChrome拡張機能のインストール
kt: 5342
doc-type: tutorial
exl-id: da7aa686-7f25-49fd-af3e-d243ffda025f
source-git-commit: 1526661a80b4d551627dfca42a7e97c9498dd1f2
workflow-type: tm+mt
source-wordcount: '938'
ht-degree: 0%

---

# Experience Leagueドキュメント用のChrome拡張機能のインストール

## Chrome拡張機能について

このドキュメントは汎用化され、任意のAdobe Experience Platform インスタンスを使用して、誰でも簡単に再利用できるようになりました。
ドキュメントを再利用可能にするために、**環境変数** がドキュメントに導入されました。つまり、ドキュメント内には以下の **プレースホルダー** があります。 すべてのプレースホルダーは、固有の環境用の固有の変数です。Chrome拡張機能はその変数を変更し、チュートリアルページからコードとテキストを簡単にコピーして、チュートリアルの一部として使用する様々なユーザーインターフェイスに貼り付けられるようにします。

このような値の例については、以下を参照してください。 現在、これらの値はまだ使用できませんが、Chrome拡張機能をインストールして有効にすると、これらの変数が通常のテキストに変わり、コピーして再利用できるようになります。

| 名前 | キー | 例 |
|:-------------:| :---------------:| :---------------:|
| AEP IMS 組織 ID | `--aepImsOrgId--` | `907075E95BF479EC0A495C73@AdobeOrg` |
| AEP IMS 組織名 | `--aepImsOrgName--` | `Experience Platform International` |
| AEP テナント ID | `--aepTenantId--` | `_experienceplatform` |
| AEP サンドボックス名 | `--aepSandboxName--` | `tech-insiders` |
| Learner Profile LDAP | `--aepUserLdap--` | `vangeluw` |

例として、以下のスクリーンショットでは、`aepTenantId` への参照を確認できます。

![DSN](./images/mod7before.png)

拡張機能がインストールされると、同じテキストがインスタンス固有の値を反映して自動的に変更されます。

![DSN](./images/mod7.png)

## Chrome拡張機能のインストール

Chrome拡張機能をインストールするには、Chrome ブラウザーを開き、[https://chromewebstore.google.com/detail/tech-insiders-learning-fo/hhnbkfgioecmhimdhooigajdajplinfi](https://chromewebstore.google.com/detail/tech-insiders-learning-fo/hhnbkfgioecmhimdhooigajdajplinfi) に移動します。 その後、これが表示されます。

**Chromeに追加** をクリックします。

![DSN](./images/c2.png)

その後、これが表示されます。 **拡張機能を追加** をクリックします。

![DSN](./images/c3.png)

拡張機能がインストールされ、同様の通知が表示されます。

![DSN](./images/c4.png)

**拡張機能** メニューで「**パズルピース**」アイコンをクリックし、**Platform Learn – 設定** 拡張機能を拡張機能メニューにピン留めします。

![DSN](./images/c6.png)

## Chrome拡張機能の設定

[https://experienceleague.adobe.com/en/docs/platform-learn/tutorial-comprehensive-technical/overviewに移動し ](https://experienceleague.adobe.com/en/docs/platform-learn/tutorial-comprehensive-technical/overview) 拡張機能アイコンをクリックして開きます。

![DSN](./images/tuthome.png)

このポップアップが表示されます。 **+** アイコンをクリックします。

![DSN](./images/c7.png)

Adobe Experience Platform インスタンスに関連する値を以下のように入力します。

![DSN](./images/c8.png)

これらのフィールドにどの値を入力すればよいかわからない場合は、次のガイダンスに従ってください。

**Adobe Experience Platform IMS 組織名**

[https://platform.adobe.com/](https://platform.adobe.com/) でAdobe Experience Platform インスタンスにログインすると、画面の右上隅にインスタンスの名前が表示されます。

![DSN](./images/aepname.png)

**Adobe Experience Platform IMS 組織 ID**

IMS 組織 ID はAdobe Experience Cloud インスタンスの一意の ID で、このチュートリアル全体で複数の場所で参照されます。

IMS 組織 ID の検索は、複数の方法で実行できます。 不明な場合は、インスタンスのシステム管理者の 1 人に ID を確認してください。

[Admin Console](https://adminconsole.adobe.com/) に移動すると見つかる場合があります。このフォルダーでは、URL の一部として見つけることができます。

![DSN](./images/aepid1.png)

また、Adobe Experience Platform メニューの **Data Management/クエリ** に移動すると見つかることがあります。この場合、「**ユーザー名**」の下に表示されています。

![DSN](./images/aepid2.png)

必ず **@AdobeOrg** 部分と ID をコピー&amp;ペーストしてください。

**Adobe Experience Platform テナント ID**

テナント ID は、組織のAdobe Experience Platform インスタンスの一意の ID です。 [https://platform.adobe.com/](https://platform.adobe.com/) でAdobe Experience Platform インスタンスにログインすると、その URL にテナント ID が含まれています。

![DSN](./images/aeptenantid.png)

Chrome拡張機能に入力する場合は、アンダースコアがプレフィックスとして追加されていることを確認する必要があります。この例では **experienceplatform** が **_experienceplatform** になります。 また、URL からコピーする場合は、必ず **@** 記号を削除してください。

**Adobe Experience Platform サンドボックス名**

サンドボックス名は、Adobe Experience Platform インスタンスで使用する環境の名前です。 [https://platform.adobe.com/](https://platform.adobe.com/) でAdobe Experience Platform インスタンスにログインすると、その URL にテナント ID が含まれています。

URL からサンドボックス名を取得する前に、このチュートリアルで使用するサンドボックスに属していることを確認してください。 画面の右上隅にあるサンドボックス切り替えメニューをクリックすると、右側のサンドボックスに切り替えることができます。

![DSN](./images/aepsandboxsw.png)

この例では、Adobe Experience Platform サンドボックス名は **tech-insiders** です。

![DSN](./images/aepsname.png)

**LDAP**

これは、チュートリアルの一部として使用されるユーザー名です。 この例では、LDAP はこのユーザーのメールアドレスに基づいています。 メールアドレスは **vangeluw@adobe.com** なので、LDAP は **vangeluw** になります。

LDAP は、実行する設定がユーザーにリンクされ、使用しているインスタンスとサンドボックスと同じインスタンスを使用している他のユーザーと競合しないようにするために使用されます。

あなたの値は次のようになります。
最後に、「**新規作成** をクリックします。

![DSN](./images/c8a.png)


拡張機能の左側のメニューに、環境のイニシャルを含む新しいアイコンが表示されます。 クリックします。 次に、**環境変数** と特定のAdobe Experience Platform インスタンス値のマッピングを確認します。 **設定をアクティベート** をクリックします。

![DSN](./images/c9.png)

設定をアクティベートすると、環境のイニシャルの横に緑の点が表示されます。 これは、環境がアクティブになったことを意味します。

![DSN](./images/c10.png)

## チュートリアルコンテンツの検証

テストとして、[ このページ ](https://experienceleague.adobe.com/en/docs/platform-learn/tutorial-comprehensive-technical/datadistiller/module51/ex4) に移動します。

Chrome 拡張機能でアクティブ化された環境に基づいて、すべての **環境変数** が実際の値に置き換えられました。

これで、以下と同様のビューになります。環境変数 `aepTenantId` は、実際のAdobe Experience Platform テナント ID （この場合は **_experienceplatform**）に置き換えられました。

![DSN](./images/mod7.png)

次の手順：[ 次にデモシステムを使用：Adobe Experience Platform Data Collection クライアントプロパティを設定する ](./ex2.md)

[「はじめに」に戻る](./getting-started.md)

[すべてのモジュールに戻る](./../../../overview.md)
