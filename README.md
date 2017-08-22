SpreeCountyZone
===============

Add counties for calculating the tax rate

## Installation

1. Add this extension to your Gemfile with this line:
  ```ruby
  gem 'spree_county_zone', github: 'gofmanaa/spree_county_zone'
  ```

2. Install the gem using Bundler:
  ```ruby
  bundle install
  ```

3. Copy & run migrations
  ```ruby
  bundle exec rails g spree_county_zone:install
  ```
4. Load USA counties
    ```ruby
    rails spree_county_zone:load_us
    ```
5. Restart your server

  If your server was running, restart it so that it can find the assets properly.

## Testing

Be sure to bundle your dependencies and then create a dummy test app for the specs to run against.

$ bundle
$ bundle exec rake test_app
$ bundle exec rspec spec

## Contributing

If you'd like to contribute, please take a look at the
[instructions](CONTRIBUTING.md) for installing dependencies and crafting a good
pull request.

Copyright (c) 2017 Gofman A, released under the New BSD License
