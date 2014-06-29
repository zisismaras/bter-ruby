require 'bter'

#the public api has 3 methods which return the ticker , market depth 
#and current trades for a given pair

bt = Bter::Public.new

puts bt.ticker("btc_cny")

puts bt.depth("btc_cny")

puts bt.trades("btc_cny")

#all methods return a hash
