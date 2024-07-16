---
title: Bootcamp - Real-time CDP - セグメントを作成してアクションを実行 – セグメントを DV360 （ブラジル）に送信
description: Bootcamp - Real-time CDP - セグメントを作成してアクションを実行 – セグメントを DV360 （ブラジル）に送信
jira: KT-5342
audience: Data Architect, Orchestration Engineer, Marketer
doc-type: tutorial
activity: develop
feature: Destinations
exl-id: acb32859-6f82-44e0-8948-a045a9fe2afe
source-git-commit: 3c86f9b19cecf92c9a324fb6fcfcefaebf82177f
workflow-type: tm+mt
source-wordcount: '293'
ht-degree: 1%

---

# 1.5 アソン語：エンヴィエ・セウ・セグメント・パラ・オ・Facebook

アクセス [Adobe Experience Platform](https://experience.adobe.com/platform)。 Depois de fazer login, você irá acessar a página inicial da Adobe Experience Platform.

![データ取得](./images/home.png)

Antes de continuar, você precisa selecionar um **sandbox**. Nome do sandbox a ser selecionado é Bootcamp. （ここがサンドボックスです） É possível fazer isso clicando no texto **[!UICONTROL 生産財]** na linha azul na parte superior da tela. Depois de selecionar o sandbox aapriado, você verá a tela mudanddo e agora você está em seu [!UICONTROL sandbox] dedicado.

![データ取得](./images/sb1.png)

No menu à esquerda, vá para **Destinations** e, em seguida, vá para **Catalog**. Você verá o **宛先カタログ**。 Em **宛先**、一意の EM **セグメントのアクティブ化**、cartão **Facebook カスタムオーディエンス** はありません。

![RTCDP](./images/rtcdpgoogleseg.png)

**bootcamp-facebook** を選択し、「次へ **」をクリック** ます。

![RTCDP](./images/rtcdpcreatedest2.png)

Na lista de segmentos disponíveis, selecione o segmento que você criou no exercício anterior. （英語） 「次へ **をクリックし** す。

![RTCDP](./images/rtcdpcreatedest3.png)

Na página **Mapping**, verifique se a caixa de seleção **Apply Transformation** está marcada. 「次へ **をクリックし** す。

![RTCDP](./images/rtcdpcreatedest4a.png)

Na página **セグメントスケジュール**、選択 a **オーディエンスの接触チャネル** e defina como **顧客から直接**。 「次へ **をクリックし** す。

![RTCDP](./images/rtcdpcreatedest4.png)

Por fim, na página **レビュー**, clique em **終了**.

![RTCDP](./images/rtcdpcreatedest5.png)

Seu segmento agora está vinculado aos Públicos Personalizados do Facebook. Sempre que um cliente se qualificar para esse segmento, um sinal será enviado ao lado do servidor （サーバーサイド） do Facebook para incluir esse no Público Personalizado no lado do Facebook.

facebookは存在しない。você encontrará seu segmento da Adobe Experience Platform em Públicos Personalizados:

![RTCDP](./images/rtcdpcreatedest5b.png)

Agora você pode ver seu público personalizado aparecer no Facebook:

![RTCDP](./images/rtcdpcreatedest5a.png)

[レトルナル パラ フルクソ デ ウスアリオ 1](./uc1.md)

[レトルナル パラ トドス オス モドゥロス](../../overview.md)
