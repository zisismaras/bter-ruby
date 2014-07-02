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
bt.tickers
bt.ticker("btc_cny")
bt.depth("btc_cny")
bt.info
bt.details
bt.trades("btc_cny", tid) # alias .history
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
bt.my_trades
bt.order_status(order_id)
bt.cancel_order(order_id)
bt.buy(pair, amount, rate)
bt.sell(pair, amount, rate)
```
rate parameter is optional on buy and sell methods and if omitted the current rate will be used.


Also check the two examples in the examples folder.

Licensed under MIT.


