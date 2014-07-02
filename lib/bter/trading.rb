require_relative 'request.rb'

module Bter
  class Trade
    include Request
  
    attr_accessor :key, :secret
       
    def get_info    
      query = trade_request("getfunds")
      JSON.parse(query, {:symbolize_names => true})
    end
    
    def active_orders
      query = trade_request("orderlist")
      JSON.parse(query, {:symbolize_names => true})
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
      query = trade_request("getorder", [{:order_id => order_id}])
      JSON.parse(query, {:symbolize_names => true})
    end
    
    def cancel_order(order_id)
      query = trade_request("cancelorder", [{:order_id => order_id}])
      JSON.parse(query, {:symbolize_names => true})
    end

    def my_trades(pair)
      query = trade_request("mytrades", [{:pair => pair}])
      JSON.parse(query, {:symbolize_names => true})
    end
    
    #soon to be removed
    def logging(log)
      raise "Logger is no longer available , please remove it"
    end

    private
    def trade(*params)
      query = trade_request("placeorder", params)
      JSON.parse(query, {:symbolize_names => true})
    end

    def get_rate(pair)
      Public.new.ticker(pair).values_at(:last).flatten.first
    end
    
  end
end
     
