---
title: 1.1 Adobe Fireflyサービス
description: Adobe Fireflyサービス
kt: 5342
doc-type: tutorial
source-git-commit: d658ebcecea1cb98f6c7176a9238fcb740fb03e3
workflow-type: tm+mt
source-wordcount: '935'
ht-degree: 1%

---

# はじめに

このチュートリアルを行う前に、次のアプリケーションをコンピューターにインストールしておく必要があります。

- Adobe Creative Cloud
- Photoshop2025
- Postman

## 1.Experience Leagueドキュメント用のChrome拡張機能のインストール

### Chrome拡張機能について

このドキュメントは一般的なドキュメントにまとめられており、任意のAdobeインスタンスを使用して、誰でも簡単に再利用できます。
ドキュメントを再利用可能にするために、**環境変数** がドキュメントに導入されました。つまり、ドキュメント内には以下の **プレースホルダー** があります。 すべてのプレースホルダーは、固有の環境用の固有の変数です。Chrome拡張機能はその変数を変更し、チュートリアルページからコードとテキストを簡単にコピーして、チュートリアルの一部として使用する様々なユーザーインターフェイスに貼り付けられるようにします。

このような値の例については、以下を参照してください。 現在、これらの値はまだ使用できませんが、Chrome拡張機能をインストールして有効にすると、これらの変数が通常のテキストに変わり、コピーして再利用できるようになります。

| 名前 | キー |
|:-------------:| :---------------:|
| IMS Org ID | `--aepImsOrgId--` |
| AEP テナント ID | `--aepTenantId--` |
| AEP サンドボックス名 | `--aepSandboxName--` |
| Learner Profile LDAP | `--aepUserLdap--` |

例として、以下のスクリーンショットでは、`aepTenantId` への参照を確認できます。

![DSN](./images/mod7before.png)

拡張機能がインストールされると、同じテキストがインスタンス固有の値を反映して自動的に変更されます。

![DSN](./images/mod7.png)

### Chrome拡張機能のインストール

Chrome拡張機能をインストールするには、Chrome ブラウザーを開き、[https://chromewebstore.google.com/detail/tech-insiders-learning-fo/hhnbkfgioecmhimdhooigajdajplinfi](https://chromewebstore.google.com/detail/tech-insiders-learning-fo/hhnbkfgioecmhimdhooigajdajplinfi) に移動します。 その後、これが表示されます。

**Chromeに追加** をクリックします。

![DSN](./images/c2.png)

その後、これが表示されます。 **拡張機能を追加** をクリックします。

![DSN](./images/c3.png)

拡張機能がインストールされ、同様の通知が表示されます。

![DSN](./images/c4.png)

**拡張機能** メニューで「**パズルピース**」アイコンをクリックし、**Platform Learn – 設定** 拡張機能を拡張機能メニューにピン留めします。

![DSN](./images/c6.png)

### Chrome拡張機能の設定

[https://experienceleague.adobe.com/en/docs/platform-learn/tutorial-comprehensive-technical/overviewに移動し ](https://experienceleague.adobe.com/en/docs/platform-learn/tutorial-comprehensive-technical/overview) 拡張機能アイコンをクリックして開きます。

![DSN](./images/tuthome.png)

このポップアップが表示されます。 **+** アイコンをクリックします。

![DSN](./images/c7.png)

Adobe Experience Platform インスタンスに関連する値を以下のように入力します。

![DSN](./images/c8.png)

これらのフィールドにどの値を入力すればよいかわからない場合は、次のガイダンスに従ってください。

**AEP IMS 組織名**

[https://platform.adobe.com/](https://platform.adobe.com/) でAdobe Experience Platform インスタンスにログインすると、画面の右上隅にインスタンスの名前が表示されます。

![DSN](./images/aepname.png)

**AEP IMS 組織 ID**

IMS 組織 ID はAdobe Experience Cloud インスタンスの一意の ID で、このチュートリアル全体で複数の場所で参照されます。

IMS 組織 ID の検索は、複数の方法で実行できます。 不明な場合は、インスタンスのシステム管理者の 1 人に ID を確認してください。

[Admin Console](https://https://adminconsole.adobe.com/) に移動すると見つかる場合があります。このフォルダーでは、URL の一部として見つけることができます。

![DSN](./images/aepid1.png)

また、AEP メニューの **データ管理/クエリ** に移動すると見つかることがあります。この場合、「**ユーザー名**」の下に表示されています。

![DSN](./images/aepid2.png)

必ず **@AdobeOrg** 部分と ID をコピー&amp;ペーストしてください。

**AEP テナント ID**

テナント ID は、組織の AEP インスタンスの一意の ID です。 [https://platform.adobe.com/](https://platform.adobe.com/) でAdobe Experience Platform インスタンスにログインすると、その URL にテナント ID が含まれています。

![DSN](./images/aeptenantid.png)

Chrome拡張機能に入力する場合は、アンダースコアがプレフィックスとして追加されていることを確認する必要があります。この例では **experienceplatform** が **_experienceplatform** になります。

**AEP サンドボックス名**

サンドボックス名は、AEP インスタンスで使用する環境の名前です。 [https://platform.adobe.com/](https://platform.adobe.com/) でAdobe Experience Platform インスタンスにログインすると、その URL にテナント ID が含まれています。

URL からサンドボックス名を取得する前に、このチュートリアルで使用するサンドボックスに属していることを確認してください。 画面の右上隅にあるサンドボックス切り替えメニューをクリックすると、右側のサンドボックスに切り替えることができます。

![DSN](./images/aepsandboxsw.png)

この例では、AEP サンドボックス名は **tech-insiders** です。

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

### チュートリアルコンテンツの検証

テストとして、[ このページ ](https://experienceleague.adobe.com/en/docs/platform-learn/tutorial-comprehensive-technical/datadistiller/module51/ex3) に移動します。

Chrome 拡張機能でアクティブ化された環境に基づいて、すべての **環境変数** が実際の値に置き換えられました。

これで、以下に類似した表示になります。ここでは、環境変数 `aepTenantId` が、実際の AEP テナント ID （この場合は **_experienceplatform**）に置き換えられています。

![DSN](./images/mod7.png)


>[!NOTE]
>
>Adobe Experience Platformとそのアプリケーションについて知るのに時間を費やしていただき、ありがとうございます。 ご不明な点がある場合は、have suggestions on future content の一般的なフィードバックをお知らせください。**techinsiders@adobe.com** に電子メールを送信して、技術インサイダーに直接問い合わせてください。

[すべてのモジュールに戻る](../../overview.md)
