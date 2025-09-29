---
title: クエリサービスとデータDistillerの概要
description: Adobe Experience Platform クエリサービスを使用すると、SQL を使用して、データレイクに保存されたカスタマーエクスペリエンスデータを調査、検証、変換できます。また、データ出力やスケジュールなどの強化機能は、Data Distiller アドオンから利用できます。 このビデオでは、主な機能の概要を説明します。これにより、ユーザーは、様々な Platform ベースのアプリケーションでクエリサービスを活用する方法を理解できるようになります。
feature: Queries
role: Data Engineer, Developer
level: Beginner
jira: KT-3139
last-substantial-update: 2025-06-23T00:00:00Z
exl-id: 988bc316-9eec-4dca-8049-95c2d613379d
source-git-commit: c21e15b0cac5e97cf2234a951b54d5a66aff9810
workflow-type: tm+mt
source-wordcount: '467'
ht-degree: 10%

---

# クエリサービスとデータDistillerの概要

Adobe Experience Platform クエリサービスを使用すると、SQL を使用して、データレイクに保存されたカスタマーエクスペリエンスデータを調査、検証、変換できます。また、データ出力やスケジュールなどの強化機能は、Data Distiller アドオンから利用できます。 このビデオでは、主な機能の概要を説明します。これにより、ユーザーは、様々な Platform ベースのアプリケーションでクエリサービスを活用する方法を理解できるようになります。 詳しくは、[ クエリサービスのドキュメント ](https://experienceleague.adobe.com/ja/docs/experience-platform/query/home) を参照してください。

>[!VIDEO](https://video.tv.adobe.com/v/35089?learn=on&enablevpops&captions=jpn)

## 基本的な使用方法

<!-- CARDS
* run-queries.md
* explore-data.md
* prepare-data.md

-->
<!-- START CARDS HTML - DO NOT MODIFY BY HAND -->
<div class="columns">
    <div class="column is-half-tablet is-half-desktop is-one-third-widescreen" aria-label="Run Queries with Query Service">
        <div class="card" style="height: 100%; display: flex; flex-direction: column; height: 100%;">
            <div class="card-image">
                <figure class="image x-is-16by9">
                    <a href="run-queries.md" title="クエリサービスでのクエリの実行" target="_blank" rel="referrer">
                        <img class="is-bordered-r-small" src="https://video.tv.adobe.com/v/34782?format=jpeg&nocache=1759180596408&captions=jpn" alt="クエリサービスでのクエリの実行"
                             style="width: 100%; aspect-ratio: 16 / 9; object-fit: cover; overflow: hidden; display: block; margin: auto;">
                    </a>
                </figure>
            </div>
            <div class="card-content is-padded-small" style="display: flex; flex-direction: column; flex-grow: 1; justify-content: space-between;">
                <div class="top-card-content">
                    <p class="headline is-size-6 has-text-weight-bold">
                        <a href="run-queries.md" target="_blank" rel="referrer" title="クエリサービスでのクエリの実行"> クエリサービスでのクエリの実行 </a>
                    </p>
                    <p class="is-size-6">Adobe Experience Platform クエリエディターを使用して、SQL クエリを効率的に作成、実行、管理する方法について説明します。 ビューアでは、オブジェクトブラウザー、オートコンプリート、パラメーター化されたクエリ、スケジュールツールなどの機能を使用して、データワークフローを合理化し、組織全体で実用的なインサイトを生成する方法を説明します。</p>
                </div>
                <a href="run-queries.md" target="_blank" rel="referrer" class="spectrum-Button spectrum-Button--outline spectrum-Button--primary spectrum-Button--sizeM" style="align-self: flex-start; margin-top: 1rem;">
                    <span class="spectrum-Button-label has-no-wrap has-text-weight-bold">詳細情報</span>
                </a>
            </div>
        </div>
    </div>
    <div class="column is-half-tablet is-half-desktop is-one-third-widescreen" aria-label="Validate data with Query Service">
        <div class="card" style="height: 100%; display: flex; flex-direction: column; height: 100%;">
            <div class="card-image">
                <figure class="image x-is-16by9">
                    <a href="explore-data.md" title="クエリサービスでデータを検証" target="_blank" rel="referrer">
                        <img class="is-bordered-r-small" src="https://video.tv.adobe.com/v/3414057?format=jpeg&nocache=1759180596397&captions=jpn" alt="クエリサービスでデータを検証"
                             style="width: 100%; aspect-ratio: 16 / 9; object-fit: cover; overflow: hidden; display: block; margin: auto;">
                    </a>
                </figure>
            </div>
            <div class="card-content is-padded-small" style="display: flex; flex-direction: column; flex-grow: 1; justify-content: space-between;">
                <div class="top-card-content">
                    <p class="headline is-size-6 has-text-weight-bold">
                        <a href="explore-data.md" target="_blank" rel="referrer" title="クエリサービスでデータを検証"> クエリサービスによるデータの検証 </a>
                    </p>
                    <p class="is-size-6">SQL 関数を使用して取り込んだデータを検証する方法を説明します。</p>
                </div>
                <a href="explore-data.md" target="_blank" rel="referrer" class="spectrum-Button spectrum-Button--outline spectrum-Button--primary spectrum-Button--sizeM" style="align-self: flex-start; margin-top: 1rem;">
                    <span class="spectrum-Button-label has-no-wrap has-text-weight-bold">詳細情報</span>
                </a>
            </div>
        </div>
    </div>
    <div class="column is-half-tablet is-half-desktop is-one-third-widescreen" aria-label="Derive data with Data Distiller">
        <div class="card" style="height: 100%; display: flex; flex-direction: column; height: 100%;">
            <div class="card-image">
                <figure class="image x-is-16by9">
                    <a href="prepare-data.md" title="Data Distillerを使用したデータの取得" target="_blank" rel="referrer">
                        <img class="is-bordered-r-small" src="https://video.tv.adobe.com/v/3414069?format=jpeg&nocache=1759180596403&captions=jpn" alt="Data Distillerを使用したデータの取得"
                             style="width: 100%; aspect-ratio: 16 / 9; object-fit: cover; overflow: hidden; display: block; margin: auto;">
                    </a>
                </figure>
            </div>
            <div class="card-content is-padded-small" style="display: flex; flex-direction: column; flex-grow: 1; justify-content: space-between;">
                <div class="top-card-content">
                    <p class="headline is-size-6 has-text-weight-bold">
                        <a href="prepare-data.md" target="_blank" rel="referrer" title="Data Distillerを使用したデータの取得">Data Distillerを使用したデータの取得 </a>
                    </p>
                    <p class="is-size-6">データエンジニアがクエリサービスを使用してデータを変換し、新しいデータセットを出力する方法について説明します。 これらのクエリをスケジュールに従って実行し、自動ダッシュボードとセグメント化を強化します。</p>
                </div>
                <a href="prepare-data.md" target="_blank" rel="referrer" class="spectrum-Button spectrum-Button--outline spectrum-Button--primary spectrum-Button--sizeM" style="align-self: flex-start; margin-top: 1rem;">
                    <span class="spectrum-Button-label has-no-wrap has-text-weight-bold">詳細情報</span>
                </a>
            </div>
        </div>
    </div>
</div>
<!-- END CARDS HTML - DO NOT MODIFY BY HAND -->


## 外部ツールでのデータビジュアライゼーション

<!-- CARDS
* psql-client-tableau.md
* analyze-and-visualize.md
* recharge-your-customer-data.md
-->
<!-- START CARDS HTML - DO NOT MODIFY BY HAND -->
<div class="columns">
    <div class="column is-half-tablet is-half-desktop is-one-third-widescreen" aria-label="Connect Tableau to Query Service">
        <div class="card" style="height: 100%; display: flex; flex-direction: column; height: 100%;">
            <div class="card-image">
                <figure class="image x-is-16by9">
                    <a href="psql-client-tableau.md" title="Tableau のクエリサービスへの接続" target="_blank" rel="referrer">
                        <img class="is-bordered-r-small" src="https://video.tv.adobe.com/v/3414045?format=jpeg&nocache=1759180596876&captions=jpn" alt="Tableau のクエリサービスへの接続"
                             style="width: 100%; aspect-ratio: 16 / 9; object-fit: cover; overflow: hidden; display: block; margin: auto;">
                    </a>
                </figure>
            </div>
            <div class="card-content is-padded-small" style="display: flex; flex-direction: column; flex-grow: 1; justify-content: space-between;">
                <div class="top-card-content">
                    <p class="headline is-size-6 has-text-weight-bold">
                        <a href="psql-client-tableau.md" target="_blank" rel="referrer" title="Tableau のクエリサービスへの接続">Tableau のクエリーサービスへの接続</a>
                    </p>
                    <p class="is-size-6">PostgreSQL プロトコルをサポートする様々なデスクトップクライアントアプリケーションからクエリサービスに接続する方法と、PostgreSQL ツールとドライバーを使用してクエリを接続し、書き込む方法について説明します。</p>
                </div>
                <a href="psql-client-tableau.md" target="_blank" rel="referrer" class="spectrum-Button spectrum-Button--outline spectrum-Button--primary spectrum-Button--sizeM" style="align-self: flex-start; margin-top: 1rem;">
                    <span class="spectrum-Button-label has-no-wrap has-text-weight-bold">詳細情報</span>
                </a>
            </div>
        </div>
    </div>
    <div class="column is-half-tablet is-half-desktop is-one-third-widescreen" aria-label="Analyze and visualize omni-channel insights in Tableau using Query Service">
        <div class="card" style="height: 100%; display: flex; flex-direction: column; height: 100%;">
            <div class="card-image">
                <figure class="image x-is-16by9">
                    <a href="analyze-and-visualize.md" title="Tableau でのクエリサービスを使用したオムニチャネルインサイトの分析と視覚化" target="_blank" rel="referrer">
                        <img class="is-bordered-r-small" src="https://video.tv.adobe.com/v/342115?format=jpeg&nocache=1759180596850" alt="Tableau でのクエリサービスを使用したオムニチャネルインサイトの分析と視覚化"
                             style="width: 100%; aspect-ratio: 16 / 9; object-fit: cover; overflow: hidden; display: block; margin: auto;">
                    </a>
                </figure>
            </div>
            <div class="card-content is-padded-small" style="display: flex; flex-direction: column; flex-grow: 1; justify-content: space-between;">
                <div class="top-card-content">
                    <p class="headline is-size-6 has-text-weight-bold">
                        <a href="analyze-and-visualize.md" target="_blank" rel="referrer" title="Tableau でのクエリサービスを使用したオムニチャネルインサイトの分析と視覚化">Tableau でのクエリサービスを使用したオムニチャネルインサイトの分析と視覚化</a>
                    </p>
                    <p class="is-size-6">チャーン分析の例を使用して、Adobe Experience Platform のクエリサービスを外部データビジュアライゼーションツールで使用する方法を説明します。</p>
                </div>
                <a href="analyze-and-visualize.md" target="_blank" rel="referrer" class="spectrum-Button spectrum-Button--outline spectrum-Button--primary spectrum-Button--sizeM" style="align-self: flex-start; margin-top: 1rem;">
                    <span class="spectrum-Button-label has-no-wrap has-text-weight-bold">詳細情報</span>
                </a>
            </div>
        </div>
    </div>
    <div class="column is-half-tablet is-half-desktop is-one-third-widescreen" aria-label="Recharge your customer data to deliver electrifying experiences">
        <div class="card" style="height: 100%; display: flex; flex-direction: column; height: 100%;">
            <div class="card-image">
                <figure class="image x-is-16by9">
                    <a href="recharge-your-customer-data.md" title="顧客データを再充電して、魅力的なエクスペリエンスを提供します" target="_blank" rel="referrer">
                        <img class="is-bordered-r-small" src="https://video.tv.adobe.com/v/3454936?format=jpeg&nocache=1759180596865&captions=jpn" alt="顧客データを再充電して、魅力的なエクスペリエンスを提供します"
                             style="width: 100%; aspect-ratio: 16 / 9; object-fit: cover; overflow: hidden; display: block; margin: auto;">
                    </a>
                </figure>
            </div>
            <div class="card-content is-padded-small" style="display: flex; flex-direction: column; flex-grow: 1; justify-content: space-between;">
                <div class="top-card-content">
                    <p class="headline is-size-6 has-text-weight-bold">
                        <a href="recharge-your-customer-data.md" target="_blank" rel="referrer" title="顧客データを再充電して、魅力的なエクスペリエンスを提供します"> 顧客データを再充電して、魅力的なエクスペリエンスを提供する </a>
                    </p>
                    <p class="is-size-6">多数のユースケースに同じデータを使用することで、低品質データの影響を軽減し、価値創出までの時間を短縮し、ROI を向上させる方法を説明します。</p>
                </div>
                <a href="recharge-your-customer-data.md" target="_blank" rel="referrer" class="spectrum-Button spectrum-Button--outline spectrum-Button--primary spectrum-Button--sizeM" style="align-self: flex-start; margin-top: 1rem;">
                    <span class="spectrum-Button-label has-no-wrap has-text-weight-bold">詳細情報</span>
                </a>
            </div>
        </div>
    </div>
</div>
<!-- END CARDS HTML - DO NOT MODIFY BY HAND -->
