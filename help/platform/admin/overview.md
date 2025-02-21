---
title: Adobe Experience Platformの管理機能
description: Adobe Experience Platformの管理機能について説明します
solution: Experience Platform, Real-Time Customer Data Platform, Journey Optimizer
feature: Sandboxes, Access Control, Alerts
role: Admin
level: Beginner
source-git-commit: c81ae424f501e2aa551a9f64967a71f942c388b4
workflow-type: tm+mt
source-wordcount: '463'
ht-degree: 34%

---

# Adobe Experience Platformの管理機能

Adobe Experience Platformの管理機能を使用して、詳細なコントロールでユーザーとサンドボックス環境を大規模に管理できる方法について説明します。 ライセンスに対する使用状況を監視し、実装でおこなわれた変更を追跡します。

## 権限

ユーザー権限の管理方法を説明します。

<!-- CARDS
* add-users.md{title=Add users}
* add-developers.md{title=Add developers}
* add-product-administrators.md{title=Add administrators}
* configure-attribute-based-access-control.md
* https://experienceleague.adobe.com/en/docs/platform-learn/data-collection/users-and-permissions{title=Add users to Data Collection}
-->
<!-- START CARDS HTML - DO NOT MODIFY BY HAND -->
<div class="columns">
    <div class="column is-half-tablet is-half-desktop is-one-third-widescreen" aria-label="Add users">
        <div class="card" style="height: 100%; display: flex; flex-direction: column; height: 100%;">
            <div class="card-image">
                <figure class="image x-is-16by9">
                    <a href="add-users.md" title="ユーザーの追加" target="_blank" rel="referrer">
                        <img class="is-bordered-r-small" src="https://video.tv.adobe.com/v/336081?format=jpeg&nocache=1739899941213" alt="ユーザーの追加"
                             style="width: 100%; aspect-ratio: 16 / 9; object-fit: cover; overflow: hidden; display: block; margin: auto;">
                    </a>
                </figure>
            </div>
            <div class="card-content is-padded-small" style="display: flex; flex-direction: column; flex-grow: 1; justify-content: space-between;">
                <div class="top-card-content">
                    <p class="headline is-size-6 has-text-weight-bold">
                        <a href="add-users.md" target="_blank" rel="referrer" title="ユーザーの追加"> ユーザーを追加 </a>
                    </p>
                    <p class="is-size-6">Adobe Experience Platform ベースのアプリケーションでユーザーを追加し、権限を管理する方法について説明します。</p>
                </div>
                <a href="add-users.md" target="_blank" rel="referrer" class="spectrum-Button spectrum-Button--outline spectrum-Button--primary spectrum-Button--sizeM" style="align-self: flex-start; margin-top: 1rem;">
                    <span class="spectrum-Button-label has-no-wrap has-text-weight-bold"> ウォッチ </span>
                </a>
            </div>
        </div>
    </div>
    <div class="column is-half-tablet is-half-desktop is-one-third-widescreen" aria-label="Add users to Data Collection">
        <div class="card" style="height: 100%; display: flex; flex-direction: column; height: 100%;">
            <div class="card-image">
                <figure class="image x-is-16by9">
                    <a href="https://experienceleague.adobe.com/en/docs/platform-learn/data-collection/users-and-permissions" title="データ収集へのユーザーの追加" target="_blank" rel="referrer">
                        <img class="is-bordered-r-small" src="https://video.tv.adobe.com/v/28734/?format=jpeg&nocache=1739899941476" alt="データ収集へのユーザーの追加"
                             style="width: 100%; aspect-ratio: 16 / 9; object-fit: cover; overflow: hidden; display: block; margin: auto;">
                    </a>
                </figure>
            </div>
            <div class="card-content is-padded-small" style="display: flex; flex-direction: column; flex-grow: 1; justify-content: space-between;">
                <div class="top-card-content">
                    <p class="headline is-size-6 has-text-weight-bold">
                        <a href="https://experienceleague.adobe.com/en/docs/platform-learn/data-collection/users-and-permissions" target="_blank" rel="referrer" title="データ収集へのユーザーの追加"> データ収集へのユーザーの追加 </a>
                    </p>
                    <p class="is-size-6">会社の従業員が業務に必要なアクセス権を取得できるように、Adobe Experience Platformのデータ収集機能のユーザーを追加し、権限を管理する方法について説明します。</p>
                </div>
                <a href="https://experienceleague.adobe.com/en/docs/platform-learn/data-collection/users-and-permissions" target="_blank" rel="referrer" class="spectrum-Button spectrum-Button--outline spectrum-Button--primary spectrum-Button--sizeM" style="align-self: flex-start; margin-top: 1rem;">
                    <span class="spectrum-Button-label has-no-wrap has-text-weight-bold"> 詳細情報 </span>
                </a>
            </div>
        </div>
    </div>
    <div class="column is-half-tablet is-half-desktop is-one-third-widescreen" aria-label="Add developers">
        <div class="card" style="height: 100%; display: flex; flex-direction: column; height: 100%;">
            <div class="card-image">
                <figure class="image x-is-16by9">
                    <a href="add-developers.md" title="開発者を追加" target="_blank" rel="referrer">
                        <img class="is-bordered-r-small" src="https://video.tv.adobe.com/v/3426407?format=jpeg&nocache=1739899941236" alt="開発者を追加"
                             style="width: 100%; aspect-ratio: 16 / 9; object-fit: cover; overflow: hidden; display: block; margin: auto;">
                    </a>
                </figure>
            </div>
            <div class="card-content is-padded-small" style="display: flex; flex-direction: column; flex-grow: 1; justify-content: space-between;">
                <div class="top-card-content">
                    <p class="headline is-size-6 has-text-weight-bold">
                        <a href="add-developers.md" target="_blank" rel="referrer" title="開発者を追加"> デベロッパーを追加 </a>
                    </p>
                    <p class="is-size-6">Adobe Experience Platform ベースのアプリケーションにデベロッパーを追加し、API 資格情報に権限を付与する方法について説明します</p>
                </div>
                <a href="add-developers.md" target="_blank" rel="referrer" class="spectrum-Button spectrum-Button--outline spectrum-Button--primary spectrum-Button--sizeM" style="align-self: flex-start; margin-top: 1rem;">
                    <span class="spectrum-Button-label has-no-wrap has-text-weight-bold"> ウォッチ </span>
                </a>
            </div>
        </div>
    </div>
    <div class="column is-half-tablet is-half-desktop is-one-third-widescreen" aria-label="Add administrators">
        <div class="card" style="height: 100%; display: flex; flex-direction: column; height: 100%;">
            <div class="card-image">
                <figure class="image x-is-16by9">
                    <a href="add-product-administrators.md" title="管理者を追加" target="_blank" rel="referrer">
                        <img class="is-bordered-r-small" src="https://video.tv.adobe.com/v/333860?format=jpeg&nocache=1739899941246" alt="管理者を追加"
                             style="width: 100%; aspect-ratio: 16 / 9; object-fit: cover; overflow: hidden; display: block; margin: auto;">
                    </a>
                </figure>
            </div>
            <div class="card-content is-padded-small" style="display: flex; flex-direction: column; flex-grow: 1; justify-content: space-between;">
                <div class="top-card-content">
                    <p class="headline is-size-6 has-text-weight-bold">
                        <a href="add-product-administrators.md" target="_blank" rel="referrer" title="管理者を追加"> 管理者を追加 </a>
                    </p>
                    <p class="is-size-6">Adobe Experience Platformと Platform ベースのアプリケーションの製品管理者を追加する方法について説明します。</p>
                </div>
                <a href="add-product-administrators.md" target="_blank" rel="referrer" class="spectrum-Button spectrum-Button--outline spectrum-Button--primary spectrum-Button--sizeM" style="align-self: flex-start; margin-top: 1rem;">
                    <span class="spectrum-Button-label has-no-wrap has-text-weight-bold"> ウォッチ </span>
                </a>
            </div>
        </div>
    </div>
    <div class="column is-half-tablet is-half-desktop is-one-third-widescreen" aria-label="Configure attribute-based access control">
        <div class="card" style="height: 100%; display: flex; flex-direction: column; height: 100%;">
            <div class="card-image">
                <figure class="image x-is-16by9">
                    <a href="configure-attribute-based-access-control.md" title="属性ベースのアクセス制御を設定" target="_blank" rel="referrer">
                        <img class="is-bordered-r-small" src="https://video.tv.adobe.com/v/345641?format=jpeg&nocache=1739899941225" alt="属性ベースのアクセス制御を設定"
                             style="width: 100%; aspect-ratio: 16 / 9; object-fit: cover; overflow: hidden; display: block; margin: auto;">
                    </a>
                </figure>
            </div>
            <div class="card-content is-padded-small" style="display: flex; flex-direction: column; flex-grow: 1; justify-content: space-between;">
                <div class="top-card-content">
                    <p class="headline is-size-6 has-text-weight-bold">
                        <a href="configure-attribute-based-access-control.md" target="_blank" rel="referrer" title="属性ベースのアクセス制御を設定">属性ベースのアクセス制御を設定</a>
                    </p>
                    <p class="is-size-6">属性ベースのアクセス制御を設定して、特定の Experience Platform リソースへのアクセスを制御する方法について説明します。</p>
                </div>
                <a href="configure-attribute-based-access-control.md" target="_blank" rel="referrer" class="spectrum-Button spectrum-Button--outline spectrum-Button--primary spectrum-Button--sizeM" style="align-self: flex-start; margin-top: 1rem;">
                    <span class="spectrum-Button-label has-no-wrap has-text-weight-bold"> ウォッチ </span>
                </a>
            </div>
        </div>
    </div>
