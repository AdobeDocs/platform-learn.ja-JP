---
title: Bootcamp – 物理とデジタルの融合 – モバイルアプリを使用し、ビーコンエントリをトリガー- ブラジル
description: Bootcamp – 物理とデジタルの融合 – モバイルアプリを使用し、ビーコンエントリをトリガー- ブラジル
jira: KT-5342
audience: Data Engineer, Data Architect, Marketer
doc-type: tutorial
activity: develop
feature: Mobile SDK
exl-id: 14bfbebe-6df3-4a0e-875c-b4c0d016f8da
source-git-commit: 3c86f9b19cecf92c9a324fb6fcfcefaebf82177f
workflow-type: tm+mt
source-wordcount: '535'
ht-degree: 0%

---

# 3.1 aplicativo móvel e acione um ビーコンの使用

## Instale o aplicativo móvel

Antes de instalar o aplicativo, é necário habilitar o **Rastreamento** no seu dispositivoiOS. Para isso, acesse **Configuraçóes** > **Privacidade e segurança** > **Rastreamento** e verifique a opção **Permitir que que os aplicativos solicitem o rastreamento**.

![DSN](./../uc3/images/app4.png)

App StoreダApplee ペスキーズ `aepmobile-bootcamp` ースにアクセスしてください。 Clique em **Instalar** ou **ダウンロード**。

![DSN](./../uc3/images/app1.png)

Depois que o aplicativo estiver instalado, clique em **Abrir**.

![DSN](./../uc3/images/app2.png)

Em をクリックします **OK**。

![DSN](./../uc3/images/app9.png)

Clique em **パーミテール**。

![DSN](./../uc3/images/app3.png)

**同意します** をクリックします。

![DSN](./../uc3/images/app7.png)

Clique em **Permitir enquanto usa o aplicativo**。

![DSN](./../uc3/images/app8.png)

Clique em **パーミテール**。

![DSN](./../uc3/images/app5.png)

Agora você está no aplicativo, na página inicial, pronto （a） para verificar toda a jornada do cliente. アゴラ・ヴォケ・エスタ・ノ・アプリカティボ、ナ・パージーナ・イニシアル、プロント（a）パラベリフィカル・トダ・ヨルナダ・ド・クリエンテ。

![DSN](./../uc3/images/app12.png)

## フルクソ・ダ・ジョルナダ・ド・クライアント

Primeiramente, é necário fazer o login. Clique em **ログイン**。

![DSN](./images/app13.png)

Depois de criar sua conta nos exercícios anteriores, isso é exibido no site （英語） Agora é necário reutilizar o endereco de e-mail da conta você criou no aplicativo para fazer o login. （英語）

![デモ](./images/pv1.png)

Digite o endereco de e-mail que você usou no site e clique em **ログイン**.

![DSN](./images/app14.png)

Você receberá uma confirmação de que está conectado e receberá uma notificação push.

![DSN](./images/app15.png)

レトルネ・パラ・ア・パジナ・イニシアル・ド・aplicativo e os recursos adicionais irão aparecer.

![DSN](./images/app17.png)

Primeiro, acesse **製品**. Clique em qualquer produto, neste exexampo: **Coffee to go**.

![DSN](./images/app19.png)

Você verá a página do produto **コーヒーを飲んで行く** no aplicativo.

![DSN](./images/app20.png)

Agora você irá simular um eventto de entrada de sinalização （beacon） em uma loja offline. （英語） O objetivo da simulação é personalizar a experiêência do cliente nas telas da loja.（オベティボ・ダ・シミュラサン・エ・ペルソナリザール） Para visualizar a experiência na loja, foi criada uma página que mostrará de forma dinâmica as informatsoçóes relevantes para o clientte ao entrar na loja.この写真は、スペインの都市の中心部に位置し、その都市の中心部に位置しています。

Antes de continuar, abra esta página da Web em seu computador: [https://bootcamp.aepdemo.net/content/aep-bootcamp-experience/language-masters/en/screen.html](https://bootcamp.aepdemo.net/content/aep-bootcamp-experience/language-masters/en/screen.html)

Em seguida, a tela abaixo será exibida はこう述べている。

![DSN](./images/screen1.png)

Em seguida, retorne para a página inicial. （エム・セギダ、レトルネ・パラ・ア・パージーナ） Clique no ícone do **beacon**.

![DSN](./images/app23.png)

Após essa etapa, o seguinte será exibido.（エスパエサ・エタパ、セギンテ・セラ・エキシビド） Primeiro, selecione **Bootcamp Screen Beacon** e clique no bothão de **entrada**. Isso permitirá que você simule uma entrada de sinalização com beacon. （イッソ・ペルミティラ・ケ・ボーケ・シミュレ・ウマ・エントラーダ・デ・シナリザソン・コム・ビーコン）

![DSN](./images/app21.png)

アゴラ コンフィラ テラ ダ ロハ。 Você verá o último produto visualizado aparecer nessa tela em 5 segundos.

![DSN](./images/screen2.png)

Em seguida、retorne para **製品**。 Clique em qualquer produto, neste exexampo: **Beach blanket Tan**.

![DSN](./images/app22.png)

Em seguida, retorne para a página inicial. （エム・セギダ、レトルネ・パラ・ア・パージーナ） Clique no ícone do **beacon**.

![DSN](./images/app23.png)

Em seguida, selecione **Bootcamp Screen Beacon** e clique no bothão de **Entrada** novamente. Isso permitirá que você simule uma entrada de sinalização （ビーコン）.

![DSN](./images/app21.png)

アゴラ、確かにテラ・ダ・ロハ・ノヴァメンテ。 Você verá o último produto visualizado aparecer nessa tela em 5 segundos.

![DSN](./images/screen3.png)

アゴラ，vamos verificar também o seu Visualizador de Perfil のサイトはありません。 Você verá muitos eventos que foram adicionados, para mostrar que qualquer interação com um cliente é coletada e armazenada na Adobe Experience Platform（英語）

![DSN](./images/screen4.png)

Nos próximos exercícios, você irá configurar e testar sua própria jornada de entrada do beacon.

Próxima etapa: [3.2 クリースエベント ](./ex2.md)

[レトルナル パラ フルクソ デ ウスアリオ 3](./uc3.md)

[レトルナル パラ トドス オス モドゥロス](../../overview.md)
