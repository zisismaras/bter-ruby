require_relative 'request.rb'

module Bter
  class Trade
    include Request
  
    attr_accessor :key, :secret
       
    def get_info    
      query = trade_request "getfunds"
      info = JSON.parse query, {:symbolize_names => true}    
    end
    
    def active_orders
      query = trade_request "orderlist"
      info = JSON.parse query, {:symbolize_names => true}
    end 
    
    def trade(*params)
      query = trade_request "placeorder", params
      info = JSON.parse query, {:symbolize_names => true}
    end
    
    #abstract the trade to buy and sell
    def buy(pair, amount, rate=nil)
      rate ||= get_rate(pair)
      trade({:pair => pair, :type => "BUY", :rate => rate, :amount => amount})
    end
    
    def sell(pair, amount, rate=nil)
      rate ||= get_rate(pair)
      trade({:pair => pair, :type => "SELL", :rate => rate, :amount => amount})
    end
    
    def order_status(order_id)
      query = trade_request "getorder", [{:id => order_id}]
      info = JSON.parse query, {:symbolize_names => true}
    end
    
    def cancel_order(order_id)
      query = trade_request "cancelorder", [{:id => order_id}]
      info = JSON.parse query, {:symbolize_names => true}
    end
    
    def get_rate(pair)
      Public.new.ticker(pair).values_at(:last).flatten
    end
    
  end
end
     
