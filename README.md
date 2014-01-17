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

The public api has 3 methods which return the ticker , market depth 
and current trades for a given pair(check bter for the available pairs)

```ruby
bt = Bter::Public.new

puts bt.ticker("btc_cny")
puts bt.depth("btc_cny")
puts bt.trades("btc_cny")
```
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
bt.order_status(order_id)
bt.cancel_order(order_id)
bt.buy(pair, amount)
bt.sell(pair, amount)
```

You can enable the logger for public and trading requests.
It logs successful or failed requests and response info.(off by default)
```ruby
bt = Bter::Public.new
bt.logging :on

bt2 = Bter::Trade.new
bt2.logging :on
```


Also check the two examples in the examples folder.

Licensed under MIT.


