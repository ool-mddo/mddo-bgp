# mddo-bgp

## 概要

ISPのバックボーンネットワークを模擬したサンプルコンフィグです。
(参照: [playground](https://github.com/ool-mddo/playground), ["環境コピー" デモ](https://github.com/ool-mddo/playground/blob/main/demo/copy_to_emulated_env/README.md))

## ディレクトリ構成

ディレクトリ構成については [デモシステムの構造](https://github.com/ool-mddo/playground/blob/main/doc/system_architecture.md) を参照してください。Batfish利用に合わせたディレクトリ・データファイルの他に、デモで使用する情報を保管するディレクトリがあります。

* original_asis/
  * batfish/ : Batfish用設定
  * hosts/ : Batfish用設定(デモ用ノード情報)
  * configs/ : コンフィグファイル
  * external_as_topology/ : デモ用, 外部ASを保管するためのスクリプト(外部ASトポロジ生成スクリプト)
  * flowdata/ : デモ用, PNIフローデータ

## 外部トポロジ生成スクリプト

playground v1.5.2 時点では以下の仕様になっています。
* [netomox-exp](https://github.com/ool-mddo/netomox-exp) は、外部ASトポロジ取得APIが呼ばれたら `<snapshot>/external_as_topology/main.rb` をロードして実行する (netomox-exp の REST API 経由で実行される)
* `external_as_topology/main.rb` は外部ASトポロジデータ(RFC8345 JSON)を標準出力に出力する
* netomox-exp は出力されたトポロジデータをAPIの応答として返す
