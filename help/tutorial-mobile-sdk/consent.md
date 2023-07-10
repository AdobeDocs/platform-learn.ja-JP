---
title: 同意
description: モバイルアプリに同意を実装する方法を説明します。
feature: Mobile SDK,Consent
exl-id: 08042569-e16e-4ed9-9b5a-864d8b7f0216
source-git-commit: adbe8f4476340abddebbf9231e3dde44ba328063
workflow-type: tm+mt
source-wordcount: '373'
ht-degree: 6%

---

# 同意

モバイルアプリに同意を実装する方法を説明します。

Adobe Experience Platform Consent モバイル拡張機能は、Adobe Experience Platform Mobile SDK と Edge Network 拡張機能を使用する場合に、モバイルアプリから同意設定を収集できます。 詳しくは、 [同意拡張](https://developer.adobe.com/client-sdks/documentation/consent-for-edge-network/)（ドキュメント内）

## 前提条件

* SDK が正常に構築され、インストールされ、設定された状態でアプリが実行されました。

## 学習内容

このレッスンでは、次の操作を実行します。

* ユーザーに同意を求めるプロンプトを表示します。
* ユーザーの応答に基づいて拡張機能を更新します。
* 現在の同意状態を取得する方法を説明します。

## 同意を求める

最初からチュートリアルに従った場合は、 **[!UICONTROL デフォルトの同意レベル]** を「保留中」に設定します。 データの収集を開始するには、ユーザーから同意を得る必要があります。 このチュートリアルでは、地域の同意のベストプラクティスを参照する実際のアプリで、アラートを使用して単に尋ねることで同意を得ます。

1. ユーザーに 1 回だけ問い合わせたい場合。 これを管理する簡単な方法の 1 つは、 `UserDefaults`.
1. `Home.swift` に移動します。
1. `viewDidLoad()` に次のコードを追加します。

   ```swift
   let defaults = UserDefaults.standard
   let consentKey = "askForConsentYet"
   let hidePopUp = defaults.bool(forKey: consentKey)
   ```

1. ユーザーがこのアラートをまだ確認していない場合は、表示し、応答に基づいて同意を更新します。 `viewDidLoad()` に次のコードを追加します。

   ```swift
   if(hidePopUp == false){
       //Consent Alert
       let alert = UIAlertController(title: "Allow Data Collection?", message: "Selecting Yes will begin data collection", preferredStyle: .alert)
       alert.addAction(UIAlertAction(title: "Yes", style: .default, handler: { action in
           //Update Consent -> "yes"
           let collectConsent = ["collect": ["val": "y"]]
           let currentConsents = ["consents": collectConsent]
           Consent.update(with: currentConsents)
           defaults.set(true, forKey: consentKey)
       }))
       alert.addAction(UIAlertAction(title: "No", style: .cancel, handler: { action in
           //Update Consent -> "no"
           let collectConsent = ["collect": ["val": "n"]]
           let currentConsents = ["consents": collectConsent]
           Consent.update(with: currentConsents)
           defaults.set(true, forKey: consentKey)
       }))
       self.present(alert, animated: true)
   }
   ```


## 現在の同意状態を取得する

同意モバイル拡張機能では、現在の同意値に基づいて、トラッキングを自動的に抑制/追加/許可します。 また、現在の同意状態に自分でアクセスすることもできます。

1. `Home.swift` に移動します。
1. `viewDidLoad()` に次のコードを追加します。

```swift
Consent.getConsents{ consents, error in
    guard error == nil, let consents = consents else { return }
    guard let jsonData = try? JSONSerialization.data(withJSONObject: consents, options: .prettyPrinted) else { return }
    guard let jsonStr = String(data: jsonData, encoding: .utf8) else { return }
    print("Consent getConsents: ",jsonStr)
}
```

上記の例では、同意ステータスをコンソールに表示するだけです。 実際のシナリオでは、これを使用して、ユーザーに表示されるメニューやオプションを変更できます。

## アシュランスで検証

1. 以下を確認します。 [アシュランス](assurance.md) レッスン。
1. AEM Desktop App をインストールします。
1. アシュランスで生成された URL を使用して、アプリを起動します。
1. 上記のコードを正しく追加した場合は、同意するよう求められます。 選択 **はい**.
   ![同意ポップアップ](assets/mobile-consent-validate.png)
1. 次のように表示されます。 **[!UICONTROL 同意設定が更新されました]** イベントが Assurance UI に表示されます。
   ![同意を検証](assets/mobile-consent-update.png)

次へ： **[ライフサイクルデータの収集](lifecycle-data.md)**

>[!NOTE]
>
>Adobe Experience Platform Mobile SDK の学習に時間を割いていただき、ありがとうございます。 ご質問がある場合、一般的なフィードバックを共有したい場合、または今後のコンテンツに関する提案がある場合は、こちらで共有してください [Experience Leagueコミュニティディスカッション投稿](https://experienceleaguecommunities.adobe.com/t5/adobe-experience-platform-launch/tutorial-discussion-implement-adobe-experience-cloud-in-mobile/td-p/443796)