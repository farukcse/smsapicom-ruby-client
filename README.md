# Smsapicom::Client

A ruby client to consume API of smsapi.com

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'smsapicom-client'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install smsapicom-client

## Usage
```ruby
Smsapicom::Client::SmsSender.call(to: '+8801717675187', message: 'hi', date: '1483983145')
```

Everything is self explanatory only thing to notice is that the date should be in unix timestamp.


## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/farukncse/smsapicom-ruby-client.


## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

