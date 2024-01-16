---
title: まとめと次のステップ
description: チュートリアルを完了した後の次の作業
recommendations: display,noCatalog
source-git-commit: f08866de1bd6ede50bda1e5f8db6dbd2951aa872
workflow-type: tm+mt
source-wordcount: '390'
ht-degree: 3%

---

# まとめと次のステップ

おめでとうございます。「Web SDK を使用したAdobe Experience Cloudの実装」チュートリアルが完了しました。

私たちはあなたが達成したすべてを素早くレビューしましょう。 以下があります。

* 標準フィールドグループとカスタムフィールドグループを使用してスキーマを作成しました。
* データストリームを設定しました。
* タグプロパティを構築しました。
* データレイヤーからキャプチャされたフィールドを XDM に変換し、Platform Edge ネットワークに送信しました。
* 同意と認証済み ID をキャプチャします。
* Web SDK 実装を次のアプリケーションアプリケーションにExperience Cloudしました。
   * Adobe Experience Platform
   * Adobe Analytics
   * Adobe Audience Manager
   * Adobe Target
* イベント転送を使用して、Platform Edge Network から Web フックにデータを送信しました。
* 実装を検証し、Adobe Experience Platform Debugger。

これで、ジャーニーの次の段階、つまり独自の Web サイトにAdobe Experience Cloudを実装する準備が整いました。

そして、常に学ぶべきことが多い！ 実装時に作成する他のコンテンツの推奨事項を以下に示します。


* **Journey Optimizerでのジャーニーのトリガー**. Luma の Web サイトに実装したイベントは、ジャーニーのトリガーに使用できます。 詳しくは、こちらを参照してください。 [ビデオチュートリアル](https://experienceleague.adobe.com/docs/journey-optimizer-learn/tutorials/create-journeys/use-case-transactional-journey.html?lang=ja).
* **接続Customer Journey Analytics**. 作成した [Platform データセット](setup-experience-platform.md)を使用すると、データセットをCustomer Journey Analyticsに接続できます。 詳しくは、こちらを参照してください。 [ビデオチュートリアル](https://experienceleague.adobe.com/docs/customer-journey-analytics-learn/tutorials/connecting-customer-journey-analytics-to-data-sources-in-platform.html)
* **Platform でのセグメントの作成**. を有効にした場合、 [リアルタイム顧客プロファイルのスキーマとデータセット](setup-experience-platform.md)では、Web イベントに基づいてセグメントを構築し、それらを他のソースのデータと組み合わせて、Real-time Customer Data Platformの宛先に送信することができます。 セグメントビルダーの詳細については、この節を参照してください [ビデオチュートリアル](https://experienceleague.adobe.com/docs/platform-learn/tutorials/segments/create-segments.html).
* **Platform Mobile SDK の実装**. 1 つの SDK を習得したら、もう 1 つ学習しましょう。 Adobe Experience Platform Mobile SDK は、モバイルアプリでExperience Cloudとサードパーティのサービスを強化するために使用します。 似たようなものがある [Mobile SDK の実践チュートリアル](https://experienceleague.adobe.com/docs/platform-learn/implement-mobile-sdk/overview.html?lang=ja). 両方を完了し、デバイス間でプロファイルが結合されるのを確認します。
* **Experience Platformの詳細**. 他のソースからデータを取り込み、それを Web SDK データと組み合わせる方法について詳しくは、 [データアーキテクトおよびデータエンジニア向けAdobe Experience Platformの概要](https://experienceleague.adobe.com/docs/platform-learn/getting-started-for-data-architects-and-data-engineers/overview.html?lang=ja)


>[!NOTE]
>
>Adobe Experience Platform Web SDK の学習に時間を割いていただき、ありがとうございます。 ご質問がある場合、一般的なフィードバックを共有したい場合、または今後のコンテンツに関する提案がある場合は、こちらで共有してください [Experience Leagueコミュニティディスカッション投稿](https://experienceleaguecommunities.adobe.com/t5/adobe-experience-platform-launch/tutorial-discussion-implement-adobe-experience-cloud-with-web/td-p/444996)
