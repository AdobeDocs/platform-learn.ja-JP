---
title: Bootcamp — リアルタイム顧客プロファイル — 自分のリアルタイム顧客プロファイルを視覚化 — UI — ブラジル
description: Bootcamp — リアルタイム顧客プロファイル — 自分のリアルタイム顧客プロファイルを視覚化 — UI — ブラジル
kt: 5342
audience: Data Engineer, Data Architect, Marketer
doc-type: tutorial
activity: develop
source-git-commit: 5d824244766135cd4998feab48be7f6a69c42a70
workflow-type: tm+mt
source-wordcount: '537'
ht-degree: 2%

---

# 1.2 seu proprio perfil de cliente em tempo real - UI

Neste expercício, vocêirá fazer login na Adobe Experience Platform e ビジュアライザー seu próprio Perfil de cliente em tempo real na UI.

## ヒスタミン

No Perfil do cliente em tempo real, todos dados do perfil são exibidos juntamente com os dados do evento, além das associaçoes de segmentos existentes. Os dados mostrados podem vir de qualquer lugar, de aplicativos daAdobee solçoes externas. Essa a exibição mais poderosa da Adobe Experience Platform, o verdadeiro local do sistema de experiência.

## 1.2.1 ビジュアライゼーションの使用 (perfil do client a Adobe Experience Platform)

Acesse [Adobe Experience Platform](https://experience.adobe.com/platform). Depois de fazer ログイン， vocêirá acessar a página inicial da Adobe Experience Platform.

![データ取得](./images/home.png)

アンテス・デ・コニュナール、ヴォーチェ・プレシャ・セレクショナー・アム **サンドボックス**. 誰かがサンドボックスを選択し、Bootcamp を行うことはありません。 É porivel fazer isso clicando no texto **[!UICONTROL 実稼動版]** ナ・リンハ・アズール・ナ・パルテ・スーペリア・ダ・テラ Depois de selecionar o sandbox apporiado, você verá a tela mudando e agora vocestá em seu [!UICONTROL サンドボックス] 決め手

![データ取得](./images/sb1.png)

メニューが見つからない、アクセス **プロファイル** e **参照**.

![顧客プロファイル](./images/homemenu.png)

No painel 視覚化アドールデペルフィルの no seu サイト、vocêpode encontrar visão geral da identidade。 Cada identidade está vinculada a um 名前空間。

![顧客プロファイル](./images/identities.png)

No painel 視覚化アドールデペルフィル、agora ヴォーデオーバーマ識別セメランテセギンテ：

| 名前空間 | ID |
|:-------------:| :---------------:|
| Experience Cloud ID (ECID) | 19428085896177382402834560825640259081 |

com a Adobe Experience Platform, todos IDs são igualmente importantes. ID の ECID 時代の前触れは重要ではないコンテキストを daAdobeetodos outros IDs estavam vincluados ao ECID em uma relação hierqua. com a Adobe Experience Platform, isso mudou e cada ID のポードユム・イデンティファドール・プリマリオ。

標準，o identificador primário depende do contexto. Se você perguntar ao seu コールセンター： **ID の Qualé は重要ですか？** エレスはレスポンデランを提供します。 **ヌメロ・デ・テレフォン！** マス・セ・ヴォーペルガンタ・アスア (CRM)、エレス・レスポンデラオ： **endreço de e-mail!** Adobe Experience Platform・エンテンデ・エッサ・コンプレキシダーデ・ゲレンシア・イッソ・パラ・ヴォーチェ。 Cada aplicativo, seja um aplicativo daAdobeou não, se comunicará com a Adobe Experience Platform referindo-se ao ID que consideam principal. 簡単に言えばファンシオナ。

パラオカンポ **ID 名前空間**, selecone **ECID** e para o campo **ID 値** insira o ECID の個々のボーカルは、encontrar no painel 視覚化アドール・デ・ペルフィル do サイト do Bootcamp。 クリック **表示**. ボーヴェラ・セウ・ペルフィル・ナ・リスタ。 クリック番号 **プロファイル ID** para abrir seu perfil

![顧客プロファイル](./images/popupecid.png)

アゴラヴォーテムマヴィサオジェラルデアルガン **アトリブトス・デ・ペルフィル** 輸入人はセウ・ペルフィル・ド・クライアンテを行う。

![顧客プロファイル](./images/profile.png)

Acesse **イベント**, onde vocede ver as entradas de cada evento de experiência vinculado seu Perfil

![顧客プロファイル](./images/profileee.png)

por フィルム、opção de メニューにアクセス **セグメントのメンバーシップ**. アゴラヴォクラ・トドス・セグメントス・ケ・クァリフィカム・パラ・エステ・ペルフィル。

![顧客プロファイル](./images/profileseg.png)

アゴラヴァモスクリアルムノヴォセグメントクペリティラクワクワクワクは、エクスペリエンスをパーソナライズする periência d cliente para cliente anonimo ou conhecido。

プロクシマエタパ： [1.3 Crieum segmento - UI](./ex3.md)

[レトルナルパラフルクソデウサリオ 1](./uc1.md)

[レトルナーパラトドスオスモドゥロス](../../overview.md)
