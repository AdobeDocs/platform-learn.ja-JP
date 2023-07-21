---
title: Bootcamp -Customer Journey Analytics — インサイトからアクションまで
description: Bootcamp -Customer Journey Analytics — インサイトからアクションまで
jira: KT-5342
audience: Data Engineer, Data Architect, Data Analyst
doc-type: tutorial
activity: develop
solution: Customer Journey Analytics
feature-set: Customer Journey Analytics
feature: Audiences
exl-id: 7a38a0a4-46e4-41f2-9a75-316dfde7128f
source-git-commit: 3c86f9b19cecf92c9a324fb6fcfcefaebf82177f
workflow-type: tm+mt
source-wordcount: '409'
ht-degree: 0%

---

# 4.6 インサイトから行動へ

## 目標

- Customer Journey Analyticsで収集されたビューに基づいてオーディエンスを構築する方法を理解する
- Real-Time CDPとAdobe Journey Optimizerでこのオーディエンスを使用

## 4.6.1 オーディエンスの作成と公開

プロジェクトで、 **通話感情** また、は、コールセンターに対する呼び出しをおこなったユーザーの数を、 **陽性**. これで、これらのユーザーを使用してセグメントを作成し、ジャーニーまたは通信チャネルでそれらをアクティブ化できるようになります。

最初の手順は次のとおりです。最後の演習で作成したパネルで、線分を選択します。 **1. 通話感 — ポジティブ**&#x200B;をクリックし、右クリックして、 **選択からオーディエンスを作成** オプション：

![デモ](./images/aud1.png)

次に、モデルに従ってオーディエンスに名前を付けます **yourLastName - CJA オーディエンス呼び出しが肯定的に感じる**:

![デモ](./images/aud2.png)

作成中のオーディエンスのプレビューを表示できます。

![デモ](./images/aud3.png)

最後に、「 **公開**.

![デモ](./images/aud4.png)

## 4.6.2 セグメントの一部としてのオーディエンスの使用

Adobe Experience Platformに戻り、 **セグメント/参照** CJA で作成したセグメントを、アクティベーションやジャーニーで使用できる状態で表示できます。

![デモ](./images/aud5.png)

次に、このセグメントをFacebookのアクティベーションとカスタマージャーニーで使用します。

## 4.6.3 リアルタイムでのReal-Time CDPでのセグメントの使用

Adobe Experience Platformで、に移動します。 **セグメント/参照** CJA で作成したオーディエンスを見つけます。

![デモ](./images/aud6.png)

セグメントをクリックし、 **宛先に対してアクティブ化**:

![デモ](./images/aud7.png)

次の名前の宛先を選択 **bootcamp-facebook**&#x200B;をクリックし、 **次へ**.

![デモ](./images/aud8.png)

クリック **次へ** 再び

![デモ](./images/aud9.png)

を選択します。 **オーディエンスの起源** オプションを選択し、 **顧客から直接**&#x200B;をクリックし、 **次へ**.

![デモ](./images/aud10.png)

「**完了**」をクリックします。

![デモ](./images/aud11.png)

これで、セグメントがFacebook Custom Audiences に接続されました。 次に、Adobe Journey Optimizerで同じセグメントを使用します。

## 4.6.4 Adobe Journey Optimizerでのセグメントの使用

Adobe Experience Platformで、 **Journey Optimizer**&#x200B;をクリックし、左側のメニューで、 **ジャーニー** をクリックして、ジャーニーの作成を開始します。 **作成ジャーニー**.

![デモ](./images/aud20.png)

![デモ](./images/aud21.png)

![デモ](./images/aud22.png)

次に、左側のメニューで、 **イベント**&#x200B;を選択します。 **セグメントの選定** ジャーニーにドラッグします。

![デモ](./images/aud23.png)

セグメントで、 **編集** セグメントを選択するには：

![デモ](./images/aud24.png)

CJA で以前に作成したオーディエンスを選択し、「 」をクリックします。  **保存**.

![デモ](./images/aud25.png)

準備完了！ ここから、このセグメントの対象となる顧客のジャーニーを作成できます。

[ユーザーフローに戻る 4](./uc4.md)

[ボルタル・パラ・トドス・モドゥロス](./../../overview.md)
