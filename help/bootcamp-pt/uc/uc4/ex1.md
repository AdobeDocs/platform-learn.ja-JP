---
title: Bootcamp - Customer Journey Analytics - Customer Journey Analytics 101 - ブラジル
description: Bootcamp - Customer Journey Analytics - Customer Journey Analytics 101 - ブラジル
jira: KT-5342
audience: Data Engineer, Data Architect, Data Analyst
doc-type: tutorial
activity: develop
solution: Customer Journey Analytics
exl-id: 63933d9e-b774-483f-b547-188c77440595
source-git-commit: 3c86f9b19cecf92c9a324fb6fcfcefaebf82177f
workflow-type: tm+mt
source-wordcount: '942'
ht-degree: 0%

---

# 4.1 Customer Journey Analytics 101

## Objetivos

- エンテンダ オ ケ エ CJA
- Entenda qual é o papel do CJA
- Entenda o workflow do CJA: da conexão de dados aos insights

## 4.1.1 オケ エ オ Customer Journey Analytics?

Customer Journey Analytics （CJA） fornece uma インターフェイス em que os times de Analytics, Negócios e Tecnologia conseguem unir todos os dados da companhia e analisar a jornada cross-channel （online e offline） do cliente de ponta a ponta. （英語）英語での英語での説明が可能です。 O CJA é capaz de fornecer contexto e clareza para essa jornada, trazendo uma visão acionável em cima das dificuldades no processo de conversão e possibilitando planejamento de experiêências relevantes e personalizadas nos pontos mais relevantes.

CJA traz o Analysis Workspace conectado à Adobe Experience Platformです。 Adobe Experience Platform・エ・セレブロ・ダ・comunicação e da orquestração e, com o CJA, as marcas agora podem contextualizar e visualizar todos dados, parque as equipes de negócios e insights possam aprender com eles, analisando toda a jornada on-line para off-line do cliente.

As equipes de negócios e insights podem conversar com o CJA, fazer perguntas e obter respostas em tempo real com a interface do usuário de arrastar e soltar, apontar e clicar e fácil de usar do Analysis Workspace.

![ デモ ](./images/cja-adv-analysis1.png)

## 4.1.2 プリンシパイスヴァンタゲンス

Os três principais benefícios para os clientes são:

- A capacidade de disponibilizar insights para todos （ou seja, democratizar o acesso aos dados）.
- A capacidade de ver o cliente em uma jornada contextive （ou seja, os dados podem ser visualizados sequencialmente, abrangendo múltiplos canais on-line e off-line）.
- A capacidade de approveitar o poder dos dados sem que haja a necessidade （ou seja, permite que indivíduos usem dados para desbloquear insights e análises profundas para ativação de marketing）. カパシダード・デ・アプロヴェイターの写真とビデオをご覧ください。

## 4.1.3 ## 4.1.3 Por que escolher o Customer Journey Analytics?

O CJA não se destina a substituir um aplicativo de BI atual, como strategy, Microstrategy, Locker ou Tableau. コモPower BI、マイクロストラテジーは、お客様のニーズに合わせたサービスを提供しています。 O objetivo desses aplicativos de BI é visualizar dados para criar painéis corporativos parque todos em uma organizaçaão possam ver métricas importantes rapidamente. （英語） O objetivo do CJA é trazer poder de análise para as equipes de Marketing e Negócios, tornando-o uma ferramenta de análise obrigatória para essas pessoas



Tradicionalmente, os aplicativos de BI têm sido incapazes de permitir a verdadeira inteligência do cliente:

- Eles não podem fazer attribuição e não fazem análises de jornada do cliente. （英語）
- Os aplicativos de BI precisam saber a pergunta com antecedência （オオップリカティヴォス デ ビ プレシザム サベル ア ペルグンタ コムアンテセデデデデデンシア）
- サンリミタダダス・ペラ・エストラトゥラ・ド・バンコ・デ・ダドス領事
- サオ・ネッサリアス州ハビリダデス
- Os aplicativos de BI não permitem que você pergunte o motimo de um acontecimento.（オップリカティヴォス・デ・サン・ペルミテム・ケ・ボーケ・ペルグント）
- Os aplicativos de BI não têm conexão direta com os pontos de contato do cliente.（スペイン語）

