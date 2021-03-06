# KickinRistretto


[![Gem](https://img.shields.io/gem/v/kickin_ristretto.svg)](https://rubygems.org/gems/kickin_ristretto)
[![GitHub issues](https://img.shields.io/github/issues/kickinespresso/kickin_ristretto.svg)](https://github.com/kickinespresso/kickin_ristretto/issues)
[![contributions welcome](https://img.shields.io/badge/contributions-welcome-brightgreen.svg?style=flat)](https://github.com/dwyl/esta/issues)
[![Packagist](https://img.shields.io/packagist/l/doctrine/orm.svg)](LICENSE.md)

Rake tasks that check a rails project for unused assets and removes them.

## Features

- Find and Remove unused assets in a Rails Project
- Generate a PDF Audit Report of all the images in the project

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'kickin_ristretto'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install kickin_ristretto

## Usage

    $ rake kickin_ristretto:search_images
    
    $ rake kickin_ristretto:image_audit_report

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/kickinespresso/kickin_ristretto. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the KickinRistretto project’s codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/kickinespresso/kickin_ristretto/blob/master/CODE_OF_CONDUCT.md).

## Sponsors

This project is sponsored by [KickinEspresso](https://kickinespresso.com/?utm_source=github&utm_medium=sponsor&utm_campaign=opensource)

## Build

    gem build kickin_ristretto.gemspec
        
