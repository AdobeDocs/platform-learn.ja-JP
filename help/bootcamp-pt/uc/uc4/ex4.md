---
title: Bootcamp - Customer Journey Analytics - Analysis Workspaceでのデータ準備 – ブラジル
description: Bootcamp - Customer Journey Analytics - Analysis Workspaceでのデータ準備 – ブラジル
jira: KT-5342
audience: Data Engineer, Data Architect, Data Analyst
doc-type: tutorial
activity: develop
solution: Customer Journey Analytics
feature-set: Customer Journey Analytics
feature: Workspace Basics, Calculated Metrics
exl-id: d56128af-dd1e-47ea-922f-85418e9da687
source-git-commit: 286c85aa88d44574f00ded67f0de8e0c945a153e
workflow-type: tm+mt
source-wordcount: '808'
ht-degree: 1%

---

# 4.4 プレパラソン・デ・ダドス エム・Customer Journey Analytics

## Objetivos

- Entenda a UO do Analysis Workspace no CJA
- エンテンダ オス コンセティトス デ プレパラソン デ ダドス ノ Analysis Workspace
- アレンダ ア ファザー cálculos デ ダドス

## 4.4.1 UI do Analysis Workspace no CJA

Analysis Workspaceは todas を limitaçóóes típicas de um único relatório do Analytics として削除します。 Ele fornece uma tela robusta e flexível para criar projetos de analytics personalizados.（エレ・フォルネセ・ウマ・テラ・ロブスタ・エ・フレキシベル・パラ・クリアー・プロジェトス・デ・アナリティクス・ペルソナリザドス） Arraste e e solte qualquer número de tabelas de dados, visualizaçóes e componentes （dimensóes, métricas, segmentos e granularidadadades de tempo） para um projeto. （英語） Criação instantânea de avarias e segmentos, criação de cortes para análise, criação de alertas, comparação de segmentos, análise de fluxo e falhas e relatórios de curadoria e agendamento para compartilhar com qualquer pessoa em seu negócio.

Customer Journey Analytics・トラズ・エッサ・ソリュサオ・アレム・ドス・ダドス・ダ・プラタフォルマ。 É altamente recomendável assistir a este vídeo de visão geral de quatro minutos:

