# PracticeReturnJob
いつかiOSエンジニアとして復帰した時用のリポジトリ

## このリポジトリで学べること
・ RxSwiftの基本的な構文<br>
・ MVVM+RxSwiftによるアーキテクチャ設計<br>
・ ライブラリを用いた遷移処理のファイル分割<br>
・ CollectionView, TableViewなどリスト表示<br>
・ PickerView, Validation付きTextFieldなどのカスタムコンポーネント※作成中<br>

## 基本構成
MVVM + RxSwift + Storyboard<br>

## 画面構成
ホーム(CollectionView)　<br>
検索 ※作成中<br>
アイテム追加 ※作成中<br>
通知 ※作成中<br>
設定(TableView + RxDataSources)<br>

## 今後追加したいもの
テンプレートの作成<br>
SwiftUIとの相互互換コード<br>
Github Actions, Bitrise, CircleCIなどによるCI/CD環境<br>
Makefileの作成<br>
SwiftGenの導入<br>

## コーディングルール
・ for-in使っちゃだめ、forEach使ってね<br>
・ Stateはできる限りViewModelで保持しようね<br>
・ 遷移に関する処理は、Coordinatorに任せよう<br>
