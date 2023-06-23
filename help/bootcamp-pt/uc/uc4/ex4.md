---
title: Bootcamp -Customer Journey Analytics- Analysis Workspaceでのデータの準備 — ブラジル
description: Bootcamp -Customer Journey Analytics- Analysis Workspaceでのデータの準備 — ブラジル
jira: KT-5342
audience: Data Engineer, Data Architect, Data Analyst
doc-type: tutorial
activity: develop
exl-id: d56128af-dd1e-47ea-922f-85418e9da687
source-git-commit: 90f7621536573f60ac6585404b1ac0e49cb08496
workflow-type: tm+mt
source-wordcount: '793'
ht-degree: 1%

---

# 4.4 Prepação de dados emCustomer Journey Analytics

## Objectivos

- Entenda a UO do Analysis Workspaceの CJA
- Entenda concitios de preparação de dados no Analysis Workspace
- アプレンダアファザーカルクロスデダドス

## 4.4.1 UI でのAnalysis Workspaceの CJA の実行

OAnalysis Workspaceは、Analytics の際にトダを削除します。 Ele forene uma tela lobsta e flexível para criar projectos de analytics personalizados. Arraste e solte qualte qualquer número de tabelas de dados, visualizaçoes e componentes (dimensions, métricas, segmentos e granuridades de tempo) para um projeto. Criação instantânea de avarias e segmentos, criação de cortes para análise, criação de alertas, comparação de segmentos, análise de fluxo de falhase relatórios de curadoria e agendamento pa co compartilcom pqu co co co co com pquer quer pquer pquer pquer pquer peso e peso em esemenseom pa em seem seu

OCustomer Journey Analyticstraz essa solção além dos dados da plataforma. É altamente recomendável assisiar a este vídeo de visão geral de quatro minutos:

