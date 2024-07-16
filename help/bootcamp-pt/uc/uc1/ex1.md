---
title: Bootcamp - リアルタイム顧客プロファイル - Web サイトで不明なものから既知のもの – ブラジル
description: Bootcamp - リアルタイム顧客プロファイル - Web サイトで不明なものから既知のもの – ブラジル
jira: KT-5342
audience: Data Engineer, Data Architect, Marketer
doc-type: tutorial
activity: develop
feature: Profiles
exl-id: 853a69d2-5dac-413d-bb40-ef29604a26ae
source-git-commit: 3c86f9b19cecf92c9a324fb6fcfcefaebf82177f
workflow-type: tm+mt
source-wordcount: '413'
ht-degree: 1%

---

# 1.1 Do desconhecido ao conhecido em nosso site

## Contexto

Adobe Experience Platform・デセンペニャ・ウム・パペル・インポータント・ネッサ・ジョルナダ。 A plataforma é o cérebro da comunicação, o **エクスペリエンスシステム・オブ・レコード**.

Plataforma é um ambiente em que a palavra cliente engloba mais do que clientes conhecidos. （プラタフォルマ・エ・ム・アンビエンテ・エ・ケ・ア・パラヴラ・クリエンテ・エングロバ・メイス・ド・ケ・クリエンテス・コンヘキデス） Um visitante desconhecido no site também é um cliente do ponto de vista da Plataforma e, como tal, todo o comportamento de um visitante desconhecido também é enviado à Plataforma. （このサイトはタンベルと呼ばれていますが、このサイトは非常に有名です。 Graças a essa abordagem, quando esse visitante eventualmente se torna um cliente conhecido, uma marca também pode visualizar o que aconteceu antes daquele momento. グラーサ・アボルダゲムと呼ばれる偉大な芸術家の作品です。 Isso ajuda a partir de uma perspectiva de otimização de attribuição e experiência. （アジュダはオティミササンの実験の一部である。

## フルクソ・ダ・ジョルナダ・ド・クライアント

アクセス [https://bootcamp.aepdemo.net](https://bootcamp.aepdemo.net)。 「**すべて許可**」をクリックします。

![DSN](./images/web8.png)

Clique no ícone do logotipo da Adobe no canto superior esquerdo da tela para abrir o Visualizador de perfil.

![デモ](./images/pv1.png)

Verifque o painel do Visualizador de perfil e no Perfil do cliente em tempo real com o **Experience CloudID** como identificador primário paraeste cliente que ainda é desconhecido.

![デモ](./images/pv2.png)

Você também pode ver todos os Eventos de Experiência coletados com base no comportamento do cliente. （英語） A lista está vazia no momento, mas isso mudará em breve. （リスタ・エスタ・ヴァジアのモメント、マス・イッソ・ムダラ・エム・ブレブ）

![デモ](./images/pv3.png)

Acesse a opção de menu **Application Services** e clique no produto **Real-Time CDP**.

![デモ](./images/pv4.png)

Você verá a página de detalhes do produto （ボーシェ・ヴェラ・ア・パージーナ・デ・デタルヘス） Um Evento de experiência do tipo **Product View** agora foi enviado para a Adobe Experience Platform usando a implementatção do Web SDK que você revisou no Módulo 1. Abra o painel Visualizador de perfil e verifique seus **エクスペリエンスイベント**.

![デモ](./images/pv5.png)

Acesse a opção de menu **Application Services** e clique no produto **Adobe Journey Optimizer**. Mais um Evento de experiência foi enviado para a Adobe Experience Platform. （英語）

![デモ](./images/pv7.png)

Abra o painel Visualizador de perfil です。 Agora você verá 2 Eventos de experiência do tipo **製品表示**. エンボラ・オ・コンポルタメント・セジャ・アノニモ、カダ・クリケ・エ・ラストレド・エ・アルマゼナド・ナ・Adobe Experience Platform Depois que o cliente anônimo se tornar conhecido, poderemos mesclar todo o comportamento anônimo automaticamente ao perfil conhecido （デポワ・ケ・オ・クリエンテ・アノニモ・トルナー・コンヘキド）

![デモ](./images/pv8.png)

Agora vamos analisar seu perfil de cliente e usar seu comportamento para personalizar sua experiência do cliente no site. アゴラ・ヴァモス・アナリサール・セウ・ペルフィル・デ・クリエンテ・エ・ウサール・コンポルタメントは、このサイトのサイトを見ることはできない。

Próxima etapa: [1.2 Visualize seu próprio perfil de cliente em tempo real - UI](./ex2.md)

[レトルナル パラ フルクソ デ ウスアリオ 1](./uc1.md)

[レトルナル パラ トドス オス モドゥロス](../../overview.md)
