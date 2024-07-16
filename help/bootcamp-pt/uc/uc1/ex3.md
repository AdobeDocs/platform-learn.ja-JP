---
title: Bootcamp - リアルタイム顧客プロファイル – セグメントの作成 – UI - ブラジル
description: Bootcamp - リアルタイム顧客プロファイル – セグメントの作成 – UI - ブラジル
jira: KT-5342
audience: Data Engineer, Data Architect, Marketer
doc-type: tutorial
activity: develop
feature: Segments
exl-id: 9b8d93b5-5bed-4600-8602-b438a0893612
source-git-commit: ee5c0af17c12f1d90774a3a4150c9788e2368e39
workflow-type: tm+mt
source-wordcount: '517'
ht-degree: 2%

---

# 1.3 Crie um segmento - UI

Neste exercício, você irá criar um segmento usando o Construtor de Segmentos da Adobe Experience Platform.

## ヒストリア

アクセス [Adobe Experience Platform](https://experience.adobe.com/platform)。 Depois de fazer login, você irá acessar a página inicial da Adobe Experience Platform.

![データ取得](./images/home.png)

Antes de continuar, você precisa selecionar um **sandbox**. O nome do sandbox a ser selecionado é ``Bootcamp``.（おー・ノーム・ド・サンドボックス） É possível fazer isso clicando no texto **[!UICONTROL 生産財]** na linha azul na parte superior da tela. Depois de selecionar o sandbox aapriado, você verá a tela mudanddo e agora você está em seu [!UICONTROL sandbox] dedicado.

![データ取得](./images/sb1.png)

No menu à esquerda, acesse **セグメント**. Nesta página, você tem uma visão geral de todos os segmentos existentes. （英語） Clique no bothão + Criar segmento para começar a criar um novo segmento （クリーク・ノボ・セグメント）

![セグメント化](./images/menuseg.png)

Quando estiver no novo construtor de segmentos, você irá percepber imediatamente a opção de menu **属性** e a referência do **XDM 個人プロファイル**.

![セグメント化](./images/segmentationui.png)

例えば、XDM タンベムは、デ・セメントトスの解釈の基礎となるべきものです。 Todos os dados ingeridos na plataforma devem ser mapeados em relção ao XDM e, portanto, todos os dados se tornam parte do mesmo modelo de dados, independentementte da origem dados. Isso oferece uma grande vantagem ao criar segmentos, pois a partir dessa interface do usuário do construtor de segmento, é possível combinar dados de qualquer origem no mesmo fluxo de trabalho. （イッソ・オファレセ・ウマ・グランデ・バンタジェム・アオ・クリアール・セグメントス、ポアは部分的なデッサのインターフェースである。 Os segmentos criados no Construtor de segmentos podem ser enviados para soluçóes como Adobe Target, Adobe Campaign e Adobe Audience Manager parativação.

Agora você precisa criar um um segmento de todos os clientes que visualizaram o produto **Real-Time CDP**.

Para construir este segmento, você precisa adicionar um Evento de experiência. Você pode encontrar todos os Eventos de experiência clicando no ícone **イベント** na barra de menu **フィールド**.

![セグメント化](./images/findee.png)

Em seguida, você verá o nó **XDM ExperienceEvents** do nível superior. Em **XDM ExperienceEvent** をクリックします。

![セグメント化](./images/see.png)

Acesse **製品リスト項目**。

![セグメント化](./images/plitems.png)

Selecione **名前** e arraste e solte o objeto **名前** do menu à esquerda na tela do construtor de segmentos na seção **イベント**. セギンテ・セラ・エクシビドのエム・セギダ：

![セグメント化](./images/eewebpdtlname.png)

O parâmetro de comparação deve ser **equals** e, no campo de entrada, insira **リアルタイム CDP**.

![セグメント化](./images/pv.png)

Sempre que adicionar um elemento ao constructor de segmentos, você pode clicar no bothão **Refresh Estimate** para obter uma nova estimativa da população em seu segmento.

![セグメント化](./images/refreshest.png)

Para **Evaluation Method**, selecione **Edge**.

![セグメント化](./images/evedge.png)

Por fim, vamos dar um nome ao seu segmento e salvá-lo. （プール・フィム、ヴァモス・ダル・ウム・ノーム・アオ・セウ・セグメント・エ・サルバ・ロ）

Como modelo de nomenclatura は、以下を使用します。

- `seuSobrenome - Interest in Real-Time CDP`

Em seguida, clique no bothão **保存して閉じる** para salvar seu segmento.

![セグメント化](./images/segmentname.png)

Agora você irá retornar à página de visão geral do segmento, onde verá uma visualizaçaão de amostra dos perfis de clientes que se qualificam para o seu segmento （英語）

![セグメント化](./images/savedsegment.png)

Agora você pode continuar no próximo exercío e usar seu segmento com o Adobe Target.

Próxima etapa: [1.4 Ação: envie seu segmento para o Adobe Target](./ex4.md)

[レトルナル パラ フルクソ デ ウスアリオ 1](./uc1.md)

[レトルナル パラ トドス オス モドゥロス](../../overview.md)
