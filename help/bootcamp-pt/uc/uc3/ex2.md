---
title: Bootcamp – 物理的なコンテンツとデジタルなコンテンツを融合 – Journey Optimizer イベントを作成 – ブラジル
description: Bootcamp – 物理的なコンテンツとデジタルなコンテンツを融合 – Journey Optimizer イベントを作成 – ブラジル
jira: KT-5342
audience: developer
doc-type: tutorial
activity: develop
solution: Journey Optimizer
feature-set: Journey Optimizer
feature: Events
exl-id: 2133b560-09d8-419d-bb99-05d0f3df52cc
source-git-commit: 3c86f9b19cecf92c9a324fb6fcfcefaebf82177f
workflow-type: tm+mt
source-wordcount: '471'
ht-degree: 0%

---

# 3.2 クリー・セウ・イベント

Faça ログイン no Adobe Journey Optimizer acessando a [Adobe Experience Cloud]。 Em **Journey Optimizer** をクリックします。

![ACOP](./images/acophome.png)

Você será redirectionado para a **ホーム** no Journey Optimizer Primeiro, verifique se você está usando o sandbox correto. （英語） O nome do sandbox que deve ser usado é `Bootcamp`.（オノーム・ド・サンドボックス・ケ・デヴ・サー・ウサド・デ・オノーム） Para alternar de um sandbox para outro, clique em **Prod** e selecione o sandbox na lista. Neste exexampo, o nome do sandbox é **Bootcamp**. Você estará na visualização da **Home** do seu sandbox `Bootcamp`.

![ACOP](./images/acoptriglp.png)

メニューはありません apa esquerda, role para baixo e clique em **設定**. Em seguida, clique no bothão **Manage** em Eventos.

![ACOP](./images/acopmenu.png)

Você verá uma visão geral de todos os eventos disponíveis （ヴォケ・ヴェラ・ウマ・ヴィサン・ジェラル・デ・トドス・エヴェントス・ディスポニヴィス） Clique em **イベントを作成** para começar a criar seu próprio evento.

![ACOP](./images/emptyevent.png)

Uma nova janela de evento vazia irá aparecer （ユマ ノヴァ ジャネラ デ イベント ヴァジア イラ アパーセル）

Em primeiro lugar, dê um nome ao seu evento como, por exporpo: `yourLastNameBeaconEntryEvent` e adicione uma descrição como, por exporpo: `Beacon Entry Event`.

![ACOP](./images/eventdescription.png)

Em seguida, certifique-se de que **タイプ** está definido como **単一** e, para a seleção de **イベント ID タイプ**, selecione **システム生成**.

![ACOP](./images/eventidtype.png)

etapa seguinte é a seleção do スキーマ。 Um スキーマ フォイ プレパラド パラ エステ エクスペリシオ。 スキーマ `Demo System - Event Schema for Mobile App (Global v1.1) v.1` を使用します。

![ACOP](./images/eventschema.png)

Depois de selecionar o Schema, você verá vários campos sendo selecionados na seção **フィールド**. Agora você deve passar o mouse sobre a seção **Fields** e três ícones pop-up serão exibidos. Clique no ícone de **編集**.

![ACOP](./images/eventpayload.png)

ヴォケ・ヴェラ・ウマ・ジャネラのポップアップ **フィールド**、オンデ・ヴォケ・デヴ・セレクショナー・アルガンズ・ドス・カンポス・プレシサモス・パラ・ペルソナリザール・ア・ジョルナダ。 Escolheremos outros attributos de perfil posteriormente, utilizando os dados já existentes na Adobe Experience Platform

![ACOP](./images/eventfields.png)

役割 para baixo até ver o objeto `Place context` e marque a caixa de seleção. Com isso, todo o contexto da localização do cliente será disponibilizado para a jornada. （英語） Clique em **OK** para salvar suas alteraçóes.

![ACOP](./images/eventpayloadbr.png)

Em seguida, você deverá ver a tela abaixo （エム・セギダ、ボーケ・デヴェラ・バ・ア・テラ・アバイショ） Clique em **Save** mais uma vez para salvar suas alteraçóes.

![ACOP](./images/eventsave.png)

Seu evento agora está configurado e salvo.

![ACOP](./images/eventdone.png)

Clique no seu evento novamente para abrir a tela **イベントを編集** mais uma vez. Passe o mouse sobre **フィールド** para ver os 3 ícones. Clique no ícone **ビュー**.

![ACOP](./images/viewevent.png)

Agora você verá um expando do payload esperado （アゴラ ボーケ ヴェラ ウム エスペラド）
Seu evento tem um eventID de orquestração único, que você pode encontrar rolando para baixo nessa carga útil até visualiza `_experience.campaign.orchestration.eventID`. （英語）

![ACOP](./images/payloadeventID.png)

イベント ID é o que deve ser enviado à Adobe Experience Platform para acionar a jornada que você construirá em um dos próximos exercícios. イベント ID の削除、ポケ ポデ精度の削除（posteriormente）
`"eventID": "e76c0bf0c77c3517e5b6f4c457a0754ebaf5f1f6b9357d74e0d8e13ae517c3d5"`

Clique em **OK** e, em seguida, clique em **Cancelar**.

Você terminou este exercício.（ヴォケ・ターミョウ・エステ・エクセシオ）

Próxima etapa: [3.3 Crie sua jornada e notificação push](./ex3.md)

[レトルナル パラ フルクソ デ ウスアリオ 3](./uc3.md)

[レトルナル パラ トドス オス モドゥロス](../../overview.md)
