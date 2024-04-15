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

## 外部ASトポロジ生成スクリプト

playground/v1.7.0 (mddo-bgp/v0.2.0) 時点では以下の仕様になっています。
* [netomox-exp](https://github.com/ool-mddo/netomox-exp) は、外部ASトポロジ取得APIが呼ばれたら `<snapshot>/external_as_topology/<usecase>/main.rb` をロードする。
  * `main.rb` には `generate_topology` (関数) を定義しておく。
  * netomox-exp は `generate_topology` を、API実行(POST)されたときの `options` で指定されたデータを引数として実行する。
* `generate_topology` は外部ASトポロジデータ (RFC8345) を返す
* netomox-exp は出力されたトポロジデータをAPIの応答として返す

注意事項
* ユースケース名はデモシナリオに応じて定義されます
* `main.rb` というファイル名は固定
  * `generate_topology` という関数名は固定、引数は1つのHashとして受け取ります。
  * トポロジデータ(RFC8345 Hash)を返します。
* `main.rb` から他のファイルにある関数をロードして使用する場合、`require` ではなく `load` を使用してください
  * 再起動忘れによるトラブル防止のため: `require` は同じファイルを複数回ロードしません。そのため、外部ASトポロジスクリプトを変更した際に netomox-exp の再起動が必要になります。

```text
REST              load                                    load
----> netomox-exp ----> main.rb, #generate_topology(Hash) ----> (other scripts)
<----             <----
external-AS topology data (as JSON)
```
