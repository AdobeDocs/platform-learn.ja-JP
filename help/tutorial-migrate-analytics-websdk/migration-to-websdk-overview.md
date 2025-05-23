---
title: タグを使用したAdobe Analyticsの Web SDKへの移行
description: Web SDKへの移行中に実行する手順と、その過程で行う必要がある意思決定について説明します。
solution: Data Collection, Analytics
feature: Web SDK
jira: KT-16755
exl-id: e578b669-42b4-46ae-b6e6-6688e5c5c772
source-git-commit: d6471c8e383e22fed4ad5870952d0d0470f593db
workflow-type: tm+mt
source-wordcount: '1157'
ht-degree: 0%

---

# タグを使用したAdobe Analyticsの Web SDKへの移行

Experience Platformタグ（旧称 Launch）の Analytics 拡張機能を使用してAdobe Analytics実装を Web SDKに移行する手順を説明します。タグでも Web SDK拡張機能を使用します。 タグでAdobe Analytics拡張機能を使用すると、バックグラウンドで「AppMeasurement.js」コードが使用されます。 そのため、これはAppMeasurementを Web SDKに移行するチュートリアルと考えることができますが、このチュートリアルは完全に Tags を対象としており、JavaScript実装との間の移行には対応していません（タグ UI 内で使用されるJavaScript コードを除く）。 JavaScript実装の移行については、[ ドキュメント ](https://experienceleague.adobe.com/ja/docs/analytics/implementation/aep-edge/web-sdk/appmeasurement-to-web-sdk) を参照してください。

>[!NOTE]
>
>同様の移行チュートリアルを次のユーザーが利用できます。
>
> * [Adobe Target](../tutorial-migrate-target-websdk/introduction.md)
> * [Adobe Audience Manager](https://experienceleague.adobe.com/ja/docs/audience-manager/user-guide/migrate-to-web-sdk/appmeasurement-to-web-sdk)

>[!CAUTION]
>
> Platform Web SDKは複数のAdobeアプリケーションをサポートしているので、特定のページ上のすべてのAdobeライブラリを同時に移行する必要があります。 例えば、1 つのページに Web SDK for Target とAppMeasurement for Analytics が混在して実装されているとします _サポートされていません_。 ただし、異なるページ間の混合実装がサポートされています（例：ページ A の Web SDKと、ページ B のAppMeasurementを持つ at.js）。

## このチュートリアルで得られる内容

Analytics 実装の移行手順に進む前に、Analytics の _実装_ を変更または更新する作業を正確に理解することが重要です。 このチュートリアルの最後に、レポートにアクセスしてすべてが同じ場合は、「なぜ私がそんなことをしたのか」と自問することになります。 Analytics 実装に Web SDKを使用するメリットについて説明した他のドキュメントがありますが、次のようなものがあります。

1. ファーストパーティデバイス ID のサポート
1. パフォーマンスの向上
1. Adobe Experience Platform アプリケーションの使用（新しいユースケースの実現）に向けて進む際に、今後の実装の校正を行う

Web SDKがどのように役立つかについては、Adobe Analyticsの担当者にお問い合わせください。 このチュートリアルを進めるにあたって、移行を実行する _方法_ に焦点を当てます。

>[!IMPORTANT]
>
>実装の移行を行う主な理由の 1 つは、Customer Journey Analytics、Real-Time CDP、Journey OptimizerなどのAdobe Experience Platform アプリケーションを使用する準備をすることです（上記の#3 で説明しました）。 この目的で web サイトのデータを使用する場合、このチュートリアルにはない追加手順が含まれますが、このチュートリアルは、実装をさらに進めるための前提条件であることは確かです。 そのため、このチュートリアルを終えると、同じ web サイトデータをExperience Platformにも送信するために必要な手順を実行できます。

## 移行方法

この移行プロセスを実行する方法はたくさんあると思いますが、ここでは 2 つの方法について説明する必要があります。

**方法 1:** 既存のタグプロパティを Web SDKに更新し、新しいデータ要素を作成して、プロパティに既に存在するルールに変更を加えます。

**方法 2:** 既存のプロパティをコピーするか、新しいプロパティを 1 つ作成し、Adobe Analytics拡張機能の代わりに web SDKを使用して新しいプロパティを設定することもできます。

**この移行チュートリアルでは、方法 1 を使用します。** の方法では、プロパティに関連付けられた埋め込みコードが開発サイト、ステージングサイトおよび実稼動サイトに既に埋め込まれているので、埋め込みコードを変更する必要はありません。 メソッド 2 を使用する場合は、新しいプロパティの **Environments** セクションから各環境の新しい埋め込みコードを取得し、サイトの head セクションに配置することを忘れないでください。

>[!NOTE]
>
>この移行中にタグの既存のプロパティを編集するだけですが、注意が必要です。 したがって、移行を開始する前に、現在のプロパティのコピーを作成することを強くお勧めします。 そうすることで、いつでもコピーを開いて、変更する前の状態を確認したり、コードを取り出したりできます。
>念のため気をつけておくのはいいことだ。 プロパティのコピーを作成してください。 君が戻るまでここで待っているよ。

## Analytics 実装を Web SDKに移行する手順

手順を実行する際は、次の点を理解することが重要です。

1. まず、これらのすべての手順が必要な場合とそうでない場合があります。 例えば、カスタムコードの移行に関するレッスンがあります。 カスタムコード（プラグインの使用を含む）を使用しないタグ実装がある場合、このレッスンは必要ありません。 ほとんどのユーザーが必要とするレッスンを取り入れようとしたので、少なくともレッスンを読んで、移行中にサイトを調整する必要があるかどうかを確認します。
1. また、すべてのユーザーが使用しているユースケースの 100% をカバーする移行チュートリアルを作成することはできません。 前の項目で述べたように、ほとんどの人が必要とするレッスンを含めようとしました。それは主なユースケースのほとんどをカバーします。 ただし、このチュートリアルで扱わないユースケースも間違いなくあります。 この場合は、含まれているレッスンで、ユースケースに合わせて移行する方法の良いアイデアが得られるかどうかを確認してください。 また、[Experience League コミュニティの同業者にデータ収集を依頼することもでき ](https://experienceleaguecommunities.adobe.com/t5/adobe-experience-platform-data/ct-p/adobe-launch-community?profile.language=ja) す。

移行プロセスには、次の主な手順が含まれます。

1. 移行検証レポートスイートを作成します。
1. データストリームを作成および設定します。
1. タグ（旧称 Launch）に web SDKAdobeを追加して設定します。
1. 新しいデータ要素を作成し、web SDK経由でにデータを送信します。
1. Web SDKのデータ要素とアクションを使用するには、デフォルトのページ読み込みルールを移行します。
1. ルールまたはプラグインのカスタムコードを移行します。
1. 実装の変更をPublishします。
1. 変更のデバッグおよび検証方法を理解し、デフォルトのページ読み込みルールとそれに関連付けられた変数を検証します。 この検証は、変更を加えながら、移行全体を通して継続されます。
1. 追加のページ読み込みルールを移行します。
1. カスタム リンク ルールを移行します。
1. 完全検証の後、Analytics 拡張機能への参照を削除し、拡張機能自体を削除します。
1. すべての変更を行ったら、ライブラリをステージングにプッシュしてから、実稼動環境にプッシュします。
1. すべてが完了したら、もう一度テストします。 古い Analytics コードへの参照を削除して変更を加え、すべてが正しく動作することを確認する場合は、これが必要になります。

>[!NOTE]
>
>アドビは、Analytics を web SDKに移行する際にお客様が成功できるよう、取り組みを進めています。 移行の際に問題が発生した場合、またはこのガイドに重要な情報が欠落していると感じる場合は、[ このコミュニティのディスカッション ](https://experienceleaguecommunities.adobe.com/t5/adobe-experience-platform-data/tutorial-discussion-migrate-adobe-analytics-to-web-sdk-using/m-p/732308?profile.language=ja#M604){target="_blank"} に投稿してお知らせください。