>[!VIDEO](https://video.tv.adobe.com/v/35109?quality=12&learn=on&enablevpops)

Se você nunca usou o Analysis Workspace antes, recomendamos este vídeo:

>[!VIDEO](https://video.tv.adobe.com/v/26266?quality=12&learn=on&enablevpops)

### クリースープロエト

アゴラ・デ・ホラ・デ・クリアール・セウ・プリメイロ・プロジェト・ド・CJA。 Vá para a aba de projetos dentro do CJA （ヴァパラ ア ア ア ア ア ア デ プロジェトス デントロ ド CJA） 「**新規作成**」をクリックします。

![ デモ ](./images/prmenu.png)

Em seguida, você verá a tela abaixo. （エム・セギダ、ボークレ・ヴェラ・ア・テラ・アバイショ） Selecione **空のプロジェクト** então clique em **作成**.

![ デモ ](./images/prmenu1.png)

Você verá um projeto vazio.（ヴォケ・ヴェラ・ウム・プロエト・ヴァジオ）

![ デモ ](./images/premptyprojects.png)

Primeiro, certifique-se de selecionar a Visualização de dados correta no canto superior direito da tela. （ダドス・コレタのビジュアライゼーションの実態） Neste exempo, a Visualização de dados a ser selecionada é `vangeluwe - Omnichannel Data View`.（ネスティ・エグゼモ、ダドスのビジュアライゼーション）

![ デモ ](./images/prdv.png)

エム・セギダ、você irá salvar seu projeto e dar um nome a ele. ボーケ・ポデ・ウサー o seguinte comando para salvar:

| OS | ショートカット |
| ----------------- |-------------| 
| Windows | コントロール + S |
| Mac | Command + S |

Você verá este のポップアップ

![ デモ ](./images/prsave.png)

este modelo de nomenclatura を使用します。

| 名前 | 説明 |
| ----------------- |-------------| 
| `yourLastName - Omnichannel Analysis` | `yourLastName - Omnichannel Analysis` |

Em seguida、clique em **保存**。

![ デモ ](./images/prsave2.png)

## 4.4.2 メトリカ結石

Embora tenhamos organizado todos os componentes na Visualização de dados, você ainda deve adaptar alguns deles parque os usuários de negócios estestjam prontos para iniciar suas análises. Além disso, durante qualquer processo de analytics, você pode criar métricas calculadas para aprofundar a descoberta de insights.

Como exempo, criaremos uma Taxa de conversão calculada usando a métrica/evento Compras que definimos na Visualização de dados.（コモエグゼモ、コングレガモの分類法、およびコングレサオの分類法）

## タサ デ コンヴェルサン

「Vamos começar」は聖体結石の恐ろしさを示している。 Clique em **+** para criar sua primeira Métrica calculada no Analysis Workspace.（クリーク・エム・イラ+クリーク・パラクリアール・スア・プリメイラ・メトリカ・カリキュラダ・ノ・）

![ デモ ](./images/pradd.png)

O **計算指標ビルダー** irá aprecer:

![ デモ ](./images/prbuilder.png)

Encontre **購入** na lista de métricas no menu do lado esquerdo. Em **指標** clique em **すべて表示**

![ デモ ](./images/calcbuildercr1.png)

Agora arraste e e solte a métrica **購入** na definição da métrica calculada.

![ デモ ](./images/calcbuildercr2.png)

Normalmente, taxa de conversão significa **コンバージョン / セッション**. Então, vamos fazer o mesmo cálculo na tela de definição de métrica calculada. （英語） Encontre a métrica **セッション** e arraste e solte-a no criador de definição, no evento **購入**.

![ デモ ](./images/calcbuildercr3.png)

Que o operador de divisão é selecionado automaticamente をご覧ください。

![ デモ ](./images/calcbuildercr4.png)

A taxa de conversão é comumente representada em porcentagem （別名税） Então, vamos mudar o formato para porcentagem e selecionar 2 casas decimais.

![ デモ ](./images/calcbuildercr5.png)

最後に、計算指標の名前と説明を変更します。

| タイトル | 説明 |
| ----------------- |-------------| 
| コンバージョン率 | コンバージョン率 |

原石とノームの代わりに原石の説明：

![ デモ ](./images/calcbuildercr6.png)

Não se esqueça de **Salvar** Métrica calculada の略。

![ デモ ](./images/pr9.png)

## 4.4.3 Dimensóes calculadas: Filtros （segmentação） e intervalos de datas

### フィルタ：Dimensóes calculadas

Os cálculos não devem ser apenas para métricas.（オスカルロス・ナン・デヴェム・サー・アペナス・パラ・メトリカス） Antes de iniciar qualquer análise, também é interessante criar algumas **計算寸法**. Isso significa、essencialmente、**segments** no Adobe Analytics Customer Journey Analyticsは存在しない、セグメントス・サンシャマドス・デ **フィルター**。

![ デモ ](./images/prfilters.png)

A criação de filtros ajudará os usuários de negócios a iniciar o analytics com algumas dimensóes calculadas valiosas. （英語） Isso irá automatiszar algumas tarefa, além de ajudar na parte de adoção （イッソ・イラ・オートマティザール・アルグマ・タレファ） Abaixo estão alguns の従業員：

1. ミディア・パガ，Mídia Própria,
2. ノヴァス・エクス・レコレンテス
3. Clientes com carrinho abandonado

フェルトロス・ポデム・セル・クリアドス・アンテス・ウ・ドゥランテ・ア・パルテ・デ・アナリゼ （o que você fará no próximo exercício）

### Intervalos de datas: Dimensóes de tempo calculadas

As dimensóes de tempo são outro tipo de dimensóes calculadas.（ディメンソエス・デ・テンポ・デ・ディメンソエス・カラダス） アルガンズ・ヤ・フォラム・クリアドス、マ・ボーケ・タンベム・ポデ・クリアール・スアス・プロプリアス・ディメンサス・デ・テぺモ・ペルソナリザダス・ナ・ファセ・デ・プレパラサオ・デ・ダドス。

Essas Dimensóes de tempo calculado ajudarão analistas e usuários de negócios a lembrar datas importantes e usá-las para filtrar e alterar o tempo de relatório. （英語） Perguntas e dúvidas típicas quando fazemos análises:

- Quando foi a ブラックフライデーは Ano Passado? エントル・オズ・ディアス 21e29?
- カンド・ベイクラモス アクエラ・カンパンハ・デ・テレビ・デゼンボ？
- 2018 年のヴェランデ・ヴェルダンはクアンドのフィゼモスですか？ Quero comparar com 2019。 2019 年のヴォケ・サベ・オス・ディアス・エクサトスは？

![ デモ ](./images/timedimensions.png)

Agora você concluiu o exercício de preparação de dados usando o Analysis Workspace do CJA. （英語）

Próxima etapa: [4.5 Visualização usando Customer Journey Analytics](./ex5.md)

[レトルナル パラ フルクソ デ ウスアリオ 4](./uc4.md)

[レトルナル パラ トドス オス モドゥロス](./../../overview.md)
