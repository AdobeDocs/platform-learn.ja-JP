---
title: ソースの概要
description: アドビ、ファーストパーティおよびサードパーティ製のアプリケーションから、Platform のリアルタイム顧客プロファイルおよびデータレイクにデータを簡単に取り込む方法を説明します。
feature: Sources
role: Data Engineer, Data Architect, Developer
level: Beginner
jira: KT-3800
thumbnail: 29694.jpg
exl-id: e38d643a-27ea-49f4-87c4-eccdb860ea92
source-git-commit: 112e092df6d486d8b9103013bec57d820b8ae6d7
workflow-type: tm+mt
source-wordcount: '579'
ht-degree: 10%

---

# ソースの概要

Adobe Experience Platform インターフェイスでソース（ソースコネクタ）を使用する方法を説明します。 ソースは、Adobe、ファーストパーティおよびサードパーティのアプリケーションから Platform のリアルタイム顧客プロファイルおよびデータレイクにデータを取り込むための簡単に設定できる統合です。 詳しくは、[ ソースのドキュメント ](https://experienceleague.adobe.com/docs/experience-platform/sources/home.html?lang=ja) を参照してください。

>[!VIDEO](https://video.tv.adobe.com/v/29694?learn=on&enablevpops)

<!--should have a whole section for data prep-->

## 一般的なタイプのサードパーティ Adobe ソースからのデータの取り込み

<!-- CARDS
* ingest-data-from-crm.md
* ingest-data-from-cloud-storage.md
* ingest-data-from-databases.md
* streaming-ingestion-source-connector.md
* streaming-ingestion-http-api.md
-->
<!-- START CARDS HTML - DO NOT MODIFY BY HAND -->
<div class="columns">
    <div class="column is-half-tablet is-half-desktop is-one-third-widescreen" aria-label="Ingest Data using CRM Source Connectors">
        <div class="card" style="height: 100%; display: flex; flex-direction: column; height: 100%;">
            <div class="card-image">
                <figure class="image x-is-16by9">
                    <a href="ingest-data-from-crm.md" title="CRM Source コネクタを使用したデータの取り込み" target="_blank" rel="referrer">
                        <img class="is-bordered-r-small" src="https://video.tv.adobe.com/v/29711?format=jpeg&nocache=1740415500926" alt="CRM Source コネクタを使用したデータの取り込み"
                             style="width: 100%; aspect-ratio: 16 / 9; object-fit: cover; overflow: hidden; display: block; margin: auto;">
                    </a>
                </figure>
            </div>
            <div class="card-content is-padded-small" style="display: flex; flex-direction: column; flex-grow: 1; justify-content: space-between;">
                <div class="top-card-content">
                    <p class="headline is-size-6 has-text-weight-bold">
                        <a href="ingest-data-from-crm.md" target="_blank" rel="referrer" title="CRM Source コネクタを使用したデータの取り込み">CRM Source コネクタを使用したデータの取り込み </a>
                    </p>
                    <p class="is-size-6">CRM ソースからAdobe Experience Platformにリアルタイム顧客プロファイルとデータレイクをシームレスかつ簡単に一括で取り込む方法を説明します。</p>
                </div>
                <a href="ingest-data-from-crm.md" target="_blank" rel="referrer" class="spectrum-Button spectrum-Button--outline spectrum-Button--primary spectrum-Button--sizeM" style="align-self: flex-start; margin-top: 1rem;">
                    <span class="spectrum-Button-label has-no-wrap has-text-weight-bold"> 詳細情報 </span>
                </a>
            </div>
        </div>
    </div>
    <div class="column is-half-tablet is-half-desktop is-one-third-widescreen" aria-label="Ingest Data using Cloud Storage Source Connectors">
        <div class="card" style="height: 100%; display: flex; flex-direction: column; height: 100%;">
            <div class="card-image">
                <figure class="image x-is-16by9">
                    <a href="ingest-data-from-cloud-storage.md" title="クラウドストレージのSource コネクタを使用したデータの取り込み" target="_blank" rel="referrer">
                        <img class="is-bordered-r-small" src="https://video.tv.adobe.com/v/29695?format=jpeg&nocache=1740415500914" alt="クラウドストレージのSource コネクタを使用したデータの取り込み"
                             style="width: 100%; aspect-ratio: 16 / 9; object-fit: cover; overflow: hidden; display: block; margin: auto;">
                    </a>
                </figure>
            </div>
            <div class="card-content is-padded-small" style="display: flex; flex-direction: column; flex-grow: 1; justify-content: space-between;">
                <div class="top-card-content">
                    <p class="headline is-size-6 has-text-weight-bold">
                        <a href="ingest-data-from-cloud-storage.md" target="_blank" rel="referrer" title="クラウドストレージのSource コネクタを使用したデータの取り込み"> クラウドストレージのSource コネクタを使用したデータの取り込み </a>
                    </p>
                    <p class="is-size-6">このビデオでは、クラウドストレージサービスからAdobe Experience Platformのリアルタイム顧客プロファイルとデータレイクにデータをシームレスかつスケーラブルに簡単に一括で取り込む方法を示します。</p>
                </div>
                <a href="ingest-data-from-cloud-storage.md" target="_blank" rel="referrer" class="spectrum-Button spectrum-Button--outline spectrum-Button--primary spectrum-Button--sizeM" style="align-self: flex-start; margin-top: 1rem;">
                    <span class="spectrum-Button-label has-no-wrap has-text-weight-bold"> 詳細情報 </span>
                </a>
            </div>
        </div>
    </div>
    <div class="column is-half-tablet is-half-desktop is-one-third-widescreen" aria-label="Ingest data using a database source connector">
        <div class="card" style="height: 100%; display: flex; flex-direction: column; height: 100%;">
            <div class="card-image">
                <figure class="image x-is-16by9">
                    <a href="ingest-data-from-databases.md" title="データベースソースコネクタを使用したデータの取り込み" target="_blank" rel="referrer">
                        <img class="is-bordered-r-small" src="https://video.tv.adobe.com/v/329317?format=jpeg&nocache=1740415500936" alt="データベースソースコネクタを使用したデータの取り込み"
                             style="width: 100%; aspect-ratio: 16 / 9; object-fit: cover; overflow: hidden; display: block; margin: auto;">
                    </a>
                </figure>
            </div>
            <div class="card-content is-padded-small" style="display: flex; flex-direction: column; flex-grow: 1; justify-content: space-between;">
                <div class="top-card-content">
                    <p class="headline is-size-6 has-text-weight-bold">
                        <a href="ingest-data-from-databases.md" target="_blank" rel="referrer" title="データベースソースコネクタを使用したデータの取り込み"> データベースソースコネクタを使用したデータの取得 </a>
                    </p>
                    <p class="is-size-6">このビデオでは、データベースソースからAdobe Experience Platformのリアルタイム顧客プロファイルとエクスペリエンスデータレイクにデータをシームレスかつスケーラブルに一括で取り込む方法について説明します。</p>
                </div>
                <a href="ingest-data-from-databases.md" target="_blank" rel="referrer" class="spectrum-Button spectrum-Button--outline spectrum-Button--primary spectrum-Button--sizeM" style="align-self: flex-start; margin-top: 1rem;">
                    <span class="spectrum-Button-label has-no-wrap has-text-weight-bold"> 詳細情報 </span>
                </a>
            </div>
        </div>
    </div>
    <div class="column is-half-tablet is-half-desktop is-one-third-widescreen" aria-label="Stream data using Source Connectors">
        <div class="card" style="height: 100%; display: flex; flex-direction: column; height: 100%;">
            <div class="card-image">
                <figure class="image x-is-16by9">
                    <a href="streaming-ingestion-source-connector.md" title="Source コネクタを使用したデータのストリーミング" target="_blank" rel="referrer">
                        <img class="is-bordered-r-small" src="https://video.tv.adobe.com/v/331943?format=jpeg&nocache=1740415500903" alt="Source コネクタを使用したデータのストリーミング"
                             style="width: 100%; aspect-ratio: 16 / 9; object-fit: cover; overflow: hidden; display: block; margin: auto;">
                    </a>
                </figure>
            </div>
            <div class="card-content is-padded-small" style="display: flex; flex-direction: column; flex-grow: 1; justify-content: space-between;">
                <div class="top-card-content">
                    <p class="headline is-size-6 has-text-weight-bold">
                        <a href="streaming-ingestion-source-connector.md" target="_blank" rel="referrer" title="Source コネクタを使用したデータのストリーミング">ソースコネクタを使用したデータのストリーミング</a>
                    </p>
                    <p class="is-size-6">クラウドストレージソースから Platform にデータをリアルタイムでストリーミングし、そのデータをリアルタイムで顧客エンゲージメントに使用する方法を説明します。</p>
                </div>
                <a href="streaming-ingestion-source-connector.md" target="_blank" rel="referrer" class="spectrum-Button spectrum-Button--outline spectrum-Button--primary spectrum-Button--sizeM" style="align-self: flex-start; margin-top: 1rem;">
                    <span class="spectrum-Button-label has-no-wrap has-text-weight-bold"> 詳細情報 </span>
                </a>
            </div>
        </div>
    </div>
    <div class="column is-half-tablet is-half-desktop is-one-third-widescreen" aria-label="Ingest Data using Streaming Connection HTTP API endpoint">
        <div class="card" style="height: 100%; display: flex; flex-direction: column; height: 100%;">
            <div class="card-image">
                <figure class="image x-is-16by9">
                    <a href="streaming-ingestion-http-api.md" title="ストリーミング接続 HTTP API エンドポイントを使用したデータの取り込み" target="_blank" rel="referrer">
                        <img class="is-bordered-r-small" src="https://video.tv.adobe.com/v/331028?format=jpeg&nocache=1740415500889" alt="ストリーミング接続 HTTP API エンドポイントを使用したデータの取り込み"
                             style="width: 100%; aspect-ratio: 16 / 9; object-fit: cover; overflow: hidden; display: block; margin: auto;">
                    </a>
                </figure>
            </div>
            <div class="card-content is-padded-small" style="display: flex; flex-direction: column; flex-grow: 1; justify-content: space-between;">
                <div class="top-card-content">
                    <p class="headline is-size-6 has-text-weight-bold">
                        <a href="streaming-ingestion-http-api.md" target="_blank" rel="referrer" title="ストリーミング接続 HTTP API エンドポイントを使用したデータの取り込み"> ストリーミング接続 HTTP API エンドポイントを使用したデータの取得 </a>
                    </p>
                    <p class="is-size-6">このビデオでは、HTTP API エンドポイントを使用してリアルタイムでデータを Adobe Experience Platform にストリーミングする方法を示します。</p>
                </div>
                <a href="streaming-ingestion-http-api.md" target="_blank" rel="referrer" class="spectrum-Button spectrum-Button--outline spectrum-Button--primary spectrum-Button--sizeM" style="align-self: flex-start; margin-top: 1rem;">
                    <span class="spectrum-Button-label has-no-wrap has-text-weight-bold"> 詳細情報 </span>
                </a>
            </div>
        </div>
    </div>
</div>
<!-- END CARDS HTML - DO NOT MODIFY BY HAND -->

## Adobe ソースからのデータの取り込み

<!-- CARDS
* ingest-data-from-adobe-analytics.md
* ingest-data-from-marketo.md
* ingest-data-from-aam.md
-->
<!-- START CARDS HTML - DO NOT MODIFY BY HAND -->
<div class="columns">
    <div class="column is-half-tablet is-half-desktop is-one-third-widescreen" aria-label="Ingest data using the Adobe Analytics source connector">
        <div class="card" style="height: 100%; display: flex; flex-direction: column; height: 100%;">
            <div class="card-image">
                <figure class="image x-is-16by9">
                    <a href="ingest-data-from-adobe-analytics.md" title="Adobe Analytics ソースコネクタを使用したデータの取り込み" target="_blank" rel="referrer">
                        <img class="is-bordered-r-small" src="https://video.tv.adobe.com/v/29687?format=jpeg&nocache=1740415502122" alt="Adobe Analytics ソースコネクタを使用したデータの取り込み"
                             style="width: 100%; aspect-ratio: 16 / 9; object-fit: cover; overflow: hidden; display: block; margin: auto;">
                    </a>
                </figure>
            </div>
            <div class="card-content is-padded-small" style="display: flex; flex-direction: column; flex-grow: 1; justify-content: space-between;">
                <div class="top-card-content">
                    <p class="headline is-size-6 has-text-weight-bold">
                        <a href="ingest-data-from-adobe-analytics.md" target="_blank" rel="referrer" title="Adobe Analytics ソースコネクタを使用したデータの取り込み">Adobe Analytics ソースコネクタを使用したデータの取り込み</a>
                    </p>
                    <p class="is-size-6">Adobe Analytics Source コネクタを使用すると、Adobe AnalyticsからAdobe Experience Platformにデータを簡単にストリーミング、マッピングおよびフィルタリングでき、リアルタイム顧客プロファイルとエクスペリエンスデータレイクを使用できます。</p>
                </div>
                <a href="ingest-data-from-adobe-analytics.md" target="_blank" rel="referrer" class="spectrum-Button spectrum-Button--outline spectrum-Button--primary spectrum-Button--sizeM" style="align-self: flex-start; margin-top: 1rem;">
                    <span class="spectrum-Button-label has-no-wrap has-text-weight-bold"> 詳細情報 </span>
                </a>
            </div>
        </div>
    </div>
    <div class="column is-half-tablet is-half-desktop is-one-third-widescreen" aria-label="Ingest data from Marketo Engage">
        <div class="card" style="height: 100%; display: flex; flex-direction: column; height: 100%;">
            <div class="card-image">
                <figure class="image x-is-16by9">
                    <a href="ingest-data-from-marketo.md" title="Marketo Engageからのデータの取り込み" target="_blank" rel="referrer">
                        <img class="is-bordered-r-small" src="https://video.tv.adobe.com/v/3419550?format=jpeg&nocache=1740415502109" alt="Marketo Engageからのデータの取り込み"
                             style="width: 100%; aspect-ratio: 16 / 9; object-fit: cover; overflow: hidden; display: block; margin: auto;">
                    </a>
                </figure>
            </div>
            <div class="card-content is-padded-small" style="display: flex; flex-direction: column; flex-grow: 1; justify-content: space-between;">
                <div class="top-card-content">
                    <p class="headline is-size-6 has-text-weight-bold">
                        <a href="ingest-data-from-marketo.md" target="_blank" rel="referrer" title="Marketo Engageからのデータの取り込み">Marketo Engage からデータを取り込む</a>
                    </p>
                    <p class="is-size-6">標準ワークフローとテンプレートワークフローで、ソースコネクタを使用してMarketo Engageからデータを取り込む方法を説明します。</p>
                </div>
                <a href="ingest-data-from-marketo.md" target="_blank" rel="referrer" class="spectrum-Button spectrum-Button--outline spectrum-Button--primary spectrum-Button--sizeM" style="align-self: flex-start; margin-top: 1rem;">
                    <span class="spectrum-Button-label has-no-wrap has-text-weight-bold"> 詳細情報 </span>
                </a>
            </div>
        </div>
    </div>
    <div class="column is-half-tablet is-half-desktop is-one-third-widescreen" aria-label="Ingest data using the Adobe Audience Manager data connector">
        <div class="card" style="height: 100%; display: flex; flex-direction: column; height: 100%;">
            <div class="card-image">
                <figure class="image x-is-16by9">
                    <a href="ingest-data-from-aam.md" title="Adobe Audience Manager コネクタを使用したデータの取り込み" target="_blank" rel="referrer">
                        <img class="is-bordered-r-small" src="https://video.tv.adobe.com/v/331214/?format=jpeg&nocache=1740415502093" alt="Adobe Audience Manager コネクタを使用したデータの取り込み"
                             style="width: 100%; aspect-ratio: 16 / 9; object-fit: cover; overflow: hidden; display: block; margin: auto;">
                    </a>
                </figure>
            </div>
            <div class="card-content is-padded-small" style="display: flex; flex-direction: column; flex-grow: 1; justify-content: space-between;">
                <div class="top-card-content">
                    <p class="headline is-size-6 has-text-weight-bold">
                        <a href="ingest-data-from-aam.md" target="_blank" rel="referrer" title="Adobe Audience Manager コネクタを使用したデータの取り込み">Adobe Audience Manager コネクタを使用したデータの取り込み </a>
                    </p>
                    <p class="is-size-6">Audience Manager データコネクタを使用して、AAMの特性とセグメントを Platform に取り込み、他のリッチデータと組み合わせる方法を説明します。</p>
                </div>
                <a href="ingest-data-from-aam.md" target="_blank" rel="referrer" class="spectrum-Button spectrum-Button--outline spectrum-Button--primary spectrum-Button--sizeM" style="align-self: flex-start; margin-top: 1rem;">
                    <span class="spectrum-Button-label has-no-wrap has-text-weight-bold"> 詳細情報 </span>
                </a>
            </div>
        </div>
    </div>
</div>
<!-- END CARDS HTML - DO NOT MODIFY BY HAND -->

## トラブルシューティング

<!-- CARDS
* troubleshoot-sftp-connector.md
-->
<!-- START CARDS HTML - DO NOT MODIFY BY HAND -->
<div class="columns">
    <div class="column is-half-tablet is-half-desktop is-one-third-widescreen" aria-label="Troubleshoot - Unable to connect to SFTP source connector">
        <div class="card" style="height: 100%; display: flex; flex-direction: column; height: 100%;">
            <div class="card-image">
                <figure class="image x-is-16by9">
                    <a href="troubleshoot-sftp-connector.md" title="トラブルシューティング - SFTP ソースコネクタに接続できない" target="_blank" rel="referrer">
                        <img class="is-bordered-r-small" src="https://video.tv.adobe.com/v/3416134?format=jpeg&nocache=1740415502267" alt="トラブルシューティング - SFTP ソースコネクタに接続できない"
                             style="width: 100%; aspect-ratio: 16 / 9; object-fit: cover; overflow: hidden; display: block; margin: auto;">
                    </a>
                </figure>
            </div>
            <div class="card-content is-padded-small" style="display: flex; flex-direction: column; flex-grow: 1; justify-content: space-between;">
                <div class="top-card-content">
                    <p class="headline is-size-6 has-text-weight-bold">
                        <a href="troubleshoot-sftp-connector.md" target="_blank" rel="referrer" title="トラブルシューティング - SFTP ソースコネクタに接続できない"> トラブルシューティング - SFTP ソースコネクタに接続できない </a>
                    </p>
                    <p class="is-size-6">SFTP ソースコネクタの接続の問題を回避するためのベストプラクティスについて説明します。 特定のチェックポイントを確認して、SFTP サーバーをAdobe Experience Platformに正常に接続します。</p>
                </div>
                <a href="troubleshoot-sftp-connector.md" target="_blank" rel="referrer" class="spectrum-Button spectrum-Button--outline spectrum-Button--primary spectrum-Button--sizeM" style="align-self: flex-start; margin-top: 1rem;">
                    <span class="spectrum-Button-label has-no-wrap has-text-weight-bold"> 詳細情報 </span>
                </a>
            </div>
        </div>
    </div>
</div>
<!-- END CARDS HTML - DO NOT MODIFY BY HAND -->