</div>
<!-- END CARDS HTML - DO NOT MODIFY BY HAND -->

## サンドボックス

サンドボックス環境の管理方法について説明します。

<!-- CARDS
* use-sandboxes.md
* copy-objects-between-sandboxes.md
* share-packages-across-orgs.md
-->
<!-- START CARDS HTML - DO NOT MODIFY BY HAND -->
<div class="columns">
    <div class="column is-half-tablet is-half-desktop is-one-third-widescreen" aria-label="Use sandboxes">
        <div class="card" style="height: 100%; display: flex; flex-direction: column; height: 100%;">
            <div class="card-image">
                <figure class="image x-is-16by9">
                    <a href="use-sandboxes.md" title="サンドボックスの使用" target="_blank" rel="referrer">
                        <img class="is-bordered-r-small" src="https://video.tv.adobe.com/v/29838/?format=jpeg&nocache=1739899941687" alt="サンドボックスの使用"
                             style="width: 100%; aspect-ratio: 16 / 9; object-fit: cover; overflow: hidden; display: block; margin: auto;">
                    </a>
                </figure>
            </div>
            <div class="card-content is-padded-small" style="display: flex; flex-direction: column; flex-grow: 1; justify-content: space-between;">
                <div class="top-card-content">
                    <p class="headline is-size-6 has-text-weight-bold">
                        <a href="use-sandboxes.md" target="_blank" rel="referrer" title="サンドボックスの使用">サンドボックスの使用</a>
                    </p>
                    <p class="is-size-6">Experience Platform サンドボックスが、新規または既存の機能を試し、フェイルファーストアプローチで動作する独立した環境を提供する方法について説明します。開発環境をリセットおよび再起動し、API 呼び出しでサンドボックスを使用する方法について説明します。</p>
                </div>
                <a href="use-sandboxes.md" target="_blank" rel="referrer" class="spectrum-Button spectrum-Button--outline spectrum-Button--primary spectrum-Button--sizeM" style="align-self: flex-start; margin-top: 1rem;">
                    <span class="spectrum-Button-label has-no-wrap has-text-weight-bold"> ウォッチ </span>
                </a>
            </div>
        </div>
    </div>
    <div class="column is-half-tablet is-half-desktop is-one-third-widescreen" aria-label="Copy configurations between sandboxes">
        <div class="card" style="height: 100%; display: flex; flex-direction: column; height: 100%;">
            <div class="card-image">
                <figure class="image x-is-16by9">
                    <a href="copy-objects-between-sandboxes.md" title="サンドボックス間での設定のコピー" target="_blank" rel="referrer">
                        <img class="is-bordered-r-small" src="https://video.tv.adobe.com/v/3424763/?format=jpeg&nocache=1739899941676" alt="サンドボックス間での設定のコピー"
                             style="width: 100%; aspect-ratio: 16 / 9; object-fit: cover; overflow: hidden; display: block; margin: auto;">
                    </a>
                </figure>
            </div>
            <div class="card-content is-padded-small" style="display: flex; flex-direction: column; flex-grow: 1; justify-content: space-between;">
                <div class="top-card-content">
                    <p class="headline is-size-6 has-text-weight-bold">
                        <a href="copy-objects-between-sandboxes.md" target="_blank" rel="referrer" title="サンドボックス間での設定のコピー"> サンドボックス間での設定のコピー </a>
                    </p>
                    <p class="is-size-6">パッケージを使用して、Experience Platform サンドボックス間で設定をコピーする方法を説明します。 サンドボックス間でスキーマ、データセット、ジャーニーなどを簡単にレプリケートします。</p>
                </div>
                <a href="copy-objects-between-sandboxes.md" target="_blank" rel="referrer" class="spectrum-Button spectrum-Button--outline spectrum-Button--primary spectrum-Button--sizeM" style="align-self: flex-start; margin-top: 1rem;">
                    <span class="spectrum-Button-label has-no-wrap has-text-weight-bold"> ウォッチ </span>
                </a>
            </div>
        </div>
    </div>
    <div class="column is-half-tablet is-half-desktop is-one-third-widescreen" aria-label="Share packages across IMS Orgs">
        <div class="card" style="height: 100%; display: flex; flex-direction: column; height: 100%;">
            <div class="card-image">
                <figure class="image x-is-16by9">
                    <a href="share-packages-across-orgs.md" title="IMS 組織間でのパッケージの共有" target="_blank" rel="referrer">
                        <img class="is-bordered-r-small" src="https://video.tv.adobe.com/v/3435815/?format=jpeg&nocache=1739899941663" alt="IMS 組織間でのパッケージの共有"
                             style="width: 100%; aspect-ratio: 16 / 9; object-fit: cover; overflow: hidden; display: block; margin: auto;">
                    </a>
                </figure>
            </div>
            <div class="card-content is-padded-small" style="display: flex; flex-direction: column; flex-grow: 1; justify-content: space-between;">
                <div class="top-card-content">
                    <p class="headline is-size-6 has-text-weight-bold">
                        <a href="share-packages-across-orgs.md" target="_blank" rel="referrer" title="IMS 組織間でのパッケージの共有">IMS 組織間でのパッケージの共有 </a>
                    </p>
                    <p class="is-size-6">パッケージを使用して IMS 組織間でExperience Platform設定をコピーする方法を説明します。 複数の IMS 組織にわたってスキーマ、データセット、ジャーニーなどを簡単にレプリケートして、複数地域/マルチブランドのデプロイメントをサポートします。</p>
                </div>
                <a href="share-packages-across-orgs.md" target="_blank" rel="referrer" class="spectrum-Button spectrum-Button--outline spectrum-Button--primary spectrum-Button--sizeM" style="align-self: flex-start; margin-top: 1rem;">
                    <span class="spectrum-Button-label has-no-wrap has-text-weight-bold"> ウォッチ </span>
                </a>
            </div>
        </div>
    </div>
