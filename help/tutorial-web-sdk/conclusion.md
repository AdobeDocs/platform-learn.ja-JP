---
title: Web SDK チュートリアルの最後と次の手順
description: Web SDK チュートリアルの完了後に行う作業
recommendations: display,noCatalog
exl-id: ca28374a-9fe0-44de-a7ac-0aa046712515
source-git-commit: d70d5df8b11c8500dbe4764b08e2627893f436f0
workflow-type: tm+mt
source-wordcount: '382'
ht-degree: 3%

---

# まとめ、次のステップ

おめでとうございます。「Web SDKを使用したAdobe Experience Cloudの実装」チュートリアルを完了しました。

これまでに達成したことをすべて簡単に確認しましょう。 次の条件を満たしている：

* 標準フィールドグループとカスタムフィールドグループを使用してスキーマを作成しました。
* データストリームを設定しました。
* タグプロパティを作成しました。
* データレイヤーから取得したフィールドを XDM に変換し、Platform Edge Networkに送信します。
* キャプチャされた同意および認証済みの ID。
* Web SDK実装を次のExperience Cloud アプリケーションに接続。
   * Adobe Experience Platform
   * Adobe Analytics
   * Adobe Audience Manager
   * Adobe Target
   * Adobe Journey Optimizer
* イベント転送で、Platform Edge Networkから Web フックにデータを転送しました。
* Adobe Experience Platform Debuggerを使用して実装を検証しました。

ジャーニーの次の段階である、独自の web サイトへのAdobe Experience Cloudの実装を開始する準備が整いました。

そして、学ぶべきことは常に多くあります！ 実装環境に基づいて作成するその他のコンテンツの推奨事項を次に示します。


* **Journey Optimizerでジャーニーをトリガー** します。 Luma web サイトに実装したイベントは、ジャーニーのトリガーに使用できます。 詳しくは、この [&#x200B; ビデオチュートリアル &#x200B;](https://experienceleague.adobe.com/ja/docs/journey-optimizer-learn/tutorials/journeys/use-case-transactional-journey) を参照してください。
* **Customer Journey Analyticsに接続** します。 [Platform データセット &#x200B;](setup-experience-platform.md) を作成した場合は、データセットをCustomer Journey Analyticsに接続できます。 詳しくは、この [&#x200B; ビデオチュートリアル &#x200B;](https://experienceleague.adobe.com/ja/docs/customer-journey-analytics-learn/tutorials/connections/connecting-customer-journey-analytics-to-data-sources-in-platform) を参照してください
* **Platform でセグメントを作成** します。 リアルタイム顧客プロファイル [&#x200B; に対して &#x200B;](setup-experience-platform.md) スキーマとデータセットを有効にした場合、web イベントに基づいてセグメントを作成し、これらのセグメントをReal-Time Customer Data Platformの宛先に送信できます。 セグメントビルダーについて詳しくは、この [&#x200B; ビデオチュートリアル &#x200B;](https://experienceleague.adobe.com/ja/docs/platform-learn/tutorials/audiences/create-audiences) を参照してください。
* **Platform Mobile SDKの実装**。 あるSDKを習得したので、別のことを学びましょう。 Adobe Experience Platform Mobile SDKは、モバイルアプリでExperience Cloudおよびサードパーティのサービスを強化するために使用されます。 同様の [Mobile SDKの実践チュートリアル &#x200B;](https://experienceleague.adobe.com/ja/docs/platform-learn/implement-mobile-sdk/overview) があります。 両方を完了して、デバイス間でのプロファイルの結合を確認します。
* **Experience Platformの詳細情報**。 他のソースからデータを取り込む方法については、[&#x200B; データアーキテクトおよびデータエンジニア向けAdobe Experience Platformの概要 &#x200B;](https://experienceleague.adobe.com/ja/docs/platform-learn/getting-started-for-data-architects-and-data-engineers/overview) を参照してください


>[!NOTE]
>
>Adobe Experience Platform Web SDKの学習にご協力いただき、ありがとうございます。 ご不明な点がある場合や、一般的なフィードバックを共有したい場合、または今後のコンテンツに関するご提案がある場合は、この [Experience League Community Discussion の投稿でお知らせください &#x200B;](https://experienceleaguecommunities.adobe.com/t5/adobe-experience-platform-data/tutorial-discussion-implement-adobe-experience-cloud-with-web/td-p/444996?profile.language=ja)
