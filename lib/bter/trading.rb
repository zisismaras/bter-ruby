require_relative 'request.rb'

module Bter
  class Trade
    include Request
  
    attr_accessor :key, :secret
    
    METHODS = ['getfunds', 'orderlist', 'getorder', 'cancelorder', 'mytrades'] 

    METHODS.each do |method|
      define_method(method) do |param=nil|
        if param.to_i > 0
          trade_request(method, [{:order_id => param}])
        else
          trade_request(method, [{:pair => param}])
        end
      end  
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
   
    alias_method :get_info, :getfunds 
    alias_method :active_orders, :orderlist 
    alias_method :order_status, :getorder
    alias_method :cancel_order, :cancelorder
    alias_method :get_info, :getfunds 
    alias_method :my_trades, :mytrades    
    
    #soon to be removed
    def logging(log)
      raise "Logger is no longer available , please remove it"
    end

    private
    def trade(*params)
      query = trade_request("placeorder", params)
    end

    def get_rate(pair)
      Public.new.ticker(pair).values_at(:last).flatten.first
    end
    
  end
end
     
