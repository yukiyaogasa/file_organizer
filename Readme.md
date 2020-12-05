# FileOrganizer

Welcome to your new gem! In this directory, you'll find the files you need to be able to package up your Ruby library into a gem. Put your Ruby code in the file `lib/file_organizer`. To experiment with that code, run `bin/console` for an interactive prompt.

## 🏌️ Goal

- 指定したフォルダに保存されるファイルを自動で整理整頓する
  - 拡張子毎に専用のフォルダに移動
  - 拡張子毎にファイル名を編集 [Todo]
    - ex: test.text -> 2020_11_23_test.txt

## 👀 Details

- ファイル毎の移動先
  - text, pdf → Documents
  - png, jpeg, svg → Pictures
  - other... → Unsorted

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'file_organizer_rubo'
```

And then execute:

    $ bundle install

Or install it yourself as:

    $ gem install file_organizer_rubo

## Usage

TODO: Write usage instructions here

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/[USERNAME]/file_organizer. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [code of conduct](https://github.com/[USERNAME]/file_organizer/blob/master/CODE_OF_CONDUCT.md).

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the FileOrganizer project's codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/[USERNAME]/file_organizer/blob/master/CODE_OF_CONDUCT.md).

## 🧑🏻‍🔧 Buiding now...

- [ ] 拡張子の対応
  - [x] pic
  - [x] doc
  - [x] screenshot
  - [ ] other
- [ ] ファイル名の自動変更
- [x] gem 化

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
