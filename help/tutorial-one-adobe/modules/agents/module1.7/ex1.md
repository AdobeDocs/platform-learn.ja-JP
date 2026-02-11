---
title: 開発環境のセットアップ
description: 開発環境のセットアップ
kt: 5342
doc-type: tutorial
exl-id: c9bfb327-362f-4475-89da-8e9788940d56
source-git-commit: 869992f4139e727d4ae4e8b767f14d73da524400
workflow-type: tm+mt
source-wordcount: '34'
ht-degree: 0%

---

# 1.7.1 開発環境のセットアップ

https://github.com/adobe/commerce-integration-starter-kit

`git clone https://github.com/adobe/commerce-integration-starter-kit`

`npm install -g npm@11.9.0`
`npm install -g @adobe/aio-cli`
`npm install @adobe/aio-commerce-sdk`

`aio plugins:install https://github.com/adobe-commerce/aio-cli-plugin-commerce @adobe/aio-cli-plugin-app-dev @adobe/aio-cli-plugin-runtime`

`aio commerce extensibility tools-setup`

`I would like to build an app that subscribes to order created events and sends them to a configurable URL with basic authentication`

次の手順：[-](./ex1.md){target="_blank"}

[Intelligent Developer Tools for Adobe Commerce](./aiassisteddev.md){target="_blank"} に戻る

[&#x200B; すべてのモジュールに戻る &#x200B;](./../../../overview.md){target="_blank"}
