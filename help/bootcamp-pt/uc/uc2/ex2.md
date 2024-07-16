---
title: Bootcamp - Journey Optimizer イベントを作成 – ブラジル
description: Bootcamp - Journey Optimizer イベントを作成 – ブラジル
jira: KT-5342
audience: developer
doc-type: tutorial
activity: develop
solution: Journey Optimizer
feature-set: Journey Optimizer
feature: Events
exl-id: 1b9d7a35-cddf-4f4a-ad0a-95723b00c278
source-git-commit: 3c86f9b19cecf92c9a324fb6fcfcefaebf82177f
workflow-type: tm+mt
source-wordcount: '466'
ht-degree: 0%

---

# 2.2 クリー・セウ・イベント

Faça ログイン no Adobe Journey Optimizer acessando a [Adobe Experience Cloud](https://experience.adobe.com)。 Em **Journey Optimizer** をクリックします。

![ACOP](./images/acophome.png)

Você será redirectionado para a visualização da **Home** no Journey Optimizer. Primeiro, verifique se você está usando o sandbox correto. （英語） O nome do sandbox que deve ser usado é `Bootcamp`.（オノーム・ド・サンドボックス・ケ・デヴ・サー・ウサド・デ・オノーム） Para alternar de um sandbox para outro, clique em Prod e selecione o sandbox na lista. Neste exexampo, o nome do sandbox é **Bootcamp**. Você estará na visualização da **Home** do seu sandbox `Bootcamp`.

![ACOP](./images/acoptriglp.png)

メニューはありません apa esquerda, role para baixo e clique em **設定**. Em seguida, clique no bothão **管理** abaixo de **イベント**.

![ACOP](./images/acopmenu.png)

Você verá uma visão geral de todos os eventos disponíveis （ヴォケ・ヴェラ・ウマ・ヴィサン・ジェラル・デ・トドス・エヴェントス・ディスポニヴィス） Clique em **イベントを作成** para começar a criar seu próprio evento.

![ACOP](./images/emptyevent.png)

Uma nova janela de evento vazia irá aparecer （ユマ ノヴァ ジャネラ デ イベント ヴァジア イラ アパーセル）

![ACOP](./images/emptyevent1.png)

Em primeiro lugar, dê um nome ao seu evento como, por exporpo: `seuSobrenomeAccountCreationEvent` e adicione uma descrição como, por exporpo: `Account Creation Event`.

![ACOP](./images/eventdescription.png)

Em seguida, certifique-se de que **タイプ** está definido como **単一** e, para a seleção de **イベント ID タイプ**, selecione **システム生成**.

![ACOP](./images/eventidtype.png)

etapa seguinte é a seleção do スキーマ。 Um スキーマ フォイ プレパラド パラ エステ エクスペリシオ。 スキーマ `Demo System - Event Schema for Website (Global v1.1) v.1` を使用します。

![ACOP](./images/eventschema.png)

Depois de selecionar o Schema, você verá vários campos sendo selecionados na seção **フィールド**. Agora você deve passar o mouse sobre a seção **Fields** e três ícones pop-up serão exibidos. Clique no ícone **編集**.

![ACOP](./images/eventpayload.png)

Você verá uma janela pop-up de **Fields**, onde você deve selecionar alguns dos campos que precisamos para personalizar o e-mail. Escolheremos outros attributos de perfil posteriormente, utilizando os dados já existentes na Adobe Experience Platform.

![ACOP](./images/eventfields.png)

objeto `_experienceplatform.demoEnvironment`、certifique-se de selecionar os campos **brandLogo** e **brandName** はありません。

![ACOP](./images/eventpayloadbr.png)

No objeto `_experienceplatform.identification.core`, certifique-se de selecionar o campo **email**.

![ACOP](./images/eventpayloadbrid.png)

Para salvar suas alteraçóes に EM **OK** をクリックします。

![ACOP](./images/saveok.png)

Em seguida, a tela abaixo deve ser exibida の略。 Clique em **保存** mais uma vez para salvar suas alteraçóes..

![ACOP](./images/eventsave.png)

Seu evento agora está configurado e salvo.

![ACOP](./images/eventdone.png)

Clique no seu evento novamente para abrir mais uma vez a tela **イベントを編集**。 Passe o mouse sobre **フィールド** para ver os 3 ícones outra vez. Clique no ícone **ペイロードを表示**。

![ACOP](./images/viewevent.png)

Agora você verá um explo da carga útil esperada.（アゴラ・ヴォケ・ヴェラ・ウム・エグゼンプロ・ダ・カルガ・ブチ・エスペラダ）
Seu evento tem um eventID de orquestração único, que você pode encontrar rolando para baixo nessa carga útil （payload） até visualizar `_experience.campaign.orchestration.eventID`.

![ACOP](./images/payloadeventID.png)

イベント ID é o que deve ser enviado à Adobe Experience Platform para acionar a jornada que você construirá em um dos próximos exercícios. イベント ID の削除、ポケ ポデ精度の削除（posteriormente）
`"eventID": "19cab7852cdef99d25b6d5f1b6503da39d1f486b1d585743f97ed2d1e6b6c74f"`

Clique em **OK** e, em seguida, clique em **キャンセル**.

アゴラ・ヴォケ・ターミョースト・エクセシオ。

Próxima etapa: [ 2.3 Crie sua mensagem de e-mail](./ex3.md)

[レトルナル パラ フルクソ デ ウスアリオ 2](./uc2.md)

[レトルナル パラ トドス オス モドゥロス](../../overview.md)
