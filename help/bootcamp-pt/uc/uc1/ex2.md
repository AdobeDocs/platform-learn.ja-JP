---
title: Bootcamp - リアルタイム顧客プロファイル – 独自のリアルタイム顧客プロファイルを視覚化 – UI - ブラジル
description: Bootcamp - リアルタイム顧客プロファイル – 独自のリアルタイム顧客プロファイルを視覚化 – UI - ブラジル
jira: KT-5342
audience: Data Engineer, Data Architect, Marketer
doc-type: tutorial
activity: develop
feature: Profiles
exl-id: 4eebb080-77fd-4162-aa64-d599f1274c93
source-git-commit: 3c86f9b19cecf92c9a324fb6fcfcefaebf82177f
workflow-type: tm+mt
source-wordcount: '540'
ht-degree: 1%

---

# 1.2 seu próprio perfil de cliente em tempo real の視覚化 – UI

Neste exercício, você irá fazer login na Adobe Experience Platform e visualizar seu próprio Perfil de cliente em tempo real na UI.

## ヒストリア

No Perfil do cliente em tempo real, todos os dados do perfil são exibidos juntamente com os dados do evento, além das associaçóes de segmentos existentes. Os dados mostrados podem vir de qualquer lugar, de aplicativos da Adobe e soluçóes externas. Essa é a exibisão mais poderosa da Adobe Experience Platform, o verdadeiro local do sistema de experiência. エッサ・エ・ア・エシビサン・メイス・ポデローサ・ダ・エシビサはヴェルダデイロの地元の地元の人たちです。

## 1.2.1 Adobe Experience Platformを使う

アクセス [Adobe Experience Platform](https://experience.adobe.com/platform)。 Depois de fazer login, você irá acessar a página inicial da Adobe Experience Platform.

![データ取得](./images/home.png)

Antes de continuar, você precisa selecionar um **sandbox**. Nome do sandbox a ser selecionado é Bootcamp. （ここがサンドボックスです） É possível fazer isso clicando no texto **[!UICONTROL 生産財]** na linha azul na parte superior da tela. Depois de selecionar o sandbox aapriado, você verá a tela mudanddo e agora você está em seu [!UICONTROL sandbox] dedicado.

![データ取得](./images/sb1.png)

メニューなし apa esquerda, acesse **プロファイル** e **参照**.

![ 顧客プロファイル ](./images/homemenu.png)

ペネル Visualizador de perfil no seu site, você pode encontrar a visão geral da identidade. ペネル Visualizador de perfil no seu サイトはありません。 Cada identidade está vinculada a um namespace.

![ 顧客プロファイル ](./images/identities.png)

No painel Visualizador de perfil, agora você pode ver uma identidade semelhante a seguinte:

| 名前空間 | ID |
|:-------------:| :---------------:|
| Experience CloudID （ECID） | 19428085896177382402834560825640259081 |

Com a Adobe Experience Platform, todos os IDs são igualmente importantes. Anteriormente, o ECID era o ID mais importante no contexto da Adobe e todos os outros IDs estavam vinculados ao ECID em uma relção hierárquica. Com a Adobe Experience Platform, isso mudou e cada ID pode ser considerado um identificador primário.

Normalmente, o identificador primário dependent do contexto. Se você perguntar ao seu コールセンター：**Qual é o ID mais importante?** Eles provavelmente responderão: **o número de telefone!** Mas se você perguntar à sua equipe de CRM, eles responderão: **o endereco de e-mail!** Adobe Experience Platformentende essa complexidade e gerencia isso para você. Cada aplicativo, seja um aplicativo da Adobe ou não, se comunicará com a Adobe Experience Platform referindo-se ao ID que consideram principal. E simplesmente funciona.

Para o campo **Identity namespace**, selecione **ECID** e para o campo **Identity Value** insira o ECID que você pode encontrar no painel Visualizador de perfil do site do Bootcamp. Em **表示** をクリックします。 ボーシェ ヴェラ セウ ペルフィル ナ リスタ。 Clique no **プロファイル ID** para abrir seu perfil.

![ 顧客プロファイル ](./images/popupecid.png)

アゴラ ボーケ tem uma visão geral de alguns **Atributos de perfil** importantes do seu perfil de cliente.

![ 顧客プロファイル ](./images/profile.png)

Acesse **イベント**, onde você pode ver as entradas de cada evento de experiêência vinculado ao seu Perfil.

![ 顧客プロファイル ](./images/profileee.png)

Por fim, acesse a opção de menu **セグメントメンバーシップ**. Agora você verá todos os segmentos que se qualificam para este perfil.（アゴラ・ボーケ・ヴェラ・トドス・オース・セグメントス・ケ・セ・クアリフィカム・パラエステ・ペルフィル）

![ 顧客プロファイル ](./images/profileseg.png)

Agora vamos criar um novo segmento que permitirá que você a personalization a experiêência do cliente para um cliente anônimo ou conhecido.（アゴラ・ヴァモス・クリアール・ノヴォ・セグメント・ケ・ペルミティラ・ケ・ボーケ・ボーケ）

Próxima etapa: [1.3 Crie um segmento - UI](./ex3.md)

[レトルナル パラ フルクソ デ ウスアリオ 1](./uc1.md)

[レトルナル パラ トドス オス モドゥロス](../../overview.md)
