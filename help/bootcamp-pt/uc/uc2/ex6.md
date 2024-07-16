---
title: Bootcamp - コールセンターのPersonalization - ブラジル
description: Bootcamp - コールセンターのPersonalization - ブラジル
jira: KT-5342
audience: developer
doc-type: tutorial
activity: develop
feature: Profiles
exl-id: 7acf778b-042f-4deb-9406-ddcf63daacda
source-git-commit: 3c86f9b19cecf92c9a324fb6fcfcefaebf82177f
workflow-type: tm+mt
source-wordcount: '576'
ht-degree: 0%

---

# 2.6 パーソナライザサオなしコールセンター

Conforme discutido várias vezes durante o bootcamp, personalizar a experiêência do cliente é algo que deve acontecer de maneira omnichannel. （英語） Um call center geralmente é bastante desconectado do restante da jornada do cliente e isso pode, com frequência, levar a experiêências frustrantes do cliente, mas não precisa ser assim. （英語） Vamos mostrar um exempo de como call center pode ser facilmente conectado à Adobe Experience Platform, em tempo real.

## フルクソ・ダ・ジョルナダ・ド・クライアント

No exerccio anterior, usando o aplicativo móvel, você comprou um produto clicando no botão **購入**.

![DSN](./images/app20.png)

Vamos supor que você tenha uma pergunta sobre o status do seu pedido, o que você faria?（オケ・ボーケ・ファリア） Normalmente, você ligaria para o コールセンター。

Antes de ligar para o call center, você precisa saber seu **ロイヤルティ ID**. Você pode encontrar seu ID de fidelidade no Visualizador de Perfil do site.

![DSN](./images/cc1.png)

Nesse caso, o **ロイヤルティ ID** é **5863105**. Como parte de nossa implementatção personalizada do recurso de call center no ambiente de demonstração, você deve adicionar um prefixo ao seu **ロイヤルティ ID**. O prefixo é **11373**, portanto, o ID de fidelidade a ser usado neste exempo é **11373 5863105**. （英語）

Vamos fazer isso agora。 seu telefone e ligue para o número **+1 （323） 745-1670** を使用します。

![DSN](./images/cc2.png)

Será solicitado que você insira seu ID de fidelidade, seguido de **#**.（セラー・ソリティタド・ケ・ボーケ・インシラ・セウ ID デ・フィデリダード） Digite seu ID de fidelidade の略。

![DSN](./images/cc3.png)

Você ouvirá **こんにちは、seu nome**。 エッセノーム・レ・レティラード・ド・ペルフィル・ド・クライエンテ・エム・テンポ・レアル・ナ・Adobe Experience Platform。 Você tem 3 escolhas. Pressione o número **1**, **注文状況**.

![DSN](./images/cc4.png)

Depois de ouvir o status do seu pedido, você terá a opção de pressionar **1** para voltar ao menu principal ou pressionar 2. プレシオーネ **2**。

![DSN](./images/cc5.png)

Em seguida, será solicitado que você avalie sua experiêência de call center, selecionando um número entre 1 e 5, sendo 1 baixo e 5 alto. ファサ・スア・エスコラ。

![DSN](./images/cc6.png)

Sua chamada para o call center será encerrada. （スア チャマダ パラ オ コール センターセラ エンセラダ）

アクセス [Adobe Experience Platform](https://experience.adobe.com/platform)。 Depois de fazer login, você irá acessar a página inicial da Adobe Experience Platform.

![データ取得](./images/home.png)

Antes de continuar, você precisa selecionar um **sandbox**. O nome do sandbox a ser selecionado é ``Bootcamp``.（おー・ノーム・ド・サンドボックス） É possível fazer isso clicando no texto **[!UICONTROL 生産財]** na linha azul na parte superior da tela. Depois de selecionar o [!UICONTROL sandbox] apridado, você verá a tela mudando e agora você está em seu [!UICONTROL sandbox] dedicado.

![データ取得](./images/sb1.png)

メニューなし apa esquerda, acesse **プロファイル** e **参照**.

![ 顧客プロファイル ](./images/homemenu.png)

Selecione o **ID 名前空間** **電子メール** e insira o endereco de e-mail do seu perfil de cliente. （英語） Em **表示** をクリックします。 Clique para abrir seu perfil.（クリーク・パラアップリル・セウ・ペルフィル）

![DSN](./images/cc7.png)

Você verá seu perfil de cliente novamente.（ヴォケ・ヴェラ・セウ・ペルフィル・デ・クリエンテ・ノヴァメンテ） Acesse **イベント**。

![DSN](./images/cc8.png)

Em eventos, você verá 2 eventos com um eventType de **callCenter**. O primeiro evento é o resultado da sua resposta à pergunta **通話満足度を評価してください** （avalie seu chamada）.

![DSN](./images/cc9.png)

役割 um pouco para baixo e você verá o evento que foi registrado quando você selecelionou a opção de verificar o **注文状況**.

![DSN](./images/cc10.png)

Acesse **セグメントメンバーシップ**。 Agora você verá que 2 segmentos se qualificam em seu perfil, em tempo real, com base nas interaçóes que você teve por meio do call center. Essas associaçóes de segmento podem e devem ser usadas para impactar qual comunicação e personalização acontece em qualquer outro canal. （英語）

![DSN](./images/cc11.png)

Você terminou este exercício.（ヴォケ・ターミョウ・エステ・エクセシオ）

[レトルナル パラ フルクソ デ ウスアリオ 2](./uc2.md)

[レトルナル パラ トドス オス モドゥロス](../../overview.md)
