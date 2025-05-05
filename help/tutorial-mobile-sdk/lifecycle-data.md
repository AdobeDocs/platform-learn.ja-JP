---
title: Platform Mobile SDK を使用したライフサイクルデータの収集
description: モバイルアプリでライフサイクルデータを収集する方法を説明します。
jira: KT-14630
exl-id: 75b2dbaa-2f84-4b95-83f6-2f38a4f1d438
source-git-commit: 25f0df2ea09bb7383f45a698e75bd31be7541754
workflow-type: tm+mt
source-wordcount: '601'
ht-degree: 2%

---

# ライフサイクルデータの収集

モバイルアプリでライフサイクルデータを収集する方法を説明します。

Adobe Experience Platform Mobile SDK ライフサイクル拡張機能を使用すると、モバイルアプリからライフサイクルデータを収集できます。 Adobe Experience Platform Edge Network拡張機能は、このライフサイクルデータを Platform Edge Networkに送信し、そこでデータストリーム設定に従って他のアプリケーションやサービスに転送されます。 [ ライフサイクル拡張 ](https://developer.adobe.com/client-sdks/documentation/lifecycle-for-edge-network/) について詳しくは、製品ドキュメントを参照してください。


## 前提条件

* SDK がインストールおよび設定された状態で、アプリケーションが正常に構築および実行されました。 このレッスンでは、すでにライフサイクルの監視を開始しています。 確認するには、[SDK のインストール - AppDelegate の更新 ](install-sdks.md#update-appdelegate) を参照してください。
* [ 前のレッスン ](install-sdks.md) で説明したように、Assurance 拡張機能を登録しました。

## 学習目標

このレッスンでは、次の操作を行います。

<!--
* Add lifecycle field group to the schema.
* -->
* アプリがフォアグラウンドとバックグラウンドの間を移動するときに正しく開始/一時停止することで、正確なライフサイクル指標を有効にします。
* アプリから Platform Edge Networkにデータを送信します。
* Assurance で検証します。

<!--
## Add lifecycle field group to schema

The Consumer Experience Event field group you added in the [previous lesson](create-schema.md) already contains the lifecycle fields, so you can skip this step. If you don't use Consumer Experience Event field group in your own app, you can add the lifecycle fields by doing the following:

1. Navigate to the schema interface as described in the [previous lesson](create-schema.md).
1. Open the **Luma Mobile App Event Schema** schema and select **[!UICONTROL Add]** next to Field groups.
    ![select add](assets/lifecycle-add.png)
1. In the search bar, enter "lifecycle".
1. Select the checkbox next to **[!UICONTROL AEP Mobile Lifecycle Details]**.
1. Select **[!UICONTROL Add field groups]**.
    ![add field group](assets/lifecycle-lifecycle-field-group.png)
1. Select **[!UICONTROL Save]**.
    ![save](assets/lifecycle-lifecycle-save.png)
-->

## 実装の変更

これで、プロジェクトを更新してライフサイクルイベントを登録できます。

1. Xcode プロジェクトナビゲーターで **[!DNL Luma]** > **[!DNL Luma]** > **[!UICONTROL SceneDelegate]** に移動します。

1. アプリケーションがバックグラウンドステートから再開される場合、iOSがローンチ時に `sceneWillEnterForeground:` デリゲートメソッドを呼び出す可能性があります。ここで、ライフサイクル開始イベントをトリガーにします。 `func sceneWillEnterForeground(_ scene: UIScene)` に次のコードを追加します。

   ```swift
   // When in foreground start lifecycle data collection
   MobileCore.lifecycleStart(additionalContextData: nil)
   ```

1. アプリがバックグラウンドに入ると、アプリの `sceneDidEnterBackground:` デリゲートメソッドからライフサイクルデータ収集を一時停止する必要があります。 `func sceneDidEnterBackground(_ scene: UIScene)` に次のコードを追加します。

   ```swift
   // When in background pause lifecycle data collection
   MobileCore.lifecyclePause()
   ```

## Assurance での検証

1. シミュレーターまたはデバイスを Assurance に接続するには、「[ 設定手順 ](assurance.md#connecting-to-a-session)」セクションを確認してください。
1. アプリをバックグラウンドに送信します。 Assurance UI で **[!UICONTROL LifecyclePause]** イベントを確認します。
1. アプリをフォアグラウンドに移動します。 Assurance UI で **[!UICONTROL LifecycleResume]** イベントを確認します。
   ![ ライフサイクルの検証 ](assets/lifecycle-lifecycle-assurance.png)


## Platform Edge Networkへのデータの転送

前の演習では、フォアグラウンドおよびバックグラウンドイベントをAdobe Experience Platform Mobile SDK にディスパッチします。 これらのイベントを Platform Edge Networkに転送するには：

1. タグプロパティで **[!UICONTROL ルール]** を選択します。
   ![ ルールの作成 ](assets/rule-create.png)
1. 使用するライブラリとして **[!UICONTROL 初期ビルド]** を選択します。
1. **[!UICONTROL 新規ルールを作成]** を選択します。
   ![ 新しいルールの作成 ](assets/rules-create-new.png)
1. **[!UICONTROL ルールの作成]** 画面で、「**[!UICONTROL 名前]**」に `Application Status` と入力します。
1. **[!UICONTROL EVENTS]** の下の ![ 追加 ](https://spectrum.adobe.com/static/icons/workflow_18/Smock_AddCircle_18_N.svg)**[!UICONTROL 追加]** を選択します。
   ![ ルールを作成ダイアログ ](assets/rule-create-name.png)
1. **[!UICONTROL イベント設定]** 手順で、次の操作を行います。
   1. **[!UICONTROL 拡張機能]** として **[!UICONTROL Mobile Core]** を選択します。
   1. **[!UICONTROL イベントタイプ]** として **[!UICONTROL フォアグラウンド]** を選択します。
   1. 「**[!UICONTROL 変更を保持]**」を選択します。

      ![ ルールイベントの設定 ](assets/rule-event-configuration.png)
1. **[!UICONTROL ルールを作成]** 画面に戻り、![ モバイルコア – 前景 **[[!UICONTROL の横にある**&#x200B;[!UICONTROL &#x200B; 追加 &#x200B;]&#x200B;**]](https://spectrum.adobe.com/static/icons/workflow_18/Smock_AddCircle_18_N.svg) 追加]** を選択します。
   ![ 次のイベントの設定 ](assets/rule-event-configuration-next.png)
1. **[!UICONTROL イベント設定]** 手順で、次の操作を行います。
   1. **[!UICONTROL 拡張機能]** として **[!UICONTROL Mobile Core]** を選択します。
   1. **[!UICONTROL イベントタイプ]** として **[!UICONTROL 背景]** を選択します。
   1. 「**[!UICONTROL 変更を保持]**」を選択します。

      ![ ルールイベントの設定 ](assets/rule-event-configuration-background.png)
1. **[!UICONTROL ルールを作成]** 画面に戻り、「**[!UICONTROL ACTIONS]** の下の ![ 追加 ](https://spectrum.adobe.com/static/icons/workflow_18/Smock_AddCircle_18_N.svg)**[!UICONTROL 追加]** を選択します。
   ![ ルール追加アクション ](assets/rule-action-button.png)
1. **[!UICONTROL アクションの設定]** 手順で、次の操作を行います。
   1. **[!UICONTROL Extension]** として **0&rbrace;AdobeエクスペリエンスEdge Network&rbrace; を選択します。**
   1. **[!UICONTROL アクションタイプ]** として「**[!UICONTROL Edge Networkにイベントを転送]**」を選択します。
   1. 「**[!UICONTROL 変更を保持]**」を選択します。

      ![ ルールアクションの設定 ](assets/rule-action-configuration.png)
1. **[!UICONTROL ライブラリに保存]** を選択します。
   ![ ルール – ライブラリに保存 ](assets/rule-save-to-library.png)
1. **[!UICONTROL ビルド]** を選択して、ライブラリを再構築します。
   ![ ルール – ビルド ](assets/rule-build.png)

プロパティの作成が完了すると、イベントは Platform Edge Networkに送信され、データストリームの設定に従って他のアプリケーションやサービスに転送されます。

Assurance に XDM データを含む **[!UICONTROL アプリケーション終了（バックグラウンド）]** および **[!UICONTROL アプリケーション起動（フォアグラウンド）]** イベントが表示されます。

![Platform Edgeに送信されたライフサイクルを検証 ](assets/lifecycle-edge-assurance.png)

>[!SUCCESS]
>
>これで、アプリケーションステート（フォアグラウンド、バックグラウンド）イベントをAdobe Experience Platform Edge Networkと、データストリームで定義したすべてのサービスに送信するようにアプリを設定しました。
>
> Adobe Experience Platform Mobile SDK の学習に時間を費やしていただき、ありがとうございます。 ご不明な点がある場合や、一般的なフィードバックをお寄せになる場合、または今後のコンテンツに関するご提案がある場合は、この [Experience League コミュニティ ディスカッションの投稿でお知らせください ](https://experienceleaguecommunities.adobe.com/t5/adobe-experience-platform-data/tutorial-discussion-implement-adobe-experience-cloud-in-mobile/td-p/443796)

次のトピック：**[イベント・データの追跡](events.md)**
