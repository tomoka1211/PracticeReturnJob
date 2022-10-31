# Template

MVVM アーキテクチャをベースとしたテンプレートファイル

## 使い方

導入時、テンプレートファイル変更時にやること<br>
・カレントディレクトリ移動<br>
`sh copy_templates.sh`

## 注意点

このプロジェクト以外で利用するためには画面生成のために、<br>
以下のファイル、ライブラリの追加が必要になります。<br>
それぞれ Podfile, ディレクトリ内に追加してください<br>
ファイル：<br>
StoryboardInstantiable.swift<br>
<br>
ライブラリ：<br>
RxCocoa
RxSwift
<br>