</div>
<!-- END CARDS HTML - DO NOT MODIFY BY HAND -->

## ライセンス使用状況

<!-- CARDS
* https://experienceleague.adobe.com/en/docs/experience-platform/landing/license/license-usage-dashboard
-->
<!-- START CARDS HTML - DO NOT MODIFY BY HAND -->
<div class="columns">
    <div class="column is-half-tablet is-half-desktop is-one-third-widescreen" aria-label="License Usage Dashboard">
        <div class="card" style="height: 100%; display: flex; flex-direction: column; height: 100%;">
            <div class="card-image">
                <figure class="image x-is-16by9">
                    <a href="https://experienceleague.adobe.com/en/docs/experience-platform/landing/license/license-usage-dashboard" title="ライセンス使用状況ダッシュボード" target="_blank" rel="referrer">
                        <img class="is-bordered-r-small" src="https://experienceleague.adobe.com/en/docs/experience-platform/landing/license/license-usage-dashboard./media_15ebe5d6a87c210826e7502ba8402e61caa4a8ec8.png?width=400&format=png&optimize=medium" alt="ライセンス使用状況ダッシュボード"
                             style="width: 100%; aspect-ratio: 16 / 9; object-fit: cover; overflow: hidden; display: block; margin: auto;">
                    </a>
                </figure>
            </div>
            <div class="card-content is-padded-small" style="display: flex; flex-direction: column; flex-grow: 1; justify-content: space-between;">
                <div class="top-card-content">
                    <p class="headline is-size-6 has-text-weight-bold">
                        <a href="https://experienceleague.adobe.com/en/docs/experience-platform/landing/license/license-usage-dashboard" target="_blank" rel="referrer" title="ライセンス使用状況ダッシュボード"> ライセンス使用状況ダッシュボード </a>
                    </p>
                    <p class="is-size-6">Adobe Experience Platform UI には、組織のライセンス使用状況に関する重要な情報を表示できるダッシュボードが用意されています。</p>
                </div>
                <a href="https://experienceleague.adobe.com/en/docs/experience-platform/landing/license/license-usage-dashboard" target="_blank" rel="referrer" class="spectrum-Button spectrum-Button--outline spectrum-Button--primary spectrum-Button--sizeM" style="align-self: flex-start; margin-top: 1rem;">
                    <span class="spectrum-Button-label has-no-wrap has-text-weight-bold"> 詳細情報 </span>
                </a>
            </div>
        </div>
    </div>
