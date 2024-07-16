---
title: Bootcamp - Customer Journey Analytics - Customer Journey Analyticsを使用したビジュアライゼーション – ブラジル
description: Bootcamp - Customer Journey Analytics - Customer Journey Analyticsを使用したビジュアライゼーション – ブラジル
jira: KT-5342
audience: Data Engineer, Data Architect, Data Analyst
doc-type: tutorial
activity: develop
solution: Customer Journey Analytics
feature-set: Customer Journey Analytics
feature: Visualizations
exl-id: eb5eac54-22d8-428b-acac-16570f75085e
source-git-commit: 3c86f9b19cecf92c9a324fb6fcfcefaebf82177f
workflow-type: tm+mt
source-wordcount: '1569'
ht-degree: 0%

---

# 4.5 Visualização usando Customer Journey Analytics

## Objetivos

- UI do Analysis Workspaceへの参加
- Conheça alguns recursos que tornam o Analysis Workspace tão diferente.（フランス語でフランス語で「フランス語でフランス語でフランス語を発音」）
- アパルンダ ア アナリサル ノ CJA ウサンド オ Analysis Workspace

## Contexto

Neste exercício, você usará o Analysis Workspace no CJA para analisar visualizaçóes de produtos, funis de produtos, rotatividade など

Vamos usar o projeto que você criou em [4.4 Preparação de dados no Analysis Workspace](./ex4.md), então acesse [https://analytics.adobe.com](https://analytics.adobe.com).

![ デモ ](./images/prohome.png)

Abra seu projeto `yourLastName - Omnichannel Analysis`.（アブラスー・プロエト）

Com seu projeto aberto e Visualização de dados `yourLastName - Omnichannel Analysis` selecionado, você está prolonto para começar a construir suas primeiras visualizaçóes.

![ デモ ](./images/prodataView1.png)

## Quantas visualizaçóes de produtos temos diariamente?

Em primeiro lugar, precisamos selecionar as datas certas para analisar os dados.（ダドスのパラナリサールとして選ばれたプレシサモス） Acesse o menu suspenso do calendário no lado direito da tela. （カレンダリオのラド・ディレイト・ダ・テラ） Clique nele e selecione o intervalo de datas aplicável.

>[!IMPORTANT]
>
>Selecione um intervalo de datas como **今週** ou **今月**。 Os dados disponíveis mais recentes foram absorvidos em 19 de setembro de 2022.

![ デモ ](./images/pro1.png)
No menu do lado esquerdo （área de componentes）, contre as métricas calculadas **Product Views**. セレシオーネ – as e arraste e solte na tela, no canto superior direito da tabela de forma livre. セレシオーネ・アラースト・エ・ソルト・ナ・テラ（e arraste e solte na tela, no canto superior direito da tabela de forma）

![ デモ ](./images/pro2.png)

Automaticamente a dimensão **日** será adicionada para criar sua primeira tabela （サドマイラ・タベラ） アゴラ ボーケ ポデ ヴァー sua pergunta respondida imediatamente.

![ デモ ](./images/pro3.png)

Em seguida, clique com o bothão direito do mouse no resumo da métrica. （エム・セギダ、クリーク・コム・オ・ボト・ディレイト・ド・マウス・ノ・レジュモ・ダ・メトリカ）

![ デモ ](./images/pro4.png)

Clique em **Visualize** e selecione **Line** como visualização.

![ デモ ](./images/pro5.png)

Você verá as suas visualizaçóes de produto por dia.

![ デモ ](./images/pro6.png)

Você pode alterar o escopo de tempo para o dia clicando em **設定** na visualização.

![ デモ ](./images/pro7.png)

Clique no ponto ao lado de **Line** e **データSourceの管理**.

![ デモ ](./images/pro7a.png)

Em seguida, clique em **選択をロック** e selectione **選択された項目** para bloquear esta visualização para que ela sempre exiba uma linha do tempo de Visualizaçóes de produtos.

![ デモ ](./images/pro7b.png)

## メイス・ヴィストス・プロドトス 5 本

ケイス・サンオス 5 プロドトス・メイス・ヴィストス？

テンポスのテンポスに対する抗議活動の実施。

| OS | ショートカット |
| ----------------- |-------------| 
| Windows | コントロール + S |
| Mac | Command + S |

Vamos começar a encontrar os os 5 produtos mais vistos. No menu do lado esquerdo, encontre o Nome do produto - Dimensão.いいえメニューはエスカレードを行いません。

![ デモ ](./images/pro8.png)

アゴラ アラースト エ ソルト **製品名** para substituir a dimensão **日**:

エステ・セラ・オ・レスルタド。

![ デモ ](./images/pro10a.png)

Em seguida, tente dividir um dos produtos por Nome da marca.（エム・セギダ、テンテ・ディヴィディル・ウム・ドス・プロドトス・ポル・ノーム・ダ・マルカ） Pesquise **brandName** e arraste para baixo do primeiro nome do produto.

![ デモ ](./images/pro13.png)

Em seguida, faça um detalhamento usando Agente de usuário.（エム・セギダ、ファサ・アム・デタルハメント・ウサンド） Pesquise **ユーザーエージェント** e arraste-o para baixo do nome da marca.

![ デモ ](./images/pro15.png)

Em seguida, será exibida a a tela abaixo （エム・セギダ、セラ・エクシビダ・ア・テラ・アバイキソ）

![ デモ ](./images/pro15a.png)

Por fim, você pode adicionar mais visualizaçóes. lado esquerdo, em visualizaçóes, pesquise `Donut` はありません。 Pegue `Donut`, arraste e e solte na tela sob a visualização **折れ線グラフ** 

![ デモ ](./images/pro18.png)

次に、テーブルで、**Google Pixel XL 32GB Black Smartphone** > **Citi Signal** の分類から最初の 5 つの **User Agent** 行を選択します。 5 行を選択している間、**Ctrl** ボタン（Windows の場合）または **Command** ボタン（Macの場合）を押したままにします。

Em seguida, na Tabela, selecione as primeiras 5 linhas de **ユーザーエージェント** do detalhamento que fizemos em **Google Pixel XL 32GB Black Smartphone** > **シティ信号**. Ao selecionar as 5 linhas, segure o botão **CTRL** （ウィンドウなし） ou o botão **コマンド** （Macなし）.

![ デモ ](./images/pro20.png)

Você verá o gráfico de donut alterado:

![ デモ ](./images/pro21.png)

Você pode até adaptar o design para ser mais legível, tornando o gráfico de **Line** e o gráfico de **Donut** um pouco menor para que sejam exibibidos lado a lado:

![ デモ ](./images/pro22.png)

Clique no ponto ao lado de *ドーナツ** para **データSourceの管理**. Em seguida, clique em **Lock Selection** para bloquear essa visualização para que ela sempre exiba uma linha do tempo de Visualizaçóes de produto. （英語のみ）

![ デモ ](./images/pro22b.png)

Saiba mais sobre visualizaçóes usando Analysis Workspace em:

- [https://experienceleague.adobe.com/docs/analytics/analyze/analysis-workspace/visualizations/freeform-analysis-visualizations.html](https://experienceleague.adobe.com/docs/analytics/analyze/analysis-workspace/visualizations/freeform-analysis-visualizations.html)
- [https://experienceleague.adobe.com/docs/analytics/analyze/analysis-workspace/visualizations/t-sync-visualization.html](https://experienceleague.adobe.com/docs/analytics/analyze/analysis-workspace/visualizations/t-sync-visualization.html)

## Funil de interação do produto, da visualização à compra

Existem muitas formas de resolver esta questão. Uma delas é usar o Tipo de Interação de Produto e usá-lo em umtabela de formato livre.（ウマデラス・デ・ウサール・デ・ティポ・デ・ティポ・デ・プロドゥート） Outra forma é usar **フォールアウトビジュアライゼーション**。 Vamos usar o último, pois queremos visualizar e analisar ao mesmo tempo.

ペネル・アタル・クリカンド・アクイのフェシェ：

![ デモ ](./images/pro23.png)

Agora adicione um novo painel em branco clicando em **+ Add Blank Panel**.（アゴラ アドシオネ・ム・ノボ・ペネル・エム・ブランコ・クリカンド・エム・エム+ブランク・パネルの追加）

![ デモ ](./images/pro24.png)

Clique na visualização de **フォールアウト**.

![ デモ ](./images/pro25.png)

Selicione o mesmo intervalo de datas do exercício anterior.この記事の内容は以下の通りです。

![ デモ ](./images/prodatef.png)

Em seguida, você verá:

![ デモ ](./images/prodatefa.png)

Encontre a dimensão **イベントタイプ** nos componentes no lado esquerdo:

![ デモ ](./images/pro26.png)

ディメンソンのクリケ・ナ・セタ・パラ・アビール：

![ デモ ](./images/pro27.png)

Você verá todos os Tipos de eventos disponíveis （エヴォ・ヴェラ・トドス・オス・ティポス・デ・エヴントス・ディスポニヴェイス）

![ デモ ](./images/pro28.png)

項目 **commerce.productViews** e arraste e solte-o no campo **タッチポイントの追加** dentro da **フォールアウトビジュアライゼーション** を選択します。

![ デモ ](./images/pro29.png)

Faça o mesmo com **commerce.productListAdds** and **commerce.purchases** e solte-os no campo **タッチポイントの追加** dentro da **フォールアウトビジュアライゼーション**. Sua visualização agora deve ser semelhante ao seguinte:

![ デモ ](./images/props1.png)

Você pode fazer muitas coisas aqui.（ボーケ・ポデ・ファザー・ムイタス・コイサ・アクイ） Alguns の exemplos：同類の ao longo do tempo、同類の cada passo por dispositivo ou 同類の por fidelidade。 No entanto, se quisermos analisar coisas interessantes como porque os clientes não compram depois de adicionar um item ao carrinho, podemos usar a melhor ferramenta do CJA: clicar com o botão direito.

Clique com o botão direito do mouse no touchpoint **commerce.productListAdds**. Em seguida、clique em **このタッチポイントでのフォールアウトの分類**。

![ デモ ](./images/pro32.png)

Uma nova tabela de formato livre será criada para analisar o que as pessoas fizeram se não compraam （マノヴァ・タベラ・デ・フォレイト・リヴル・セラ・クリアダ・パラ・アナリサール・オケ）

![ デモ ](./images/pro33.png)

Altere o **イベントタイプ** by **ページ名**, na nova tabela de formato livre, para ver em quais páginas eles estão indo, em vez da Página de confirmação de compra.

![ デモ ](./images/pro34.png)

## ペッソアス・ファゼムのサイトはパジーナ・カンセラルのセルヴィソに antes de acessar ありませんか？

Novamente, há muitas formas de realizar essa análise.（ノバメンテ、ハムイタス・フォルマス・デ・レアリザル・エッサ・アナリゼ） Vamos usar a análise de fluxo para iniciar parte da descoberta.（ヴァモス・ウサール）

ペネル・アタル・クリカンド・アクイのフェシェ：

![ デモ ](./images/pro0.png)

Agora adicione um novo painel em branco clicando em **+ Add Blank Panel**.（アゴラ アドシオネ・ム・ノボ・ペネル・エム・ブランコ・クリカンド・エム・エム+ブランク・パネルの追加）

![ デモ ](./images/pro0a.png)

Clique na visualização **フロー**.

![ デモ ](./images/pro35.png)

エム・セギダ、セラ・エクスビド：

![ デモ ](./images/pro351.png)

Selicione o mesmo intervalo de datas do exercício anterior.この記事の内容は以下の通りです。

![ デモ ](./images/pro0b.png)

Encontre a dimensão **ページ名** nos componentes no lado esquerdo:

![ デモ ](./images/pro36.png)

ディメンソンのクリケ・ナ・セタ・パラ・アビール：

![ デモ ](./images/pro37.png)

ボーシェ・エンコントララ・トダス・アズ・パギナス・ヴィスタス Encontre o nome da página: **サービスをキャンセル** します。
Arraste e e solte **サービスをキャンセル** na Visualização de fluxo no campo do meio:

![ デモ ](./images/pro38.png)

エム・セギダ、セラ・エクスビド：

![ デモ ](./images/pro40.png)

Vamos agora analisar se os clientes que visitaram a página C **Cancel Service** no site também ligaram para o call center e qual foi o resultado.

Nas dimensóes, retorne e encontre Tipo de interação de chamada.（スペイン語でイタリア語でイタリア語でフランス語で「フランス語でフランス語でフランス語でフランス語でフランス語でフランス語でフランス語でフランス語でフランス語を意味する） Arraste e solte **コールインタラクションタイプ** para substituir a primeira interação à direita em **フロービジュアライゼーション**.

![ デモ ](./images/pro43.png)

Agora você visualiza o ticket de suporte dos clientes que ligaram para a central de atendimento depois de visitar a página **サービスをキャンセル**.

![ デモ ](./images/pro44.png)

Em seguida, nas dimensóes, procure **Call Feeling**. Arraste e e solte para substituir a primeira interação à direita na visualização de fluxo. （英語）

![ デモ ](./images/pro46.png)

エム・セギダ、セラ・エクスビド：

![ デモ ](./images/flow.png)

Como pode ver, executamos uma análise omnichannel usando a visualização de fluxo.（コモポデと言う言葉） Graças a isso, descobrimos que alguns clientes que estavam pensando em cancelar o serviço tiveram uma avaliação positiva depois de ligar para o call center. （イッソ、デスコブリモスのアルガンの例） タルベス・テンハモス・ムダド・デ・イデア・コム uma promoção?

## Qual é o desempenho dos clientes com um contato de Call center Positivo em relção aos principais KPIs?

Primeiramente, vamos segmentar os dados para obter apenas usuários com chamadas **ポジティブ**. CJA やオスセグメントス・サンシャマドス・デ・フィルトロスは対象外です。 Acesse para filtros na área de componentes （no lado esquerdo） e clique em **+**. （英語）

![ デモ ](./images/pro58.png)

デントロ・ド・コンストレータ・ド・フィルトロ（dê um nome ao filtro）

| 名前 | 説明 |
| ----------------- |-------------| 
| 呼び出し時の操作性 – ポジティブ | 呼び出し時の操作性 – ポジティブ |

![ デモ ](./images/pro47.png)

Nos 成分（dentro do Construtor de filtro）, encontre **コール・フィーリング** e arraste e solte na Definição do construtor de filtro.

![ デモ ](./images/pro48.png)

アゴラセレシオン **陽性** como valor para o filtro.

![ デモ ](./images/pro49.png)

Altere o escopo para o nível **人**.

![ デモ ](./images/pro50.png)

Para finalizar, basta clicar em **保存**.

![ デモ ](./images/pro51.png)

Então, você irá retornar para esta tela. （エンタン、ボーシェ・イラー、レトルナー・パラ・エスタ・テラ） Se ainda não retornou, feche o o painel anterior.（セアインダ・ナン・レトルヌ、フェシェ・オ・ペネル・アンフォーラル）

![ デモ ](./images/pro0c.png)

Agora adicione um novo painel em branco clicando em **+ Add Blank Panel**.（アゴラ アドシオネ・ム・ノボ・ペネル・エム・ブランコ・クリカンド・エム・エム+ブランク・パネルの追加）

![ デモ ](./images/pro24c.png)

Selicione o mesmo intervalo de datas do exercício anterior.この記事の内容は以下の通りです。

![ デモ ](./images/pro24d.png)

「em **フリーフォームテーブル**」をクリックします。

![ デモ ](./images/pro52.png)

アゴラの荒地 e solte o filtro que você acabou de criar.

![ デモ ](./images/pro53.png)

Hora de adicionar algumas métricas.（ホラ・デ・アドシオナル・アルグマ・メトリカス） Comece com **製品表示**。 Arraste e e solte na tabela de forma livre. （アルラスト・ソルト・ナ・タベラ・デ・フォルマ・リーヴル） Você também pode excluir a métrica **イベント**.

![ デモ ](./images/pro54.png)

Faça o mesmo com **人物**, **買い物かごに追加** e **購入**. Você vai acabar com uma tabela como a seguinte.

![ デモ ](./images/pro55.png)

Graças à primeira análise de fluxo, uma nova pergunta surgiu. Então decidimos criar esta tabela e verificar alguns KPIs em um segmento para responder a essa pergunta. （英語） Como você pode ver, o tempo de insight é é muito mais rápido do que usar SQL ou usar outras soluthores de BI.

## リカピトゥラサン ド Analysis Workspace エ ド Customer Journey Analytics

Analysis Workspaceは todas を limitaçóóes típicas de um relatório do Analytics として削除します。 Ele fornece uma tela robusta e flexível para criar projetos de analytics personalizados.（エレ・フォルネセ・ウマ・テラ・ロブスタ・エ・フレキシベル・パラ・クリアー・プロジェトス・デ・アナリティクス・ペルソナリザドス） Arraste e e solte qualquer número de tabelas de dados, visualizaçóes e componentes （dimensóes, métricas, segmentos e granularidadadades de tempo） para um projeto. （英語） Você pode criar de forma instantânea filtros e analises, gráficos de coorte, alertas, segmentos, análises de fluxo e relatórios de curadoria e agendamento para compartillhar com qualquer pessoa em seu negócio.

Próxima etapa: [4.6 De insights a ação](./ex6.md)

[レトルナル パラ フルクソ デ ウスアリオ 4](./uc4.md)

[レトルナル パラ トドス オス モドゥロス](./../../overview.md)
