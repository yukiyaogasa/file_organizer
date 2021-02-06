# file_organizer 📁

### 🏌️what is this?

- 指定したフォルダに保存されるファイルを自動で整理整頓する

## Usage

```
bin/start
```

## 🧑🏻‍🔧 Buiding now...

- [ ] 拡張子の対応
  - [x] pic
  - [x] doc
  - [x] screenshot
  - [ ] other
- [ ] ファイル名の自動変更
- [x] gem 化

### 👀 Details

- ファイル毎の移動先
  - text, pdf → Documents
  - png, jpeg, svg → Pictures
  - other... → Unsorted

**クラス**

- Obsever
  - 監視プログラム(fssm)の実行
- Organizer
  - 拡張子毎にフォルダに振り分け
- Organizable
  - 拡張子毎に保存先フォルダを返却
    - 拡張子を抜き取る
    - 拡張子毎にファイルに対応するフォルダを選択

## 🛠 Tools

- Fssm ([ttilley/fssm](https://github.com/ttilley/fssm))
