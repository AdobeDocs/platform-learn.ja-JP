---
title: Bootcamp - Real-time CDP - セグメントを作成してアクションを実行 – セグメントをAdobe Target（ブラジル）に送信
description: Bootcamp - Real-time CDP - セグメントを作成してアクションを実行 – セグメントをAdobe Target（ブラジル）に送信
jira: KT-5342
audience: Data Architect, Orchestration Engineer, Marketer
doc-type: tutorial
activity: develop
solution: Experience Platform, Target
feature: Segments, Integrations
exl-id: 862afd4c-1b6c-48fe-bc1f-967c065642e0
source-git-commit: ee5c0af17c12f1d90774a3a4150c9788e2368e39
workflow-type: tm+mt
source-wordcount: '901'
ht-degree: 0%

---

# 1.4 アソン語：エヴィエ・セウ・セグメント・パラ・オ・Adobe Target

アクセス [Adobe Experience Platform](https://experience.adobe.com/platform)。 Depois de fazer login, você irá acessar a página inicial da Adobe Experience Platform.

![データ取得](./images/home.png)

Antes de continuar, você precisa selecionar um **sandbox**. Nome do sandbox a ser selecionado é Bootcamp. （ここがサンドボックスです） É possível fazer isso clicando no texto **[!UICONTROL 生産財]** na linha azul na parte superior da tela. Depois de selecionar o sandbox aapriado, você verá a tela mudanddo e agora você está em seu [!UICONTROL sandbox] dedicado.

![データ取得](./images/sb1.png)

## 1.4.1 Ative seu segmento para o destino do Adobe Target

O Adobe Target está disponível como um destino do CDP em tempo real. Adobe Target, acesse **宛先** e **カタログ** のパラ構成 sua integração com。

Clique em **Personalization** メニュー **カテゴリ** がありません。 Você verá o cartão de destino do **Adobe Target**. 「em **セグメントのアクティブ化**」をクリックします。

![AT](./images/atdest1.png)

Selecione o destino ``Bootcamp Target`` e clique **次へ** を選択します。

![AT](./images/atdest3.png)

Na lista de segmentos disponíveis, selecione o segmento que você criou em [1.3 Crie um segmento](./ex3.md), com o nome `yourLastName - Interest in Real-Time CDP`. Em seguida、clique em **次へ**。

![AT](./images/atdest8.png)

Na próxima página, clique em **次へ**.

![AT](./images/atdest9.png)

「**終了**」をクリックします。

![AT](./images/atdest10.png)

セウ セグメントアゴラ エスタ アティバド パラ オ Adobe Target。

![AT](./images/atdest11.png)

>[!IMPORTANT]
>
>Imediatamente após criar seu destino do Adobe TargetのReal-Time CDP, pode levar até uma hora parque o destino seja ativado. Este é um tempo de espera único devido à definição da configuração de back-end. Depois que o tempo de espera inicial de 1 hora e a configuração do back-end forem concluídos, os segmentos de borda recém-adicionados que são enviados ao destino do Adobe Target estarão disponíveis para segmentação tempo real.

## 1.4.2 sua atividade no Adobe Targetの設定

アゴラ ケ セウ セグメントント Real-Time CDP エスタ コンフィギャラード パラ セール エンヴィアード アオ Adobe Target, é possível configurar sua atividade de Segmentação por experiêência no Adobe Target. Neste exercício, você irá configurar uma atividade baseada no Visual Experience Composer.

パージーナ・イニシャル・ダ・Adobe Experience Cloud・アセサンドにアクセ [https://experiencecloud.adobe.com/](https://experiencecloud.adobe.com/)。 Clique em **Target** para abrir.

![RTCDP](./images/excl.png)

Na página inicial do **Adobe Target**, você verá todas as atividades existents.
Clique em **+ アクティビティを作成** para criar uma nova atividade.

![RTCDP](./images/exclatov.png)

「**エクスペリエンスターゲット設定**」を選択します。

![RTCDP](./images/exclatcrxt.png)

Selecione **Visual** e defina **アクティビティ URL** como `https://bootcamp.aepdemo.net/content/aep-bootcamp-experience/language-masters/en/exercises/particpantXX.html`, mas, antes disso, substitua XX por um número entre 01 e 60.

>[!IMPORTANT]
>
>Cada participante da capacitação deve usar uma página da Web separada parevitar a colisão de várias experiências do Adobe Target. É possível escolher uma página da Web e encontrar a URL acessando: [https://bootcamp.aepdemo.net/content/aep-bootcamp-experience/language-masters/en/exercises.html](https://bootcamp.aepdemo.net/content/aep-bootcamp-experience/language-masters/en/exercises.html).
>
>Todas as páginas compartilham a mesma URL base e terminam com o número do participante.
>
>Por exempo, o participante 1 deve usar a URL `https://bootcamp.aepdemo.net/content/aep-bootcamp-experience/language-masters/en/exercises/particpant01.html`, o participante 30 deve usar a URL `https://bootcamp.aepdemo.net/content/aep-bootcamp-experience/language-masters/en/exercises/particpant30.html`.

ワークスペース **AT Bootcamp** を選択します。

「次へ **をクリックし** す。

![RTCDP](./images/exclatcrxtdtlform.png)

Agora você está no Visual Experience Composer です。 Pode levar de 20 a 30 segundos até o site esteja completamente carregado.

![RTCDP](./images/atform1.png)

Atualmente, o público padrão são **すべての訪問者**. Clique nos **3 dots** ao lado de **All Visitors** e clique em **Change Audience**.

![RTCDP](./images/atform3.png)

Agora você está vendo a lista de públicos disponíveis, e o segmento da Adobe Experience Platform que você criou anteriormente e e enviou ao Adobe Target agora faz parte dessa lista. Selicione o segmento que você criou anteriormente na Adobe Experience Platform. Em をクリックします **オーディエンスを割り当て**。

![RTCDP](./images/exclatvecchaud.png)

セウ・セグメントント・ダ・Adobe Experience Platform・アゴラ・ファズ・パルテ・デッサ・アティヴィダード・デ・セグメンタサン・ポル・エクスペリエンシア（Seu segmento da nagora faz parte dessa Atividade de segmentação por experiêência）

![RTCDP](./images/atform4.png)

Antes de alterar a imagem principal, você deve clicar em **すべて許可** no banner de cookies.

パラ一素、ヴァパラ **参照**

![RTCDP](./images/cook1.png)

Em seguida、clique em **すべて許可**。

![RTCDP](./images/cook2.png)

Em seguida, retorne para **作成**.

![RTCDP](./images/cook3.png)

Agora vamos mudar a imagem principal na página inicial do site. アゴラ・ヴァモス・ムダルの写真は下記のリンクよりダウンロードできます。 Clique na imagem principal padrão no site, clique em **コンテンツを置換** e selecione **画像**.

![RTCDP](./images/atform5.png)

Pesquise o arquivo de imagem **rtcdp.png**。 「**保存**」をクリックして選択します。

![RTCDP](./images/atform6.png)

Você verá a nova experiência com a nova imagem paro seu Público selecionado

![RTCDP](./images/atform7.png)

Clique no título da sua atividade no canto superior esquerdo para renomeá-la. （エスカルド・パラ・レノメラの最高峰）

![RTCDP](./images/exclatvecname.png)

Para o nome、次を使用します。

- `seuSobrenome - RTCDP - XT (VEC)`

「次へ **をクリックし** す。

![RTCDP](./images/atform8.png)

「次へ **をクリックし** す。

![RTCDP](./images/atform8a.png)

Na página **目標と設定**、acesse **目標指標** です。

![RTCDP](./images/atform9.png)

メタプリンシパルコモ **エンゲージメント** - **オンサイト時間** を定義します。 「**保存して閉じる**」をクリックします。

![RTCDP](./images/vec3.png)

Agora você está na página **アクティビティの概要** Você ainda precisa ativar sua Atividade.（ボケ・アインダ・プレシサ・アティバル・スア・アティヴィダデ）

![RTCDP](./images/atform10.png)

「campo を無効にする **非アクティブ**」をクリックし **「アクティブ化** を選択します。

![RTCDP](./images/atform11.png)

Você receberá uma confirmação visual de que sua atividade agora está ativa.（ヴォシェ・レチェベラー・ウマ・コンフィルマソン・ビジュアル・デ・ケ・スア・アティヴィダード・アゴラ・アティヴァ）

![RTCDP](./images/atform12.png)

Agora sua atividade está ativa e pode ser testada no site do bootcamp. （アゴラ・スア・アティヴィダデ・エスタ・エ・ポデ・サーテスタダ）

Se agora você voltar ao seu site de demonstração e visitar a página do produto para **Real-Time CDP**, você se se qualificará instantaneamente para o segmento que criou e verá a atividade do Adobe Target exibida na página inicial em tempo real.

>[!IMPORTANT]
>
>Cada participante da capacitação deve usar uma página da Web separada parevitar a colisão de várias experiências do Adobe Target. É possível escolher uma página da Web e encontrar a URL acessando ao link: [https://bootcamp.aepdemo.net/content/aep-bootcamp-experience/language-masters/en/exercises.html](https://bootcamp.aepdemo.net/content/aep-bootcamp-experience/language-masters/en/exercises.html).
>
>Todas as páginas compartilham a mesma URL base e terminam com o número do participante.
>
>Por exempo, o participante 1 deve usar a `https://bootcamp.aepdemo.net/content/aep-bootcamp-experience/language-masters/en/exercises/particpant01.html`, o participante 30 deve usar a URL `https://bootcamp.aepdemo.net/content/aep-bootcamp-experience/language-masters/en/exercises/particpant30.html`.

![RTCDP](./images/atform12a.png)

Próxima etapa: [1.5 Ação: envie seu segmento para o Facebook](./ex5.md)

[レトルナル パラ フルクソ デ ウスアリオ 1](./uc1.md)

[レトルナル パラ トドス オス モドゥロス](../../overview.md)
