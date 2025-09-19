---
title: ACCS をAEM Assets CS に接続する
description: ACCS をAEM Assets CS に接続する
kt: 5342
doc-type: tutorial
source-git-commit: 16229700449660a085549a37013e015a5e20ba9e
workflow-type: tm+mt
source-wordcount: '166'
ht-degree: 0%

---

# 1.5.3 ACCS をAEM Assets CS に接続する

>[!IMPORTANT]
>
>この演習を完了するには、EDS 環境を使用して動作するAEM SitesとAssets CS にアクセスできる必要があります。
>
>そのような環境がまだない場合は、[Adobe Experience Manager、Cloud Service、Edge Delivery Services](./../../../modules/asset-mgmt/module2.1/aemcs.md){target="_blank"} の演習に進んでください。 指示に従うと、そのような環境にアクセスできます。

>[!IMPORTANT]
>
>以前、AEM CS プログラムをAEM SitesとAssets CS 環境で設定したことがある場合は、AEM CS サンドボックスが休止状態になっている可能性があります。 このようなサンドボックスの休止解除には 10～15 分かかるので、後で待つ必要がないように、今すぐ休止解除プロセスを開始することをお勧めします。

![ACCS+AEM Assets](./images/accsaemassets1.png)


## config.json の 1.5.3.4 更新

6 行目の `"ac-environment-id":XXX` の下に次のコードスニペットを追加します。

```json
 "commerce-assets-enabled": "true",
```



次の手順：[ 概要とメリット ](./summary.md){target="_blank"}

[Adobe Commerce as a Cloud Service](./accs.md){target="_blank"} に戻る

[ すべてのモジュールに戻る ](./../../../overview.md){target="_blank"}
