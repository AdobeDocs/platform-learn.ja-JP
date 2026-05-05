---
user-guide-title: Adobe Experience Platform のチュートリアル
breadcrumb-title: チュートリアル
user-guide-description: Experience Platform の多くの要素について学びます。
audience: all
doc-type: video
auto-video-transcripts: true
source-git-commit: 2631a20563c227dc030d6f38b882bd2fcf11d0ac
workflow-type: tm+mt
source-wordcount: '1309'
ht-degree: 22%

---


# Adobe Experience Platform のチュートリアル {#tutorials}

<!--

Data Modeling

Profile vs Data Lake vs Identity
how a record becomes an audience member

Profiles
Identities
Audience

Data Lake

Data Ingestion
-Batch
-Streaming
-Edge (Data Collection)
-Monitoring

Data Governance
Privacy
Consent
Audit logs

Administration
-Sandboxes
-Permissions
-License usage


---
App specific

Destinations

Journeys

Campaigns

-->


+ [プラットフォームチュートリアル](/help/platform/overview.md)
+ Platformの概要 {#intro-to-platform}
   + [Experience Platform を活用したカスタマーエクスペリエンス](/help/platform/intro-to-platform/a-customer-experience-powered-by-experience-platform.md)
   + [舞台裏：Experience Platformを活用した顧客体験](/help/platform/intro-to-platform/behind-the-scenes-a-customer-experience-powered-by-experience-platform.md)
   + [Experience Platform の概要](/help/platform/intro-to-platform/overview.md)
   + [主な機能](/help/platform/intro-to-platform/key-capabilities.md)
   + [プラットフォームベースのアプリケーション](/help/platform/intro-to-platform/native-applications.md)
   + [Experience Cloudアプリケーションとの統合](/help/platform/intro-to-platform/integrations-with-experience-cloud-applications.md)
   + [主なユースケース](/help/platform/intro-to-platform/key-use-cases.md)
   + [基本アーキテクチャ](/help/platform/intro-to-platform/basic-architecture.md)
   + [ユーザーインターフェイス](/help/platform/intro-to-platform/interface-tour.md)
   + [役割とプロジェクトフェーズ](/help/platform/intro-to-platform/roles-and-project-phases.md)
+ Real-Time CDPの概要 {#rtcdp}
   + [概要](rtcdp/understanding-the-real-time-customer-data-platform.md)
   + [Real-Time CDPの活用方法](rtcdp/understanding-the-real-time-customer-data-platform-user-interface.md)
   + [エンドツーエンドのデモ](rtcdp/demo.md)
   + [B2B editionの概要](rtcdp/b2b-overview.md)
   + [Marketo Engageを使用したキャンペーンのオーケストレーション](rtcdp/orchestrate-campaigns-with-marketo-engage.md)
+ [はじめに：データアーキテクトとデータエンジニア](https://experienceleague.adobe.com/en/docs/platform-learn/getting-started-for-data-architects-and-data-engineers/overview){target="_blank"}
+ [サンプルデータをExperience Platformに読み込む](/help/platform/data-generator/import-sample-data.md)
+ 管理 {#admin}
   + [概要](/help/platform/admin/overview.md)
   + [ユーザーの追加](/help/platform/admin/add-users.md)
   + [データ収集へのユーザーの追加](https://experienceleague.adobe.com/en/docs/platform-learn/data-collection/users-and-permissions)
   + [開発者を追加](/help/platform/admin/add-developers.md)
   + [製品管理者の追加](/help/platform/admin/add-product-administrators.md)
   + [属性ベースのアクセス制御を設定](/help/platform/admin/configure-attribute-based-access-control.md)
   + [サンドボックスの使用](/help/platform/admin/use-sandboxes.md)
   + [サンドボックス間でのパッケージのコピー](/help/platform/admin/copy-objects-between-sandboxes.md)
   + [IMS組織間でのパッケージの共有](/help/platform/admin/share-packages-across-orgs.md)
   + [アラートの使用](/help/platform/admin/use-alerts.md)
+ AI アシスタント {#ai-assistant}
   + [概要](/help/platform/ai-assistant/overview.md)
   + [Agent Orchestrator](/help/platform/ai-assistant/agent-orchestrator-overview.md)
   + [Agent Orchestratorインターフェイス](/help/platform/ai-assistant/agent-orchestrator-ui.md)
   + [体験する](/help/platform/ai-assistant/access.md)
   + [Audience Agent](/help/platform/ai-assistant/audience-agent-overview.md)
   + [Journey Agent](/help/platform/ai-assistant/journey-agent-overview.md)
   + [Experimentation Agent](/help/platform/ai-assistant/experimentation-agent-overview.md)
   + [Data Insights Agent](/help/platform/ai-assistant/data-insights-agent-overview.md)
   + [製品サポート担当者](/help/platform/ai-assistant/product-support-agent.md)
   + [新製品のオンボーディング](/help/platform/ai-assistant/onboard.md)
   + [製品について詳しく見る](/help/platform/ai-assistant/product-knowledge.md)
   + [応答を検証](/help/platform/ai-assistant/validate-responses.md)
   + [見つけやすさパネル](/help/platform/ai-assistant/discoverability-panel.md)
   + [未使用のオーディエンスの発見](/help/platform/ai-assistant/find-unused-audiences.md)
   + [運用上のインサイト](/help/platform/ai-assistant/operational-insights.md)
   + [影響分析](/help/platform/ai-assistant/impact-analysis.md)
   + [AI クレジット](/help/platform/ai-assistant/ai-credits.md)
   + [セキュリティの概要](/help/platform/ai-assistant/security-overview.md)
+ API {#api}
   + [Experience Platform APIの認証](/help/platform/api/platform-api-authentication.md)
   + [アクセストークンの生成](/help/platform/api/generate-an-access-token.md)
   + [APIの使用](/help/platform/api/use-apis-with-postman.md)
+ オーディエンスとセグメンテーション {#audiences}
   + Audience Builder{#audience-builder}
      + [はじめに](audiences/audience-builder/introduction-to-audience-portal-and-composition.md)
      + [オーディエンスをアップロード](audiences/audience-builder/upload-audiences.md)
      + [オーディエンスルールビルダーの概要](audiences/audience-builder/audience-rule-builder-overview.md)
      + [オーディエンスを作成](audiences/audience-builder/create-audiences.md)
      + [時間制約の使用](audiences/audience-builder/time-constraints.md)
      + [コンテンツベースのオーディエンスを作成](audiences/audience-builder/create-content-based-audiences.md)
      + [コンバージョンオーディエンスの構築](audiences/audience-builder/create-conversion-audiences.md)
      + [既存のオーディエンスからオーディエンスを作成](audiences/audience-builder/create-audiences-from-existing-audiences.md)
      + [順次オーディエンスを作成](audiences/audience-builder/create-sequential-audiences.md)
      + [動的オーディエンスを作成](audiences/audience-builder/create-dynamic-audiences.md)
      + [マルチエンティティオーディエンスの作成](audiences/audience-builder/create-multi-entity-audiences.md)
      + [アカウントオーディエンス（B2B）の構築と活用](audiences/audience-builder/create-audiences-with-b2b-data.md)
      + [ストリーミングセグメンテーションのデモ](/help/platform/audiences/audience-builder/streaming-segmentation-demo.md)
      + [バッチオーディエンスのオンデマンド評価](/help/platform/audiences/audience-builder/evaluate-audiences-on-demand.md)
   + 連合オーディエンス構成 {#fac}
      + [概要](audiences/fac/overview-of-federated-audience-composition.md)
      + [フェデレーション接続の設定](audiences/fac/connect-and-configure-federated-audience-composition.md)
      + [Oracleに接続](audiences/fac/connect-to-oracle.md)
      + [連合オーディエンスの作成](audiences/fac/create-a-federated-audience-composition.md)
      + [アラートの配信を登録](audiences/fac/subscribe-to-alerts.md)
   + Segment Match{#segment-match}
      + [セグメントマッチ接続の設定](/help/platform/audiences/segment-match/segment-match-connection-setup.md)
      + [セグメントマッチのデータガバナンス](/help/platform/audiences/segment-match/segment-match-data-governance.md)
      + [セグメントマッチ設定フロー](/help/platform/audiences/segment-match/segment-match-configuration-flow.md)
      + [セグメント一致の事前共有インサイト](/help/platform/audiences/segment-match/segment-match-pre-share-insights.md)
      + [セグメントマッチの受信データ](/help/platform/audiences/segment-match/segment-match-receiving-data.md)
   + チュートリアル{#audience-tutorials}
      + [オーディエンスルールの評価](https://experienceleague.adobe.com/en/docs/experience-platform/segmentation/tutorials/evaluate-a-segment){target="_blank"}
      + [データを書き出すデータセットの作成](https://experienceleague.adobe.com/en/docs/experience-platform/segmentation/tutorials/create-dataset-export-segment){target="_blank"}
      + [データウェアハウスからオーディエンスをエンゲージします](https://experienceleague.adobe.com/ja/docs/platform-learn/engage-with-audiences-from-your-data-warehouse-using-fac/overview){target="_blank"}
+ [監査ログ](/help/platform/governance/audit-logs.md)
+ [データ収集](https://experienceleague.adobe.com/en/docs/platform-learn/data-collection/overview){target="_blank"}
+ コラボレーション {#collaboration}
   + [Real-Time CDP Collaborationの概要](collaboration/real-time-cdp-collaboration-overview.md)
   + [Collaborationの概要](collaboration/real-time-cdp-collaboration-intro.md)
   + [Adobe Real-Time CDPの代理店の実務担当者の概要](collaboration/rtcdp-overview-for-agency-practitioners.md)
   + [Collaboration - プロセスと人](collaboration/rtcdp-collaboration-process-and-people.md)
   + [権限の設定](collaboration/set-permissions-for-collaboration.md)
   + [広告主アカウントの設定](collaboration/set-up-an-advertiser-account.md)
   + [広告主としてのオーディエンスの参照](collaboration/reference-audiences-as-an-advertiser.md)
   + [メディア企業とつながる](collaboration/connect-with-publishers.md)
   + [プロジェクトの作成](collaboration/create-a-project.md)
   + [オーディエンスの重複を発見](collaboration/discover-audience-overlaps-in-projects.md)
   + [共同作業者に対するオーディエンスのアクティブ化](collaboration/activate-audiences-in-projects.md)
   + [Collaboration measurement - セットアップとレポート作成](collaboration/collaboration-measurement-setup-and-report-creation.md)
   + [ブランドからブランドへ](collaboration/brand-to-brand-collaboration.md)
   + [Collaborationを使用するためのパートナーの招待](collaboration/rtcdp-collaboration-in-product-invitations.md)
+ ダッシュボード {#dashboards}
   + [ダッシュボードの作成](/help/platform/dashboards/create-a-dashboard.md)
+ データガバナンス {#data-governance}
   + [概要](/help/platform/governance/understanding-data-governance.md)
   + [エンドツーエンドのデモ](/help/platform/governance/introduction-to-data-governance.md)
   + [ラベルを使用したデータの分類](/help/platform/governance/classify-data-using-labels.md)
   + [データ使用ポリシーの作成](/help/platform/governance/create-data-usage-policies.md)
   + [データ使用ポリシーの作成](/help/platform/governance/enforce-data-usage-policies.md)
   + [同意の適用](/help/platform/governance/enforce-consent.md)
   + [IAB Transparency and Consent Framework 2.0との統合](/help/platform/governance/integrate-with-iab-transparency-and-consent-framework-2.md)
+ データハイジーン {#data-hygiene}
   + [概要](/help/platform/data-hygiene/overview.md)
   + [データの健全性を保つためのデータ準備](/help/platform/data-hygiene/data-prep-for-data-hygiene.md)
   + [データセットとバッチの削除](/help/platform/data-hygiene/delete-datasets-and-batches.md)
   + [データセットの期限切れ](https://experienceleague.adobe.com/en/docs/platform-learn/tutorials/data-lifecycle/expire-datasets)
   + [仮名プロファイルとイベント有効期限（TTL）](/help/platform/data-hygiene/pseudonymous-profile-and-event-expiration.md)
   + [プロファイルの削除](https://experienceleague.adobe.com/ja/docs/platform-learn/tutorials/profiles/delete-profiles)
   + [プロファイル属性の更新](https://experienceleague.adobe.com/en/docs/platform-learn/tutorials/profiles/update-a-specific-attribute-with-upsert)
+ データ取り込み {#data-ingestion}
   + [概要](/help/platform/data-ingestion/understanding-data-ingestion.md)
   + [バッチ取り込みの概要](/help/platform/data-ingestion/batch-ingestion-overview.md)
   + [データセットの作成と入力](/help/platform/data-ingestion/create-datasets-and-ingest-data.md)
   + [データセットとバッチの削除](https://experienceleague.adobe.com/ja/docs/platform-learn/tutorials/data-hygiene/delete-datasets-and-batches)
   + [XDM への CSV ファイルのマッピング](https://experienceleague.adobe.com/ja/docs/experience-platform/ingestion/tutorials/map-csv/existing-schema){target="_blank"}
   + [ソースの概要](https://experienceleague.adobe.com/en/docs/platform-learn/tutorials/sources/overview)
   + [Adobe Analyticsからのデータの取り込み](https://experienceleague.adobe.com/en/docs/platform-learn/tutorials/sources/ingest-data-from-adobe-analytics)
   + [Audience Managerからのデータの取り込み](https://experienceleague.adobe.com/en/docs/platform-learn/tutorials/sources/ingest-data-from-aam)
   + [クラウドストレージからのデータの取り込み](https://experienceleague.adobe.com/en/docs/platform-learn/tutorials/sources/ingest-data-from-cloud-storage)
   + [CRMからデータを取り込み](https://experienceleague.adobe.com/en/docs/platform-learn/tutorials/sources/ingest-data-from-crm)
   + [データベースからのデータの取り込み](https://experienceleague.adobe.com/en/docs/platform-learn/tutorials/sources/ingest-data-from-databases)
   + [ストリーミング取り込みの概要](/help/platform/data-ingestion/understanding-streaming-ingestion.md)
   + [HTTP APIを使用したストリームデータ](https://experienceleague.adobe.com/en/docs/platform-learn/tutorials/sources/streaming-ingestion-http-api)
   + [Source Connectorsを使用したストリームデータ](https://experienceleague.adobe.com/en/docs/platform-learn/tutorials/sources/streaming-ingestion-source-connector)
   + [Web SDK チュートリアル](https://experienceleague.adobe.com/en/docs/platform-learn/data-collection/web-sdk/overview){target="_blank"}
   + [モバイル SDK チュートリアル](https://experienceleague.adobe.com/en/docs/platform-learn/data-collection/mobile-sdk/overview){target="_blank"}
+ データライフサイクル {#data-lifecycle}
   + [データセットの期限切れ](/help/platform/data-lifecycle/expire-datasets.md)
+ 宛先 {#destinations}
   + [宛先の概要](/help/platform/destinations/understanding-destinations.md)
   + [配信先への接続](/help/platform/destinations/connecting-to-destinations.md)
   + [宛先の作成とデータのアクティベーション](/help/platform/destinations/create-destinations-and-activate-data.md)
   + [宛先へのプロファイルとオーディエンスのアクティブ化](/help/platform/destinations/activate-profiles-and-segments-to-a-destination.md)
   + [クラウドストレージの宛先を使用したデータセットの書き出し](/help/platform/destinations/configure-dataset-export-destination.md)
   + [Google Customer Matchとの統合](/help/platform/destinations/integrate-with-google-customer-match.md)
   + [Azure Blobの宛先の設定](/help/platform/destinations/configure-the-azure-blob-destination.md)
   + [Marketo Engageの宛先の設定](/help/platform/destinations/configure-the-marketo-destination.md)
   + [ファイルベースのクラウドストレージまたはメールマーケティングの宛先の設定](/help/platform/destinations/configuring-file-based-cloud-storage-or-email-marketing-destinations.md)
   + [ソーシャル宛先の設定](/help/platform/destinations/configure-a-social-destination.md)
   + [LiveRamp宛先を通じてアクティブ化する](/help/platform/destinations/liveramp-destinations.md)
   + Data Warehouse {#data-warehouse}
      + [オーディエンスデータをSnowflakeに送信データ共有バッチ](/help/platform/destinations/data-warehouse/send-audience-data-snowflake-batch.md)
   + Adobe TargetとカスタムPersonalization{#target}
      + [Adobe Targetによる次のヒットをパーソナライズ](/help/platform/destinations/target/next-hit-personalization.md)
      + [Adobe Targetの宛先の設定](/help/platform/destinations/target/configure-the-target-destination.md)
      + [セグメントとプロファイル属性のアクティブ化](/help/platform/destinations/target/activate-segments-and-profile-attributes.md)
      + [TargetでのReal-Time CDP セグメントの使用](/help/platform/destinations/target/use-rtcdp-segments-in-target.md)
      + [TargetでのReal-Time CDP プロファイル属性の使用](/help/platform/destinations/target/use-rtcdp-profile-attributes-in-target.md)
   + [Adobe以外のアプリケーションへのデータのアクティベーションウェビナー](/help/platform/destinations/activate-data-to-non-adobe-applications.md)
+ ID {#identities}
   + [IDおよびID グラフの概要](/help/platform/identities/understanding-identity-and-identity-graphs.md)
   + [ID データのラベル付け、取り込み、検証](/help/platform/identities/label-ingest-and-verify-identity-data.md)
   + [ID グラフを表示](/help/platform/identities/view-identity-graphs.md)
   + ID グラフのリンクルール {#graph-linking-rules}
      + [概要](/help/platform/identities/identity-graph-linking-rules/overview.md)
      + [グラフシミュレーション](/help/platform/identities/identity-graph-linking-rules/graph-simulation.md)
      + [ID 設定](/help/platform/identities/identity-graph-linking-rules/identity-settings.md)
+ インテリジェントサービス {#intelligent-services}
   + [概要](/help/platform/intelligent-services/introduction-to-intelligent-services.md)
   + [Attribution AI の概要](/help/platform/intelligent-services/introduction-to-attribution-ai.md)
   + [アトリビューション AIの価値](/help/platform/intelligent-services/business-value-of-attribution-ai.md)
   + [Attribution AI の設定](/help/platform/intelligent-services/configure-attribution-ai.md)
   + [Attribution AI スコアおよびインサイトの使用](/help/platform/intelligent-services/use-attribution-ai-scores-and-insights.md)
   + [顧客 AI の概要](/help/platform/intelligent-services/introduction-to-customer-ai.md)
   + [Customer AIの価値](/help/platform/intelligent-services/business-value-of-customer-ai.md)
   + [Customer AI の設定](/help/platform/intelligent-services/configure-customer-ai.md)
   + [Customer AI スコアおよびインサイトの使用](/help/platform/intelligent-services/use-customer-ai-scores-and-insights.md)
+ モニタリング {#monitoring}
   + [データ取得の監視](/help/platform/monitoring/monitoring-dashboard.md)
   + [セグメントのアクティベーションの監視](/help/platform/monitoring/monitoring-the-success-of-segment-activation.md)
   + [データフローのモニター](/help/platform/monitoring/data-monitoring.md)
   + [ストリーミング容量管理](monitoring/streaming-management.md)
   + [Slackとの統合](monitoring/monitor-events-in-slack.md)
+ パートナーデータのサポート {#partner-data-support}
   + [パートナーデータのサポート概要](/help/platform/partner-data-support/partner-data-support-overview.md)
   + [オフサイト見込み顧客のサポート](/help/platform/partner-data-support/offsite-prospecting-partner-data.md)
   + [プロファイルへのパートナー属性の追加](/help/platform/partner-data-support/partner-enrichment-partner-data.md)
   + [未知の訪問者に対してオンサイトでパーソナライズする](/help/platform/partner-data-support/unknown-visitor-personalization-partner-data.md)
+ プロファイル {#profiles}
   + [リアルタイムの顧客プロファイルについて](/help/platform/profiles/understanding-the-real-time-customer-profile.md)
   + [プロファイルの概要ダイアグラム](/help/platform/profiles/overview-diagram.md)
   + [データをプロファイルに取り込む](/help/platform/profiles/bring-data-into-the-real-time-customer-profile.md)
   + [プロファイルビューの詳細をカスタマイズ](https://experienceleague.adobe.com/en/docs/experience-platform/profile/ui/profile-customization){target="_blank"}
   + [アカウントプロファイルの表示](/help/platform/profiles/view-account-profiles.md)
   + [結合ポリシーの作成](/help/platform/profiles/create-merge-policies.md)
   + [結合スキーマの概要](/help/platform/profiles/union-schemas-overview.md)
   + [計算属性の作成](/help/platform/profiles/create-a-computed-attribute-for-sum-of-purchases.md)
   + [仮名プロファイル有効期限（TTL）](https://experienceleague.adobe.com/ja/docs/platform-learn/tutorials/data-hygiene/pseudonymous-profile-and-event-expiration)
   + [プロファイルの削除](/help/platform/profiles/delete-profiles.md)
   + [upsertを使用した特定の属性の更新](/help/platform/profiles/update-a-specific-attribute-with-upsert.md)
+ プライバシーとセキュリティ {#privacy}
   + [Privacy Serviceの概要](/help/platform/privacy/introduction-to-privacy-services.md)
   + [プライバシーリクエストのID データ](/help/platform/privacy/identity-data-in-privacy-requests.md)
   + [Privacy JavaScript library](/help/platform/privacy/using-privacy-javascript-library.md)
   + [Adobe Analyticsのプライバシーラベル](/help/platform/privacy/privacy-labels-in-adobe-analytics.md)
   + [Privacy Service APIの概要](/help/platform/privacy/getting-started-with-privacy-services-api.md)
   + [PRIVACY SERVICE UI](/help/platform/privacy/using-privacy-services-ui.md)
   + [PRIVACY SERVICE API](/help/platform/privacy/using-the-privacy-service-api.md)
   + [プライバシーイベントへの購読](/help/platform/privacy/subscribe-to-privacy-events.md)
   + [暗号化キーの設定](/help/platform/privacy/set-up-customer-managed-keys.md)
   + [責任ある顧客データ管理のための10の考慮事項](/help/platform/privacy/ten-considerations-for-responsible-customer-data-management.md)
   + [データスチュワードとしてのマーケターの役割を高める](/help/platform/privacy/elevating-the-marketers-role-as-a-data-steward.md)
+ クエリとデータDistiller {#queries}
   + [概要](/help/platform/queries/understanding-query-service.md)
   + [クエリの実行](/help/platform/queries/run-queries.md)
   + [データの検証](/help/platform/queries/explore-data.md)
   + [データの取得](/help/platform/queries/prepare-data.md)
   + [Adobe定義の関数](/help/platform/queries/adobe-defined-functions.md)
   + [BI ツールを使用してダッシュボードを構築する](/help/platform/queries/understanding-the-value-of-dashboards-built-with-query-service.md)
   + [Tableauの接続](/help/platform/queries/psql-client-tableau.md)
   + [Tableauでのデータの分析と可視化](/help/platform/queries/analyze-and-visualize.md)
   + [顧客データの再充電](/help/platform/queries/recharge-your-customer-data.md)
+ スキーマ {#schemas}
   + [概要](/help/platform/schemas/schemas-and-experience-data-model.md)
   + [構成要素](/help/platform/schemas/schema-building-blocks.md)
   + [データモデルの立案](/help/platform/schemas/plan-your-data-model.md)
   + [データモデルをXDMに変換する](/help/platform/schemas/convert-your-data-model-to-xdm.md)
   + [スキーマの作成](/help/platform/schemas/create-schemas.md)
   + [B2B データのスキーマの作成](/help/platform/schemas/create-schemas-for-b2b-data.md)
   + [クラスを作成](/help/platform/schemas/create-classes.md)
   + [フィールドグループの作成](/help/platform/schemas/create-schema-field-groups.md)
   + [データタイプの作成](/help/platform/schemas/create-data-types.md)
   + [スキーマ間の関係の設定](/help/platform/schemas/configure-relationships-between-schemas.md)
   + [列挙フィールドと推奨値の使用](/help/platform/schemas/use-enumerated-fields.md)
   + [サンドボックス間のスキーマのコピー](/help/platform/schemas/copy-schemas-between-sandboxes.md)
   + [スキーマの更新](/help/platform/schemas/update-schemas.md)
   + [アドホックスキーマの作成](https://experienceleague.adobe.com/en/docs/experience-platform/xdm/tutorials/ad-hoc){target="_blank"}
+ ソース {#sources}
   + [概要](/help/platform/sources/overview.md)
   + [Adobe Analyticsからのデータの取り込み](/help/platform/sources/ingest-data-from-adobe-analytics.md)
   + [Audience Managerからのデータの取り込み](/help/platform/sources/ingest-data-from-aam.md)
   + [Marketoからのデータの取り込み](/help/platform/sources/ingest-data-from-marketo.md)
   + [クラウドストレージからのデータの取り込み](/help/platform/sources/ingest-data-from-cloud-storage.md)
   + [CRMからデータを取り込み](/help/platform/sources/ingest-data-from-crm.md)
   + [データベースからのデータの取り込み](/help/platform/sources/ingest-data-from-databases.md)
   + [HTTP APIを使用したストリームデータ](/help/platform/sources/streaming-ingestion-http-api.md)
   + [Source Connectorsを使用したストリームデータ](/help/platform/sources/streaming-ingestion-source-connector.md)
   + [トラブルシューティング：SFTP コネクタ](/help/platform/sources/troubleshoot-sftp-connector.md)
+ ユースケースプレイブック {#use-case-playbooks}
   + [概要](/help/platform/use-case-playbooks/overview.md)
   + [プレイブックサンドボックスの設定](/help/platform/use-case-playbooks/configure-a-playbook-sandbox.md)
   + [プレイブックインスタンスの作成と公開](/help/platform/use-case-playbooks/create-and-publish-a-playbook-instance.md)
+ Experience Cloud の統合 {#experience-cloud}
   + [Analytics](https://experienceleague.adobe.com/en/docs/platform-learn/tutorials/sources/ingest-data-from-adobe-analytics)
   + [Audience Manager](https://experienceleague.adobe.com/en/docs/platform-learn/tutorials/sources/ingest-data-from-aam)
   + [Commerce](/help/platform/experience-cloud/business-value-of-platform-and-commerce.md)
   + [Marketo Engage](https://experienceleague.adobe.com/en/docs/platform-learn/tutorials/rtcdp/orchestrate-campaigns-with-marketo-engage)
   + [ターゲット](https://experienceleague.adobe.com/en/docs/platform-learn/tutorials/destinations/target/next-hit-personalization)
+ 業界トレンド {#industry}
   + [データ管理の未来と変化する環境](/help/platform/industry/the-future-of-data-management-and-the-changing-environment.md)
   + [2つの認識の物語：ブランドと消費者の違い](/help/platform/industry/brands-vs-consumers.md)
   + [オーディエンスセンターオブエクセレンスの進化](/help/platform/industry/evolving-your-audience-center-of-excellence.md)
   + [顧客プロファイルでより優れた体験を構築](/help/platform/industry/building-better-experiences-with-customer-profiles.md)
