---
title: Bootcamp -Customer Journey Analytics-Customer Journey AnalyticsでのAdobe Experience Platformデータセットの接続 — ブラジル
description: Bootcamp -Customer Journey Analytics-Customer Journey AnalyticsでのAdobe Experience Platformデータセットの接続 — ブラジル
kt: 5342
audience: Data Engineer, Data Architect, Data Analyst
doc-type: tutorial
activity: develop
source-git-commit: 3272d288185415b4604fe48f18c19f8f06e6dce0
workflow-type: tm+mt
source-wordcount: '718'
ht-degree: 2%

---

# 4.2 データセットの接続とAdobe Experience PlatformのCustomer Journey Analytics

## Objectivos

- Compreenda a UI da conexão de dados
- トラガオスダドスダAdobe Experience Platformパラオ CJA
- Entenda a ID da pessoa e a compilação de dados
- Aprenda o cepto de streaming de dados no Customerジャーニー

## 4.2.1 コネクサオ

Acesse [analytics.adobe.com](https://analytics.adobe.com) パラアクセサーかCustomer Journey Analytics。

ナ・パジナ・イニシャル・ド・Customer Journey Analytics、アセス **接続**.

![デモ](./images/cja2.png)

Aqui vocepede ver todas as diferentes conexes feitas entre o CJA e a Plataforma. エサス・コネクソエス・テム・オ・メズモ・オブジェティヴォ・ドス・コンジュントス・デ・レラトリオス・Adobe Analytics。 エンタント、コレタドスダドスのセは完全な違いを完了します。 Todos os dados vêm de datasets da Adobe Experience Platform.

バモスクリアスアプリメイラコネクサオ。 クリック **新しい接続を作成**.

![デモ](./images/cja4.png)

Voêverá a UI **接続を作成** UI

![デモ](./images/cja5.png)

アゴラヴォードダルムノームアスアコネクサオ。

este modelo de nomenclatura を使用： `yourLastName – Omnichannel Data Connection`.

エグザンプロ： `vangeluw - Omnichannel Data Connection`

Voce também deve selecionar o sandbox correto para usar. メニューサンドボックスがありません。1 つのセウサンドボックスを選択し、一意のデバイスユーザーを選択してください `Bootcamp`. Neste exemplo, o sandbox a useré o **Bootcamp**. E ヴォーカルタンベムデヴェデフィル o **毎日のイベントの平均数** から **100 万未満**.

![デモ](./images/cjasb.png)

Após selecionar seu sandbox, voce pode começar a adicionar datasets a esta conexão. クリック **データセットを追加**.

![デモ](./images/cjasb1.png)

## 4.2.2 Adobe Experience Platformからのデータセットの選択

データセットの固定 `Demo System - Event Dataset for Website (Global v1.1)`. クリック **+** para adicionar o dataset a esta conexão

![デモ](./images/cja7.png)

カイサス・デ・セレサオのアゴラ・ペスキーズ・エ・マルク `Demo System - Event Dataset for Voice Assistants (Global v1.1)` および `Demo System - Event Dataset for Call Center (Global v1.1)`.

エムセギダ、vocêverá a tela abaixo。 クリック **次へ**.

![デモ](./images/cja9.png)

## 4.2.3 ID da pessoa e コンパイラサオデダド

### ID da pessoa

O objetivo agoraé juntar はデータセットを取り込みます。 パラカダデータセットセレクショナド、vocêverá um campo chamado **人物 ID**. カダデータセットテムセウプロプリオカンポデ ID デペソア。

![デモ](./images/cja11.png)

Como vocever, a maioria da pessoa selecionado automaticamente を削除します。 イッソオコレ・ポルク・アム・インディフィシアドル・プリンシパル・セレシオナド・エム・カダ・エスケマ・ナ・Adobe Experience Platform。 コモエグザンプロ， aqui está o esquema para `Demo System - Event Schema for Call Center (Global v1.1)`, onde vocepode ver que o Identificador Primário está definido como `phoneNumber`.

![デモ](./images/cja13.png)

No entanto, vocêainda pode influenciar qual identificador será usado para compilar datasets para sua conexão. Vocêpode usar qualquer identificador configurado no esquema vinculado seu データセット。 Clique no menu suspenso para explorar os IDs disponíveis em cada データセット。

![デモ](./images/cja14.png)

Conforme mencionado, vocêpode definir は IDs de pessoa para cada データセットを異なります。 Isso permite reunir は、de múltiplas origens no CJA のデータセットを分割します。 想像してみてください trazer NPSou dados de pesquisa que seriam muito interessantes eúteis para compreender o contexto e o o moteco de um acontecimento.

O nome do campo ID da pessoa não importante, desque o valor nos campos ID da pessoa corresponda. Digamos que temos `email` em データセット e `emailAddress` em outro データセット定義 como ID da pessoa。 Se `delaigle@adobe.com` tiver o mesmo valor para o campo ID da pessoa em ambos os データセット、o CJA poderá compilar os dados。

Autalmente, existem algumas ustoas limitaçoes, como compilar o comportamento annonimo para conhecido. ペルガンタスが頻繁にアクイを呼び込むという領事館： [FAQ](https://experienceleague.adobe.com/docs/analytics-platform/using/cja-overview/cja-faq.html?lang=ja).


### コンピランドオスダドス usando o ID da pessoa

ID da ペッソア、ヴァモスエスコルハーを使用する agora que voce compreende o conpilede o de compilar datasets `email` como ID da pessoa para cada データセット。

![デモ](./images/cja15.png)

Acesse cada dataset para autizar o ID da pessoa.

![デモ](./images/cja12a.png)

アゴラプレエンチャオカンポ ID da pessoa escolhendo o `email` リスタサスペンサ。

![デモ](./images/cja17.png)

Depois de compilar os três datasets, estamos prontos para continuar.

| データセット | 人物 ID |
| ----------------- |-------------| 
| デモシステム — Web サイトのイベントデータセット (Global v1.1) | 電子メール |
| デモシステム — 音声アシスタントのイベントデータセット（グローバル v1.1） | 電子メール |
| デモシステム — コールセンターのイベントデータセット（グローバル v1.1） | 電子メール |

Voce também precisa garantir que, para cada dataset, essa opçoes esestejam habilityadas:

- Importar todos os novos dados
- Preencher todos os dados の存在
- Preencher tipo de fonte de dados com &quot;Others&quot;
- Preencher a descrição com o mesmo nome do Dataset

クリック **データセットを追加**.

![デモ](./images/cja16.png)

クリック **保存** e vá para o próximo exercício. デポワ・ド・クリアスア **接続**, pode levar algumas horas até que seus dados estejam disponíveis no CJA.

![デモ](./images/cja20.png)

プロクシマエタパ： [4.3 Crie uma Visualização de Dados](./ex3.md)

[レトルナルパラフルクソデウサリオ 4](./uc4.md)

[レトルナーパラトドスオスモドゥロス](./../../overview.md)