</div>
<!-- END CARDS HTML - DO NOT MODIFY BY HAND -->

## アラート

<!-- CARDS
{cta = Watch}
* use-alerts.md
-->
<!-- START CARDS HTML - DO NOT MODIFY BY HAND -->
<div class="columns">
    <div class="column is-half-tablet is-half-desktop is-one-third-widescreen" aria-label="Use alerts">
        <div class="card" style="height: 100%; display: flex; flex-direction: column; height: 100%;">
            <div class="card-image">
                <figure class="image x-is-16by9">
                    <a href="use-alerts.md" title="アラートを使用" target="_blank" rel="referrer">
                        <img class="is-bordered-r-small" src="https://video.tv.adobe.com/v/336218?format=jpeg&nocache=1739899942212" alt="アラートを使用"
                             style="width: 100%; aspect-ratio: 16 / 9; object-fit: cover; overflow: hidden; display: block; margin: auto;">
                    </a>
                </figure>
            </div>
            <div class="card-content is-padded-small" style="display: flex; flex-direction: column; flex-grow: 1; justify-content: space-between;">
                <div class="top-card-content">
                    <p class="headline is-size-6 has-text-weight-bold">
                        <a href="use-alerts.md" target="_blank" rel="referrer" title="アラートを使用">アラートを使用</a>
                    </p>
                    <p class="is-size-6">Adobe Experience Platform でアラートを登録および管理する方法について説明します。アラートは、様々なプロセスを監視して、Platform 実装がスムーズに実行されていることを確認するのに役立ちます。</p>
                </div>
                <a href="use-alerts.md" target="_blank" rel="referrer" class="spectrum-Button spectrum-Button--outline spectrum-Button--primary spectrum-Button--sizeM" style="align-self: flex-start; margin-top: 1rem;">
                    <span class="spectrum-Button-label has-no-wrap has-text-weight-bold"> ウォッチ </span>
                </a>
            </div>
        </div>
    </div>
