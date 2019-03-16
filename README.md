# dark-sky

Crystal implementation of the DarkSky weather API

Based primarily the Go implementation.

## Installation

1. Add the dependency to your `shard.yml`:
```yaml
dependencies:
  dark-sky:
    github: dscottboggs/dark-sky
```
2. Run `shards install`

## Usage

```crystal
require "dark-sky"

DarkSky.api_key = ENV["darksky_api_key"]? || "your-api-key-here"

weather = DarkSky::Forecast.new(longitude: -58.47028, latitude: -34.52959)
weather.retreive.currently # current weather
weathe.at 1.day.from_now # weather tomorrow.

```

## Contributing

1. Fork it (<https://github.com/dscottboggs/dark-sky/fork>)
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request

## Contributors

- [D. Scott Boggs](https://github.com/dscottboggs) - creator and maintainer
