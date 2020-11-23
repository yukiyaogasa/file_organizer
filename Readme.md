## 🤩 Goal

- Download フォルダに保存されるファイルを自動で整理整頓する
  - 拡張子毎にフォルダを用意
  - ファイル保存時にファイルの拡張子を確認して、専用のフォルダに移動

## 👀 Details

- ファイル毎の移動先
  - text, pdf → Document
  - png, jpeg, svg → Pictures
  - other... → Unsorted

**クラス**

- Obsever
  - 監視プログラム(fssm)の実行
- Organizer(file_name)
  - 拡張子毎にフォルダに振り分け
    - 拡張子毎に保存先フォルダを決定
      - 拡張子を抜き取る
      - 拡張子毎にファイルに対応するフォルダを選択

## 😵Questions

- プログラムの常駐のさせ方
  - Cron で毎回プログラムを起動させる？🤔

## 🛠 Tools

- Fssm

[ttilley/fssm](https://github.com/ttilley/fssm)

## 🔎 References

[https://www.virment.com/ruby-fssm/](https://www.virment.com/ruby-fssm/)

[ディレクトリ内のファイル追加・削除・更新を監視する！ - 今からお前んちこいよ](https://www.hakopako.net/entry/2016/06/03/171853)
