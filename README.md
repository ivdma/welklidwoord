# Welklidwoord

This gem wraps the most famous http://welklidwoord.nl

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'welklidwoord'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install welklidwoord

## Usage

Command-line:

```bash
welklidwoord heeft fiets
# Lidwoord dat bij 'fiets' hoort is 'De'

$ welklidwoord is pizza
# Lidwoord dat bij 'pizza' hoort is 'De'

$ welklidwoord hoort bij open-source
# Lidwoord dat bij 'open-source' hoort is 'De of het'
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release` to create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Todo

* Tests
  Will do that when official JSON or XML becomes available

## Contributing

1. Fork it ( https://github.com/ivdma/welklidwoord/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
