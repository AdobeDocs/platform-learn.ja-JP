---
title: まとめ、次のステップ
description: チュートリアルの完了後に行うこと
recommendations: display,noCatalog
exl-id: bb0ef04d-fd01-4c24-8670-a84a9e33f1b6
source-git-commit: 15bc08bdbdcb19f5b086267a6d94615cbfe1bac7
workflow-type: tm+mt
source-wordcount: '427'
ht-degree: 3%

---

# まとめ、次のステップ


>[!CAUTION]
>
>このチュートリアルの大きな変更は、2024 年 4 月 23 日火曜日（PT）に公開される予定です。 その後、多くの演習が変更され、すべてのレッスンを完了するには、最初からチュートリアルを再開する必要が生じる場合があります。

おめでとうございます。これで、「Web SDK を使用したAdobe Experience Cloudの実装」チュートリアルが完了しました。

これまでに達成したことをすべて簡単に確認しましょう。 次の条件を満たしている：

* 標準フィールドグループとカスタムフィールドグループを使用してスキーマを作成しました。
* データストリームを設定しました。
* タグプロパティを作成しました。
* データレイヤーから取得したフィールドを XDM に変換し、Platform Edge Networkに送信します。
* キャプチャされた同意および認証済みの ID。
* Web SDK 実装を次のExperience Cloudアプリケーションに接続しました。
   * Adobe Experience Platform
   * Adobe Analytics
   * Adobe Audience Manager
   * Adobe Target
* Platform Edge Networkから Web フックにデータを送信するために、イベント転送を使用しました。
* Adobe Experience Platform Debuggerを使用して実装を検証しました。

ジャーニーの次の段階である、独自の web サイトへのAdobe Experience Cloudの実装を開始する準備が整いました。

そして、学ぶべきことは常に多くあります！ 実装環境に基づいて作成するその他のコンテンツの推奨事項を次に示します。


* **Journey Optimizerでのジャーニーのトリガー**. Luma web サイトに実装したイベントは、ジャーニーのトリガーに使用できます。 詳しくは、こちらを参照してください。 [ビデオチュートリアル](https://experienceleague.adobe.com/docs/journey-optimizer-learn/tutorials/create-journeys/use-case-transactional-journey.html?lang=ja).
* **Customer Journey Analyticsを接続**. 作成した場合 [Platform データセット](setup-experience-platform.md)を選択すると、データセットをCustomer Journey Analyticsに接続できます。 詳しくは、こちらを参照してください。 [ビデオチュートリアル](https://experienceleague.adobe.com/docs/customer-journey-analytics-learn/tutorials/connecting-customer-journey-analytics-to-data-sources-in-platform.html)
* **Platform でのセグメントの作成**. を有効にした場合 [リアルタイム顧客プロファイルのスキーマとデータセット](setup-experience-platform.md)を使用すると、web イベントに基づいてセグメントを作成し、それらを他のソースのデータと組み合わせて、Real-time Customer Data Platform内の宛先に送信できます。 セグメントビルダーの詳細については、こちらを参照してください [ビデオチュートリアル](https://experienceleague.adobe.com/docs/platform-learn/tutorials/segments/create-segments.html).
* **Platform Mobile SDK の実装**. ある SDK をマスターしたので、別の SDK を学びましょう。 Adobe Experience Platform Mobile SDK は、モバイルアプリでExperience Cloudおよびサードパーティサービスを強化するために使用されます。 似たものがあります [mobile SDK の実践チュートリアル](https://experienceleague.adobe.com/docs/platform-learn/implement-mobile-sdk/overview.html?lang=ja). 両方を完了して、デバイス間でのプロファイルの結合を確認します。
* **Experience Platformの詳細情報**. で、他のソースからデータを取り込み、それを Web SDK データと組み合わせる方法について説明します。 [データアーキテクトおよびデータエンジニア向けAdobe Experience Platformの概要](https://experienceleague.adobe.com/docs/platform-learn/getting-started-for-data-architects-and-data-engineers/overview.html?lang=ja)


>[!NOTE]
>
>Adobe Experience Platform Web SDK の学習に時間を費やしていただき、ありがとうございます。 ご質問がある場合、一般的なフィードバックを共有する場合、将来のコンテンツに関する提案がある場合は、このページで共有します [Experience League コミュニティ ディスカッションの投稿](https://experienceleaguecommunities.adobe.com/t5/adobe-experience-platform-launch/tutorial-discussion-implement-adobe-experience-cloud-with-web/td-p/444996)
