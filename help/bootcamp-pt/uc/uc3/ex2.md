---
title: Bootcamp — 物理とデジタルの組み合わせ — Journey Optimizerイベントを作成 — ブラジル
description: Bootcamp — 物理とデジタルの組み合わせ — Journey Optimizerイベントを作成 — ブラジル
jira: KT-5342
audience: developer
doc-type: tutorial
activity: develop
exl-id: 2133b560-09d8-419d-bb99-05d0f3df52cc
source-git-commit: 90f7621536573f60ac6585404b1ac0e49cb08496
workflow-type: tm+mt
source-wordcount: '467'
ht-degree: 0%

---

# 3.2 クリーセウエベント

Faça ログインのAdobe Journey Optimizerのアクセスサンド a [Adobe Experience Cloud]. クリック **Journey Optimizer**.

![ACOP](./images/acophome.png)

Vocêserá redirectionado para a **ホーム** Journey Optimizer Primeiro, verifique se vocé está usando o sandbox correto. サンドボックスクエデヴ・ユサド・エ `Bootcamp`. パラオルタナルドゥウムサンドボックスパラアウトロ、クリック EM **Prod** sandbox na lista からを選択します。 Neste エグザンプロ， o nome do sandboxé **Bootcamp**. Voêestará na visualização da **ホーム** サンドボックスを設定 `Bootcamp`.

![ACOP](./images/acoptriglp.png)

メニュー無し，ロールパラバイクソ e clique em **設定**. エム・セグイダ、クリケ・ノ・ボトン **管理** エム・イベントス。

![ACOP](./images/acopmenu.png)

ヴァクヴェルア・ヴィサオ・ジェラル・デ・トドス・エベント・ディスポニヴェイス。 クリック **イベントを作成** para começar criar seu próprio evento

![ACOP](./images/emptyevent.png)

ウマ・ノヴァ・ジャネラ・デ・エヴェント・ヴァジア・イラ・アパレサー。

Em primeiro lugar, dêum nome ao seu evento como, por exemplo: `yourLastNameBeaconEntryEvent` e adicione uma は、por エグザンプリを表します。 `Beacon Entry Event`.

![ACOP](./images/eventdescription.png)

Em seguida, certifique-se de que **タイプ** está definido como **単一** e, para a selção de **イベント ID タイプ**, selecone **生成されたシステム**.

![ACOP](./images/eventidtype.png)

etapa seguiné a seleção do スキーマ。 Um スキーマ foi 準備 para este expercício. スキーマの使用 `Demo System - Event Schema for Mobile App (Global v1.1) v.1`.

![ACOP](./images/eventschema.png)

Depois de selecionar o Schema, vocêverá vários campos sendo selecionados na seção **フィールド**. アゴラボーデヴ・パサー、マウス、ソサオ **フィールド** e três icones ポップアップ serão exibidos クリケ・ノ・イコーネ・デ **編集**.

![ACOP](./images/eventpayload.png)

Voêverá uma janela pop-up de **フィールド**, onde vocede selecionar alguns dos campos que precisamos para personalizar a jornada Escolheremos outros attributos de perfil postermente, utizando os dados já existentes na Adobe Experience Platform

![ACOP](./images/eventfields.png)

ロール・パラ・バイクソ・アテ・バー・オブジェト `Place context` カイシャ・デ・セルサオをマルクに。 com isso, todo o contexto da localização do cliente será disponibilizado para a jornada. クリック **Ok** para salvar suas alteraçoes

![ACOP](./images/eventpayloadbr.png)

Em seguida, você deverá ver a tela abaixo. クリック **保存** mais uma vez para salvar suas alteraçoes

![ACOP](./images/eventsave.png)

Seu evento agora está configurado e salvo.

![ACOP](./images/eventdone.png)

クリケノセウエベントノバメンテパラテラ **イベントを編集** マイス・ウマ・ベス マウスの酔いが醒める **フィールド** para ver os 3 ícones(para ver os 3 ícones)。 クリケ・ノ・イコーネ **表示**.

![ACOP](./images/viewevent.png)

Agora vocêverá um exemplo do payload esperado.
Seu evento tem um eventID de orquestraçãoúnico, que vocêpode encontrar rolando para baixo nessa cargaútil visualiza `_experience.campaign.orchestration.eventID`.

![ACOP](./images/payloadeventID.png)

O eventIDé o que deve ser envidaoà Adobe Experience Platform para acionar a jornada que você construirá em dos próximos expercícios. Lembre-se deste eventID、voce precisar dele postermente。
`"eventID": "e76c0bf0c77c3517e5b6f4c457a0754ebaf5f1f6b9357d74e0d8e13ae517c3d5"`

クリック **Ok** e, em seguida, clique **キャンセル**.

ヴォーテルミヌーはエキスペルシオをテストした。

プロクシマエタパ： [3.3 クリースアヨルナダ電子通知のプッシュ](./ex3.md)

[レトルナルパラフルクソデウサリオ 3](./uc3.md)

[レトルナーパラトドスオスモドゥロス](../../overview.md)
