---
title: Bootcamp -Customer Journey Analytics-Customer Journey Analyticsを使用したビジュアライゼーション — ブラジル
description: Bootcamp -Customer Journey Analytics-Customer Journey Analyticsを使用したビジュアライゼーション — ブラジル
kt: 5342
audience: Data Engineer, Data Architect, Data Analyst
doc-type: tutorial
activity: develop
source-git-commit: 3272d288185415b4604fe48f18c19f8f06e6dce0
workflow-type: tm+mt
source-wordcount: '1586'
ht-degree: 1%

---

# 4.5Customer Journey Analytics

## Objectivos

- UI を拡張してAnalysis Workspace
- Conheça alguns recursos que tornam o Analysis Workspace tão diferente.
- Analysis Workspaceのアナリサルの CJA ユサンド

## Contexto

Neste expercício, vocêusará o Analysis Workspace no CJA para analizar visualizaçoes de productos, funis de productos, rotatividade など

Vamos usar o projeto que vocriou em  [4.4 Prepação de dados no Analysis Workspace](./ex4.md)，エンタンアセス [https://analytics.adobe.com](https://analytics.adobe.com).

![デモ](./images/prohome.png)

アブラ・セウ・プロジェト `yourLastName - Omnichannel Analysis`.

Com seu projeto aberto e Visualização de dados `yourLastName - Omnichannel Analysis` selecionado, vocêestá pronto para comçar a construir suas primeirs visualizaçoes

![デモ](./images/prodataView1.png)

## Quantas の視覚化 de productos temos diariamente?

datas certas para analisar os dados としての Em primeiro lugar, precisamos selecionar。 Acesse o menu suspenso do calendarrio no lado direito da tela. Clique nele selecione o intervalo de datas applicável.

>[!IMPORTANT]
>
>Selecione um intervalo de datas como **今週** ou **今月**. Os dados disponíveis mais recentes for am absovidos em 19 de setembro de 2022.

![デモ](./images/pro1.png)
メトリカスカルカダとしてエンコントロールする、ラドエスカルド（アレアデコンポーネント）のメニューなし **製品表示**. セレシオネアス e アレスト e solte solte na tela, no canto superior direito da tabela de forma livre.

![デモ](./images/pro2.png)

ディメンションを自動的に変更 **日** セラ・アディシオナダ・パラ・クリア・スア・プリメイラ・タベラ アゴラヴォークドバースアペルガンタレスポンディダイメディアタンテ。

![デモ](./images/pro3.png)

エムセギダ、クリック com o botão direito do mouse no resumo da métrica.

![デモ](./images/pro4.png)

クリック **視覚化** e セレクション **線** como visualizationção.

![デモ](./images/pro5.png)

Vocêverá as suas visualizaçoes de producto por dia.

![デモ](./images/pro6.png)

ヴォーチュポーデアルターオエスコポデテンポパラオディアクリカンドエム **設定** na visualização.

![デモ](./images/pro7.png)

クリケノポントアオラドデ **線** e **データソースを管理**.

![デモ](./images/pro7a.png)

Em seguida、clique em **選択をロック** e セレクション **選択した項目** para bloquear esta visualização para que ela sempre exiba uma linha do tempo de Visualizaçoes de produtos

![デモ](./images/pro7b.png)

## 5 個の製品メイス訪問者

クアサオ 5 製品マイス・ビストス？

Lembre-se de salvar o projoto de tempos em tempos.

| OS | ショートカット |
| ----------------- |-------------| 
| Windows | Ctrl + S |
| Mac | Command + S |

Vamos começar a contrar os 5 produtos mais vistos. No menu do lado esquerdo, encontre o Nome do produto - Dimensiono.

![デモ](./images/pro8.png)

アゴラアレステエソルテ **製品名** パラは次元を置き換える **日**:

エステセラオレスルタド。

![デモ](./images/pro10a.png)

Em seguida、tente dividir um dos produtos por Nome da marca. ペスク **brandName** アラースト・パラ・バイクソ・ド・プリメイロ・ノーム・ド・プロドト

![デモ](./images/pro13.png)

エム・セギダ、ファサ・ム・デタラメント・ウサンド・オ・アンテ・デ・ウサリオ。 ペスク **ユーザーエージェント** arraste-o para baixo do nome da marca

![デモ](./images/pro15.png)

Em seguida, será exibida a tela abaixo:

![デモ](./images/pro15a.png)

Por fim, voce pode adicionar mais visualizaçoes. lado esquerdo, em visualizaçoes, pesquise がありません `Donut`. ペグ `Donut`, arratese e solte na tela sob a visualização **線** 

![デモ](./images/pro18.png)

次に、表で最初の 5 つを選択します。 **ユーザーエージェント**  行を **Google Pixel XL 32GB ブラックスマートフォン** > **シティ信号**. 5 行を選択する際、 **CTRL** ボタン（Windows の場合）または **コマンド** ボタン (Mac)

Em seguida, na Tabela, selecione as primeiras 5 linhad de **ユーザーエージェント** デタラメントク・フィゼモス・エム **Google Pixel XL 32GB ブラックスマートフォン** > **シティ信号**. Ao セレオナーを 5 リニャス、segure o botão **CTRL** （Windows なし） o botão **コマンド** (Macなし )。

![デモ](./images/pro20.png)

Vocêverá o gráfico de donut alterado:

![デモ](./images/pro21.png)

Vocêpode até adaptar o design para ser mais legível, tornando o gráfico de **線** オグラフィコデ **ドーナツ** um poco menor para que sejam exibidos lado a lado

![デモ](./images/pro22.png)

クリケノポントアオラドデ *ドーナツ** para **データソースを管理**. Em seguida、clique em **選択をロック** para bloquear essa visualização para que sempre exiba uma linha do tempo de Visualizaçoes de produto

![デモ](./images/pro22b.png)

Saiba mais sobre visualizaçoes usando o Analysis Workspace em:

- [https://experienceleague.adobe.com/docs/analytics/analyze/analysis-workspace/visualizations/freeform-analysis-visualizations.html?lang=ja](https://experienceleague.adobe.com/docs/analytics/analyze/analysis-workspace/visualizations/freeform-analysis-visualizations.html?lang=ja)
- [https://experienceleague.adobe.com/docs/analytics/analyze/analysis-workspace/visualizations/t-sync-visualization.html](https://experienceleague.adobe.com/docs/analytics/analyze/analysis-workspace/visualizations/t-sync-visualization.html)

## Funil de interação do produto, da visualizaçãoà compra

Existem muitas formas de resolver esta questão. Uma delasé usar o Tipo de Interação de Produto e usá-lo em uma tabela de formato livre. Outra formaé usar uma **フォールアウトビジュアライゼーション**. Vamos usar oúltimo, pois queremos 視覚化 e analisar ao mesmo テンポ。

Feche o painel の実際のクリカンド・アクイ：

![デモ](./images/pro23.png)

アゴラ・アディシオネ・ム・ノボ・ペイン・ブランコ・クリカンド・エム **+空のパネルを追加**.

![デモ](./images/pro24.png)

Clique na visualização de **フォールアウト**.

![デモ](./images/pro25.png)

Selecione o mesmo intervalo de datas do exercício anteror.

![デモ](./images/prodatef.png)

Em seguida, vocêverá:

![デモ](./images/prodatefa.png)

ディメンションのエンコントロール **イベントタイプ** nos コンポーネントは、lado esquerdo ではありません。

![デモ](./images/pro26.png)

ディメンションの Clique na seta para a brigur a dimension:

![デモ](./images/pro27.png)

Voêverá todos os Tipos de eventos disponíveis.

![デモ](./images/pro28.png)

項目を 1 つ選択 **commerce.productViews** e arraste e solte o no campo **タッチポイントを追加** デントロダ **フォールアウトビジュアライゼーション**.

![デモ](./images/pro29.png)

Faça o mesmo com **commerce.productListAdds** および **commerce.purchases** e solte-os no campo **タッチポイントを追加** デントロダ  **フォールアウトビジュアライゼーション**. Sua visualização agora deve ser semelhante ao seguinte:

![デモ](./images/props1.png)

ボーチュポードファザームイタスコイサアクイ。 アルゴリズムの終了：比較 ao longo do tempo, comparar cada passo por dispositivo ou comparar por fidelidade No entanto, se quisermos analisar coisas interressantes como porque os clientes não compram depois de adicionar um item ao carrinho, podemos usar a melhor ferramenta do CJA:com o botão direito をクリックします。

Clique com o botão direito do mouse no touchpoint **commerce.productListAdds**. Em seguida、clique em **このタッチポイントでのフォールアウトを分類**.

![デモ](./images/pro32.png)

ウマノヴァ・タベラ・デ・フォルマト・リヴル・セラ・クリアダ・パラ・アナリサル・クエ・ア・ペソアス・フィゼラム・セ・ナン・コンプララム。

![デモ](./images/pro33.png)

代替 **イベントタイプ** 作成者 **ページ名**, na nova tabela de formato livre, para ver em quainas eles estão indo, em vez da Página de confirmação de compra

![デモ](./images/pro34.png)

## ペソア・ファゼムのサイト・アンテス・デ・アセサール・パギナ・キャンセル・サービスコ？

ノバメンテ， há muitas formas de realizar essa análise. Vamos usar a análise de fluxo para iniciar parte da descoberta.

Feche o painel の実際のクリカンド・アクイ：

![デモ](./images/pro0.png)

アゴラ・アディシオネ・ム・ノボ・ペイン・ブランコ・クリカンド・エム **+空のパネルを追加**.

![デモ](./images/pro0a.png)

Clique na visualização **フロー**.

![デモ](./images/pro35.png)

Em seguida, será exibido:

![デモ](./images/pro351.png)

Selecione o mesmo intervalo de datas do exercício anteror.

![デモ](./images/pro0b.png)

ディメンションのエンコントロール **ページ名** nos コンポーネントは、lado esquerdo ではありません。

![デモ](./images/pro36.png)

ディメンションの Clique na seta para a brigur a dimension:

![デモ](./images/pro37.png)

パギナス・ヴィスタとしてのヴォーチェ・エンコントララ・トダス。 ノーム・ダ・パギナのエンコントレ： **サービスをキャンセル**.
ソルトを整列 **サービスをキャンセル** na Visualização de fluxo no campo do meio:

![デモ](./images/pro38.png)

Em seguida, será exibido:

![デモ](./images/pro40.png)

Vamos agaora analisar se os clientes que visitaram a página C **サービスをキャンセル** サイト também ligaram para o コールセンター e qual foi o resultado はありません。

Nas ディメンション、レトルン e エンコントロールティポデインタラサオデシャマダ。 ソルトを整列 **呼び出しインタラクションタイプ** primeira interaçãoà direita em に代わる para 置き換え **フロービジュアライゼーション**.

![デモ](./images/pro43.png)

アゴラヴォーカルの視覚化チケット・デ・サポルテ・ドス・クリエンテ・リガラム・パラ中央デ・アテンディメントにパギナのデポワ・デ・ヴィジタルをデポワに **サービスをキャンセル**.

![デモ](./images/pro44.png)

Em seguida, nas dimensions, procure **通話感**. Arraste e solte para は primeira interação a direita na visualização de fluxo に置き換わります。

![デモ](./images/pro46.png)

Em seguida, será exibido:

![デモ](./images/flow.png)

コモポード ver, execuamos uma análise omnichannel usando ビジュアライゼーション ação de fluxo. Graças a isso, descobrimos que alguns clientes que estavam pensando em cancelar o serviço tiveram avaliação positiva depois de ligar para o call center. タルヴェス・テナモスムダド・デ・イデイア comuma promoção?

## Qualé o desempenho dos clientes com um contato de Call center Positivo em relação aos principais KPIs?

Primeiramente, vamos segmentar os dados para obter apenas usários com chamadas **陽性**. CJA、os Segmentos サンシャマドス・デ・フィルトロス。 Acesse para filtros na area de componentes (no lado esquerdo) e clique **+**.

![デモ](./images/pro58.png)

デントロドコンストラクターデフィルター、dêum nome ao フィルター

| 名前 | 説明 |
| ----------------- |-------------| 
| 通話感 — ポジティブ | 通話感 — ポジティブ |

![デモ](./images/pro47.png)

NOS コンポーネント (dentro do Construtor de filtor), encontre **通話感** e arraste e solte na definição do construtor de filter.

![デモ](./images/pro48.png)

アゴラセレオネ **陽性** コモバローパラフィルター

![デモ](./images/pro49.png)

Altere o escopo para o nível **人物**.

![デモ](./images/pro50.png)

Para 最終処理、Basta Clicar Em **保存**.

![デモ](./images/pro51.png)

エンタオ、ヴォーチラ・レトルナ・パラ・エスタ・テラ。 Se ainda não retornou, feche o painel antero.

![デモ](./images/pro0c.png)

アゴラ・アディシオネ・ム・ノボ・ペイン・ブランコ・クリカンド・エム **+空のパネルを追加**.

![デモ](./images/pro24c.png)

Selecione o mesmo intervalo de datas do exercício anteror.

![デモ](./images/pro24d.png)

クリック **フリーフォームテーブル**.

![デモ](./images/pro52.png)

アゴラアレスト e solte o filtoro que vacabou de criar。

![デモ](./images/pro53.png)

オラ・デ・アディシオナール・アルグマ・メトリカス。 Comece com **製品表示**. Arraste e solte na tabela de forma liver. ボーチャンベムポーデはメトリカを除く **イベント**.

![デモ](./images/pro54.png)

Faça o mesmo com **人**, **買い物かごに追加** e **購入**. ヴァイアカバーコムウマタベラコモセギンテ。

![デモ](./images/pro55.png)

Graças a primeira análise de fluxo, uma nova pergunta surgiu. Então decidimos criar esta tabela e verificar alguns KPIs em segmento para responder a essa pergunta. Como voce ver, o tempo de insighté muis rápido do que usar SQL ou usar ousars soluçoes de BI.

## Recapitulação do Analysis Workspace e doCustomer Journey Analytics

O Analysis Workspaceは、Analytics を使用してトダを削除します。 Ele forene uma tela lobsta e flexível para criar projectos de analytics personalizados. Arraste e solte qualte qualquer número de tabelas de dados, visualizaçoes e componentes (dimensions, métricas, segmentos e granuridades de tempo) para um projeto. Vocepode criar de forma instantânea filtros e analises, gráficos de coorte, alertas, segmentos, análises de fluxo e relatórios de curadoria e agendamento para compartilhar com quer peso aem seu negio

プロクシマエタパ： [4.6 De insights a ação](./ex6.md)

[レトルナルパラフルクソデウサリオ 4](./uc4.md)

[レトルナーパラトドスオスモドゥロス](./../../overview.md)
