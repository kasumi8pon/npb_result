# NpbResult

get NPB game result

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'npb_result'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install npb_result

## Usage

```
$ npb_result
> 【結果】ＤｅＮＡ (3) - (2) 中日
  【結果】広島 (3) - (6) 巨人
  【結果】阪神 (1) - (2) ヤクルト
  【結果】ソフトバンク (3) - (1) 西武
  【結果】日本ハム (3) - (1) オリックス
  【結果】ロッテ (4) - (9) 楽天
```

or

```
NpbResult.list
#=> [
      {:home_team=>"中日", :home_score=>2, :away_team=>"ＤｅＮＡ", :away_score=>3, :status=>"結果"},
      {:home_team=>"巨人", :home_score=>6, :away_team=>"広島", :away_score=>3, :status=>"結果"},
      {:home_team=>"ヤクルト", :home_score=>2, :away_team=>"阪神", :away_score=>1, :status=>"結果"},
      {:home_team=>"西武", :home_score=>1, :away_team=>"ソフトバンク", :away_score=>3, :status=>"結果"},
      {:home_team=>"オリックス", :home_score=>1, :away_team=>"日本ハム", :away_score=>3, :status=>"結果"}, 
      {:home_team=>"楽天", :home_score=>9, :away_team=>"ロッテ", :away_score=>4, :status=>"結果"}
    ]

NpbResult.list(date: Date.today, team: "オリックス")
#=> [{:home_team=>"オリックス", :home_score=>1, :away_team=>"日本ハム", :away_score=>3, :status=>"結果"}]
```


## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/[USERNAME]/npb_result. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the NpbResult project’s codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/[USERNAME]/npb_result/blob/master/CODE_OF_CONDUCT.md).
