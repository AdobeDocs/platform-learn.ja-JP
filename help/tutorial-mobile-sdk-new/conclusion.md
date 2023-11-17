---
title: まとめと次のステップ
description: チュートリアルを完了した後の次の作業
recommendations: display,noCatalog
hide: true
exl-id: be256529-fd4f-428b-b023-409b7a35c204
source-git-commit: 4a12f8261cf1fb071bc70b6a04c34f6c16bcce64
workflow-type: tm+mt
source-wordcount: '464'
ht-degree: 8%

---

# まとめと次のステップ

おめでとうございます。「モバイルアプリでのAdobe Experience Cloudの実装」チュートリアルが完了しました。

私たちはあなたが達成したすべてを素早くレビューしましょう。 以下があります。

* 標準フィールドグループとカスタムフィールドグループを使用してスキーマを作成しました。
* データストリームの設定.
* モバイルタグプロパティを設定しました。
* アプリにタグ拡張機能をインストールし、実装しました。
* アプリに次の機能を実装しました。
   * 同意
   * ライフサイクルデータ
   * イベントトラッキング
   * ID
   * プロファイル
   * Places
* Web ビューに正しくExperience Cloudパラメーターを渡しました。
* Adobe Experience Platform Assurance を使用して実装を検証しました。
* 実装を次のアプリケーションにExperience Cloudしました。
   * Adobe Analytics
   * Experience Platform
   * Journey Optimizer
   * Adobe Target

これで、ジャーニーの次の段階、つまり独自のモバイルアプリでAdobe Experience Cloudを実装する準備が整いました。

そして、常に学ぶべきことが多い！ 実装に基づいて構築するために、調査する他のコンテンツの推奨事項を以下に示します。

* **イベント転送の有効化**. イベント転送は、データストリームで簡単に有効にできます。 こちらが [イベントの転送を設定するための実践レッスン](https://experienceleague.adobe.com/docs/platform-learn/implement-web-sdk/event-forwarding/setup-event-forwarding.html) Web SDK チュートリアルから。 モバイル実装用に作成されたリソースを使用し、アプリで実装した XDM フィールドを選択します。
* **接続Customer Journey Analytics**. 作成した [Platform データセット](platform.md)を使用すると、データセットをCustomer Journey Analyticsに接続できます。 詳しくは、こちらを参照してください。 [ビデオチュートリアル](https://experienceleague.adobe.com/docs/customer-journey-analytics-learn/tutorials/connections/connecting-customer-journey-analytics-to-data-sources-in-platform.html?lang=ja)
* **データストリームのAudience Managerを有効にする**. XDM エクスペリエンスイベントをAudience Managerに送信し、モバイルアプリエンゲージメントAudience Managerに基づいてセグメントの作成を開始します。
* **Platform でのセグメントの作成**. を有効にした場合、 [リアルタイム顧客プロファイルのスキーマとデータセット](platform.md)を使用すると、モバイルアプリイベントに基づいてセグメントを構築し、それらを他のソースのデータと組み合わせて、Real-time Customer Data Platformの宛先に送信することができます。 セグメントビルダーの詳細については、この節を参照してください [ビデオチュートリアル](https://experienceleague.adobe.com/docs/platform-learn/tutorials/audiences/create-audiences.html).
* **Platform Web SDK の実装**. 1 つの SDK を習得したら、もう 1 つ学習しましょう。 Adobe Experience Platform Web SDK は、Web サイト上でExperience Cloudやサードパーティのサービスを強化するために使用される JavaScript SDK です。 似たようなものがある [Web SDK の実践チュートリアル](https://experienceleague.adobe.com/docs/platform-learn/implement-web-sdk/overview.html?lang=ja). 両方を完了し、デバイス間でプロファイルが結合されるのを確認します。
* **Experience Platformの詳細**. 他のソースからデータを取り込み、それを Mobile SDK データと組み合わせる方法について詳しくは、 [データアーキテクトおよびデータエンジニア向けAdobe Experience Platformの概要](https://experienceleague.adobe.com/docs/platform-learn/getting-started-for-data-architects-and-data-engineers/overview.html?lang=ja)


>[!NOTE]
>
>Adobe Experience Platform Mobile SDK の学習に時間を割いていただき、ありがとうございます。 ご質問がある場合、一般的なフィードバックを共有する場合、または今後のコンテンツに関する提案がある場合は、このドキュメントで共有します [Experience Leagueコミュニティディスカッション投稿](https://experienceleaguecommunities.adobe.com/t5/adobe-experience-platform-launch/tutorial-discussion-implement-adobe-experience-cloud-in-mobile/td-p/443796).
