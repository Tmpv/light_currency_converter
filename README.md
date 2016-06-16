# LightCurrencyConvert

LightCurrency convert is a gem for currency convertion by given a currency course list.

## Install
Install the gem throught the gem command:
````bash
    gem install light_currency_convert
````
Or add to a Gemfile:
````ruby
    gem light_currency_convert
````
and run bundler:
````bash
    bundle install
````

## Usage
### Command line
Use can use the command line tool to convert one cyrrency to an other by giving the amount, froml_currency, to_currency to the command line tool:

````bash
    convert_currency 100 USD BGN
````
And you will get the following output:
````bash
    173.49
````
If only two arguments are given the program will output the course between the currencies.

````bash
    convert_currency USD BGN
    1.0 USD => 1.73488 BGN
````

The program uses the following default currency courses(that could not be up to date):

````json
    {
        "1 GBP" : "2.45986 BGN",
        "1 EUR" : "1.95462 BGN",
        "1 USD" : "1.73488 BGN",
        "1 TRY" : "0.59272 BGN",
        "1 CAD" : "1.33794 BGN",
        "1 CHF" : "1.80742 BGN",
        "1 RUB" : "0.02634 BGN",
        "1 AUD" : "1.27747 BGN",
        "1 DKK" : "0.26287 BGN",
        "100 CZK" : "7.24 BGN"
}
````

To supply yor own your own currency file by using the -s flag.

````bash
    convert_currency 1 USD BGN -s ./currencies.json
````

The json file must be formated as show in the example json.

### In a ruby project

First require the gem.
````ruby
    require 'light_currency_convert'
````
Create a currencies collection object:
````ruby
    collection = LightCurrencyConverter::CurrencyCollection.new(json_string)
````
Create a currencies processor object and run the process method:
````ruby
    processor = LightCurrencyConverter::Processor.new('USD', 'BGN', 100, collection)
    processor.convert
=> 173.49
````

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/tmpv/light_currency_convert. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.


## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

