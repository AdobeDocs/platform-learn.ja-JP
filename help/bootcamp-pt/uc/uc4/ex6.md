---
title: Bootcamp - Customer Journey Analytics - インサイトからアクションまで – ブラジル
description: Bootcamp - Customer Journey Analytics - インサイトからアクションまで – ブラジル
jira: KT-5342
audience: Data Engineer, Data Architect, Data Analyst
doc-type: tutorial
activity: develop
solution: Customer Journey Analytics
feature-set: Customer Journey Analytics
feature: Audiences
exl-id: 28b87e21-3168-447e-9a93-a6ae7e969657
source-git-commit: 3c86f9b19cecf92c9a324fb6fcfcefaebf82177f
workflow-type: tm+mt
source-wordcount: '454'
ht-degree: 0%

---

# 4.6 アソンの Dos インサイト

## Objetivos

- Entenda como criar um público com base em uma visão coletada no Customer Journey Analytics
- esse público no CDP em tempo real e no Adobe Journey Optimizerを使用する

## 4.6.1 クリエ uma audiência e publique-a

Em seu projeto, você criou um filtro chamado **Call Feelings** e conseguiu visualizar a quantidade de usuários que tiveram suas ligaçóes ao call center classificadas como **ポジティバ**. アゴラ，você poderá criar um segmento com esses usuários e ativação-los em jornadas ou em canais de comunicação.

O primeiro passo é: No painel criado no último exercício, selecione a linha **1. Call Feeling - Positive**, clique com o bothão direito de seu mouse e selecione a opção **選択からオーディエンスを作成**:

![ デモ ](./images/aud1.png)

Em seguida, dê um nome para a sua audiência seguindo o modelo **yourLastName - cia audience call feeling positive**:

![ デモ ](./images/aud2.png)

注意：ケ・エ・ポッシヴェル・テル・ウム・プレビュー・ダ・オーディエンシア・ケ・エスタ・センド・クリアダ：

![ デモ ](./images/aud3.png)

パラファイナリザール、クリーク・エム **パブリック**:

![ デモ ](./images/aud4.png)

## 4.6.2 sua audiência como parte de um segmento を使う

Voltando para a Adobe Experience Platform, vá em **セグメント > 参照** e você conseguirá visualizar o seu segmento criado no CJA pronto e disponível para ser usado nas suas ativaçóes e jornadas!

![ デモ ](./images/aud5.png)

Vamos agora usar esse segmento em uma ativação no Facebook e em uma jornada do cliente!

## 4.6.3 seu segmento na Real-Time CDP em tempo real を使用する

Na Adobe Experience Platform, vá em **セグメント /閲覧** e encontre a audiência que você criou no CJA:

![ デモ ](./images/aud6.png)

Clique no seu segmento e, em seguida, clique em **宛先に対してアクティブ化**:

![ デモ ](./images/aud7.png)

宛先 chamada bootcamp-facebook e、em seguida、clique em を選択します次へ：

![ デモ ](./images/aud8.png)

エム・セギダ、クリケ・エム・ネクスト・ノヴァメンテ：

![ デモ ](./images/aud9.png)

Selecione a opção **オーディエンスのオリジン** e defina como **顧客から直接** e clique em 次へ：

![ デモ ](./images/aud10.png)

Por fim, na página **レビュー** clique em Finish!

![ デモ ](./images/aud11.png)

プロント！ アゴラ o seu segmento está vinculado aos públicos personalizados do Facebook。
アゴラ ヴァモス・ユーティリザー・エスセ・セグメントはAJOじゃない！

## 4.6.4 「seu segmento no Adobe Journey Optimizer」を使用する

Na interface da Adobe Experience Platform clique em Journey Optimizer e, em seguida, no menu lateral esquerdo, clique em **ジャーニー** e come a criar uma jornada clicando em **ジャーニーを作成**:

![ デモ ](./images/aud20.png)

![ デモ ](./images/aud21.png)

![ デモ ](./images/aud22.png)

Em seguida, no menu lateral esquerdo, em Eventos, selecione **セグメントの選定** e arraste-o até a jornada:

![ デモ ](./images/aud23.png)

Em seguida、em **セグメント** clique em **編集** para selecionar um segmento:

![ デモ ](./images/aud24.png)

Selecione a audiência que você criou no CJA e clique em **保存**:

![ デモ ](./images/aud25.png)

プロント！ A partir daí você pode criar uma jornada para clientes que se qualificam para esgmento!

[ユーザーフロー 4 に戻る](./uc4.md)

[Voltar para todos os módulos （オオマルドゥロス山）](./../../overview.md)
