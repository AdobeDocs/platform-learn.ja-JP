---
title: Bootcamp — リアルタイム顧客プロファイル — セグメントの作成 — UI
description: Bootcamp — リアルタイム顧客プロファイル — セグメントの作成 — UI
jira: KT-5342
audience: Data Engineer, Data Architect, Marketer
doc-type: tutorial
activity: develop
feature: Segments
exl-id: 37d4a5e8-e2bc-4c8c-a74f-09f74ea79962
source-git-commit: ee5c0af17c12f1d90774a3a4150c9788e2368e39
workflow-type: tm+mt
source-wordcount: '496'
ht-degree: 3%

---

# 1.3 セグメントの作成 — UI

この演習では、Adobe Experience Platformのセグメントビルダーを使用してセグメントを作成します。

## Story

に移動します。 [Adobe Experience Platform](https://experience.adobe.com/platform). ログイン後、Adobe Experience Platformのホームページに移動します。

![データ取得](./images/home.png)

続行する前に、 **サンドボックス**. 選択するサンドボックスの名前はです ``Bootcamp``. これを行うには、 **[!UICONTROL 実稼動版]** 画面の上の青い線で表示されます。 適切な [!UICONTROL サンドボックス]画面が変更され、専用の [!UICONTROL サンドボックス].

![データ取得](./images/sb1.png)

左側のメニューで、に移動します。 **セグメント**. このページでは、既存のすべてのセグメントの概要を確認できます。 をクリックします。 **+セグメントを作成** ボタンをクリックして、新しいセグメントの作成を開始します。

![セグメント化](./images/menuseg.png)

新しいセグメントビルダーに移動すると、 **属性** メニューオプションと **XDM 個人プロファイル** 参照。

![セグメント化](./images/segmentationui.png)

XDM はエクスペリエンスビジネスを強化する言語なので、XDM もセグメントビルダーの基盤です。 Platform で取り込まれるすべてのデータは XDM に対してマッピングする必要があり、そのため、データの取得元に関係なく、すべてのデータは同じデータモデルの一部になります。 これにより、セグメントを作成する際に大きなメリットが得られます。この 1 つのセグメントビルダー UI から、同じワークフロー内の任意の接触チャネルからのデータを組み合わせることができます。 セグメントビルダーで作成したセグメントは、Adobe Target、Adobe Campaign、Adobe Audience Managerなどのソリューションに送信してアクティベーションできます。

次に、製品を表示したすべての顧客のセグメントを作成する必要があります **Real-Time CDP**.

このセグメントを構築するには、エクスペリエンスイベントを追加する必要があります。 すべてのエクスペリエンスイベントは、 **イベント** アイコン **フィールド** メニューバー

![セグメント化](./images/findee.png)

次に、最上位レベルが表示されます。 **XDM ExperienceEvents** ノード。 クリック **XDM ExperienceEvent**.

![セグメント化](./images/see.png)

に移動します。 **製品リスト項目**.

![セグメント化](./images/plitems.png)

選択 **名前** をクリックし、 **名前** オブジェクトをセグメントビルダーキャンバス上から **イベント** 」セクションに入力します。 次の内容が表示されます。

![セグメント化](./images/eewebpdtlname.png)

比較パラメーターは次のようにする必要があります。 **次と等しい** 入力フィールドに、 **リアルタイム CDP**.

![セグメント化](./images/pv.png)

セグメントビルダーに要素を追加するたびに、 **推定を更新** 」ボタンを使用して、セグメント内の母集団の新しい推定を取得します。

![セグメント化](./images/refreshest.png)

形式 **評価方法**&#x200B;を選択します。 **Edge**.

![セグメント化](./images/evedge.png)

最後に、セグメントに名前を付けて保存します。

命名規則として、次を使用します。

- `yourLastName - Interest in Real-Time CDP`

次に、 **保存して閉じる** 」ボタンをクリックしてセグメントを保存します。

![セグメント化](./images/segmentname.png)

これで、セグメントの概要ページに戻り、セグメントに適合する顧客プロファイルのサンプルプレビューが表示されます。

![セグメント化](./images/savedsegment.png)

これで、次の演習に進み、Adobe Targetでセグメントを使用できます。

次のステップ： [1.4 措置をとる：セグメントをAdobe Targetに送信](./ex4.md)

[ユーザーフローに戻る 1](./uc1.md)

[すべてのモジュールに戻る](../../overview.md)
