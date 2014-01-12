require 'bter-ruby'

bt = Bter::Trade.new

#supply your key and secret
bter.key = "my key"
bter.secret = "my secret"

#your funds
puts bt.get_info

#your orders
puts bt.active_orders

#supply an order id and get its status
puts bt.order_status(123456)

#cancel and order with its id
puts bt.cancel_order(123456)

#supply the buy and sell methods with a coin pair and an amount
puts bt.buy("btc_cny", 50)
puts bt.sell("btc_cny", 50)

#all methods return a hash
