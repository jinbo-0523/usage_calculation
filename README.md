
# README

## 飲食店向け 食材使用量計算アプリ Genka!
___


  ### Demo
  ___



  ### アプリケーションの概要
___
  - 制作背景
    - 飲食店で働いていた際、課題のひとつだった ** 『発注を教える』 **という作業をどうにか簡単に解決できないかと考えていました。
    店舗責任者レベルなら慣れれば普段の使用量・売上・感覚で判断できますが、部下やアルバイトに教えるとなると教育に投下する時間がかなり必要になります。
    ###### **早期習得には『時間をかけてじっくり教える』か『教える相手に依存する』のどちらか**になります。
    発注を教えるには食材の正確な使用量を把握する必要があるため細かい計算が必須になります。**このアプリではその『細かい計算』の部分を簡略化するために制作しました。**
  - 内容説明
    - 飲食店の管理項目の一つ、原価を安定させる事・発注のハードルを下げる事を目的に開発しました。
      このアプリが活きるシーンは主に2つです
        1. 直近から7日毎に表示しているので一週間の使用量の遷移がわかる
        
        2. 日々の食材使用量を細々計算しなくてもメニューの出数さえ入力すれば簡単に把握できる
        
        
        ##### その結果
         - ⭕️必ずしも責任者が発注をしなくてもよくなる
         - ⭕️翌日以降の発注の参考になります
         - ⭕️1日の最後に出数を入れればその日の食材使用量がひと目でわかるので経験の浅いアルバイトでも発注が可能になります。


  ### アプリケーションの機能
  ___
  - ログイン/ロッグアウト機能会（会社名でログイン）
  - 業態（ブランド）の登録と削除
  - 店舗の登録・編集・削除
    - 店舗には業態（ブランド）と関連付け
  - 職位の登録・編集・削除
  - ユーザーの登録・編集・削除
    - ユーザーは職位と関連付け
  - 食材の登録・編集・削除
  - レシピの登録・編集・削除
  - 使用量計算用レポートの登録・編集
  - 使用量計算用レポートを店舗毎に一覧
  - レポート作成時に使用した食材の量が計算される
  - 各設定画面での検索機能


 ### ER図
  ___
  ![ER図](https://i.gyazo.com/db64ceb9416f35e3bf7b4c8a59793ca5.png)
 
 
 ### 開発環境
  ___

  - 開発環境
      - Ruby          '2.6.5'
      - Ruby on Rails '~> 6.0.3', '>= 6.0.3.3'
      - postgresql
      - Github
      - AWS
      - VScode
      - Sass
      - jQuery
      - bootstrap


  ###  Gem
  ___
  -  devise
  -  kaminari
  -  holiday_japan
  -  rails-i18n
  -  devise-i18n
  -  devise-bootstrap-views
  -  cocoon
  -  ransack
  -  pry-byebug
  -  bullet



  ### リンク(本番環境)
  ___
  http://usage-calculation.com/



  ### サンプル
  ___
  - テストユーザー
      - 会社名
          - 
      - Eメール
          - 
      - パスワード
          - 
  
