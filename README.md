# PracticeReturnJob

いつか iOS エンジニアとして復帰した時用のリポジトリ

## このリポジトリで学べること

・ RxSwift の基本的な構文<br>
・ MVVM+RxSwift によるアーキテクチャ設計<br>
・ ライブラリを用いた遷移処理のファイル分割<br>
・ CollectionView, TableView などリスト表示<br>
・ PickerView, Validation 付き TextField などのカスタムコンポーネント※作成中<br>
・ テンプレートからのファイル作成<br>

## 基本構成

MVVM + RxSwift + Storyboard<br>

## 画面構成

ホーム（CollectionView）<br>
検索 ※作成中<br>
アイテム追加 ※作成中<br>
通知 ※作成中<br>
設定（TableView + RxDataSources）<br>

## 今後追加したいもの

SwiftUI との相互互換コード<br>
GitHub Actions, Bitrise, CircleCI などによる CI/CD 環境<br>
Makefile の作成<br>
SwiftGen の導入<br>

## コーディングルール

・ for-in 使っちゃだめ、forEach 使ってね<br>
・ State はできる限り ViewModel で保持しようね<br>
・ 遷移に関する処理は、Coordinator に任せよう<br>
