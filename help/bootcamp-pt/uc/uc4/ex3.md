---
title: Bootcamp - Customer Journey Analytics - データビューの作成 – ブラジル
description: Customer Journey Analytics - データビューの作成 – ブラジル
jira: KT-5342
audience: Data Engineer, Data Architect, Data Analyst
doc-type: tutorial
activity: develop
solution: Customer Journey Analytics
feature-set: Customer Journey Analytics
feature: Data Views
exl-id: 8cfd4467-167d-4235-a305-4596e3a7d4fb
source-git-commit: 3c86f9b19cecf92c9a324fb6fcfcefaebf82177f
workflow-type: tm+mt
source-wordcount: '1667'
ht-degree: 2%

---

# 4.3 クリエ ウマ ビジュアライザソン デ ダドス

## Objetivos

- Entenda a UI de Visualização de Dados
- Compreenda as configuraçóui es básicas de definição de visita （デヴィシータの設定）
- Compreenda atribuição e a Persistência em uma Visualização de

## 4.3.1 ビジュアライザカオ・デ・ダドス

Agora, com sua conexão concluída, é possível progredir para influenciar a visualização. Uma diferença entre o Adobe Analytics e o CJA é que o CJA precisa de uma visualização de dados parlimpar e preparar os dados antes da visualização. （原題：英語）

Uma Visualização de Dados é semelhante ao conceito de Virtual Report Suites no Adobe Analytics, onde você estabelece as definiçóes de visita com reconhecimento de contexto, filtragem e também como os componentes são chamados.

Será nerecário, no mínimo, uma Visualização de Dados por conexão （セラー・デザリオ、ノーマイニモ） No entanto, para alguns casos de uso, é ótimo ter múltiplas Visualizaçóes de Dados para a mesma conexão, com o objetivo de fornecer insights diferentes para equipes distintas. （英語） Se você deseja que sua empresa seja orientada por dados, deve adaptar a forma como os dados são vistos em cada equipe. （英語） Alguns の解説：

- Métricas de UX apenas para a equipe de UX デザイン
- KPIs e métricas para o Google Analytics e paro Customer Journey Analytics, para que a equipe de análise digital fale apenas 1 idioma.
- Visualização de Dados filtrada para mostrar, por exempo, dados para apenas um mercado, ou uma marca, ou apenas para Dispositivos móveis （ダドス・パラ・アペナス・パラアペナス・マルカ）.

Na tela de **Connections** marque a caixa de seleção da conexão que você acabou de criar.（接続） **データビューを作成** をクリックします。

![ デモ ](./images/exta.png)

Você será redirectionado para o fluxo de trabalho **データビューを作成** ワークフロー

![ デモ ](./images/0-v2.png)

## 4.3.2 デ・ダドスのビジュアライゼーション

Agora você pode configurar as definiçóes básicas para sua Visualização de dados.（アゴラ・ボーケ・ポデ・コンフィギュラー）

![ デモ ](./images/0-v2.png)

A **Connection** que você criou no exercício anterior já está selecionada. Sua conexão se chama `yourLastName – Omnichannel Data Connection`。

![ デモ ](./images/ext5.png)

Em seguida, dê um nome à sua Visualização de Dados seguindo este modelo de nomenclatura: `yourLastName – Omnichannel Data View`.

Insira o mesmo valor para a descrição: `yourLastName – Omnichannel Data View`.

| 名前 | 説明 |
| ----------------- |-------------| 
| `yourLastName – Omnichannel Data View` | `yourLastName – Omnichannel Data View` |

![ デモ ](./images/1-v2.png)

Para **タイムゾーン**、セレクオネ・オ・フソ・ホラーリオ **ベリム、エストコルモ、ロマ、ベルナ、ブルクセラス、ヴィエナ、Amsterd GMT+01:00**。 Este é um cenário realmente interessante, pois algumas empressas operam em diferentes países e geografias.（エスティ・エ・セナリオ・アルメンテ・インテレサンテ、ポア・アルグマ・エムプレサス・オペラム・エム・ディファレンテス・エム・ディファレンテス・エ・ジオグラフィアス） Alocar o fuso horário certo para cada país evitará erros típicos de dados, como, por exempo, acreditar que a maioria das pessoas compra camisetas âs 4h no Peru. （ペルーの風刺画）

![ デモ ](./images/ext7.png)

