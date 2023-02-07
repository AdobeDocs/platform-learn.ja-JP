---
title: Bootcamp - Journey Optimizerイベントを作成 — ブラジル
description: Bootcamp - Journey Optimizerイベントを作成 — ブラジル
kt: 5342
audience: developer
doc-type: tutorial
activity: develop
source-git-commit: 5d824244766135cd4998feab48be7f6a69c42a70
workflow-type: tm+mt
source-wordcount: '463'
ht-degree: 0%

---

# 2.2 クリーセウエベント

Faça ログインのAdobe Journey Optimizerのアクセスサンド a [Adobe Experience Cloud](https://experience.adobe.com). クリック **Journey Optimizer**.

![ACOP](./images/acophome.png)

Vocêserá redirectionado para a visualização da **ホーム** Journey Optimizer Primeiro, verifique se vocé está usando o sandbox correto. サンドボックスクエデヴ・ユサド・エ `Bootcamp`. Para alternar de um sandbox para outro, clique em Prod selecionone o sandbox na lista. Neste エグザンプロ， o nome do sandboxé **Bootcamp**. Voêestará na visualização da **ホーム** サンドボックスを設定 `Bootcamp`.

![ACOP](./images/acoptriglp.png)

メニュー無し，ロールパラバイクソ e clique em **設定**. エム・セグイダ、クリケ・ノ・ボトン **管理** アバイオクデ **イベント**.

![ACOP](./images/acopmenu.png)

ヴァクヴェルア・ヴィサオ・ジェラル・デ・トドス・エベント・ディスポニヴェイス。 クリック **イベントを作成** para começar criar seu próprio evento

![ACOP](./images/emptyevent.png)

ウマ・ノヴァ・ジャネラ・デ・エヴェント・ヴァジア・イラ・アパレサー。

![ACOP](./images/emptyevent1.png)

Em primeiro lugar, dêum nome ao seu evento como, por exemplo: `seuSobrenomeAccountCreationEvent` e adicione uma は、por エグザンプリを表します。 `Account Creation Event`.

![ACOP](./images/eventdescription.png)

Em seguida, certifique-se de que **タイプ** está definido como **単一** e, para a selção de **イベント ID タイプ**, selecone **生成されたシステム**.

![ACOP](./images/eventidtype.png)

etapa seguiné a seleção do スキーマ。 Um スキーマ foi 準備 para este expercício. スキーマの使用 `Demo System - Event Schema for Website (Global v1.1) v.1`.

![ACOP](./images/eventschema.png)

Depois de selecionar o Schema, vocêverá vários campos sendo selecionados na seção **フィールド**. アゴラボーデヴ・パサー、マウス、ソサオ **フィールド** e três icones ポップアップ serão exibidos クリケ・ノ・イコーネ **編集**.

![ACOP](./images/eventpayload.png)

Voêverá uma janela pop-up de **フィールド**, onde voce selecionar alguns dos campos que precisamos personalizar o e-mail Escolheremos outroos attributos de perfil postermente, utizando os dados já existentes na Adobe Experience Platform.

![ACOP](./images/eventfields.png)

No objecto `_experienceplatform.demoEnvironment`, pcertifique-se de selecionar os campos **brandLogo** e **brandName**.

![ACOP](./images/eventpayloadbr.png)

No objecto `_experienceplatform.identification.core`, certifique se de selecionar o campo **電子メール**.

![ACOP](./images/eventpayloadbrid.png)

クリック **Ok** を alteraçoes のような para salvar に設定します。

![ACOP](./images/saveok.png)

Em seguida, tela abaixo deve ser exibida. クリック **保存**  mais uma vez para salvar suas alteraçoes...

![ACOP](./images/eventsave.png)

Seu evento agora está configurado e salvo.

![ACOP](./images/eventdone.png)

クリケノセウイベントノバメンテパラアブリルマイスマベステラ **イベントを編集**. マウスの酔いが醒める **フィールド** para ver os 3 icones outra vez. クリケ・ノ・イコーネ **ペイロードを表示**.

![ACOP](./images/viewevent.png)

アゴラヴォクヴェラ・アムエグザンプロダ・カルガ・クティル・エスペラダ。
Seu evento tem um eventID de orquestraçãoúnico, que vocêpode encontrar rolando para baixo nessa cargutil (payload) até visualizar `_experience.campaign.orchestration.eventID`.

![ACOP](./images/payloadeventID.png)

O eventIDé o que deve ser envidaoà Adobe Experience Platform para acionar a jornada que você construirá em dos próximos expercícios. Lembre-se deste eventID、voce precisar dele postermente。
`"eventID": "19cab7852cdef99d25b6d5f1b6503da39d1f486b1d585743f97ed2d1e6b6c74f"`

クリック **Ok** e, em seguida, clique **キャンセル**.

アゴラボーテルミノーはエステエキスシオ。

プロクシマエタパ： [ 2.3 Crie sua mensagem de e-mail](./ex3.md)

[レトルナルパラフルクソデウサリオ 2](./uc2.md)

[レトルナーパラトドスオスモドゥロス](../../overview.md)
