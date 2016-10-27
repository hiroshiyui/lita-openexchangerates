# lita-openexchangerates

Lita handler for [Open Exchange Rates](https://openexchangerates.org/)

## Installation

Add lita-openexchangerates to your Lita instance's Gemfile:

``` ruby
gem "lita-openexchangerates"
```

## Configuration

Get your APP ID from [Open Exchange Rates](https://openexchangerates.org/) and give this configuration in your `lita_config.rb`:

    config.handlers.openexchangerates.app_id = "YOUR_APP_ID_HERE"

## Usage

* Lita: currencies - Show valid currencies
* Lita: exchange FROM TO - Show exchange rate FROM for TO (e.g: `exchange TWD JPY`)
