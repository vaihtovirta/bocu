# CoubApi

[![Build Status](https://travis-ci.org/vaihtovirta/coub_api.svg?branch=master)](https://travis-ci.org/vaihtovirta/coub_api)

API wrapper for [Coub](http://coub.com)

Powered by [Her](https://github.com/remiprev/her) — ORM for REST API.

Currently under development, so it supports only several public API methods.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'coub_api', github: 'https://github.com/vaihtovirta/coub_api.git'
```

## Usage

You can check official Coub API docs [here](http://coub.com/dev/docs/Coub+API/Overview).

##### Basic usage:

```ruby
require 'coub_api'

coubs = CoubApi::Coub.search('optimism')
coubs = coubs.order_by(:likes_count).page(5).per(25).fetch
# returns array of coubs, wrapped with Her::Model

coubs.first.attributes
# => returns Big Coub JSON, most part is omitted
# => {"flag"=>nil, "abuses"=>nil, "recoubs_by_users_channels"=>nil, 
# "recoub"=>nil, "like"=>nil, "in_my_best2015"=>false, 
# "type"=>"Coub::Simple", "permalink"=>"5kirj"...
```

##### Timeline:

[Related docs](https://coub.com/dev/docs/Coub+API/Timelines)

```ruby
require 'coub_api'

CoubApi::Coub.by_tag('games').fetch # coubs by tag
CoubApi::Coub.hot.fetch # timeline of the Hot section

# timeline of the Explore section categories
CoubApi::Coub.random.fetch
CoubApi::Coub.newest.fetch
CoubApi::Coub.coub_of_the_day.fetch
```

##### Using chainable scopes for pagination and ordering:

```ruby
require 'coub_api'

coubs = CoubApi::Coub.search('drive')
coubs = coubs.order_by(:views_count).per_page(5).page(2)

result = coubs.fetch # Returns array of 5 hot coubs starting from page 2
result.metadata # {:page=>"2", :total_pages=>504, :per_page=>"5"}
result.count # 5
```

## TODO

- Improve documentaion
- More tests
- More supported methods
- Authentication(?)

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake test` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/vaihtovirta/coub_api.


## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).
