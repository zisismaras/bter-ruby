require 'bter'

bt = Bter::Trade.new

#supply your key and secret
bt.key = "my key"
bt.secret = "my secret"

#your funds
puts bt.get_info

#your orders
puts bt.active_orders

#your trades for a given pair
puts bt.my_trades('ltc_btc')

#supply an order id and get its status
puts bt.order_status(123456)

#cancel and order with its id
puts bt.cancel_order(123456)

#supply the buy and sell methods with a coin pair and an amount
#rate parameter is optional and if omitted the current rate will be used.
puts bt.buy("btc_cny", 50, some_rate)
puts bt.sell("btc_cny", 50, some_rate)

#all methods return a hash
