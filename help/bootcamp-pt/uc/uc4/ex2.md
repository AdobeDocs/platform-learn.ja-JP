---
title: Bootcamp - Customer Journey Analytics - Customer Journey AnalyticsのAdobe Experience Platform データセットの接続 – ブラジル
description: Bootcamp - Customer Journey Analytics - Customer Journey AnalyticsのAdobe Experience Platform データセットの接続 – ブラジル
jira: KT-5342
audience: Data Engineer, Data Architect, Data Analyst
doc-type: tutorial
activity: develop
solution: Customer Journey Analytics
feature-set: Customer Journey Analytics
feature: Connections
exl-id: 51078fca-f234-4e50-96ba-ee7f5e286869
source-git-commit: 3c86f9b19cecf92c9a324fb6fcfcefaebf82177f
workflow-type: tm+mt
source-wordcount: '721'
ht-degree: 0%

---

# 4.2 Conecte データセット da Adobe Experience PlatformCustomer Journey Analyticsなし

## Objetivos

- コンプレンダ UI ダ コンエクサン デ ダドス
- Traga os dados da Adobe Experience Platform para o CJA
- Entenda a ID da pessoa e a compilação de dados
- Aprenda o conceito de streaming de dados no カスタマージャーニー

## 4.2.1 コンエクサオ

