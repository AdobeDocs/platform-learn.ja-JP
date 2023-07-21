---
title: Bootcamp - Real-time Customer Profile - Web サイト上の不明な情報から既知の情報まで — ブラジル
description: Bootcamp - Real-time Customer Profile - Web サイト上の不明な情報から既知の情報まで — ブラジル
jira: KT-5342
audience: Data Engineer, Data Architect, Marketer
doc-type: tutorial
activity: develop
feature: Profiles
exl-id: 853a69d2-5dac-413d-bb40-ef29604a26ae
source-git-commit: 3c86f9b19cecf92c9a324fb6fcfcefaebf82177f
workflow-type: tm+mt
source-wordcount: '410'
ht-degree: 1%

---

# 1.1 Do desconhecido ao conhecido em nosso site

## Contexto

Adobe Experience Platform・デセンペニャ・パペル・インポータンテ・ネッサ・ヨルナダ。 A plataformaé o cérebro da comunicação, o **経験記録システム**.

プラタフォルマエウムアンビエンテエムは、パラヴラクライアントエングロバマイスドクライアントコンヘキドスをクライアント。 Um visitante desconhecido no site tambéméum cliente do ponto de vista da Plataforma e, comotal, todo o comportamento de um visitante desconhecido também envida Plataforma. Graças a essa abordagem, quando esse visitante eventualmente se torna um cliente conhecido, uma marca também pode visualizar o que anteceu antes daquele momento. Isso ajuda は、特定の de uma の視点で de otimização de attribução e experiência。

## フラクソダヨルナダドクライアンテ

Acesse [https://bootcamp.aepdemo.net](https://bootcamp.aepdemo.net). クリック **すべて許可**.

![DSN](./images/web8.png)

クリケ・ノ・イコーネ・ド・ロゴシポ・ダ・Adobeは、最高のエスカルド・デ・テラ・パラ・アブリルとは言えません。

![デモ](./images/pv1.png)

Verifique o painel do Visualizador de perfile e no Perfil do cliente em tempo real com o **Experience CloudID** como identificador primário para ste clientte que aindaé desconhecido

![デモ](./images/pv2.png)

Voce também pode ver todos os Eventos de Experiência coletados com base no comportamento do cliente. A lista está vazia no momento, mas isso mudará em breve.

![デモ](./images/pv3.png)

Acesse a opção de menu **アプリケーションサービス** 製品がありません **Real-Time CDP**.

![デモ](./images/pv4.png)

Voêverá a página detales do produto. Um Evento de experiência do tipo **製品表示** agora foi enviado para a Adobe Experience Platform usando a implementação do web SDK que você revisou no Módulo 1. アブラ・オ・ペインエル・ビジュアライゼアドール・デ・ペルフィル・エ・ベリフィク・セウス **エクスペリエンスイベント**.

![デモ](./images/pv5.png)

Acesse a opção de menu **アプリケーションサービス** 製品がありません **Adobe Journey Optimizer**. Mais um Evento de experiência foi enviado para a Adobe Experience Platform.

![デモ](./images/pv7.png)

Abra o painel 視覚化アドールデペルフィル。 アゴラヴォクヴェラ 2 Eventos de experiência do tipo **製品表示**. エンボラオコンポルタメントセハアノニモ、カダクリケレラストレード、アルマゼネアドナAdobe Experience Platform。 Depois que o cliente annonimo se tornar conhecido, poderemos mesclar todo o comportamento annimo automaticamente ao perfil conhecido.

![デモ](./images/pv8.png)

アゴラヴァモスアナリサルセウペルフィルデクライアンテ e usar seu comportamento personalizar sua experiencencia do cliente no site.

プロクシマエタパ： [1.2 seu proprio perfil de cliente em tempo real - UI](./ex2.md)

[レトルナルパラフルクソデウサリオ 1](./uc1.md)

[レトルナーパラトドスオスモドゥロス](../../overview.md)
