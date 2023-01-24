---
title: Bootcamp — 物理とデジタルの組み合わせ — ジャーニーのテスト — ブラジル
description: Bootcamp — 物理とデジタルの組み合わせ — ジャーニーのテスト — ブラジル
kt: 5342
audience: developer
doc-type: tutorial
activity: develop
source-git-commit: 75a878ba596078e6d013b65062606931402302dd
workflow-type: tm+mt
source-wordcount: '203'
ht-degree: 1%

---

# 3.4 ジャーニーのテスト

ジャーニーをテストするには、演習 3.2 で作成したイベントのイベント ID を使用する必要があります。この ID は次のようになります。

![ACOP](./images/payloadeventID.png)

イベント ID は、ジャーニーをトリガーするためにAdobe Experience Platformに送信する必要があるものです。 この例では、eventID は次のようになります。
`e76c0bf0c77c3517e5b6f4c457a0754ebaf5f1f6b9357d74e0d8e13ae517c3d5`.

モバイルアプリを開き、ホームページに移動します。 「**設定**」アイコンをクリックします。

![DSN](./images/appsett.png)

「 」フィールドに eventID を貼り付けます **ビーコンの EventID** をクリックし、 **保存**.

![DSN](./images/beacon1.png)

続行する前に、お使いのコンピューターでこの Web ページを開いてください： [https://bootcamp.aepdemo.net/content/aep-bootcamp-experience/language-masters/en/screen.html](https://bootcamp.aepdemo.net/content/aep-bootcamp-experience/language-masters/en/screen.html)

次の内容が表示されます。

![DSN](./images/screen1.png)

次に、ホームページに戻ります。 次をクリック： **ビーコン** アイコン

![DSN](./images/app23.png)

これが見えます まず、「 」を選択します。 **Bootcamp Screen Beacon** そして、 **エントリ** 」ボタンをクリックします。 これにより、ビーコンエントリをシミュレートできます。

![DSN](./images/app21.png)

次に、ストア内画面を見てみましょう。 最後に表示した製品が、5 秒以内に表示されます。

![DSN](./images/beacon3.png)

プッシュ通知も受け取りました。

![DSN](./images/beacon2.png)

これで、この練習が完了しました。

[ユーザーフローに戻る 3](./uc3.md)

[すべてのモジュールに戻る](../../overview.md)