</div>
<!-- END CARDS HTML - DO NOT MODIFY BY HAND -->

## タグ

<!-- CARDS
* https://experienceleague.adobe.com/en/docs/experience-platform/administrative-tags/ui/managing-tags
-->
<!-- START CARDS HTML - DO NOT MODIFY BY HAND -->
<div class="columns">
    <div class="column is-half-tablet is-half-desktop is-one-third-widescreen" aria-label="Managing Unified Tags">
        <div class="card" style="height: 100%; display: flex; flex-direction: column; height: 100%;">
            <div class="card-image">
                <figure class="image x-is-16by9">
                    <a href="https://experienceleague.adobe.com/en/docs/experience-platform/administrative-tags/ui/managing-tags" title="統合タグの管理" target="_blank" rel="referrer">
                        <img class="is-bordered-r-small" src="https://experienceleague.adobe.com/en/docs/experience-platform/administrative-tags/ui/managing-tags./media_14b5a89a9bf89cb36a9e78864b1568e59c9d9d86b.png?width=400&format=png&optimize=medium" alt="統合タグの管理"
                             style="width: 100%; aspect-ratio: 16 / 9; object-fit: cover; overflow: hidden; display: block; margin: auto;">
                    </a>
                </figure>
            </div>
            <div class="card-content is-padded-small" style="display: flex; flex-direction: column; flex-grow: 1; justify-content: space-between;">
                <div class="top-card-content">
                    <p class="headline is-size-6 has-text-weight-bold">
                        <a href="https://experienceleague.adobe.com/en/docs/experience-platform/administrative-tags/ui/managing-tags" target="_blank" rel="referrer" title="統合タグの管理"> 統合タグの管理 </a>
                    </p>
                    <p class="is-size-6">このドキュメントでは、Adobe Experience Cloud での統合タグの管理について説明します</p>
                </div>
                <a href="https://experienceleague.adobe.com/en/docs/experience-platform/administrative-tags/ui/managing-tags" target="_blank" rel="referrer" class="spectrum-Button spectrum-Button--outline spectrum-Button--primary spectrum-Button--sizeM" style="align-self: flex-start; margin-top: 1rem;">
                    <span class="spectrum-Button-label has-no-wrap has-text-weight-bold"> 詳細情報 </span>
                </a>
            </div>
        </div>
    </div>
</div>
<!-- END CARDS HTML - DO NOT MODIFY BY HAND -->
