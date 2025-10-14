---
title: Platform Mobile SDK チュートリアル完了後の結論と次の手順
description: チュートリアルの完了後に行うこと
recommendations: display,noCatalog
jira: KT-14642
exl-id: 69db6cf3-0d5d-4864-aac2-e5e1aea4c02e
source-git-commit: cb97521c7906bcb16c7352f6c2447e07abb828c7
workflow-type: tm+mt
source-wordcount: '438'
ht-degree: 3%

---

# まとめ、次のステップ

おめでとうございます。これで、「モバイルアプリでのAdobe Experience Cloudの実装」チュートリアルが完了しました。

これまでに達成したことをすべて簡単に確認しましょう。 次の条件を満たしている：

* 標準フィールドグループとカスタムフィールドグループを使用してスキーマを作成しました。
* データストリームを設定します。
* モバイルタグプロパティを設定します。
* アプリにタグ拡張機能をインストールおよび実装しました。
* アプリに次の機能を実装しました。
   * 同意
   * ライフサイクルデータ
   * イベントトラッキング
   * ID
   * プロファイル
   * Places
* Web ビューにExperience Cloudパラメーターを正しく渡しました。
* Adobe Experience Platform Assurance を使用して実装を検証しました。
* 実装を次のExperience Cloudアプリケーションに接続しました。
   * Adobe Analytics
   * Experience Platform
   * Journey Optimizer
   * Adobe Target

ジャーニーの次のフェーズである、独自のモバイルアプリへのAdobe Experience Cloudの実装を開始する準備が整いました。

そして、学ぶべきことは常に多くあります！ 実装に基づいて構築するために、その他のコンテンツの推奨事項を次に示します。

* **イベント転送の有効化**. イベント転送は、データストリームで簡単に有効にできます。 Web SDK チュートリアルの [&#x200B; イベント転送を設定するための実践レッスン &#x200B;](https://experienceleague.adobe.com/docs/platform-learn/implement-web-sdk/event-forwarding/setup-event-forwarding.html?lang=ja) を以下に示します。 モバイル実装用に作成したリソースを使用し、アプリに実装した XDM フィールドを選択します。
* **接続Customer Journey Analytics**. [Platform データセット &#x200B;](platform.md) を作成した場合は、データセットをCustomer Journey Analyticsに接続できます。 詳しくは、この [&#x200B; ビデオチュートリアル &#x200B;](https://experienceleague.adobe.com/docs/customer-journey-analytics-learn/tutorials/connections/connecting-customer-journey-analytics-to-data-sources-in-platform.html?lang=ja) を参照してください
* **データストリームでAudience Managerを有効にします**。 XDM エクスペリエンスイベントをAudience Managerに送信し、モバイルアプリのエンゲージメントAudience Managerに基づいてセグメントの作成を開始します。
* **Platform でセグメントを作成** します。 リアルタイム顧客プロファイル [&#128279;](platform.md) に対して  スキーマとデータセットを有効にした場合、モバイルアプリイベントに基づいてセグメントを作成し、それらを他のソースのデータと組み合わせて、これらのセグメントをReal-time Customer Data Platformの宛先に送信できます。 セグメントビルダーについて詳しくは、この [&#x200B; ビデオチュートリアル &#x200B;](https://experienceleague.adobe.com/docs/platform-learn/tutorials/audiences/create-audiences.html?lang=ja) を参照してください。
* **Platform Web SDK の実装**。 ある SDK をマスターしたので、別の SDK を学びましょう。 Adobe Experience Platform Web SDK は、web サイト上のExperience Cloudおよびサードパーティサービスの機能を強化するために使用されるJavaScript SDK です。 Web SDK に関する同様の [&#x200B; 実践チュートリアル &#x200B;](https://experienceleague.adobe.com/docs/platform-learn/implement-web-sdk/overview.html?lang=ja) があります。 両方を完了して、デバイス間でのプロファイルの結合を確認します。
* **Experience Platformの詳細情報**。 他のソースからデータを取り込み、それを Mobile SDK データと組み合わせる方法について詳しくは、[&#x200B; データアーキテクトおよびデータエンジニア向けAdobe Experience Platformの概要 &#x200B;](https://experienceleague.adobe.com/docs/platform-learn/getting-started-for-data-architects-and-data-engineers/overview.html?lang=ja) を参照してください。


>[!NOTE]
>
>Adobe Experience Platform Mobile SDK の学習に時間を費やしていただき、ありがとうございます。 ご不明な点がある場合や、一般的なフィードバックをお寄せになる場合、または今後のコンテンツに関するご提案がある場合は、この [Experience League コミュニティ ディスカッションの投稿 &#x200B;](https://experienceleaguecommunities.adobe.com:443/t5/adobe-experience-platform-data/tutorial-discussion-implement-adobe-experience-cloud-in-mobile/td-p/443796) でお知らせください。
