# Bter-Ruby [![Build Status](https://travis-ci.org/zisismaras/bter-ruby.svg?branch=master)](https://travis-ci.org/zisismaras/bter-ruby)[![Gem Version](https://badge.fury.io/rb/bter-ruby.svg)](http://badge.fury.io/rb/bter-ruby)
Ruby api for the bter.com cryptocurrency exchange

Install with
```ruby
gem install bter-ruby
```
and then require in your project
```ruby
require 'bter'
```
The library has two parts , one for the public api and one for the trading one.

The public api has the following methods

```ruby
bt = Bter::Public.new
bt.pairs
bt.tickers
bt.ticker(pair)
bt.depth(pair)
bt.info
bt.details
bt.trades(pair, tid) # alias .history
```
tid parameter is optional on trades method and if omitted will return the most recent 80 trade history records.


To use the trading api , you need to supply your key and secret
```ruby
bt = Bter::Trade.new

bt.key = "my key"
bt.secret = "my secret"
```
Then you can use the available methods:
```ruby
bt.get_info
bt.active_orders
bt.my_trades(pair)
bt.order_status(order_id)
bt.cancel_order(order_id)
bt.buy(pair, amount, rate)
bt.sell(pair, amount, rate)
```
rate parameter is optional on buy and sell methods and if omitted the current rate will be used.


Also check the two examples in the examples folder.

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request

Licensed under MIT.


