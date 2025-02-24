---
title: リアルタイム顧客プロファイルについて
description: このビデオでは、Adobe Experience Platform がリアルタイム顧客プロファイルをアセンブルおよび更新する方法、およびこれらのプロファイルにアクセスして使用する方法を説明します。
feature: Profiles
role: Data Engineer, Data Architect, Developer
level: Beginner
jira: KT-2701
thumbnail: 27251.jpg
exl-id: 6ef5b589-f874-4687-bee3-9650c993f383
source-git-commit: 112e092df6d486d8b9103013bec57d820b8ae6d7
workflow-type: tm+mt
source-wordcount: '476'
ht-degree: 13%

---

# リアルタイム顧客プロファイルの概要

このビデオでは、Adobe Experience Platformがリアルタイム顧客プロファイルを構築および更新する方法と、それらのプロファイルにアクセスして使用する方法について説明します。 詳しくは、[ リアルタイム顧客プロファイルのドキュメント ](https://experienceleague.adobe.com/docs/experience-platform/profile/home.html?lang=ja) を参照してください。

>[!VIDEO](https://video.tv.adobe.com/v/27251?learn=on&enablevpops)

## アーキテクチャと機能

<!-- CARDS
* overview-diagram.md
* create-merge-policies.md
* union-schemas-overview.md
* create-a-computed-attribute-for-sum-of-purchases.md
-->
<!-- START CARDS HTML - DO NOT MODIFY BY HAND -->
<div class="columns">
    <div class="column is-half-tablet is-half-desktop is-one-third-widescreen" aria-label="Overview Diagram of Real-Time Customer Profile">
        <div class="card" style="height: 100%; display: flex; flex-direction: column; height: 100%;">
            <div class="card-image">
                <figure class="image x-is-16by9">
                    <a href="overview-diagram.md" title="リアルタイム顧客プロファイルの概要図" target="_blank" rel="referrer">
                        <img class="is-bordered-r-small" src="https://video.tv.adobe.com/v/33600?format=jpeg&nocache=1740415066741" alt="リアルタイム顧客プロファイルの概要図"
                             style="width: 100%; aspect-ratio: 16 / 9; object-fit: cover; overflow: hidden; display: block; margin: auto;">
                    </a>
                </figure>
            </div>
            <div class="card-content is-padded-small" style="display: flex; flex-direction: column; flex-grow: 1; justify-content: space-between;">
                <div class="top-card-content">
                    <p class="headline is-size-6 has-text-weight-bold">
                        <a href="overview-diagram.md" target="_blank" rel="referrer" title="リアルタイム顧客プロファイルの概要図"> リアルタイム顧客プロファイルの概要図 </a>
                    </p>
                    <p class="is-size-6">このビデオでは、Adobe Experience Platformのリアルタイム顧客プロファイル機能を示す概要図について説明します。</p>
                </div>
                <a href="overview-diagram.md" target="_blank" rel="referrer" class="spectrum-Button spectrum-Button--outline spectrum-Button--primary spectrum-Button--sizeM" style="align-self: flex-start; margin-top: 1rem;">
                    <span class="spectrum-Button-label has-no-wrap has-text-weight-bold"> 詳細情報 </span>
                </a>
            </div>
        </div>
    </div>
    <div class="column is-half-tablet is-half-desktop is-one-third-widescreen" aria-label="Create merge policies">
        <div class="card" style="height: 100%; display: flex; flex-direction: column; height: 100%;">
            <div class="card-image">
                <figure class="image x-is-16by9">
                    <a href="create-merge-policies.md" title="結合ポリシーの作成" target="_blank" rel="referrer">
                        <img class="is-bordered-r-small" src="https://video.tv.adobe.com/v/330433?format=jpeg&nocache=1740415066765" alt="結合ポリシーの作成"
                             style="width: 100%; aspect-ratio: 16 / 9; object-fit: cover; overflow: hidden; display: block; margin: auto;">
                    </a>
                </figure>
            </div>
            <div class="card-content is-padded-small" style="display: flex; flex-direction: column; flex-grow: 1; justify-content: space-between;">
                <div class="top-card-content">
                    <p class="headline is-size-6 has-text-weight-bold">
                        <a href="create-merge-policies.md" target="_blank" rel="referrer" title="結合ポリシーの作成"> 結合ポリシーの作成 </a>
                    </p>
                    <p class="is-size-6">このビデオでは、Adobe Experience Platformで結合ポリシーを作成する方法を説明します。 結合ポリシーは、顧客プロファイルを作成するために異なるソースのデータセットを組み合わせる際に、どのデータを使用し、優先順位を付けるかを決定するために Platform で使用されるルールです。</p>
                </div>
                <a href="create-merge-policies.md" target="_blank" rel="referrer" class="spectrum-Button spectrum-Button--outline spectrum-Button--primary spectrum-Button--sizeM" style="align-self: flex-start; margin-top: 1rem;">
                    <span class="spectrum-Button-label has-no-wrap has-text-weight-bold"> 詳細情報 </span>
                </a>
            </div>
        </div>
    </div>
    <div class="column is-half-tablet is-half-desktop is-one-third-widescreen" aria-label="Union schemas overview">
        <div class="card" style="height: 100%; display: flex; flex-direction: column; height: 100%;">
            <div class="card-image">
                <figure class="image x-is-16by9">
                    <a href="union-schemas-overview.md" title="結合スキーマの概要" target="_blank" rel="referrer">
                        <img class="is-bordered-r-small" src="https://video.tv.adobe.com/v/329940?format=jpeg&nocache=1740415066755" alt="結合スキーマの概要"
                             style="width: 100%; aspect-ratio: 16 / 9; object-fit: cover; overflow: hidden; display: block; margin: auto;">
                    </a>
                </figure>
            </div>
            <div class="card-content is-padded-small" style="display: flex; flex-direction: column; flex-grow: 1; justify-content: space-between;">
                <div class="top-card-content">
                    <p class="headline is-size-6 has-text-weight-bold">
                        <a href="union-schemas-overview.md" target="_blank" rel="referrer" title="結合スキーマの概要">和集合スキーマの概要</a>
                    </p>
                    <p class="is-size-6">リアルタイム顧客プロファイルは、カスタマージャーニーの各フェーズを通じて、クロスチャネルパーソナライゼーションを大規模に強化します。 スキーマと対応するデータセットの両方を有効にすることで、リアルタイム顧客プロファイルに対してバッチデータまたはストリーミングデータを有効にできます。</p>
                </div>
                <a href="union-schemas-overview.md" target="_blank" rel="referrer" class="spectrum-Button spectrum-Button--outline spectrum-Button--primary spectrum-Button--sizeM" style="align-self: flex-start; margin-top: 1rem;">
                    <span class="spectrum-Button-label has-no-wrap has-text-weight-bold"> 詳細情報 </span>
                </a>
            </div>
        </div>
    </div>
    <div class="column is-half-tablet is-half-desktop is-one-third-widescreen" aria-label="Create a computed attribute for the sum of purchases">
        <div class="card" style="height: 100%; display: flex; flex-direction: column; height: 100%;">
            <div class="card-image">
                <figure class="image x-is-16by9">
                    <a href="create-a-computed-attribute-for-sum-of-purchases.md" title="購入合計の計算属性を作成" target="_blank" rel="referrer">
                        <img class="is-bordered-r-small" src="https://video.tv.adobe.com/v/3425899?format=jpeg&nocache=1740415066775" alt="購入合計の計算属性を作成"
                             style="width: 100%; aspect-ratio: 16 / 9; object-fit: cover; overflow: hidden; display: block; margin: auto;">
                    </a>
                </figure>
            </div>
            <div class="card-content is-padded-small" style="display: flex; flex-direction: column; flex-grow: 1; justify-content: space-between;">
                <div class="top-card-content">
                    <p class="headline is-size-6 has-text-weight-bold">
                        <a href="create-a-computed-attribute-for-sum-of-purchases.md" target="_blank" rel="referrer" title="購入合計の計算属性を作成">購入の合計に対する計算属性の作成</a>
                    </p>
                    <p class="is-size-6">計算属性を使用して、ユーザーが複数の販売チャネルで行った購入金額を合計する方法を説明します。</p>
                </div>
                <a href="create-a-computed-attribute-for-sum-of-purchases.md" target="_blank" rel="referrer" class="spectrum-Button spectrum-Button--outline spectrum-Button--primary spectrum-Button--sizeM" style="align-self: flex-start; margin-top: 1rem;">
                    <span class="spectrum-Button-label has-no-wrap has-text-weight-bold"> 詳細情報 </span>
                </a>
            </div>
        </div>
    </div>
</div>
<!-- END CARDS HTML - DO NOT MODIFY BY HAND -->

## プロファイルデータの取り込みと管理

<!-- CARDS
* bring-data-into-the-real-time-customer-profile.md
* delete-profiles.md
* update-a-specific-attribute-with-upsert.md
-->
<!-- START CARDS HTML - DO NOT MODIFY BY HAND -->
<div class="columns">
    <div class="column is-half-tablet is-half-desktop is-one-third-widescreen" aria-label="Bring Data into Real-Time Customer Profile">
        <div class="card" style="height: 100%; display: flex; flex-direction: column; height: 100%;">
            <div class="card-image">
                <figure class="image x-is-16by9">
                    <a href="bring-data-into-the-real-time-customer-profile.md" title="リアルタイム顧客プロファイルにデータを取り込む" target="_blank" rel="referrer">
                        <img class="is-bordered-r-small" src="https://video.tv.adobe.com/v/27301?format=jpeg&nocache=1740415067018" alt="リアルタイム顧客プロファイルにデータを取り込む"
                             style="width: 100%; aspect-ratio: 16 / 9; object-fit: cover; overflow: hidden; display: block; margin: auto;">
                    </a>
                </figure>
            </div>
            <div class="card-content is-padded-small" style="display: flex; flex-direction: column; flex-grow: 1; justify-content: space-between;">
                <div class="top-card-content">
                    <p class="headline is-size-6 has-text-weight-bold">
                        <a href="bring-data-into-the-real-time-customer-profile.md" target="_blank" rel="referrer" title="リアルタイム顧客プロファイルにデータを取り込む"> リアルタイム顧客プロファイルへのデータの取り込み </a>
                    </p>
                    <p class="is-size-6">リアルタイム顧客プロファイルは、カスタマージャーニーの各フェーズを通じて、クロスチャネルパーソナライゼーションを大規模に強化します。 スキーマと対応するデータセットの両方を有効にすることで、リアルタイム顧客プロファイルに対してバッチデータまたはストリーミングデータを有効にできます。</p>
                </div>
                <a href="bring-data-into-the-real-time-customer-profile.md" target="_blank" rel="referrer" class="spectrum-Button spectrum-Button--outline spectrum-Button--primary spectrum-Button--sizeM" style="align-self: flex-start; margin-top: 1rem;">
                    <span class="spectrum-Button-label has-no-wrap has-text-weight-bold"> 詳細情報 </span>
                </a>
            </div>
        </div>
    </div>
    <div class="column is-half-tablet is-half-desktop is-one-third-widescreen" aria-label="Delete profiles">
        <div class="card" style="height: 100%; display: flex; flex-direction: column; height: 100%;">
            <div class="card-image">
                <figure class="image x-is-16by9">
                    <a href="delete-profiles.md" title="プロファイルの削除" target="_blank" rel="referrer">
                        <img class="is-bordered-r-small" src="https://video.tv.adobe.com/v/3429807/?format=jpeg&nocache=1740415067005" alt="プロファイルの削除"
                             style="width: 100%; aspect-ratio: 16 / 9; object-fit: cover; overflow: hidden; display: block; margin: auto;">
                    </a>
                </figure>
            </div>
            <div class="card-content is-padded-small" style="display: flex; flex-direction: column; flex-grow: 1; justify-content: space-between;">
                <div class="top-card-content">
                    <p class="headline is-size-6 has-text-weight-bold">
                        <a href="delete-profiles.md" target="_blank" rel="referrer" title="プロファイルの削除">プロファイルの削除</a>
                    </p>
                    <p class="is-size-6">リアルタイム顧客プロファイル API を使用してプロファイルストアからデータを削除する方法を説明します。 Profile API を使用すると、データレイクや ID グラフに影響を与えることなく、プロファイルストアからデータを削除できます。 これは、ID グラフの問題をトラブルシューティングし、少数のプロファイルにのみ影響するデータ取り込みでときどき発生するエラーを修正する場合に役立ちます。</p>
                </div>
                <a href="delete-profiles.md" target="_blank" rel="referrer" class="spectrum-Button spectrum-Button--outline spectrum-Button--primary spectrum-Button--sizeM" style="align-self: flex-start; margin-top: 1rem;">
                    <span class="spectrum-Button-label has-no-wrap has-text-weight-bold"> ウォッチ </span>
                </a>
            </div>
        </div>
    </div>
    <div class="column is-half-tablet is-half-desktop is-one-third-widescreen" aria-label="Update specific profile attributes using `upsert`">
        <div class="card" style="height: 100%; display: flex; flex-direction: column; height: 100%;">
            <div class="card-image">
                <figure class="image x-is-16by9">
                    <a href="update-a-specific-attribute-with-upsert.md" title="「upsert」を使用した特定のプロファイル属性の更新" target="_blank" rel="referrer">
                        <img class="is-bordered-r-small" src="https://video.tv.adobe.com/v/3416133/?format=jpeg&nocache=1740415067029" alt="「upsert」を使用した特定のプロファイル属性の更新"
                             style="width: 100%; aspect-ratio: 16 / 9; object-fit: cover; overflow: hidden; display: block; margin: auto;">
                    </a>
                </figure>
            </div>
            <div class="card-content is-padded-small" style="display: flex; flex-direction: column; flex-grow: 1; justify-content: space-between;">
                <div class="top-card-content">
                    <p class="headline is-size-6 has-text-weight-bold">
                        <a href="update-a-specific-attribute-with-upsert.md" target="_blank" rel="referrer" title="「upsert」を使用した特定のプロファイル属性の更新"> 「upsert」を使用した特定のプロファイル属性の更新 </a>
                    </p>
                    <p class="is-size-6">Adobe Experience Platformの「アップサート」機能を使用して、プロファイルの特定の属性を更新する方法を説明します。</p>
                </div>
                <a href="update-a-specific-attribute-with-upsert.md" target="_blank" rel="referrer" class="spectrum-Button spectrum-Button--outline spectrum-Button--primary spectrum-Button--sizeM" style="align-self: flex-start; margin-top: 1rem;">
                    <span class="spectrum-Button-label has-no-wrap has-text-weight-bold"> ウォッチ </span>
                </a>
            </div>
        </div>
    </div>
</div>
<!-- END CARDS HTML - DO NOT MODIFY BY HAND -->

## アカウントプロファイル

<!-- CARDS
* view-account-profiles.md
-->
<!-- START CARDS HTML - DO NOT MODIFY BY HAND -->
<div class="columns">
    <div class="column is-half-tablet is-half-desktop is-one-third-widescreen" aria-label="View account profiles">
        <div class="card" style="height: 100%; display: flex; flex-direction: column; height: 100%;">
            <div class="card-image">
                <figure class="image x-is-16by9">
                    <a href="view-account-profiles.md" title="アカウントプロファイルの表示" target="_blank" rel="referrer">
                        <img class="is-bordered-r-small" src="https://video.tv.adobe.com/v/338251?format=jpeg&nocache=1740415067214" alt="アカウントプロファイルの表示"
                             style="width: 100%; aspect-ratio: 16 / 9; object-fit: cover; overflow: hidden; display: block; margin: auto;">
                    </a>
                </figure>
            </div>
            <div class="card-content is-padded-small" style="display: flex; flex-direction: column; flex-grow: 1; justify-content: space-between;">
                <div class="top-card-content">
                    <p class="headline is-size-6 has-text-weight-bold">
                        <a href="view-account-profiles.md" target="_blank" rel="referrer" title="アカウントプロファイルの表示"> アカウントプロファイルの表示 </a>
                    </p>
                    <p class="is-size-6">Real-Time CDP B2B editionでアカウントプロファイルを表示する方法を説明します。</p>
                </div>
                <a href="view-account-profiles.md" target="_blank" rel="referrer" class="spectrum-Button spectrum-Button--outline spectrum-Button--primary spectrum-Button--sizeM" style="align-self: flex-start; margin-top: 1rem;">
                    <span class="spectrum-Button-label has-no-wrap has-text-weight-bold"> 詳細情報 </span>
                </a>
            </div>
        </div>
    </div>
</div>
<!-- END CARDS HTML - DO NOT MODIFY BY HAND -->