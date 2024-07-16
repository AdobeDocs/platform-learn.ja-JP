---
title: Bootcamp - Journey Optimizer ジャーニーとメールメッセージの作成 – ブラジル
description: Bootcamp - Journey Optimizer ジャーニーとメールメッセージの作成 – ブラジル
jira: KT-5342
audience: developer
doc-type: tutorial
activity: develop
solution: Journey Optimizer
feature-set: Journey Optimizer
feature: Journeys
exl-id: d486d1aa-7b8e-4301-91e6-4c84fba0c72a
source-git-commit: 3c86f9b19cecf92c9a324fb6fcfcefaebf82177f
workflow-type: tm+mt
source-wordcount: '944'
ht-degree: 3%

---

# 2.3 Crie sua jornada e mensagem de e-mail

Neste exercício, você irá configurar a jornada que precisa ser acionada quando alguém criar uma conta no site de demonstração. （英語）

Faça ログイン no Adobe Journey Optimizer acessando a [Adobe Experience Cloud](https://experience.adobe.com)。 Em **Journey Optimizer** をクリックします。

![ACOP](./images/acophome.png)

Você será redirectionado para a visualização da **Home** no Journey Optimizer. Primeiro, verifique se você está usando o sandbox correto. （英語） O nome do sandbox que deve ser usado é `Bootcamp`.（オノーム・ド・サンドボックス・ケ・デヴ・サー・ウサド・デ・オノーム） Para alternar de um sandbox para outro, clique em **Prod** e selecione o sandbox na lista. Neste exexampo, o nome do sandbox é **Bootcamp**. Você estará na visualização da **Home** do seu sandbox `Bootcamp`.

![ACOP](./images/acoptriglp.png)

## 2.3.1 スア ジョルナダのクリエ

メニューはありません、clique em **ジャーニー**。 Em seguida、clique em **ジャーニーを作成** para criar uma nova jornada。

![ACOP](./images/createjourney.png)

ヴォケ・ヴェラ・ウマ・テラ・デ・ジョルナダ・ヴァジア

![ACOP](./images/journeyempty.png)

No exercício anterior, você criou um novo **イベント**. Você nomeou o evento `seuSobrenomeAccountCreationEvent` e substituiu `seuSobrenome` pelo seu sobrenome.（ボケ・ノミウ・オ・イベント・エ・スィーストゥイブ・エストゥイウ・エストゥイブ・エストゥイブ・エストゥイブ・エストゥイブ・エストゥイブ・エストゥイブ。 Este foi o resultado da criação do Evento:

![ACOP](./images/eventdone.png)

Agora você deve considerar este evento como o início desta Jornada. （アゴラ・ボーケ・デヴ・コンシデラル・エスト・エスト・エスト・コモ・オ・イニシオ・デスタ・ヨルナダ） Você pode fazer isso indo para o lado esquerdo da tela e procurando pelo seu evento na lista de eventos. （英語）

![ACOP](./images/eventlist.png)

Selecione seu evento, arraste e e solte o evento na tela de Jornada. （セレシオーネ・スー・イベント、アラースト・ソルト・オ・イベント・ナ・テラ・デ・ジョルナダ） Sua Jornada agora deve ser semelhante ao seguinte:

![ACOP](./images/journeyevent.png)

Como segunda etapa da jornada, você deve additionar uma etapa curta de **Wait**. Vá para o lado esquerdo da tela até a seção **オーケストレーション** para encontrar isso. Você usará attributos de perfil e precisará garantir que eles sejam preenchidos no Perfil do Cliente em tempo real.

![ACOP](./images/journeywait.png)

Sua jornada agora deve ser semelhante ao seguinte.（スア・ヨルナダ・アゴラ・デヴ・セル・セメルハンテ・アオ・セギンテ） No lado direito da tela você precisa configurar o tempo de espera. （ラド ディレイト ダ テラ ボーカの設定なし） 定義コモ 1 分。 Isso dará bastante tempo para que os attributos do perfil estestam disponíveis após o disparo do evento （イッブトと呼ばれるスペイン語で書かれたスペイン語）

![ACOP](./images/journeywait1.png)

Clique em **OK** para salvar suas alteraçóes.

Como terceira etapa da jornada, você deve additionar uma ação **メール**. Vá para o lado esquerdo da tela para **アクション**, selecione a ação **メール** e arraste e e solte a ação no segundo nó da sua jornada. アゴラ・オ・セギンテ・セラ・エクスビド。

![ACOP](./images/journeyactions.png)

**カテゴリ** コモ **マーケティング** e selecione uma **e-mail surface** que permita o envio de e-mail を定義します。 Nesse caso, a **e-mail surface** a ser selecionada é E-mail. Certifique-se de que as caixas de seleção **メールのクリック数** e **メールの開封数** estejam marcadas.

![ACOP](./images/journeyactions1.png)

A próximo etapa é criar sua mensagem （原題） Para isso、クリックします **コンテンツを編集**。

![ACOP](./images/journeyactions2.png)

## 2.3.2 Crie a sua mensagem

Para criar sua mensagem、clique em **コンテンツを編集**。

![ACOP](./images/journeyactions2.png)

O seguinte será exibido （セギンテ・セラ・エクスビド）

![ACOP](./images/journeyactions3.png)

Clique no campo de texto **件名**。

![Journey Optimizer](./images/msg5.png)

Na área de texto, comece **オラ**

![Journey Optimizer](./images/msg6.png)

A linha de assunto ainda não está pronta. （リンハ デ アスント アインダ ナン エスタ プロンタ） Em seguida, você precisa trazer o token de personalização para o **名** que está armazenado em `profile.person.name.firstName`. No menu à esquerda, role para baixo para encontrar o elemento **Person** e clique na seta para visualizar mais campos

![Journey Optimizer](./images/msg7.png)

Agora encontre o elemento **フルネーム** e clique na seta para visualizar mais campos.

![Journey Optimizer](./images/msg8.png)

Por fim, localize o campo **名** e clique no símbolo **+** ao lado dele. Você verá o token de personalização aparecer no campo de texto. （英語）

![Journey Optimizer](./images/msg9.png)

Em seguida, adicione o texto, **agradecemos a sua inscrição!**。**保存** をクリックします。

![Journey Optimizer](./images/msg10.png)

Então, você irá retornar para esta tela. （エンタン、ボーシェ・イラー、レトルナー・パラ・エスタ・テラ） Clique em **メールDesigner** para criar o conteúdo e-mail.

![Journey Optimizer](./images/msg11.png)

Na próxima tela, será solicitado que você forneça o conteúdo e-mail através de 3 métodos diferentes:

- **ゼロからデザイン**:Comece com uma tela em branco e use o editor WYSIWYG para arrastar e soltar a estrutura e os componentes de conteúdo para criar visualmente o conteúdo e-mail.
- **独自のコードを作成**:Crie seu próprio modelo de e-mail codificando usandoHTML
- **読み込みHTML**：モデルHTMLの存在を読み込みます。

「em **読み込みHTML**」をクリックします。

![Journey Optimizer](./images/msg12.png)

Arraste e solte o arquivo **mailtemplatebootcamp.html**, que você pode baixa [aqui](../../assets/html/mailtemplatebootcamp.html.zip). Em インポーターをクリックします。

![Journey Optimizer](./images/msg13.png)

Você verá este modelo de e-mail padrão:

![Journey Optimizer](./images/msg14.png)

Vamos personalizar 電子メール。 Clique ao lado do texto **Olá** e, em seguida, clique no ícone **Personalizationを加える**.

![Journey Optimizer](./images/msg35.png)

Em seguida, você precisa trazer o token de personalização **名** que está armazenado em `profile.person.name.firstName`. No menu, localize o elemento **Person**, faça uma busca detalhada no elemento **Full Name** e clique no ícone **+** para adicionar o campo **First Name** ao editor.

**保存** をクリックします。

![Journey Optimizer](./images/msg36.png)

Agora você verá como campo de personalização foi adicionado ao seu texto. （英語）

![Journey Optimizer](./images/msg37.png)

Clique em **保存** para salvar sua mensagem。

![Journey Optimizer](./images/msg55.png)

Retorne para o painel de mensagens clicando na seta ao lado do texto da linha de assunto no canto superior esquerdo （エスカルド岬）

![Journey Optimizer](./images/msg56.png)

Agora você concluiu a criação do seu e-mail de cadastro.（アゴラ・ボーケはクリャソン・ド・セウのメールを締めくくっている） Clique na seta no canto superior esquerdo para retornar à sua jornada. （クリーク・ナ・セタ・ノ・カント・スーペリア・エスカルド・パラ・レトルナール・ア・スア・ジョルナダ）

![Journey Optimizer](./images/msg57.png)

**OK** をクリックします。

![Journey Optimizer](./images/msg57a.png)

## 2.3.3 スア ジョルナダの公開

Você ainda precisa dar um Nome à sua jornada.（ボーシェ・アインダ・プレッサ・ダルーム・ノーム・ア・スア・ジョルナダ） Você pode fazer isso clicando no ícone **プロパティ** no canto superior direito da tela.

![ACOP](./images/journeyname.png)

Você pode fazer isso clicando no item clicar no item &quot;Name&quot; e inserindo o seguinte nome `yourLastName - Account Creation Journey`. Clique em **OK** para salvar as mudanças.

![ACOP](./images/journeyname1.png)

Agora você pode publicar sua jornada clicando em **Publish**.

![ACOP](./images/publishjourney.png)

Clique em **Publish** novamente。

![ACOP](./images/publish1.png)

Você verá uma barra de confirmação verde informando que sua jornada agora está Publicada. （英語）

![ACOP](./images/published.png)

Você terminou este exercício.（ヴォケ・ターミョウ・エステ・エクセシオ）

Próxima etapa: [2.4 Teste sua jornada](./ex4.md)

[レトルナル パラ フルクソ デ ウスアリオ 2](./uc2.md)

[レトルナル パラ トドス オス モドゥロス](../../overview.md)