Acesse [analytics.adobe.com](https://analytics.adobe.com) para acessar oCustomer Journey Analytics。

Na página inicial do Customer Journey Analytics, acesse **Connections**.

![ デモ ](./images/cja2.png)

Aqui você pode ver todas as diferentes conexóes es feitas entre o CJA e a Plataforma. （英語） Essas conexóes têm o mesmo objetivo dos conjuntos de relatórios no Adobe Analytics. No entanto, a coleta dos dados é completamente diferente. （ノー・エンタント、コレタ・ドス・ダドス・エ・コンペタメンテ・ディフェレンテ） Todos os dados vêm de datasets da Adobe Experience Platform.

Vamos criar sua primeira conexão （バモス クリアール スア プリメイラ コネクサン） **新しい接続を作成** をクリックします。

![ デモ ](./images/cja4.png)

Você verá a UI **接続を作成** UI

![ デモ ](./images/cja5.png)

Agora você pode dar um nome à sua conexão （アゴラ ボーケ ポデ ダール ウム ノーム ア ア コナクサン）

este modelo de nomenclatura: `yourLastName – Omnichannel Data Connection` を使用します。

例：`vangeluw - Omnichannel Data Connection`

Você também deve selecionar o sandbox correto para usar.（ヴォケ・タンベム・デヴ・セレクオサンドボックス・コレト・パラ・ウサール） メニューサンドボックスがありません。選択したサンドボックスは、deve ser `Bootcamp` です。 Neste exempo, o sandbox a ser usado é o **Bootcamp**. E você também deve definir o **毎日のイベントの平均数** から **100 万未満**。

![ デモ ](./images/cjasb.png)

Após selecionar seu sandbox, você pode começar a adicionar datasets a esta conexão. 「em **データセットを追加**」をクリックします。

![ デモ ](./images/cjasb1.png)

## 4.2.2 Adobe Experience Platformでデータセットを選択する

データセット `Demo System - Event Dataset for Website (Global v1.1)` の予測 Clique em **+** para adicionar o dataset a esta conexão.

![ デモ ](./images/cja7.png)

Agora pesquise e marque as caixas de seleção `Demo System - Event Dataset for Voice Assistants (Global v1.1)` and `Demo System - Event Dataset for Call Center (Global v1.1)`.

Em seguida, você verá a tela abaixo. （エム・セギダ、ボークレ・ヴェラ・ア・テラ・アバイショ） 「次へ **をクリックし** す。

![ デモ ](./images/cja9.png)

## 4.2.3 ID da pessoa e compilação de dados

### ID da pessoa

O objetivo agora é juntar はデータセットを扱います。 パラカダデータセット selecionado、você verá um campo chamado **ユーザー ID**。 Cada データセット tem seu próprio campo de ID de pessoa.

![ デモ ](./images/cja11.png)

Como você pode ver, a maioria deles tem o ID da pessoa selecionado automaticamente.（コモ・ボーケ・ポデ・ヴァー、マイオリアは彼らを ID として選択する） Isso ocorre porque um identificador principal é selecionado em cada esquema na Adobe Experience Platform. Como exempo, aqui está o esquema para `Demo System - Event Schema for Call Center (Global v1.1)`, onde você pode ver que o Identificador Primário está definido como `phoneNumber`.

![ デモ ](./images/cja13.png)

No entanto, você ainda pode influenciar qual identificador será usado para compilar datasets para sua conexão. （英語） Você pode usar qualquer identificador configurado no esquema vinculado ao seu データセット。 クリックするとメニューが表示されなくなるので、para explorar os ID は em cada データセットと区別されます。

![ デモ ](./images/cja14.png)

Conforme mencionado, você pode definir diferentes IDs de pessoa para cada dataset. （英語） Isso permite reunir diferentes datasets de múltiplas origens no CJA.（イスラム過激派のレウニールは、クロスチャネル戦略の元になるデータセットを指す） 例えば、世界の指導者たちが議論を進める中で、私たちは議論の余地を残し、また議論の余地を残してきたのです。

O nome do campo ID da pessoa não é importante, desde que o valor nos campos ID da pessoa correspondda. （英語） Digamos que temos `email` em um dataset e `emailAddress` em outro dataset definido como ID da pessoa.（デジモスクテモデータと em um データセットの両方を使用する必要があります） CJA poderá compilar os dados のデータセットには、`delaigle@adobe.com` tiver o mesmo valor para o campo ID da pessoa em ambos os datasets があります。

Atualmente, existem algumas outras limitaçóes, como compilar o comportamento anônimo para conhecido.（アルグマは外に存在する） Perguntas frequentes aqui: [FAQ](https://experienceleague.adobe.com/docs/analytics-platform/using/cja-overview/cja-faq.html) に問い合わせます。


### Compilando os dados usando o ID da pessoa

Agora que você compreende o conceito de compilar datasets usando o ID da pessoa, vamos escolher `email` como ID da pessoa para cada dataset.

![ デモ ](./images/cja15.png)

Cada データセット para atualizar o ID da pessoa にアクセスします。

![ デモ ](./images/cja12a.png)

Agora preencha o campo ID da pessoa escolhendo o `email` na lista suspensa. アゴラの香りは非常に強い。

![ デモ ](./images/cja17.png)

Depois de compilar os três のデータセット、estamos prontos para continuar。

| データセット | ユーザー ID |
| ----------------- |-------------| 
| デモシステム - Web サイトのイベントデータセット（グローバル v1.1） | メール |
| デモシステム – 音声アシスタントのイベントデータセット（グローバル v1.1） | メール |
| デモシステム – コールセンターのイベントデータセット（グローバル v1.1） | メール |

Você também precisa garantir que, para cada dataset, essas opçóes estejam habilitadas:

- インポーター・トドス・ノヴォス・ダドス
- Preencher todos os dados existents
- Preencher tipo de fonte de dados com 「その他」
- Preencher a descrição com o mesmo nome do Dataset

「em **データセットを追加**」をクリックします。

![ デモ ](./images/cja16.png)

Clique em **保存** e vá para o próximo expericio. Depois de criar sua **接続**、pode levar algumas horas até que seus dados estejam disponíveis no CJA （英語）

![ デモ ](./images/cja20.png)

Próxima etapa: [4.3 Crie uma Visualização de Dados](./ex3.md)

[レトルナル パラ フルクソ デ ウスアリオ 4](./uc4.md)

[レトルナル パラ トドス オス モドゥロス](./../../overview.md)