Você também pode modificar a nomenclatura das métricas principais （Pessoa, Sessão e Evento）. Isso não é obrigatório, mas alguns clientes gostam de usar Pessoas, Visitas e Acessos em vez de Pessoa, Sessão e Eventos （convenção de nomenclatura padrão do Customer Journey Analytics）.

Agora você deve ter as seguintes configuraçóes definidas:

![ デモ ](./images/1-v2.png)

「**保存して続行**」をクリックします。

![ デモ ](./images/12-v2.png)

## 4.3.3 ダドスの可視化

Neste exercício, você irá configurar os componentes necários para analisar os dados e visualizá-los usando o Analysis Workspace. Nesta IU, há três áreas principais:

- Lado esquerdo: Componentes disponíveis dos datasets selecionados
- メイオ：Componentes adicionados à Visualização de Dados
- Lado direito: Configuraçóes do component

![ デモ ](./images/2-v2.png)

>[!IMPORTANT]
>
>デ・ダドスのデ・デ・ダドスのデ・サン・デ・エスペシフィカ `Contains data` デ・サン・デ・サン・デ・サン・デ・サン・デ・サン・サン・デ・サン・デ・サン・デ・サン・サン・サン・デ・サン・デ・サン・サン・デ・サン・サン・サン・サン・デ・サン・サン・サン・デ・サン・サン・サン・サン・サン・サン・サン・サン・サン・サン・サン・サン・サン・サン・サンは、デ・サン・サン・サン・サン・サン・サン・サン・サン・サン・サン・サン・サン・サン・サン・サン・サン・サン・サンにをにににを置いています。 カソ・コントラリオ、エククラ・エスセ・カンポ。
>
>![ デモ ](./images/2-v2a.png)

Agora você precisa arrastar e soltar os componentes necários para a análise nos **コンポーネント追加**. Para isso, você deve selecionar os componentes no menu à esquerda e arrastá-los e soltá-los na tela no meio.

Vamos começar com o primeiro componente: **Name （web.webPageDetails.name）**. Pesquise esse componente e arraste-o e solte-o na tela. （英語）日本語で説明します。

![ デモ ](./images/3-v2.png)

Esse componente é o nome da página, como você pode derivar da leitura do campo do schema `(web.webPageDetails.name)`. （英語）

No entanto, usar **名前** como o nome não é a melhor convenção de nomenclatura para um usuário corporativo compreender rapidamente essa dimensão. （英語）

Vamos mudar o nome para **ページ名**. Clique no componente e o renomieie na área **コンポーネント設定**.

![ デモ ](./images/3-0-v2.png)

Configuraçôes de persistência são **永続性設定** として設定されます。 Os conceitos de eVars e prop não existem no CJA, mas as configuraçóes de Persistência possibilitam um um comportamento semelhante.（英語）

![ デモ ](./images/3-0-v21.png)

Se você não alterar essas configuraçóes, o CJA irá interpretar a dimensão como um **Prop** （nível de ocorrência）. アレム・ディスソ、ポデモスはオルタラーのペルシスタテンシア・パラ・トルナーはディメンソン・ウマの **eVar** （persistir o valor ao longo da jornada）。