Portanto, usuários de negócios e analistas chegam a becos sem sída quase imediatamente, tornando a análise cara, lenta, inflexível e desconectada dos sistemas de ação.

Com o CJA você pode ter uma visão completa da jornada do cliente, usando dados offline e online, com as ferramentas certas para reduzir o tempo de insight, tornando os usuários de negócios indentes para ententender por que algo aconteceu e como responder a isso.

![ デモ ](./images/cja-use-case.png)

## 4.1.4 Compreenda o fluxo de trabalho do Customer Journey Analytics

Antes de iniciar os próximos exercícios, é essencial compreender quais etapas são necárias para trazer dados da Adobe Experience Platform para o CJA para visualizá-los e obter alguns insights profundos. É o que chamamos de fluxo de trabalho do CJA （英語） Vamos の検証：

![ デモ ](./images/cja-work-flow.jpg)

Antes de iniciar as etapas acima, não se esqueça da etapa 0, que é compreender os dados que estão disponíveis na Adobe Experience Platform.

**ゴミを入れたら、ゴミが出てくる。** Você deve ter uma ideia clara de quais dados estão disponíveis e como os esquemas na Adobe Experience Platform são configurados. Compreender os dados que estão na Adobe Experience Platform facilitará as coisas, não só na parte de conexão de dados, mas também na hora de construir visualizaçóes e fazer análises. （英語）

## 4.1.5 Etapa 0: Compreender esquemas e datasets da Adobe Experience Platform

Faça ログイン na Adobe Experience Platformに URL [https://experience.adobe.com/platform](https://experience.adobe.com/platform) が表示されます。

Depois de fazer login, você irá acessar a página inicial da Adobe Experience Platform.

![データ取得](../uc1/images/home.png)

Antes de continuar, você precisa selecionar um **sandbox**. O nome do sandbox a ser selecionado é ``Bootcamp``.（おー・ノーム・ド・サンドボックス） Você pode fazer isso clicando no ícone **[!UICONTROL Prod]** no canto superior direito da tela.（ヴォケ・ポデ・ファザー・イッソ・クリカンド・ノイコン） Depois de selecionar o sandbox aprepiado, você verá a tela mudanddo e agora você está em seu sandbox dedicado. （英語）

![データ取得](../uc1/images/sb1.png)

Verifique は、Adobe Experience Platformのデータセットのスキーマを評価します。

| データセット | スキーマ |
| ----------------- |-------------| 
| デモシステム - Web サイトのイベントデータセット（グローバル v1.1） | デモシステム - Web サイトのイベントスキーマ（グローバル v1.1） |
| デモシステム – コールセンターのイベントデータセット（グローバル v1.1） | デモシステム – コールセンターのイベントスキーマ（グローバル v1.1） |
| デモシステム – 音声アシスタントのイベントデータセット（グローバル v1.1） | デモシステム – 音声アシスタントのイベントスキーマ（グローバル v1.1） |

Certifique-se de ter verificado ao menos:

- 識別：CRMID、phoneNumber、ECID、メール。 Quais identidades são os identificadores primários, quais são os identificadores secundários?

Você pode encontrar os identificadores abrindo um schema e observando objeto `_experienceplatform.identification.core`. （英語） Verifique o スキーマ [ デモシステム - Web サイトのイベントスキーマ（グローバル v1.1） ](https://experience.adobe.com/platform/schema)。

![ デモ ](./images/identity.png)

- objeto de comércio dentro do schema [ デモシステム - Web サイトのイベントスキーマ（グローバル v1.1） ](https://experience.adobe.com/platform/schema) を参照してください。

![ デモ ](./images/commerce.png)

- todos os の視覚化 [ データセット ](https://experience.adobe.com/platform/dataset/browse?limit=50&amp;page=1&amp;sortDescending=1&amp;sortField=created) e verifique os dados

Agora você está pronto para começar a usar a interface do usuário do Customer Journey Analytics.

Próxima etapa: [4.2 Conecte datasets da Adobe Experience Platform no Customer Journey Analytics](./ex2.md)

[レトルナル パラ フルクソ デ ウスアリオ 4](./uc4.md)

[レトルナル パラ トドス オス モドゥロス](../../overview.md)