>[!VIDEO](https://video.tv.adobe.com/v/35109?quality=12&learn=on)

Se voce nunca usou o Analysis Workspace antes, recomendamos este vídeo:

>[!VIDEO](https://video.tv.adobe.com/v/26266?quality=12&learn=on)

### クリーセウプロジェト

アゴラエホラ・ド・クリアル・セウ・プリメイロ・プロジェトは CJA を行う。 Vá para a aba de projectos dentro do CJA. クリック **新規作成**.

![デモ](./images/prmenu.png)

エムセギダ、vocêverá a tela abaixo。 選択 **空のプロジェクト** 東クリック **作成**.

![デモ](./images/prmenu1.png)

Voêverá um projeto vazio.

![デモ](./images/premptyprojects.png)

Primeiro, certifique-se de selecionar Visualização de dados correta no canto superior direito da tela. Neste エグザンプロ、Visualização de dados a ser selecionada `vangeluwe - Omnichannel Data View`.

![デモ](./images/prdv.png)

エムセギダ、vocirá salvar seu projeto e dar um nome a ele. Vocêpode usar o seguinte comando para salvar:

| OS | ショートカット |
| ----------------- |-------------| 
| Windows | Ctrl + S |
| Mac | Command + S |

Vocêverá este ポップアップ：

![デモ](./images/prsave.png)

este modelo de nomenclatura を使用：

| 名前 | 説明 |
| ----------------- |-------------| 
| `yourLastName - Omnichannel Analysis` | `yourLastName - Omnichannel Analysis` |

Em seguida、clique em **保存**.

![デモ](./images/prsave2.png)

## 4.4.2 メトリカスカルカダ

Embora tenhamos organizado todos componentes na Visualização de dados, vocainda deve adaptar alguns deles para que os usários de negcios estejam prontos para iniciar suas análises. Além disso, durante qualquer processo de analytics, voce pode criar métricas calculadas para aprofundar a de secoberta de insights.

Como 模範， criaremos uma Taxao de conversão calculada usando a métrica/evento Compras que definimos na Visualização de dados.

## タクサデコンバオ

Vamos começar は、コンストラクター・デ・メトリカス・カリカダのアブリエです。 クリック **+** パラクリアスアプリメイラメトリカカルカダのAnalysis Workspace

![デモ](./images/pradd.png)

O **計算指標ビルダー** irá aparecer:

![デモ](./images/prbuilder.png)

強制 **購入** na lista de métricas no menu do lado esquerdo Em **指標** クリック **すべて表示**

![デモ](./images/calcbuildercr1.png)

アゴラアレステメトリカをソルテ **購入** ナ・エニファサン・ダ・メトリカ・カリキュラダ。

![デモ](./images/calcbuildercr2.png)

正常には、taxade conversão minia **コンバージョン/セッション**. エンサン，ヴァモスファザー o mesmo cálculo na tela de definição de métrica calculada. メトリカをエンコントロール **セッション** e arraste e solte a no criador de definição, no evento **購入**.

![デモ](./images/calcbuildercr3.png)

オペラドール・デ・デ・ディブサオ・セレオナドを自動的に使う。

![デモ](./images/calcbuildercr4.png)

taxade conversãoé comumente は porcentagem を表します。 Então, vamos mudar o formato para porcentagem e selecionar 2 casas as decimais.

![デモ](./images/calcbuildercr5.png)

最後に、計算指標の名前と説明を変更します。

| タイトル | 説明 |
| ----------------- |-------------| 
| コンバージョン率 | コンバージョン率 |

Por fim, altere o nome e a descrição da métrica calculada:

![デモ](./images/calcbuildercr6.png)

ナンセエスケサデ **Salvar** メトリカカリキュラダ。

![デモ](./images/pr9.png)

## 4.4.3 寸法：Filtros (segmentatção) e intervalos de datas

### フィルタ：ディメンションエスカルカダ

オスカルクロスナンデベム、アペナスパラメトリカス。 アンテス・デ・イニシア・クァルケア・アナリス、タンベム・エ・インテレスサンテ・クリア・アルグマ **計算Dimension**. イッソ・シピラシア、エッセンシャルメンテ、 **セグメント** Adobe Analytics ノCustomer Journey Analyticsセグメントサンシャマドスデ **フィルター**.

![デモ](./images/prfilters.png)

A criação de filtros ajudará os usários de negócios a iniciar o analytics com algumas dimensions, es calcuadas valiosas. Isso irá automatizar algumas tarefas, além de ajudar na parte de adoção. Abaixo estão alguns exemployes:

1. メディア・プロプリア、メディア・パガ
2. Visitas novas x レコード
3. Clientes com carrinho abondonado

Ess filtros podem ser criados antes ou durante a parte de análise (o que vocêfará no próximo exercício).

### データの間隔：ディメンションデテンポカルカダ

As dimensions, es de tempo são outro tipo de dimensions, es calculadas. Alguns já foram criados, mas você também pode criar suas próprias Dimensoes de tempo personalizadas na fase de prepação de dados.

Essas Dimensionsoes de tempo calculado ajudarão analistas e usários de negócios lembrar datas importantes e usá-las para filter e alteror o tempo de relatrio. ペルガンタ・エドゥヴィダ・ティピカス・クアンド・ファゼモス・アナリス：

- Quando foi 黒金曜日 do ano passado? エントリー OS 21 e 29?
- クアンド・ヴェイキュラモス・アクエラ・カンパーハ・デ・テレビエム・デザンブロ？
- De quando a quando fizemos as vendas de verão de 2018? Quero comparar com 2019. 2019 年に、ボーケ・サベ・オス・ディアス・エクサトスエム？

![デモ](./images/timedimensions.png)

アゴラのボーチュエオエクスペルシオデデプラファサオデダドスユサンドオAnalysis Workspaceド CJA。

プロクシマエタパ： [4.5 Visualização usandoCustomer Journey Analytics](./ex5.md)

[レトルナルパラフルクソデウサリオ 4](./uc4.md)

[レトルナーパラトドスオスモドゥロス](./../../overview.md)
