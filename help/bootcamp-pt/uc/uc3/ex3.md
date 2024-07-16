---
title: Bootcamp – 物理的なコンテンツとデジタルなコンテンツを融合 – Journey Optimizer ジャーニーとプッシュの作成 – Brazilnotification
description: Bootcamp – 物理的なコンテンツとデジタルなコンテンツを融合 – Journey Optimizer ジャーニーとプッシュの作成 – Brazilnotification
jira: KT-5342
audience: developer
doc-type: tutorial
activity: develop
solution: Journey Optimizer
feature-set: Journey Optimizer
feature: Events
exl-id: a4ef6eaf-6b39-4450-82bf-7db99595a323
source-git-commit: 3c86f9b19cecf92c9a324fb6fcfcefaebf82177f
workflow-type: tm+mt
source-wordcount: '843'
ht-degree: 1%

---

# 3.3 クリエ スア ジョルナダ エ notificação プッシュ

Neste exercício, você irá configurar a jornada e a mensagem que precisa ser acionada quando alguém inserir uma sinalização （ビーコン） usando o o aplicativo móvel. （英語）

Faça ログイン no Adobe Journey Optimizer acessando a [Adobe Experience Cloud](https://experience.adobe.com)。 Em **Journey Optimizer** をクリックします。

![ACOP](./images/acophome.png)

Você será redirectionado para a visualização da **Home** no Journey Optimizer. Primeiro, verifique se você está usando o sandbox correto. （英語） O nome do sandbox que deve ser usado é `Bootcamp`.（オノーム・ド・サンドボックス・ケ・デヴ・サー・ウサド・デ・オノーム） Para alternar de um sandbox para outro, clique em **Prod** e selecione o sandbox na lista. Neste exexampo, o nome do sandbox é **Bootcamp**. Você estará na visualização da **Home** do seu sandbox `Bootcamp`.

![ACOP](./images/acoptriglp.png)

## 3.3.1 スア ジョルナダのクリエ

メニューはありません、clique em **ジャーニー**。 Em seguida、clique em **ジャーニーを作成** para criar uma nova jornada。

![ACOP](./images/createjourney.png)

ヴォケ・ヴェラ・ウマ・テラ・デ・ジョルナダ・ヴァジア

![ACOP](./images/journeyempty.png)

No exercício anterior, você criou um novo **イベント**. Você nomeou o evento `yourLastNameBeaconEntryEvent` e substituiu `yourLastName` pelo seu sobrenome.（ボケ・ノミウ・オ・イベント・エ・スィーストゥイブ・エストゥイウ・エストゥイブ・エストゥイブ・エストゥイブ・エストゥイブ・エストゥイブ・エストゥイブ。 Este foi o resultado da criação do Evento:

![ACOP](./images/eventdone.png)

Agora você deve considerar este evento como o início desta Jornada. （アゴラ・ボーケ・デヴ・コンシデラル・エスト・エスト・エスト・コモ・オ・イニシオ・デスタ・ヨルナダ） Você pode fazer isso indo para o lado esquerdo da tela e procurando pelo seu evento na lista de eventos. （英語）

![ACOP](./images/eventlist.png)

Selecione seu evento, arraste e e solte o evento na tela de jornada. （セリオーネ・セウ・エベント、アラースト・エ・ソルト・オ・エヴェント・ナ・テラ・デ・ジョルナダ） Sua jornada agora deve ser semelhante ao seguinte.（スア・ヨルナダ・アゴラ・デヴ・セル・セメルハンテ・アオ・セギンテ） Clique em **OK** para salvar suas alteraçóes.

![ACOP](./images/journeyevent.png)

Como segunda etapa da jornada, você deve additionar uma ação **プッシュ**. Vá para o lado esquerdo da tela para **アクション**, selecione a ação **プッシュ** e arraste e e solte a ação no segundo nó da sua jornada.

![ACOP](./images/journeyactions.png)

いいえ lado direito da tela, agora você deve criar sua notificação push.

**カテゴリ** コモ **マーケティング** e selecione um push surface que permite enviar notificaçóes push を定義します。 Nesse caso, a superficie push a ser selecionada é **mmeeeewis-app-mobile-bootcamp**.

![ACOP](./images/journeyactions1.png)

## 3.3.2 Crie a sua mensagem

「em **コンテンツを編集**」をクリックします。

![ACOP](./images/emptymsg.png)

Em seguida, a tela abaixo será exibida はこう述べている。

![ACOP](./images/emailmsglist.png)

Vamos definir o conteúdo da notificação push.（ワモス・ディール・オ・コンテウド・ダ・ノティカソン・プッシュ）

Clique no campo de texto **タイトル**。

![Journey Optimizer](./images/msg5.png)

Na área de texto, comece **Olá**. Clique no ícone de personalização.（クリケ・ノイコン・デ・ペルソナライザサン）

![Journey Optimizer](./images/msg6.png)

Agora você precisa trazer o token de personalização para o campo **名** que está armazenado em `profile.person.name.firstName`. メニューはありません esquerda, selecione **プロファイル属性**, role para baixo/navegue para encontrar o elemento **人** e clique na seta para avançar um nível até chegar ao campo `profile.person.name.firstName`. Clique no ícone **+** para adicionar o campo à tela. （クリーク・ノイコン・ア・コラ・パラアドシオナル・オカンポ・ア・テラ） **保存** をクリックします。

![Journey Optimizer](./images/msg7.png)

Então, você irá retornar para esta tela. （エンタン、ボーシェ・イラー、レトルナー・パラ・エスタ・テラ） Clique no ícone de personalização ao lado do campo **Body**.

![Journey Optimizer](./images/msg11.png)

エスクレ `Bem-vindo(a)` ア・デ・テクストです。

![Journey Optimizer](./images/msg12.png)

Em seguida、clique em **コンテキスト属性** e **Journey Orchestration**。

![ACOP](./images/jomsg3.png)

Clique em **イベント**。

![ACOP](./images/jomsg4.png)

Clique no nome do seu evento, que deve ser semelhante ao seguinte: **yourLastNameBeaconEntryEvent**.

![ACOP](./images/jomsg5.png)

「コンテキストを配置 **」をクリック** ます。

![ACOP](./images/jomsg6.png)

Clique em **POI インタラクション**。

![ACOP](./images/jomsg7.png)

Clique em **POI 詳細**.

![ACOP](./images/jomsg8.png)

Clique no **+** icon no **POI 名** をクリックします。
Em seguida, o seguinte será exibido.（セギンテ・セラ・エクシビド） **保存** をクリックします。

![ACOP](./images/jomsg9.png)

スア メンサジェム アゴラ エスタ プロンタ。 Clique na seta no canto superior esquerdo para retornar à sua jornada. （クリーク・ナ・セタ・ノ・カント・スーペリア・エスカルド・パラ・レトルナール・ア・スア・ジョルナダ）

![ACOP](./images/jomsg11.png)

**OK** をクリックします。

![ACOP](./images/jomsg14.png)

## 3.3.2 エンヴィー馬 mensagem para uma tela

Como terceira etapa da jornada, você deve additionar uma ação **sendMessageToScreen**. Vá para o lado esquerdo da tela para **アクション**, selecione a ação **sendMessageToScreen** e arraste e e solte a ação no terceiro nó da sua jornada. Em seguida, você verá a tela abaixo. （エム・セギダ、ボークレ・ヴェラ・ア・テラ・アバイショ）

![ACOP](./images/jomsg15.png)

**sendMessageToScreen** é uma ação personalizada que irá publicar uma mensagem no **Endpoint** usado pela exibicão na loja. A ação **sendMessageToScreen** espera que múltiplas variáveis sejam definidas. Você pode visualizar essas variáveis rolando para baixo até ver **アクションパラメーター**.

![ACOP](./images/jomsg16.png)

Agora você precisa definir os valores parcada parâmetro de ação.（アゴラ ボーケ プレシサ デヴァロレス パラ カダ パラメトロ デ アソン） Siga esta tabela para entender quais valores são necários e onde.（シガエスタ・タベラ・パラ・エンテンダー・ケ・ヴァロレス・サンポカリオス・オンデ）

| パラメーター | 値 |
|:-------------:| :---------------:|
| 配信 | `'image'` |
| ECID | `@{yourLastNameBeaconEntryEvent._experienceplatform.identification.core.ecid}` |
| 名 | `#{ExperiencePlatform.ProfileFieldGroup.profile.person.name.firstName}` |
| EVENTSUBJECT | `#{ExperiencePlatform.ProductListItems.experienceevent.first(currentDataPackField.eventType == "commerce.productViews").productListItems.first().name}` |
| EVENTSUBJECTURL | `#{ExperiencePlatform.ProductListItems.experienceevent.first(currentDataPackField.eventType == "commerce.productViews").productListItems.first()._experienceplatform.core.imageURL}` |
| SANDBOX | `'bootcamp'` |
| CONTAINERID | `''` |
| ACTIVITYID | `''` |
| PLACEMENTID | `''` |

{style="table-layout:auto"}

パラはヴァロアを定義し、clique no ícone **編集**。

![ACOP](./images/jomsg17.png)

Em seguida、選択 **詳細設定モード**。

![ACOP](./images/jomsg18.png)

Em seguida, cole o valor com base na tabela acima.（エム・セギダ、コール・オ・バロール、コム・ベース・ナ・タベラ・アシマ） **OK** をクリックします。

![ACOP](./images/jomsg19.png)

レピータ エスセ プロチェッソ パラ アドシオナル ヴァロレス パラ カダ カンポ。

>[!IMPORTANT]
>
>Para o campo ECID, há uma referência ao evento`yourLastNameBeaconEntryEvent`. Lembre-se de substituir `yourLastName` pelo seu sobrenome （ゾブレノーム）

O resultado final deve ser semelhante ao seguinte:

![ACOP](./images/jomsg20.png)

役割 parcima e clique em **OK**。

![ACOP](./images/jomsg21.png)

ジャーニーに名前を付ける必要があります。 画面の右上にある **プロパティ** アイコンをクリックすると、これを行うことができます。

![ACOP](./images/journeyname.png)

Você pode inserir o nome da jornada aqui.（ボケ・ポデ・イサリール・オ・ノーム・ダ・ヨルナダ・アクイ） `yourLastName - Beacon Entry Journey` を使用します。 Clique em **OK** para salvar suas alteraçóes.

![ACOP](./images/journeyname1.png)

Agora você pode publicar sua jornada clicando em **Publish**.

![ACOP](./images/publishjourney.png)

Clique em **Publish** novamente。

![ACOP](./images/publish1.png)

Você verá uma barra de confirmação verde informando que sua jornada agora está Publicada. （英語）

![ACOP](./images/published.png)

Sua jornada agora está ativa e pode ser acionada. （スア・ジョルナダ・アゴラ・エスタ・アティヴァ・エ・ポデ・サ・アクオナダ）

Você terminou este exercício.（ヴォケ・ターミョウ・エステ・エクセシオ）

エタパ島：[3.4 Teste sua jornada](./ex4.md)

[レトルナル パラ フルクソ デ ウスアリオ 3](./uc3.md)

[レトルナル パラ トドス オス モドゥロス](../../overview.md)
