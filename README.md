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
