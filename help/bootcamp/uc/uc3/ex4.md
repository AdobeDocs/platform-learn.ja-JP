---
title: Bootcamp – 物理的なコンテンツとデジタルなコンテンツを融合 – ジャーニーのテスト
description: Bootcamp – 物理的なコンテンツとデジタルなコンテンツを融合 – ジャーニーのテスト
jira: KT-5342
audience: developer
doc-type: tutorial
activity: develop
solution: Journey Optimizer
feature-set: Journey Optimizer
feature: Events
exl-id: 45c77177-9ea9-4c3d-a40e-c04a747938eb
source-git-commit: 3c86f9b19cecf92c9a324fb6fcfcefaebf82177f
workflow-type: tm+mt
source-wordcount: '193'
ht-degree: 0%

---

# 3.4 ジャーニーのテスト

ジャーニーをテストするには、演習 3.2 で作成したイベントのイベント ID を使用する必要があります（以下を参照）。

![ACOP](./images/payloadeventID.png)

イベント ID は、ジャーニーをトリガーにするためにAdobe Experience Platformに送信する必要があるものです。 この例では、eventID は次のようになります。
`e76c0bf0c77c3517e5b6f4c457a0754ebaf5f1f6b9357d74e0d8e13ae517c3d5`。

モバイルアプリを開き、ホームページに移動します。 **設定** アイコンをクリックします。

![DSN](./images/appsett.png)

eventID を「**ビーコン EventID**」フィールドに貼り付けて、「保存 **をクリックし** す。

![DSN](./images/beacon1.png)

続行する前に、コンピューターでこの Web ページを開いてください：[https://bootcamp.aepdemo.net/content/aep-bootcamp-experience/language-masters/en/screen.html](https://bootcamp.aepdemo.net/content/aep-bootcamp-experience/language-masters/en/screen.html)

次の画面が表示されます。

![DSN](./images/screen1.png)

次に、ホームページに戻ります。 **ビーコン** アイコンをクリックします。

![DSN](./images/app23.png)

その後、これが表示されます。 最初に **Bootcamp スクリーンビーコン** を選択し、次に **エントリ** ボタンをクリックします。 これにより、ビーコンエントリをシミュレートできます。

![DSN](./images/app21.png)

次に、店舗の画面を見てみましょう。 最後に表示した製品が 5 秒以内にそこに表示されます。

![DSN](./images/beacon3.png)

また、プッシュ通知も届いています。

![DSN](./images/beacon2.png)

これで、この演習が完了しました。

[ユーザーフロー 3 に戻る](./uc3.md)

[すべてのモジュールに戻る](../../overview.md)
