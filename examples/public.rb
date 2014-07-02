require 'bter'

bt = Bter::Public.new

#returns all available pairs
puts bt.pairs

#returns tickers for all pairs
puts bt.tickers

#ticker only for one pair
puts bt.ticker("btc_cny")

#the market depth of a pair
puts bt.depth("btc_cny")

#tid is optional
#the method returns at most 1,000 trade history records after tid
#if omitted will return the most recent 80 trade history records.
puts bt.trades("btc_cny", 20)

#all methods return a hash