Se você não estiver familiarizado com eVars e Props, [leia mais sobre isso na documentação](https://experienceleague.adobe.com/docs/analytics/landing/an-key-concepts.html)..

Vamos deixar o Nome da Página como Prop.（バモス・デイシャ・オ・ノーム・ダ・パジーナ・コモ） Dessa forma, você não precisa alterar nenhuma **永続性設定**.

| 検索するコンポーネント名 | 新しい名前 | 永続性の設定 |
| ----------------- |-------------| --------------------| 
| 名前（web.webPageDetails.name） | ページ名 |          |

Em seguida, escolha a dimensão **phoneNumber** e solte-a na tela. O novo nome deve ser **電話番号**。

![ デモ ](./images/3-1-v2.png)

Por fim, vamos alterar as Configuraçóes de persistência, pois o Número do Celular deve persistir no nível do usuário. （プール・フィム、ワモスの代わりに、ペルシステス・デ・ペルシステイニャと呼ぶ）

Para alterar a Persistência, role para baixo no menu à direita e abra a aba **永続性**:

![ デモ ](./images/5-v2.png)

Marque a caixa de seleção para modificar as configuraçóes de persistência.（マルケ・ア・カイサ・デ・セレサン・パラ・モディフィカル） Selecione **最新** e o escopo **Person （レポートウィンドウ）**, pois nos preocupamos apenas com o último número de celular da pessoa. セオ・クライアンテ・ナン・プレンシェ・オ・セルーラ・エ・ヴィシタス・フューチュラス、ボーケ・アインダ・ヴェラ・セヴァラー・プレンチド。

![ デモ ](./images/6-v2.png)

| 検索するコンポーネント名 | 新しい名前 | 永続性の設定 |
| ----------------- |-------------| --------------------| 
| phoneNumber | 電話番号 | 最新、個人（レポートウィンドウ） |

O próximo componente é `web.webPageDetails.pageViews.value`.

メニューはありませんエスクエルダ、pesquise`web.webPageDetails.pageViews.value`。 ある特定の国家の法律

「コンポーネント設定 **の下の** ページビュー **以外のパラ** も使用します。

| 検索するコンポーネント名 | 新しい名前 | アトリビューション設定 |
| ----------------- |-------------| --------------------| 
| web.webPageDetails.pageViews.value | ページビュー数 |         |

![ デモ ](./images/7-v2.png)

Para as configuraçóui es de atribuição, deixaremos em branco.（パラアール・アール・フォルト・デ・アトリブイソン、ディキサレモス・エム・ブランコ）

Observação: As configuraçóíes de persistência nas métricas também podem ser alteradas no Analysis Workspace. アルガンカジノ、ボーシェ・ポデ・オッタル・ポル・コンフィギュラ – ラス・アクイ・パラ・エビタル ケ os usuários de negócios tenham que pensar qual é o melhor modelo de persistência.

Em seguida, você terá que configurar várias Dimensóes e Métricas, conforme indicado na tabela abaixo （英語）

### 寸法

| 検索するコンポーネント名 | 新しい名前 | 永続性の設定 |
| ----------------- |-------------| --------------------| 
| brandName | ブランド名 | 最新、セッション |
| 冷感 | 呼び出し感 |          |
| 呼び出し ID | 呼び出しインタラクションタイプ |          |
| callTopic | トピックの呼び出し | 最新、セッション |
| ecid | ECID | 最新、個人（レポートウィンドウ） |
| メール | メール ID | 最新、個人（レポートウィンドウ） |
| 支払タイプ | 支払タイプ |          |
| 商品追加方法 | 商品追加方法 | 最新、セッション |
| イベントタイプ | イベントタイプ |         |
| 名前（productListItems.name） | 製品名 |         |
| SKU | SKU （セッション） | 最新、セッション |
| トランザクション ID | トランザクション ID |         |
| URL （web.webPageDetails.URL） | URL |         |
| ユーザーエージェント | ユーザーエージェント | 最新、セッション |

### メトリカ

| 検索するコンポーネント名 | 新しい名前 | アトリビューション設定 |
| ----------------- |-------------| --------------------| 
| 数量 | 数量 |          |
| commerce.order.priceTotal | 収益 |         |

Sua configuração deve ser semelhante ao seguinte:

![ デモ ](./images/11-v2.png)

Não se esqueça de Salvar sua Visualização de Dados. Então clique em **保存**。

![ デモ ](./images/12-v2s.png)

## 4.3.4 メトリカ結石

Embora tenhamos organizado todos os componentes na Visualização de dados, você ainda deve adaptar alguns deles parque os usuários de negócios estestjam prontos para iniciar suas análises.

Se você se lembra, não trouxemos especificamente Métricas como Adicionar ao Carrinho, Visualização do produto ou Compras para a Visualização de dados. （英語） No entanto, temos uma dimensão chamada: **イベントタイプ**. Então, vamos derivar settes tipos de interação criando 3 métricas calculadas. （アンタン、バモス デリヴァル）

Vamos começar com a primeira Métrica: **Product Views**.

No lado esquerdo, pesquise **イベントタイプ** e selecione a dimensão. Em seguida, arraste-o e solte-o na tela **付属コンポーネント**.

![ デモ ](./images/calcmetr1.png)

Clique para selecionar a nova métrica **イベントタイプ**.

![ デモ ](./images/calcmetr2.png)

Agora altere o nome e a descrição do componente para os seguintes valores:

| コンポーネント名 | コンポーネントの説明 |
| ----------------- |-------------| 
| 製品表示 | 製品表示 |

![ デモ ](./images/calcmetr3.png)

Agora vamos contar apenas eventos de **製品表示**. Para fazer isso, role para baixo em **コンポーネント設定** até ver Valores de **除外値を含む**. Certifique-se de habilitar a opção **Set include/exclude values**.

![ デモ ](./images/calcmetr4.png)

Como queremos contar apenas **Product Views**、特に **commerce.productViews** nos critérios。

![ デモ ](./images/calcmetr5.png)

アゴラ ア スア・メトリカ・エレスタ・プロンタ！

Em seguida, repita o mesmo processo para os eventos **買い物かごに追加** e **購入**.

### カートに追加

Primeiro, arraste e e solte a mesma dimensão **イベントタイプ**.

![ デモ ](./images/calcmetr1.png)

Você verá um alerta pop-up de um Campo Duplicado, pois estamos usando a mesma variável. （英語） Clique em **とにかく追加**:

![ デモ ](./images/calcmetr6.png)

Agora, siga o mesmo processo que fizemos para a métrica Visualizaçóes de produto:
- Primeiro altere o nome e a descrição.（プリメイロ・アルテレ・オ・ノーム・ア・デ・スクリサオ）
- Por fim, adicione **commerce.productListAdds** como critério para contar apenas 買い物かごに追加

| 名前 | 説明 | 条件 |
| ----------------- |-------------| -------------|
| カートに追加 | カートに追加 | commerce.productListAdds |

![ デモ ](./images/calcmetr6a.png)

### 購入

Primeiro, arraste e solte a mesma dimensão **イベントタイプ** como fizemos para as duas métricas anteriores.

![ デモ ](./images/calcmetr1.png)

Você verá um alerta pop-up de um Campo Duplicado, pois estamos usando a mesma variável. （英語） Clique em **とにかく追加**:

![ デモ ](./images/calcmetr7.png)

Agora, siga o mesmo processo que fizemos para as métricas 製品表示回数 e カートに追加：
- Primeiro altere o nome e a descrição.（プリメイロ・アルテレ・オ・ノーム・ア・デ・スクリサオ）
- Por fim, adicione **commerce.purchases** como critérios para contabilizar apenas Compras

| 名前 | 説明 | 条件 |
| ----------------- |-------------| -------------|
| 購入 | 購入 | commerce.purchases |

![ デモ ](./images/calcmetr7a.png)

Sua configuração final deve ser semelhante ao seguinte.（スア構成局の最終決定） 「**保存して続行**」をクリックします。

![ デモ ](./images/calcmetr8.png)

## 4.3.5 構成要素ダ・コンフィギュラソン・デ・ダドス

Você deve ser redirectionado para esta tela 氏：

![ デモ ](./images/8-v2.png)

Nesta aba, você pode modificar algumas configuraçóes importantes para alterar a forma como os dados são processados. Vamos começar definindo o **セッションタイムアウト** como 30 分 Graças ao registro de data e hora de cada evento de experiência, você pode estender o conceito de uma sessão em todos os canais. （英語） Por exexampo, o que acontece se um cliente ligar para o call center depois de visitar o site? Usando Tempos Limite de Sessão personalizados, você tem muita flexibilidade para decidir o que é ma sessão e como essa sessão irá mesclar os dados.

![ デモ ](./images/ext8.png)

Nesta aba você pode modificar outras coisas como filtrar os dados usando um segmento/filtro. （英語） Você não precisará fazer isso neste exercício （ボーシェ・ナン・プレシサラ・ファツァー・イッソ・ネステ・エクセシオ）

![ デモ ](./images/10-v2.png)

Quando terminar, clique em **保存して終了**.

![ デモ ](./images/13-v2.png)

>[!NOTE]
>
>Você pode voltar a esta Visualização de dados posteriormente e e alterar as configuraçóes e os components は、クアルクエ モメントを意味します。 As alteraçóes afetarão a forma como os dados históricos são mostrados.

Agora você pode continuar com a parte de visualização e análise!

Próxima etapa: [4.4 Preparação de dados em Customer Journey Analytics](./ex4.md)

[レトルナル パラ フルクソ デ ウスアリオ 4](./uc4.md)

[レトルナル パラ トドス オス モドゥロス](./../../overview.md)
