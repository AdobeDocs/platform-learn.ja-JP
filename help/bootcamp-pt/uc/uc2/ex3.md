---
title: Bootcamp - Journey Optimizerジャーニーとメールメッセージを作成する — ブラジル
description: Bootcamp - Journey Optimizerジャーニーとメールメッセージを作成する — ブラジル
jira: KT-5342
audience: developer
doc-type: tutorial
activity: develop
exl-id: d486d1aa-7b8e-4301-91e6-4c84fba0c72a
source-git-commit: 90f7621536573f60ac6585404b1ac0e49cb08496
workflow-type: tm+mt
source-wordcount: '934'
ht-degree: 3%

---

# 2.3 クリスアヨルナダ電子メール

Neste expercício, vocêirá configurar a jornada quanda quando alguém criar uma conta no site de demonstração.

Faça ログインのAdobe Journey Optimizerのアクセスサンド a [Adobe Experience Cloud](https://experience.adobe.com). クリック **Journey Optimizer**.

![ACOP](./images/acophome.png)

Vocêserá redirectionado para a visualização da **ホーム**  Journey Optimizer Primeiro, verifique se vocé está usando o sandbox correto. サンドボックスクエデヴ・ユサド・エ `Bootcamp`. パラオルタナルドゥウムサンドボックスパラアウトロ、クリック EM **Prod** sandbox na lista からを選択します。 Neste エグザンプロ， o nome do sandboxé **Bootcamp**. Voêestará na visualização da **ホーム** サンドボックスを設定 `Bootcamp`.

![ACOP](./images/acoptriglp.png)

## 2.3.1 クリー・ア・スア・ヨルナダ

メニューがなく、クリック **ジャーニー**. Em seguida、clique em **作成ジャーニー** パラクリアルマ・ノヴァ・ヨルナダ。

![ACOP](./images/createjourney.png)

ヴォクレヴェラウマテラデヨルナバジア。

![ACOP](./images/journeyempty.png)

エクスペリシオ前部、ボークリウムノボ **イベント**. ベント語 `seuSobrenomeAccountCreationEvent` e 置換 `seuSobrenome` ペロ・セウ・ソブレノーム。 Este foi o resultado da criação do Evento:

![ACOP](./images/eventdone.png)

アゴラのボーカは、思い切ってエステエベントをコモ・イニシオ・デスタ・ヨルナダ。 Vocêpode fazer isso indo para o lado esquerdo da tela e procurando pelo seu evento na lista de eventos.

![ACOP](./images/eventlist.png)

セレクワンセウイベント、アレスト e solte o evento na tela de Jornada. Sua Jornada agora deve ser semelhante ao seginte:

![ACOP](./images/journeyevent.png)

コモセグンダ・エタパ・ダ・ヨルナダ、ボーデヴ・アディシオナール・ウマ・エタパ・カルタ・デ・デ **待機**. Vá para o lado esquerdo da tela até a seção **Orchestration** para encontrar isso. Vocêusarara attributos de perfil e precisará garantir que eles sejam preenchidos no Perfil do Cliente em tempo real.

![ACOP](./images/journeywait.png)

スアヨルナダアゴラは、セメルハンテアオセギンテに敬意を表します。 ラド・ディレイト・ダ・テラ・テレ・プレシサの設定は、テンポ・デ・エスペラの設定はありません。 コモ 1 ミヌトを定義。 イソダラバスタンテテンポパラオスアトリブトスドペルフィルエステジャム・ディスポニヴェス・アポスオ・ディスパロ・ド・イベント。

![ACOP](./images/journeywait1.png)

クリック **Ok** para salvar suas alteraçoes

コモ・テルセイラ・エタパ・ダ・ヨルナダ、ボーディヴ・アディシオナルマ・アサオ **電子メール**. Vá para o lado esquerdo da tela para **アクション**, selection ação **電子メール** arraste e ソルト ação no segundo nó da sua jornada アゴラ・オ・セギンテ・セラ・エキシビド。

![ACOP](./images/journeyactions.png)

定義 **カテゴリ** コモ **マーケティング** e selecone uma **電子メール表面** que perito o envido de e-mail ネスカソ、a **電子メール表面** ユーザーセレクショナダ é 電子メール。 Certifique-se de que as caixas de seleção **メールのクリック数** e **メール開封数** エステジャム・マルカダス。

![ACOP](./images/journeyactions1.png)

プロキシモ・エタパ・クリアル・スア・メンセージェム。 クリック・エム、パラ・イッソ **コンテンツを編集**.

![ACOP](./images/journeyactions2.png)

## 2.3.2 Crie a sua mensagem

パラクリアスアメンセージェム、クリケ **コンテンツを編集**.

![ACOP](./images/journeyactions2.png)

O seguinte será exibido.

![ACOP](./images/journeyactions3.png)

Clique no campo de texto **件名**.

![Journey Optimizer](./images/msg5.png)

コメス・ナ・アレア・デ・テクスト **オラ**

![Journey Optimizer](./images/msg6.png)

リンハ・デ・アスント・アインダ・アンオ・エスタ・プロンタ。 Em seguida, você precisa trazer o token de personalização para o **名** クエストアルマゼナドエム `profile.person.name.firstName`. メニュー無し，役割 para baixo para encontrar o elemento **人物** e clique na seta para 視覚化器 mais campos

![Journey Optimizer](./images/msg7.png)

エレメントアゴラエンコントロ **氏名** clique na seta para ビジュアライゼーション (mais campos)

![Journey Optimizer](./images/msg8.png)

Por フィム、ローカライズ o campo **名** e clique no símbolo **+**  ラドデレ Vocêverá o token de personalização apacer no campo de texto。

![Journey Optimizer](./images/msg9.png)

エム・セギダ、テキストの愛好家 **アグラデセモスはサアインヴァサン！**。クリック **保存**.

![Journey Optimizer](./images/msg10.png)

エンタオ、ヴォーチラ・レトルナ・パラ・エスタ・テラ。 クリック **メールデザイナー**  para criar o conteúdo do e-mail.

![Journey Optimizer](./images/msg11.png)

Na próxima tela, será selicitado que você forneça o conteúdo e-mail através de 3 métodos diferentes:

- **ゼロからデザイン**:comece com uma tela em branco e use o editor WYSIWYG para arrastar e soltar a estrutura e os componentes de conteúdo para criar visualmente o conteúdo e-mail.
- **独自のコーディング**:Crie seu proprio modelo de e-mail codificando usandoHTML
- **インポートHTML**:um modeloHTMLの存在をインポート、que você poderá editar.

クリック **インポートHTML**.

![Journey Optimizer](./images/msg12.png)

アルキボのアレステ・ソルテ **mailtemplatebootcamp.html**，固有のボーカルバイシャ [アクイ](../../assets/html/mailtemplatebootcamp.html.zip). Clique Importar.

![Journey Optimizer](./images/msg13.png)

Vocêverá este modelo de e-mail padrão:

![Journey Optimizer](./images/msg14.png)

Vamos のパーソナライズ機能と電子メール。 Clique ao lado do texto **オラ** e, em seguida, clique no icone **パーソナライゼーションを追加**.

![Journey Optimizer](./images/msg35.png)

Em seguida, você precisa trazer o token de personalização **名** クエストアルマゼナドエム `profile.person.name.firstName`. メニューなし、要素をローカライズ **人物**, faça uma busca detalada no elemento **氏名** e clique no icone **+** para adicionar o campo **名** ao 編集者。

クリック **保存**.

![Journey Optimizer](./images/msg36.png)

アゴラヴォクラコモオカンポデパーソナライズアサンフォイアディシオナドアオセウテキスト。

![Journey Optimizer](./images/msg37.png)

クリック **保存** para salvar sua mensagem.

![Journey Optimizer](./images/msg55.png)

レトルネ・パラ・ド・メンサゲンス・クリカンドナ・セタ・ラド・ド・テキスト・ダ・リンハ・デ・アスント・ノ・カント・スーペリア・エスケルド。

![Journey Optimizer](./images/msg56.png)

アゴラの声は、クリアサオ・ド・セウ電子メール・デ・カダストロを締めくくる。 クリケナセタノカントスーペリアスケルドパラレトルナーラスアヨルナダ。

![Journey Optimizer](./images/msg57.png)

クリック **Ok**.

![Journey Optimizer](./images/msg57a.png)

## 2.3.3 スアジャナラ語の公開

ヴォーチェ・アインダ・プレシサ・アム・ノーム・ア・スア・ヨルナダ。 ボーチュポーデ・ファザー・イッソ・クリカンド・ノ・イコーネ **プロパティ** 上等のディレイトダテラは無い。

![ACOP](./images/journeyname.png)

Vocêpode fazer isso clicando no item clicar no item &quot;Name&quot; e inserindo o seguinte nome `yourLastName - Account Creation Journey`. クリック **OK** mudanças としての para salvar

![ACOP](./images/journeyname1.png)

アゴラヴォーポードパブリカルスアヨルナ・クリカンド・エム **公開**.

![ACOP](./images/publishjourney.png)

クリック **公開**  ノバメンテ

![ACOP](./images/publish1.png)

Vocêverá uma barra de confirmação verde informando que sua jornaagora está Publicada.

![ACOP](./images/published.png)

ヴォーテルミヌーはエキスペルシオをテストした。

プロクシマエタパ： [2.4 テストスアヨルナダ](./ex4.md)

[レトルナルパラフルクソデウサリオ 2](./uc2.md)

[レトルナーパラトドスオスモドゥロス](../../overview.md)
